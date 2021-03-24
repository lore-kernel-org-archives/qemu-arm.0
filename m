Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp808083lfg;
        Wed, 24 Mar 2021 16:01:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEEJfECA4vyWb4Zw6iiYK4+b0vYLTuCo5fCaU5F4Lsu1K6q39TnwVRj0sSSK69laITJoaw
X-Received: by 2002:a92:6b11:: with SMTP id g17mr4496029ilc.163.1616626887562;
        Wed, 24 Mar 2021 16:01:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616626887; cv=none;
        d=google.com; s=arc-20160816;
        b=JjRmEhSNSyi7vtoq3STJhmPF2z6nihpUiEck8FXcwWrz9ySntV5uxPDl74aOCTn52X
         0oxolUDqWUyfYO/h5E7720VU2bVQaxw+6hYx4LC+4FOPVtDzSG5uZ3JJ+X8lE21UYjRF
         yz4Ye06y7KyFCa15mLzAfwJS5RLy4SKWLtss0kkAHUK4vNGcNlXSORjxrlOtscFvxYp7
         U/j2u6ZmiKUYeRJFvDYvBWEYRRO4YCeFJXifdsT1Tqyo/yPqFd9F3Zt6ihar81e9Yur6
         9D0OwxbmNmKXDz+sJ6rjzH+VtQroznxldmrsJrxy0SFOAqeTJ3rOI13Z5qvpw+cxpI50
         3NTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=aZkajDY2fYYcX5GD759cA/pgMAuhlshEuXgpadmSWDQ=;
        b=tjDO4XY5u1L4V5lk4ylx8QGOoyVyTNrWSAPMq9ERcIUXVDioYKqQIje6Ng7cKfKeAV
         oAY2a2VZznxoJpze7/St1C4FrxiIIeKEpyIOC23n9CiI0TgZ88t1TH0w/Su2C3DeF32T
         VAWIpqV2bmY7l0VBouPU+qUdB7rFtVWzF+nIeRQJRI5M3PguQ4iM/SXqtoMhhjbAE/1Y
         v09waQbXtLjozFjN4hj2Z0Z7HcLKeTlrFYSBc6RgxDVq/r9L6lCSiWd5sRLGfLK8gW5f
         vWEKeDUKghA5Fe9Viq2IetKpN6l3u+RiCnIXN4EPp2DYsG4E/aujC3tPkqwZmWyRp5Zn
         X6yw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6si2534501ili.118.2021.03.24.16.01.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Mar 2021 16:01:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPCVC-0006Ft-RR
	for alex.bennee@linaro.org; Wed, 24 Mar 2021 19:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lPCS1-0003yV-37
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 18:58:09 -0400
Received: from 8.mo52.mail-out.ovh.net ([46.105.37.156]:53206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lPCRt-0002ts-3b
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 18:58:08 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.217])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id EC65F2554C8;
 Wed, 24 Mar 2021 23:57:56 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 24 Mar
 2021 23:57:56 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0067096d964-cf79-4a86-b768-5f9e788c1212,
 90EFDD1C85C6F754CEE6F6149A82CEA72524D6DA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 1/3] aspeed: Coding Style cleanups on do_hash_operation
To: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20210324223846.17407-1-klaus@linux.vnet.ibm.com>
 <20210324223846.17407-2-klaus@linux.vnet.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d3274402-58e2-c7ca-f808-7e2d51f29d89@kaod.org>
Date: Wed, 24 Mar 2021 23:57:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210324223846.17407-2-klaus@linux.vnet.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3acee9e8-b066-46ad-ac2c-3e81613bd8eb
X-Ovh-Tracer-Id: 14119910732509449007
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudegledgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeffgfekteduveejhfevhfejtdeltddtffeuveevjeeiveetvddtudegjefhtdegnecuffhomhgrihhnpehrvggrughthhgvughotghsrdhiohenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepkhhlrghusheslhhinhhugidrvhhnvghtrdhisghmrdgtohhm
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GMdKnnORFVKr

On 3/24/21 11:38 PM, Klaus Heinrich Kiwi wrote:
> Basically using camelCase for some variables...

I don't think CamelCase applies to variables, only types.

  https://qemu.readthedocs.io/en/latest/devel/style.html#variable-naming-conventions

C.

 
> 
> Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> ---
>  hw/misc/aspeed_hace.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 6e5b447a48..93313d2b80 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -86,24 +86,24 @@ static int hash_algo_lookup(uint32_t mask)
>  
>  static int do_hash_operation(AspeedHACEState *s, int algo)
>  {
> -    hwaddr src, len, dest;
> -    uint8_t *digest_buf = NULL;
> -    size_t digest_len = 0;
> -    char *src_buf;
> +    uint32_t src, len, dest;
> +    uint8_t *digestBuf = NULL;
> +    size_t digestLen = 0;
> +    char *srcBuf;
>      int rc;
>  
>      src = s->regs[R_HASH_SRC];
>      len = s->regs[R_HASH_SRC_LEN];
>      dest = s->regs[R_HASH_DEST];
>  
> -    src_buf = address_space_map(&s->dram_as, src, &len, false,
> -                                MEMTXATTRS_UNSPECIFIED);
> -    if (!src_buf) {
> +    srcBuf = address_space_map(&s->dram_as, src, (hwaddr *) &len,
> +                               false, MEMTXATTRS_UNSPECIFIED);
> +    if (!srcBuf) {
>          qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to map dram\n", __func__);
>          return -EACCES;
>      }
>  
> -    rc = qcrypto_hash_bytes(algo, src_buf, len, &digest_buf, &digest_len,
> +    rc = qcrypto_hash_bytes(algo, srcBuf, len, &digestBuf, &digestLen,
>                              &error_fatal);
>      if (rc < 0) {
>          qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto failed\n", __func__);
> @@ -111,14 +111,14 @@ static int do_hash_operation(AspeedHACEState *s, int algo)
>      }
>  
>      rc = address_space_write(&s->dram_as, dest, MEMTXATTRS_UNSPECIFIED,
> -                             digest_buf, digest_len);
> +                             digestBuf, digestLen);
>      if (rc) {
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "%s: address space write failed\n", __func__);
>      }
> -    g_free(digest_buf);
> +    g_free(digestBuf);
>  
> -    address_space_unmap(&s->dram_as, src_buf, len, false, len);
> +    address_space_unmap(&s->dram_as, srcBuf, len, false, len);
>  
>      /*
>       * Set status bits to indicate completion. Testing shows hardware sets
> 


Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp6708140ejb;
        Mon, 2 Jan 2023 05:37:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtq00/KO5KKpa/Z9OfKCaKVj+P7/KfL0rAMxcB1Xvkn8EtRTz3kEIxoufcZQ00A6r6PMax3
X-Received: by 2002:a0c:c390:0:b0:4c7:29a8:1ff9 with SMTP id o16-20020a0cc390000000b004c729a81ff9mr45849046qvi.30.1672666668944;
        Mon, 02 Jan 2023 05:37:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672666668; cv=none;
        d=google.com; s=arc-20160816;
        b=UWvNxDHBpry8h/YtCh/n0SIEVLEUbtwI44X9NFLSWFcyegmdRtHKrKrujdiA7P0C5E
         OMYJaqtoKa3US9dK7z9PjPoa4R8ZqTdlpeyVbnbRwdTMUHWoErvK9GQ4zxBKgW7AiJ0G
         ffEVWK5sSfjhje4Csb6Gd7KVuBEeY1Ctkxm2xHFKh1/2VCSQ3aGdzvP4IkxTrZEMOaIs
         KbPfeRCtfjCULsLFyoWFFdm0WaxuVLJ4eMlMAC+LwBZRmdLcTarJ3HdQbDLUS2YFaviK
         rzmW6s2HzX3szU3tXNk/s690f54SKDtENJPpgJ9zQaNTrP0YGLl4bi4ZNa2OLxiOHo4b
         wjbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=5iWFTl/EMUPln6l9IiFBt7O6j04qziBVwq3tjkyZuOk=;
        b=p7ZEH/BAGE5nSAGDRMyh19KCEghCN8HGs/slqrkDIrE2tsjeAeIB+gzA9fQWJ/6suv
         YJBtmKDe19jxdTYCaUZgt+1UVoIWMeN/Azbmy7QmYQL6mIuD4zF87NnUxyTCuSA2VZLI
         xbqY7GiopE/nvWiTAS/lF5LFQ2q4SEnXtJgc68TclbSpz9ZGmL/zHCeVkjuWFXM1Uf08
         xCEEaA/kO3gWGIilHmcr7d5HWQMHzcaGJ29FSE2SyfRcqb6pSk2+tlTxSYHvyqf4dHNg
         0veZMjEqNp+UrbP/WLyDd3VKzPWH5k37xMSitISAt576sCEVMEHeb4ibZms5Ya10Dq7W
         Od3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6-20020a05620a240600b006faf3549450si14835931qkn.493.2023.01.02.05.37.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Jan 2023 05:37:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCL0a-0000es-Oz; Mon, 02 Jan 2023 08:37:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCL0Z-0000cw-RK
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 08:37:43 -0500
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCL0X-00068y-7c
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 08:37:43 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.188])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 2A6D620875;
 Mon,  2 Jan 2023 13:37:37 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 2 Jan
 2023 14:37:36 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0042f8839be-0c79-4743-99ec-8b5746cca9d6,
 EB6D15DD045C308F841A27F8E66F545441276E15) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ab91bfcd-2f5e-9db5-db05-e100c2b95779@kaod.org>
Date: Mon, 2 Jan 2023 14:37:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 05/11] hw/misc/aspeed_hace: Do not crash if
 address_space_map() failed
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
CC: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>, Beraldo
 Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Peter Delevoryas
 <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>, Peter Delevoryas
 <pdel@meta.com>, <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>
References: <20221230113504.37032-1-philmd@linaro.org>
 <20221230113504.37032-6-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221230113504.37032-6-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 1230aa90-b36a-40c2-8726-f95a187fc3fa
X-Ovh-Tracer-Id: 16006074551864101764
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrjedvgdehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhjohgvlhesjhhmshdrihgurdgruhdpthhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomhdpsghlvggrlhesrhgvughhrghtrdgtohhmpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpfigrihhnvghrshhmsehrvgguhhgrthdrtghomhdprghnughrvgifsegrjhdrihgurdgruhdptghhihhnqdhtihhnghgpkhhuohesrghsphgvvgguthgvtghhrd
 gtohhmpdhpvghtvghrsehpjhgurdguvghvpdhsthgvvhgvnhgplhgvvgesrghsphgvvgguthgvtghhrdgtohhmpdhjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomhdpphguvghlsehfsgdrtghomhdpphguvghlsehmvghtrgdrtghomhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdptghrohhsrgesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.142,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dfqVzA5I2xNt

On 12/30/22 12:34, Philippe Mathieu-Daudé wrote:
> address_space_map() can fail:
> 
>    uart:~$ hash test
>    sha256_test
>    tv[0]:
>    Segmentation fault: 11
>    Thread 3 "qemu-system-arm" received signal SIGSEGV, Segmentation fault.
>    gen_acc_mode_iov (req_len=0x7ffff18b7778, id=<optimized out>, iov=0x7ffff18b7780, s=0x555556ce0bd0)
>        at ../hw/misc/aspeed_hace.c:171
>    171         if (has_padding(s, &iov[id], *req_len, &total_msg_len, &pad_offset)) {
>    (gdb) bt
>    #0  gen_acc_mode_iov (req_len=0x7ffff18b7778, id=<optimized out>, iov=0x7ffff18b7780, s=0x555556ce0bd0)
>        at ../hw/misc/aspeed_hace.c:171
>    #1  do_hash_operation (s=s@entry=0x555556ce0bd0, algo=3, sg_mode=sg_mode@entry=true, acc_mode=acc_mode@entry=true)
>        at ../hw/misc/aspeed_hace.c:224
>    #2  0x00005555559bdbb8 in aspeed_hace_write (opaque=<optimized out>, addr=12, data=262488, size=<optimized out>)
>        at ../hw/misc/aspeed_hace.c:358
> 
> This change doesn't fix much, but at least the guest
> can't crash QEMU anymore. Instead it is still usable:
> 
>    uart:~$ hash test
>    sha256_test
>    tv[0]:hash_final error
>    sha384_test
>    tv[0]:hash_final error
>    sha512_test
>    tv[0]:hash_final error
>    [00:00:06.278,000] <err> hace_global: HACE poll timeout
>    [00:00:09.324,000] <err> hace_global: HACE poll timeout
>    [00:00:12.261,000] <err> hace_global: HACE poll timeout
>    uart:~$
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Peter Delevoryas <peter@pjd.dev>

This is a tough model. I am glad you are taking a look at it.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/misc/aspeed_hace.c | 21 +++++++++++++++------
>   1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index ac21be306c..12a761f1f5 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -193,6 +193,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
>       size_t digest_len = 0;
>       int niov = 0;
>       int i;
> +    void *haddr;
>   
>       if (sg_mode) {
>           uint32_t len = 0;
> @@ -217,9 +218,13 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
>               addr &= SG_LIST_ADDR_MASK;
>   
>               plen = len & SG_LIST_LEN_MASK;
> -            iov[i].iov_base = address_space_map(&s->dram_as, addr, &plen, false,
> -                                                MEMTXATTRS_UNSPECIFIED);
> -
> +            haddr = address_space_map(&s->dram_as, addr, &plen, false,
> +                                      MEMTXATTRS_UNSPECIFIED);
> +            if (haddr == NULL) {
> +                qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto failed\n", __func__);
> +                return;
> +            }
> +            iov[i].iov_base = haddr;
>               if (acc_mode) {
>                   niov = gen_acc_mode_iov(s, iov, i, &plen);
>   
> @@ -230,10 +235,14 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
>       } else {
>           hwaddr len = s->regs[R_HASH_SRC_LEN];
>   
> +        haddr = address_space_map(&s->dram_as, s->regs[R_HASH_SRC],
> +                                  &len, false, MEMTXATTRS_UNSPECIFIED);
> +        if (haddr == NULL) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto failed\n", __func__);
> +            return;
> +        }
> +        iov[0].iov_base = haddr;
>           iov[0].iov_len = len;
> -        iov[0].iov_base = address_space_map(&s->dram_as, s->regs[R_HASH_SRC],
> -                                            &len, false,
> -                                            MEMTXATTRS_UNSPECIFIED);
>           i = 1;
>   
>           if (s->iov_count) {


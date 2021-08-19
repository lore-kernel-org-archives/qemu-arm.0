Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp385778lfg;
        Thu, 19 Aug 2021 07:34:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdELdOjqVkOfY08JcZB4/0HQIN5TPTNWJCSddHIb/oWAWXKr58S12oqW1OnVORkYViBQtZ
X-Received: by 2002:a1c:1f17:: with SMTP id f23mr14420601wmf.136.1629383687504;
        Thu, 19 Aug 2021 07:34:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629383687; cv=none;
        d=google.com; s=arc-20160816;
        b=MBlO6iCKKd2sJLDrvW9An8NLLAXSW8IZ2nGiRMHl34Zym77NvYXzqNy3jAf/E4GTZp
         0C4uYa2c2w2pBUnNW8SWhDTI1qYkZp8eKjB+DO+J803+wVdlVh0K1kI5dKDdbRxnBYVJ
         sFDCnavGbIhopHHt/R/j+rvRwsbJJuspp9MPVtmHbR/N6PXaOhhMMXsbBK9Jujma8QhJ
         CeXi/3qyw/r+mUSzxU2EC2Vg8k/yslyRy3/pZaKwFvWfKD26ArXKARC9fbPVhS2d3Jrl
         f8QeicPHxiS5FCG2Ndks4646wqy0Fu36qYon9kxSujdb4UzWxcypYH7Dl4DJQTS6jPX7
         Zflw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=BUEoZZUTAcQRso3srFrxXAKy9US0RWLQslns+6w6nvw=;
        b=Z+47yYN92HikvHmx0Tu0EjGPVH8+7/jukxKBGd3y5h++GfUPrbqbiRRWQY6fOEgzJC
         3w55WevT/sutmYG8NCEYT2GXqnmuVN03mpvImjmUmlGADB07mmr6nQoJWWb0BScE8gK8
         /D2gfnoIiZjqpbumBQQX8XDRxVyDYbUXW76vIbCY4ZX3Wso0U9NtPj6Q/cHoeFCTYt+F
         QP7/IzBv0VPEl5h9G28kvb3KHxQU4Lh6I8U8wxxuwIREVKDWOmh9NOhKXD3sfLJPkp0A
         JWce6iyotg9ABT5W0mc6LOyBYatwDXDoyIBoQ/gSP0fLroqM6E8Kmf1JBG9vTvowLYT/
         9KfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SzpovNY6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k24si9283363wmj.53.2021.08.19.07.34.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 07:34:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SzpovNY6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGj82-00049a-J4
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 10:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGj5z-0002cb-HB
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:32:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGj5v-0007ik-It
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:32:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629383554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BUEoZZUTAcQRso3srFrxXAKy9US0RWLQslns+6w6nvw=;
 b=SzpovNY6CsAeeb2/svDktO/tDgPpbth7dVrER2J0UB2UbMFpvkOPJxou8R764uFAGtUhPR
 UmiIXhO//V9b/YP945mtfG9pht/vcwsLaKha9ppUX+ZylqLx+urpSTbqdUdSs/BU+uPmfv
 LtU7C7PkVu4J+U0WdyvqipUR4AdE0RY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-JXjiMhXUPye-37yv4Fj3kw-1; Thu, 19 Aug 2021 10:32:33 -0400
X-MC-Unique: JXjiMhXUPye-37yv4Fj3kw-1
Received: by mail-wr1-f72.google.com with SMTP id
 f25-20020a5d58f9000000b00157197bd8efso435136wrd.13
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 07:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BUEoZZUTAcQRso3srFrxXAKy9US0RWLQslns+6w6nvw=;
 b=tNKWCfwa8yiRQLFvC8yYv3v3WzVVFR8WsB8S3uCIFmyLmffpM6FWO3K798YBwGoOG7
 RAonefBW2OQIgFVjOxwG9XF9ayKyMEGIgmxrJjD8XeJqwHWO7GMWp/q9Ve3d2Jm0Y9sv
 sfBOMh/j6tgawq7pYEjHOwBAos3ilUbCreZOZ5WAS/m3sEr4Yg2o4fdGsrxWOgnoSUbZ
 eY6PQpIOmJSdlbz37YW5GS+UBjRze2LmeR73ejLzL/imKKbUM/pML0cXvWwUP8OpS8Ci
 tbIOoWhJbOLBriOcmG+JKthRbwkv2MNHwR38u1iS614eqPyLUvkPKD5U/31uS3oC/cgM
 d+gQ==
X-Gm-Message-State: AOAM530R8ZA8gapjB4YYAG8movU4zJEMNzBhhcX7lvqoW1vqkm4RYaC1
 F+hx17+UcMH0+oKo7j4P6iSCqzJqbXXnA9LWrkT7th7OUzjWhP7N4cZtuYfdCLAFNByETPh5MvY
 /TQzrWIL4jg3vfnk=
X-Received: by 2002:adf:df8e:: with SMTP id z14mr4572031wrl.244.1629383552270; 
 Thu, 19 Aug 2021 07:32:32 -0700 (PDT)
X-Received: by 2002:adf:df8e:: with SMTP id z14mr4572000wrl.244.1629383552075; 
 Thu, 19 Aug 2021 07:32:32 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id e25sm3659741wra.90.2021.08.19.07.32.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 07:32:31 -0700 (PDT)
Subject: Re: [PATCH 4/6] hw/dma: Replace alloc() + address_space_init() by
 address_space_create()
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210819142039.2825366-1-philmd@redhat.com>
 <20210819142039.2825366-5-philmd@redhat.com>
 <CAFEAcA_MrsapWF9K4_HW7FNGcT8PHUJRer7FH_fMU4yf1wz4tw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8fda9bc6-54ce-3a04-6c4c-b200ec699fa9@redhat.com>
Date: Thu, 19 Aug 2021 16:32:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_MrsapWF9K4_HW7FNGcT8PHUJRer7FH_fMU4yf1wz4tw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A8a9G79Iuj88

On 8/19/21 4:22 PM, Peter Maydell wrote:
> On Thu, 19 Aug 2021 at 15:21, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Replace g_malloc0() + address_space_init() by address_space_create().
>> Release the resource in DeviceUnrealize().
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/dma/xlnx-zdma.c    | 15 +++++++++------
>>  hw/dma/xlnx_csu_dma.c |  9 ++-------
>>  2 files changed, 11 insertions(+), 13 deletions(-)
>>
>> diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
>> index fa38a556341..9f6b3fa47c6 100644
>> --- a/hw/dma/xlnx-zdma.c
>> +++ b/hw/dma/xlnx-zdma.c
>> @@ -777,15 +777,17 @@ static void zdma_realize(DeviceState *dev, Error **errp)
>>          };
>>      }
>>
>> -    if (s->dma_mr) {
>> -        s->dma_as = g_malloc0(sizeof(AddressSpace));
>> -        address_space_init(s->dma_as, s->dma_mr, NULL);
>> -    } else {
>> -        s->dma_as = &address_space_memory;
>> -    }
>> +    s->dma_as = address_space_create(s->dma_mr ?: get_system_memory(), NULL);
>>      s->attr = MEMTXATTRS_UNSPECIFIED;
>>  }
> 
> Why are these devices doing a heap allocation rather than
> having an AddressSpace whatever field in their device struct ?

To easily use &address_space_memory if 'memory' link is NULL?


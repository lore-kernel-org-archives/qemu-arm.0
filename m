Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2427388njc;
        Mon, 24 Mar 2025 23:34:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgq54MJKCnw/pfTnZeEgk7HQWBHqkw0HRsSLGt91z7wgO89OelmIVn+xCDRn+9NsBwliElKYAqZPbR8Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHCJZaOx7dIt6rlrP24IrZVkYSOot9O4pk6Crc2BwpwnQf7H2nEvMPBVR7EEaetzQEnY2oq
X-Received: by 2002:a05:620a:40c4:b0:7c5:4b6a:d862 with SMTP id af79cd13be357-7c5ba1904a9mr1787019285a.33.1742884463903;
        Mon, 24 Mar 2025 23:34:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742884463; cv=none;
        d=google.com; s=arc-20240605;
        b=WzhEKqR5sYrKOg5vgmFaPfJ8AqQeLlgKFfhAbqdNxvww3e5LqkBqFlnnWXxvDDlAjX
         N+6EzNPRZbzqV1m17usFcKYqhvR+lyw0RSh+fNJA0bTTjDAk7etRmrwcNfD0rZaE72Jw
         2o1OTvQgkvEO/VX86MhLNra24w1hsD6jFBNOwF5EcZ6N3mIyg7ajI5v71dqmZ8L6phjm
         s4ISwaCfezGdD1HckqlyZXbL2i8iLluQos6zkOzfl1Pd0sCVzSEc7j7V1VI+kA8KgFtK
         0mdv2X98MkOkvK72PxE87uuMkccJWwIATKbRYIF3OtTh1HBLxuZ74ycUVQWukMuc2Brt
         ksVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=m8v+dd8VTemIkLQSz3J8vaQPP1L9zDxva3sohta3IzA=;
        fh=bxEUiJKYPin82vl/XWtGX9cGNM/GMdzwjbJFJrjrG2U=;
        b=JIX7xyMbB4nW2WU3D3tSE639oV2WGQNDl+0JVrd2KeSBhKazyJGbkOtvYpuhfrLq6O
         l0LTuzLND96IL9uPbDjIZuxnWjMRBu1QEmmyR/P+GkBfOxCsuvYcN5CDUlGWNJYOFypv
         gc2rmHXqJlYRvJ9gdKmgXRD+pjoyvEJVZb8dR74l1Z/Y35EhXpdHORS9ayR6oj/2CxXo
         GlUBLZuqApU14nSFizSh6GWLbeFhzrtpKdFWfhH552kwCcD4g6LXmxpRwnRFIqG8FLvf
         C0JA33bDCwcWcsu+A5xZbmGvwcdjBTMF5NFRs5LWBsq44IgGHTqEn1fIuRpIuZ5tQ4yK
         Vwvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U+ctiRP5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b92d0293si897059885a.185.2025.03.24.23.34.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Mar 2025 23:34:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U+ctiRP5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1twxrR-0008AE-Vv; Tue, 25 Mar 2025 02:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1twxrP-00089B-9m
 for qemu-arm@nongnu.org; Tue, 25 Mar 2025 02:34:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1twxrM-0008BO-Pt
 for qemu-arm@nongnu.org; Tue, 25 Mar 2025 02:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742884438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=m8v+dd8VTemIkLQSz3J8vaQPP1L9zDxva3sohta3IzA=;
 b=U+ctiRP5pWQFfnqXwwZQmtdwbQGjY8+TXmH+7yKfyTrvL2hOLy1VoKAsHTLVrFEJDfVHER
 SLCR+0w0GJ4HiMNDOsoDFPmGa65AaXXxWGuKVbRGMwEKH3iWicF6PQcox/vcbl6jjgN/kg
 GW+gJklhxxj4KMR/Cv8DtbjNHyGTcds=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-7_ZpRSXMPXKEe5MDG8PsQA-1; Tue, 25 Mar 2025 02:33:57 -0400
X-MC-Unique: 7_ZpRSXMPXKEe5MDG8PsQA-1
X-Mimecast-MFC-AGG-ID: 7_ZpRSXMPXKEe5MDG8PsQA_1742884436
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43cf172ffe1so42031005e9.3
 for <qemu-arm@nongnu.org>; Mon, 24 Mar 2025 23:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742884436; x=1743489236;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m8v+dd8VTemIkLQSz3J8vaQPP1L9zDxva3sohta3IzA=;
 b=DZJyMhD9uKAc6hzwIDtghNRIoV9muZ520QGBY4/1Umg1igT7iIB/I9nMp+oP1ihQtb
 0QBiXeQcWodwVvv+qH2psFpM2XkH2iEGazeOOIansjtLjs6Cx2G3gdZmXv3FsddXvgyT
 vDIUEfQxnwggUYtSMVGyfM70K6KCWVuKVthMvRY8hZQrv9FduyXDJ3GnYKSZT1ontHtD
 dS5/2JsBxyaLv52llEbEVcu68QGxm5hS/WTSbAbpo85XWjykHPUmOjR9CCoyRYkx2hoP
 fxjTkO47dYlvOSoYNxe3PrfezP6jGeSEvpzfajqtHgfJmO/9orVQn4aMR5AmJMaUJgv+
 gm2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnmY+/eKzQdgLFVePDJTHApSTDHaeRohUdK5da3C0Olh+PQnf8bMzpeTqXGDpZtDq09cN6wTgt9A==@nongnu.org
X-Gm-Message-State: AOJu0Yyyu4WGTThoHjFgdw9CPMukKh9DafNj285ZDUZ6GgdLTxV+nGbu
 GEHXMkjAJwXP4ugQhzN2HMmLgDt0xQNoAKrVu0EIrfHnxT+TvH0jzbF9fahaMWMzEo7I2c4W/Zl
 7a/s9U/zRgOU/xFGeSG+4b14Nuy287VG+1wKlva0VsU8Utc1YUg==
X-Gm-Gg: ASbGnctH/wJgLu3WK2/oftJLb4fgJjr/H/r9e5H93RjX+a0bQrl3WULP+xZjGZNDO9U
 sU+YbaZCc81ItugG6hrQncE+qImtcCofVo2ERnZCTdcSHwBWGCKCaSONHM0w1BYXhI8uxDclb1P
 rbqtJv3L3Pj4eFucs6X2uZs4sTlyI7R3OFyFU+OMt5COsoh1pPi6+nmKxSmRlGcaUHPQIPeG8e9
 p3a0e8pf+ImrZbjaT4CPfrKqpITIU9IYb5Ep5pWtLspAvXI9bPpr8naoNoo6/8Z0UmEiFi8UBPO
 Z2M+5qWj99Uoc6Pn6+FwvNLuuaeRKmma1LvQIDVnOKVHtk75QhIp6Q==
X-Received: by 2002:a05:600c:3502:b0:43c:f969:13c0 with SMTP id
 5b1f17b1804b1-43d50a4f8d5mr151174155e9.29.1742884435816; 
 Mon, 24 Mar 2025 23:33:55 -0700 (PDT)
X-Received: by 2002:a05:600c:3502:b0:43c:f969:13c0 with SMTP id
 5b1f17b1804b1-43d50a4f8d5mr151173885e9.29.1742884435377; 
 Mon, 24 Mar 2025 23:33:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:3f78:514a:4f03:fdc0?
 ([2a01:e0a:280:24f0:3f78:514a:4f03:fdc0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d440ed4b8sm190263245e9.35.2025.03.24.23.33.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 23:33:54 -0700 (PDT)
Message-ID: <1cc2dacb-76db-49ec-9dd0-18f0a9c98780@redhat.com>
Date: Tue, 25 Mar 2025 07:33:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 0/3] aspeed queue
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-stable <qemu-stable@nongnu.org>
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>
References: <20250323174541.406860-1-clg@redhat.com>
 <08930285-903b-4413-bd6e-20a14b2d15bb@tls.msk.ru>
 <2616d3e5-443c-477f-a024-317fadb76a59@redhat.com>
 <debb6c58-2a38-40d6-ac9c-b90c60ba8b69@tls.msk.ru>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <debb6c58-2a38-40d6-ac9c-b90c60ba8b69@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3xi_lFvwoLi9MTvN8dNIIGiPb5DL1FYvDY2g1pRHkv0_1742884436
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vg7giKSt6JJS

On 3/24/25 22:08, Michael Tokarev wrote:
> 24.03.2025 23:46, Cédric Le Goater wrote:
> 
>>> Is there anything in there worth to pick up for stable series?
>>
>> you are fast !
> 
> I was just about to send final announcements for a bunch of next
> stable releases, and noticed another pull request has been merged.. :)
> 
> 
>> - "aspeed: Fix maximum number of spi controller" is QEMU 10.0 material.
>> - "hw/intc/aspeed: Fix IRQ handler mask check" was merged in QEMU 9.1
>> - "hw/misc/aspeed_hace: Fix buffer overflow in has_padding function"
>>     was merged in QEMU 7.1
>>
>> The last 2 deserve to be backported IMO. They will need some massaging.
> 
> The "buffer overflow" fix seems to be okay for 9.2, 8.2 and 7.2.
> 
> The "IRQ handler mask check" seems to be this (for 9.2). Does it look sane?

It does.

Thanks,

C.




> Author: Steven Lee <steven_lee@aspeedtech.com>
> Date:   Thu Mar 20 17:25:43 2025 +0800
> 
>      hw/intc/aspeed: Fix IRQ handler mask check
> 
>      Updated the IRQ handler mask check to AND with select variable.
>      This ensures that the interrupt service routine is correctly triggered
>      for the interrupts within the same irq group.
> 
>      For example, both `eth0` and the debug UART are handled in `GICINT132`.
>      Without this fix, the debug console may hang if the `eth0` ISR is not
>      handled.
> 
>      Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
>      Change-Id: Ic3609eb72218dfd68be6057d78b8953b18828709
>      Reviewed-by: Cédric Le Goater <clg@redhat.com>
>      Fixes: d831c5fd8682 ("aspeed/intc: Add AST2700 support")
>      Link: https://lore.kernel.org/qemu-devel/20250320092543.4040672-2-steven_lee@aspeedtech.com
>      Signed-off-by: Cédric Le Goater <clg@redhat.com>
>      (cherry picked from commit 7b8cbe5162e69ad629c5326bf3c158b81857955d)
>      (Mjt: update for before v9.2.0-2466-g5824e8bf6beb
>       "hw/intc/aspeed: Introduce IRQ handler function to reduce code duplication")
>      Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> 
> diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
> index 126b711b94..495fd2bdfa 100644
> --- a/hw/intc/aspeed_intc.c
> +++ b/hw/intc/aspeed_intc.c
> @@ -92,7 +92,7 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
> 
>       trace_aspeed_intc_select(select);
> 
> -    if (s->mask[irq] || s->regs[status_addr]) {
> +    if ((s->mask[irq] & select) || (s->regs[status_addr] & select)) {
>           /*
>            * a. mask is not 0 means in ISR mode
>            * sources interrupt routine are executing.
> 


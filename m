Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp147385ejx;
        Tue, 21 Nov 2023 23:47:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOvuf54JUq2Edc54DI3WJUtL6mGpb9AMe1zzDw5GpH0RB9+R2bmeFP3OdTO9RaDTcFLMr0
X-Received: by 2002:a05:620a:31a8:b0:77d:4b3e:7cf7 with SMTP id bi40-20020a05620a31a800b0077d4b3e7cf7mr1482127qkb.63.1700639258480;
        Tue, 21 Nov 2023 23:47:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700639258; cv=none;
        d=google.com; s=arc-20160816;
        b=ZbTPOzNLRKXg9DyQfzsryGCgYak8DoVotRi67tTrkN33rUYZMyIoz98ihvnbt7u2B4
         Fmnor951e/HEm03dWMaCwmokRHNxgKVZwoW9p3qy9uQmHde3TAqWN3H4kYSR7XqphSFa
         g+C0tDeeDMcHNCGrbYAvt1ztEwCoH9UcGRwO7SIxjZD7r9H41dSChP2I2sn4qFazp511
         FL5K1tWgFzchJy5Nzqc5/5ucDIYibHo5HXJKC4p3Ccknb0ATFH6KVnfhDGUEFn34WqM9
         6jjKm9zZcrni1sODc5w2C/EKjLckTCS0Rar3hhT3w9b/LGbAPUITaFW4UR+DZQxS755t
         2rRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=YehAvXc4EQJyJQya1v7MbTAaXaMsR4wDVzXUCfk80rc=;
        fh=m9KqxWSkFwhl7fpeY4VuRQwnzN5L8VmvhRxyVcPS0A0=;
        b=NrzNC40QxmEs73bItY5ch2kdU+oP5Rpj+OYwlDJe3MmnzClNZnVVqmHhn8y5y3HE/M
         BqlJef7MJD0WyyI7dXIb0FH4jrt4Pre6pWnGw0/oh4yRgptRkNOPpIIYrOH1OCxkRvhf
         Y9TM8Q4ZAkzY4MrX+XhbCtzK/fQKg71kf4Ico1+ZyANZykdjGjNk0sf3V4j52MBUJeJu
         6Sc2h43QXGcM6KwmtwCNYj467Aeayf7nRHbcbhU+4uXDhfcg5ZSLR0UfFpRtrzk6jBf9
         cWRq3+Jaxq1ePpu8EmhiPoUKcoMqdRRu2Nk/KbKkDJCtykrepV3osoycEwzgJWsdv6ef
         wXNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fp28/7YN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i8-20020a05620a404800b00778b12a9c53si11597321qko.304.2023.11.21.23.47.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 23:47:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fp28/7YN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5hxD-0001th-F2; Wed, 22 Nov 2023 02:47:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5hxB-0001tB-O6
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 02:47:22 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5hx9-0004Ve-HU
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 02:47:21 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40859c466efso32193375e9.3
 for <qemu-arm@nongnu.org>; Tue, 21 Nov 2023 23:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700639237; x=1701244037; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=YehAvXc4EQJyJQya1v7MbTAaXaMsR4wDVzXUCfk80rc=;
 b=fp28/7YNzrmV2c+BI/QdmyBMGCc/WtsBadm1AXsCs3Da2z28cd+KyY90f511+wJFNa
 HmtJBBaaxLvmI65E/ZGdN9aEr5z074EhOOiieAMQAXUV3F5LgBbqXn+SAtmUDeU0Y9kI
 d/1MTdTF07WwdoICk+zA3k9kR7CgALKtD98SdPoSgxEYvhfn1/1SC3BMz7eatcyTGjpv
 zWNNGUVaEC0mpNC3ZdLRRKG3upfB0swZx1ABHCyy1yOxR49isRERzYS4daoku8kkP8hH
 6xR+ABwIA6PbUbjniPhelrmPzmGwxuW8UYjkaQlZi5U113GgCpYw9goagQ5jOKCC7cOi
 0YeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700639237; x=1701244037;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YehAvXc4EQJyJQya1v7MbTAaXaMsR4wDVzXUCfk80rc=;
 b=D/dd8OGnNyGMu+zMbDx+6tAu4+SnlRZaoY+mY3U9mQQBjRfztn5GhvHOsIQFGKXg/m
 4Fakw+qW/GpYCX9JEiHbxJYByqY5vlkRZJ8nTsu4XEwJwYQXGi2mK6T5HXpVcGDEj/mV
 SxRJ3kp2NjxuP1dScGiAASDPN4pMBtif2XGpNpYxwTiLiOlII4mlMX6Q/Gi8w0VO3gfi
 PgtNOzeORP7+mcraZL5K6hmJIBa9xYHql2Cw7jfxasqz3XC7LeA4t8txa1deMRJdBLPl
 c7gT4g1MheE5/7uvNjRYRcrV/oLI0MylJ0VeMDiIXpnEizEOgFFQslDA+aS1H6MFKZjX
 s6Ew==
X-Gm-Message-State: AOJu0Yw8fjAHiAgmSECIhi374PLfg0tCiHMK7vHXpvcNGIjDHkzvpnS9
 EWhR3FxuVzPjnLusNF/UIqPjmiqQBUVvSPLiSJRgYg==
X-Received: by 2002:a05:600c:3ca0:b0:406:c6de:2bea with SMTP id
 bg32-20020a05600c3ca000b00406c6de2beamr1175098wmb.17.1700639237203; 
 Tue, 21 Nov 2023 23:47:17 -0800 (PST)
Received: from meli.delivery (adsl-195.37.6.2.tellas.gr. [37.6.2.195])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a05600c474a00b0040b2c195523sm1268259wmo.31.2023.11.21.23.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 23:47:16 -0800 (PST)
Date: Wed, 22 Nov 2023 09:46:43 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-arm@nongnu.org,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 C=?UTF-8?B?w6k=?= dric Le Goater <clg@kaod.org>,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>
Bcc: 
Subject: Re: [PATCH-for-9.0 24/25] hw/nvram: Simplify
 memory_region_init_rom_device() calls
User-Agent: meli 0.8.2
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-25-philmd@linaro.org>
In-Reply-To: <20231120213301.24349-25-philmd@linaro.org>
Message-ID: <4ilmq.kfqrve6jtfy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: hzDd9J6VR6qR

On Mon, 20 Nov 2023 23:32, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>Mechanical change using the following coccinelle script:
>
>@@
>expression mr, owner, arg3, arg4, arg5, arg6, errp;
>@@
>-   memory_region_init_rom_device(mr, owner, arg3, arg4, arg5, arg6, &errp);
>    if (
>-       errp
>+       !memory_region_init_rom_device(mr, owner, arg3, arg4, arg5, arg6, &errp)
>    ) {
>        ...
>        return;
>    }
>
>and removing the local Error variable.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> hw/nvram/nrf51_nvm.c | 7 ++-----
> 1 file changed, 2 insertions(+), 5 deletions(-)
>
>diff --git a/hw/nvram/nrf51_nvm.c b/hw/nvram/nrf51_nvm.c
>index 7f1db8c423..7b25becd49 100644
>--- a/hw/nvram/nrf51_nvm.c
>+++ b/hw/nvram/nrf51_nvm.c
>@@ -336,12 +336,9 @@ static void nrf51_nvm_init(Object *obj)
> static void nrf51_nvm_realize(DeviceState *dev, Error **errp)
> {
>     NRF51NVMState *s = NRF51_NVM(dev);
>-    Error *err = NULL;
> 
>-    memory_region_init_rom_device(&s->flash, OBJECT(dev), &flash_ops, s,
>-        "nrf51_soc.flash", s->flash_size, &err);
>-    if (err) {
>-        error_propagate(errp, err);
>+    if (!memory_region_init_rom_device(&s->flash, OBJECT(dev), &flash_ops, s,
>+                                       "nrf51_soc.flash", s->flash_size, errp)) {
>         return;
>     }
> 
>-- 

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>



Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp556949njb;
        Fri, 31 Jan 2025 09:02:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUojsroasCVOMg/xpYPq9UITN5DIOZ/ZcGnMWtHa3nbqxUPtwfcBgwCo0SnfrWC1fdE8J7rjqml4Mjd/g==@linaro.org
X-Google-Smtp-Source: AGHT+IFFYpjkEgx/H2C1Oq/1DuATbuOCaeEolsd73r+RJcsSfFTOUXLqA9iqIj3mGtPYcfegMyK8
X-Received: by 2002:ac8:7f12:0:b0:467:5016:57fa with SMTP id d75a77b69052e-46fd0b90fe8mr187334121cf.44.1738342946134;
        Fri, 31 Jan 2025 09:02:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738342946; cv=none;
        d=google.com; s=arc-20240605;
        b=GiJayMwWsyLxuRNRMmaeqkR45iQKXJt9BEJGVCALJim+iasxNCE7YmVD9wq5N9ch0m
         ryzSs2TDkpTCEDnuyuW8zyqILuU/spo50huI5H02c+J7nduryj215WD4Q+DI/H5FF8p9
         xB90LHlgCDoGFg0oTlXShnHzwXzOEBdo2jb/zHV9svFe6p7yTk3b51LfbMIacKbmR0hu
         9WkftVeCMYDVjQTM3MgjiB5VGVlaH8gK6DGYZ5atwwj+/3vat/LbMnf9REu4znbH//xf
         t+dZyN/Jv1aerSRVNP963eh/BWma+I0BmVCAUm1GLYiE3UYlMOVxoUxidPWyFz9V1GCl
         Y/hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=lWSvsMYuQBKZpDDyRMNVEYMjFioDTfag2YV+tpjd9iE=;
        fh=O9gTYH5LgbivK4eTi/fe2vNjcdrxporwWQhhbIxtuV8=;
        b=ji61ViukfXUG7HzUDXOy7ClN0wvumEWH+8iceQVxvXq9SjT1IW8OM85n9flTFGjBLm
         Xvz91k0INNXN/dSBjvy3jxPfSXS0YeLZaMMJLUd7KcJjF3njGRo9lQBYXjZqDn5oJvQG
         RlvslxABoqO4VxJpPh/FaCkXUqb7k+yBT8M/ZcCraz14J0aSAvWkt8d/Fwrh+FFEb+2l
         v6dWfgMRXYDqygtbNAMfDnPxP0lnp4+3QiE0n5mPO2AwV443/P8r+w7ihnXVjYSnEPFA
         Svz9ojlL0cStp7bwz96J9CdCYjupIpHSZ5sDF2ZPjyksqISwYAVjHwys9q6AT/t+Rn9Z
         kYgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jbu2u4Fn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1b9fb1si43837441cf.216.2025.01.31.09.02.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2025 09:02:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jbu2u4Fn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tduOp-0002Nf-Fa; Fri, 31 Jan 2025 12:01:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tduOn-0002I8-N4
 for qemu-arm@nongnu.org; Fri, 31 Jan 2025 12:01:45 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tduOl-0003UC-U0
 for qemu-arm@nongnu.org; Fri, 31 Jan 2025 12:01:45 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-38a88ba968aso2049389f8f.3
 for <qemu-arm@nongnu.org>; Fri, 31 Jan 2025 09:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738342902; x=1738947702; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lWSvsMYuQBKZpDDyRMNVEYMjFioDTfag2YV+tpjd9iE=;
 b=jbu2u4Fn0pV8VAJOgr5E3NfyrbN0cDBNzbzMRmxM8HsNaTz8kKKwzCPAaSVCE3hIdw
 oCrf5oTO5lrSBLJSDAehSJmmTDh087ywBlM0bnaccclC1oitJGoehVnJC7oWj4mnRSpW
 fMsRTq4Lk/rWVtCiZYAy9x1II6uBtgIYLy3lg77qkK01TTlnaCzvFnjBZiD+pdZkntVj
 vZ/jNk7FXLMLStCMJp0Mh8MfG5tQndCv6V8Qm1mEhyK2iI4cOD6Lei1YC0n5hG9ro1/9
 z48w078LO1BA9LfK/GkEOCfy9RJhr2B+8jhHX41efdhJCjzXO1c2jpzo6gJ7MGmnQGfr
 lYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738342902; x=1738947702;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lWSvsMYuQBKZpDDyRMNVEYMjFioDTfag2YV+tpjd9iE=;
 b=WcbgAo+sK/4D/YKu6lbk7Svpq5r2vEJ0eX7KICLDh5cfCfSqYJrIgBIRDx82BTXMph
 wRBdixDVgSwM2x3uuv1casQUrH6qRGb+o0O57kFMeZAkoHqlavOn6IKVhvdX7YhTM2q3
 Tg4RDxxu7jcHnkd6Ee+yajDgW00+9CKhQjRkjGWc5pHLIe9PHX3skHvXGDPGnfOexkGU
 Rurwe9x48D1WqYCn+wJX+JLrvlVDngksOa4PWRMfyhkK1aUHsM91dHfyIcW3pEj5Es+J
 xtTchmgwKHb09FRUnPTxJrY3TIGye7L9JAXgmRKC5S2p6VpmFfXexKV0Mxr8Va2Lduvv
 HCsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVC8hchH8Bh4+UbL7O9AxsXxv6uXz7tYLB1RrLwC3cukX2RY6SA7qlT9AsMRAtt87FzkJw9MbFV1A==@nongnu.org
X-Gm-Message-State: AOJu0Yz1zEEqBECCHtBcpoNYSNSAwxeX+6zcstap7rO9PXZScfxljuZ6
 wupgdpoULAGEDS10HTZp4qW/VRDYNw2OAYERh5rXKJm5vBP95DcbL+JAdzJUcR8=
X-Gm-Gg: ASbGncsI785GmlwUU9iC5fEHzwRxFzQCQd4VnH3DKny3FW+ITBumfVE8Pg2L6N9juQv
 O7zMxRjWezkY8D8t0+cldfhjG0kj3rS/m68jJJbWA0vJrs41O6HRRATez9TR3Grx4GaFPzQh79Z
 v3hRuRG1wnxM6XRVYUoy/cX59E5UFyaOrT872YMsrfH1JZFPJfX2oLWkf7GicO3DC3SEbIkl+/I
 PcK1VwL4sqABty3p6kD4MefsGXMgYeYqMsAFdAeSe0kXGoiWqi5t5fDxfVUuVG1H5vUKA397mNs
 fTKYLj8OmtiKkTprVBoERX/VhDEaWkd664o4TclGv9MvDT+bYmbr6jrCcvs=
X-Received: by 2002:a5d:64ae:0:b0:38c:5bc1:1f03 with SMTP id
 ffacd0b85a97d-38c5bc12134mr7269906f8f.7.1738342900563; 
 Fri, 31 Jan 2025 09:01:40 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23de35csm60496715e9.10.2025.01.31.09.01.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2025 09:01:39 -0800 (PST)
Message-ID: <cca5ed6b-1066-46c4-9640-0db8e1cc4b63@linaro.org>
Date: Fri, 31 Jan 2025 18:01:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] hw/sd: QOMify omap-mmc, remove legacy APIs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
References: <20250128104519.3981448-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250128104519.3981448-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: GX0bGvAau4+F

On 28/1/25 11:45, Peter Maydell wrote:
> This series QOMifies the omap-mmc device. The main reason for
> this is that this device is now the only remaining in-tree
> user of the legacy SD APIs defined in sdcard_legacy.h.
> The first 8 patches QOMify the device and do some minor
> cleanup on it. Patches 9 to 11 then remove the unused
> legacy APIs, deleting sdcard_legacy.h entirely. This includes
> letting us get rid of the me_no_qdev_me_kill_mammoth_with_rocks
> codepaths in sd.c.

Thanks for this long due cleanup!

Series queued squashing:

-- >8 --
diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index d31456ad236..bbe7b971bbe 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -71,3 +71,2 @@ typedef struct OMAPMMCState {
      int cdet_enable;
-    int cdet_state;
      qemu_irq cdet;
@@ -611,9 +610,4 @@ static void omap_mmc_initfn(Object *obj)
      qdev_init_gpio_out_named(DEVICE(obj), &s->dma_rx_gpio, "dma-rx", 1);
-}

-static void omap_mmc_realize(DeviceState *dev, Error **errp)
-{
-    OMAPMMCState *s = OMAP_MMC(dev);
-
-    qbus_init(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS, dev, "sd-bus");
+    qbus_init(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS, DEVICE(obj), 
"sd-bus");
  }
@@ -622,3 +616,2 @@ static void omap_mmc_class_init(ObjectClass *oc, 
void *data)
  {
-    DeviceClass *dc = DEVICE_CLASS(oc);
      ResettableClass *rc = RESETTABLE_CLASS(oc);
@@ -626,3 +619,2 @@ static void omap_mmc_class_init(ObjectClass *oc, 
void *data)
      rc->phases.hold = omap_mmc_reset_hold;
-    dc->realize = omap_mmc_realize;
  }
---

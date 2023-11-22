Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp149138ejx;
        Tue, 21 Nov 2023 23:52:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOXwsnDV6apEGdz6goiaGwP1sSM6jeYoXRhFbNpUK4UCH8Bamhm8y6YuIXMThPlZQwjvxc
X-Received: by 2002:a05:622a:1449:b0:410:89e7:ef0b with SMTP id v9-20020a05622a144900b0041089e7ef0bmr1952089qtx.14.1700639559741;
        Tue, 21 Nov 2023 23:52:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700639559; cv=none;
        d=google.com; s=arc-20160816;
        b=LZnyj5MS7SG76yeRup1WGMsJqVGJJyYadHW1QNltC1SFoC1y/vcwhYK8K0UT1EVMVw
         Bz5UJ9zyOvkVvCgnyUkulWAi11enSIMur9mCoQHpb5fxYdvAJcra/912XgqBVPmC26p/
         kANEQq9gCzIb43dvSdkwq2zJisECwFqyesKlQWp8Bvu6/hVrscukma45UyCibcwbLxz0
         cZ7Qqu6XPNpUlfQ1Bdlt0Mw1WFfUeBYbhNRfS6RK1fTGiax5i9sgVtL7qzzwR6y7+8RS
         h36fcOdDJEJPdL7n0XrDLKJURaz6dgKiIlmxLCAjJW+sOngotZrxMASSfvFWUDqZwn6E
         /07g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=fAUTxtWFf3B4YwcwwB50ijwvVY8c/JE3rBaEGwFmi5s=;
        fh=20FmOwy0P1pPxf89SFFGAoEZKS2S184Owy/Gdmxa9D8=;
        b=zOBqFkqMFr9ei75AELgSin4YQEQcg9yURUWZax8jgiy+Qme2fB05OwlYYtyc85ZbKf
         oEbL5UK8BNKT7OLHWx9D7r42N1A6tu+UoDXktnisWKaSmMrdusYyAJhqH5Kl7hI615JE
         8Se1SD8sQnOpYQMDuqZgcPyVUEV8U4a/TrHCxQIAmXARKQx4+iVzpOM4pOecXeyeJUyI
         Rq+hLNPjTyLwBkCqOc6/j3JqJyEQxB6BZKIKTsXFWZyESGhoAEESNlrjf2Fmf4Q+rPPY
         hORXnietplgr1gq8C2iRqxxJSN7+w4sCJRYuYZPQy62bI18EEM/9JKQC7wefN4Jq/8jc
         96hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xnb8YE86;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jd22-20020a05622a719600b004236f71932asi2812672qtb.117.2023.11.21.23.52.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 23:52:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xnb8YE86;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5i1x-0003i8-By; Wed, 22 Nov 2023 02:52:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5i1v-0003hr-9O
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 02:52:15 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5i1s-0005Vg-O0
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 02:52:14 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32f7c44f6a7so4281496f8f.1
 for <qemu-arm@nongnu.org>; Tue, 21 Nov 2023 23:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700639530; x=1701244330; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=fAUTxtWFf3B4YwcwwB50ijwvVY8c/JE3rBaEGwFmi5s=;
 b=Xnb8YE86RkpsW3L4evyZJ0315pr160+in0ktKpTOdIqUk/MYPIlAKbpZ63U23pwtSj
 5Z481FAJ93Ih9aLxgcDg6agB6ZOZEIf1JJzeF9aWlAravw386YXihEtHkqAicNacF7Jg
 cQprXgbkn6JPtMggnOascJxqiVMGwR7EIa85DkkApOSA1DNFzGhZVwmuZCSuIJxiNPYn
 BHqfEZ5rhsy3l8AhD+UpYzLrQhL6EiKVwyyRwq8PPFG6XcfNhPKr8IGYsAcY38VpgxNI
 uraOg4TfJnElalYKtFsE20GbcOTj5z6tD0uBrZyBKUtKpQpmuQZhsXZnWtlRACvgXyWc
 gNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700639530; x=1701244330;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fAUTxtWFf3B4YwcwwB50ijwvVY8c/JE3rBaEGwFmi5s=;
 b=SwxBqQ6UGxhUOkVYLugdw4Y01mHAyb/sd1s2SgwQBS7Yv3laNgD1S07ELACrA/sJKK
 FTEEoaHZLvWLHNstxG8p8PQ/VtToy7Tc/98HwxCLzHHIgDuGKGIOXdrFn5j3I6K2IMpw
 SHEfD/wWVL7Bk9uBZk7T9Ra4cUg2eO5MGYBJXW+nwU6167E6LT4SloAtPrH+AbgSj9GE
 sZbfeB8UReqrqVvYkFoajeXtCf5CuU20Z52SV9ruG/gndiw2hTUyz4e/99Gd4D6q3phN
 dn5n75/ul3fp8cRNqVNSL8+5yVQSXgUQoL6ZlJ/DDXRZNREwCBWuX0zHHLQ15QjIq6yo
 ajfw==
X-Gm-Message-State: AOJu0Yyx0vUxf8c9wJfBrfezBj/0jHMe0pb/ETc73BRkGWgIgtrZbzOG
 Qz2TA05N/WErIxj9w8OmsUvnNsLlr+iVbtAn9eJ+3A==
X-Received: by 2002:a5d:444f:0:b0:331:6dfc:939c with SMTP id
 x15-20020a5d444f000000b003316dfc939cmr889004wrr.29.1700639530019; 
 Tue, 21 Nov 2023 23:52:10 -0800 (PST)
Received: from meli.delivery (adsl-195.37.6.2.tellas.gr. [37.6.2.195])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a5d4745000000b0031ad5fb5a0fsm16439368wrs.58.2023.11.21.23.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 23:52:09 -0800 (PST)
Date: Wed, 22 Nov 2023 09:46:28 +0200
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
 Peter Xu <peterx@redhat.com>,
 Herv=?UTF-8?B?w6kg?=Poussineau <hpoussin@reactos.org>
Bcc: 
Subject: Re: [PATCH-for-9.0 25/25] hw/pci-host/raven: Propagate error in
 raven_realize()
User-Agent: meli 0.8.2
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-26-philmd@linaro.org>
In-Reply-To: <20231120213301.24349-26-philmd@linaro.org>
Message-ID: <4iluv.uh21dliq5uv@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: IeYNxh2hzJuX

On Mon, 20 Nov 2023 23:32, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>When an Error** reference is available, it is better to
>propagate local errors, rather then using generic ones,
>which might terminate the whole QEMU process.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> hw/pci-host/raven.c | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
>
>diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
>index 86c3a49087..e34ce47874 100644
>--- a/hw/pci-host/raven.c
>+++ b/hw/pci-host/raven.c
>@@ -345,8 +345,10 @@ static void raven_realize(PCIDevice *d, Error **errp)
>     d->config[PCI_LATENCY_TIMER] = 0x10;
>     d->config[PCI_CAPABILITY_LIST] = 0x00;
> 
>-    memory_region_init_rom_nomigrate(&s->bios, OBJECT(s), "bios", BIOS_SIZE,
>-                                     &error_fatal);
>+    if (!memory_region_init_rom_nomigrate(&s->bios, OBJECT(s), "bios",
>+                                          BIOS_SIZE, errp)) {
>+        return;
>+    }
>     memory_region_add_subregion(get_system_memory(), (uint32_t)(-BIOS_SIZE),
>                                 &s->bios);
>     if (s->bios_name) {
>-- 
>2.41.0

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>



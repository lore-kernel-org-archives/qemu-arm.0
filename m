Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1914629ejb;
        Tue, 6 Feb 2024 08:30:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsBzn9MFLyMqdPh5u4MrFSrNXqVrRVE5kjnJTXZw51CMzQ9geKOgvBaVRQazyPK9obRzpr
X-Received: by 2002:ad4:5aa5:0:b0:686:ab05:59fb with SMTP id u5-20020ad45aa5000000b00686ab0559fbmr3759012qvg.8.1707237006163;
        Tue, 06 Feb 2024 08:30:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707237006; cv=none;
        d=google.com; s=arc-20160816;
        b=YOjt6INcIDwgKCuThUN70Pv0R8zDKY0Zx2vGUvYWYsdAzzKw20HzEUvITXOQAn0CA4
         v61tOmBHfTTLDm7WBr8PRT2Cal4zJhP7QRIRQRu0jLvJHX1IktEi5aweO8mPmk77OK1U
         7aN2/NMOShdK9jGT5CcsKHRAVtRYZBSGiEESOdUWt+oD7ZCyK0WmISERvAg/82jQFRlH
         HhzSTapCh7BLJEA/58mnek/LcVbqW8UYdaTfeCaqwlNqS/tbt9tJvKwD/gM9sNHsQEHZ
         CaWDnj8EMK7fWXWn82Vmc9vateFdJ89Jq4pibr1Yy4ZVDtiyrXjPiETht0sXFPca6L3U
         n+0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=dFe6+ysmgEERT2tHM6k/XOW/h52MxlnaZ0RJZc1hswo=;
        fh=Ngmi2qu06Jzhxv+TmWMed43vrnGi4z73xw0Mpf+YP8Y=;
        b=TJJfdB8lrxpR4WUXtyklBWJ28m4vkbKt135sU1n2nuD5h4/8dCuGs1soGHbKC20FSR
         Fuu9eWkcV2t1RQeLHbaJHBsxXMtole+hvOHjHAa6aJ7hQyVdW/d2vj9+uPmkQfLPZ24y
         tRqDRP3bOCJrUCzt9FispMe/klyV5oI3jEmicYonDrhPOTwGboMBsi60zi7CTvtjOJcr
         1BU3QC3ZNMQLfGJnodw29LArDN9B93TyBwbZ1jCemog9mU9XYkDALOkjVq+sq3qafwuH
         a7UeyCuOGCbmOlk5KJj+f4ljU/TMuMTgL3F8NbGRM4G16RM2LnOyNlrj95h7RO1L70gb
         5FqQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qnh7bkbg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCWsDFRz98JEDasHO+OeO3MfXzkoPNBQuPyedquc7cBiSkAdgJgXz986rCcSwzMOiQEn+3B55aGt5ROcdbmlOvGfB4J7t83K
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ep4-20020a05621418e400b0067f969c9f65si2553079qvb.33.2024.02.06.08.30.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 08:30:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qnh7bkbg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXOKE-0002Bk-Bg; Tue, 06 Feb 2024 11:29:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXOKD-0002BO-JZ
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 11:29:33 -0500
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXOKB-0001hr-Le
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 11:29:33 -0500
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d0a0873404so39220451fa.2
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 08:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707236969; x=1707841769; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dFe6+ysmgEERT2tHM6k/XOW/h52MxlnaZ0RJZc1hswo=;
 b=qnh7bkbgJ6jaaj8s6HK+uHpBF6U+vXlquXOOiLGrrAgGmR2oddLxE52HWrRBqYNmP5
 WcOcdPZ+/f+VA8Bm+9zIr4V+2MJZ2Zbaf4tq2qsj3az6QIHFXGGUWJ8XLxW9z5lVKpOP
 7vT7jaM5sKjMFdEJ9XgqazTzGjbEPQDLa75gwjZ75LokTKg9HZQmqbKiQCsC9ErlOBu0
 zzK0yl5PEM+JYsaIuZAdeKiWWc5jR66dkFVoEljbzXcf82HLm90SuWqKLYZbE/avzKl3
 bopLQgOgwkjrDHt6r5wuJVi2whHra7WMmlpvrfp9raFk2bVU4SWme1dWASOMNJcfr6yX
 yfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707236969; x=1707841769;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dFe6+ysmgEERT2tHM6k/XOW/h52MxlnaZ0RJZc1hswo=;
 b=SeG02jpOLWmGrLT4R3TxXnrTq8rZHK4ZS86DyUfo2chq74yAb0v8RAE6dlEUFKMZLc
 fAszQAFk+aEZ1hn3bonOjT8yKbA/eCK/HiJMXIDQOaTkY1rbKkOEgnrxH9b6vjqDprRf
 Js09TxPudD9cKuOcERzEepeGNzGE+m7zjZRX1hEcmHmEVr1C1VA79umqvKPBWMPYGbr0
 B2QElTQ399NKXNss7sa/dBG4XWgh1FUBGsmpXc9ogdesTIImcvHsZn7ibAM1QaXLkCWQ
 7fUEB0V2gffmhFOxRxet8k9+vN2bwDOJwpIrqT9xvlqZTJDAdL2U6tEnrk9EXAwWia4A
 K3gg==
X-Gm-Message-State: AOJu0YybJRCxZNsx7JMuoQxy2SiBCG45B8FkfczdC8i4z/2bpxHUbFA6
 XFxtuXJKRb8UDuhpYKPGCj+pkh9IcQ2PlgQL/wQezC1jC5OYJPGn//vhMGPcuztriDY2Eb2GT7R
 U+Se3ZjBn8LofMtn0WXaBaqHqJIF81Uo5K7axcA==
X-Received: by 2002:a2e:2e07:0:b0:2d0:aea9:d8d7 with SMTP id
 u7-20020a2e2e07000000b002d0aea9d8d7mr2374895lju.29.1707236968695; Tue, 06 Feb
 2024 08:29:28 -0800 (PST)
MIME-Version: 1.0
References: <20240131002800.989285-1-nabihestefan@google.com>
 <20240131002800.989285-4-nabihestefan@google.com>
In-Reply-To: <20240131002800.989285-4-nabihestefan@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Feb 2024 16:29:16 +0000
Message-ID: <CAFEAcA_gkQz7q+PhiqrVd+YrVJvLt1H=Ypp4av9qn+6mYC6jdA@mail.gmail.com>
Subject: Re: [PATCH v16 3/6] tests/qtest: Creating qtest for GMAC Module
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 kwliu@nuvoton.com, tomer.maimon@nuvoton.com, Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x235.google.com
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
X-TUID: JEUn5VQ9aIeT

On Wed, 31 Jan 2024 at 00:28, Nabih Estefan <nabihestefan@google.com> wrote:
>
> From: Nabih Estefan Diaz <nabihestefan@google.com>
>
>  - Created qtest to check initialization of registers in GMAC Module.
>  - Implemented test into Build File.
>
> Change-Id: I8b2fe152d3987a7eec4cf6a1d25ba92e75a5391d
> Signed-off-by: Nabih Estefan <nabihestefan@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  tests/qtest/meson.build      |   1 +
>  tests/qtest/npcm_gmac-test.c | 212 +++++++++++++++++++++++++++++++++++
>  2 files changed, 213 insertions(+)
>  create mode 100644 tests/qtest/npcm_gmac-test.c

I've just noticed some issues with this patch, though it is already
upstream:

> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 84a055a7d9..016cd77d20 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -230,6 +230,7 @@ qtests_aarch64 = \
>    (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
>    (config_all_accel.has_key('CONFIG_TCG') and                                            \
>     config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
> +  (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \

This adds all the qtests_npcm7xx to qtests_aarch64. We deliberately
don't do this, because those tests are tested under qtests_arm,
and we don't want to use the CI minutes repeating them all again
with the qtest-system-aarch64 binary.

>    ['arm-cpu-features',
>     'numa-test',
>     'boot-serial-test',

The patch is missing anything that adds npcm_gmac-test to
qtests_npcm7xx, so in fact nothing ever builds or runs this test.

If you fix that, then you run into:

> diff --git a/tests/qtest/npcm_gmac-test.c b/tests/qtest/npcm_gmac-test.c
> new file mode 100644
> index 0000000000..72c68874df
> --- /dev/null

> +/* Check that GMAC registers are reset to default value */
> +static void test_init(gconstpointer test_data)
> +{
> +    const TestData *td = test_data;
> +    const GMACModule *mod = td->module;
> +    QTestState *qts = qtest_init("-machine npcm845-evb");

This machine type doesn't exist. How is this test supposed to work?

I tried:
--- a/tests/qtest/npcm_gmac-test.c
+++ b/tests/qtest/npcm_gmac-test.c
@@ -24,7 +24,7 @@
 #define TYPE_NPCM_GMAC "npcm-gmac"

 /* Address of the PCS Module */
-#define PCS_BASE_ADDRESS 0xf0780000
+#define PCS_BASE_ADDRESS 0xf0802000
 #define NPCM_PCS_IND_AC_BA 0x1fe

 typedef struct GMACModule {
@@ -196,7 +196,7 @@ static void test_init(gconstpointer test_data)
 {
     const TestData *td = test_data;
     const GMACModule *mod = td->module;
-    QTestState *qts = qtest_init("-machine npcm845-evb");
+    QTestState *qts = qtest_init("-machine quanta-gsj");

 #define CHECK_REG32(regno, value) \
     do { \

and then it passes some of the tests, but fails on

ERROR:../../tests/qtest/npcm_gmac-test.c:262:test_init: assertion
failed (pcs_read(qts, mod, (NPCM_PCS_SR_CTL_ID1)) == (0x699e)):
(0x00000000 == 0x0000699e)

And the gmac_module_list[] array in the test claims
"Values extracted from hw/arm/npcm8xx.c", which is a file
that doesn't exist.

Basically this is a mess. Please can you submit a patch
that fixes this test so that:
 * it actually runs
 * it passes
 * it's testing the device in the machine that's in upstream
   QEMU, not some other device in a machine that's presumably
   in your downstream repo

thanks
-- PMM

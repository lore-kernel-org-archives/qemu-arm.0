Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp532957ejb;
        Mon, 18 Mar 2024 03:07:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWeK7Xui5twyEzoV+fhZK8HnBNGLnPVFb1S7L0mtiByTG/OqfO66q9l7rYxXgcpUIObSmBCvpvCrmY33HF+oXHFBPFTFg3f
X-Google-Smtp-Source: AGHT+IEFx2kIgXWwle+JlXmQD/O3adMFkpkUkjsiUf3Ve7a17H4d0CaY1PB60zqzcQNtu9H/ch25
X-Received: by 2002:a05:620a:228b:b0:789:fc79:b817 with SMTP id o11-20020a05620a228b00b00789fc79b817mr2941043qkh.74.1710756431575;
        Mon, 18 Mar 2024 03:07:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710756431; cv=none;
        d=google.com; s=arc-20160816;
        b=IOwunyHlTf4ClfPSOCZ+YfffEn9zeB2p3eWGu56+CBPUr0AudpvdjNuTvNctXxh1x0
         Hb3Ach8gCjI0oc+MbPplxaW9u18BtzOgonktYJtw4AXHiVRJYehsTSHFsTuOsx9Jz5mL
         DasSC1KvYrfzgiYB8Gv5rh5Fgd3ymbKp5Gqr3srtRQf96rPO5thBOQFU61jp0HY6Ap4L
         Ei8Hi2seLXKFd691Bll2YierKZg8vGt77I5HJ8F0dwJdSx9Ru6nXg2/lR6evlyjDuiP1
         d0B0TR8XczVJ/AutdiPYgQmnSWEWzeCfMSEXhF4Ew8RXWLLj3iYz9epq0gAbMZuprl4V
         hPEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SFthmmsYp+m5f9owLwx+hyTocTKSDvu4WqZSfWH+cu8=;
        fh=rEXox8eDXSt1DemBQ7TaKLOu9T1zR0CRR3Cc6UlU2Uc=;
        b=MCTBGXB5BkI7vUi8i1fWY1jgB00aR6MB3ivnwp0bAkqDOEIkwRoDe1WbeH872C2k2P
         4BMrBO6U+ciSVEqpPh/sEiPp88vg8OV03vL8RD4L2vxoaDfnXaE735cwTPY1nOTslPZ1
         0Cb8cTvb1FoYiQLrDJVjCqYa2fypBNycS3XqiZHqiqhVKib4UCO4UpXJUdT1ke3A6hR7
         RgGDd3MUJbc+lSMGpnrof30pojo0wQXV/Qw6Vp4VjQZdKOmBUxDgv+X9nmduSQkoQS6b
         +wtQ5uXiCzqClvTszKOIgUDFqObO7Ejbbi5/hyZUxt+W9c8Ctihl1/q7naeqyntH396F
         RX1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=inchz0ML;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oo20-20020a05620a531400b0078842405561si3345642qkn.734.2024.03.18.03.07.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 03:07:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=inchz0ML;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rm9sd-0001IM-RT; Mon, 18 Mar 2024 06:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rm9sZ-0001Fw-Af
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 06:06:04 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rm9sW-00061e-Le
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 06:06:02 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-34005b5927eso1018469f8f.1
 for <qemu-arm@nongnu.org>; Mon, 18 Mar 2024 03:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710756357; x=1711361157; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SFthmmsYp+m5f9owLwx+hyTocTKSDvu4WqZSfWH+cu8=;
 b=inchz0MLLvsW9u/sAZDtO3gU4sM0uXlgM1hAy1BlidQNUnUVqPG0rq67Izbx6Tv7+8
 0N5f3Rzq7GUgQrUrpVL2hzNClHWR18AqUOT+1uM4awnZr9crv8vAGpj6tXrkY7xmfbgI
 oWEJC8TrmfuYQn8sA4qbNpHiVjBMNsnfwzx9PwRDWPT1DJj+47Vk34F24jMMZpsO8mZY
 7yh1/rur6DNQ2EA2F3DK/2sioOBvc/jIA7Ql6BP9NNcP1FeeMcidGWcMnSuSf1zK4rFX
 gzkJeElyH4sPkfjt0PyB4khMg7ZfR6gCPFsXJSaCWzEUD3u6RALOqEC7wn7i/pD0bXxR
 DxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710756357; x=1711361157;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SFthmmsYp+m5f9owLwx+hyTocTKSDvu4WqZSfWH+cu8=;
 b=WJ8i0BPqVEXX8QNp2HBIcjGTUEa3oI/K8567sl6QIMEWjOajSHYpJYi1PckoIxSrmS
 qzfi3i0Fs0LWgfu2fi6AuBkJHsDaNj5Ip1aGPcrQFTatb2UCXPbbfxNYbgnjL88SY42a
 LrJmGQXVajzhpfq1FsviYA7/eLxFktl+nEsCEOPxNKR48lRFJ/ftSW/Gc7pQ07Bjev51
 KRGy755SpWmV/1sIs77jqZxkoZ6SWsCjC05fRchPQAdAWnfKvhY8SKH1QOojK71JLOQF
 aVhTgVuuLQxAUv/0aP0E2zheQwb9aYwf7vJ1LyFs//9AVPEP3epVeF9L8Bx+14+Tn3re
 i5FA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnKWCPQaDt/rrM3nj+4LPDtcb/p4ke2sdQ/Gvyc2heYaiGIOjmNf+hsiv0tXOxGVznvtA4gxKoL3REP6Ndq8LBDTMX
X-Gm-Message-State: AOJu0YzpnhsO52TEodAttDnmalECL6YIGKinO32LrMy7ryAvbVziHLm+
 kPuK1UT1my37kckoXIPwMQnue2eQnYcsk1DQ7m17AJfmskhjh+79mr9E/imnUoc=
X-Received: by 2002:a05:6000:ecd:b0:33e:be35:d449 with SMTP id
 ea13-20020a0560000ecd00b0033ebe35d449mr7811193wrb.44.1710756357044; 
 Mon, 18 Mar 2024 03:05:57 -0700 (PDT)
Received: from m1x-phil.lan (vit94-h02-176-184-29-165.dsl.sta.abo.bbox.fr.
 [176.184.29.165]) by smtp.gmail.com with ESMTPSA id
 r15-20020a5d694f000000b0033ec6a1b37esm9489265wrw.8.2024.03.18.03.05.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 18 Mar 2024 03:05:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.1 2/3] hw/display/pxa2xx_lcd: Set rotation angle using
 qemu_console_set_rotate
Date: Mon, 18 Mar 2024 11:05:41 +0100
Message-ID: <20240318100543.78846-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240318100543.78846-1-philmd@linaro.org>
References: <20240318100543.78846-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: aw2uXT+8rcR9

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/pxa2xx_lcd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
index a9d0d981a0..7d03fa57d0 100644
--- a/hw/display/pxa2xx_lcd.c
+++ b/hw/display/pxa2xx_lcd.c
@@ -1439,6 +1439,7 @@ PXA2xxLCDState *pxa2xx_lcdc_init(MemoryRegion *sysmem,
     memory_region_add_subregion(sysmem, base, &s->iomem);
 
     s->con = graphic_console_init(NULL, 0, &pxa2xx_ops, s);
+    qemu_console_set_rotate(s->con, graphic_rotate);
 
     vmstate_register(NULL, 0, &vmstate_pxa2xx_lcdc, s);
 
-- 
2.41.0


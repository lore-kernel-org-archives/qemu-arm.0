Received: by 2002:a17:906:2499:b0:a38:6d10:c5dd with SMTP id e25csp379142ejb;
        Tue, 13 Feb 2024 00:13:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVUNjFqBV0J4brOXEs7JFeIMBwg/TeAVOjc2t6dF/PNcTZjyYtB7GLxv/urSXy6krCvWeGaB356Vy2tN9blaB6tV8enjJLK
X-Google-Smtp-Source: AGHT+IFVvdDEYI8VOuoc7ZJVoQ6zI5Re4ZFbDzmLdo/1DSBHbFAg423hd9mSgFRD0QAR6CK8zLoN
X-Received: by 2002:a05:620a:458b:b0:786:d733:5a3f with SMTP id bp11-20020a05620a458b00b00786d7335a3fmr2994875qkb.42.1707812037136;
        Tue, 13 Feb 2024 00:13:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707812037; cv=none;
        d=google.com; s=arc-20160816;
        b=bsWp7qE6sm9SlAMK/vnKufwkh9HB5dZO5HKC20zzoyG3M23pyyj7A2n8GWUmLQuuAa
         p6Vo2WUWdDzECxYAKMIj61HHBevX6S1YqdpRX/1e8Q+gcC+Kn84YOVZmrs0S0jaLRot8
         cwqTCj7Cq1ehdNL8JFueesrf75457DLTBeaj1Oevy2nA9RG82M+fOveWR6v9qb/hYmoa
         I3Y+ePoK+v+jhfHCygkJ0xAgE/KczL4DxZajJ3FB0lIBoaEkjTFRPuhIBAzZjm3Ewt82
         lh8O8V3OPVJSGLzc/1HxTIxs6RYpOVTokd52Y1SdjB4OK59doIF3xmTJV6T/eChfQgBB
         2Abw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=o9Mll3b0jD3+V1gEhLcEmdspqDBWW+gx7Ndf0tUMfZI=;
        fh=1Hd1LsYhpxnaa60o2IyHUZ3aRWH7kr65Lfp5pCjEPSw=;
        b=wBNUMN/BXq4jyOF/sgoz99wfidF4JUg+ZJSFA1FRzVmzPtwkbeBTuUai/ujZZHppjb
         ZGoaoQt2GpMEp2YdlIu2doFzdsCJ5IP42amp/CBvHD19rQNbChMhNecbfMpwWDFB4plz
         Us7/r03YMSzpzKOdbylVFTNL3fIMYobSTXB92MSxrVAyUkZ4l95+dc9mK6UA0aZkmOql
         u1TvYBU/FXXS2VcDRpTxyWr5CbtAxCrlO2Incs39lbBE1ZMxLlm54OCNF01GgfCa2Kbh
         fFO5LG5FaKkIZk8Dm9nibbG3aknYR7EsMOwe4uKJfgEihOKvHHo8qSmhq4dwzXmVi+4E
         KI2g==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ODlbnsDD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCVgOxN5NGEbdoUjoo5akfXTEqADxf2li3Hbxecj2tGIBOCx5buBKotdsW44rRR7lDlqLVUZDeugAT8IIOY3c8eGnapQehxI
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s24-20020ae9f718000000b007871669a808si1959860qkg.551.2024.02.13.00.13.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 00:13:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ODlbnsDD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZnuc-0000wI-Hr; Tue, 13 Feb 2024 03:13:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZnuZ-0000ub-Tw
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 03:13:03 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZnuT-0000ux-T6
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 03:13:03 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-410c1ebf5e4so16504685e9.2
 for <qemu-arm@nongnu.org>; Tue, 13 Feb 2024 00:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707811976; x=1708416776; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o9Mll3b0jD3+V1gEhLcEmdspqDBWW+gx7Ndf0tUMfZI=;
 b=ODlbnsDDlVkFrkvHkY1s/g+SmSP+mcpGx4jycFSii2JeolMY9XEOHpRUAH+o7x064s
 3lmHjeL6snn149zESBGifQEsXvI/+FnpQNY2q6H0ulqeXm7MvYZRVcNvQ3/tlnmEyMz9
 PCSQb1wEBQH9nnT47RntBV6/x0vmSfkqK/fSg4BzuQskw3iSoQ25dFyFbNvuc69ETd5S
 ybe/OcKaaylqiGp1S0pFLRqjtTyblcp+CFoK5JlaQ5OMWysB0WmL61eZ/W6qrburGkB2
 uYvmA6ACb/7xUQX+VtlALRuVd7Kno5BUBl0BDPBND87lcBHwcAYv40yECQNhiLFT2Szq
 P9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707811976; x=1708416776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o9Mll3b0jD3+V1gEhLcEmdspqDBWW+gx7Ndf0tUMfZI=;
 b=QHgOzFO9bv6vYlC1ZuB/pGcAUs1CNGLSM5ThsCmm9Gr4L/MovffWW62fXmmn7e52tr
 oWyM0BTBQ2nhtg4UFBUspOrj9ymunhz42zQvz2LPZcNAHZ1lrW4KNrfgnSsx/d8yaJz3
 XPOKZmR2Vbst9RfkhBDdZssXj0zuGHzbg2+MvfHtRG5LC2mhaQUUMI6IPLTL/QAjIrlt
 t1NOQn++we84ZUFOPNNBv5hi5mxk5vw/ohMtryltBEwu3KN+jWw3OxGd3rRJjy2B903q
 CylE2awNjtG9pidjSRPMbLIfokY8hsTSygRPwa1d0TRGiKKOqEmqR2Gk8337VO3iE6LU
 3AAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2KJCfRn2ABGjGfN6GzYymXZse8TX9fsVBIzn39UtfAWOvLAugkVKFDh5dyiWZR1fXvNCkVHhsuEoHRko1kcZj9hu3
X-Gm-Message-State: AOJu0Yzrvyl7HJ8F8KtPyiE84DnPVEaztHI3deo8aCjFJ0l07oxCVas9
 tP6lvE+iW5GtNocDaRM65UJbufBkaysR9+8KvyEG67Et5bhzXfjQ23AGH0YZUqY=
X-Received: by 2002:a05:600c:5487:b0:410:cc53:a358 with SMTP id
 iv7-20020a05600c548700b00410cc53a358mr5102258wmb.16.1707811976001; 
 Tue, 13 Feb 2024 00:12:56 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXaF3ktzSm9VNZed+L5sZ6c4prONn+fJw8l4SkEvOb17m90mnfPe+5XmmsYDYWotcewD9rRFWM9+Pmu6eLkzU0kthbmP9mpXvR0+6s8pQHcjfBzs7G4mcNatOq6EH8rTS720Ej7dwRhn3/St9xHVHpvn7McPF9FhDuilFvSWsP7r+5HqXyZ+MUJMHAriJuJHyA97L5oyyBCXlPdm2WiR1/HVGiXPY8vseL4TPb+JWCeEmGH+OyHwRn3bIbDIeRnrk4njCOC59dDzukORHPyHC3G9w3BiRM=
Received: from m1x-phil.lan ([176.176.128.243])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a5d65c1000000b0033afb963d0dsm8828239wrw.101.2024.02.13.00.12.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Feb 2024 00:12:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 8/9] hw/ide/ahci: Remove SysbusAHCIState::num_ports field
Date: Tue, 13 Feb 2024 09:11:59 +0100
Message-ID: <20240213081201.78951-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240213081201.78951-1-philmd@linaro.org>
References: <20240213081201.78951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: ij6/Zp3fIAx1

No need to duplicate AHCIState::ports, directly access it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/ide/ahci.h | 1 -
 hw/ide/ahci.c         | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/hw/ide/ahci.h b/include/hw/ide/ahci.h
index 604d3a0994..c0b10c2bb4 100644
--- a/include/hw/ide/ahci.h
+++ b/include/hw/ide/ahci.h
@@ -63,7 +63,6 @@ struct SysbusAHCIState {
     /*< public >*/
 
     AHCIState ahci;
-    uint32_t num_ports;
 };
 
 #define TYPE_ALLWINNER_AHCI "allwinner-ahci"
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 33f7e83687..041cc87c11 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1862,12 +1862,11 @@ static void sysbus_ahci_realize(DeviceState *dev, Error **errp)
 {
     SysbusAHCIState *s = SYSBUS_AHCI(dev);
 
-    s->ahci.ports = s->num_ports;
     ahci_realize(&s->ahci, dev, &address_space_memory);
 }
 
 static Property sysbus_ahci_properties[] = {
-    DEFINE_PROP_UINT32("num-ports", SysbusAHCIState, num_ports, 1),
+    DEFINE_PROP_UINT32("num-ports", SysbusAHCIState, ahci.ports, 1),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.41.0


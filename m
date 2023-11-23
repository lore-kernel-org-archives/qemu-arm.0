Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp149864ejj;
        Wed, 22 Nov 2023 20:43:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiUTbRthylyJwguCdupUuEzaYkNxHxOPJleE8VhDNZJX9c2yz6H5BIvrjUVvuG0E4QOD38
X-Received: by 2002:a05:620a:4955:b0:77a:413:2d73 with SMTP id vz21-20020a05620a495500b0077a04132d73mr4638443qkn.2.1700714639164;
        Wed, 22 Nov 2023 20:43:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700714639; cv=none;
        d=google.com; s=arc-20160816;
        b=WeqeZeSnaFCmNF2HS28Z+uThfykAlxqU9onE37OtDOQ+5yDZW8xwCG05JbHp44c78x
         gJ2/OGNqtcUQNV79ey4VTN92aKZtVPFoahWBRVCTw6whx+IM7Ju5hNse887TEznKhbmm
         cW0aYqFLWTn97H5AxI1PxRQQlMvWUtBycJlMjFe4vN8IfC55hxunI4AwO2hnKCLhPdyC
         bePrUObMocNH5laLzaOqt8QtV9OVa40jBcHPX7NC9yqMjjiy03xb9iv7IVhbODz2tpnm
         F6PBS2bFf1VsMDOOdst28Wjychg5aoce8SvgH1+XJR85OKVAnegKN3n0x9Mm3Gff7lSO
         Dhsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XjKPY5uNF9R+Jnwg0amtOzmeSA/AKoApnoQmZc/PaUQ=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=fj6XWSedpth4/ZITKzS7aqq72obKiJq6GlzUFxYB+yfjQvcT06brU4ay6IooTB0NSJ
         GT/PjaFLnoLcbSmYhY4lKQlG+36usoI7tMgzBtQZi/OwzKDdmkSK+iaGKDSVbYayurvC
         XOrBX2ETnl/7MAUCogDiGVow+MLerVfryvqET8a7J3qh8WrMXXf+0GtjcINiCVBcne3F
         RGCRzWUjapJganm3iCT+gIQwtZ8vYRtH8+UfUYffGbOcM/3X5nf9lkVPI4gFm343tgOx
         +fwvY9MjgelNz1BLe0OPkTtgG1GAcKAPTFgBx7UlF5BKG5wcnpWslHhY34sYxhWN0Qbi
         nOHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UZqjOg3S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w17-20020a05620a425100b00773b543596dsi417285qko.423.2023.11.22.20.43.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Nov 2023 20:43:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UZqjOg3S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r61Xm-0006I0-JP; Wed, 22 Nov 2023 23:42:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Xl-0006Hg-DR
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 23:42:25 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Xj-00064Y-T1
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 23:42:25 -0500
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3b2ea7cca04so325172b6e.2
 for <qemu-arm@nongnu.org>; Wed, 22 Nov 2023 20:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700714542; x=1701319342; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XjKPY5uNF9R+Jnwg0amtOzmeSA/AKoApnoQmZc/PaUQ=;
 b=UZqjOg3SMbaqlEULftfSQsa7+fg4XVRksC+UsKrT62tGLHxzS6yznRc6dWKZkXdmPM
 BK0yfFPi+T7maOejHTmuECwwvR/v7uZbId5isTJNvpdqxNFSmQAuqgh/2UdP24w+BKGd
 16pw7GtDsaKkjLlYYu6nWbFdQYUw2Xw0OURae6wsRg2qS7kLedKn5LB875OfcfCeQHGD
 T9Mdfez9wRPUaihhg+Sz8xoPuLnwwS2L3PfBsfKYdYX6COhMpIemjrwzpf3MNv5X2lEb
 9gXFDyQUIypcbcshNmwVJA8SxgvcIEoPLn7dbP441l4Jd+WExG4lzzg5je/bbbRIQqJD
 Nk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700714542; x=1701319342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XjKPY5uNF9R+Jnwg0amtOzmeSA/AKoApnoQmZc/PaUQ=;
 b=rFwOKZOWVTql2Hir7R0Ur7V6B1D8ezJ6wA2e93CkXkY3K7h1WPV+LW7WcRfizgGMGI
 32ITrtkXmDaUoZo8l8yIRHR4LxOCrahM9eRHdNUYGfAoD1QcUNwy4YUsZ0SOldDKAnqS
 k9Y7ACde1t52KHWMbyUS1SSixhAjr3vjTnf+D+lbdb9HfmzjlkULh6nMFMsGljyv4eg2
 /LB4/TLAw3+UkYQTrbSTJcMlxkyt2JOWl1zu6Nqbn3xxossapdU9UWiHpWyiCA7BGSAA
 3DOB/EtAyFzbXyvlmjKHn3yKw12ChnpstvxysMhRCqtG1+SaEvpPtdp3kccJu8hGa/Eo
 DEZw==
X-Gm-Message-State: AOJu0YyeC6nFq4Gbo2dxjbpzZYaj/rqDIG9Ew7RxTntsrnVIhhynKRDr
 L2MaxMcTL10jh2/ZC6yJcKAElAPKU9WoigxSDem9J3wm
X-Received: by 2002:a05:6808:1911:b0:3a7:2390:3583 with SMTP id
 bf17-20020a056808191100b003a723903583mr6301855oib.38.1700714542378; 
 Wed, 22 Nov 2023 20:42:22 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 i7-20020a056808030700b003b8347de3c2sm73888oie.19.2023.11.22.20.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 20:42:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 01/21] accel/kvm: Make kvm_has_guest_debug static
Date: Wed, 22 Nov 2023 22:41:59 -0600
Message-Id: <20231123044219.896776-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123044219.896776-1-richard.henderson@linaro.org>
References: <20231123044219.896776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: Z+X8DUeIIe8u

This variable is not used or declared outside kvm-all.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/kvm/kvm-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index e39a810a4e..f138e7fefe 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -98,7 +98,7 @@ bool kvm_allowed;
 bool kvm_readonly_mem_allowed;
 bool kvm_vm_attributes_allowed;
 bool kvm_msi_use_devid;
-bool kvm_has_guest_debug;
+static bool kvm_has_guest_debug;
 static int kvm_sstep_flags;
 static bool kvm_immediate_exit;
 static hwaddr kvm_max_slot_size = ~0;
-- 
2.34.1


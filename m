Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp723347eji;
        Mon, 18 Dec 2023 03:35:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfGBkFtmXMpomNj7bVKslugHXN1I9mdaFYqAR7nuh/Qpy+e9kjtgVkb5LjiaNGlBKhAZAd
X-Received: by 2002:a05:6358:7f0d:b0:170:f134:9fd1 with SMTP id p13-20020a0563587f0d00b00170f1349fd1mr9801948rwn.47.1702899331917;
        Mon, 18 Dec 2023 03:35:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702899331; cv=none;
        d=google.com; s=arc-20160816;
        b=KxoIILjijj3a0Q3wIp2SY0oiNr10Had2J73KtW97XczNLhSYYDUGXBbx890y5416hR
         dbK8rHAB0p8avHRTAtZc8q7OkkJTvR+ABunksfpl/MCAxfvpAXca1stHvqAaYblRuk9g
         uzFKZNXgn8xzkankWANtKe0Rkn9SRRX8jI6nxozhJyn8ULgz1fp60oOEQ83Iyn1bDCOl
         UeACVNKuWXoPyGuLqWJsnpT2bhGFaBCyFC93YlbJdemuzo7LYQgAoTat0bs60bQH8SZG
         H9dZG7sNj9uYF5YNDXg+Go8B9gDV1BGWqqYX8/0HQNdPGFvnaLv9bwyDFQ0xq3MhZRqz
         Rexw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=V/3KTHhaXn8gw7Kymod6Pbk9EKXu1H7ND5ieOsslvsk=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=RBPjLlUHQMcAk4fYyJIpZFhfU0JeVvDuHNdeipvgvjdndp4egZGYjTAlKyWJnwSdnb
         jVzkyDPA/HI5LaKmWtGSq/S8b5G9yp9c6GuTG2ay4JPh/khGMMtnjtXrHi0R/1sOHctM
         AAYRPXKSjEa0IhxTmMcOprbNYa8I3kn+H53kJhMwxraVL//wF4oOq0qfMyZLSx+O1HbY
         OyDtLD1ia4zWWLaDR4/QA1SCNs5ir1YZBJEU1SaJCG0v4ou9P3LhqXXGGbVSVoLwXlOA
         CXsXbAOHtJ95mJcVh+yTu62AEcIUaxcZpscf9i1ZAqGhiYeChypOm6BvgrdkY6MEAiFB
         LzFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y1LTbsBm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20-20020a0cd994000000b0067f0e50cf96si2864123qvj.225.2023.12.18.03.35.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 03:35:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y1LTbsBm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFBsY-0007ST-RH; Mon, 18 Dec 2023 06:33:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBsP-00079G-Fr
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:38 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBsC-0003PV-QR
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:37 -0500
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50e3295978aso1380114e87.1
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 03:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702899203; x=1703504003; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=V/3KTHhaXn8gw7Kymod6Pbk9EKXu1H7ND5ieOsslvsk=;
 b=y1LTbsBmnEo0CGkRbuvaDOOjetcY9hDfsAI9hKncJ4+1KUl0q9q2Jz6BBUDvhKbZn3
 sawpK0z9fJUMN3BPj+OZqjFi20yR2MAHeRa4UhYIuUe58fIiyUQ88H6qP45Ie6IVTcdq
 HO+W6WeYiBdXTYv4KZbiLygWb/ATHM848qGGaX0WFaP6yznIBjgQePtM1BUAhNa8u3v5
 gQ+kiAQvbExQCBfI7PacjJ543o7V99O4dHlhbM6myltW2TGGHq82pr6GQL/U1fUhjsuV
 c2TZPcOFpQ4CxHMcyv4tesoQ3YI4jtOMUDXAjuvpSKxJ7acRbNx39j0H5579rhkTt9/9
 6DJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702899203; x=1703504003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V/3KTHhaXn8gw7Kymod6Pbk9EKXu1H7ND5ieOsslvsk=;
 b=UXK6Ai3vX7cFz5rX+hUKyf5CfRW0F73NAsC+3V7Iy3B7Z8Yd3LHEWpadmaPssEEpUQ
 Gv1BuZYOHevsOix2t31Sf2NhjZmlmy7zbdqCBeJZMsuTVa9EVlwGepMNnytjejScITpR
 T/v6xMmexOFJkpmELvidadasqnFQgpIsvnDSjSkc4CEiErqqriI2mYh3LrLhdCvfR/9x
 +sgwf3K+r7Qv7nIY6Vb/1o/A9kAcvXQZayE1Cq7kIWnGhHZ6pTcMQX3ZooXjipCAa2ZW
 Mp7h8+E5NPhqJeCKNLwXv8dVU7yTjnIaIcBkyAY04qHl1x0TLvsvLoKnpIQLXhke2J9r
 vrHg==
X-Gm-Message-State: AOJu0YyzjlQmWZrDTYo0Yj9DtDbuJvd5fIKXQpxovM+0/vzSKAT4cYjQ
 YPVLwRpovX94X0kE91sXsDBn1sDUv8TEWXSag/s=
X-Received: by 2002:ac2:4114:0:b0:50e:30b3:b8ff with SMTP id
 b20-20020ac24114000000b0050e30b3b8ffmr1286041lfi.16.1702899203124; 
 Mon, 18 Dec 2023 03:33:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adff012000000b003366da509ecsm671193wro.85.2023.12.18.03.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:33:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 34/35] target/arm: Enhance CPU_LOG_INT to show SPSR on AArch64
 exception-entry
Date: Mon, 18 Dec 2023 11:33:04 +0000
Message-Id: <20231218113305.2511480-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218113305.2511480-1-peter.maydell@linaro.org>
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x134.google.com
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
X-TUID: i/F8xS8YTIsy

We already print various lines of information when we take an
exception, including the ELR and (if relevant) the FAR. Now
that FEAT_NV means that we might report something other than
the old PSTATE to the guest as the SPSR, it's worth logging
this as well.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c72ce4aee09..b8604f39169 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11493,6 +11493,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     }
     env->banked_spsr[aarch64_banked_spsr_index(new_el)] = old_mode;
 
+    qemu_log_mask(CPU_LOG_INT, "...with SPSR 0x%x\n", old_mode);
     qemu_log_mask(CPU_LOG_INT, "...with ELR 0x%" PRIx64 "\n",
                   env->elr_el[new_el]);
 
-- 
2.34.1


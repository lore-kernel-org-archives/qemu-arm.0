Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp688892njb;
        Tue, 13 May 2025 10:49:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWxtVKMMGW1m/qqHVHBm+kUwAJ9Dq4poVgNx0tetmosWdP1BMY0AaEupVwK3wKipZNWJhBxDW5RQSUNiQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE+LVrzyjRGf9PHKy4bE6NzP6HQSomUxUvWym+blXUAwfx7sp6lPt2+EG5LJbLf7smK1xHn
X-Received: by 2002:a05:622a:40c8:b0:48a:8b64:f670 with SMTP id d75a77b69052e-49495c633b5mr7366621cf.1.1747158559368;
        Tue, 13 May 2025 10:49:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747158559; cv=none;
        d=google.com; s=arc-20240605;
        b=ejobNmTsbR1IdfV6RCxXvhTaZc2IjhZq130QfGe+lrNDDMEKAfbfvKJPJMmq6i5aTy
         c55KGZ5+lo1YJFJjvXgW0KqxbdlK9tn5yDFZl6L/0BMjKvVVjtZgkczbYsI3g9m8NOxK
         /CxrWqLdCCFuWvUuIRG2RZeHe2LwCjqIxG8O+ArGVy47aBkbfAKKaI+1fBLY7JkKo/Qj
         e5A3AbIhaGv0MIbTsk1FkSQRipkHIY/6Io/cUNkQOT7kQ8MQxECmKrDo7IymM9HBg+8M
         b5kQN4mcVOKEjeVMFScR72ldo0GnYZ4VM2ET7diwKyJJCzbeAGNHV4AxuMLO+UMGuDgX
         5qcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4Yt1id2RxlQ9HmFh2CVejYPkAilxVPKGmzO8+uGHOl0=;
        fh=bgxHiOeYMXSsw/siQxdcOLAETmmJMGmqa5Om73l9UKc=;
        b=kNFPjhFk8ASwX7Y5TuKMNJXlTJGO5i9J7DBYb0+C5yR+S2VKspswgVOdjmHNRM+fYc
         9xEn2cv96uWsHByrliTrILA6w//6z7hPORixFr3SZkTNr+b19T825HcO9Ozm084G0A0H
         b+PjpWS71aD+crMASRX34kcVa28JI88rnLRSpOMXtKZFVvFy+YlMc8QsMDQ37UIMrVyr
         YTv6utsGWvRIzD2OSy+boBfR6LWyLJCDzQDplKBX5/3QWFHW0IvC/fvESyLR7Ox0wJPR
         aoytPggHs/XzgrkRHmZa4xSPd2tU87gNkXJ/5X1gAjyDzwcqwN0oW8Dv5LLAM/7zKEPr
         JtAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y0MTgd2+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4945259bd01si114644911cf.565.2025.05.13.10.49.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 10:49:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y0MTgd2+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEtjy-0000Fx-CX; Tue, 13 May 2025 13:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtc0-0000GW-2w
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:40:24 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtbv-0003N1-SN
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:40:14 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a1fb17bb8cso3669402f8f.0
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 10:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747158010; x=1747762810; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Yt1id2RxlQ9HmFh2CVejYPkAilxVPKGmzO8+uGHOl0=;
 b=y0MTgd2+hSlRFN1atAMenypXJU4gBRYzjY0te4ZAHs7qd0NnDPvYm5AME1AM0LeoaE
 PTsgGvh6Y0ORIDKevsaAXggpoSIL5L2NoidvwIVU7RwSHha6SSzVJipl8TbzZSZ6Ol3L
 hjD5/ANpsFnwhgrnK4MHRaBGGZCXT/aYydntJaVYYunJJlYkQN6psZxZCtD3zhIIENQh
 Kw+U/JduWLzmpmlRxY2Oj5wLp51bASdq++Wg1/g5CupuxiGvIPiHv9nt48LLdcBmN/1F
 XgkbeDAwJeLeOuAcfeWMZxXsQ3lT3XSG3ekYD/3U6i0Cu+sobv+W5WvE/aMvNkpVM0O2
 rLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747158010; x=1747762810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4Yt1id2RxlQ9HmFh2CVejYPkAilxVPKGmzO8+uGHOl0=;
 b=H7gC6LH11a+w2n1Msk/qYINjmt1q+iMk62r8IkPDVSKG6R7k/+/Tj9g15Njc1WDpEe
 KFSeF+hAdI+voh+80rT6FYV0HqMzAaGQKFgCkAXH8V1mijU39fwrXO3LD/30HjbKq5aP
 W2Pr07uBrxIMNdv9Y4Ih/n3LP8hHtJOMu1d6+T7B4T+BpHmhhAFvZojAWr8cEY9UQ/kH
 yv4Ea1kxIt7YTXdunB8IqbOQKBN9i7jEoSjBufelgGeUEthKJBjvbhg1pAi2jOmsbmYa
 5iSqegsoh4CEdN/YNlgrGngKmyzpFewkAt7OtaIbKRmxYkwePcm+TKceCX940rzWujVs
 XugQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbB7vhPdrrmhXjN/3fDnAF59onw9tmBIfuQz9amX0lRmTSnB57EgfRLEp9GW6RWIFAS75heQQAVg==@nongnu.org
X-Gm-Message-State: AOJu0YzRildM+C5UxBzQnqXQn9QH21RyNGkPIAtegKxCowZUJl5lfbF3
 5KUhPZz0fMoKL6i52UKM4vQbYEhmDwte+bOo55kHS5x3CtbCgV+bbRtsxiQn/vA=
X-Gm-Gg: ASbGncs+F9mrEk7hwruzHZvNa8GkhV2ppRZC7BFoFIft4jytd10bc1KrHm/KyWcsIs6
 +jH8AzEz01QXUDFoGdOtIFGOf2an/M0VrlPoACXbQ7YFtBIStyqpfMazEjpPPL9yrMx3OYccWm9
 2gtjM6jiNuctc1noz2rHx0t7zN7PNAcB+mDE8xBobX5JnsnSPkhoLMP+VIiM//6pk313ctmGoNa
 bpmMk+/pUZpZDvJfTHNx1h69DlgpwcTg5kjOX4jc5eCh6VBDMVRoMDzttY4ZbFtAiddFCswIyE/
 YzuACs+1+GZu4R9ucuic3ge5rkLpBMsc44vl4kGyIpSgQZC1POkX3Utc/RwirUrRZh2SMX/hj+Q
 s6SwAgNFRy2rGfWkSb8x2mTA0RmZ/
X-Received: by 2002:a05:6000:4023:b0:3a0:b294:cceb with SMTP id
 ffacd0b85a97d-3a34994f2a9mr127385f8f.54.1747158010084; 
 Tue, 13 May 2025 10:40:10 -0700 (PDT)
Received: from localhost.localdomain (110.8.30.213.rev.vodafone.pt.
 [213.30.8.110]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58f2961sm16974292f8f.45.2025.05.13.10.40.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 May 2025 10:40:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 08/19] target/arm/kvm: Include missing 'cpu-qom.h' header
Date: Tue, 13 May 2025 18:39:17 +0100
Message-ID: <20250513173928.77376-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250513173928.77376-1-philmd@linaro.org>
References: <20250513173928.77376-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: 9jM8kE04dfpQ

ARMCPU typedef is declared in "cpu-qom.h". Include it in
order to avoid when refactoring unrelated headers:

  target/arm/kvm_arm.h:54:29: error: unknown type name 'ARMCPU'
     54 | bool write_list_to_kvmstate(ARMCPU *cpu, int level);
        |                             ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/kvm_arm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index c4178d1327c..7dc83caed5c 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -12,6 +12,7 @@
 #define QEMU_KVM_ARM_H
 
 #include "system/kvm.h"
+#include "target/arm/cpu-qom.h"
 
 #define KVM_ARM_VGIC_V2   (1 << 0)
 #define KVM_ARM_VGIC_V3   (1 << 1)
-- 
2.47.1


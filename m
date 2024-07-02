Received: by 2002:a05:7022:ef0e:b0:81:d0c2:543b with SMTP id qy14csp2433831dlb;
        Tue, 2 Jul 2024 08:49:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXFWSC/avuvNalg/avENSvoPXJCyVlOSnXm70IlHhvk8aN7xV6dQN3XY87sfm7OjhX+EXSd7m/sV4ndEIM9kFUMMgpYEQAl
X-Google-Smtp-Source: AGHT+IFoCgxO6UATMO1CG9nOt98MfSo9Dcl4xtJu+mgcfDxztVFpmENew3FIsQUrakoPgkWoExvE
X-Received: by 2002:a05:6808:2390:b0:3d5:802c:9056 with SMTP id 5614622812f47-3d6b30f4714mr12456317b6e.2.1719935383942;
        Tue, 02 Jul 2024 08:49:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719935383; cv=none;
        d=google.com; s=arc-20160816;
        b=AyC71+XSx0dmFdOH33rZ0+k/z8D4691lmnbFymD1lTzGSu8cbjdKKO6b7t8mKyHUdJ
         Fa0ropggYoFeDRSRjDCF1huffWkE6wRYo3o+pNMfych9+on0Y5SjZvSi1saP6/CvFMIf
         9542kNn60pZwwMPUOSwcEZEIpX9ttIPbt5FI6nudWxONjWDg5TmvFIkN8gYaggWI7azT
         RfVavfpqlgdR5iuccHESrGlpmEkKKpCe51BHQTS2rQYFFmC0rpMi+FDWBswjQB42upYk
         8o5YXZDM2DjJ5c8CZfKdtluHp5SOoESp/fIn4R/c2nsG0y8pvNNYNsVr03j2goeARlWK
         4cKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=EYRoGF2stDqYWIzGESxh6OgaaDeyMSanepz7ZjBZqBw=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=qwuBoKeIkpRD1NN52poNpacgDP01VTe6kdSR0+U5j5S++l2je8sNqfpOe43KDS+XKk
         VDHs0OH73/Mc0rE5awd+r9ROUpjytCEF41rAKkyMQeEHp635ARfppevSHYyxlz5n41bv
         5I4MMU4U0ORTCB1mlUaJzCZ8AoTS5XEu1dzIIkbf0QCTyBUIHB/nu8tfdQf2TDrGBMWR
         /VI+tBtgAJort8mZ9nuvJ8gRQwHMIWvVeisQnp+It+Dhpd+8pZKlasWIqr7gVU0LcAmA
         qI0xQ2ec9sHJzfa24cd3KepRGfMHtwVwrpGevgEVlihVVlYMmCBAnFLrE5A1vP2Xj6Id
         1fyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cfZtSi6o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e62aaabsi103151806d6.616.2024.07.02.08.49.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 08:49:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cfZtSi6o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOfkr-0003lD-Fg; Tue, 02 Jul 2024 11:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sOfkq-0003hZ-GS
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 11:49:16 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sOfko-0006uG-UU
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 11:49:16 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1f6a837e9a3so18607095ad.1
 for <qemu-arm@nongnu.org>; Tue, 02 Jul 2024 08:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719935353; x=1720540153; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EYRoGF2stDqYWIzGESxh6OgaaDeyMSanepz7ZjBZqBw=;
 b=cfZtSi6o7ivI9vZDiluwWcWWAaZXNag2+1xbKD+Dt+hWnLDnj4M5LP76nmA3A1ShH0
 1ds1cqXHxbMcNgo7qkyI5ef2m+xtwKWplMFLtL5EyO268DeQicc6CiKqkc7OBbICUPWS
 9qhBfKxsdEi/RlsJSvKxGiXNtCzKbVqiqpd1tsDYllZpTvWefE/mNFgYnIxhexsblKko
 aSM2lOGB63Mj3IKHScGFTPJ+H89zwEYLQs7J5MEwHDRGdWOSYKJY6exa8oAozqLHUtcH
 yWcnTEgW6sYqm6qKCSr4wwALPiG8uimYJNXk071GdClH04mxSz1o5aMGIYtx485RKNyY
 OzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719935353; x=1720540153;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EYRoGF2stDqYWIzGESxh6OgaaDeyMSanepz7ZjBZqBw=;
 b=iTES1T/7Lno6UpH5w/IJCCde86FsnpUa/Ti0L7SMXd0fEIBk9XSw+7C+doQ5IuNnrT
 3PY5baLTBusimuagz0Tpbz3yF9KeDPERPAqvgQ6zM6AR6yOeCPTe1wvOjaKpdWn1HAEr
 wPzC1HEuKHLKo8oag9y7lVyu9Wb2QOpAmBxhMwSwzc+VFtTbnccTWM+klsccPU68o21q
 5Htb6InB/F3W/i27E9AHCFTfgjX4meDKVFFnSMtYFon3odII4BUUMjfJ+gjt3pwAyDk7
 c1tZwVmsejVHXt4N6cKJBGWoaNdCY3XgPJgqnpOkDbGcZAiisJ478AiQSzqUUrorAyaB
 q8nw==
X-Gm-Message-State: AOJu0YxU+iNnUzKuAPaZ7wlOEeAjvoKae+2cSyXQJJs9D/8hDBv83tU/
 vcFQmsnsATaJ7lyhTBQtgAEjYtNA0Oe2TGN/ptXUqD0zy/ri8DlBWttP0KaM/XC3kJB8Qv1wC8x
 t
X-Received: by 2002:a17:902:ceca:b0:1f9:cbe1:af0 with SMTP id
 d9443c01a7336-1fadbc5b80amr50721595ad.5.1719935353277; 
 Tue, 02 Jul 2024 08:49:13 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac1569d28sm86197275ad.230.2024.07.02.08.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 08:49:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH] target/arm: Use cpu_env in cpu_untagged_addr
Date: Tue,  2 Jul 2024 08:49:11 -0700
Message-Id: <20240702154911.1667418-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
X-TUID: CGSUmWO46hrJ

In a completely artifical memset benchmark object_dynamic_cast_assert
dominates the profile, even above guest address resolution and
the underlying host memset.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d8eb986a04..ccfb9349a3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3309,8 +3309,8 @@ extern const uint64_t pred_esz_masks[5];
  */
 static inline target_ulong cpu_untagged_addr(CPUState *cs, target_ulong x)
 {
-    ARMCPU *cpu = ARM_CPU(cs);
-    if (cpu->env.tagged_addr_enable) {
+    CPUARMState *env = cpu_env(cs);
+    if (env->tagged_addr_enable) {
         /*
          * TBI is enabled for userspace but not kernelspace addresses.
          * Only clear the tag if bit 55 is clear.
-- 
2.34.1


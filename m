Received: by 2002:a05:7022:639b:b0:92:a90b:6588 with SMTP id q27csp152806dlq;
        Tue, 21 Jan 2025 06:25:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVGi1O+M0sbvbItbOCRl2HKC94SVzrG69hKseEuNI/mSqFykiZWhj9K6pPjcCuRmjPbxaVb0pIlbomvtg==@linaro.org
X-Google-Smtp-Source: AGHT+IFkqbWV7OiZavutAHOopKPgVonAh1crRLvQkPnXXUxX5fr1mqAvMJ0pYPdnOVPKzhjO7HCW
X-Received: by 2002:a05:620a:3947:b0:7b6:c540:9530 with SMTP id af79cd13be357-7be6320c460mr2889083285a.25.1737469501121;
        Tue, 21 Jan 2025 06:25:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737469501; cv=none;
        d=google.com; s=arc-20240605;
        b=TiLPXVEqKe/ck+D0bBj8ilSmAISKwa64kAkm+KzDcVMR3VW/j0pqMs3rg/Ws6FETHB
         BWLRyt+enppkcZqAUN8cQeUYqWZZlBs51VWfFhNRnu5CG+RwvTd6WT3aIgNGxtVAZB5S
         gkoTcKdEPCFRrsNP3zUksOlrmMWZKlsddqo6XX+yPmikpFS4ugw+eLlKpU3GzZscFpGh
         so0zo3D9IJ9BJx/37DIJFsxRFtXI0uPuE6t3jbQG9TwLxNFfLBgXLo7cMNEgb+uqaDam
         UYS6b1VDHi9ZoeEvpoAAY/9kkIGkMIww2wHS0JCheVZxcfmgzszQbjpjxLuqCPTL8zTZ
         tgZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=R8Fp3sEVk5tNH2xc5e8sHq21AAMknUb1MPMoentFoZ4=;
        fh=T9nLPmYdz8kSl8qI33evWuh/VVTqN+U2Q3T/ETy8raQ=;
        b=NvIGz5bY0ab4EZkEmbsZ/JvfvMEbpuh8VTdO0dmQQGYWKT5tudR7Op6xCYATByd5sJ
         L1RkJPxDlfsgn1SOXB8MMQcZmKXZ6orObECET+DMo9mchAoKXPfQ6cTGRGZyDe1E8t+i
         3L3zswH0Sbmg+aiUdv+u8k14Gtjdt/AtzAY4mRLE6ACY7UmNanhF6zpcXZbQmzGo71az
         Zd+JzXDKqnNiK0mMaFzFaPTwWwoe5DUBPW7ve4AV6viBV7lu5F3Tt34de4zru9uWCRIC
         epp8bp/YYfuOIkTHDEY9X6nJfJaZ8Oc6sFmNu5MzAmZjsfDaCFgPhsanp6zW21u3O39H
         OEsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rAh/6Mik";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be6146d3a1si1254624085a.87.2025.01.21.06.25.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 06:25:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rAh/6Mik";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taFAn-0000T6-K4; Tue, 21 Jan 2025 09:24:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAh-0000Pv-0G
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:24:03 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAd-00030E-FL
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:24:02 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4361f65ca01so58544285e9.1
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 06:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469438; x=1738074238; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R8Fp3sEVk5tNH2xc5e8sHq21AAMknUb1MPMoentFoZ4=;
 b=rAh/6Mikcxxi5oc4GjunUU/9Cw1iL7gTIBpM68n/k5sw/RodEzS/pgFcUDv1ZRDFCH
 WxQEVfVw9JHduRVJ0PR4mXtBOSa89ngwPEEv3GMRWcsIWnKGe+9/1g+rCaMD9tYx38MO
 3zYWnE7jZjynmmd2n1clWWZg0kx+ipPlADysxETNUAbLULu3V7SHaNtY7xe6oURJggRo
 BdR1nw0N/9lWOEBrnL5f6LhrX30w5I3zZ07julFpfa5X6LkadDPSQ9mhlVfOtXFxY41p
 YaGCGARcdT4uEyznjEmtOVTt3fpryimpJEU2fgviQp0DBmV35KmI9foebYnkrHWSnoMk
 bYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469438; x=1738074238;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R8Fp3sEVk5tNH2xc5e8sHq21AAMknUb1MPMoentFoZ4=;
 b=YnRpjH8bM/AVeklPRCwzvFpFKBGY9mwjrEyvT7CZB21YCnr881P7MX3bunpaX3OFoE
 MiDDGPLbqxNwcwe617H5EkWEcudz3++5xCwl2MD848d/zyh00X3qfsGOzpz45wQZnY23
 i3038hV+TA0tOAOblt+xNh+RiVYQ4QxE1bW17ZKA716XDOmJJAwRTlWL9PCXFmq/EzWx
 MSuJDyZ86yJ2FZO4W/3fYHBev44iHfTq0zIWPNBg200amL0PYy7fU9BT2NfNKj2nPVi/
 fTOcIeeHLEtT8ZgQl2AkVGr8ssx2Qa/mg+SXQbKcpHeMz9Tg8agRkbQUqhrP7NiKbFfx
 UM9A==
X-Gm-Message-State: AOJu0Yx4Z//cLvbzfOarrKqRXq8eah0Wf5QyVq/yZZwSZpZd/8dRpWkl
 ybYI5WDXSq8Yxyr91WDWrfpZ+a6pG9Yty1e/vYqU14XrG5QIhfQRXhu81kZmR0A=
X-Gm-Gg: ASbGncvNAPHVXtyOq8iz0ovQUgf71ju4we3am0bngqHNGQ/88+6/+P5IsvH14qznkVt
 QedpSSF9lCEWGCyj+U+LPzszM0+hds+IlbAf/LnYtXmbC5oEM0dLOYkXaUA4gHJR2mes6QLn37Z
 FxtG0WiaWKruQJw9ihQP+kAfBs1CnFvC6LyLZzO2szZb7ER/1kNGTHwvBKY/0fHXw+sYAKLNXc9
 3qB459J5PB8a1MRHrpU3t7MFsVd7r/QaZ81E9lqCZfK4dje1Ksl/i+jnOIpRQJ8Vy+6/C4huB5a
 jBJvi/00Z9WEczMd49BYmA2dMEuTxUdjwl/IyH+UBF69
X-Received: by 2002:a05:600c:1c83:b0:434:a746:9c82 with SMTP id
 5b1f17b1804b1-438913be56bmr168297705e9.5.1737469437897; 
 Tue, 21 Jan 2025 06:23:57 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4389041fec5sm184313625e9.19.2025.01.21.06.23.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:23:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/28] target/tricore: Ensure not being build on user emulation
Date: Tue, 21 Jan 2025 15:23:16 +0100
Message-ID: <20250121142341.17001-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ZsCgHFboojuL

Currently only system emulation is supported.
Assert no target code is built for user emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/tricore/cpu.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index 8e431d79222..cf9dbc6df8e 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -26,6 +26,10 @@
 #include "qemu/cpu-float.h"
 #include "tricore-defs.h"
 
+#ifdef CONFIG_USER_ONLY
+#error "TriCore does not support user mode emulation"
+#endif
+
 typedef struct CPUArchState {
     /* GPR Register */
     uint32_t gpr_a[16];
-- 
2.47.1


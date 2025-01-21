Received: by 2002:a05:7022:639b:b0:92:a90b:6588 with SMTP id q27csp154176dlq;
        Tue, 21 Jan 2025 06:27:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVbP+JV9RSBXLPB1uHF8Y1HTaQddRRY3UG+ZkRxODr7Cpa+N5ol4CdwNmlPW7gr/FzQ8dwlal6y6aJyUw==@linaro.org
X-Google-Smtp-Source: AGHT+IFHzQ+8yF0r57scel0v99dLyDxGDzqwVVFYfSe/kpBzHoo4e5NFq6Uv2yHOS6+deG9lgjBn
X-Received: by 2002:a05:620a:2988:b0:7b6:ebb8:14e8 with SMTP id af79cd13be357-7be6320cc0emr2450383585a.29.1737469642986;
        Tue, 21 Jan 2025 06:27:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737469642; cv=none;
        d=google.com; s=arc-20240605;
        b=Lzzl69aazUuBtxEoFcKD/ihSo9jZvXV/SXleMuhxY6wPUCNulvOkJrZCszgqHLcaCO
         6WQYJQFUEdKuhG+LHMiFGi5k6pAxdQwR5ZAFaSixR7b5DuAsSQgXoHSQTVjWq7dfp7T3
         cSvm3LfAxAZGn69ACWfxUPeoZ7faLVeRsmGXi77JDQJLuP3I59LEwyIUA5WoUsWe1lsF
         r0i2ifwgESp2txyiC2Ad+SuCzaKGGQTOaQbNGU2qdA4fXwbg46r/M0D560vsUHpZPPw6
         H5cMGknKcQJrRvno4FDq2JGSh7wlAEdWKJiHSMH3Fqsh6Ahx/GGTs3fplEauvI3JE/kS
         64Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uL4Y+z6DzTKVC74EB8XgyjJw99XhZeyPYSd4sWJmzog=;
        fh=T9nLPmYdz8kSl8qI33evWuh/VVTqN+U2Q3T/ETy8raQ=;
        b=SlW/Ioo+c4jOYqUoPybhf8Y/lA2r38i7aJvfRqlQjXG4BBm7ZfkPytXBXCTykYvITI
         PspS+1OyDqw84keaDFk/xHw1W/rht+4PZNXDP9cjbayiK9+IVkiqEVWCmQq2QOo9zSa+
         EU3GA/XPVlPRG9KtxU76aSrLiJVQPlcb18HF0WS9SH/+1LASOcR8VhFs1/QGHHVrxnMH
         beOfFBKzOIcRpcCd8FjUs50cKjqztflFqSbS+omowRNS9btkHavCs+ghZ9cHxivRSD8f
         iGdCJCyCDLvK50nzN5YU4lNEnNW7jGj1ejL4srjgtmrAAxod4sa+78VBIuYr14Usu5P1
         AFxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kyyNbtL7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e2f67dda0si67573591cf.196.2025.01.21.06.27.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 06:27:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kyyNbtL7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taFAu-0000WG-81; Tue, 21 Jan 2025 09:24:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAq-0000UT-TJ
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:24:12 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAn-00033G-NG
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:24:12 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-385deda28b3so3603985f8f.0
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 06:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469448; x=1738074248; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uL4Y+z6DzTKVC74EB8XgyjJw99XhZeyPYSd4sWJmzog=;
 b=kyyNbtL7qPBGpgMfbNJwFYYqeqULyktpceO19h6lQvNTWMgFX7/jLfVke35PIlf54u
 PYeJRNAIwzOxDqFp4kaeaUsG7pWxS+r/E+Jk0bj40R0zmiQK6Hpuj6ti+vuNfcm4WeUg
 zIC3n4/PniBI9/IhV4xUFPdNeA73lad829+63X6lObpPjo4I4/b3qquHzJHrBcQKrgn7
 DHzvHjyAHH70v7UhMWzjDYKWxuJnQdkorRXSYa5EQOieF7/YE5zq6WGhdxkpvpYwJgnS
 2NFF4Gf/VT41UeCVkC28jczrcaoTQHYvck9pGJGlp14IjFWNYF9yQMnv4+FtOhKVuPOA
 FpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469448; x=1738074248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uL4Y+z6DzTKVC74EB8XgyjJw99XhZeyPYSd4sWJmzog=;
 b=MvZmWqv8nY3tcRMbyi3a+tn8FnWzRvpcwlZFK/26Q6O9kMsSWhrdEVKEwGiC7ge81C
 9W6wrFuyjq/jBLEBLJgFyTGfiDmoto6LbRYbtqwBEzyb7WKq6H45tEldoqgIbXu5Eqpc
 pMUvPdGBtfPLDindgBbMLSgRD8+I0mZUIOABY6Yxj2NUcHA22+jK9v+W+JTHXL+ivMY1
 XftBpnwVTXkWwFMTVmoc1kqfSp+57Lvbl7sgWzhSC+flAXwE3Gprq3LbgluS4lLtkB2T
 F+L/Sp4dZrbHJVg/NChYxIw5VC9TYartGNfkKzlHcZ7VMD+NCEAXrrPdbt8F6/EhKLo6
 9v/Q==
X-Gm-Message-State: AOJu0Yz3IZgqdRHF/RJYC8gZrInr+G0vzEtYKsIw2vd1rw8RQUqfRFTf
 waikCV45XZcqvj+b3n7C0YxfZ56T+HC/V5t98vveGMOCwhkCs/je5zVbCOn6Ojprt3zH2B0vzb9
 UKvA=
X-Gm-Gg: ASbGncsSwmSx6+KAWBrrb0cw7y5GNVhTcU83gDBQ8JyquFqeXB0mdkBsAZ6v7BVZOQe
 zxQr8g/7W0GasIlF41qFF2bvU6hK4CXk3jvt3Pnvpe4ZYbC1shHF/nd7H7W3DzDOQ7fAU/hdhYx
 A58lBVNaeJvnfHoqV3vm2Jv9wx0TUFNG33FCDdw2A9rJnmfGQNJPi1T0s8rXhjhc12qIATswLZA
 vTshFNv6rpUcKTg/L7aHgGxgIp8rg6jVVYUsPtZqbVx+O6Fk52/dZX6whmeaMuEvy8qbJWImq+T
 KEX5FrwfMFMkcbbbfPfos2Wzxlk1Ezi9SS1Q3i6GNe2O
X-Received: by 2002:a05:6000:1849:b0:38a:8888:c0b6 with SMTP id
 ffacd0b85a97d-38bf57bfcf5mr18393431f8f.51.1737469447276; 
 Tue, 21 Jan 2025 06:24:07 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3214fbdsm13815861f8f.19.2025.01.21.06.24.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:24:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 05/28] cpus: Restrict cpu_has_work() to system emulation
Date: Tue, 21 Jan 2025 15:23:18 +0100
Message-ID: <20250121142341.17001-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: MBx82joLOTtT

This method is not used on user emulation, because there
is always work to do there.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 2402706c7d9..e094d54949d 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -748,6 +748,20 @@ int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs);
  */
 bool cpu_virtio_is_big_endian(CPUState *cpu);
 
+/**
+ * cpu_has_work:
+ * @cpu: The vCPU to check.
+ *
+ * Checks whether the CPU has work to do.
+ *
+ * Returns: %true if the CPU has work, %false otherwise.
+ */
+static inline bool cpu_has_work(CPUState *cpu)
+{
+    g_assert(cpu->cc->has_work);
+    return cpu->cc->has_work(cpu);
+}
+
 #endif /* CONFIG_USER_ONLY */
 
 /**
@@ -814,20 +828,6 @@ CPUState *cpu_create(const char *typename);
  */
 const char *parse_cpu_option(const char *cpu_option);
 
-/**
- * cpu_has_work:
- * @cpu: The vCPU to check.
- *
- * Checks whether the CPU has work to do.
- *
- * Returns: %true if the CPU has work, %false otherwise.
- */
-static inline bool cpu_has_work(CPUState *cpu)
-{
-    g_assert(cpu->cc->has_work);
-    return cpu->cc->has_work(cpu);
-}
-
 /**
  * qemu_cpu_is_self:
  * @cpu: The vCPU to check against.
-- 
2.47.1


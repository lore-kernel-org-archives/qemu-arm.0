Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2229565njb;
        Mon, 10 Feb 2025 13:30:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVTFTdr9P47NImlS9H29G+QXZkIvS1Uno2xiX60hp5hagV4XA+J1xI2Pl0+T0PphsemNhATi+V5oQK/tQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEaNZiisIBBZcfJGt5HpZJYEj+/JFLS0gNlwRVGtmrwpvylLN7GBSuMzQUfSOjhFyaovmd+
X-Received: by 2002:a05:6214:4108:b0:6e4:43db:205e with SMTP id 6a1803df08f44-6e4457407d0mr211580906d6.45.1739223050318;
        Mon, 10 Feb 2025 13:30:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739223050; cv=none;
        d=google.com; s=arc-20240605;
        b=AcCLiPq3TdGu7AY+DwCGfKoFvIU2M2XYSIPBgT/KVTaYj3WwMlaPBlgh37BwAswfrE
         bUqYwU60pr0xcAHlA62CdhUBW1grg0+/oCdpbzkQFwQgRhHKS5Y3RNomCeNlRMDhwT+k
         OSa31QKMxiSnCMZ6+9xzJ1guUvPhbRyriwIY7DkZferzHfUqMX/3TfcR8iw6R+sqmEDk
         9vGSgBtVHNB4ejSmG6qMPHUR+ZlECmAhUGZZq6UZ91nZtsIhGfAqacvVBUQ4Wrw0dsUD
         cKtMYHm3fRd8VFS2IK1TwTiZ8KrEsXGu8MmZ73eje6NN6XDdpQ9b/+8WTdPDG6CR/D9d
         C4/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WYUvy3QtP2AUaa/B3tYEfM+4wz3nraBak2/IB4Et0u8=;
        fh=+g2LEJtTYfw7XaOuC8FrxfCfBBtrx+cYf7oVa4nHm+U=;
        b=IiQVgqdL2yu4+dTXVgBQLbYtCxgevU2YlyQwJ29vHhNk4woxSLcZLW1DOOaYW+Bwie
         TaxA2kZ4BrPq3LSKuLBCcc7BpwR+RCr2m77uYEaoVIM68vx0BdOBcKaibJRMDzC0Egmp
         7+pyiJgXpFcbCfYLoG/VPjwP3f8+P8kNwz9q/NE5Uoo5PlxuZ5fNMJJSqEZNuhSv/vvi
         SlSyAM1UlHHFYg/CkicreQctraXDILWxQARyLnS8XUywnX9JbL2XB/mFkC3PG0Fy23LM
         Kdhs4UsOrKcHQDbDAfOOWfRp4O4LQf5aJWnfzjg5w6BUspyMAl6zlX94SVL29BZhzVPn
         ng7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p7c2ZfKE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e43bac33d4si103078746d6.234.2025.02.10.13.30.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 13:30:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p7c2ZfKE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thbLq-0003qr-6P; Mon, 10 Feb 2025 16:29:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbLo-0003oL-Mu
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 16:29:56 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbLn-0002CR-3U
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 16:29:56 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38dc33931d3so2081101f8f.1
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 13:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739222994; x=1739827794; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WYUvy3QtP2AUaa/B3tYEfM+4wz3nraBak2/IB4Et0u8=;
 b=p7c2ZfKEaw7BHeh9NI3aSVmSaAcF7a9uO0jfbqq1x1TgRJj+RIxZjw2PygrYrldIN7
 NEL5ky2g0M9h62p9VxNqradG4hkp62dRMbL/+qQEAQigmNZhx/36ReFAglKz6zE3QMuB
 P1BR7IAS/SeNeFQb752163//guDXn8mv6qdP/tCGPiiehETN1mMoXXdsWmlyA5Yn/EhY
 Cgwq6nsH/nkwEBw8jptLcwge/RaybAPHahSqQkrK8ufqVYA4FDiwF0lfWbPuX2R2HWTl
 UxgF5R2nfAddHCch81MUtKcNBY8vhabo+uliXz5y/m/1jW5sJgxgX7iHi8iZyfkbOT1S
 vCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739222994; x=1739827794;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WYUvy3QtP2AUaa/B3tYEfM+4wz3nraBak2/IB4Et0u8=;
 b=ltbQ+FMJ7Qf+x4IMGJePwPO0C2heT3iCNtKFMI7WcGSvQycKWTGJ0DDOk6ZGVCT+Ty
 nJdSQ703I1pNZyE7nU1RKfJ+dosgqjEiQJkDoYYHY3S/GvrfiiipeoX4ezA4j0O2DH30
 5KmuOSsB2z2PVK715qXcnSTON1kG2z0S8Rq8ALr4q/vXuW1JSPMHp9sEwqv+9gSjeBVU
 TrLvHg2BJNSxVQOz+3LKTqSY1Rg4sNkntsctP+WJaAfqO7Do1RwYXwRzgkY9F+JkgGYu
 Wmt57ictAfPYTdFFGohJJhY/hRgeNsnc2bK9sQqUnsTOwkDAVr2g9UW024qWsepv5IEA
 UfcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVj6AcE500LVELuDslPSxSijaqv+JbN38n4feunC4ZzCdiEVDlk2WozeOBtpLhqyXtWDKAVvoLEQ==@nongnu.org
X-Gm-Message-State: AOJu0Yws2/m232f2U3aqRV/Dqi+dpKjZfbnovDwSYce0x+SLhPRHkDyq
 7kHzA8OqJnlWZ+gaP0dMjtCIOzt8PY2MTuoI7DdPZqRR641zBsbPTumhsIUMUIs=
X-Gm-Gg: ASbGnctn+7jvXp0i2dZlPkF4PWVG4DgETc8swBIF5DIO5JW89+7eq0YLogtSYPajw4B
 /BO4twrnf/EQ/1DnmSw7N0a3dFoavKZbrb0/5ZTyr3KhyDV1kMTY3H1IZOYjBnQm+CPLJq0gsVA
 n5Iyoe7+bfzaLs6WmWc11OHEQyNbK9C/LRB6UhJ7qi797VL21cO+gKr2O9oQK//2VRavISF3bjc
 bDJ1bf2Pje8+4M2l/ShDrDF+BJl1TCUEIjNtkar6UwBY+BFUQ2GnqXgc7nfHMCfzBeoZOYQAalH
 VYNYZYhgN5zDCuJjPnFCsfp9Cb8OjZwZH8cbgEz58YgPDzbrWzMQq7QADtOtkgmLGA==
X-Received: by 2002:a05:6000:1886:b0:38d:d99d:d221 with SMTP id
 ffacd0b85a97d-38dd99dd4e6mr5021186f8f.1.1739222993757; 
 Mon, 10 Feb 2025 13:29:53 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4394127afcbsm54084965e9.23.2025.02.10.13.29.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 13:29:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 04/10] target/microblaze: Set disassemble_info::endian
 value in disas_set_info
Date: Mon, 10 Feb 2025 22:29:24 +0100
Message-ID: <20250210212931.62401-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210212931.62401-1-philmd@linaro.org>
References: <20250210212931.62401-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
X-TUID: nCHJM9sCcFB3

Have the CPUClass::disas_set_info() callback set the
disassemble_info::endian field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 target/microblaze/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 13d194cef88..27089e3c579 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -224,6 +224,7 @@ static void mb_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
     info->mach = bfd_arch_microblaze;
     info->print_insn = print_insn_microblaze;
+    info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_BIG : BFD_ENDIAN_LITTLE;
 }
 
 static void mb_cpu_realizefn(DeviceState *dev, Error **errp)
-- 
2.47.1


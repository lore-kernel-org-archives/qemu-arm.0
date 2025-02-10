Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2251286njb;
        Mon, 10 Feb 2025 14:20:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVsEkGc/OoIVqrAo6WWU+adkM32zojB5GFh5n4DmBxgUIJiXvqlmYfn1VQw1S8R6NITGG8x07t2esfJdA==@linaro.org
X-Google-Smtp-Source: AGHT+IEZxt5WSn7ydercBLrnn7BEy+E/rwgsGsLwvtrgPLXompNZxLLM9V/GFkwAyOpiT4ElnREn
X-Received: by 2002:a05:620a:818f:b0:7c0:58b9:217d with SMTP id af79cd13be357-7c058b921b6mr807725485a.37.1739226011381;
        Mon, 10 Feb 2025 14:20:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739226011; cv=none;
        d=google.com; s=arc-20240605;
        b=iKrkugv0zTQwjxSw7wTLGqJ2sGtTxpot7Bln/jXuM9VTkvFaCXL5i1+uYj698pZXpg
         daeqRitv9L4D+ViSZ/nGm/fzWNz1qztmSYn2XzrnUud43xafbG3WgRtfGHo++X77+PI4
         RY8kwM6dRQanbyS7RMNfm9EfQHGqXyfqWLPC0HEGDcH6dI8S+EtA/dlbMHIsEMKLn+Lo
         mdbsSNDjPjPth/dwFdcLvVB8ofsW7f661tzVCMWrZ5HQYdEXUeKg+k/vwN876MR7aJsY
         MPBNIyfsasdwFWgZFp1xcBroWqnIyy/vNWvcusVGt5BLZ0qZwQkFW2jkdO+5D4A0g85Q
         Kf3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PUkz5f9MQ2pvcvCLkym9eiE0tZLYKK08nDn81l1HJFM=;
        fh=mCyf/9pJfu/viGzwr6hFLa1Y4n2TV1GoEuMLcwPRdPo=;
        b=O1CHymoxQ+uGFxX8H/wP6AX95ud8AHoDn6a4rf4wDyzmUEZoZEzWC2CNBYyCKjazbH
         Fm+5IDL2nNYwm0COkqSHHjtKckokM9HHfduIZ4fDE1p7vhvWw70SINwafJqD9CItsJGs
         vEme3Z40j2oexIhobfGJs+IAo6ouMNpS1v1TuH15ujJAz8WqDgU6AdP0O+oaKzTMQUIo
         F+EsqE/sRHbICR5PpK/SNSEo+8HdqDIPeSfdKT9xw1srhd19ViQnV4vIKwogyTTrkcVN
         q59kFya50uX7QYZqNVOWFjKvAme/wYZ5ieTcHee2mKWD+fdIxkUm1DG8vgWcru5Uuw3Q
         Mvdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=btk1CvvP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0583e9fd2si426090185a.145.2025.02.10.14.20.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 14:20:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=btk1CvvP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thc7N-0001xi-2p; Mon, 10 Feb 2025 17:19:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thc7J-0001oA-A1
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 17:19:02 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thc7H-0002tI-NT
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 17:19:01 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-38dd935a267so1675240f8f.1
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 14:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739225938; x=1739830738; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PUkz5f9MQ2pvcvCLkym9eiE0tZLYKK08nDn81l1HJFM=;
 b=btk1CvvPA3YTyZkjjFkkQz71BxpkDtSyMlarm2zkWBwUP+lD2cBij426TTSlkHaBCD
 /9cfUN4o4zmgrGA+iViW3GE484L8KpVNBoKSSp4OCtd2xtyRaB0gfVhXOv6SCRWQGnKm
 1isH304D77gVIHSH1MOCVd/BicQqrb9l8pKQMyIpRFe8Z7mFraMdPwj7Zu5FIHePLl9v
 vswp6F2vLBvb5xpU4Yfrk1TH7l0P4XFDkALv9veT8C2p3xVggEfg3J05pYjWShP2IfWx
 0Z4HEox1ecxdX5/a3SnhizCwENC18tmwEY8fjKMUQcasbh04M/cRXrwC8fKrNnQjZ74f
 DAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739225938; x=1739830738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PUkz5f9MQ2pvcvCLkym9eiE0tZLYKK08nDn81l1HJFM=;
 b=UwT5rOJ2Vp2eXAvDDj38idPJGOUXZM7dlSP65gvZjTowKhHgaZctcsmk74IxfX79+2
 SQM43L8xeVYBelHhjXoWyoT7E5MzJNn/LQyh2GvrQVExA/jNIHCjduNwQOqMSmC78nz1
 75WnAkD2ipFiuHqRvDU5eC4L5EdUDlgCNKNNwpBdMoPGI+W3PxkdwZ0Aaq8JgK3Yd8O/
 YMPlPvHVTFeFIXvqC8snC1XChdPWbPSQw+JEskK1/m+Qp6hTNUWd1vRGVslwq2KGxO4d
 Mzc1F4Io3HYQrzYg3EUCipMe7jPEarLYMuqfsojtePGg6DgSw/RZAGwVHe3studt1VhE
 L8JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXh41enY6zk3Yqe+UxKaRjtUpyTKlTXGkL24NZNSZwU1tZseDD0P7pM4jLOAJr6h+GKdcJZvz5qJA==@nongnu.org
X-Gm-Message-State: AOJu0Yzc7j1G8mpGC3RqP1ck+yNJ0RnqjsaG3dXaM9O6nz/jone/xlkz
 FX638pMjncd6GZ+RjVid7qo6wpk72sJB373jwog6HyTYwgrNTcYAS6X6DwEyNRU=
X-Gm-Gg: ASbGnctPRweJEzzR5WaiKICkw2uf2iN2X/WE+OXJRaSDGp3EB8DS1B2luWErfHz+vfT
 BeMSuGsjzZl2ZjYnV0vi3CvnVQa4bVaqfQs0gLkS0ZBnB2EMawTy7oVLNrcob3zAbDFzAHvOsS5
 kgoPr2sqz45pOAXImO/sjbOQNgF01fxIga1X48uYaN7jH+CTZYl3uXfRtGCh8vP7HPebw9nTSa7
 Tb18bbAgZm+M5YX5DJ+gg5m6gyZNecOLlmzlFId13FnYnVfcNAeyVZSq7ZjkrUDZTpei891kdFr
 hIRccAPA7vd9ljfeMf3TqVYQq9YMDCF/cT6Q10j6Z55notMcG759jgNQUC9aBzKDXQ==
X-Received: by 2002:a05:6000:2c3:b0:38d:dbbc:3b07 with SMTP id
 ffacd0b85a97d-38ddbbc3d28mr6156987f8f.2.1739225938021; 
 Mon, 10 Feb 2025 14:18:58 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc9ef8ac6sm10675362f8f.27.2025.02.10.14.18.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 14:18:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 05/10] target/mips: Set disassemble_info::endian value in
 disas_set_info()
Date: Mon, 10 Feb 2025 23:18:25 +0100
Message-ID: <20250210221830.69129-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210221830.69129-1-philmd@linaro.org>
References: <20250210221830.69129-1-philmd@linaro.org>
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
X-TUID: QOZZErBH9iQB

Have the CPUClass::disas_set_info() callback set the
disassemble_info::endian field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/cpu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 0b267d2e507..e76298699ab 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -428,13 +428,13 @@ static void mips_cpu_reset_hold(Object *obj, ResetType type)
 static void mips_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 {
     if (!(cpu_env(s)->insn_flags & ISA_NANOMIPS32)) {
-#if TARGET_BIG_ENDIAN
-        info->print_insn = print_insn_big_mips;
-#else
-        info->print_insn = print_insn_little_mips;
-#endif
+        info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_BIG
+                                         : BFD_ENDIAN_LITTLE;
+        info->print_insn = TARGET_BIG_ENDIAN ? print_insn_big_mips
+                                             : print_insn_little_mips;
     } else {
         info->print_insn = print_insn_nanomips;
+        info->endian = BFD_ENDIAN_LITTLE;
     }
 }
 
-- 
2.47.1


Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2251153njb;
        Mon, 10 Feb 2025 14:19:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWfXeUKY5TGjmfDVtm0hQLkms3/JDpcHJ4NEEqTrtvlp1qEKic+lpSd70G0o/+Q2nSz8QoEWog5ERbF2g==@linaro.org
X-Google-Smtp-Source: AGHT+IHPZuTG4NmKPUGkU7T5iP5+8UxhZsau4ufIIZk1TdeY2hI3pRWL4bo3FsvXobLXYUCK5ht0
X-Received: by 2002:a05:6214:240b:b0:6e4:29c0:fede with SMTP id 6a1803df08f44-6e4455c92fbmr257564256d6.8.1739225990966;
        Mon, 10 Feb 2025 14:19:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739225990; cv=none;
        d=google.com; s=arc-20240605;
        b=DiH7xmfyvqp7KtWKa0hUPh6Nwlzpqdx8B4OIalNpoJbgebbkMq3SowZXGcXOQtth1W
         3+YCqLwaxBAub7I+ZWz8YbMUlYUHW1271UVaUb/d+tAMu7wqwzMxEU7a6x3y/CO1j/ee
         lP68IGab/AHZRDfqvQhvT/rT0iwIOe/E+Cw1xCTPfAKiiU4uSYQtAQdIwr6QOjEUeJgn
         vG8ejfLJrR322iiMYLLgUh2qm/eafNe4IhvMIKnrf3dQFYKdRqmFSppUNbWvF0R8M6iF
         sY8fyMt6bHooe2HaGPaUDy+BBza2PD38vWwd+FY3p5Yl5ZWrOCVkkadDF/MGktoGnXe8
         X8XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JDxBZK6Uwmmy6x9bVQ84rL6dLFuW3LmWDIvF2j0Y5U8=;
        fh=ImdudELOPqSMYFjgUWjnQPudtws+JWL3scSGorbMe18=;
        b=UpVGkzu2XJz/SY60a9SoJqyeuo4Qaab6gK06YQbYETS87zNMmdMHdKlOa04q6hz9qz
         yUj27DtBi+jIi2cnOdLkjqZP0h4txj3hNbQ1HRGmYl3+ddV7KnVO5egbTbcVNBv7+0wo
         AIRvInyQqjGX84OLWvT9QOJwJNnjXxcNJ0Yn8Df1v6x+Z2ipu0uBTj9ZMAx9VGRn5s9b
         yugQ+CPUl1AiEBSezXcR2XL8Mab9ukRG3z2FGkqKYBlD4sjNNalupiZ/s+tzOvLQojPj
         rGiSXXS04W/BDNbh0MpID/oOwrQRcpGVDT0gfiIjyHFfAqO/bLh5SgFtWZ30RznxsYE+
         TS/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oztYU0VC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4717965966asi57028121cf.429.2025.02.10.14.19.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 14:19:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oztYU0VC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thc7S-0002IW-DW; Mon, 10 Feb 2025 17:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thc7G-0001n8-B3
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 17:19:01 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thc7D-0002rJ-T7
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 17:18:58 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so11382715e9.0
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 14:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739225933; x=1739830733; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JDxBZK6Uwmmy6x9bVQ84rL6dLFuW3LmWDIvF2j0Y5U8=;
 b=oztYU0VCeQXJ23Fhcy0Rm7sq5gGDJoSMFcjklO4kZZevAOqp88TecmvHIhMbs6eLCm
 85ZtDgSC9yIfyVau3CfQ8ms9rOCK+U4B77tybIjfA11sNN13kIkJ3l1sY8hnYZtTlmgK
 L/bWdyrq/CDRPBSRp4UtjFjfSQdr3bDF2HTg+5zsFHksfzlr4YsODbhzX3bAlM8AZ9jG
 04W+6Yk6t/blm+T6Z/qvnkkddbgNIh+emFMZcZyg1PZX14hYz5A+y0G60IVDaVz3gwWI
 w3hKOZ5WyWTUn+d+piu6E0qRLc2UZ61Pb7y5nfB4Unmr4bhkiLOR2ubwI6/1qct9M+Ug
 slKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739225933; x=1739830733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JDxBZK6Uwmmy6x9bVQ84rL6dLFuW3LmWDIvF2j0Y5U8=;
 b=AQhMYm4shroL+VX9c38Ooq+v1CE170WCCh1O9p2CXWAiMTtJCoSdB5yMIPthTNlSKX
 7F7+h0kPhI/q9ZoFEMRmZGCpr5PJixlqJAd6mofTj5KA8dVt0gUOhiLL6pPjVmFFOMl4
 5tc+3eZEtyTf932OCUbm+AYwFNNV+98ZWMbQ2HxUVb8ro4zV/lyYxgrGpWmi+Ns/h08L
 ugK+RKj873wK8N7nidR5rlv6IjE5UZ3huAHg/rFaRo77w549VLZKQCYQPxU8dZWvKaNo
 Se4e/YsraWEZ+zA3EG4uFUzvzoEISpNZNTxZrc+iFxfGwGnhmge0yY0kdu0FBdcFMgt9
 TH2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzEzli0pf5wZsF3LoRR11gNKuv3+iMagYPiFWXj4f5M3VY3CKs5Ca0/vh1FtPgKvf5OQL9zNwZqA==@nongnu.org
X-Gm-Message-State: AOJu0YwqROeRdBMD6JZCJNFtA0rIXL6B0DFBM3Yl9SPgAr/fs2w9TNq+
 QuQhipJLIK3QLXrcivVHn0aGJi2SY4IlOpNFB2CEG0RPOvKL0AFetgZ0Opu2BJw=
X-Gm-Gg: ASbGnct0dUo2ydH/QwaorAMgbw8uHG+UOL8HuiFeXGU3Qrd77uL2NGMS9TJGiBN8F5i
 57UPb8jgsDO8Vav22gXPpnFbYvVS2L2h30RjlkrZqAgiVQ30nCUjdI2CfeDJ1Asx55Z3zlyBILD
 ruITVojOUTdhKGP66/WCPKuGIfws29mGM7kCZo+tWJ/Kilaf9SOHKTwLiEA8/P+9SFih+8o8V0t
 jCVpT+66+4crNPI+vNDT9wNYSCsxL4Q7oAm2kkKm8DsNEEYt0ocZdHEMvO6oLITNv3sokRX5tsR
 yvYbIIk+yNFJctQI5Ff3bQ7CL84Q0+uoOjrKq/efWkYm8O4IR/9UI7gUlI8uByNLJw==
X-Received: by 2002:a05:6000:178c:b0:38d:dd8c:5199 with SMTP id
 ffacd0b85a97d-38ddd8c56c7mr5461989f8f.24.1739225933255; 
 Mon, 10 Feb 2025 14:18:53 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd295200asm8134874f8f.44.2025.02.10.14.18.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 14:18:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 04/10] target/microblaze: Set disassemble_info::endian
 value in disas_set_info
Date: Mon, 10 Feb 2025 23:18:24 +0100
Message-ID: <20250210221830.69129-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210221830.69129-1-philmd@linaro.org>
References: <20250210221830.69129-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: 6xJwfK5v4B9B

Have the CPUClass::disas_set_info() callback set the
disassemble_info::endian field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 13d194cef88..d5ee1244cad 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -224,6 +224,8 @@ static void mb_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
     info->mach = bfd_arch_microblaze;
     info->print_insn = print_insn_microblaze;
+    info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_BIG
+                                     : BFD_ENDIAN_LITTLE;
 }
 
 static void mb_cpu_realizefn(DeviceState *dev, Error **errp)
-- 
2.47.1


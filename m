Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2230615njb;
        Mon, 10 Feb 2025 13:32:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWTrYJF4AKcMoKd+hodhM7QNzcb4ucePaM1CgGDIeWr2kiFjVy85xHJ1t7lSCpWsEwgt/+9Dvnvho4YSw==@linaro.org
X-Google-Smtp-Source: AGHT+IGyVThYohk8f9Q/RfLmRDEoM63Y03YWoVOjKIeRbIOI3TuuX1Rc7npfBKjOVGEpwGFTEjnZ
X-Received: by 2002:ac8:7d4b:0:b0:471:9f06:aebe with SMTP id d75a77b69052e-4719f06b01fmr35484291cf.41.1739223174129;
        Mon, 10 Feb 2025 13:32:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739223174; cv=none;
        d=google.com; s=arc-20240605;
        b=bEGZcuYBch4kZ0tPrI82iXfhF65Cg1Q0bAzzVyqyfI4iMN+jcbax3RcKn6fOuX9TNZ
         JfIIe295XwqrmhvuLRqc4ufoCR83q/Utd6OMI+GAZ0XfbLXaMcfdbWj0Fn76wHsDCKRe
         FKypErOKw8r0uAFM2zzhiMZYa6ortxxep3VDLmQxBfCr5RzBAZ2elLafE92i5kdFFaSD
         raXE/IM4LKJG78K9+p2uRUwVbqR1DGCiRG98ejFN+PyZcrjGLdNq/2gjbrgCRTwF6iWu
         AwsyRLF6aLziF6CxTkzreaG0WRUSecXS5WpWw0tdqAYKyx/tIvPMTeqWuD8S83k7Oxx+
         VcIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LstW3Dp8wkhRDMPLlcZPAPERKl2k3gDe4YnYzMJVkXE=;
        fh=8sgnA2Yy6CxZp3bQO4Na2CfH+dM5LmwU0YDK4qKYilk=;
        b=jOjLdKq+15VEAoYllZzUYsLyXJAeDnPbRPHbDEkmwyOXyPsE/eCUGl+tjCOMEcm4Tj
         /e1KOXNO2SZkKlNNM/fzFbU+06UW8b7Rpa+hXwCoZRg0gTYLDdAnd13PFhihz9OKhAiq
         3woXOZrEqTpPynSkEgAGKGhvRBUKwHZ5GzGJe2lW2KG7+ARLVetfm/Ef/AZyEdveo4mN
         DSbx2B9tZo/eEJ9kp496Rfe1KKizHnYW7noFnWX2pNP7NaEQIgzNZMflHO+39ncZCeEs
         wmeb6SpdEex343iji9TNSti/x4QX7PjnbVG4H8sLqu92BqRpKBvOfy5vsMdgshOF1PZD
         k1Vw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AHuujSzT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4718c4ca71dsi36294551cf.280.2025.02.10.13.32.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 13:32:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AHuujSzT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thbMb-0004pd-6F; Mon, 10 Feb 2025 16:30:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbMI-0004R9-3b
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 16:30:40 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbMF-0002Ut-Vj
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 16:30:25 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-38dc660b56cso3742580f8f.0
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 13:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739223022; x=1739827822; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LstW3Dp8wkhRDMPLlcZPAPERKl2k3gDe4YnYzMJVkXE=;
 b=AHuujSzT/vIc03J7vcPjIbWL5sK+jSW/DyV/WXxknilZ/ltsSpWanjW8c9zmu0k6rr
 A5tptiAOhQA+NTc6adnBnGXQjfbX6T1Qxpo3NxTTCvi3vZZ5RYEb5+7OLNPjeoifoR9x
 /tmPaUg9GL7iDodVE2aK/xCS9FvOVOIJnvseb27QQg0GNEaT6nIfnMpR8mtC9Y8cp4uK
 0hwAPkwX/Gi+VZmJ7OCC70vOkjCJ836+McK03aoOkuk8qjjdYb/d+bjLp45Oo6/v3z3n
 yKtqbG9ensAnuc0nZ7INbPCmImFYJ5juXL+uFcdXQtRIJxF+F8PHGnvsB0f83CgcWu7C
 A3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739223022; x=1739827822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LstW3Dp8wkhRDMPLlcZPAPERKl2k3gDe4YnYzMJVkXE=;
 b=XRLUA1ecnXDnrV4wcLKST/9vjUA+Ddj4GfhleSMop4QsHdtEbs2VFuRkTP6nH31DhG
 PqdQuctPVB7KlOY+VfL5O7oUEG1QGsQeix5ByJ2qECvJxNhqX4TJ26/VdIkH9QDMFU3+
 gVMWlPd5f3apsP6CEOG1LBns6eRq3YeZoaijAyoFpGDzqSLfVLIjZG1u8/s4kB0KeE4o
 9J5BAKdMDjdwe+0X1Jx8H41if4SgwjNXpquVeEyxnmTTAduC+rf14aKubFnIRdQN9bJR
 NO9hpmS/A/rY0m1q3kC0lS4PLC/DS2eDm/EbsAI0QtMRrHqzWqPyn368k980JiUXPGVi
 y7Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCU782COKD7VgPiotcFlbGOR8fqbJKkg/nl34Avd27w1mXFMtKirpapj3gKuxI+wJAtlgnlw8C0Smw==@nongnu.org
X-Gm-Message-State: AOJu0YwUalhoImPckPoCTWa9UrjmSIZ8z4a1CdgoOOx86d7VyWL6f2C9
 dNewNFaZprc8N9Ed2ZNHkM7X901xm0LEaN/xTx6cE+6Y3Jp30TWdv3Xl+veYgnI=
X-Gm-Gg: ASbGncs38w3t5kSXpG3NCBZqRbJtqcJSYLdmgU+Hrw+DYXM06uD7559IItDKUaIu9Im
 tr+gyY3eoQ9ts8uH2MZx4LPXQQ0ZIYYcg1kl1WyRuxaJqrIVETUnuleZ3hE4J9xbrif+xV7gR5E
 N8b5BCEJ9LuDL1ThAcKd8IUQgYdVmxldOaHcC7cGT5iuZUz2UdoEbhBSCvQFIuVzp2j/3JnxFo2
 2lTp1ACuNXpWh2iSeJrCaBt9j4hqgYxS9PPRxshTIsGEL3SZOrcHHQiBSRcZZgXaO+hLtEwkrVX
 nphWyvR3APk6c1VDsFxLRByb+SR0kQNllN8RUMYkzq5cpMpz+QUCfiEXEOspEmqEyw==
X-Received: by 2002:a5d:47a6:0:b0:38d:d9e4:9ba6 with SMTP id
 ffacd0b85a97d-38dd9e49c91mr6523185f8f.3.1739223021731; 
 Mon, 10 Feb 2025 13:30:21 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf7dbcsm193931685e9.30.2025.02.10.13.30.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 13:30:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 09/10] target/xtensa: Set disassemble_info::endian value in
 disas_set_info()
Date: Mon, 10 Feb 2025 22:29:29 +0100
Message-ID: <20250210212931.62401-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210212931.62401-1-philmd@linaro.org>
References: <20250210212931.62401-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: QeBRQf3L8mtd

Have the CPUClass::disas_set_info() callback set the
disassemble_info::endian field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 target/xtensa/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index efbfe73fcfb..bc170dbb5cc 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -159,6 +159,11 @@ static void xtensa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
 
     info->private_data = cpu->env.config->isa;
     info->print_insn = print_insn_xtensa;
+#if TARGET_BIG_ENDIAN
+    info->endian = BFD_ENDIAN_BIG;
+#else
+    info->endian = BFD_ENDIAN_LITTLE;
+#endif
 }
 
 static void xtensa_cpu_realizefn(DeviceState *dev, Error **errp)
-- 
2.47.1


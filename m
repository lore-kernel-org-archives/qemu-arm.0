Received: by 2002:a05:7022:639b:b0:92:a90b:6588 with SMTP id q27csp155915dlq;
        Tue, 21 Jan 2025 06:30:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWFsDuJqBfnGYvOppSMrcTmpYY0gN+RHpl1zLHkpPnuOEe6KtRpqevYQsC+/GOJxC/E4xryP3AkUxLQgw==@linaro.org
X-Google-Smtp-Source: AGHT+IHy/OiHOI9o0eN7Ezt7C9HXD4v1GYN5McA06YRud7ZRg+hWlmhLhf4+cTlrKVbm3C6Kk7f8
X-Received: by 2002:a05:6102:50aa:b0:4b2:bc6b:c73c with SMTP id ada2fe7eead31-4b669f373eamr20529039137.6.1737469810336;
        Tue, 21 Jan 2025 06:30:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737469810; cv=none;
        d=google.com; s=arc-20240605;
        b=LwmubcEN1rbxFuN6Q/iri0SvK62bhBFPTVbIk6Hprd3CoIq5m2wYIKPaQpgJm4pOd2
         TPPdcDBo8xirqCwtBzJ73iiYa+rIQgufeCMbx+Blr8O/lcFb7RAPOzIDFYjXMoIN+ott
         A6/ML5tddT3qbPG/BLsJAYXv1wyAGTYYC3TGw9aGzU5iGFKjXKW77N+FMlHX0y0vUYf/
         OjTvQ8teJswa9wwlOwx9H+mKdtYBMEnbJjSJBxfRglboH49i8N857UMW3zG9anCzvEMn
         kHKTaU9QdJ2k1tajpPAezAHPHeiKP3kwzZcbTxPjZuhJuDCOtDfqQs47OJMmQxeSR1zs
         Rywg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PSfO83fjWsnWHDr8uFKNeFyF3V9Fa6fmQk5hnrhkQ0M=;
        fh=T9nLPmYdz8kSl8qI33evWuh/VVTqN+U2Q3T/ETy8raQ=;
        b=eR9/hddlHKzooN0+QWshtTxf8DAK2QZzbqH6wrtkM42i5vtmMuUOwVB63/aOjT9yMV
         RnQPWhiW755JzrMltjwzA/yIih6xohRHaoqRqJI1LpKCxsvi/5pjNJwF2HWFVvSdPab/
         7lRXAq4ISbiP+j5roUQX82ESKbSVqJHHY06NL7sGLJhmp+GOBfbBIc94seWS+foit3Jm
         KjEaSopbevBkbqf+Ii8vlYaKZthN/fx34S8ZRyT4cVxcITrjqNHjKDtoSPoqJqlg2hN9
         zNoHNoq/j7IHyuY2g9WLTbDiM2Dx6VP4YP75XSSSsYKOQM9sIW7EYfcYNthJl3sdgwBq
         CjKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NzEyyoU/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b68a34efbbsi3577090137.576.2025.01.21.06.30.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 06:30:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NzEyyoU/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1taFEA-0005wO-2J; Tue, 21 Jan 2025 09:27:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFCC-0002Mm-Vz
 for qemu-devel@nongnu.org; Tue, 21 Jan 2025 09:25:41 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFC9-0003Yw-Lw
 for qemu-devel@nongnu.org; Tue, 21 Jan 2025 09:25:35 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4361815b96cso39945625e9.1
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2025 06:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469524; x=1738074324; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PSfO83fjWsnWHDr8uFKNeFyF3V9Fa6fmQk5hnrhkQ0M=;
 b=NzEyyoU/CLnm9tCPLVy9tDhBvVwSgt0VJVmvzQDqVAPqq5ecjcgwkIlYt2HpyhaEJ/
 0vBpH9TvtpmGTcqpynsL18PqrMaZVEwJ4J9TkTZxA2k+X9ZBoSdqOEbsmhxpxHU034Wz
 Rb6bLQm9EWQWED+s95MqeVPY1xRofiuJ7tyn2rYxjpGJ9+5eILJmbU9vAI6RrxdSVORR
 5IhrdFEgpTguhS6OFXlS3rxyCZ+89ocvaWYPtVji+peoFAuIP70Zhe8WW2rNb8DrkRSy
 d1cSZFP2wNEc/kL3FaSk49BnK91KesgvX/JM2RshPC9562xVrK+dscDXad85/dfIN5Hg
 9uRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469524; x=1738074324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PSfO83fjWsnWHDr8uFKNeFyF3V9Fa6fmQk5hnrhkQ0M=;
 b=AKM6+gS5EOmJJ7lEPPtaAcXWxcFoChXdooLI4iCEf1cNkMgzq1xOKXd5krtUC2Yn5t
 B1Vmlj+hXPlU05UtyiEvneicogAtZ6t/KR64NC9u9TswRTtorM0DOkVcOaQtE/IkZ6aV
 BTHWV+GjvNmwlhBa4tMc/nBiipwl0udgInNj4p3mwGONBzPlJqYOrAgJqiSXewl9Xlu1
 VxiIHTfdYkzXnB3xOVAJTb3R15gH657gT0GSPA6RYbRMjU+YxB5znf3ubU6JYCpSezlh
 g4njwrVc0ZhOECMu3a0lT4NJsWwVbFL4S+u2UbKEdPZaH/JiZ6aW0h7CK3RfAE+RuYNC
 8q/Q==
X-Gm-Message-State: AOJu0Yz0KjT4yU+0UIBhgdHPNeKDrExYvRWiy/cPJClQ3v40rpIINju4
 V1VXZszpXjYXiyCm+/06htDjLHJWdZ52DPME2pd/weIcizdmKmHzGmrJseab1FulE1b9PYFLEjS
 D3Us=
X-Gm-Gg: ASbGncvkRtiUqLouKRcwhyro2hyGZsVVqvpzUthIDus7s8raJ8QCyU7CJfIuRbcxlyO
 jSRI24uf7W+UrAFtUkCUXBTH+37Jca1/FF5hCCC686FEBRqAoXIPNWtTyrfP6q5fFYvY3UgxRCD
 Sj0yz+uivncmgF2DOzXY8KaEYzeyatJbHmWYPd4nCeo29RjtZxitGs42FaHZnJUhTBeJixBD2oD
 QGTkkjZcrDNZUP72lB3UF5f8HOP70tFJelvkX3D/9cuo6XBqb0TnqMQdKmV0xsvBgJ/IkxHMRKI
 BAzP4z3KP3f45EkM03Qs5/2WEBNP/ctJiXqJfEXpeo1D
X-Received: by 2002:a05:600c:4e0c:b0:434:a802:e9b2 with SMTP id
 5b1f17b1804b1-438913bd972mr157194245e9.4.1737469523913; 
 Tue, 21 Jan 2025 06:25:23 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf32221a8sm13684934f8f.37.2025.01.21.06.25.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:25:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 21/28] target/rx: Move has_work() from CPUClass to SysemuCPUOps
Date: Tue, 21 Jan 2025 15:23:34 +0100
Message-ID: <20250121142341.17001-22-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: A1VV0iiZCFIF

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/rx/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index aa310bd6144..79b95090e7a 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -187,6 +187,7 @@ static void rx_cpu_init(Object *obj)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps rx_sysemu_ops = {
+    .has_work = rx_cpu_has_work,
     .get_phys_page_debug = rx_cpu_get_phys_page_debug,
 };
 
@@ -217,7 +218,6 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
                                        &rcc->parent_phases);
 
     cc->class_by_name = rx_cpu_class_by_name;
-    cc->has_work = rx_cpu_has_work;
     cc->mmu_index = riscv_cpu_mmu_index;
     cc->dump_state = rx_cpu_dump_state;
     cc->set_pc = rx_cpu_set_pc;
-- 
2.47.1


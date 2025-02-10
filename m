Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2230694njb;
        Mon, 10 Feb 2025 13:33:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVl7NNT+euwbblHAERy+OgsU3VBlzMKie6t44vH3vk2LRUpXJv8F1+ZdWwvnGBGsd43cdzl3UyHjciEJg==@linaro.org
X-Google-Smtp-Source: AGHT+IHAyZf56Hs5RLos28OUss9AIzEQyiHGGUtLC83mSbbdrcaBIvzU8Dv1I+YbODWLLqcAo6xM
X-Received: by 2002:a05:6214:1d24:b0:6d8:92c9:12a0 with SMTP id 6a1803df08f44-6e445729f9bmr205990246d6.44.1739223184069;
        Mon, 10 Feb 2025 13:33:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739223184; cv=none;
        d=google.com; s=arc-20240605;
        b=lo4MtNtvxj5ZXrxiGeWAJo/LjVTnY5cCnWqsmAd6dN6NUdusZxtyZJhzla6EmtziHr
         c4reQJy6/Iuxe+Gcrp8DH6gw54kgkJ5u+UXPDB1Y0UJBJ16u+J4GM5MXEQJRNaYQbmhV
         Z03l4/jzlUKFQNjTwYuVsfQds41u4l2HSQNydnvFPTg0iZ8K4wzsLZFvBDlsmuF0wPlB
         RRya/VV3cfUtY/k0g7fcNW+4Kok2aahj+bb0rqk2mit7C9tRwKGqF4gmfCYwuavRv1e6
         9aUzuyfRW3Haozuhv6L8h2lEVuPRk1fnLfY3/Vp2f76gwjxwDB0PhXa63KNAnqYRj9PD
         UzSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6TcZHkuWys2mgVq8GL0a6AId6axol/O+ywSBYt05fm4=;
        fh=ecaXIhCld5m8Y0VRAjZ7P4ylAGhVaCBFM6GmkciKwh4=;
        b=jVXsOyAxUYGxW//38Nz3IhpGjRumx9cgYgRapymBNJlzbunQH+Ru4qmRiUN0Q1+pI+
         PoNy8viuK3xfGfRD4Rqnocc9GbyW/SDPhCRraMWEWWTN1HtAcgPzY9zJBs/EpHXAnEf+
         F5E1TgtQ1YBt95r3cpIQbunxW+EPTrBilQc/I6ZdVrwjbhubMo5a2XCGgtoKUIycrZOx
         XKaskUaOnlsu7BM0wEBTbxBpxvPS14wqzQN/rpqWF/lp20O19EvRsqzxWDi6rC0PPY3n
         c83VVx4vaVuSbNfs+kAwzT31i1qia8gRhVpascFZFvRznBxY3enFuqvJluGvkqllEdnG
         FOnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x3rQpBQ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e44b0ed93fsi75586736d6.120.2025.02.10.13.33.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 13:33:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x3rQpBQ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thbM1-000492-Q4; Mon, 10 Feb 2025 16:30:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbM0-00046J-Jk
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 16:30:08 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbLx-0002Qh-JD
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 16:30:08 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so11930055e9.3
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 13:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739223004; x=1739827804; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6TcZHkuWys2mgVq8GL0a6AId6axol/O+ywSBYt05fm4=;
 b=x3rQpBQ0c+TrEIT7+Hy0zDViNuJ7ynH5fMQEwrLIfl5D1yMS/wtOcifDbxaItyj91b
 GWdvbAe//aV6WJATfyo2O9rBraL9as/S24IaherGCX0Xiw7sXjVcNpsHcISYjlYcBd11
 qYYifXc3lIV9ASC5LO95TmCvRqWp8cAiBqAvzHihEsvEDwOLlf4diizljBLOnAfZwJhp
 VTgCWVI/d2L1+X186O/NkAgYcLABFDo0Pssy41B6tgq+UCEN8vo+HmUY/bwO/UcD0m2o
 7j03OFIWmtg2RblczMAr8bmm3uFNwX9pAOkojEqiYvEbg8Z69znErj94JnY0wsQHvec6
 6rYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739223004; x=1739827804;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6TcZHkuWys2mgVq8GL0a6AId6axol/O+ywSBYt05fm4=;
 b=iO1pciNG43llMN97a6jSm/DslZjL50vrovrCOxCpmVuQKxI4JM4fabQUeogp42VYvm
 b7qGMlHgW5W46vJkDdUq1fhJXnavp3iTGOcAhStT0nIXcm48h6P3+ZG7i5KKkijoxONG
 pYiTn3L3v8JLMo92Wqdrxrpv/wqgpUe1ccKAuieQHUtTOrpWgzfmuyBxt7rq2qZQNNhX
 GrMFUyswZ8TJtwxgtQ1HhKoS1b9oSJLYaov/fsGOHXdkAsfByIM9vZeF/QowcxEMYKjZ
 ZNtpYQvoJGAOTJGy++y4luJPXXvP00+qeOJhYVALTTnonMkOC+7Sl2HMPSg3aDF0NYmU
 RqZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeTZsXdmlonJ4eqfiOMelXPSStZLZUmukIsBFrvvzPMpYoqaoNT7U/TpgqPKEH+AUOchXiKfa4Ag==@nongnu.org
X-Gm-Message-State: AOJu0YxZNO/9ULMAgR1+Kkq3gSlsVZAWQvSG+ilgo7nD2gQ/YWPnAXSL
 kq/lwerKb7Cu6HdDMm3ES2zJEOp7qtkMs5ixmRCo7/iFl2dR/MPMRWSqIdjaJeg=
X-Gm-Gg: ASbGncvtaS+VMltVh3gCqa+ThZ86m+2yidKcnJ2VGHBhIRM7Q10lcYzmyHYyv8q+8vp
 JtII1e9POtQzSIfV05hhqZA7TI8hakZK8c70rDqFYcSK51eaxRnlp63AG+i7aozXbXfqo8uFng0
 bQqUtynit/95y9A08+Ja59Beoy/1rF0adslwNJd4nC5NqXEVdaGTEtBSeyRfY3JIChXqUKIyJAc
 TvHrChgHb3wwlyTuSLiQZXd4zXAvOzvrIEwCVi6o1oFNozJrgufXax/L/pxHfuCUsc22ZjsG6Xz
 3UQynT3/bMxBbfn/lgBqjJiCWGxe6vGn6e4JFL6J3eoP1Cn7I0T6we38b7BeQdP6Hg==
X-Received: by 2002:a5d:64a9:0:b0:385:ef39:6cd5 with SMTP id
 ffacd0b85a97d-38de416d70fmr1012371f8f.1.1739223004112; 
 Mon, 10 Feb 2025 13:30:04 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcd34a39esm10092759f8f.30.2025.02.10.13.30.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 13:30:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 06/10] target/ppc: Set disassemble_info::endian value in
 disas_set_info()
Date: Mon, 10 Feb 2025 22:29:26 +0100
Message-ID: <20250210212931.62401-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210212931.62401-1-philmd@linaro.org>
References: <20250210212931.62401-1-philmd@linaro.org>
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
X-TUID: EexKQj7qujKa

Have the CPUClass::disas_set_info() callback always set\
the disassemble_info::endian field.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/cpu_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 25e835d65e7..e816d30114b 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7398,6 +7398,8 @@ static void ppc_disas_set_info(CPUState *cs, disassemble_info *info)
 
     if ((env->hflags >> MSR_LE) & 1) {
         info->endian = BFD_ENDIAN_LITTLE;
+    } else {
+        info->endian = BFD_ENDIAN_BIG;
     }
     info->mach = env->bfd_mach;
     if (!env->bfd_mach) {
-- 
2.47.1


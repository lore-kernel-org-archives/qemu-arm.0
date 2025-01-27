Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2371200njk;
        Mon, 27 Jan 2025 03:39:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUjkTkNb6I0AiusO4BrT+RVaD2SSW3nHpMK5VGqCkmKZaXb4/mNazdBp7fzQnnbySDzyGo2DmcR1zpt7g==@linaro.org
X-Google-Smtp-Source: AGHT+IGslcLT3TK2u6dQZZvJhgZGK/pIccjpqPUHx8lKOrgzrkRqwXmUa2giscbMCTyuuiWl1lrH
X-Received: by 2002:a05:622a:1314:b0:46d:faa2:b6dd with SMTP id d75a77b69052e-46e12a627a9mr637846331cf.14.1737977982321;
        Mon, 27 Jan 2025 03:39:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737977982; cv=none;
        d=google.com; s=arc-20240605;
        b=IHkwTE4QmWAUgsC5FtOjlKJdJKqDlV1C8piKd3he0Eyk1UKrFGl2qI1IbNqp+Gc6Vt
         j4sCyc+53aMHizavthP70YqK5tD8px4iFplGd3+zKL5yWnjMq2b35kmQLGvn1d3hZMNa
         FXeNIuRKKWvy4BJafQ6lQH/16/QhwVhW02aHG9/6qSVk5SMoamMvBhSEsdJfOQUEaui+
         8Ac3EFEBCR9xWBpdJVCBzO13T6hn4DHNnRHs+E9t0HkGO3BssSkdUYZ+SWRnk22l1yRu
         d2D/EKAAgLB2skBCMQC+F71MA7UYJZCtt5A5cYJ4fuit1VXoTEMD6nkX170XCGxO+zV2
         ovNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+P4muHO2/Kjut6DQxBAs5VxofoUUFgPuTxOuR706kfs=;
        fh=nTj08K2Hq5weUBHsNsqSMy3CkMqm3wti1yKeq+rNqBI=;
        b=YeIXWztgz2dHdbBAAPUJwmMXr0yJNNCuWLxZ9LgaoUc2+ALHh1Zj9K/EnP+bLlyU+q
         +5fR5DUR+hXG9tpO1ng3e0H+8TnQlqHgXLFB2JVvzuNrPpC02zccyP0nLxON6zkoLb6g
         W6L42z0i97JQUOAI83Dy9LFy9tjb50mMqTsq+QHdBJwDZhZ2f+y8Aux9qIYHHq1H+1PV
         Kgn7RUuqEyTXF8qrn/5f3DBOcVF4LGfEZkc0sS5Z5rdTXaUrJ77up/4ATKZ3SxTwtapQ
         yVFJS/9DLLOl+X/e2Z3BF/R6IFiJ8N9DIx2xFHXQWyY9lR+9ZqV15Wj7VBdSA0SsJhfI
         2erQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HE4ChrrW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66887a96si101628481cf.159.2025.01.27.03.39.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 03:39:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HE4ChrrW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tcNRy-0005tf-G1; Mon, 27 Jan 2025 06:38:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNRs-0005q9-32
 for qemu-devel@nongnu.org; Mon, 27 Jan 2025 06:38:36 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNRp-0005Ax-9W
 for qemu-devel@nongnu.org; Mon, 27 Jan 2025 06:38:35 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4361f65ca01so45972885e9.1
 for <qemu-devel@nongnu.org>; Mon, 27 Jan 2025 03:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737977911; x=1738582711; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+P4muHO2/Kjut6DQxBAs5VxofoUUFgPuTxOuR706kfs=;
 b=HE4ChrrW92g4g4APx2TtzUmoai3+KElocaEWRvUhgHSv34AU2p3jmImS1AZ8Bi9UzL
 Y/EyINX2xzf5x5p538Y+wNABNlHQfrvAxCpv+Z0fHUMnfLKeUaZafY2t3sLUzHdRmWLy
 ltQbvINmXs5M/3bXumTMV9kqp5WJlLkeDg4xWuTA+IaBe4XVE0Ia5SDwVQBatLFa8CkK
 tYHYnvF9MsAKVWE1hFiRvKS6eSFIrVED3Hvk5CteHN/Jck3/r+j2ad5J7PBLCm23UCD6
 Y3V2ftp9DUwcLFkGTVwIG0x+0Juy9/TpUDTtyd0hlkC+0cltmK3QJ0XE+ReSq/gDxWcX
 BKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737977911; x=1738582711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+P4muHO2/Kjut6DQxBAs5VxofoUUFgPuTxOuR706kfs=;
 b=o89s4KPxT5BclqXIvTDVfmLtPCQxfI5RZVDmDYyJZuFh1RTOBT1aH3DtBoM9B66WLM
 0rciANVA8RjisVAhYjvVgwOMJQ1EsLnHCsme/Bu9Ages6Z8UTQBu15pang17xteTrNF1
 DHGbhRx/+6b+2VNQPBvnZVUkL2pNtMEMe5yxmJLwg//l4sIz4VMzE1b/CRiz/AOlfQ/V
 n1MAJoFEJe8cAh3JPn5v4chlDbM6vcSojhmjNYmom4kim7lvc52BalPJKHaLQMqIht5S
 LvhJIHNf+yH6X3ixz8qNxj/C7m7ZuxIrIzTzr0BN59Tz+EAgZGAOVxAdlnNDjX4NnYrW
 AlSw==
X-Gm-Message-State: AOJu0Yyi/kuUxQB9gF9YHNI3COeBL3TKDuWwZ3cYLzn7sN8ratEdH5Jh
 uskAnn4SOuPdP8udeAuGJy7h5bjNmiWF329Dxid12zBK9Oas3WhA8cbNqzbNK5AgDw93Uys8iqs
 DwYQ=
X-Gm-Gg: ASbGncs9Zdb/OQWEpeVMWtgdHuCQCGjYocWh6b50Z1dAEPxQPcheVVCfnP+6PMMkgd2
 lCb8sprqvFpnDOCZF2oFj0lHeg7cjYqGlJL+FEBk5462Y7hwTwgeqHnIoVuhNq2oiaaOtehTRqb
 5+9iMIjU4Yzo9o03J6wa0RetraMYwTTMgXmKz4V0OPthW4F1Ix9VvQNbri2pgz5aoNQj6OMEGs/
 tz9wTMAGA39HqDUanh/qtGnABqOPKE/GwjQsv3+RbbsrvDbRV5hzqro35O4Xf1XjkrNX/S8YpoR
 SSizveRegXe6flmsdocCU6J96/R9BEef9CagJLOE8qWo3MM9ymkr2EU=
X-Received: by 2002:a05:6000:4022:b0:38b:dbeb:63a2 with SMTP id
 ffacd0b85a97d-38bf57d2dc0mr34279427f8f.55.1737977911246; 
 Mon, 27 Jan 2025 03:38:31 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bb040sm10899923f8f.67.2025.01.27.03.38.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Jan 2025 03:38:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/6] hw/avr/boot: Replace load_elf_ram_sym() -> load_elf_as()
Date: Mon, 27 Jan 2025 12:38:19 +0100
Message-ID: <20250127113824.50177-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250127113824.50177-1-philmd@linaro.org>
References: <20250127113824.50177-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: pSLVkTFTGv9z

load_elf_ram_sym() with load_rom=true, sym_cb=NULL is
equivalent to load_elf_as(). Replace by the latter to
simplify.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/avr/boot.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/avr/boot.c b/hw/avr/boot.c
index 617f3a144c8..6a91dcd12d0 100644
--- a/hw/avr/boot.c
+++ b/hw/avr/boot.c
@@ -71,11 +71,9 @@ bool avr_load_firmware(AVRCPU *cpu, MachineState *ms,
         return false;
     }
 
-    bytes_loaded = load_elf_ram_sym(filename,
-                                    NULL, NULL, NULL,
-                                    &entry, NULL, NULL,
-                                    &e_flags, 0, EM_AVR, 0, 0,
-                                    NULL, true, NULL);
+    bytes_loaded = load_elf_as(filename, NULL, NULL, NULL,
+                               &entry, NULL, NULL,
+                               &e_flags, 0, EM_AVR, 0, 0, NULL);
     if (bytes_loaded >= 0) {
         /* If ELF file is provided, determine CPU type reading ELF e_flags. */
         const char *elf_cpu = avr_elf_e_flags_to_cpu_type(e_flags);
-- 
2.47.1


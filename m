Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2714955lfg;
        Mon, 2 Mar 2020 10:02:24 -0800 (PST)
X-Google-Smtp-Source: ADFU+vs9uAEnnUt2FOhAnBDu416OAM4DnZTdS6fnqLpS9T7kgTVQt21F555pcVkAtTqHpucHsxUu
X-Received: by 2002:a05:6214:20c:: with SMTP id i12mr616885qvt.48.1583172144695;
        Mon, 02 Mar 2020 10:02:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583172144; cv=none;
        d=google.com; s=arc-20160816;
        b=i46+EsPvq2yMzMVfALaaezLbuvVBafimTf8vaSuZhKw8vGT8TPs96NVqA1C5BVm2y7
         eQ7mwMeAhU/ayZi2DL8r0tDRCeWRctsy2uSo6RowRLJfgOW9wKHeLamUPWjFgx6dTv3S
         GqbIOjqBBi8HBTVwdyqq+rmNc6u71leiR0GaV7kzgwaRIuBfHa21Zm81u8X26VXAGlmH
         hc1ks78p/2s/5UgRQTefGCPIJz+jvPpu4mbT410Mij7sLaJv5UYhdwiOOjmSBhXPk/t5
         /xFBFhXXw8R2+CUJXXnSO7kJc6a4QkXZ2Xe8UOk4vHo9AecAfBmsMzeuML0891wttsZ4
         Mahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=d7ojpguKqQxB+IoLGq/8Ijh0sitkQS0XaFUwvCJstUc=;
        b=HR0v+wWmY5N+9UuoLdWIugMcJGV00kSQd8hISPukyDBsEDMrbI8148fGM/mUphnqTo
         iRe7h1k2MntblSdDxEPECQJHDF7+4j3eiDdt5pFnbYY5z3sxNd26L+x0cGDpkTgnAN7a
         Q7nzABnKsPuvEWro76+doXDF6RejNQei7ddN4YNSPfg75LkR06ptyP9Wzy0rMHpEDJA/
         LpFDWOSxZQH0y2831WzKuGP8juPWmNCGEPvdi2CgwRLCUBl9qrjpugqUNLPLSVnJKxop
         +JV1ZGkHeYNT/7PgWXnk1luJg8V1WjzIDzvoQXHQQ3X/8hywGAYvJtIHA/zmRlTsbPLs
         Df+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=siSkGF2u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m190si6392044qke.222.2020.03.02.10.02.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 10:02:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=siSkGF2u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8pOa-00054E-3o
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 13:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39057)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j8pKv-0006bd-7p
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:58:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j8pKu-0007Yo-9g
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:58:37 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:45855)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j8pKu-0007YP-48
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:58:36 -0500
Received: by mail-pf1-x442.google.com with SMTP id 2so68601pfg.12
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 09:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d7ojpguKqQxB+IoLGq/8Ijh0sitkQS0XaFUwvCJstUc=;
 b=siSkGF2uEuBihZ1McnyRVQqCM+ra63Wqu9PN0OsX+zuOrgtAsEvCCl3KKRSbabbRwi
 tpAqZEnbTXYh9548Qo/ibE0l/asAGCtiD1LiDAasZzVDccpLAnxU5QHIYvYVO/g1J8Cc
 3zAkVWuuDbrspDtXsjfPwOlQ32VcAcTRPe0Sqexe+80gTBIYgJ4SAXWMHZGgQKKf8Py1
 N0x4A1BL6x+N9tHw7N+ru+TsTiijZ9UJ9Jvo9DFOGuWAPTNMcNPAa2EhhyBR7Ctfv2wH
 yaeyz8vf9YXOv2lvdzSe2TTVE0Yw+hZ+2Oh5CZ9fDIUuC6nfIKq/RDlGubKT9S7WkDLV
 Q7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d7ojpguKqQxB+IoLGq/8Ijh0sitkQS0XaFUwvCJstUc=;
 b=g7nWlrJEEBkSL91Jk88+eRc1OHuohkIn9lJzh0QWgdc1jK/omM+T4CiUp7IGNfIkDE
 VfUrjwyWjrL+jkhGGRB3V+Clt4BQUaXPXAPdjSlKJf0YjGFkBr4GgOwGt9OrLN10rRcW
 hoe42A77c1V+pfTrjukyb8vtntVB4GoXYDP2x5l30j26gzUkjR6rMCfoTE8mlQUBmYzZ
 W0iiuI4qhRRbYpZ1X+fZYUMANr1hGaa9dO5m+EUGmTUmu7MBR9sZbYnhpVNcGoXYxUrU
 OFvw29ZptyLkkVwTpCjLyh7tXhZEZpp7qTB0XBsQMrmEoyvJFACkCkhhbmgZ9zu56JFk
 LzGA==
X-Gm-Message-State: ANhLgQ0a1ykJC4duVqV+66qbddCn64l33DsnnMgQOzW+sS9mGQ7ocXhH
 hCzJ7ZVr9Ndov5R0pFkoG5gGBA==
X-Received: by 2002:a63:ad0c:: with SMTP id g12mr111245pgf.228.1583171915183; 
 Mon, 02 Mar 2020 09:58:35 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id s18sm99510pjp.24.2020.03.02.09.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 09:58:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/9] target/arm: Introduce core_to_aa64_mmu_idx
Date: Mon,  2 Mar 2020 09:58:23 -0800
Message-Id: <20200302175829.2183-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200302175829.2183-1-richard.henderson@linaro.org>
References: <20200302175829.2183-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tgV05qQyLSEV

If by context we know that we're in AArch64 mode, we need not
test for M-profile when reconstructing the full ARMMMUIdx.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h     | 6 ++++++
 target/arm/translate-a64.c | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 9f96a2359f..e633aff36e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -783,6 +783,12 @@ static inline ARMMMUIdx core_to_arm_mmu_idx(CPUARMState *env, int mmu_idx)
     }
 }
 
+static inline ARMMMUIdx core_to_aa64_mmu_idx(int mmu_idx)
+{
+    /* AArch64 is always a-profile. */
+    return mmu_idx | ARM_MMU_IDX_A;
+}
+
 int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx);
 
 /*
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 579180af0a..c910a49b4e 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14300,7 +14300,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->condexec_mask = 0;
     dc->condexec_cond = 0;
     core_mmu_idx = FIELD_EX32(tb_flags, TBFLAG_ANY, MMUIDX);
-    dc->mmu_idx = core_to_arm_mmu_idx(env, core_mmu_idx);
+    dc->mmu_idx = core_to_aa64_mmu_idx(core_mmu_idx);
     dc->tbii = FIELD_EX32(tb_flags, TBFLAG_A64, TBII);
     dc->tbid = FIELD_EX32(tb_flags, TBFLAG_A64, TBID);
     dc->current_el = arm_mmu_idx_to_el(dc->mmu_idx);
-- 
2.20.1


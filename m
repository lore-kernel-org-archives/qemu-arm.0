Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8215335ejb;
        Wed, 4 Jan 2023 11:01:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuuicGClYxGWNm9WLKa+6p2c4+SGL/BdXw1MzuJHHYdyP4bufdZDH3S/7lpX2DrTeMf1rOe
X-Received: by 2002:a05:6102:374:b0:3cc:4907:cebe with SMTP id f20-20020a056102037400b003cc4907cebemr8746657vsa.13.1672858880111;
        Wed, 04 Jan 2023 11:01:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672858880; cv=none;
        d=google.com; s=arc-20160816;
        b=wEdQTcifHOtEd/cTBnCv9pivkUfxfYs8i7P7qPSTHp1Z80cz/R0Ak7uef4nesYV+jf
         /lpYl5e2gGw9d74yslrcBJ4T8dcMdNCBJKUWy1u9mFtFjRJ8PEgzyiX1V3r3HopdKbsv
         ptssB9HYuaJfVx2FHOzSfejyImNoifIuhaM+CO1FX9yBQFSjgN8/p/sJ2IrjJX5htx9d
         SG7GWppAKDe6borSAp0J5E0tilsXd4ZxTtGX0tNuD7uDSUeL6QAoYPyJQqgcMSTgdq2H
         f4dWC2DMBKX/qIkGGGRGwS39HJRFurqhepXA+Sl/a9dEsyteWF4sEhNIc/b5P/W+kigl
         yO7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=YvZMPcOUxmObQLWYm+QiH6r1q3TcpfTIRIDtyxjsal0=;
        b=e0MNTE4Abw5nl4PBST27+58NTCBlL5x9nwsiyK1QpNG9lN5Kbr7a2fiAOlvotufxbp
         3oL/in6vUiiHWuvKST2nA4YHI45oj23p30bGxo/+v1DmAeasF+LuoKQKPVLy1iJe7VFM
         rO+UZTBOUEvfGnvGpe/T+xuc1NuGQXAZ7lcAmSP0H17nTnD4SED3jI6/8fE0XX/aPwD+
         5B0OVlr6OtDXubtoe8KUVd0YOcXbBbMyvCRWAUrATilHSrIQDvcBn/rnM2Aars1h2Ejo
         oRPHkOygjd9QsjGe7xBn1gJnxc93kruDynB3X2aiRrg7nuBlxY55F0aVVGzcNJZsZyJk
         o8fQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R1BVcRgQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020a670403000000b003cb12ab2affsi3191511vse.337.2023.01.04.11.01.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Jan 2023 11:01:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R1BVcRgQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pD90e-0005lu-Hf; Wed, 04 Jan 2023 14:01:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pD90X-0005lE-DS
 for qemu-arm@nongnu.org; Wed, 04 Jan 2023 14:01:01 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pD90V-0003Q5-N0
 for qemu-arm@nongnu.org; Wed, 04 Jan 2023 14:01:01 -0500
Received: by mail-pf1-x434.google.com with SMTP id k19so15824309pfg.11
 for <qemu-arm@nongnu.org>; Wed, 04 Jan 2023 11:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YvZMPcOUxmObQLWYm+QiH6r1q3TcpfTIRIDtyxjsal0=;
 b=R1BVcRgQu65KrZGiPHDWrroBQJANQWHEuyw5bXDKqImTnHuDPEPuwECLqh6UitFgJA
 BmTtk706nicPvwsqV9M9nzfcw+GvCuXAgg9Pgw+W31IGTC1JzGIQd+UdGwwizjvEkGfG
 abaxKSrqeGnKfBNU6eHw/C7T1yxYK1lUcc8aJhIYrETupUGxWA+K6oV3qpRIwPabS8DM
 bgG66lAqTIzilrTw0l0/5nK3gdBOXBn2eVEERu0zbhNPfKI36nEElo96c9GPcUWq5i0B
 xQA3svruFFjhKNZWKDtSBxBHXK4kbRy2EFtK6F4C2I722knoPoIW0n+B9u82BaOWRPIB
 +ivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YvZMPcOUxmObQLWYm+QiH6r1q3TcpfTIRIDtyxjsal0=;
 b=mWRdBuUIpwCu1OGEGK7T45WsgAoklpgAmT+Ev8fiM9WC39NA3N7Lv1hsJQOnv/nZnu
 r829skEXi/9g8hT6v3mjNOKhY8ZHn6IFgGRXaKXNTv1GBM283NWpgHF4aOQ1wg7zNdSt
 kISvD2+oWCB5OOKx8VypbGBERWqeuPv1/SM6WYoHqLf3KzdupydBLRUX15y5Wm0PKaWG
 QJp3R+QIm3ylSLt/NHPWzn6EfzqADF5jbk7W/jLnwYr25kqZI2l5RKo+XnNCtXWrC2Ai
 JG1FoFVc/w1lwgV8NX2OPH+czniIs1IAAtUZut9ShD/S+bRQscXBNQ4z4TooGrrZn25M
 Mu/g==
X-Gm-Message-State: AFqh2kqC33hQjTTxw8Kbx18nAnqxYO5Dgdn2q1zzHl2tdgrkVZYqb04r
 dTeNeakE+iU6uX7KPD4AZ1B3ZQ==
X-Received: by 2002:aa7:955d:0:b0:582:d5e3:12a7 with SMTP id
 w29-20020aa7955d000000b00582d5e312a7mr5340627pfq.6.1672858858153; 
 Wed, 04 Jan 2023 11:00:58 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:92be:ce91:1417:6686])
 by smtp.gmail.com with ESMTPSA id
 w10-20020aa7954a000000b00581e6a72abfsm11066472pfq.5.2023.01.04.11.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 11:00:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	idan.horowitz@gmail.com,
	qemu-stable@nongnu.org
Subject: [PATCH] target/arm: Fix sve_probe_page
Date: Wed,  4 Jan 2023 11:00:56 -0800
Message-Id: <20230104190056.305143-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
X-TUID: QaE99iAU3tGx

Don't dereference CPUTLBEntryFull until we verify that
the page is valid.  Move the other user-only info field
updates after the valid check to match.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1412
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 1afeadf9c8..521fc9b969 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -5354,15 +5354,10 @@ bool sve_probe_page(SVEHostPage *info, bool nofault, CPUARMState *env,
 #ifdef CONFIG_USER_ONLY
     flags = probe_access_flags(env, addr, access_type, mmu_idx, nofault,
                                &info->host, retaddr);
-    memset(&info->attrs, 0, sizeof(info->attrs));
-    /* Require both ANON and MTE; see allocation_tag_mem(). */
-    info->tagged = (flags & PAGE_ANON) && (flags & PAGE_MTE);
 #else
     CPUTLBEntryFull *full;
     flags = probe_access_full(env, addr, access_type, mmu_idx, nofault,
                               &info->host, &full, retaddr);
-    info->attrs = full->attrs;
-    info->tagged = full->pte_attrs == 0xf0;
 #endif
     info->flags = flags;
 
@@ -5371,6 +5366,15 @@ bool sve_probe_page(SVEHostPage *info, bool nofault, CPUARMState *env,
         return false;
     }
 
+#ifdef CONFIG_USER_ONLY
+    memset(&info->attrs, 0, sizeof(info->attrs));
+    /* Require both ANON and MTE; see allocation_tag_mem(). */
+    info->tagged = (flags & PAGE_ANON) && (flags & PAGE_MTE);
+#else
+    info->attrs = full->attrs;
+    info->tagged = full->pte_attrs == 0xf0;
+#endif
+
     /* Ensure that info->host[] is relative to addr, not addr + mem_off. */
     info->host -= mem_off;
     return true;
-- 
2.34.1


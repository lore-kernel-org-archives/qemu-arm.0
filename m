Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2934182lfq;
        Mon, 11 Jan 2021 11:25:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOwcOMHijuXdYZ/AXOCXqYsWgL9LuGUv0vSD++nLjgqBBnYBYJDDXby3uokZzFCrK4F1sY
X-Received: by 2002:a25:bcc:: with SMTP id 195mr1997392ybl.273.1610393111255;
        Mon, 11 Jan 2021 11:25:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610393111; cv=none;
        d=google.com; s=arc-20160816;
        b=NzJmOTdmv6i1R3glUw+5RYgOFQvdGhRc9nfS8TqUF3xhXuk4wi2fEFMjw4Ij2oE52S
         pnPsct2Zv0eHKrVFU8QUfEjcB1olv57TiuLrgMW0ZeyDRLWJ+L7Fj1oKveh7L73ex8T4
         Z1B7v49jtZtsNiCDR18Kx/vdV6PPvPxLn/VNPaCkwZbhDikcS1gB04y+OQaEO+iA7WCb
         joMZPIw5ZfMF4mnDqdO3/j1RnUf8QlvcG/HH/jATkK9PetbkSMCFR1w+oHyyk6g2rU4G
         zkpIZAh22kdHCBSo29tIg4zbth6i1HyvY3L9mxRl2qpx2GvadVlIMoU9M7j5+MegPVpU
         hopw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SwH2WDpQXh+eCC+rwEcKb2gXwbMlbSUNldc2fkveHPU=;
        b=GD+M6KdWVrQBNlOmjbmhsFSu3vCfHm1y0at5sYoitn0MLhukWkC67Yb6sHrqn54jYp
         fTK4U2012+s6/YgP1sSb6x99XMAw0eXnaofBMIpvZG7b0doiFbextLqdhaSqlw+tDcfA
         QGzkdzfiQm0E3exZc8GiHQ1+Be2tO3t8+0Nwt+eR/V4UOWZIJfLmBivHlFOAwf98kGHz
         Jtm4UqzjoNR3Z8A74+2hTRbihQByfP0CLxlENEjrzbTLGBNmbGKonVtpKWuWj8ELBU0y
         z3LEksG0lXd/f+7HxrDHTsneI3Pu4x/+g5ikEU1ZnLPhIcyYORCeyTnhI4ZE5Zdc4P8E
         fE8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qW+gDlLY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x16si669765ybj.21.2021.01.11.11.25.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 11:25:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qW+gDlLY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz2oQ-0001JO-MO
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 14:25:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2S0-0006G0-KS
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:02:00 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:32856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Rv-0006Sk-Vd
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:02:00 -0500
Received: by mail-pl1-x635.google.com with SMTP id b8so1709plx.0
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 11:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SwH2WDpQXh+eCC+rwEcKb2gXwbMlbSUNldc2fkveHPU=;
 b=qW+gDlLYDqnGsyqsPA4A9Bp3DQWWdCWBxOieyOV2N5jkvMlz52Se2tGd+sp4NwAV7v
 yKoLEJDcRMWTsK0A/XTkj3D0IDAHKnzSXuY/PHDVKwWGJouwKnrS/n9c8t3rQCT440JN
 J1lf7eogwmL+qUaFujvvqskTiKGDaP5GKiCdYJzje7TrS7ioWNpEoe0t4vjN8jEi+3u8
 XyaJGMFODeC0qBr/fXFBlmjQF31s1IUCDpo8XQmBgz4uxHlFQj1EXUsswGbOWTMMAmGg
 NOzu7TgQDsfq7cN2ySix73rEeKlUneZbd3svPbd3M7AHVv+p/obZ3Az5sqjg0hDCpJ5G
 5AdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SwH2WDpQXh+eCC+rwEcKb2gXwbMlbSUNldc2fkveHPU=;
 b=bfZjOXSqRgw7QTuHrnjwPt5Rbwh3lhiwpZ8G4ju25JBUYdI720zO3Yfa1Sbw8fvAs6
 Z7MqF+JeewV2EijBTsE9FLf52wtQec5skPtmV+QdCe34auIaqUoYjnP5R+DIVvVrO4D9
 UoL/BBaGBvcvbb0zr9fjVzKhXYIW8qYTJoAoWGgfnm53JsM7zDCRRfFN7kF4pv1Hm24n
 WSum52alWBC89399SAQJ0LuYcRUEaz9eFOtOUWEa1bA+t+q9FrIXSc1bx+LYQOrTKHll
 hFZ8J9Qq1HpUGW6JzsjmdBQ/eGxRv6rHJtgZVr/OaqBUg15rZxFP5iQvioPLPKKxsRGv
 IKZQ==
X-Gm-Message-State: AOAM533FSfmCAn1g0gTEe+MkHuZFu/CTQRhaYFbqVr3d9wm4ltByUgIl
 GoxHwGIGGudTiTjAzrwPS5ZJow==
X-Received: by 2002:a17:90a:ead1:: with SMTP id
 ev17mr286171pjb.51.1610391704374; 
 Mon, 11 Jan 2021 11:01:44 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/30] target/arm: Enforce alignment for LDM/STM
Date: Mon, 11 Jan 2021 09:00:59 -1000
Message-Id: <20210111190113.303726-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-TUID: HXQlT54qtx4L

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index ba68d4d7f4..dbe74e2c34 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7831,7 +7831,7 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
         } else {
             tmp = load_reg(s, i);
         }
-        gen_aa32_st32(s, tmp, addr, mem_idx);
+        gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
         tcg_temp_free_i32(tmp);
 
         /* No need to add after the last transfer.  */
@@ -7906,7 +7906,7 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
         }
 
         tmp = tcg_temp_new_i32();
-        gen_aa32_ld32u(s, tmp, addr, mem_idx);
+        gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
         if (user) {
             tmp2 = tcg_const_i32(i);
             gen_helper_set_user_reg(cpu_env, tmp2, tmp);
-- 
2.25.1


Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2940157lfq;
        Mon, 11 Jan 2021 11:34:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzC3fGIbDehb7O6aK5NnvlVktVTB0h/Ox2ATqFLidPEMlJ7TtCHLWlpm5Jt7QPp8CFA94Ky
X-Received: by 2002:a25:6981:: with SMTP id e123mr1981958ybc.194.1610393654813;
        Mon, 11 Jan 2021 11:34:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610393654; cv=none;
        d=google.com; s=arc-20160816;
        b=orN/NkT5cVhfv7eaUBqXuQlbMlYEJ6D9Z91vh8pl8FfTk3GIqzoNgtOuiYbHYWU0kR
         jYuRcPy2W8zFUtisYDyldpBjFKY+V/h5hpa3AuesMiOUmdKiUgblFRjsCW/h5d+eArvw
         mLLUXaSyfEMe0slJKWmiTEZy7eDjSXXCFOMuTwdzfs5LFu6LfeJ4c7WGbnFr+wWpEI8x
         5josHNyK3D/uMxhr0FtTGgPgXtcWRoSyYl2Pu/mMIz1hoY78HDw0s9gCFOrNuOLcne2p
         gW8+xRddtfLLv7h2cWjz9zbXJCtk0GCKbYgvHfMXoshcSn49mHyvzrxuQ423YHptrwQD
         oSHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4UQ2EbntzblTY+Cr/OZTR2n9Wiol6cqQRRjRkzPpLXE=;
        b=urfd7Ni1aqL8E3xWTrB8GJuPfupLoSwB5ZGruKq7m6nuQddSO+9Qy741GXAAsKR7ck
         p6+rh4fAYCJxhwlWOjzuCMtvsX4M8jaNU1AHZg25OczwLoO3OTp8epOof/yV3Nm+lo3u
         flOIaZby8h0FN/SIW36nlv175uRI56dfpaNRmda9dFnIeg+DAGtu6Iu22QdaKOiUKngB
         xnkTyZNrq3JxWG1qDyj29UijzXZoIoyVTRfSJN0rELzKGB1TM515LnJtObOPfVBbQUV6
         YfeTW+FYb5hjAyjWgYBiC0tFJpzF+YtNdvQxYkakR341wMi3JUEkNakHI9n6dyACf67I
         orRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="DqjI/wiA";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14si603417ybb.398.2021.01.11.11.34.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 11:34:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="DqjI/wiA";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz2xC-0000kQ-57
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 14:34:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2SH-0006VE-IJ
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:02:18 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2SA-0006Yu-Lo
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:02:17 -0500
Received: by mail-pg1-x52b.google.com with SMTP id q7so271529pgm.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4UQ2EbntzblTY+Cr/OZTR2n9Wiol6cqQRRjRkzPpLXE=;
 b=DqjI/wiA63h9Z7VIF6PcWjfh5XEff8lw2NSEp5sKkS/kn3Ywcd58Q1bw7A0U51HJkX
 61cG3Cl1pnRSyeLyn57ryvbpQpyu9/DrcKUUwLQCZELnvGBuDSfe5G1v6Ctgmup9ECFh
 MOQ3cjUY2LDd+TGHz0cMEVmgp6dgpDNX7yLkSQl7Ckgu6GTtWYkA6V83PKxNHsooQgMe
 9qeGTC3w9uguFz+jL7KKbSYjsiFRAQ3G56X3QtTNisSCMlZTXfthqqit5XYTQoE/JvKd
 TGsiv8gVgwZBZjcnQBhJ45jaxZ/DJn0w1yiRsBkpg5X+jgyivo6m24O211cuBWAttV8+
 0Okg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4UQ2EbntzblTY+Cr/OZTR2n9Wiol6cqQRRjRkzPpLXE=;
 b=CGQHRxyJgQmMy8cHldftY8qXtozV8ZoJGLTCGUXybAR8wrgyfuy92dUhNMRyxo6EeV
 ElYmNL9uJ62y2j6XRnXirO7oU+5CjmS6n6wPlK9B4p2Nkirx5macwZF68zCpBC4wCljI
 6K5M4XBcHGILRKzpxLNsBMX0kz6YINrsIV7a9rQbbXg596N+IEByQkWWi7yuL320Q5tO
 Pxw/KXAnjIkuSSIOPH3MXX3VL45YDkKS/EO6E7mjcjPspb2jLUJRWfQBLZig/HFDYqwi
 kM9w7JgOE8OfufmCnz6yJqFYBnyDjsNElJHauyi9FkY/meJyfs1yb0CbJEWZgKHeQ8hC
 o3Sg==
X-Gm-Message-State: AOAM531F4uanztTJXKlkr6bOYeYSuwNWyuQ/w5NWAUPsJ+PUF4jfOzOT
 A5rW1EYgOChx9zuv+R6YXN1zR5P6uhjwMg==
X-Received: by 2002:a62:b50f:0:b029:19e:2974:b7a4 with SMTP id
 y15-20020a62b50f0000b029019e2974b7a4mr1010303pfe.61.1610391729154; 
 Mon, 11 Jan 2021 11:02:09 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:02:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 30/30] target/arm: Enforce alignment for sve LD1R
Date: Mon, 11 Jan 2021 09:01:13 -1000
Message-Id: <20210111190113.303726-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9fKjJGN5w50K

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0c3a6d2121..6125e734af 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5011,7 +5011,7 @@ static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
     clean_addr = gen_mte_check1(s, temp, false, true, msz);
 
     tcg_gen_qemu_ld_i64(temp, clean_addr, get_mem_index(s),
-                        s->be_data | dtype_mop[a->dtype]);
+                        finalize_memop(s, dtype_mop[a->dtype]));
 
     /* Broadcast to *all* elements.  */
     tcg_gen_gvec_dup_i64(esz, vec_full_reg_offset(s, a->rd),
-- 
2.25.1


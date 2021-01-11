Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2937376lfq;
        Mon, 11 Jan 2021 11:30:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzt6wNwVdZx1b2AViNfLb2Gb/H6Fk57IOwwyDigAnkGmjgKv+/BmJpJiolM6AJYabYl9yKm
X-Received: by 2002:a25:c6cc:: with SMTP id k195mr1699164ybf.503.1610393411143;
        Mon, 11 Jan 2021 11:30:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610393411; cv=none;
        d=google.com; s=arc-20160816;
        b=NpQMzTcEluJZDKx3IK4vuNjkXlnumJp2XuqYeaaWLbLGbnbqb/N1zJkNM+E+K1k8Kc
         TuDpGdw+5n5EV8dqae/m5nLa7svfp390FZlP6U2F3JiWUE3ImEIq6TvBcvuyuEAUNFIR
         60Yoj8yFjrereI0Ui28bLSe76LBrcC2U1pYfPolRQMBuWV3p2yiCXGG+DLrq8mN5lhyF
         LPtMtROYMWjiG42Prj9ztY1pDlU9RKVfAWVdfti30OgV5tks+8D+NWLu9oH3wlfVpTIv
         +UHP1u9l4wsw0a6fdgqoeRR+mU6B/VNYnV/7PoPIBdH2GNe9HpLh76rT37kIi0K9K6Tz
         d+Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3EgLd6X/0agUdbULg+xeQ+A6feCfdo22IS1O1cQHk+s=;
        b=GsA+yY7MhqmzGwSHt3UxBoEaeqfD41YBclv6pLcG1BKbDf+M9RJRYg0bjSPMcULMF+
         oHaz1BJRutEYZqMfoFRDlIxAiSfwp/rPw0Y54CZ2Xw7vdTG2R8TWfGt+oVfxpV306FFy
         uv7uuRnOnpVLqxvy43Ld8FpLDyqE4y+eSiAduVvLhHKOt6iV2yHfIDYwygvk7j8iV+bs
         XLRRkQtjd0ojw3NCi4iI2C+ZiGXOKR8YWljs5NlogPMnsl0SkgZf1l6BZ56RyJna2Nls
         BXC7WFcKdwyPahstVq5o+rcrC60T4ei9LB9KYnlg2Fy3D1sZP9hCbR01evpa5+tjXCzb
         hMsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="W/912atk";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n62si651222ybf.174.2021.01.11.11.30.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 11:30:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="W/912atk";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz2tG-0006G5-1e
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 14:30:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Ry-0006Cr-Mh
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:58 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:46001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Rr-0006T3-8L
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:58 -0500
Received: by mail-pl1-x62e.google.com with SMTP id e2so318725plt.12
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3EgLd6X/0agUdbULg+xeQ+A6feCfdo22IS1O1cQHk+s=;
 b=W/912atkVSpxgETV5g5kzwGkqmDJ/rSYF0QyMHjRD0ee8kXwfitHLXkATfjMCrK7/f
 qw7oc8mZ4W7E8qnJy/tAG+oSV9DPrNvznHGeGjSnz+KcnOj0uFnWX96l4J4mb6nJRLnB
 njQ+f3CzXnlzmSJuDAH4XjOmUtL8bZMYTdWRaCUoKgt+o1xjZQUjFWfrF1MJhpJInA67
 miC/Ax/gkMJN2KI3iPAIxvW+B86EjYW9Zf/3zQdfTismeMQU/uLnbZTyBmTzv3Plcvth
 jsuc1WtpWBIq/J7u3RmPky1O27F1dCXKj2d6veN7aBVEGfV9WgZCsVAfpHJ2jKBlg3h8
 Z1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3EgLd6X/0agUdbULg+xeQ+A6feCfdo22IS1O1cQHk+s=;
 b=hsXVHZ7qXIYOQp4vHInFjgi880JBkQw1CCPfTf0BrbAaPmWMpgQeUSKTKdoIg6NOPw
 7b8vc7TpejD2WrMSdHuhHbQz07eVPHyUuanNZ15YD26vWLbo7e1kibpjyuqgWXKue/nh
 ZC6h3IhLJyZnedq7UrEXWwyF03ykC03vdakzobDisbwnn0JhPYKmRo0wVA+iVanpNZZb
 U0uIbOQ993y/J/98nB6UMfj4wqGyx8G2RIeh731mSozdO/q9jfZl0Cmb8wjSeETjlCAm
 axBWt73nRzmXfG/RAPYOT2vXi9TZz6Ty7fkYq+3zEoY6n4z+5W2q0j2mBGTNLxSc9m2X
 gtiA==
X-Gm-Message-State: AOAM533GzzPgmKnphoj4OiZhHkNOAHwLfNOczWFUpjgHrDlqMLV9qB4H
 8N1sM6jfyKuoE3JvJqK8ZH4L40dz8WgZvw==
X-Received: by 2002:a17:90b:338d:: with SMTP id
 ke13mr317770pjb.48.1610391706203; 
 Mon, 11 Jan 2021 11:01:46 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/30] target/arm: Enforce alignment for RFE
Date: Mon, 11 Jan 2021 09:01:00 -1000
Message-Id: <20210111190113.303726-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: avNnX92yQGCy

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index dbe74e2c34..a0d543ec1f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8304,10 +8304,10 @@ static bool trans_RFE(DisasContext *s, arg_RFE *a)
 
     /* Load PC into tmp and CPSR into tmp2.  */
     t1 = tcg_temp_new_i32();
-    gen_aa32_ld32u(s, t1, addr, get_mem_index(s));
+    gen_aa32_ld_i32(s, t1, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     tcg_gen_addi_i32(addr, addr, 4);
     t2 = tcg_temp_new_i32();
-    gen_aa32_ld32u(s, t2, addr, get_mem_index(s));
+    gen_aa32_ld_i32(s, t2, addr, get_mem_index(s), MO_UL | MO_ALIGN);
 
     if (a->w) {
         /* Base writeback.  */
-- 
2.25.1


Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp482727lfg;
        Fri, 30 Apr 2021 13:49:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmCyft5HnIYMUxPDCLXN0uFKneS6mUXf+9KNKHCwLVM4HDbW+5tCLCzYRjywbmgoUqzJcb
X-Received: by 2002:a05:6e02:12c9:: with SMTP id i9mr5747738ilm.276.1619815778943;
        Fri, 30 Apr 2021 13:49:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619815778; cv=none;
        d=google.com; s=arc-20160816;
        b=LU5huma/MZl1SHagk20HzrUOJgrCDgUR7sjgMLSNsF7Eyx2bBp0wU//PQJ11lEVMbl
         C2nNhGjT04iIHqiV1JknqREi+OSJvpCydIiAkF2m9UzhqxgxIuAnI6nMli1PjpbTwY2y
         KKO6u2GsGqKtzw2WVpZA9NqehbwJqNvgOEjjbx34k/ULb2MxAkEm+P+citHV//DLfJw1
         VeGSpnw7oj9yDlTrMzhfNvN+wzauxyRqh0guojVGmVvgj/UfleS//wFGB6jDqTpsPkxT
         7rB96xqWgcqwNj6NXPNwrJBo7X+dvrrbohMzU0F1gqA5QoVHDAmE8rz7nQxNLoFad9TK
         +59Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QaR3WAAAd20RRoi+x5aKUmW3qXGunVbXS8iCJuTuVr8=;
        b=HWhsKpnmHjOSSSdn9AQD+hA/rG8wspWYpMatL1H92yPUcyim1REAimhesWoBlgoDP1
         BNWG8XujcWwk6VncD5ySXKi4q/d4bbduDyBgyzZ96+sWgvxp/ThYwPHop6xoLk+kZN/0
         MIYd90N7yhLZQXznJpHNrJPSgd0MYj9sW70T8uwMxt8wuNypBGjJI0Ai8pPhloNP3h6D
         3srg5WLpUuVnivV/msvee2ODLVqL/ZSbsr7L8BuBGni00nyjqY9DlO3okOnIAzarNG8V
         Dtpw0SB3PxCaGjz5+SWh6KepPTnDRfu/P5Ew9sBtvGd1mq3FC/yNKlyDa+ZpA/OBQlLL
         U7eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zT714f3+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6si4059417ilk.9.2021.04.30.13.49.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 13:49:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zT714f3+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lca4w-0001Ou-6S
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 16:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZil-0000Dt-Vc
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:44 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:33736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiV-00067f-1L
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:43 -0400
Received: by mail-pl1-x629.google.com with SMTP id b21so8728419plz.0
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QaR3WAAAd20RRoi+x5aKUmW3qXGunVbXS8iCJuTuVr8=;
 b=zT714f3+ug62paiM7iVNnjZHxdRNi+A16Zufeks93HeX70ekC/5lG4TWNzLIYAxd8I
 G+Gk7yZdIvIvF5ouxWmK2womzLYyGZzqv1Dxr5l8AM8Koo0aVnqIKJdnNOqwP9HPANeA
 f9q84dEUkS2SMMlK2tiJECAqtsIAqQCDKQeLlVpS7LyuGR6XhEDxZcEd+8FQEH42fHVF
 Jo9MXcD18oTw/dUlAPUIDcPvQtG7ghrgoALGx19J1sdGqm9CB4f24NVhIGxWN03MkdC/
 AjcPTfUqC/6mWAOJtHQQvXNkyu8KCcYqMfQquJVM7CAhZAgGTVpUX5hHL5MyuL1CA/3h
 /lLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QaR3WAAAd20RRoi+x5aKUmW3qXGunVbXS8iCJuTuVr8=;
 b=EKltUuybuNZoeIlZrDyjnzsINQbkBEnwB48nOPv6gqrzZJw+v5fBFJ6CHd0BQAiaNK
 yNKofQr/bIsYCA+b3SwKFtnvp/aeK9j39YH/r1zXuHS+kXGE2EukM2XbP+OdqY1t8U9I
 ufoGtpFGcVvzzxO3EOqE7e3el6h14Eo65JGEBByJ5f5YxFzC+5MDsNdo5pb8q1K5Efko
 WXr6OeBGPjLae7znDBXdlZY9wt2IBQRLZINi/m+0cPxddDNV95YZBFUBXjheXp0Wfs5I
 mWddsxXqle6uKkRBHj3t6GJL3jevKZeaLMpa9vZLmI0IJPgwtKdi6H0iIjd1iHkmDIJn
 ZoVg==
X-Gm-Message-State: AOAM532AUaxRdVVtIxUjuWV4KJV5+yOSmx40TRRWUwksniS/6L9RQ5/v
 ilcz6Csld4xr5MSI+pOYXhkaVjTAhk6GLA==
X-Received: by 2002:a17:903:20ca:b029:ed:eb89:b441 with SMTP id
 i10-20020a17090320cab02900edeb89b441mr6996280plb.64.1619814385232; 
 Fri, 30 Apr 2021 13:26:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 23/82] target/arm: Implement SVE2 integer absolute
 difference and accumulate
Date: Fri, 30 Apr 2021 13:25:11 -0700
Message-Id: <20210430202610.1136687-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wuCnoEY8omig

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  6 ++++++
 target/arm/translate-sve.c | 21 +++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 695a16551e..32b15e4192 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1266,3 +1266,9 @@ URSRA           01000101 .. 0 ..... 1110 11 ..... .....  @rd_rn_tszimm_shr
 
 SRI             01000101 .. 0 ..... 11110 0 ..... .....  @rd_rn_tszimm_shr
 SLI             01000101 .. 0 ..... 11110 1 ..... .....  @rd_rn_tszimm_shl
+
+## SVE2 integer absolute difference and accumulate
+
+# TODO: Use @rda and %reg_movprfx here.
+SABA            01000101 .. 0 ..... 11111 0 ..... .....  @rd_rn_rm
+UABA            01000101 .. 0 ..... 11111 1 ..... .....  @rd_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d74a15d8b8..ba1953118b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6438,3 +6438,24 @@ static bool trans_SLI(DisasContext *s, arg_rri_esz *a)
 {
     return do_sve2_fn2i(s, a, gen_gvec_sli);
 }
+
+static bool do_sve2_fn_zzz(DisasContext *s, arg_rrr_esz *a, GVecGen3Fn *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_fn_zzz(s, fn, a->esz, a->rd, a->rn, a->rm);
+    }
+    return true;
+}
+
+static bool trans_SABA(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_sve2_fn_zzz(s, a, gen_gvec_saba);
+}
+
+static bool trans_UABA(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_sve2_fn_zzz(s, a, gen_gvec_uaba);
+}
-- 
2.25.1


Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2063373lff;
        Mon, 14 Jun 2021 08:16:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDUqxYF3YMTG+MEm5YIerEZz10Ffk3rYY7aPS9lloUPio6rNInlF0ai8FrkJeuMWr9/kgZ
X-Received: by 2002:a17:906:c0c7:: with SMTP id bn7mr15449779ejb.393.1623683781288;
        Mon, 14 Jun 2021 08:16:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623683781; cv=none;
        d=google.com; s=arc-20160816;
        b=RlTlHh0La72VTnpGV4ogLH8pLS8DzMG0Eex2N1R60OQFNfD7Py0LStOV7W7PBmQgzr
         Dd0g+l6b2UXCXfr+8dRA3vER3Co7lBtVIueSiJb6kiZFUosfunGN1t7+KjYcE8Xsh1ct
         +UkFNn1D+HO58XfxZWSZb37ncadK5EzxbOdSvcWXupIs6q2zFCp9fuSHA7ax3Xbcqr+4
         gXMwlXC7UTEX5xikBc+GDtknQJHSS4AeGfipjl+9xuX+iSignbH5hXKT/Dw1Dmb+nUnK
         81mrp6usBtWnWaBwP3QtiIEIj01i/12Gny3tOz0U7BZvpC0qkGAA9KycqZ0Nz0+jlAeG
         nXoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2dgDTTiMTrmKABkAfBq5w7i1IZyicXfWam0kFYAVX4A=;
        b=npyZwBKTeuPNxU1W4oBN4LQUyzTCNwhavXylCKVPUCtwyHgrAEqxwWWJcnlcJrVyXd
         FXoJ5dj8IEIUX3Ri4xQPiapv+f1+40+JyFN5TUPv/hi6k79SXBbYhzwe3VyS/dZi9L+L
         3SVEsRqrf909QbAtutXQkgVN99s1qS0DyFqqAV8edu8D3kpBOMAmf8BWiFtCrOVQF2gO
         x31nRJzcfeF2fqsDZBn3BOEdBfd1tI6VLkgW+DLSTFdxe7bCkF5sjDq0QOBzz78czJwO
         KyzQud/d0XLov0wVFqq5EckxwLbI2tSCz+Ka7DekJ92jqkWXF3guyutpn2Zv+jGsuvki
         nhNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wlDee7aQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9si11990192edu.471.2021.06.14.08.16.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:16:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wlDee7aQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsoK4-0004Tq-CE
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEN-0000Kf-Bv
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:27 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEE-00008C-0s
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:26 -0400
Received: by mail-wr1-x42b.google.com with SMTP id f2so14930539wri.11
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 08:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2dgDTTiMTrmKABkAfBq5w7i1IZyicXfWam0kFYAVX4A=;
 b=wlDee7aQN/MTi47IxqsCWMAEo0nsOZYyDq5k5ADhy3a3nBTM5FN5vgPmgs94S3n1W0
 VNf33fAtj/RrjMd5w4mWBBccmmqzpLawUemYvxqTWVlyWkLxYLWVYZdYLXNGF7sKtYdD
 Fm9AV+beWoqyQE0ZepQZCNfkSoA+bLauZO2dE/mavzRLl9DtF/5ftxNsTvGX6k3M/785
 MAeKdSowqtFrVSFewqcu6+0y2IDjgpV4SnfnNZWvokRFZnzqhcQhmEEjxmi3K0M2H4EZ
 JmLBA0abbuzAQs8BcEbrJdDGgpsHQWZzyaJwy544vrQZKkGNyvFmNupnmUBRg4W3ZCHY
 KuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2dgDTTiMTrmKABkAfBq5w7i1IZyicXfWam0kFYAVX4A=;
 b=MPCBGmuxBd399OCk+n6aisUttV84j5IsWlFFKphH6iyI2NvUEtYAmXH/Qwd4i9jRKa
 J1FJndjbFEXH7M9v4x0OIcHkKUaEZKUtSwMhnfDmNc0MIE1VF1dYatYXqL9eDmME4OaS
 NbLxZN20u4wCbE4F71X8f7fcY+3eRFJwEZTj16XKtMN9nq9SSGNAv4bjJuQPVy2+Brfy
 P1F9UbKTdSJVV6OhHQBuujcD7Pq+lZSO3q8NnqJ2wpC9aVs+6MqbXWv1kf2zZ2txd+im
 LgIc4FmkdBh3PrmWKYY4kx3yAbx1a6xcu+fFX8lOuPTMHacXhlWG+0y5KGXefsL4q9O1
 kZuA==
X-Gm-Message-State: AOAM530ZdH8ijUsr6WZDhq4KqOVhA5TzttTbvwketPAiULD7D1VxIlx4
 OiPGqH6PBiYGkvnxoB74DDj1LQVWLp7Tcg==
X-Received: by 2002:a5d:4610:: with SMTP id t16mr18479633wrq.324.1623683415827; 
 Mon, 14 Jun 2021 08:10:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 06/57] target/arm: Implement MVE LCTP
Date: Mon, 14 Jun 2021 16:09:16 +0100
Message-Id: <20210614151007.4545-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qQXonbs5idfU

Implement the MVE LCTP instruction.

We put its decode and implementation with the other
low-overhead-branch insns because although it is only present if MVE
is implemented it is logically in the same group as the other LOB
insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/t32.decode  |  2 ++
 target/arm/translate.c | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 8b2c487fa7a..087e514e0ac 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -674,5 +674,7 @@ BL               1111 0. .......... 11.1 ............         @branch24
     DLS          1111 0 0000 100     rn:4 1110 0000 0000 0001
     WLS          1111 0 0000 100     rn:4 1100 . .......... 1 imm=%lob_imm
     LE           1111 0 0000 0 f:1 0 1111 1100 . .......... 1 imm=%lob_imm
+
+    LCTP         1111 0 0000 000     1111 1110 0000 0000 0001
   ]
 }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index f1c2074fa4a..c49561590c9 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8191,6 +8191,30 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
     return true;
 }
 
+static bool trans_LCTP(DisasContext *s, arg_LCTP *a)
+{
+    /*
+     * M-profile Loop Clear with Tail Predication. Since our implementation
+     * doesn't cache branch information, all we need to do is reset
+     * FPSCR.LTPSIZE to 4.
+     */
+    TCGv_i32 ltpsize;
+
+    if (!dc_isar_feature(aa32_lob, s) ||
+        !dc_isar_feature(aa32_mve, s)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    ltpsize = tcg_const_i32(4);
+    store_cpu_field(ltpsize, v7m.ltpsize);
+    return true;
+}
+
+
 static bool op_tbranch(DisasContext *s, arg_tbranch *a, bool half)
 {
     TCGv_i32 addr, tmp;
-- 
2.20.1


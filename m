Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp489987lfg;
        Fri, 30 Apr 2021 14:00:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx24IZM62uA5Bni6FNsRHayabCgteHkaC1gJZo88+JwXaTp6Zf+OzmuZ4UDncthKvTTdrg/
X-Received: by 2002:a05:6402:1cc1:: with SMTP id ds1mr8065776edb.135.1619816456838;
        Fri, 30 Apr 2021 14:00:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619816456; cv=none;
        d=google.com; s=arc-20160816;
        b=GC4UuKYNC9O5bcgYeFuRv/hpdxPY/iaeYnOI1Go1RSan/L51PktBsLHFRoIyPq46NK
         SrKb5bJ6VV3XJqhOOsclIYFlN0Lvx+6bpYsj5J0t3OlDcXwUXDWQ4+NKzhZyKjTx389f
         ynZB3/wv+mvFSdi3YI59LXlazLdTxyoKXl3n4BoPjzkOD9eRZDCTV4A4muVdiGUzWC4m
         W9p4FEtFtBOSD9OO3X1z3ibElO7ERQEfimo6lVvwpPRLhoLNAlbVpLIsEvkfh5XsuEeo
         KHVQ8SJPrrCIB050Gr9Bxz1EMqJ2wI0jkr6MNBZO9uHanXUPBbUf8Cir+6t9PWq6BHBs
         Mi/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bYBvAAL6DC7Hi2Mjo18sNLpM8Gq57yT/LKmwPXamUwE=;
        b=kvdnVwnxLV2je0k36FmCbbtYRZ626wCA/G5Nz7PE3dFF86n+KgJqbyzjnCya09vkre
         6wZSVBwFewPCbxeoMez3mkNVJ2YiJrj7cXptTg9qnFtmCa+lATFIfhuDxs64n1dWjQ44
         h4P4VDXsxw774IK2acWVjhN7ehH0gn740vlnZmxmQ4yxRwTMarehU/4KppSpizzEKWqF
         BnunuQFBL7FSjDB+xZxcClZl0Nc+2+Ft07rQHBr8YCPU1/rOBgDBLf0C2qBss3aedI8X
         MwDLGgv1DkGSmn0teCESEecyJpyR6BLTjIHdX29+D6y9vgoiLlk9EOxukbHpo2pARk9v
         saWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vGvjRHTV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r21si5118938ejo.341.2021.04.30.14.00.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 14:00:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vGvjRHTV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcaFr-0000Qz-Ol
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 17:00:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZm4-0004Ej-FB
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:10 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlm-0007h5-2D
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:08 -0400
Received: by mail-pf1-x429.google.com with SMTP id b27so905342pfp.9
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bYBvAAL6DC7Hi2Mjo18sNLpM8Gq57yT/LKmwPXamUwE=;
 b=vGvjRHTVa3JK48nDwrfipfb4ZCugRkn+EOX/G4k2gLqNpPm02UxGUhC4DFsQcjr58q
 TUZyYcdonisdsMTO+gU59VZYka025arMZPlgh8Mkq6bIGByvhPbAZc/3Kh7AlG0HfVrq
 HJttUddHR9dAZ88xOAuwwwSCbv36hoaBvkCKhINitT/0TIQkWxER+1Dgy0xW7cVGeUJi
 xW/t0lXDyBVya4YDhL97c9RvFDlagT6mZP1xwjQFMCRX63qCf3icgObJSkvtEg5VtY/Z
 PJ6T6SldJOVniv/IWARuufoCtfu1rqa1Oyacaz2fPjsdHee/RMH8QcraIOTtvio9TLM2
 8TBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bYBvAAL6DC7Hi2Mjo18sNLpM8Gq57yT/LKmwPXamUwE=;
 b=l+qlEioxUh6Dz3qLmoorb0o9UUKEy/vbGRZ9Lwnf/1fQhaocmCXRiGjOJgMJQ+i22y
 /ZYs/F6jqyoaqyw7yBLWjWbV65v7x3pq6sulahCzdxk0PDy04VUiaHnVNlBSu1iegtkk
 tfOdzlhHoHmvrA/Nt9mXG+iqALU7Lln2VpRvDcscW9RR5TmLYohco4mISiU2pA9/H1Xm
 B4qfnqKYJHLXDOESVT/kNE7SRFASvse2vH/Me5AMdqZfLAe4ylqgzVedUu0dA5D/y5c+
 kgDLiccPlyIMjbq0hdMVu0//s/4nB+cXhjcPGEfHNWdo/+dDzdFnf+gIFub5Khg4PzmV
 3PNw==
X-Gm-Message-State: AOAM533wm8Jjw2vytBOCtGs+UbBg8GcnLQfNF+nPKpaKweZ/3QF2TZcq
 0fh4NuMIWYyp9GfJPWh8AM+rkVEMEvfZTQ==
X-Received: by 2002:aa7:80c1:0:b029:262:ab5f:adc5 with SMTP id
 a1-20020aa780c10000b0290262ab5fadc5mr6747237pfn.60.1619814578788; 
 Fri, 30 Apr 2021 13:29:38 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 44/82] target/arm: Implement SVE2 scatter store insns
Date: Fri, 30 Apr 2021 13:25:32 -0700
Message-Id: <20210430202610.1136687-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PCTNPcbpTy+H

From: Stephen Long <steplong@quicinc.com>

Add decoding logic for SVE2 64-bit/32-bit scatter non-temporal
store insns.

64-bit
* STNT1B (vector plus scalar)
* STNT1H (vector plus scalar)
* STNT1W (vector plus scalar)
* STNT1D (vector plus scalar)

32-bit
* STNT1B (vector plus scalar)
* STNT1H (vector plus scalar)
* STNT1W (vector plus scalar)

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200422141553.8037-1-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 10 ++++++++++
 target/arm/translate-sve.c |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 7645587469..5cfe6df0d2 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1388,3 +1388,13 @@ UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
 
 CMLA_zzzz       01000100 esz:2 0 rm:5 0010 rot:2 rn:5 rd:5  ra=%reg_movprfx
 SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
+
+### SVE2 Memory Store Group
+
+# SVE2 64-bit scatter non-temporal store (vector plus scalar)
+STNT1_zprz      1110010 .. 00 ..... 001 ... ..... ..... \
+                @rprr_scatter_store xs=2 esz=3 scale=0
+
+# SVE2 32-bit scatter non-temporal store (vector plus scalar)
+STNT1_zprz      1110010 .. 10 ..... 001 ... ..... ..... \
+                @rprr_scatter_store xs=0 esz=2 scale=0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index eea8b6f1d0..0356b6a124 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6167,6 +6167,14 @@ static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
     return true;
 }
 
+static bool trans_STNT1_zprz(DisasContext *s, arg_ST1_zprz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return trans_ST1_zprz(s, a);
+}
+
 /*
  * Prefetches
  */
-- 
2.25.1


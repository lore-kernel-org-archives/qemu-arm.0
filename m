Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp497778lfg;
        Fri, 30 Apr 2021 14:10:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyu4O3ZfDtLsTAyS2SMC/c8OHJM1aWBma/ubPy21ltOloZBK3MifpcblowwFNry6X66CafN
X-Received: by 2002:a02:294e:: with SMTP id p75mr6789758jap.34.1619817034246;
        Fri, 30 Apr 2021 14:10:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619817034; cv=none;
        d=google.com; s=arc-20160816;
        b=geFnsElupyHoAcLAw38RFde0UCJU3rFvdDXBkJvqR+e0oULC++qm5i5viGRZh0vQAM
         5otOce4k1Gth5fxSDrgZVVhkiASmxYzwujHgUJG4JjcXWKN+wBHdeFHOz76NUpwcu1vc
         uclNhU4QyGmbJxi7bteLEmGMxujUY4Ur/PdYUUGwZhKa5x0LxGibmwUSAjYP/bMcZNNm
         rA9+3zntSDY4wArgSX3eT8PhBpB/A/kA6rLIgbUQUzfh0csQRA19BfrpPOtA1/3o/QyX
         ORdKbK/QPDSoWC1H7zrAwrdMAFtC/qPwtOt6AijJUj59o/+6sMbJ4y/5B0a3EGJSk7j5
         6q/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RfpadBU7KlY8uj8mgdV4cd4GjWhl0iserVzzK3wcZFQ=;
        b=qQGLibp8Xy8TP7520BRzYp+RnN4PUd8wq17cLeZsHgHSnYiSweNIDXEIE4S1re4rUz
         NdaEN1t40h/X1hdlUFkfNR+Ae61UNSKaLiopX2zFmaG0eTQdMpVmd8SuQrKgDRselWsi
         E8ZO8ONr4G2NgrjfueOb2LyNpKS9pq2DoGrbzW4rdaU5Qx5VDwX72OMYP/6J3XwF7EDu
         88fJbgbc1pTWVPkkbTcT69x1lGzDzKJdYKdZYWphfebqRrduHeuvqkFHoDyCDsiTuOpV
         3vniJYalOT7LgQyX03Kx4+Fa2nVSkvQU5NZwMftKJy2B7WS5j9qbytJwldIpLNDQ4so2
         UObw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nw+BwVlz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p15si29934jas.109.2021.04.30.14.10.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 14:10:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nw+BwVlz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcaPB-0002fH-GN
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 17:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZmO-0004aH-FO
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:28 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:33749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlm-0007iB-DS
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:28 -0400
Received: by mail-pl1-x62a.google.com with SMTP id b21so8732226plz.0
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RfpadBU7KlY8uj8mgdV4cd4GjWhl0iserVzzK3wcZFQ=;
 b=Nw+BwVlzPjvbq6hwS+9+9IBuU9JKmSAgEjPrbj2E9Sx/Ot7I2Tllh16XPMX0jdmJbh
 o4PQkG8wkPnqps0HEGYSG/6FwZFV5sARcZ2QzpbNLjXk7SXP7d0VUEmtfPXGSYATCOdm
 5EMYKr1DcAPc/GclzYYYUbvbWQW5YwjIyWaw7WrkVZjXM66pjUlzQJMLnYh9hz428gdJ
 ROlkWLpMC0Iv0hXkUfyrIqphL6lnqCAs5Xr8bnTSn+HZ7JEEXjqLRUx+9b6eVg0c4Ow5
 A6tRTSiOxiGeiAb7QevViWH4hTM4aIam7lWzgZnQmex6+rMni5+lwoOdDDtuOODF0Sm0
 KxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RfpadBU7KlY8uj8mgdV4cd4GjWhl0iserVzzK3wcZFQ=;
 b=sgL3aP6HG4Q6t6Cu/f3Bx2wC0E2BCnTRsnFgXaeyTCLIL8PuAu5MbTG6hWo4p55A99
 XCqY5sl1DnEPUuZO6glJRU+tAj/8AqqYmipdhPo4KOg5d4dKmjzGQwI/RgQBw/w6b4Fh
 PVMCrmOc2JHK4xEpb8DaASNGuHbu0wGESmf0bnfTp2RXkBNBzBedJC5h6zP+qVwVpzVa
 Qp3H6XO6PhDly/6VPvRxrei/IXgqyKdmm4ZrSmfZh5hJ6cjHYF0ZpfeA/RKAE/BlQDdS
 uBMomZ+xIiMfhCFT++xHkY8zy0vyAeKlQvbym6roTt9yz3oj4zgHw1fg/cOeQBlhCrvy
 5fDQ==
X-Gm-Message-State: AOAM5329bQgBimjHW0qf1ckp3pthnO/NJ0CvlHax5IvDgql/BQ2oGX14
 i/XA+2jtUYF/AbpC26CJqOArjRjYQu9oUg==
X-Received: by 2002:a17:90a:fd92:: with SMTP id
 cx18mr6940822pjb.209.1619814582527; 
 Fri, 30 Apr 2021 13:29:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 50/82] target/arm: Split out formats for 2 vectors + 1 index
Date: Fri, 30 Apr 2021 13:25:38 -0700
Message-Id: <20210430202610.1136687-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1YxI3tjUmfxy

Currently only used by FMUL, but will shortly be used more.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 04ef38f148..a504b55dad 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -67,6 +67,7 @@
 &rri_esz        rd rn imm esz
 &rrri_esz       rd rn rm imm esz
 &rrr_esz        rd rn rm esz
+&rrx_esz        rd rn rm index esz
 &rpr_esz        rd pg rn esz
 &rpr_s          rd pg rn s
 &rprr_s         rd pg rn rm s
@@ -245,6 +246,12 @@
 @rpri_scatter_store ....... msz:2 ..    imm:5 ... pg:3 rn:5 rd:5 \
                     &rpri_scatter_store
 
+# Two registers and a scalar by N-bit index
+@rrx_3          ........ .. . ..      rm:3 ...... rn:5 rd:5 \
+                &rrx_esz index=%index3_22_19
+@rrx_2          ........ .. . index:2 rm:3 ...... rn:5 rd:5  &rrx_esz
+@rrx_1          ........ .. . index:1 rm:4 ...... rn:5 rd:5  &rrx_esz
+
 ###########################################################################
 # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
 
@@ -792,10 +799,9 @@ FMLA_zzxz       01100100 111 index:1 rm:4 00000 sub:1 rn:5 rd:5 \
 ### SVE FP Multiply Indexed Group
 
 # SVE floating-point multiply (indexed)
-FMUL_zzx        01100100 0.1 .. rm:3 001000 rn:5 rd:5 \
-                index=%index3_22_19 esz=1
-FMUL_zzx        01100100 101 index:2 rm:3 001000 rn:5 rd:5      esz=2
-FMUL_zzx        01100100 111 index:1 rm:4 001000 rn:5 rd:5      esz=3
+FMUL_zzx        01100100 0. 1 ..... 001000 ..... .....   @rrx_3 esz=1
+FMUL_zzx        01100100 10 1 ..... 001000 ..... .....   @rrx_2 esz=2
+FMUL_zzx        01100100 11 1 ..... 001000 ..... .....   @rrx_1 esz=3
 
 ### SVE FP Fast Reduction Group
 
-- 
2.25.1


Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp732537lfr;
        Fri, 16 Apr 2021 14:14:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3oio2UyXDL2Sr+whDFBAqMl22y8PUUR7AAyRzs6n092MNH8fM1FCS79wd0NLjUfLl4B4a
X-Received: by 2002:a9d:bf8:: with SMTP id 111mr5039003oth.306.1618607653366;
        Fri, 16 Apr 2021 14:14:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618607653; cv=none;
        d=google.com; s=arc-20160816;
        b=vW0q1rDt+CLl+yFmMTUt9cK3xobu+y4KsNSPzg8iH9GMR6rydBhhKNajoQWAtZ/pmD
         Rama/y+A+6E4OpPgY74aO/55vZ2tCk0CUp9kH62uYh+g1IljrpJTRR2PUURbsYKCHxg4
         IfJDIO26z2vOEEXO3c0igDO964iKr/uActWPqtLq/5CqdMYxglwVD26u8XOAyu36SBal
         1N8vchyLEUJIiJ/43NVC2aPz4HJuwvmwKF/WLP+JOag8dI75R16W+AmncAFFSpaLY+nG
         sblCO8zXJgeO9vvUzwfoRbouNkXHUTnUYylrTvu4u+Wr0YI9ywy1nSOc4w9z3aNz8tRh
         82zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=br78Q7AmWJ+XfOQwE2rDFXsz+3JbpInND1mUnQKHlAY=;
        b=FMGBdeU0OrhaEjZCxE6SiYFO+gQ4ZWAIvEAZWJqV61v4QDnoZiGINNoMhGBcPURnhW
         6GoG0uXmkZvbv+36wRfG8yFLceZfIiWxaNG4gPoCl0frqikvOt27xPiV2uxuyobAtZ+1
         V6HlWS8ZcehFr9AwkMRCYrWJWSpSdL3nsO8a0edh7AP1Xhj7gnBcL0scUF/5gBJnSN30
         j9hhHPDDtS4AEzfMQxWb6z3G2NPkTBMRbnJdASFsLvAF8HefPfaazEKSnwhDQ+q7SazB
         e0om6n6I3KKbEm/gs+O5Cmb37iGWaGyx9aXDX3omc0MHoiCPJ7v6TZM1sWlnDWKvf5tG
         QDCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mqQMd7jf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15si7176343otk.239.2021.04.16.14.14.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:14:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mqQMd7jf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXVn2-0002UE-Lb
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcA-0004A7-VL
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:02:59 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:35441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVc7-00014B-A4
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:02:58 -0400
Received: by mail-pl1-x630.google.com with SMTP id q11so1531507plx.2
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=br78Q7AmWJ+XfOQwE2rDFXsz+3JbpInND1mUnQKHlAY=;
 b=mqQMd7jflyN2jMIWlZ+e6+21MTMwYDP+7pZaC8LqTqaErK87zNB8vct8oAP9KnreIS
 dyRwQwDx+5wRUd6u9TCWFYxRcGJNvor5zsawAIM4V7zHOnLmB/dXZTNDmTfK2xYWO+Za
 AlqOsaJlOGCiWdypuxRJkFGPqry4WgREtOLIgYGJn0r18REvYjA2UairINmtavM/sQnu
 QI5buX+frdkUCT526QOb82hWl0hh6ezZfmvVCVmGwns58mL7Nieg4C56cofj3NjCNiLr
 GL23lB6M8Zmdbt8dmEpYkekEwFp+KKm6/i/Fo1gGhtVNL73kjyTOUFSjJwonZKrpC4/V
 +hhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=br78Q7AmWJ+XfOQwE2rDFXsz+3JbpInND1mUnQKHlAY=;
 b=ouPnymRJ2P+BFJl5gTTbAksPD3PW0h26o0vBG8DOl3Gk3P7JyH7+xqdAeKop5Rys08
 RNRdDDkfDdQErmFxMDlLCEBYTnHLXZMBCzFXieqW+++N7q9wkKl7/PO3CDhY9qXzJ2HC
 TgI+UnMuaxczGBHyR1j5KIO968AX6bPbAlGXlgQqhbu1/CM9x+LfEHC6cSlyhQvpLgeb
 dvXWodXPnsErSZcVg3gx/rHtzY6V+epPVKIwG5ZMCWLyGR5i32cJiz8JqpKyf+MUkIew
 WzboxAC7Vy27FH8Qx4JFHcOIB33hn1DdN3C40w4SkZoa+nRgTTy5dnyce4tSExzny5kr
 sNqw==
X-Gm-Message-State: AOAM530oE2MZCDT5/l7J2IgHhnwZPp5zTHfIVV0gjPh1Q2Mrf68xR5Xu
 B9jG1R/QPK7ZHnf/YhoPvU/fnUHXo7bT+g==
X-Received: by 2002:a17:90a:cc0d:: with SMTP id
 b13mr11553493pju.219.1618606973994; 
 Fri, 16 Apr 2021 14:02:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:02:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/81] target/arm: Implement SVE2 integer add/subtract
 interleaved long
Date: Fri, 16 Apr 2021 14:01:30 -0700
Message-Id: <20210416210240.1591291-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
X-TUID: TDJ7xRMFvY27

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 6 ++++++
 target/arm/translate-sve.c | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index fbfd57b23a..12be0584a8 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1178,3 +1178,9 @@ SABDLB          01000101 .. 0 ..... 00 1100 ..... .....  @rd_rn_rm
 SABDLT          01000101 .. 0 ..... 00 1101 ..... .....  @rd_rn_rm
 UABDLB          01000101 .. 0 ..... 00 1110 ..... .....  @rd_rn_rm
 UABDLT          01000101 .. 0 ..... 00 1111 ..... .....  @rd_rn_rm
+
+## SVE2 integer add/subtract interleaved long
+
+SADDLBT         01000101 .. 0 ..... 1000 00 ..... .....  @rd_rn_rm
+SSUBLBT         01000101 .. 0 ..... 1000 10 ..... .....  @rd_rn_rm
+SSUBLTB         01000101 .. 0 ..... 1000 11 ..... .....  @rd_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 22983b3b85..ae8323adb7 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6016,3 +6016,7 @@ DO_SVE2_ZZZ_TB(SABDLT, sabdl, true, true)
 DO_SVE2_ZZZ_TB(UADDLT, uaddl, true, true)
 DO_SVE2_ZZZ_TB(USUBLT, usubl, true, true)
 DO_SVE2_ZZZ_TB(UABDLT, uabdl, true, true)
+
+DO_SVE2_ZZZ_TB(SADDLBT, saddl, false, true)
+DO_SVE2_ZZZ_TB(SSUBLBT, ssubl, false, true)
+DO_SVE2_ZZZ_TB(SSUBLTB, ssubl, true, false)
-- 
2.25.1


Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5545632lfc;
        Thu, 29 Jul 2021 04:27:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTYEJsMkCrg8c8NtDle6vw2bKyQIrriS8EZfzb/QJLfpYoMtPnS8wNL3uQ6ArnU/L8ryLK
X-Received: by 2002:a05:6e02:16c7:: with SMTP id 7mr3462683ilx.269.1627558073224;
        Thu, 29 Jul 2021 04:27:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627558073; cv=none;
        d=google.com; s=arc-20160816;
        b=NMPj95ZbKCyyi59e0Pp4RcDHjrSjyLm1/jbvvdtOupcXxLhmXVaibyTOYavs1L9Z1n
         EzO0nK+foq5JnVPIZhQCHK/mjPFuThthcgzEwuxLsbNLqRWGegZr583kkM7dH0NPjTOf
         rDtSWdyGgUxCHF01hVR7qtRgIJnAZsRmz5gH3WyOre8Tu+2aZ9saEtlilJxSJjE6sj7y
         J/h2Z40P1+jqt007r9uW4vmsEpPpi9shstKH7fAC3U18deJls0vprbjy5OgZEWNgXbVR
         2pYmfSx21v7ynckXb6pexK+bWravjDr8/Ea9ErrPYYCod+2zoSiKKsgFCUx5to68E/OD
         hlYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KHg6Srrabt2i/P1wMabf21oSUvedE7e5kSg7WXSq3yY=;
        b=TssB3cHGuOW0z0rWlWCxBHTFVbnvqGHHUfZNhKZwt1N/VOfxSQtJEGzZYwuX4O9j1D
         dovjbekJnIv/hZJtrd7uTQqLRmo8Pctijk6dNpSRhEAh9yKsz0bYOS/WysoYOO98hPSb
         HOekH6ypubnVzV2iwcBdV7nFConcBfSVTJ8p8qccu/4HxuHpuK85OsOhA8+oif+LYZwE
         kyRq4QAyROOMr68HqAn/gv87GTp8D0nol2bM2vKtQhCfvByMyoUvkNWFZPF7SPACGMud
         eEzbiBK8MquX1UpPGHTJ+QdcpDddMG+iUTJlHnF9BYZTcd2cZAZAAZCBkSXaeU1WLx7V
         E3fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dzA/zddL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8si3816174ilo.95.2021.07.29.04.27.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 04:27:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dzA/zddL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m94Ce-0001gD-H1
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 07:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940k-0000R3-EZ
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:37 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940a-000109-5u
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:34 -0400
Received: by mail-wr1-x42e.google.com with SMTP id l18so6461453wrv.5
 for <qemu-arm@nongnu.org>; Thu, 29 Jul 2021 04:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KHg6Srrabt2i/P1wMabf21oSUvedE7e5kSg7WXSq3yY=;
 b=dzA/zddL6DXQVfgUPv4PH0cqozt2cdld1eme+ZTUV6sOfT+OLDJVEaCgSDY+FzSnxR
 BZsgX8GOUHy0eeDz8G/vStNLHH17b9AZhuPrljAAEAIg6sCuyYmB+oVzr/YjWL+VHjOB
 124p6XzEe0lc71UAEknrAQN1I5r0UzKSMAWQ+Z2p6WoxCJ08U5wRHUDE6SmKOoXJ7OGN
 nrmzxz1fYHRorntH3bomR17oui9sPG7AGTYm7wJYFc00tnyzN3euiwu6/lLsHlayApsh
 lnSoFGzrhL8MAXOjRd5h6GzFk4GJl5YbfhVdGI5HHVSbHf/cBTZEjGACK2LXSdW4qew5
 9vyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KHg6Srrabt2i/P1wMabf21oSUvedE7e5kSg7WXSq3yY=;
 b=NOCY0yjPfhFW0zaMuLCR04OTi+k9/0OcE0O3e2z3gTN2UkVPUpNRbd138F4t/B/jHg
 FPdjWNCzCtq2hBcgPa9NxVzx6TcUVJqZZoKpftuwTEqVLcrZ1LlPn9689p6FXcZEzaP/
 nVmXvCQP98Omu2KjrsYfiad1C4QvEnkx+I+4yuDV9sR4fnGo19JhPasYyxzagkafaLl4
 jQZ+xNzgf9uXvdmpyrOEpW7AcKVATFumiqZOlKuw8Ug+nd92WRmL5GowFBl2Zh3hdYju
 NpBrsNrmjad27uNrrL/OkDk1nYBfLlRSmMkufpRC2IH4zhgtRgDABdp7xcIrkqV/0wf2
 iULg==
X-Gm-Message-State: AOAM5313gViW4B7MfxUXf5W04FkRZBy9DohbVX1IcX6Q2/+BaPDonoAa
 rklMNIrIf0B8fon6Zd0zqxXNIUW0nPt7sA==
X-Received: by 2002:a5d:5412:: with SMTP id g18mr4320538wrv.301.1627557320596; 
 Thu, 29 Jul 2021 04:15:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 07/53] target/arm: Fix MVE 48-bit SQRSHRL for small
 right shifts
Date: Thu, 29 Jul 2021 12:14:26 +0100
Message-Id: <20210729111512.16541-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hbVbfwkNX3Q4

We got an edge case wrong in the 48-bit SQRSHRL implementation: if
the shift is to the right, although it always makes the result
smaller than the input value it might not be within the 48-bit range
the result is supposed to be if the input had some bits in [63..48]
set and the shift didn't bring all of those within the [47..0] range.

Handle this similarly to the way we already do for this case in
do_uqrshl48_d(): extend the calculated result from 48 bits,
and return that if not saturating or if it doesn't change the
result; otherwise fall through to return a saturated value.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not squashed into the previous patch because that one has already
been reviewed, so as this fixes a different edge case I thought
it clearer kept separate.
---
 target/arm/mve_helper.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 5730b48f35e..1a4b2ef8075 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1563,6 +1563,8 @@ uint64_t HELPER(mve_uqrshll)(CPUARMState *env, uint64_t n, uint32_t shift)
 static inline int64_t do_sqrshl48_d(int64_t src, int64_t shift,
                                     bool round, uint32_t *sat)
 {
+    int64_t val, extval;
+
     if (shift <= -48) {
         /* Rounding the sign bit always produces 0. */
         if (round) {
@@ -1572,9 +1574,14 @@ static inline int64_t do_sqrshl48_d(int64_t src, int64_t shift,
     } else if (shift < 0) {
         if (round) {
             src >>= -shift - 1;
-            return (src >> 1) + (src & 1);
+            val = (src >> 1) + (src & 1);
+        } else {
+            val = src >> -shift;
+        }
+        extval = sextract64(val, 0, 48);
+        if (!sat || val == extval) {
+            return extval;
         }
-        return src >> -shift;
     } else if (shift < 48) {
         int64_t extval = sextract64(src << shift, 0, 48);
         if (!sat || src == (extval >> shift)) {
-- 
2.20.1


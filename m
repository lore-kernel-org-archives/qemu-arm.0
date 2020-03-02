Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2714522lfg;
        Mon, 2 Mar 2020 10:01:58 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtpuR6KQsmNCYaYPQR/NbugrACZnHRDUnp8dmg0mJBB+vNz5XhUpYH9BrElOhzk/fsBgGVA
X-Received: by 2002:ad4:4aed:: with SMTP id cp13mr612331qvb.42.1583172117902;
        Mon, 02 Mar 2020 10:01:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583172117; cv=none;
        d=google.com; s=arc-20160816;
        b=jo1ozZYV9EXJGnoGj/MBYqlZXajzraBEIITOzTip30DcqN1Pq5fXL64Vl+GOg0446B
         3NX2Fx3iVvwO/isot6yAs07IF8ClEomBU/xI/E0UX3lw5h71fvzvzIYw+CvXPKRM2jkC
         LNkUO/sXodCiONO7xbDw2q3gGKpiNFWgLYwi/RdtlKmYv95h/HC6NNsyk00X79DgAx7U
         5DhrrWftKSCF+K2csFVvCk6F9MilcIM9uuKZKjhmWTbs/z6OOv3SyuaQZLXeBc0wXbiu
         8WKvAKNaEDkM6xWNScQUbMUBlhvGfCt/Acz/hvKTaB2UTqUa8a5XacZhn47EWsq/o1Eo
         tB5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gv99y10Tw9XL58AqjJTwfCMl/voN1k409rbwq+MWA5w=;
        b=dUxy5KWMEbBEXrDQHi2UYHAUWPl+Z8WWKZ27tdKRRH6mGzvUOgjhsJAP88Myjkz6kB
         KduaMpjYjr182dJC5dYa9cjb29c72ca46OJ0i1/PLx3mOUfLrdNTCKP10doTx3AsS39k
         0t5lg8xokRtURvikHiDrW9RS6LVI9wL5k/xhz1FpopedD+JBFXi9vZ7s98o4kz/THkJI
         WPqc7e0Ged1MHLQhhk1JyVeJgpY4gIiNuiuve4HDFIHI4VrDWi4YvMj+AjaOzCQ8PUgJ
         5EcuYq3+oZbahCdw6bL88Te77f/Cy0PUVqk9xw4DHhzl2qT5ZUBN8dCR3caxiqDkICQp
         CYmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vPXh7Anc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z3si1503143qto.201.2020.03.02.10.01.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 10:01:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vPXh7Anc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8pO9-0003j9-9V
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 13:01:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39222)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j8pL3-0006oq-Ly
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 12:58:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j8pL1-0007cq-La
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 12:58:44 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:40401)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j8pL1-0007cU-Ga
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 12:58:43 -0500
Received: by mail-pf1-x441.google.com with SMTP id l184so80819pfl.7
 for <qemu-devel@nongnu.org>; Mon, 02 Mar 2020 09:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gv99y10Tw9XL58AqjJTwfCMl/voN1k409rbwq+MWA5w=;
 b=vPXh7AncUP+qc6FKFOOg3QTRlXQp5E8M6BNaOrA4SyMqan7IpVsh983mYcn0jU5e0B
 wjaqjkgSO6EuIE6o3U9h3Pn2yiIByI4Zi+2dwTL4w7I0vJtvJJ4+NNhysmJBOJ4jwuU3
 7vgw+1BfT0iN2b0iu2ZVGtuGAv2B4jKJfP3RsyDOZFBUjcLPvMPapKjbG3w18uhsGsNB
 ZVHGGnPGqlHfhZx3ORTqwMyxc5x3HKTXtmv8ZscPkGzL2TfEl9NHfNZEuavC/3UO4F68
 52A4wOGEXa9mLjRSsqDlQKiopwcBr8C4xcOFifgy0+4olCzVb3B1tBrzOUhcwRsXq6R4
 Q9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gv99y10Tw9XL58AqjJTwfCMl/voN1k409rbwq+MWA5w=;
 b=UW9eL2Esb8cfZkJIBn3sUlXggQ3FgNlVrKtZt3MrnevsUUaR0/q2rni6/AwLo3HPxe
 S6Cin4IB+Aaa0Q+DTljCo03/pjo4URc6tss9pFcz7fALkPKm+51rj8+NKX+HiZCqO291
 PUav/yWUPSARrr/MTC7sLgN8jgDwN7Q4fVWYRcFj3VRmtQuMuSVmMAmgmrXcX40ph6XT
 7PLOGmef2tTgCpQojfPei39PDbXPVIfGlAWuclaFeTwNQ8bx+nb7B/Y7a9dfdBuFzADz
 0p30Tc0CxcNzXJ1xHiaimGs+4RIKlO9CVPBxZtq5l4YTrNr1pp1x8bk0o2jXKw0NjbYC
 Dc+Q==
X-Gm-Message-State: ANhLgQ0jrfgwOzs88nckA3a3CjJOhl4NI7PuQlDQAAq/9ss51L0rWrix
 p1zs5PPWp3q/wkjzYtYczcXBj5fqMFU=
X-Received: by 2002:a63:385e:: with SMTP id h30mr109747pgn.230.1583171922325; 
 Mon, 02 Mar 2020 09:58:42 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id s18sm99510pjp.24.2020.03.02.09.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 09:58:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 9/9] target/arm: Disable clean_data_tbi for system mode
Date: Mon,  2 Mar 2020 09:58:29 -0800
Message-Id: <20200302175829.2183-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200302175829.2183-1-richard.henderson@linaro.org>
References: <20200302175829.2183-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
X-TUID: VPQKtzL4K5kh

We must include the tag in the FAR_ELx register when raising
an addressing exception.  Which means that we should not clear
out the tag during translation.

We cannot at present comply with this for user mode, so we
retain the clean_data_tbi function for the moment, though it
no longer does what it says on the tin for system mode.  This
function is to be replaced with MTE, so don't worry about the
slight misnaming.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index fefe8af7f5..8fffb52203 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -228,7 +228,18 @@ static void gen_a64_set_pc(DisasContext *s, TCGv_i64 src)
 static TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
 {
     TCGv_i64 clean = new_tmp_a64(s);
+    /*
+     * In order to get the correct value in the FAR_ELx register,
+     * we must present the memory subsystem with the "dirty" address
+     * including the TBI.  In system mode we can make this work via
+     * the TLB, dropping the TBI during translation.  But for user-only
+     * mode we don't have that option, and must remove the top byte now.
+     */
+#ifdef CONFIG_USER_ONLY
     gen_top_byte_ignore(s, clean, addr, s->tbid);
+#else
+    tcg_gen_mov_i64(clean, addr);
+#endif
     return clean;
 }
 
-- 
2.20.1


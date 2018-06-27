Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5775623wrq;
        Tue, 26 Jun 2018 21:43:19 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdLwT0VLClAS3QNRsMkOw69oxspbUzVu46tM2sYlpU07loEIygZLJGXgglO6z+SAV53Hhgq
X-Received: by 2002:ac8:21fd:: with SMTP id 58-v6mr4012598qtz.246.1530074599295;
        Tue, 26 Jun 2018 21:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530074599; cv=none;
        d=google.com; s=arc-20160816;
        b=oDe696vjhh0kUZqeq7OgJkho5t12ZZ2qdtZjhGnJyw9PvphZhbZyp8gSXqn/4OOi/r
         tDtwo5/u/tgdabB6rw1o/ZrSl5l3D2nzkk60vypd4IVOMwi+xt2bpf4itV/oiFG53//A
         kbG2q/rngR/jvOz5+Qw9XGSqZRaDGmOk174TDN8aYzbjC0lYWz69+8bWsd5Kmv+8p4Oe
         YWlz+oAB5OXye+tcODjOGy5MaPjWOswPoicMajPmASy/vxOkCaAFeM6kgRSpTUmSyQWU
         6E+A9s87HUJQOjWxqLHqWvqo0FD9UzqZP+/EhGMDDmLfxPYqIkSdOjFaQ88ErcM8eJMA
         Vqnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=9Lq4027RZ73q8aO2yN77xs6Fxbmm8ORU6JI1DqiGp0U=;
        b=pYn7opxovw1a7BnbWxlEuNUC4zJa/PrrQ3R/bVGHhnKMcr3mmigukl2D9Ei4uk6J1s
         vzUs/6sbsoCtbpd/RTh8IFvB15O3LwIZZlHzwrURNeOEefG5vxAh1CPsSrIhu7uuiXjT
         +xYinRKowfFFW5rjl2mj4icimeLofBMjHgSEAeUE2ARaE/DDVobVZjk+oYHZVyysue85
         8AUrc0L1PvQV49CTph8asNN26/3HdomU0OFk1tUeFFH9brmZh+FC5DuWXOI0jlqNGd+d
         GPRv94XvUlKTyCL5dC9ocwkJRlX+AFJo12jge1ejsuXUqJpwSMSZovUL0m1WE6JQ29Ew
         FMfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Dbl3o2tV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o43-v6si2132832qtb.250.2018.06.26.21.43.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:43:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Dbl3o2tV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56536 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2IY-0003d9-NZ
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:43:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60415)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29P-0004ED-MH
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29N-0000SS-9R
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:51 -0400
Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c]:41875)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29M-0000QX-VL
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:49 -0400
Received: by mail-pf0-x22c.google.com with SMTP id a11-v6so384576pff.8
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 21:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9Lq4027RZ73q8aO2yN77xs6Fxbmm8ORU6JI1DqiGp0U=;
	b=Dbl3o2tV66yNcaS+my+QzlfieJfmnnfJGi+4wVuNMiIGfUVB4KJhYZuzR94+CkY7RA
	qiCJIRxkHkTgaTQucPbDW0tHTQOCoS3PMaPWmPoxt5SZPHLUqdaRVHnSJbDZsu1nsMoG
	fJx+S7z8sbq0frfsS2iPZ6/CiZ2/Nu7+IEB6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9Lq4027RZ73q8aO2yN77xs6Fxbmm8ORU6JI1DqiGp0U=;
	b=SNPgOyujPkKdkEV7loVRDcGRwe6k11JtKFEgsSynzHN6emz4RWU22pWzbXVPSxmeLx
	ir7yNkP4QHg0y1sful/D1QPC2ouBCyaEbItYvNnrAN7l8Qf7GNvFQV0++Su1KfhehWjD
	us6/+5FdCiO6YqwD4up9v7IaU3cNtMtdAm9/RczEdJguzt7V11HAa9uMqy+uQqvbE9dT
	vl5Y8ShTsfxDD1glTsVat8bek9tMA95GCUCj3sIFjhmtHEd4bfZmYqboyJUuFs6G+Ayg
	nukVEvpPPg459y3oM7YF3MzUqFmLXDhtcmGCzzDN7X4UIUhbo8JKJ8hngrQlnpkF8ayf
	Snlw==
X-Gm-Message-State: APt69E2QCmZmPzqIu/yaF6Odl9qpdH7nGssgHW0IMYDfyJC17oAsnKoM
	GYSIcxbOQOz61LxNYXysl0w+Dw==
X-Received: by 2002:a62:e70e:: with SMTP id
	s14-v6mr4270998pfh.131.1530074027951; 
	Tue, 26 Jun 2018 21:33:47 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.33.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:33:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:05 -0700
Message-Id: <20180627043328.11531-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22c
Subject: [Qemu-arm] [PATCH v6 12/35] target/arm: Implement SVE prefetches
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K9k6vsFcP6zy

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 21 +++++++++++++++++++++
 target/arm/sve.decode      | 23 +++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 65da3e633f..27854e0042 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4303,3 +4303,24 @@ static bool trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a, uint32_t insn)
                cpu_reg_sp(s, a->rn), fn);
     return true;
 }
+
+/*
+ * Prefetches
+ */
+
+static bool trans_PRF(DisasContext *s, arg_PRF *a, uint32_t insn)
+{
+    /* Prefetch is a nop within QEMU.  */
+    sve_access_check(s);
+    return true;
+}
+
+static bool trans_PRF_rr(DisasContext *s, arg_PRF_rr *a, uint32_t insn)
+{
+    if (a->rm == 31) {
+        return false;
+    }
+    /* Prefetch is a nop within QEMU.  */
+    sve_access_check(s);
+    return true;
+}
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 7d24c2bdc4..80b955ff84 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -794,6 +794,29 @@ LD1RQ_zprr      1010010 .. 00 ..... 000 ... ..... ..... \
 LD1RQ_zpri      1010010 .. 00 0.... 001 ... ..... ..... \
                 @rpri_load_msz nreg=0
 
+# SVE 32-bit gather prefetch (scalar plus 32-bit scaled offsets)
+PRF             1000010 00 -1 ----- 0-- --- ----- 0 ----
+
+# SVE 32-bit gather prefetch (vector plus immediate)
+PRF             1000010 -- 00 ----- 111 --- ----- 0 ----
+
+# SVE contiguous prefetch (scalar plus immediate)
+PRF             1000010 11 1- ----- 0-- --- ----- 0 ----
+
+# SVE contiguous prefetch (scalar plus scalar)
+PRF_rr          1000010 -- 00 rm:5 110 --- ----- 0 ----
+
+### SVE Memory 64-bit Gather Group
+
+# SVE 64-bit gather prefetch (scalar plus 64-bit scaled offsets)
+PRF             1100010 00 11 ----- 1-- --- ----- 0 ----
+
+# SVE 64-bit gather prefetch (scalar plus unpacked 32-bit scaled offsets)
+PRF             1100010 00 -1 ----- 0-- --- ----- 0 ----
+
+# SVE 64-bit gather prefetch (vector plus immediate)
+PRF             1100010 -- 00 ----- 111 --- ----- 0 ----
+
 ### SVE Memory Store Group
 
 # SVE store predicate register
-- 
2.17.1


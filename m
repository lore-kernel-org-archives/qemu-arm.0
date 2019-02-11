Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1949001wrq;
        Sun, 10 Feb 2019 17:20:26 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbcOx0O7yB6eYWndGzRhx3V81rH/NjNv/F/7dKbB3eOyACFH/qKoZuVm+AkXBiR59L67k4k
X-Received: by 2002:adf:f58b:: with SMTP id f11mr1317237wro.266.1549848026369;
        Sun, 10 Feb 2019 17:20:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549848026; cv=none;
        d=google.com; s=arc-20160816;
        b=v7IsTBm5mQqabUXHRPZNWh03V5xSKif5vVAOGXVOpS6t0YjEnEnAiUUGa9xbXGcAUQ
         jPdLCYa6gmoK3V8V0Z58g3S5Nz7t2Hj7xhXv2VFMPsulFXwV8HFYtB6Bmnw7dnDVDA8V
         pnUD6cAYQVSX0WLLDLyf2N6LiEdPyzpToYI6ZGiGloDjCh170ctXuMoQot2KCV4UGAmv
         SIF3/Z0MwC8IZt7mF3y3B/jDLybk3rOEFky5onGtDWJ+o8CtS6TMb9SWvljCY/YEdqfK
         dtjyIsmfd3m3gqizZELB5H3jdobZDBpXhl5mZYOnwFx7KozdTs+sOB+rqYSwHIChyIVX
         G01w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=g7oNh1d8VWGEQw+YCuZLsLZ9OlLSdLVyb8nPu7OZ0AM=;
        b=NFfCHzFIDACwjmT0uWf0AY/GrHQ5cyg0tFTvjVXVMJFl+x/kAojQfOoySke9uYp6S6
         y+jg+QUBTigtJ/4jv5R13039u+vYYoCdbPsWUINbVEq+EQFB9xzaZvlcJdz559TzZ8Oq
         Nb95lI6poVQ9p5WFyPo2zzOY/5o96vtfrFc/+/NXlPbXohn5O3xmFkJCKyAxCJ1FXvfD
         5PQ0WxmnLpTC2w8iVTQqRZZ2SXJ/i1ykNbuESz2XvI1nuMi9f5JzzKohfkm3lysG6Ox8
         g6hbLkCb+09qbOd6bO/M6OOwazu5Xa4uVh3UPCio2SsL7JIrmeqqGxgp71d33i9kmjmw
         xeaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mou86ucX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t8si6280131wrm.446.2019.02.10.17.20.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 17:20:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mou86ucX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42234 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt0Gn-00068z-Dj
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 20:20:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05v-0005ws-Lj
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:09:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05s-00008k-HK
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:09:11 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:38626)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gt05s-0008Ug-74
	for qemu-devel@nongnu.org; Sun, 10 Feb 2019 20:09:08 -0500
Received: by mail-pl1-x641.google.com with SMTP id e5so4510915plb.5
	for <qemu-devel@nongnu.org>; Sun, 10 Feb 2019 17:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=g7oNh1d8VWGEQw+YCuZLsLZ9OlLSdLVyb8nPu7OZ0AM=;
	b=Mou86ucXOZrCzuhlxiH5ZHCEHc+smQK99AsvZlKAD1V3+HoDfRgEI0uCVAftMOKJfq
	XJROt97HxcPVvCL2EhD/85T6j8PNjwxX9YBQ1t9J2DAY56izUjkQMbRMNypDJH3Ov28u
	NYBgNQnr8oL/sf9FwRWpSTFsuEd4IhkzoZwV0Q6DbrGAbtnn9zaiNUYkEBaEbp2dnwXk
	LDgAFZWWibNOToeBbE+lJnIy3tjKq9+Ai6xIPSSekLLSj8E6FeJwf3cfROACssmQk2Pb
	I2ACk/oRF6R5AYIh1gQ23wYNkfmZaWTqVQfGktPkr8pt4rOkzbKP+S5Xf2AD2nj8/h34
	awjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=g7oNh1d8VWGEQw+YCuZLsLZ9OlLSdLVyb8nPu7OZ0AM=;
	b=SqmX/AeoDJXhTLoBsEY5uvd7sgM/fYXL3HWpeP/nh30QK3UHzmr4Rmno/U5FOWp7rJ
	Xedbdc4NfEoygSADWFmGFbfkk8mex9BBk6iR9r0Czvrh2jLsklBd2i4gP7cit9FQ2Inl
	PEyoUhedYnj+HRj636MQkdveAbOXwg3IYnvx2R57gQVxXY/1dXdWFaMsoDdYvOST77IT
	vfRyh9EyWnPqU/3WyhwNcPCrHmrrWYU8PNr9Z5N5M4zzOv+VA/XOTWxqi6T8u77zECgy
	HGt4LarHXGWs3rFn8qpWhVpAOBdv+iwnvbdO0zCtg9zY7M51Wws6FZwo5QhPB5BVLmlw
	eG7A==
X-Gm-Message-State: AHQUAuatroFg5toBXCcz/qVVZaQhUYFf8EChClt6ua566Pks8EPVw47V
	RFjajODWETmVKpkzyAz5fINicbBiPAo=
X-Received: by 2002:a17:902:280b:: with SMTP id
	e11mr34975123plb.269.1549847343970; 
	Sun, 10 Feb 2019 17:09:03 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g14sm17177630pfg.27.2019.02.10.17.09.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 17:09:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2019 17:08:28 -0800
Message-Id: <20190211010829.29869-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211010829.29869-1-richard.henderson@linaro.org>
References: <20190211010829.29869-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-devel] [PATCH v2 25/26] target/arm: Enable MTE
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eMrFsuTB/2ge

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c   | 10 ++++++++++
 target/arm/cpu64.c |  1 +
 2 files changed, 11 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index decf95de3e..a5599ae19f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -206,6 +206,16 @@ static void arm_cpu_reset(CPUState *s)
          * make no difference to the user-level emulation.
          */
         env->cp15.tcr_el[1].raw_tcr = (3ULL << 37);
+        /* Enable MTE allocation tags.  */
+        env->cp15.hcr_el2 |= HCR_ATA;
+        env->cp15.scr_el3 |= SCR_ATA;
+        env->cp15.sctlr_el[1] |= SCTLR_ATA0;
+        /* Enable synchronous tag check failures.  */
+        env->cp15.sctlr_el[1] |= 1ull << 38;
+#ifdef TARGET_AARCH64
+        /* Set MTE seed to non-zero value, otherwise RandomTag fails.  */
+        env->cp15.rgsr_el1 = 0x123400;
+#endif
 #else
         /* Reset into the highest available EL */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 53a7d92c95..7bd761b8f5 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -352,6 +352,7 @@ static void aarch64_max_initfn(Object *obj)
 
         t = cpu->isar.id_aa64pfr1;
         t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);
+        t = FIELD_DP64(t, ID_AA64PFR1, MTE, 2);
         cpu->isar.id_aa64pfr1 = t;
 
         t = cpu->isar.id_aa64mmfr1;
-- 
2.17.2


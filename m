Received: by 10.28.71.155 with SMTP id m27csp2597609wmi;
        Mon, 9 Apr 2018 07:07:32 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48FPOWA2UwkGGjDOoP1yPKa65/idJIjzkk0tDr2YiCBAquQvg4klVCdll8sQ8fLJTAIsWbD
X-Received: by 2002:a25:ab21:: with SMTP id u30-v6mr19616058ybi.489.1523282851987;
        Mon, 09 Apr 2018 07:07:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523282851; cv=none;
        d=google.com; s=arc-20160816;
        b=rJCvATNWNmHS5HIC1RN5sjH4+6R1+XfAyPToG7bySyO8/dDHjpbQUavW6QDkxajaU4
         Hmr9JdY1tIWkYpVlMxG3AR1f4n8lrLr963JqZZUf9XMPQKveoHk8RCk8ilshxqgCUbBI
         MAE2w1k2U6Df2B9hVxMAR8D26VOaFYekQRGHe4OW7W8emOLA16yb/9koYOHRTyEVdotl
         DaMukFH1VskOBITlDRunykrcMDL3QIdII+jsS+QATDwOoA0BSxRpjHW94jTTaicsu4m2
         fM+FSpkDw1eSRWw04nlkqnibFxsz3Tpv/iJkS4bmKHZADRo902IwIdPMbhmF8U4wukBT
         T+XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=FhKh5smnaKjR8+IFEFHdaxMGPCeZ2/fIDqTPT3kLxyc=;
        b=t/FUnozkTtqYNYPTV2lVq1wfBbcdV6DZ+cpuYCuSWeFV4igg0YzKhzvXVjnEjZ5hgZ
         70b/QBMw5XDTFaKAosh9Q1HV5EiEZZqB9RgPp5BQDLT8oigWqQMro5INQhWqfedjSABy
         s98alsQWQFE+LL7m9oJhss7CC8el/t9721VHRH0RMsCjMbg5ea519XIXGXg1TzWdQ7jp
         6puufh82pA52qe8L24CAPvSlT5Mk2VxsCB1kPRxvMdsgko9TTfcGAzfmNRXCI/wVpuHP
         +YdzfP0QJI1h1rk3uGGrh6ihUfsLI442uNO2+XAfRzC3qaLzk9GWSN1PcnJYe903zCs8
         1+pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j35si494270qtk.160.2018.04.09.07.07.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Apr 2018 07:07:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41092 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5XSF-0002Ny-Co
	for alex.bennee@linaro.org; Mon, 09 Apr 2018 10:07:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f5XS3-0002L1-Fj
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 10:07:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f5XS2-0002ud-GI
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 10:07:19 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:40734)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1f5XS2-0002tV-8c; Mon, 09 Apr 2018 10:07:18 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1f5XRz-0005DA-Bt; Mon, 09 Apr 2018 15:07:15 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 Apr 2018 15:07:14 +0100
Message-Id: <20180409140714.26841-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.12] linux-user/signal.c: Ensure AArch64
 signal frame isn't too small
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
Cc: Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>,
	Richard Henderson <rth@twiddle.net>,
	Richard Henwood <richard.henwood@arm.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PfF4gnTZWrzF

The AArch64 signal frame design was extended for SVE in commit
8c5931de0ac77388096d79ceb, so that instead of having a fixed setup we
now add various records to the frame, with some of them possibly
overflowing into an extra space outside the original 4K reserved
block in the target_sigcontext.  However, we failed to ensure that we
always at least allocate the 4K reserved block.  This is ABI, and
some userspace programs rely on it.  In particular the dash shell
would segfault if the frame wasn't as big enough.

(Compare the kernel's sigframe_size() function in
arch/arm64/kernel/signal.c.)

Reported-by: Richard Henwood <richard.henwood@arm.com>
Fixes: https://bugs.launchpad.net/bugs/1761535
Fixes: 8c5931de0ac77388096d79ceb
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/signal.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 046d4c8aa0..8d9e6e8410 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -1850,6 +1850,12 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
     fr_ofs = layout.total_size;
     layout.total_size += sizeof(struct target_rt_frame_record);
 
+    /* We must always provide at least the standard 4K reserved space,
+     * even if we don't use all of it (this is part of the ABI)
+     */
+    layout.total_size = MAX(layout.total_size,
+                            sizeof(struct target_rt_sigframe));
+
     frame_addr = get_sigframe(ka, env, layout.total_size);
     trace_user_setup_frame(env, frame_addr);
     if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
-- 
2.16.2


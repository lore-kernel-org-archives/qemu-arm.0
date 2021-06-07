Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3673510lfa;
        Mon, 7 Jun 2021 10:00:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTnkntQWBqHTQIjmC5+V3WO5ZUMVZuyGnskjXNTrSsdg+PIGcirzohiDeSnw4yVNWH0aQj
X-Received: by 2002:a6b:8e97:: with SMTP id q145mr14817946iod.144.1623085205565;
        Mon, 07 Jun 2021 10:00:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623085205; cv=none;
        d=google.com; s=arc-20160816;
        b=gDJE57WligRFwsOCx+AnfIAw7dwq9KEGrJ1gC0RKLht+YwMljcRqiOrURotDjvNCu3
         tPJb/bTjJe5QqBeOKTome3dHVVPmmceC51Pp+gZmOdjk/PAf2YbQcklZ47wm4MmoYTDZ
         /gpDALzLjNXLoH68GZE3xm5Uh+UZpFCS3QcdL+IBjma/Iw93GmL8kPWCxS8c//eD/iO4
         Ih1ySZqBwwkWxjPPN3FmMdS8mGOQ1XLKE7hzx4IaS70NURiK1NaUWl4hx3TBVA6tldKi
         oAvwDHWKcBH6KcmsKZI3sAPPbL+9v+mPsuXPubTH24Csi32vhteGSdI026rHXXuXo7ix
         eHww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WP6bAnl0XFv6sI86ENYvVNq1701QvYCzpF74EEud+5Y=;
        b=IoAtxdg4zCMQFfLXXRfIyc2EZixLWmYnJdKHy0RplhNjpi90b6QJyfBSooGiQyngpx
         6tw9AYK230VYy4Unw/A+jRJqSkPOfNODoCB7fJvWy9GVPEyA5XE0+VR4rDkweHcfeG1N
         jD8Bk1pDuxooTqjzziqadTWOHqIozMZ6oIiHR16bda1reny7zrcYJN7YXrn0pbsJIDce
         zr0N0f7N6DZcsittNW/s4ig4ZC0knuW1f6LYe2DuVn9pOaiNjbvfJHRuD48cAPIxWrT8
         nBa16WpSGr2YiGymRsDVs3LwVnhEc07aarrLWysVCzABfj1cQMUxDgs+KKej4fw2pX1b
         rIPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PhaTLgSi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8si14321322jam.110.2021.06.07.10.00.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:00:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PhaTLgSi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqIbc-0008Ay-Qd
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIa7-0006zp-Cg
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:58:31 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIa5-0007rj-Lu
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:58:31 -0400
Received: by mail-wr1-x42f.google.com with SMTP id a11so16558228wrt.13
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 09:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WP6bAnl0XFv6sI86ENYvVNq1701QvYCzpF74EEud+5Y=;
 b=PhaTLgSi9W/p1rUl17LGICLkRVA6OEDyFY+ha4IUQMDRY8aX1k41a0O+PafXpU5jgL
 gOhGDF3wcxFsEn9o5oluvuFBQ3iA78D6dQnKfWMrZoLzsSipUGqm2fpqClCwn9JHeUoP
 Zj8wCBbtbhpEati67SPRddT9jetpLNfkHbWHbeATMqPz5mDIU0zk0nyz8QpM6ZfmKAS5
 rGW6KsalHae7dFjPsSYXnvU+sX3d80WrxUJ82JpI0jIb32ixvw9md+VOXDuZR6B1WZPp
 J3r5aDoeLQgRq1w1KftFWgs3u+RmvJ7i5RBO5ae4IVfTRHlS9k01pP4MgW38veDdbbcS
 nFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WP6bAnl0XFv6sI86ENYvVNq1701QvYCzpF74EEud+5Y=;
 b=VL4KXuwG1TwciZMlf1/GsFKeFmupm2vfQeTTnJAM8I399XZLIOTCwg76hhGV8nsaL4
 ZOmV0atonWDuUkq/FORZWMz3VRyxpPwlvCqCc1BEICvcP10JyfMv3DZLv+4td77zXmc9
 S0mUg/zHabp3+hPO+DMixaiAf5iaQt5tll+Eq5Etw857s0nm+3/9ZeuFJjK4l21vnyup
 QHUyJwoAijLR697kTKA14bS/vjt9XyU2+gvxBP+vWoIgXHnt2eAOJa+syDh25HkC8/Ld
 k5Pz5zjtTv06pPpT6/ah/CN23Fzzda20bNzR3L1RK0IHAz7fSaa9LVDCQ95rK7OLmWGW
 upLg==
X-Gm-Message-State: AOAM532YDgTOoHCPU+4P7Axoj8LE+UMQC8hbRvj93O7cDUshtnoCL0Kv
 jmDoZ3I9P1o9egg6+EZ4SYYeJ5bNxSbkbAkl
X-Received: by 2002:a5d:4f12:: with SMTP id c18mr18613626wru.242.1623085108405; 
 Mon, 07 Jun 2021 09:58:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/55] target/arm: Let vfp_access_check() handle late NOCP
 checks
Date: Mon,  7 Jun 2021 17:57:31 +0100
Message-Id: <20210607165821.9892-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: 2hxfhfrvBPfN

In commit a3494d4671797c we reworked the M-profile handling of its
checks for when the NOCP exception should be raised because the FPU
is disabled, so that (in line with the architecture) the NOCP check
is done early over a large range of the encoding space, and takes
precedence over UNDEF exceptions.  As part of this, we removed the
code from full_vfp_access_check() which raised an exception there for
M-profile with the FPU disabled, because it was no longer reachable.

For MVE, some instructions which are outside the "coprocessor space"
region of the encoding space must nonetheless do "is the FPU enabled"
checks and possibly raise a NOCP exception.  (In particular this
covers the MVE-specific low-overhead branch insns LCTP, DLSTP and
WLSTP.) To support these insns, reinstate the code in
full_vfp_access_check(), so that their trans functions can call
vfp_access_check() and get the correct behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 3a56639e708..6a572591ce9 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -143,11 +143,21 @@ static void gen_preserve_fp_state(DisasContext *s)
 static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
 {
     if (s->fp_excp_el) {
-        /* M-profile handled this earlier, in disas_m_nocp() */
-        assert (!arm_dc_feature(s, ARM_FEATURE_M));
-        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
-                           syn_fp_access_trap(1, 0xe, false),
-                           s->fp_excp_el);
+        if (arm_dc_feature(s, ARM_FEATURE_M)) {
+            /*
+             * M-profile mostly catches the "FPU disabled" case early, in
+             * disas_m_nocp(), but a few insns (eg LCTP, WLSTP, DLSTP)
+             * which do coprocessor-checks are outside the large ranges of
+             * the encoding space handled by the patterns in m-nocp.decode,
+             * and for them we may need to raise NOCP here.
+             */
+            gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
+                               syn_uncategorized(), s->fp_excp_el);
+        } else {
+            gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                               syn_fp_access_trap(1, 0xe, false),
+                               s->fp_excp_el);
+        }
         return false;
     }
 
-- 
2.20.1


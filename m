Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1151438lfa;
        Mon, 12 Oct 2020 08:39:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyckMk7+CaMzym5GWygiwWfiYNo6YoiKBPenTU0TYVYG/SULUBjPp/d0/S71eJCqUI9DuuA
X-Received: by 2002:a25:19c4:: with SMTP id 187mr12791081ybz.226.1602517169070;
        Mon, 12 Oct 2020 08:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602517169; cv=none;
        d=google.com; s=arc-20160816;
        b=CacU8EENRxFDC/YM1b/Kx/57XgQqJaXO52cK2JfzIPl3SBOnl9ttc++Y4pRNBba+Lk
         SCE9zhmgj2D07V3M+YRLIxR1GVygX4HZD9FIpq65pWVH1kaFUmo0o6MAQmHIMfzlXY+9
         Vt5PCHNWdEGV3aCE4e0RATSAmjPB0/vMrtpgG3RH9iKQMHaezCLjba4qrizOd7c42mM0
         dIS84qhiGPMznmGSt6WZ219mHB0ZzcP3R5teDxRZGxt4M2fl1BvvtIuvvkuK28MlAXt9
         7fF0ZD1XtFso6+H/4dLp6GyOTdN4II/7N7YXNXYAHKthaj+vO+aU/Lc//JAEuAhwhOCe
         m5EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1jOZnrxRTG3Vn0Y7sOS02Z9FyMYbuYQPu1NRLX+duSw=;
        b=bqgBwiIkFzP9Kb/ilB3BGiFvUdsME0o78IBpmsFFoax6xFDlSSEDLwGUnn0S/ugHwX
         IHF8GcJMOVEWIl/FG95B2TwIMMKdSrOCJjkamp8qa82WhRUnlRb+ehtEYcNf0O2nU8zJ
         S253dcicZwgF4YULyqr+qvX+GUvFVG64zKGP9tiVbQ/0ntOydzt3MIulNSh5GkDCB1hy
         Nr9tS3HMRLLfEyYmxWQIElrajsVXI0QZ8y0Z5bdL7nAiGoTHduny5Ab/i+x7O+fkPJ9V
         WcIdhYT+4umpn+inoejiyYCsAKdpOiTU4rwxPuu4TpxcKFyM5v4fCWQUNAve80qxvDyr
         rb0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aAVbgCg7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i32si14480526ybj.214.2020.10.12.08.39.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:39:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aAVbgCg7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRzv6-0004sx-3D
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqA-0006ZX-7x
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 11:34:22 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzq8-0007G7-3j
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 11:34:21 -0400
Received: by mail-wr1-x434.google.com with SMTP id g12so19669654wrp.10
 for <qemu-devel@nongnu.org>; Mon, 12 Oct 2020 08:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1jOZnrxRTG3Vn0Y7sOS02Z9FyMYbuYQPu1NRLX+duSw=;
 b=aAVbgCg7ymYaysAV0+xZzfgRqAaSq1bwnaWSwioOXyCfZiNVpbJgNcRp4nIXDrf1RG
 zBSReKxmV+RB+GedK1vI2c493F4PObKrRh2eUg1LNZ2f61hCrRNzZthICmd/d4HzpRYx
 fX+hJYqVk3xZFl9sO6ODbtMl2NNb16x1hO1/6DsILrTUfyQZrnKA/P2dGyN4jp6zc3dC
 gUV7JbmmOlsMGJUV4H9YcQ0fNpiq1dFvrQ55/FZjH13mEJw3/SSI9uhIMZhNb7O7Tk8S
 76Wbn8TK/cX4+rQ0L/aXJrKLIi+GA0GVdBmnkxCCRZ/iQmNDhnoKphIKGrP+jpmqC1tS
 2xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1jOZnrxRTG3Vn0Y7sOS02Z9FyMYbuYQPu1NRLX+duSw=;
 b=qwBnZek1kgu9ndQ1Bd0GEH/U7Xtb2pHy0ZG6QrSF4CV1uVLsDPL1KvwI3KFq8jR5N9
 tdx9Dr80MVaHLz6+GqswAPdZbW2cIBiW4vH9M3JyWYp1io4JXjn4USJufvGhxFyCVi+E
 B51ssvS3N1j9Te+EdV9e3pU3KCKWI3QwTF3a1WsBQcd+a680z5nQsoGWQdbb5EcWwx/m
 cteR+n+lfYpsvP/pIohpMRYX8We8Sn7crqmTQsBsRbMPJE4jPKKkZAI+PbXW8QGxxwx8
 r7kSyMZgBTZdE4+H+ibZu1h3Z9/j3x+TxG8CGQvOA4DGkYKR78jAG2zcmtd2C4vXkcoz
 BsOA==
X-Gm-Message-State: AOAM533BquDsvsvMgP2vBg31uWFeOXhIO/lrhX64YwWtQaBtJ4gh00+O
 2izM3ATW0XtOj4ZiOrghStxAIg==
X-Received: by 2002:adf:bbc6:: with SMTP id z6mr30663849wrg.298.1602516858701; 
 Mon, 12 Oct 2020 08:34:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] configure: Test that gio libs from pkg-config work
Date: Mon, 12 Oct 2020 16:33:30 +0100
Message-Id: <20201012153408.9747-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GuKjyuDG9mFC

On some hosts (eg Ubuntu Bionic) pkg-config returns a set of
libraries for gio-2.0 which don't actually work when compiling
statically. (Specifically, the returned library string includes
-lmount, but not -lblkid which -lmount depends upon, so linking
fails due to missing symbols.)

Check that the libraries work, and don't enable gio if they don't,
in the same way we do for gnutls.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I wanted a statically-linked system emulation binary (which, yes,
I know is not really something we support :-)). I got one with
suitably liberal use of --disable-foo configure options, and
this was the only thing I couldn't work around that way.
The patch is needed because there's no --disable-gio. I suppose
we could add that instead (or as well)...
Possibly meson offers a nicer way to do this, but this was
simple and gnutls is doing the check this way already.
---
 configure | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index e8e8e984f24..cd79227d763 100755
--- a/configure
+++ b/configure
@@ -3762,13 +3762,21 @@ if test "$static" = yes && test "$mingw32" = yes; then
 fi
 
 if $pkg_config --atleast-version=$glib_req_ver gio-2.0; then
-    gio=yes
     gio_cflags=$($pkg_config --cflags gio-2.0)
     gio_libs=$($pkg_config --libs gio-2.0)
     gdbus_codegen=$($pkg_config --variable=gdbus_codegen gio-2.0)
     if [ ! -x "$gdbus_codegen" ]; then
         gdbus_codegen=
     fi
+    # Check that the libraries actually work -- Ubuntu 18.04 ships
+    # with pkg-config --static --libs data for gio-2.0 that is missing
+    # -lblkid and will give a link error.
+    write_c_skeleton
+    if compile_prog "" "gio_libs" ; then
+        gio=yes
+    else
+        gio=no
+    fi
 else
     gio=no
 fi
-- 
2.20.1


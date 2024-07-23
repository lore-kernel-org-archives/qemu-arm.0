Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2670619njc;
        Tue, 23 Jul 2024 11:10:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW5isEOxlu6LQbFK5E9R1wfBArWITkFDF+IGX+wQmHJlpeXel/IBA/tpKeZR8bXc42hZAJGXBubmnuR2OVR2errRnSOTDj2
X-Google-Smtp-Source: AGHT+IEotnU5aPHf4FvK2Rk5g5DODEo7QZk1Qypb4eweAhdrMftihiBxWqn007oGGHVHY/XELYsR
X-Received: by 2002:a05:620a:424d:b0:79f:16b0:df8f with SMTP id af79cd13be357-7a1ca193adamr80484185a.48.1721758202538;
        Tue, 23 Jul 2024 11:10:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721758202; cv=none;
        d=google.com; s=arc-20160816;
        b=c9gGQWIlwgI7rhr0XfV0guwvPee6njXPQYy4RDhIGkM/uXveGBwuaxhyHctAtAaRtu
         bL14VsTqy+MhhtNO6FmoR2dpBOFfJ0P57VxuzosaKq9ekhI/stjEHFgo2cPg2Q7HxSw5
         CZ4jCoYZwuMwbSFdn4rv4kBE04Ojl1nxPgXjA2uB0p5GAwiWXcCa6E1BhwV3KLh/JM/B
         m+xhxKcNXbpQnX5gC4lGW7FRkpavRJ7LUNG6JMfFxu1jO+UzIh0engTOovVaHgAl2k5B
         89BqDC7yEiTjYdBaoq7nEry0KX3Ve65zlIW2pLdhA9LtbVi3ASFSfNVv7NbHtnuBY3VQ
         gy4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TXCw0+RJXjXO156yoRFr2t5+0iBs33zwi5q8sWmsNWs=;
        fh=b+hr073bRML9iaiA8dyYC7bQLllQsKmavjxXKuQICAM=;
        b=mQMrAJnC9wMHcE8qQS+uAxMMemmHXDbTVQdcM0/zZWNX/CbBVAKy9ZR04WKKa2/t2U
         7U07DhbFjEm+ak2cHMzR0UWTTrSnmVCx51U0Di/HPKS8mtGiJX+/vhHhKA+9w0SvCrLj
         Qun+e8zg2u9uso9T6G1ifv1E9ScFNIP+DZ0AajAk/TIksrArklNHZFYTUNVm3CVULusO
         UGHBA5+FaIeZ3DQ2o3dXwRdeKjR7NxE+y1wUzLmbATWqw+Ln00cgQ6Ql5v8GHc3s6yDt
         XePOJFegfpOcry4Ook71MOdUhdr9LxaVvzzOC0mEVFkFhpdUQGiwEnTIjVW7xYKxqgQe
         mKbA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=Tol5Pfzt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a198f9770fsi1085911885a.75.2024.07.23.11.10.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jul 2024 11:10:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=Tol5Pfzt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sWJx8-0001r7-DF; Tue, 23 Jul 2024 14:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWJws-0001Bf-35
 for qemu-devel@nongnu.org; Tue, 23 Jul 2024 14:09:19 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWJwo-0001Cj-EY
 for qemu-devel@nongnu.org; Tue, 23 Jul 2024 14:09:17 -0400
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-37636c3872bso25955565ab.3
 for <qemu-devel@nongnu.org>; Tue, 23 Jul 2024 11:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721758143; x=1722362943;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TXCw0+RJXjXO156yoRFr2t5+0iBs33zwi5q8sWmsNWs=;
 b=Tol5Pfzt00N2MoDzPVr/9jf2A4IedplMBTNxr74fLgXg00FTuB+6GJZpKdwWAZFQiP
 kvhlp8HpsFJQqebUUfktA7eAUmfzKqfbHYvxVUdOnDDCKnAGTyfqN6Us3H5oa08MbkDb
 G7gcwEZH9LQX1IZP2b6yCYo5o8BzvZtLm1brrC9mibivzBc5AlN6hLLOT6cm8+edbdxL
 g3VhB6NU8xjsbbHYln38o0hkX2sGKAXkAFDg5rt0QE2YVmQwJxGgvMVLzs42WKwDKVoE
 Q78Fo/zcizQOtCBe0FJCXti94Q9LVp+vphjJqFEO13Ao78CvS8c6IaVRM5hfkm63kpGH
 GO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721758143; x=1722362943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TXCw0+RJXjXO156yoRFr2t5+0iBs33zwi5q8sWmsNWs=;
 b=q1mN6oxdZpatRWcEDRW589WydHLgxn0qIOlWwjM0SB1Uq7FiEdQtyb1txuNfGaGBpX
 9nNs879ot4adeHsO/M61OqaccGGVR0E2rclRkuHj7nYenrQuWLNjKt8RXx+Ljwcveq//
 FiibI98plySx0X4KfmOHP7V+7CSePicvEPmsLsqx8hkK4e0Pqv2//r3oL8z0OinigdX1
 9/UWyGXn6qWuIWccAgmk3a+hgYLV8HNHb1qmtsbf4gvdTOejUeaYUrCNYRtUw3PvxFwB
 YLWm565BrD8jC6ESwC79FjFq2VX4gZMtDEy4iVjjqkywpJTgLoIx1zcDVNKiTv8FePaa
 nnyA==
X-Gm-Message-State: AOJu0YzGfWUvA1iV4I36jX9tNp2lvbNaJWkyMBVhudRxZ5arHxGk527t
 WKwkLegEsMxY3i6T5HMzWxXbgZfTdrJQQ1wqUeLtZoxVBoZbQsqeIhYYcnGocnl82ZWfLjWgX5r
 aGjw=
X-Received: by 2002:a05:6e02:1a83:b0:381:d74f:b2f4 with SMTP id
 e9e14a558f8ab-39a16d5a102mr9503785ab.24.1721758141350; 
 Tue, 23 Jul 2024 11:09:01 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-397f7a2827csm33361775ab.53.2024.07.23.11.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 11:09:00 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Ajeet Singh <itachis@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 06/14] bsd-user:Add setup_sigframe_arch function for ARM AArch64
Date: Tue, 23 Jul 2024 12:07:17 -0600
Message-ID: <20240723180725.99114-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240723180725.99114-1-imp@bsdimp.com>
References: <20240723180725.99114-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x135.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: laxk7YgdifQX

The function utilizes the `get_mcontext` function to retrieve the machine
context for the current CPUARMState

Signed-off-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Ajeet Singh <itachis@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240707191128.10509-7-itachis@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/aarch64/signal.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/bsd-user/aarch64/signal.c b/bsd-user/aarch64/signal.c
index ab3bf8558ab..43c886e6036 100644
--- a/bsd-user/aarch64/signal.c
+++ b/bsd-user/aarch64/signal.c
@@ -81,3 +81,17 @@ abi_long get_mcontext(CPUARMState *regs, target_mcontext_t *mcp, int flags)
 
     return err;
 }
+
+/*
+ * Compare to arm64/arm64/exec_machdep.c sendsig()
+ * Assumes that the memory is locked if frame points to user memory.
+ */
+abi_long setup_sigframe_arch(CPUARMState *env, abi_ulong frame_addr,
+                             struct target_sigframe *frame, int flags)
+{
+    target_mcontext_t *mcp = &frame->sf_uc.uc_mcontext;
+
+    get_mcontext(env, mcp, flags);
+    return 0;
+}
+
-- 
2.45.1


Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1147821lfa;
        Mon, 12 Oct 2020 08:34:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8o63B2rb2i8Ylk5EVYSPgeCoR9auYgzVKsE7/ACCkNtmbl/gL0AsZ9jYtKU952AqwXAmF
X-Received: by 2002:a05:6902:4b1:: with SMTP id r17mr6139806ybs.220.1602516868474;
        Mon, 12 Oct 2020 08:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602516868; cv=none;
        d=google.com; s=arc-20160816;
        b=fYZJAWO93g+q6Cq7JrYzutoxFt/34m+XSJLaIjmaHzSkYLBTlW3eBFjQRU/nCuc0Nr
         rOsn+0tEdweJAPnhSjHUx6on6zhOlVU9iGcZ8/R3VptWFNpA8q/14yvR5x3QVTNcpuUB
         pSkG0cKkBBIJNmyLTpWyohNLyO7Em2Q4dH4oxAbGRlKAlvLDlNP/yf0KIdlaLzc9GlRi
         zkGKmykaHNhT1JEL+ZXPc2VJHydrQGclAHSqnnrgsEv8Vg2z2IVVNmGdH2NXjqv4T4u9
         V4XxmSQwRJGstodSWYStGMvaFc+N9rsScMU+4pe5ASanrMxnT9M4MBYI7dTXIYs3m1oL
         aNuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KoCaGxW6EMM71vBXs/YRZpSQP62pAwedz2Y/ryLytRg=;
        b=EXWmxUi+6/pbFhPWgJJqDcfET+/momcBsI4W8TR2Q/JL6wQ5Ew0h/JrFZBzzvXZTCG
         rHdcCkBCMSXtTcfD6DibMOC4UjBLM0TUZ08PByixzdmV+mTObz5P2bkdro5enApLV6yt
         YzrS/Oo7BuzUewITMzfjoU9c/TFoZygzvQmlcvCwdlrH6o3w0Y3kX8wzZmIP6XC5OJfJ
         o4sl+bEhhJ2iPKtTxVPYv8bMW0qVWlum0leQKCH06XUXXNBDTwcREnD40sCSeXhGiuBC
         E9kRUMjXEhu1R8BsTye2EObQeotaenPKLDLe2nk4A90+3ao9FfVRqHa6tpg88y4GOjFq
         h2Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UWSeAvpq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x23si14624412ybi.25.2020.10.12.08.34.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:34:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UWSeAvpq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRzqF-0006Me-Ho
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzq3-0006Lj-Ld
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:15 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:51871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzq1-0007DD-18
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:15 -0400
Received: by mail-wm1-x344.google.com with SMTP id d81so17513790wmc.1
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 08:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KoCaGxW6EMM71vBXs/YRZpSQP62pAwedz2Y/ryLytRg=;
 b=UWSeAvpqEUcDx9zW3wfdb3t3+089b1ZsWhK+JKH+jy0h5yWPgcSz+jt6de5L0rNhJA
 XXejKZUmy6tWNk/awFS+hUdbE18XiNxDF+o5OTCsJ0VML5GsaJiQI6Ycx/R7krLvVM6n
 h+kNd168/kd5AlXxn8Fe1rHuUEfWAbkNYGOrwr/QRilmxb9aNHShvKXiTJquFSLQ0jE0
 Hyi30JQUOd8T5YcJWb9EvntvHC4k4VWt2goKahyEWlw94uRXXv9hADNMhrvSdia3Gycd
 kiDLxxVWtAmCPqoFfOAk7RnOC2wEFLv73ByFVjD9CZDNt4Rk246/Bu4VPj1dCRmYwrdU
 aBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KoCaGxW6EMM71vBXs/YRZpSQP62pAwedz2Y/ryLytRg=;
 b=BTNCtOb33aSJq+8e08/V4C4XZe/QcUAq+3d4UMg8OtcT4YPO6v/8fHnAD082ue/ZnY
 0fnISMuwGVt+pLLoFFCtesDH8qEhwYG2V5aj51ebYsVfvnVv0pE2fmNI4fP+xEuEgZXO
 9jxJCT4UeJ6daDKBVFloGwbV6pOIj5QWJbBY8zXT4csAHAzdJy6RDU+gUQuJCivdU29T
 FXVOQt/9J3aST+iqAhnlhZMKxGOwyq3yl3gnKZ1aXIwLTdK6ZXMcD5o5MivomAUadQig
 71ZBWRw08NpqoH9VwVUVTAtvY98RBmeny8EXycpNVZYQzuqEUQnL74pl470c9X1Dr+uI
 WpsQ==
X-Gm-Message-State: AOAM533PvKtrvRdL8rLUvKcQ2jinEsnnklbdmKh6cowupNI668OMbAR6
 kjYhak5nNOI0rAduJcAJGo/E9o7n9+SybPfb
X-Received: by 2002:a1c:ddc2:: with SMTP id u185mr11716584wmg.21.1602516851416; 
 Mon, 12 Oct 2020 08:34:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] Deprecate TileGX port
Date: Mon, 12 Oct 2020 16:33:24 +0100
Message-Id: <20201012153408.9747-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
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
X-TUID: ip1430utnXxz

Deprecate our TileGX target support:
 * we have no active maintainer for it
 * it has had essentially no contributions (other than tree-wide cleanups
   and similar) since it was first added
 * the Linux kernel dropped support in 2018, as has glibc

Note the deprecation in the manual, but don't try to print a warning
when QEMU runs -- printing unsuppressable messages is more obtrusive
for linux-user mode than it would be for system-emulation mode, and
it doesn't seem worth trying to invent a new suppressible-error
system for linux-user just for this.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
We discussed dropping this target last year:
 https://patchew.org/QEMU/20191012071210.13632-1-philmd@redhat.com/
and before that in 2018, when Chen told us he didn't have time
to work on tilegx any more:
https://lists.gnu.org/archive/html/qemu-devel/2018-03/msg03955.html
Given that tilegx is no longer in upstream Linux I think it makes sense
to finally deprecate-and-drop our linux-user support for it.

 docs/system/deprecated.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 3a255591c34..e9097e089bb 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -387,6 +387,17 @@ The above, converted to the current supported format::
 
   json:{"file.driver":"rbd", "file.pool":"rbd", "file.image":"name"}
 
+linux-user mode CPUs
+--------------------
+
+``tilegx`` CPUs (since 5.1.0)
+'''''''''''''''''''''''''''''
+
+The ``tilegx`` guest CPU support (which was only implemented in
+linux-user mode) is deprecated and will be removed in a future version
+of QEMU. Support for this CPU was removed from the upstream Linux
+kernel in 2018, and has also been dropped from glibc.
+
 Related binaries
 ----------------
 
-- 
2.20.1


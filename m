Received: by 10.223.159.74 with SMTP id f10csp3058622wrg;
        Mon, 11 Dec 2017 13:37:40 -0800 (PST)
X-Google-Smtp-Source: ACJfBoteVzoD4YS3uB1vQ2IFDujGUJ5BNvMxuSwkBOKO39pMfNp/+bvjFB4MDNb9qMHi1AIE39UT
X-Received: by 10.37.14.11 with SMTP id 11mr1459667ybo.276.1513028260255;
        Mon, 11 Dec 2017 13:37:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513028260; cv=none;
        d=google.com; s=arc-20160816;
        b=VHCGZV5qAGoS1r7tIagW4mIl1s6OJLy/eyPV5gSBbQ5GIu3SJ4NMzFMEEPYZDzsaxl
         hx0EGwgEgECq/32ql7MMyyfUvSxEsFaFLnNxuTqLspmgK20RHzPfCwLdwCfVMF6zzQtO
         vWlCOaU8MM9fX2MZuSKZybxaEF4P6+kkrHx0vPC1ZXd4MzH08GP3FDdTisM+4WdxRIYI
         Bu/G+JdD32zuwQtGvVecWIqStgcWMvrPi9HCJWH6ndB9mDx3Bb8jVToCJxk7NzJf3OiT
         k53/H3vHZHHqRQvcgv55Yv/sTOXCv+4HO4mX5JOMZY04C2XlrP/x6IxD2I/6zJXk7RaR
         dDPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Ty+c/nHpZuV2ryMR9Vetge+TEO8E4qKSpfUH6xLUNk0=;
        b=ew5XCkap1qhRdiup35hEpFNsM/VTZYM3Qh851UCxPfzemVK2TvNJRdfjGh6sy1q+kb
         7/4373rGLFMMNQ4yV5fq6QHzwbJSFV1b3JtHlnB+9s5SI/bnwgK+cbzl2jhPPwtu0k0D
         Ea3p6ifbkDMix3DicH3PmOuLmc3yNvoaXJLW2qhfL1je307Rb2VbMADlCqXO2MAhhDZp
         e8p6obVZw/k84eZBAwsbTf9/nEUTEw68PamC2sCZV5hda2aEcequkx192iOzO0Mc95w4
         OX19RADxgRt3Y2pVoxLLnUD/2oFfbyHe7BJPptSj/Cit+Zkws/CzoW1rA9fke/jwdvtk
         479g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pDnq98zT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f14si3167706ybk.534.2017.12.11.13.37.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Dec 2017 13:37:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pDnq98zT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55570 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOVlb-0007eg-Fk
	for alex.bennee@linaro.org; Mon, 11 Dec 2017 16:37:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVfA-0000ob-8x
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:31:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVf9-0004K8-DQ
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:31:00 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:35689)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eOVf9-0004I0-8e; Mon, 11 Dec 2017 16:30:59 -0500
Received: by mail-pf0-x243.google.com with SMTP id j124so12531646pfc.2;
	Mon, 11 Dec 2017 13:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ty+c/nHpZuV2ryMR9Vetge+TEO8E4qKSpfUH6xLUNk0=;
	b=pDnq98zTshPtj13RRqEx1jUPGHLPlzLEcnP0hPzAZV+xlRqH1fz/+m5sUwx92fl5sS
	sfzN22XCliER8VPN8F8Ov5CEi33zUzGCEfx8jzcZzuGZUm20Q8Z1J8wQZ4NXewrAGqF6
	3PtQvSA1xHu1oREU6TQa+PbuU99dM0sFwZXdLygfuyANoG3fX3pXvHW5qhVHUH9h06cD
	K6Vnw0BQALPDxxleO8frWwXSK4U6PXKbZM0V2y/YEVOE4gOiSfxSV/cdM+QIVimLzCKA
	LxzoMBwkhwknzfAWISj/xN9t+lNuCZxAK8VdL00xVtxdBsBR+Bz/yHpxJZuOtkCaX5AL
	yL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ty+c/nHpZuV2ryMR9Vetge+TEO8E4qKSpfUH6xLUNk0=;
	b=iZwdhNvHZA3KoWfKQPLQXc5b39rYCMvHaDSLBnpAV8LflAaAzSmLk3aej0oDpFPtFK
	4g8USizX6P3qFM6lChUhtkFnAOTYqqrSbyWUWbhVqvN2JBh7IzG2QOkcLEvQIuBPA/nB
	t58RdI761jturLAJPaFhl6DlM8cG31d9rwgGngnHl5bko4xGlmKFBM83mHIv+Sw6odLU
	a/0ZS0ejwKzqRTdPbYKadaqVs/R+bD1EQtBaADnBvixoaAgVPDWLugNwn8FyrFzGR2QZ
	arj2Ahp3jzh2FCbmtloIbkKNVizRtTjdHE0q7YdQtASvfy+DmHzyTCrCHlVx1/wSmhpi
	vRGw==
X-Gm-Message-State: AKGB3mJTbkIgm+9RipD7wpAoVc2GACWUvg8l/oH8HNTqzJ8K+ou3e2Tj
	917SH2d9mWc4cTMBydG/pdgxg+sI
X-Received: by 10.84.241.67 with SMTP id u3mr1650726plm.275.1513027857915;
	Mon, 11 Dec 2017 13:30:57 -0800 (PST)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	q10sm25359690pgc.84.2017.12.11.13.30.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Dec 2017 13:30:56 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 11 Dec 2017 13:30:03 -0800
Message-Id: <20171211213007.7353-10-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171211213007.7353-1-andrew.smirnov@gmail.com>
References: <20171211213007.7353-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH 09/13] imx_fec: Use correct length for packet size
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d9dPONbTaldB

Use 'frame_size' instead of 'len' when calling qemu_send_packet(),
failing to do so results in malformed packets send in case when that
packed is fragmented into multiple DMA transactions.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 77d27f763e..6cb9e2e20e 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -556,7 +556,7 @@ static void imx_enet_do_tx(IMXFECState *s, uint32_t index)
             }
             /* Last buffer in frame.  */
 
-            qemu_send_packet(qemu_get_queue(s->nic), s->frame, len);
+            qemu_send_packet(qemu_get_queue(s->nic), s->frame, frame_size);
             ptr = s->frame;
 
             frame_size = 0;
-- 
2.14.3


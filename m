Received: by 10.25.0.23 with SMTP id 23csp1422596lfa;
        Fri, 16 Jun 2017 11:58:04 -0700 (PDT)
X-Received: by 10.237.51.165 with SMTP id v34mr15314945qtd.75.1497639484432;
        Fri, 16 Jun 2017 11:58:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497639484; cv=none;
        d=google.com; s=arc-20160816;
        b=EvaSjqdLYYGJH4Rj8P/ATye4Qs9CKTbPvhVBb6QlAavb2ZJ1ue2vCae93JdkKqwoYH
         RSxZQJZ9NHHKh93gBnxEq3Lr5o8BUSLRifJ+CvTjf9TJRhal7YpuNpmQp0UMBlZLHS62
         cRdW7teywENmPPLyQs9pwM6V2fctBHqSumvrKWvyBioJV3NpGuDTQi/uBxPy/HqQJwoc
         lOgcCrdE3mTnIZ9g0r2DzemYI7hSVi6jKNlU0WEFgoByM2RKMuiyxyJqsJFgClGXvcFa
         fWsEnjU8hVFzgrV2hLrL3gpg4dxq3EKa9PnpkZTjbV+eYI2cLry8IpYSZP7GeqbBB7l3
         pqhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=KehG2H6g2JJPim4VJsGrUuL15iT7nxEP+mulIPNgcMc=;
        b=wOaJCyQ7aUz5nRE0TevQTAEZt8Pov743Cy9nrTEjn6deissxLajLWRZTq9W4/gBk/d
         Z8EYZzknyA7eITc/g2RmUsnVpTeQ/X4J7fWSSLygGvVCkOxwe86TTvixit+ergjaF5Kq
         uD0oG7Vv/5/DKPEk4w1UDfkmlK2nHBR80sa70MzWZ3i0oFNmQrKiWjQT1z6MtZBC+fdi
         1D18tX3AAHtTTrNqlSUcofBQTRi3WFIAA6Fv2EhWwqkgbAEyY+yXL7FowmVANOLorUTz
         2r4a4JXEWWtF7JLO+nbPV8qbkwfFVSzE3v+m0J+CtCwvRBmPHNXP6KIB69PtVVh1VE/l
         IYXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.b=EQVXqGgA;
       dkim=fail header.i=@messagingengine.com header.b=gfK1Kg8h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z94si2587268qtd.370.2017.06.16.11.58.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Jun 2017 11:58:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.b=EQVXqGgA;
       dkim=fail header.i=@messagingengine.com header.b=gfK1Kg8h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60373 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dLwRV-0007CX-N6
	for alex.bennee@linaro.org; Fri, 16 Jun 2017 14:58:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45082)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1dLwQG-0005KI-1u
	for qemu-arm@nongnu.org; Fri, 16 Jun 2017 14:56:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1dLwQD-00076y-1E
	for qemu-arm@nongnu.org; Fri, 16 Jun 2017 14:56:44 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:35599)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1dLwQC-00076Q-Tt; Fri, 16 Jun 2017 14:56:40 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 2EC9020966;
	Fri, 16 Jun 2017 14:56:40 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Fri, 16 Jun 2017 14:56:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=Keh
	G2H6g2JJPim4VJsGrUuL15iT7nxEP+mulIPNgcMc=; b=EQVXqGgA/14q5wUfhYu
	6pjSJSU8H1yypzpBdItmPhpptLmrrmQtDEGQDRedwNq/Z3jAagbpnmFGDhdU1SO2
	1OqT0vgsdUm6F7dyKsZX42GnWSjPtTSG+2jD06/I0UTpK42Rr3ZNudfMHliyjEmw
	399AGtbVg2tyvTOmroo70RQk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=KehG2H6g2JJPim4VJsGrUuL15iT7nxEP+mulIPNgc
	Mc=; b=gfK1Kg8hT1YX9+tRHTYys7Su9COpt+VkD7lWxfqCwOX8TgEqamhGD9kK7
	e4ByjyRWQAX2ec/FBn/wBhPRhCCx832QhQ/mGnlz67HSABvdxQKND7Qe/p52NT3S
	12nXZQEB2yZBfjGhvTSJCGSFxdTdqTQIvHcChLmDaSycupI+/b2EKVluRJr2WEb4
	ZKH09KzMROQuOAei+AL9J+DoCtkvE5jOCYbpqEPgBfBaCR1Ky5btxjvdDp4Nec3M
	8KiKT5ELzjPkKBgAfx5GDWjTCEBoSU2KgglRGrkw6tTHL8uvZdH5NyToo7jp/QBH
	ylYaFXdDhErq+klghrY1DThR04EEw==
X-ME-Sender: <xms:6ClEWfQw7UtynSIWP7x-wCOLL8mGYmF_HAdNEa6c_NvfjlirbKMYFg>
X-Sasl-enc: mCrvMqdj2aV0CgbaWAe4Ju7Iao6AaqZgeXpLLiPVk416 1497639399
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id DA2422475C;
	Fri, 16 Jun 2017 14:56:39 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Fri, 16 Jun 2017 14:56:36 -0400
Message-Id: <1497639397-19453-2-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497639397-19453-1-git-send-email-cota@braap.org>
References: <1497639397-19453-1-git-send-email-cota@braap.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.27
Subject: [Qemu-arm] [PATCH v2 1/2] gen-icount: add missing inline to
 gen_tb_end
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
	Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?UTF-8?q?Llu=C3=ADs=20Vilanova?= <vilanova@ac.upc.edu>,
	Marek Vasut <marex@denx.de>, Alexander Graf <agraf@suse.de>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
	Yongbok Kim <yongbok.kim@imgtec.com>, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zPAXGKK6mez7

Reviewed-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 include/exec/gen-icount.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index 62d462e..547c979 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -44,7 +44,7 @@ static inline void gen_tb_start(TranslationBlock *tb)
     tcg_temp_free_i32(count);
 }
 
-static void gen_tb_end(TranslationBlock *tb, int num_insns)
+static inline void gen_tb_end(TranslationBlock *tb, int num_insns)
 {
     if (tb->cflags & CF_USE_ICOUNT) {
         /* Update the num_insn immediate parameter now that we know
-- 
2.7.4


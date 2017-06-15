Received: by 10.25.0.23 with SMTP id 23csp1013090lfa;
        Thu, 15 Jun 2017 16:04:52 -0700 (PDT)
X-Received: by 10.200.35.172 with SMTP id q41mr9736275qtq.129.1497567892863;
        Thu, 15 Jun 2017 16:04:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497567892; cv=none;
        d=google.com; s=arc-20160816;
        b=OdOyKWoK8IQX0gjUoDJwUd2f1sevfM2IdXXy9FG7iq/BqYNMHaSIH4CjeflQBf1eno
         4jWY3PXuG/aw+vJET9PhsYpHyr8sseNGVAz3d/HvTQ0/OhFbrcwJCZrY9RIvqbk0nify
         o8a6kImHB677I7iU4x0dlW+yWIS6BIuGqUJfv4kmhYg6kgRiZN8dvW9K3qaD6QaYu7GD
         8oLP9ZYGY5S3GbiCavWezdmxv80LNqXD8GgHVKs7JUW1+b4zf5YoxAleGLTd8bJeoRCX
         hafM3+oxKCk9iYR2JItLaYqEDFTF2R+AiJ4M0aisax3oEdeCOp+da5Lm7WNtLuL0VtjS
         u9zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=JxZH6sTHGLmmY06C1h4FeQvS97M60DGjziiZNwlW1+8=;
        b=Yd5SqVbEyUJ1pax06913BSLR3a/5o9ktZaHLgdjkFrMwQN9Ndbo1q1LMEu/SkVC49F
         uCLOh2wmDIg3OLknKzXOMGF4KUNwJXAY5MEQON/s/k+Y+uZShtK9tBwL518f9YfZZpot
         zEyHfF6cgsf0JYEBgky+6X1Bq54KTHVxeLFopT08zOzXgP2bteuZFJNPOQ2ZhEBJtVaW
         Qr8SOz9dYAuJS8gEbgiucp3i+1wzbDxNIl1kKICMKWXyUEgTIixOIiHPkzHPlwVWPOg+
         5lBZyBKVAngwRCrqyVTXUVomEDbvosmZxIjLcc8e3zkSfw1bRHLSB4rSexyl5bPGbMgm
         PxlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.b=XbXKkK0F;
       dkim=fail header.i=@messagingengine.com header.b=diCdjLt/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y186si505902qkd.372.2017.06.15.16.04.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Jun 2017 16:04:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.b=XbXKkK0F;
       dkim=fail header.i=@messagingengine.com header.b=diCdjLt/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56435 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dLdoo-0000sb-8C
	for alex.bennee@linaro.org; Thu, 15 Jun 2017 19:04:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1dLdoi-0000rA-Rk
	for qemu-arm@nongnu.org; Thu, 15 Jun 2017 19:04:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1dLdof-00022k-HE
	for qemu-arm@nongnu.org; Thu, 15 Jun 2017 19:04:44 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:39165)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1dLdof-00022O-5U; Thu, 15 Jun 2017 19:04:41 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 5E82A20C10;
	Thu, 15 Jun 2017 19:04:40 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Thu, 15 Jun 2017 19:04:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=JxZH6sTHGLmmY06C1h4FeQvS97M
	60DGjziiZNwlW1+8=; b=XbXKkK0FdhAqfhCVUV06phJlTtUXQkwjx0NRJOXx+fl
	tu4HTW/lrAKZlM8tUQHrt5tIFn0Dg7+u9/dz87x9KxdeIZ3YU/ppEFuR/kJgug3z
	C8kBF4kM7kD76fKMCvB4uGlq3xjF5P8/U3lyF1GHtVOERktcZuMVvF+fZdLGL39k
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=JxZH6s
	THGLmmY06C1h4FeQvS97M60DGjziiZNwlW1+8=; b=diCdjLt/EZCqAHw5n5Jp6H
	itRi/WBcdf+JAR0w7tCWdHIIeSUBZgruXgqQ8RVf7OIOQKdIhuDFXR0LnWXQ2vgb
	IFGeS3mdZ45l8HCvE37Clfj0v0GoyLgBv32PjyTMs54i5CKBIcLRIy+vWNcTdzMx
	OPdt7yH9mkOXZJpkJROTmLic1ZgUKkZfoXWROO/iOmPWhgM5XxI1V/+hoq/txEBU
	PLbVrlw4jHg68gnzQuMpWdpOfzm3a9LizO9xBFUAqaClzZ/LiWvFreLowRhtxGAC
	fcFZeJko657/9cnuqwGYmVHrUGzmEaRRD7BHPgxf5tQReeN0tLz0tkueW38Pmr0Q
	==
X-ME-Sender: <xms:iBJDWS4yLCwvYo_Ok-sU4Vnsln9CtQbZGAEocNSO3J_Ef5Wz9J-44Q>
X-Sasl-enc: lLnhWQX+5QyJCI8Gw/w9/L27Ay0gClFUePGAhOeghKnF 1497567880
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 13EE77E7B1;
	Thu, 15 Jun 2017 19:04:40 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Thu, 15 Jun 2017 19:04:38 -0400
Message-Id: <1497567879-13734-1-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.27
Subject: [Qemu-arm] [PATCH 1/2] gen-icount: add missing inline to gen_tb_end
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
X-TUID: Wgm9I4AtVA46

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


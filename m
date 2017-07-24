Received: by 10.25.44.15 with SMTP id s15csp4183182lfs;
        Mon, 24 Jul 2017 11:31:53 -0700 (PDT)
X-Received: by 10.55.187.134 with SMTP id l128mr20449920qkf.90.1500921112971;
        Mon, 24 Jul 2017 11:31:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500921112; cv=none;
        d=google.com; s=arc-20160816;
        b=PWxb3QgogmeHJCRj9pwOLI+dk0Y+UVOaIU5JdoEUCJ2p6UyzFFEEUKfiWVxkqzZjYm
         rkLoA9oACHnRzWuFYSUO/1ZhzKazAmtVMAM5wuJuusGUOc1jAs/8Q6DUsm1GlnK4avYL
         9K8hodXzvBvSNL7XB51iCsSv8uM3Hoh2RIBCxgttehnWDseq1Q+0AYUXrwMJWhlCBqRg
         J0N9NlNcEfqGEJBWW7xGLppuQAj/ix7Nh2ArNzwfjOWHfFLQqk5lTClSeulk7okC1iny
         5f5IMtdIwSo6XMCaH2bu9pya1Ln1LC2O2LE1oI4YdDMyveiw7tdmH3pYEJAmXeRPnkHP
         H5dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=DJN8oVzpVUYcYtkQuxilHKkP87gLKQFAVwc7SRaL0pI=;
        b=xbR/tu0yDjPqQTlYd2UdwYb2fGGapzX2a4hYQmaVF4ygPSY73b+oPb7jBFj4WYt7cU
         1FMbuAefKe1PzNTVoipU76x5idh6ToAjjQJ12TZx3XASNHCO03cDjTBzJzu5KX6PL6B7
         x7L/nhvOLW3UgNfRnNWl8GbWbzc8X7o05SmdiDwOKVZp+w7thNP9HMUfllsLflvNPcox
         LfX2FPHIGEO0y37K0yQhTO5TpLVwc00KdAC8DGm5mwo5sWFOQmxulgOEn/qThB4yEvw4
         Ln+bzlHn7PIYA/Pvk8AkM4VYFwhnNbDqSddNVwPe2Mpysl/w/hGQUK2Ht2VIeiteFdnQ
         y1aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=cJGKwlC+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 137si9211142qkf.66.2017.07.24.11.31.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Jul 2017 11:31:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=cJGKwlC+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56328 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dZi90-0002k3-4M
	for alex.bennee@linaro.org; Mon, 24 Jul 2017 14:31:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi60-0000A8-KO
	for qemu-devel@nongnu.org; Mon, 24 Jul 2017 14:28:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5z-0004rL-Dg
	for qemu-devel@nongnu.org; Mon, 24 Jul 2017 14:28:44 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:34302)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5z-0004rA-9Z; Mon, 24 Jul 2017 14:28:43 -0400
Received: by mail-qk0-x241.google.com with SMTP id q66so10661855qki.1;
	Mon, 24 Jul 2017 11:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DJN8oVzpVUYcYtkQuxilHKkP87gLKQFAVwc7SRaL0pI=;
	b=cJGKwlC+mMBkGvKcoZVR2OCV95oel7GvNcwTaVXI9inW9UC/hLe8BwGogCV4fjhX8l
	c3EJmp80lnn6K/uFRG6EaY6Im6JYLut7+q5oP234ka3oOR5+Vx+nJtbinbDx6dHZdV3f
	xGdaLc0RssKrss1D3Q33l+guwk3waNVM2Y1j+nAHjSLeUUgkK8uPncBoDZ5Uw1knBikM
	ITXfks6r5dN4AmqVnvj4JjNhDsDaT3gmJNAgBE0OxiftzbpJZj5p3pQZXVPuFYEzdgQO
	mXpxf4ejoFRf7ncgXePrIGJLnRthR0dvJS4QAZIyq0R60aCTE4Gp4WxZdRhFvG+27KTT
	6eVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=DJN8oVzpVUYcYtkQuxilHKkP87gLKQFAVwc7SRaL0pI=;
	b=WqPKrCU+NozPHa8rZklf9568B9bwQ9zBWDMpnfXOlMfh1jprz649BlXqyPAl8s2Xi3
	VPOkisyVM5bTAb3jmdS/7NaUDKlhnPUP3U+7MQlw6mbF/LxKZj1Ze6q8QpkB0FWweFtE
	hubhx6AYww/yEBoldasa3gbVlB1F9X4YjbJPIGrHIpUxak13OLDkwA4ukYGGT9gBEc3m
	1ihsYdu0DUH9QtAcNjz5C6wVsrBLn4EPuROUXTwA31K5hp7D4Un0Uxbs0pNv1GhyGeWV
	TQ/fEPEoYvShIE+qrMjq7ZspXSTCGFxVEnZ8ymcmnbu4S3URx+qrou28lNKYVpMLblZW
	9ADQ==
X-Gm-Message-State: AIVw113WzllN8jOq9E2XwlERWGB7/g8dze9QpEXMvzTlmHswiAxsNNxB
	MsVRFK/OeoLFsWF2t4M=
X-Received: by 10.55.40.194 with SMTP id o63mr19675839qko.310.1500920922864;
	Mon, 24 Jul 2017 11:28:42 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.28.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:28:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon, 24 Jul 2017 15:27:27 -0300
Message-Id: <20170724182751.18261-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-devel] [PATCH for 2.10 11/35] i2c/exynos4210: correctly check
 i2c_recv() return value
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i1uIGCT+GkZE

i2c_recv() returns -1 on error, if the I2CCON_ACK_GEN bit was not set this code
was setting i2cds = -1.

i2c/exynos4210_i2c.c:117:20: warning: Loss of sign in implicit conversion
        s->i2cds = ret;
                   ^~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i2c/exynos4210_i2c.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/i2c/exynos4210_i2c.c b/hw/i2c/exynos4210_i2c.c
index c96fa7d7be..4424dbd233 100644
--- a/hw/i2c/exynos4210_i2c.c
+++ b/hw/i2c/exynos4210_i2c.c
@@ -111,10 +111,12 @@ static void exynos4210_i2c_data_receive(void *opaque)
     s->i2cstat &= ~I2CSTAT_LAST_BIT;
     s->scl_free = false;
     ret = i2c_recv(s->bus);
-    if (ret < 0 && (s->i2ccon & I2CCON_ACK_GEN)) {
-        s->i2cstat |= I2CSTAT_LAST_BIT;  /* Data is not acknowledged */
-    } else {
+    if (ret >= 0) {
         s->i2cds = ret;
+    } else {
+        if (s->i2ccon & I2CCON_ACK_GEN) {
+            s->i2cstat |= I2CSTAT_LAST_BIT;  /* Data is not acknowledged */
+        }
     }
     exynos4210_i2c_raise_interrupt(s);
 }
-- 
2.13.3


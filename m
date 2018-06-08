Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp748534wrq;
        Fri, 8 Jun 2018 04:20:31 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLrckt2EYP5YaMK+h0yeBVxY1RZSiG+k4dq6+V7jOTu3sLKAka1R+YFj9q7vBulAm3Ci1VU
X-Received: by 2002:a37:c3d8:: with SMTP id r85-v6mr4870177qkl.347.1528456830974;
        Fri, 08 Jun 2018 04:20:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528456830; cv=none;
        d=google.com; s=arc-20160816;
        b=or08psYGrxqrpNscDiOWEWva3lEkZ3JYC79z9saNLNPu+oC2Gj4RRxM1YNrknkOrSW
         pzYBcrKOD5bgMo3RURlpK8uzxouKYvKdQjGrMKuLuzB5pWRuAQK2V8uiXDa8+X+X8ys3
         aPp9A8nWHPnswNzmAZb+jznvJbCJ8Iexh6B44SkxsmFgsxFL8ZObrW8QypIEH4mHOPAS
         xiQt71ObzJ/TiLPCQ8C9fpjahh3l3Hkd3Nro4JWoEeoHthtYTu4aWmAcwAaM4XQO2EGl
         jWcnW9V2ozrfdk2s9d5Dp2fwmeFOilo7RvImIG5FCu9jnNozq5TSZgsGds3iJmkl0P3j
         XPzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=nDq9QWs2gFkdWZc8F8efOhOkVzAe7RtXhzjFV7/ovSQ=;
        b=BdwqrgyJLwwgzxkshGfET4a61tPxy1R3PpiSrRo6eKwBU7BSlOFjuo5gVx6qIwczy/
         uJxVS9MHfBtiVdHQvA+lTZI2EY9VSihO+1ooNrI/B0XwUCoS3TRA4CtgCir3uMAoktgJ
         61njnnE+PH8+PHlDjWQRKGOMJVLS2WY7YqT+sam2qCQvb9ygc2U8IMkpiA9GBPTH3Cbh
         PJR+6jlTAuYUxpsbtkDpLooNYfVvFFdZOkkkTb12rxbU5xRIcdxnAq0qK4dxAecz7yEN
         gq38O7Z7frJYdNyHPYeDQc9qCKHjpTxWnDhyBkTs6/1u6ihk0ucmgN3T5QY0y9HT/TyL
         xKCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y123-v6si173092qkc.105.2018.06.08.04.20.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Jun 2018 04:20:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34730 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fRFRT-00084K-65
	for alex.bennee@linaro.org; Fri, 08 Jun 2018 07:20:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fRFRA-0007vN-LF
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 07:20:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fRFR7-0001fP-KL
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 07:20:08 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54608 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fRFR7-0001ev-H2; Fri, 08 Jun 2018 07:20:05 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 271798886E;
	Fri,  8 Jun 2018 11:20:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-155.ams2.redhat.com
	[10.36.117.155])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B04E22026990;
	Fri,  8 Jun 2018 11:20:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id E3F089A8F5; Fri,  8 Jun 2018 13:20:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  8 Jun 2018 13:20:00 +0200
Message-Id: <20180608112001.14729-6-kraxel@redhat.com>
In-Reply-To: <20180608112001.14729-1-kraxel@redhat.com>
References: <20180608112001.14729-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 08 Jun 2018 11:20:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 08 Jun 2018 11:20:05 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 5/6] ramfb: enable vgabios
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
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?L=C3=A1szl=C3=B3=20=C3=89rsek?= <lersek@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7bmNoopGj2Kp

---
 hw/display/ramfb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/ramfb.c b/hw/display/ramfb.c
index 258783fe3b..477316a14d 100644
--- a/hw/display/ramfb.c
+++ b/hw/display/ramfb.c
@@ -88,6 +88,7 @@ RAMFBState *ramfb_setup(Error **errp)
 
     s = g_new0(RAMFBState, 1);
 
+    rom_add_vga("vgabios-ramfb.bin");
     fw_cfg_add_file_callback(fw_cfg, "etc/ramfb",
                              NULL, ramfb_fw_cfg_write, s,
                              &s->cfg, sizeof(s->cfg), false);
-- 
2.9.3


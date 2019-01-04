Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp867908wrt;
        Fri, 4 Jan 2019 10:07:51 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4zkFYUtenhc/eks/+fYi5odXnZr50cFu829Au7IuFX3YQhPMItDF9ILKovFhfMI0wQG9p9
X-Received: by 2002:a37:62d3:: with SMTP id w202mr47135961qkb.357.1546625271450;
        Fri, 04 Jan 2019 10:07:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546625271; cv=none;
        d=google.com; s=arc-20160816;
        b=Fj6UkdjkECSCtikQ2ntTyxY4UpfI6moS7e/vlREOoHTtiA702DOY9wpA502nYg167h
         /8en98HZLGwh4lR0kNl718Gf1+bEicW+JUlnt05ufdItloCE7DN77gm84NfbN0hGZ/D5
         vPdwJkhC8Eo3SOSkMfR0xUCcSf/NlkkPaVzTPusMonxQMbCl9YIjzUc20/DHqmsfB7f2
         Y/SF6fqMgWL7VAfrlmj9rDZRHZ04cDUGvgxN6JUsAG8dtKgj3JDUkHWRnsE+wk06o4Ke
         BpJ4PohcaAewNO2KgucguZggF/66z+qUy8JLIGnmy8lmVZcHQHZ76ViuWzR0/iyNCGKd
         jBTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=5RJksYk8/QtKFTGyH5oCts2XNrxDwuFOeKoROkyicOw=;
        b=ziRcUMmmW6tDWhD8yaB3gjhvhUeYLDevZnW174CvYZ5/KZiC1jFMpppsU7UgxNFFnk
         3G+TCHlzL+Kqg8uVfmtdwSRPXiJI34Umgj0XHryrI+Nw0ZI/1YOIbk2RQji5EUyHnvJd
         IIfXb3bSqeU+w/AfiCsM7Usp5gaupUFVsA/U50C2rTeWRN+Enr0+K9nPwL81RkOS7yrT
         KcyJcMdmiE+QFp+CkXw8NGfffm/lHddZzdanfw8e97MeyGuG5030yh1IlXl/zgh3b51X
         QHJzFw9ovKCEpK3nLNYPlICdTz2ailqqw4QkROweIE95+MkOLkLHyivWJ1mwo4qWo5w4
         wNDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id v20si5219279qvc.134.2019.01.04.10.07.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 10:07:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37781 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfTss-0003Oq-Qy
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 13:07:50 -0500
Received: from eggs.gnu.org ([208.118.235.92]:52550)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTmq-0005Ad-CK
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 13:01:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTmo-0005Tw-Fi
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 13:01:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35560)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gfTmo-0005TO-9M; Fri, 04 Jan 2019 13:01:34 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34D9A80F88;
	Fri,  4 Jan 2019 18:01:33 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-119.brq.redhat.com [10.40.204.119])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D7255D6A6;
	Fri,  4 Jan 2019 18:01:22 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Date: Fri,  4 Jan 2019 18:58:42 +0100
Message-Id: <20190104175847.6290-12-philmd@redhat.com>
In-Reply-To: <20190104175847.6290-1-philmd@redhat.com>
References: <20190104175847.6290-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 04 Jan 2019 18:01:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 11/16] typedefs: Remove PS2State
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Joel Stanley <joel@jms.id.au>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H4GfAq6aQrle

PS2State is only used in "hw/input/ps2.h", there is no
need to expose it via "qemu/typedefs.h".

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/input/ps2.h  | 2 ++
 include/qemu/typedefs.h | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/input/ps2.h b/include/hw/input/ps2.h
index 213aa16aa3..b60455d4f6 100644
--- a/include/hw/input/ps2.h
+++ b/include/hw/input/ps2.h
@@ -31,6 +31,8 @@
 #define PS2_MOUSE_BUTTON_SIDE   0x08
 #define PS2_MOUSE_BUTTON_EXTRA  0x10
=20
+typedef struct PS2State PS2State;
+
 /* ps2.c */
 void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg);
 void *ps2_mouse_init(void (*update_irq)(void *, int), void *update_arg);
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 927b340bb4..181f8fa68e 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -82,7 +82,6 @@ typedef struct PixelFormat PixelFormat;
 typedef struct PostcopyDiscardState PostcopyDiscardState;
 typedef struct Property Property;
 typedef struct PropertyInfo PropertyInfo;
-typedef struct PS2State PS2State;
 typedef struct QEMUBH QEMUBH;
 typedef struct QemuConsole QemuConsole;
 typedef struct QemuDmaBuf QemuDmaBuf;
--=20
2.17.2


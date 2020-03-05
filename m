Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp3201217lfi;
        Thu, 5 Mar 2020 09:57:14 -0800 (PST)
X-Google-Smtp-Source: ADFU+vskAIFhFthxGUonZ/H9hREe4koqJ6uzU9gVGiM4u5/eti3maCe9VYQtRNdGuCxPj80o/Kc2
X-Received: by 2002:ac8:7446:: with SMTP id h6mr8559282qtr.274.1583431034702;
        Thu, 05 Mar 2020 09:57:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583431034; cv=none;
        d=google.com; s=arc-20160816;
        b=fKS7pV/CoJLJGp5x+kC9n3jAGhbuBpsIacTn7MIeTbkMTTcCajpzwkd4nly8Ue6ctS
         qpt3vdegmJwY8x9wtTDEU3Z18l9XkOjdyTmqEDlUlvu9d3q9drgglZadWVAXYyP7ofDf
         BzIVoUQHRPuDiVT7bjOjTsKv7gp73x10jQpuLBeBd+CGWE/XU7CDeXEKf7KIv6GIQoAU
         5+DGU9GWvf4bI9IfGCy9wceTQTt++70F4L5fSfAGpHuvNjx9Lh0pjXyfWLLMpqGgjETC
         +GtmKxDQ2rmCnpRQyWoRetF/wQtH3Uq33d2XMi0Bbse4bXcDOF90gC6x31THBVjKAt8I
         NJJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CS6YPb3Ihef4vMzBH/zBkjylrRdhrNd8BsGM+mGSMes=;
        b=HP+fgSKo8/OwChNcEhFnx3t9/defDgB6OjB78bHg3EOaDbLdQg4F0i9/YFh44g/h/Q
         2OmcD3O1jOyMN+3xE1OQLyuhGSjsUt5hrpALwqODr8ZEneYRxafJygicWFhu+hIdASYd
         pQAYVgCtBVFIuvBXOrufV88Kym6DA8QoBna9HbfVSsNSpZHENItSs5KV2W/wVZFBKWPT
         e0sAtJXQJx0/mXFPcresRCRSWGY5oqbepc7FY8yMR07+ybo8qN8nIGOM/f6dBy3X0KzP
         D6reY/kp7jf2zZGyps+EcQgf/tgkPwW5oghbl+Ejw+f5yVpJ8AJW+8EJwRvo2vYffzbM
         3i7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NZq7qJIW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15si3172364qvm.28.2020.03.05.09.57.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Mar 2020 09:57:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NZq7qJIW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9ukD-0007Dv-RX
	for alex.bennee@linaro.org; Thu, 05 Mar 2020 12:57:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47016)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9uk3-00076v-75
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 12:57:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9uk2-0002gB-7W
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 12:57:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27336
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9uk2-0002fq-4Q
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 12:57:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583431021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CS6YPb3Ihef4vMzBH/zBkjylrRdhrNd8BsGM+mGSMes=;
 b=NZq7qJIWc5QspMljdCRMnTtUpGDjEJSj9cvstJJngvms32T/uRMNGhy0BFlIgUtM6mp6x/
 /t5JEHWkmoE8CFq//7eeLfS4JdTo87zArIg8FpBMRD+OxGgiUAf8lU+5mM3n7755ZVXWXj
 XcBvgkji+iapkTcg+0onFbR6csMr/a0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-Wff1lsaDNOq5hXGdEfvx9A-1; Thu, 05 Mar 2020 12:56:59 -0500
X-MC-Unique: Wff1lsaDNOq5hXGdEfvx9A-1
Received: by mail-wr1-f72.google.com with SMTP id u18so2582304wrn.11
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2020 09:56:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6JrFb878lHzGwYsPjMk4F0hM2hVACJ2Pnf75ZdCaRHg=;
 b=VNDqArO7aS58R6/JxUF9CMAcd6vvslks4JPW454xP9vxLaoub/G3XKQVpr1vYhX3Hl
 GDX8ShyskQqonoQVoX7LaviCdBAHRXzxJqM023lmdI/cxhentA2pY1WmUbVbDoswD0Oh
 qvjMPFjPVtNuMe1kXPFsGBJ6/e27eIt22wWbRtm3Wb6c+a4sc6nRPyriJalhv6budBIY
 qoxmFn9Og6bUHfP2aMonfHQ2mnFh3m1VJ+t9s3ihbsKveWNFXreBi9C1aGLkcBid6SQW
 jW/RhHJUrkDPiZlwohL/1M+gAQlZYmoi4Jm3oVMU4cz555zYr15eS4z9XA0SStwLX/zy
 XDAA==
X-Gm-Message-State: ANhLgQ2+Iq0TddwqM0ylcAFgNJdsMS0gi9ZsApruopqMxvQCvHzwUMwi
 YSigPKQ8RmItNuXoUOX9Q+yNpaya8qFyudpT5iboV1IOYCOFnd3VrHsC6pWK+03LWc6HtqGwxOw
 hUeNizfzWbcAj
X-Received: by 2002:a5d:4885:: with SMTP id g5mr97801wrq.93.1583431018454;
 Thu, 05 Mar 2020 09:56:58 -0800 (PST)
X-Received: by 2002:a5d:4885:: with SMTP id g5mr97785wrq.93.1583431018221;
 Thu, 05 Mar 2020 09:56:58 -0800 (PST)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id f3sm15240718wrs.26.2020.03.05.09.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 09:56:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] hw/net/e1000e_core: Let e1000e_can_receive() return a
 boolean
Date: Thu,  5 Mar 2020 18:56:45 +0100
Message-Id: <20200305175651.4563-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200305175651.4563-1-philmd@redhat.com>
References: <20200305175651.4563-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: qemu-ppc@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Joel Stanley <joel@jms.id.au>, Beniamino Galvani <b.galvani@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OX1nmP8MEN9U

The e1000e_can_receive() function simply returns a boolean value.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/net/e1000e_core.h | 2 +-
 hw/net/e1000e_core.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/e1000e_core.h b/hw/net/e1000e_core.h
index 49abb136dd..aee32f7e48 100644
--- a/hw/net/e1000e_core.h
+++ b/hw/net/e1000e_core.h
@@ -143,7 +143,7 @@ e1000e_core_set_link_status(E1000ECore *core);
 void
 e1000e_core_pci_uninit(E1000ECore *core);
=20
-int
+bool
 e1000e_can_receive(E1000ECore *core);
=20
 ssize_t
diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 94ea34dca5..e0bafe975b 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -967,7 +967,7 @@ e1000e_start_recv(E1000ECore *core)
     }
 }
=20
-int
+bool
 e1000e_can_receive(E1000ECore *core)
 {
     int i;
--=20
2.21.1


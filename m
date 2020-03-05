Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp3201379lfi;
        Thu, 5 Mar 2020 09:57:23 -0800 (PST)
X-Google-Smtp-Source: ADFU+vuA7pfueBv4TPjgArIBi+LwgX27KtGKZUiv0KggmqvNuj99tE1YsBZoMd0JdNaXa1eoVi8d
X-Received: by 2002:a37:618e:: with SMTP id v136mr9047297qkb.481.1583431043619;
        Thu, 05 Mar 2020 09:57:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583431043; cv=none;
        d=google.com; s=arc-20160816;
        b=SeKIcKsNDifR5467+x9QNM3lLM3M49YzkAeFOhpCFzCf9nrR3YGFOBqYUTVzOF95y1
         ysR0dJt7rCWxhmtaOtrFIBSR/PXJIUz+wPQjjQca/1p8oDwE78ICVJudd0egjlqvbgkp
         I4ELn88ZvVkkbCbtG1NYZfeXfsQWxQrEMQfFWh4a/MFJqlbv+Y+ylM8E8V92gE4NdUm1
         0Vt6UU5t78BRcSX82gVwsaOAS+Kxz1i1NDRqJayg9p1xE+0TquPCDYkiPmAkjxx2Z6Yv
         8j9eGe6whZ+6eujqOjKqU3a4GbWpJDcivnM0U2xkR87TCHz2V0Eep8uo0aZTOkmpsF5e
         9u9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Tw4AXOFUsVnWWH/+MEC8+/Jzhzp7Eu5EQAdmUFQrX44=;
        b=vT/Tuq7pVcavW7C0pvqsb6LzTbrHgcRI57C1k05TAHHg27W0/i7i4N8EpzzMlF1cYI
         AWHldKrCc7/JkCu9Jy5gd4xb5a4frK+isyM8xEU+nYJnAkkBSZqaz9D0ifksupyWl1BI
         +/YnRqbiGZ5zVV4c/KLCxN5pRWQztjVkaFGPgFUgF+0VT++SBs2Kc/gD54VA6KwlKRTz
         nl2Y/tVK0Q+LFAsi2PtzqewRAeCPteN2nsv4azPW4niru8JE3Gu3E7KU8C1TB5VZFT1F
         S0TkoMXxN+lVIQfpKZ2x8/669HqCCfCQ1DoeWMtByjTztl+s/Sb4gwdlWgh2EHXvxBLl
         qogQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QrUl+qX7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8si1810894qvf.185.2020.03.05.09.57.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Mar 2020 09:57:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QrUl+qX7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9ukM-0007UW-N0
	for alex.bennee@linaro.org; Thu, 05 Mar 2020 12:57:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47071)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9uk8-0007H0-2G
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 12:57:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9uk7-0002ki-18
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 12:57:07 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52645
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9uk6-0002jp-U1
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 12:57:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583431026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tw4AXOFUsVnWWH/+MEC8+/Jzhzp7Eu5EQAdmUFQrX44=;
 b=QrUl+qX7YjvvjTEi0ddyZwljl9VY6VpIEHCeM4702cd9LzZw9uCHaKO1IIPy7RR/ZWFLfh
 gLpFoONjMFjZe1ureK37acscKKSFjD8JIEGYepbIAo0Rit0skoXxDCXSo0iwi/ZUAmy71H
 mzpUACiBlj9QMnZqnvJLpM4pL64atQc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-k-Sv3GPoOTeYpl63-9877g-1; Thu, 05 Mar 2020 12:57:04 -0500
X-MC-Unique: k-Sv3GPoOTeYpl63-9877g-1
Received: by mail-wr1-f71.google.com with SMTP id w6so2589428wrm.16
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2020 09:57:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+MbtoWKkcqHCz+vfqyTzTQ/PF32JMBmzxf8ccd5VY20=;
 b=AaZyrvknRT/t6dVe3PkXVqF94d/PvTCp4ebnUkdZlsqEcIoYGIlH05USSIy+/PnYry
 E6qu6NL7WcmQJMFmi01oo+jWdS8ZcKx6BJo5cEMfTcp14TdCZclqyQxLkLzpWs2Ut+aL
 Vc7f6Ghw23LHQ4Wfwh4vO/kQDYNyhjdMASJUWRkGtDS9fiGBjCf83yHBVsyOH4yBWwnU
 Hg/uBNkveymmDODCRuaMzQ9N95QHzEZmAo/qMHCH0m/WM66OKTGvLaxV5ocvqEvtB9Rw
 bQbtLNGEh/BSQ/LkTcNzGLrSXiwzlN9wYWa4koSoaY/T9ym6AJy2nBm33yGlv1ZvRxeT
 lscQ==
X-Gm-Message-State: ANhLgQ0EJjbF8rNKnjGDzpo1HUP5KCTgTuKrFctKudmpyy6zRShDZpJ2
 HEMvWVGyaJM2KDuqY5lmvkdLvmWPIdRsgAWZwAABLYfoJfjXZP5pJS+v1YsePc7LdsYOOuqHclT
 FTFh8tyyZkAtu
X-Received: by 2002:a05:6000:108:: with SMTP id
 o8mr120889wrx.312.1583431023632; 
 Thu, 05 Mar 2020 09:57:03 -0800 (PST)
X-Received: by 2002:a05:6000:108:: with SMTP id
 o8mr120874wrx.312.1583431023428; 
 Thu, 05 Mar 2020 09:57:03 -0800 (PST)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id d203sm9699558wmd.37.2020.03.05.09.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 09:57:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] hw/net/smc91c111: Let smc91c111_can_receive() return a
 boolean
Date: Thu,  5 Mar 2020 18:56:46 +0100
Message-Id: <20200305175651.4563-3-philmd@redhat.com>
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
X-TUID: aTbv46QOAzTm

The smc91c111_can_receive() function simply returns a boolean value.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/net/smc91c111.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index e9eb6f6c05..02be60c955 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -130,16 +130,16 @@ static void smc91c111_update(smc91c111_state *s)
     qemu_set_irq(s->irq, level);
 }
=20
-static int smc91c111_can_receive(smc91c111_state *s)
+static bool smc91c111_can_receive(smc91c111_state *s)
 {
     if ((s->rcr & RCR_RXEN) =3D=3D 0 || (s->rcr & RCR_SOFT_RST)) {
-        return 1;
+        return true;
     }
     if (s->allocated =3D=3D (1 << NUM_PACKETS) - 1 ||
         s->rx_fifo_len =3D=3D NUM_PACKETS) {
-        return 0;
+        return false;
     }
-    return 1;
+    return true;
 }
=20
 static inline void smc91c111_flush_queued_packets(smc91c111_state *s)
--=20
2.21.1


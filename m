Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5946631lfp;
        Tue, 18 Feb 2020 01:54:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqxYBdC9ICBR/54qOR81KXsjN8CWRPIVAylMM89QVQ822BwMqFLi467Gzuk1hVq8aNCW1Irh
X-Received: by 2002:a05:6214:94b:: with SMTP id dn11mr15547903qvb.12.1582019680831;
        Tue, 18 Feb 2020 01:54:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582019680; cv=none;
        d=google.com; s=arc-20160816;
        b=p8jPTAG+HVM5gSPCBLl5zU65Q+/Ju3AGscszRoCp6lNfaGYpuq0m7t3dEkQgUThHoM
         clZ5RLjTqVl1Ivrm4W0nn8Zd+bmtNpJDr/wp+LbOGWfcaAVNPY/s2GWX7ncl+NcO7///
         7HdPwQO5QtveVWHt3yupkuDhUB9/uprHmLWNsCPq0JFnTvDDKUhDPvowLeVzbOnscSrU
         BzAzymjfJVdNT8SlFxH3LptaQd+cY8iU94SWe+OsSQQsMpeOzEhFiW0fvNiEK+tkL4z5
         gGhR6rikQ/B3+CJtbi7eK3Ht3ZCNO9bZDyRNhNMk75leZUNg/boRbpy22nkHumXBolg2
         0H6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LTgf94kcfqSZ8hoLehGhAHOfOM4ZjXUraqazHdrIszo=;
        b=ZJ2jAk3zzdyPei24qEl6eBRfTsEMbvhburirCwSPLTZv4lZ1qIaegCuUBwLmMWf1do
         zbsH3HR2BYGnCZtp1pBoCSCnJyqM8o1YauaIDA8swIiPlFVb5O6OlU39yVVIwL4dj3Bc
         kDUXnNac+8ZcD5UooMxft5nhcOjpmwalzKXWCT/5EFZMAz7AT3gMQoUIXZA0ey/s2Png
         ktYmZZCHYOq06eHZ9X3nppS16ZtWoioyBkYBB07Y0HiNaRcdwg8CpbCuwW7GCxymuaAq
         P7yXTNksH58WI9gQU7FfoX6Hfg25lFbX586qB/sVTQ/norPJfMJE7YWLvGRhpoY8DT+J
         v5ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dt5TahMA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15si1452274qtn.171.2020.02.18.01.54.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:54:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dt5TahMA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zaS-00034z-AU
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:54:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43759)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQj-0002AR-Kh
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQh-000695-JH
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56446
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQh-00068X-FO
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTgf94kcfqSZ8hoLehGhAHOfOM4ZjXUraqazHdrIszo=;
 b=dt5TahMAVjIrUrEYK8WaGeMHJ2FZ1tSGin9ieJ/OBbTicvfaQwmF5VO9sn23FOyRESdtXb
 uE1G0N8L0HdiBU9VAp/+s/eg6nTC9FXEM2EPC3SErQ6aFVMoZIkp6ETFVBf+ofqcyvX+il
 jiQItMDHIEcEoficVHQLZSoU99vLN9M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-MHi__idqNIOVBuBic9tqMw-1; Tue, 18 Feb 2020 04:44:31 -0500
Received: by mail-wm1-f72.google.com with SMTP id d4so872845wmd.7
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 01:44:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JB0VIXdKqYha385dFm6Nf/XSPsPS/89dyx6biXJISb4=;
 b=FWPDAqh/fYT4Dl41LYVy0zYY6PDQHefSLU6HikVOV/Pxs0wOcOfRtIwv5UG/QI9MXQ
 w/TX5bvMy6kMHxmETu8O0nxFtmUXzJMAgCxTQuXrkYtb9a8siWnQtAzbg9Fi51PgZZt9
 l6lqIodpAJCHBXSj3QhYlFIsX2sn+bt+t4UJVOs9G4QDcOblUX1Vm6QK/E8GAiuTrlXo
 5+rCYiDNbe4OlpL1JtjAg3+zSoVMLC8wGLi1hrjgLn7wH7wWdMUULxB4rhYmWLslUWTv
 u+045Y24p8JdhNSp6IYOFB5QhVifzPyzvoiQwzikR/5Q4hl/lhkeE4Ef1nI6n3t+qckI
 9Brg==
X-Gm-Message-State: APjAAAXosIs1Mjfbz6GvzOAwKsO7IjlDdNe+fBuljHqWX9OOL2PXuBs5
 ZFbjGz7aOt7c26ic0YzT0ErYg4tNiE5fIEAhRBpBqKbYXvX59vVO2RKOy10Bf7xkUbXGbojAsKJ
 CSH9mTQzEnCiU
X-Received: by 2002:a05:600c:149:: with SMTP id
 w9mr2049950wmm.132.1582019069952; 
 Tue, 18 Feb 2020 01:44:29 -0800 (PST)
X-Received: by 2002:a05:600c:149:: with SMTP id
 w9mr2049912wmm.132.1582019069668; 
 Tue, 18 Feb 2020 01:44:29 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 12/13] tests/qtest/libqos/qgraph: Remove superfluous
 semicolons
Date: Tue, 18 Feb 2020 10:44:01 +0100
Message-Id: <20200218094402.26625-13-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: MHi__idqNIOVBuBic9tqMw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9QyTsmGkGwq1

Fixes: fc281c80202
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>
---
 tests/qtest/libqos/qgraph.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/libqos/qgraph.c b/tests/qtest/libqos/qgraph.c
index 7a7ae2a19e..ca01de0743 100644
--- a/tests/qtest/libqos/qgraph.c
+++ b/tests/qtest/libqos/qgraph.c
@@ -474,7 +474,7 @@ QOSEdgeType qos_graph_edge_get_type(QOSGraphEdge *edge)
     if (!edge) {
         return -1;
     }
-    return edge->type;;
+    return edge->type;
 }
=20
 char *qos_graph_edge_get_dest(QOSGraphEdge *edge)
@@ -590,7 +590,7 @@ void qos_add_test(const char *name, const char *interfa=
ce,
                   QOSTestFunc test_func, QOSGraphTestOptions *opts)
 {
     QOSGraphNode *node;
-    char *test_name =3D g_strdup_printf("%s-tests/%s", interface, name);;
+    char *test_name =3D g_strdup_printf("%s-tests/%s", interface, name);
     QOSGraphTestOptions def_opts =3D { };
=20
     if (!opts) {
--=20
2.21.1


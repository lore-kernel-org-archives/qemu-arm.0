Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp3277666lfc;
        Thu, 21 Nov 2019 02:18:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqwzHtEttwe0tLdUmEeeGlnh75JviO5uDJgo9mjFI9UcqIMCpVe7/INrP7/qcPrMi3PX1z2F
X-Received: by 2002:ac8:71c9:: with SMTP id i9mr4845989qtp.287.1574331497353;
        Thu, 21 Nov 2019 02:18:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574331497; cv=none;
        d=google.com; s=arc-20160816;
        b=T2zI9NxnbjC8YUCLQJT5AJOJt8yKwZ6gAEZGCmuemXSMeuqM0sQXgi159kFaw3JdgF
         j3dG7vnP2HeW9qFm9wvQ+YI86RBpCk8Ue1Qt/teZehjU4omHOlyswrnU3zL8N7LoEPmY
         jDTnVAiw5S6LdBa1M8ea3hry8t9Qn11pKcgc2hQmUejD2p7+eYyH3VDvqHqn8SuLGO/O
         08Kujh30W2OmywnWiWhaEs/3pBGyXc9tXeTdQ5VOFYndojLcY42y+tEI26gvJQ5vjtLD
         ZbrNSsfCjfypePItQYUXZLq1Brc4IA7ohQkl1ccMOKTYffUMXtXeb04yh3owzAj2I4Xj
         s5JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YfCpqtfoaFd+zElyHybnucVvilp1YJOV0xQeGdTYA5c=;
        b=vxfVNh/2/p0OTPA907kP/wZ/4yshKwDMeVQZym2oAAJFlZjHctfxxBgO6+DmL9EEJU
         rvnad9x+cY3DXBBbo5WDCG5YWfY7p3yaOCiBmXb36RJ7Fqae3dxCZDEndDQbxEE/zo75
         z56QKeEfCmkaOAo3b8LRILtDqaXGN9Z+d3x+w4XpglG34znwJ6vLS8C7HLQXRVKSQyOl
         MhKfzE+atUhCEyGDC07T00kEZRVQho4F5MEvKmL9y3rT251U0aOgm+tvc6E5+rewd9KK
         kXhpUN6WdTebeRyWlP6o+o9TeiZ07lpWYDBjoSMX4SzUq7UqZ8YQAY7gOdSKposbYivK
         88rA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=egZK3IRz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u37si1062574qte.295.2019.11.21.02.18.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Nov 2019 02:18:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=egZK3IRz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iXjXU-0007FW-Gb
	for alex.bennee@linaro.org; Thu, 21 Nov 2019 05:18:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42249)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iXjVl-0007Bj-GC
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 05:16:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iXjVk-0007VT-Cm
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 05:16:29 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:59426
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1iXjVk-0007Uy-4g
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 05:16:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574331387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YfCpqtfoaFd+zElyHybnucVvilp1YJOV0xQeGdTYA5c=;
 b=egZK3IRzVxaYHPt5Wft14VpBfyoP3TU4KGD4KvFweBJ06roECpt7UfcBrUsvl3hh/ne58E
 s8HqNg8vUuHvE1OBRhA/uqiKyzqpeF+M10i+capcPkJgWQZDc7fimYEqhPnX5GSJwUwHtd
 fG9zjXe1KX3ZQ3ABZw0mgfcy88lrn3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-7IQ6cPg5MVefhgO7UnPu9g-1; Thu, 21 Nov 2019 05:16:24 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B594DBA6;
 Thu, 21 Nov 2019 10:16:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D4D0101F6CE;
 Thu, 21 Nov 2019 10:16:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9D7E59D45; Thu, 21 Nov 2019 11:16:18 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] ui/gtk: fix gettext message's charset.
Date: Thu, 21 Nov 2019 11:16:18 +0100
Message-Id: <20191121101618.29289-4-kraxel@redhat.com>
In-Reply-To: <20191121101618.29289-1-kraxel@redhat.com>
References: <20191121101618.29289-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 7IQ6cPg5MVefhgO7UnPu9g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, yanminhui <yanminhui163@163.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XWOK+60Hibmn

From: yanminhui <yanminhui163@163.com>

Signed-off-by: yanminhui <yanminhui163@163.com>
Message-Id: <20191116031037.1207-1-yanminhui163@163.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk.c    | 1 +
 po/zh_CN.po | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 2f23922afc6a..692ccc7bbb90 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2215,6 +2215,7 @@ static void gtk_display_init(DisplayState *ds, Displa=
yOptions *opts)
     setlocale(LC_MESSAGES, "");
     setlocale(LC_CTYPE, "C.UTF-8");
     bindtextdomain("qemu", CONFIG_QEMU_LOCALEDIR);
+    bind_textdomain_codeset("qemu", "UTF-8");
     textdomain("qemu");
=20
     window_display =3D gtk_widget_get_display(s->window);
diff --git a/po/zh_CN.po b/po/zh_CN.po
index b25e8e3c0207..38de6a4f2a7f 100644
--- a/po/zh_CN.po
+++ b/po/zh_CN.po
@@ -66,7 +66,7 @@ msgid "Detach Tab"
 msgstr "=E5=88=86=E7=A6=BB=E6=A0=87=E7=AD=BE=E9=A1=B5"
=20
 msgid "Show Menubar"
-msgstr ""
+msgstr "=E6=98=BE=E7=A4=BA=E8=8F=9C=E5=8D=95=E6=A0=8F"
=20
 msgid "_Machine"
 msgstr "=E8=99=9A=E6=8B=9F=E6=9C=BA(_M)"
--=20
2.18.1


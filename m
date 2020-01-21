Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1334098lfp;
        Tue, 21 Jan 2020 03:09:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqyGCfViCi8W77qzVPNxitghYgeJQQAm0tsj3Ub96E1xLF+r7uPH/jPO/FLxfaP9d5ctT+O6
X-Received: by 2002:a05:6402:1558:: with SMTP id p24mr3306848edx.120.1579604963796;
        Tue, 21 Jan 2020 03:09:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579604963; cv=none;
        d=google.com; s=arc-20160816;
        b=bi8RtXhz3a+3gfjBzfc93UBrV0rDxIcKt3HoY2W6ejYBVkjmKWpOaw3ICtlyQSMQ6h
         B+sP0CoT0jgg5fgZ0QlP4R+Pg407mQEh/VRxOKvIkU7lXG7tPuOOrEVfuvlMMA++LKuA
         5WXji6yajq/go0cGdcFyJ/+BI5fM+LNHNni41DZLXfGsA+70mWgJNo6K7jraiwe2/Txl
         t7oqiYW/LBXGQB9QT62CFW9zVCsIMahAJY4Ir6nndOGO1UQZXv4EQ34+fm4k4B6dyyTt
         vafFtkPUycqCVYiPAeK5LeXHikl2STRtTdw9g1q4jVWJ4/0MnRTjM10+i3qWnk4kmqeg
         4xZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=szvLNNLQdSyRCXMP/WlwlQ7xqfZ8pJdJ2R1hbRxN9kc=;
        b=xO3OJ0CEVDMvl5T1LBs9y9JN18sGPzn+osGxPC2nTuDrtH/WNfX5qi/T8gYYDOnJXn
         aHt1K9D0mKleJYGzeLKbFp10vPoAwYuxgydQsADv9CJPmcWYKd6plCyxBCVPGLLv8Xpc
         IM6bCOY0zRrv5qFPJZ24wfrjsmujTXEZGK81JkKTPYHYCyweD6rLyFUOQ6ayQ4Myu71N
         lCrRg8ZZSZSsA5k8V9KKvSqeadSAwkrZqCcdlBXfXNKJntgBXeL9hg7QLYThU31SYhvJ
         UecBcPt8DpvBmYDrSf482pO3o17M0Cyb18hFdh2ZQNtDG+7fsUMxV1Of8sj704gwzyyf
         LMfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=G6QQpNHP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18si22547121ejb.1.2020.01.21.03.09.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2020 03:09:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=G6QQpNHP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itrPO-0000S5-DA
	for alex.bennee@linaro.org; Tue, 21 Jan 2020 06:09:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40588)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1itrLa-0003xt-Ie
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 06:05:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1itrLV-0002rx-Td
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 06:05:26 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27184
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1itrLU-0002nR-GM
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 06:05:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579604716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=szvLNNLQdSyRCXMP/WlwlQ7xqfZ8pJdJ2R1hbRxN9kc=;
 b=G6QQpNHPGkwXNL2SKZ3d0qZgxnCBXUpMA5NJJVCg3NZgXDcsL3zOO2vYVkdLiyZiwvHXoM
 3MAI+gbQvSFWc3OqWGk8O68h/wQtJlY4hgqKh4a4q6nC6M+BWCQMfuoyiYVN+aEn+FrV63
 AuPvBBvPj/IHOH1nTQa2Hv9PPtkSuHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-DZCZJ4sFPIuNo7RuHdQnlQ-1; Tue, 21 Jan 2020 06:05:15 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7878B8010D8;
 Tue, 21 Jan 2020 11:05:13 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-38.brq.redhat.com [10.40.205.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C0D285733;
 Tue, 21 Jan 2020 11:05:01 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/10] qdev: Abort if the root machine container is missing
Date: Tue, 21 Jan 2020 12:03:46 +0100
Message-Id: <20200121110349.25842-8-philmd@redhat.com>
In-Reply-To: <20200121110349.25842-1-philmd@redhat.com>
References: <20200121110349.25842-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: DZCZJ4sFPIuNo7RuHdQnlQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Like Xu <like.xu@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fxU1uHUklB1M

The QEMU device API (qdev) relies on having the '/machine'
container always available.

If it is missing, QEMU will later crash dereferencing a NULL
pointer, we will get a SEGV, open a debugger, look at the
backtrace, and figure out we messed with QOM.
Or we can use g_assert() which abort, displaying the filename
and line number, so we can quickly open our favorite IDE.
Prefer the later, to save time to developers.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: New patch
---
 hw/core/qdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 58e87d336d..d30cf6320b 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -1143,6 +1143,7 @@ Object *qdev_get_machine(void)
=20
     if (dev =3D=3D NULL) {
         dev =3D container_get(object_get_root(), "/machine");
+        g_assert(dev !=3D NULL);
     }
=20
     return dev;
--=20
2.21.1


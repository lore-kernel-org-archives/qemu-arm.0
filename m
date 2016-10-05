Received: by 10.80.163.71 with SMTP id 65csp2673847edn;
        Wed, 5 Oct 2016 06:38:30 -0700 (PDT)
X-Received: by 10.37.27.84 with SMTP id b81mr6878645ybb.171.1475674710597;
        Wed, 05 Oct 2016 06:38:30 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s127si12867193ywe.40.2016.10.05.06.38.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Oct 2016 06:38:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49207 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brmOz-0006gB-Lq
	for alex.bennee@linaro.org; Wed, 05 Oct 2016 09:38:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rkrcmar@redhat.com>) id 1brmN3-0005UM-KN
	for qemu-devel@nongnu.org; Wed, 05 Oct 2016 09:36:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rkrcmar@redhat.com>) id 1brmMy-0005wn-Kn
	for qemu-devel@nongnu.org; Wed, 05 Oct 2016 09:36:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46498)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rkrcmar@redhat.com>)
	id 1brmMo-0005tw-II; Wed, 05 Oct 2016 09:36:14 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F241978224;
	Wed,  5 Oct 2016 13:36:13 +0000 (UTC)
Received: from potion (dhcp-1-247.brq.redhat.com [10.34.1.247])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u95DaA1A023753; Wed, 5 Oct 2016 09:36:10 -0400
Received: by potion (sSMTP sendmail emulation); Wed, 05 Oct 2016 15:36:09 +0200
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Oct 2016 15:35:29 +0200
Message-Id: <20161005133530.5702-2-rkrcmar@redhat.com>
In-Reply-To: <20161005133530.5702-1-rkrcmar@redhat.com>
References: <20161005133530.5702-1-rkrcmar@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 05 Oct 2016 13:36:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/2] qom: add object_new_with_class()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, Rob Herring <robh@kernel.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Alexander Graf <agraf@suse.de>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: //AnbjJ3YxME

object_new_with_object_class() was a close contender for the name, but
it is longer, the type system will catch possible errors, and the only
reasonable replacement would be a polymorphic function that would not
break existing users.

Signed-off-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@redhat.com>
---
 include/qom/object.h | 12 ++++++++++++
 qom/object.c         |  5 +++++
 2 files changed, 17 insertions(+)

diff --git a/include/qom/object.h b/include/qom/object.h
index 5ecc2d166d08..e50012237ce4 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -599,6 +599,18 @@ Object *object_new(const char *typename);
 Object *object_new_with_type(Type type);
=20
 /**
+ * object_new_with_class:
+ * @class: The object class of the object to instantiate.
+ *
+ * This function will initialize a new object using heap allocated memor=
y.
+ * The returned object has a reference count of 1, and will be freed whe=
n
+ * the last reference is dropped.
+ *
+ * Returns: The newly allocated and instantiated object.
+ */
+Object *object_new_with_class(ObjectClass *class);
+
+/**
  * object_new_with_props:
  * @typename:  The name of the type of the object to instantiate.
  * @parent: the parent object
diff --git a/qom/object.c b/qom/object.c
index 8166b7dace61..be75d6efc464 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -481,6 +481,11 @@ Object *object_new_with_type(Type type)
     return obj;
 }
=20
+Object *object_new_with_class(ObjectClass *class)
+{
+    return object_new_with_type(class->type);
+}
+
 Object *object_new(const char *typename)
 {
     TypeImpl *ti =3D type_get_by_name(typename);
--=20
2.10.0


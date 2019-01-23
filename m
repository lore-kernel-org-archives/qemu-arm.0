Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp538553wrt;
        Wed, 23 Jan 2019 02:41:01 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5ZLee35KbhMjj2sefpuOj5SoxmTOITUZvaJ/6D+/z0v90GyZ446phYz06ZeM9071gRI8d0
X-Received: by 2002:a1c:bb04:: with SMTP id l4mr2179188wmf.142.1548240061689;
        Wed, 23 Jan 2019 02:41:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548240061; cv=none;
        d=google.com; s=arc-20160816;
        b=k3b/zOZl5hrSOSew6OqTnTrswI96/yDqYkBx3QIugk/QKg211l0mDxnh7gZhZDKGMJ
         JjMd3blYwH3NnRyRf2TUzjEEtrPc96fbc1PY5piFc3to3XWyZ4jW4WQE6s88f+eyfVVi
         kBVdtIV0uGybmQeklw5kRut9bJpddFVpJdv+mv/jVdCBTDFExMbHSiS+fi22Yo8J8rTf
         /VHXKBEF2hOX8PUjSCqKQYoDssL8jUYCiHI7U3sAAL3ZOMUehz/tE5t3zwbzVuByNTAv
         NXV8PgfjBEQX52xBr+IIzaB2YWxc0XB8d7bRmC0fb4khOVoOhAHeYDhT7wdQnfqULBRI
         tUMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=iuivG0IhL0NizLtxxucQAl9cfhUW0AiROXITJxGI+sQ=;
        b=alv3UnV2MEEsW9r8WRpoYUnvMoYWDPgzXNj8CoaO2SoNus7fzIO+mAhNA7HIeFaBi9
         GWYAwKIbj5eUgW8Dundz+pYHleN1mYlwoMgopywf2wBo7KwQprsuwsGGUtHBqgH3N/+O
         K9NHPqjxYRoi22uCj73UVzWEKXgAn2GxaWVrB/a7f2OyA30ofZVG6VgiNx4tLvGTYwB1
         WX4+CSJu2UkGDM1CzDaVanWSgmSUSgExZ7PCnZA6jVaIc8mruca+aCl3UWT5fr3Pbtcy
         vE0X2eOmfoucrmVrdZ2NViqN92MAjBPtDTzifVJ4qOvSWUw8CUbNmwlBX5FTpukWKlRS
         Y3HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15si74585868wrm.153.2019.01.23.02.41.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 02:41:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:60122 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmFxs-0004jd-QZ
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 05:41:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFiB-0000lv-F5
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:24:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFi9-0003Q7-DM
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:24:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58202)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gmFi3-0003LE-6R; Wed, 23 Jan 2019 05:24:41 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 63D8FCA377;
	Wed, 23 Jan 2019 10:15:15 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-91.ams2.redhat.com [10.36.117.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DDFCC600C6;
	Wed, 23 Jan 2019 10:15:09 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 23 Jan 2019 11:14:41 +0100
Message-Id: <20190123101458.12478-2-eric.auger@redhat.com>
In-Reply-To: <20190123101458.12478-1-eric.auger@redhat.com>
References: <20190123101458.12478-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 23 Jan 2019 10:15:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 01/18] update-linux-headers.sh: Copy new
 headers
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
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eEuxWsnjhYJx

From: Alexey Kardashevskiy <aik@ozlabs.ru>

Since Linux'es ab66dcc76d "powerpc: generate uapi header and system call
table files" there are 2 new files: unistd_32.h and unistd_64.h. These
files content is moved from unistd.h so now we have to copy new files
as well, just like we already do for other architectures; this does it
for MIPS as well.

Also, v5.0-rc2 moved vhost bits around in 4b86713236e4bd
"vhost: split structs into a separate header file", add those too.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 scripts/update-linux-headers.sh | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-heade=
rs.sh
index 0a964fe240..1cd8bd57be 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -121,11 +121,20 @@ for arch in $ARCHLIST; do
         cp "$tmpdir/include/asm/unistd_64.h" "$output/linux-headers/asm-=
x86/"
         cp_portable "$tmpdir/include/asm/kvm_para.h" "$output/include/st=
andard-headers/asm-$arch"
     fi
+    if [ $arch =3D powerpc ]; then
+        cp "$tmpdir/include/asm/unistd_32.h" "$output/linux-headers/asm-=
powerpc/"
+        cp "$tmpdir/include/asm/unistd_64.h" "$output/linux-headers/asm-=
powerpc/"
+    fi
+    if [ $arch =3D mips ]; then
+        cp "$tmpdir/include/asm/unistd_o32.h" "$output/linux-headers/asm=
-mips/"
+        cp "$tmpdir/include/asm/unistd_n32.h" "$output/linux-headers/asm=
-mips/"
+        cp "$tmpdir/include/asm/unistd_n64.h" "$output/linux-headers/asm=
-mips/"
+    fi
 done
=20
 rm -rf "$output/linux-headers/linux"
 mkdir -p "$output/linux-headers/linux"
-for header in kvm.h vfio.h vfio_ccw.h vhost.h \
+for header in kvm.h vfio.h vfio_ccw.h vhost.h vhost_types.h \
               psci.h psp-sev.h userfaultfd.h; do
     cp "$tmpdir/include/linux/$header" "$output/linux-headers/linux"
 done
--=20
2.20.1


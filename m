Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5035088wrt;
        Tue, 5 Feb 2019 09:48:34 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZLU2Z6TWmYI8ergXGGL1hcwWKtI2za+nRnHOxOGzFW7WslAbwm5KwMPzYqd2pUFvPIgNft
X-Received: by 2002:a5b:ecf:: with SMTP id a15mr5005718ybs.348.1549388914839;
        Tue, 05 Feb 2019 09:48:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549388914; cv=none;
        d=google.com; s=arc-20160816;
        b=UtyLR5McHBmb0tejnLLt8qbNbYobhMU4LSwFNMMvAxjs+uVxzuuZkjaDtwKtqBO3cW
         GVIyrdIKXqFahVTL0PxTGEU2b5dUTpPxCMO0cTseUD8QBuTiSE8Bng4B1pcUD+87IJjb
         NrELUwC4Bt2Zar7ORRo4y+yclJgF/9ZbdxsLEFFQQLfzz6bC9iaWwizy8FPj5r+xCCi5
         Rz8v6H5QmbruVSObMmoT6DhVWPHuJVx/QX7T8scFxqOtr1xWFM9b/ZKB4JtGKrEB4wDM
         TgDpE63nc382ibTNsBLEoSpfOtISRPm+UvfhK4oTEJD0SirWcsjHIB2Sc+d+FdLafGir
         VG9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=iuivG0IhL0NizLtxxucQAl9cfhUW0AiROXITJxGI+sQ=;
        b=rZYKvj1qMqC5wgbcldA0omkmanpwEZOdRWDxZSRWiIslQ5+skNK3C1HPAM3afese2F
         OaDcStDQcTWGS52pDO8gIbE1qAuh3Gr/VOnYtaPMgPl7pdLCMddaBuQaPdhJqqLwoIfW
         JRj83Gn4rHAigsI619CHAw7T96rcQLzJuHzwukAAl/WZIbVn/HkBLnpcYDrp45MJHJGQ
         eWlqDAVCIIvqh6ZG9gVZwkZdrejtEo0mBlJuxzA1f/IghVVCOnzC5cd+2BD4gCJorPae
         xzGS7+tFNHOUQaodCqzOkaxTrPjm9xOZBpJKH/R8/DcXS4rSjMP7eNR9u1g+Ba2yw7qj
         N4rA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4si2265590ybu.105.2019.02.05.09.48.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 09:48:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35890 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr4pm-0003Nb-8c
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 12:48:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gr4bI-0008F3-Nw
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 12:33:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gr4bE-0003u1-LW
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 12:33:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34972)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gr4b9-0003pp-Fr; Tue, 05 Feb 2019 12:33:28 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 86DB3C063D04;
	Tue,  5 Feb 2019 17:33:22 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D5DD660A9D;
	Tue,  5 Feb 2019 17:33:17 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue,  5 Feb 2019 18:32:49 +0100
Message-Id: <20190205173306.20483-2-eric.auger@redhat.com>
In-Reply-To: <20190205173306.20483-1-eric.auger@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 05 Feb 2019 17:33:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v6 01/18] update-linux-headers.sh: Copy new
 headers
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
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nabeu7gOo365

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


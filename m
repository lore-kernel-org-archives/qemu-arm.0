Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4042929wrx;
        Mon, 25 Mar 2019 09:17:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqypAEa7CBXXB4RE45GZBmpDuWZ6DzxyaisIM9itxs+pggP/cORDCRB4iLVfTRglQgLoNuP0
X-Received: by 2002:a25:76c5:: with SMTP id r188mr21255140ybc.147.1553530645385;
        Mon, 25 Mar 2019 09:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553530645; cv=none;
        d=google.com; s=arc-20160816;
        b=Dy7EK9M6YnH09+S2l+J+sKykEsY0a5UAe4WYktmSal3Sddt9bMc0X2j44K7zGzTYsG
         BdmJFTjgTLxtWy7XWyas0uhhwAtGFObDcCEcEjPiXhUAlVhM+Gr4bnxEAv1Y/Fw3MfDr
         GFaERiF42dZs6CuVYqm4OHSVoZ4vWgOB5cVi8ZpoyIy5Tq6Yoggfusg3z6MlaacT9nUB
         hBCTXqKD2ZYPDYw+jSfgylBa9z71FWOSS01k71+kxOVEiWNPIUeSVkc6/xCZZ1LZW/Uq
         UVuvmt6rMmKzpFhWXrfBwKRkKeM+fXRMzsyPOUehIxKuBt8ATOVn+GIQp071RnSrCpQv
         Zmmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=sEMET0AogM6MkTl+mgxNtZjFYnF1Yy1XVqugPsNySjM=;
        b=wknqzR+Vtz3RF956GdAU4Ynx0pH8Dk9CFxjWed1G/nyYVFFWAYo3AK8yo7SncsfxYt
         GTwXsbbD8QBp4Yzmn2WHLEAOM82VPzuSAV7H+P9znf68xa+EhOUKyMGPDljk0phIfKiu
         UpBz5ON/NsB/4t8gmnujTbWoI+XU1vrWdYchfvoaIlsfCQfGk+o4EXV+U5FevpaGSzen
         W6MnmAnCaofoTPhB8xZjBpCLP3PXUxivEkaJ2zDrogn06de7C8e5LJ1PTPX7uYrBpH9C
         gmvM/MUun32zjh9Kez119+0E6s1xWl07DbrgShFyXvq8Ud3ifxkuE4i2jbqV61+23qHL
         SBxA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8si4964467ybk.237.2019.03.25.09.17.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 09:17:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44957 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8SHs-0005Me-Q9
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 12:17:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1h8SGj-00046Q-G6
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 12:16:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1h8S1m-0005eA-Bu
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 12:00:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56324)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1h8S1m-0005dH-3G; Mon, 25 Mar 2019 12:00:46 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B6CE53084266;
	Mon, 25 Mar 2019 16:00:43 +0000 (UTC)
Received: from localhost (ovpn-116-57.ams2.redhat.com [10.36.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B48DE6A6A6;
	Mon, 25 Mar 2019 16:00:28 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 Mar 2019 15:58:55 +0000
Message-Id: <20190325155857.10661-6-stefanha@redhat.com>
In-Reply-To: <20190325155857.10661-1-stefanha@redhat.com>
References: <20190325155857.10661-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 25 Mar 2019 16:00:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 5/7] scripts/cleanup-trace-events: Update for
 current practice
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
	Juan Quintela <quintela@redhat.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Yuval Shaia <yuval.shaia@oracle.com>, Greg Kurz <groug@kaod.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Paul Durrant <paul.durrant@citrix.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
	Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wPZQsRSen2nX

From: Markus Armbruster <armbru@redhat.com>

Emit comments with shortened file names (previous commit).

Limit search to the input file's directory.

Cope with properties tcg (commit b2b36c22bd8) and vcpu (commit
3d211d9f4db).

Cope with capital letters in function names.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-id: 20190314180929.27722-4-armbru@redhat.com
Message-Id: <20190314180929.27722-4-armbru@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 scripts/cleanup-trace-events.pl | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/scripts/cleanup-trace-events.pl b/scripts/cleanup-trace-even=
ts.pl
index e93abc00da..d4f0e4cab5 100755
--- a/scripts/cleanup-trace-events.pl
+++ b/scripts/cleanup-trace-events.pl
@@ -13,6 +13,7 @@
=20
 use warnings;
 use strict;
+use File::Basename;
=20
 my $buf =3D '';
 my %seen =3D ();
@@ -23,12 +24,19 @@ sub out {
     %seen =3D ();
 }
=20
-while (<>) {
-    if (/^(disable )?([a-z_0-9]+)\(/) {
-        open GREP, '-|', 'git', 'grep', '-lw', "trace_$2"
+$#ARGV =3D=3D 0 or die "usage: $0 FILE";
+my $in =3D $ARGV[0];
+my $dir =3D dirname($in);
+open(IN, $in) or die "open $in: $!";
+chdir($dir) or die "chdir $dir: $!";
+
+while (<IN>) {
+    if (/^(disable |(tcg) |vcpu )*([a-z_0-9]+)\(/i) {
+        my $pat =3D "trace_$3";
+        $pat .=3D '_tcg' if (defined $2);
+        open GREP, '-|', 'git', 'grep', '-lw', '--max-depth', '1', $pat
             or die "run git grep: $!";
-        my $fname;
-        while ($fname =3D <GREP>) {
+        while (my $fname =3D <GREP>) {
             chomp $fname;
             next if $seen{$fname} || $fname eq 'trace-events';
             $seen{$fname} =3D 1;
@@ -49,3 +57,4 @@ while (<>) {
 }
=20
 out;
+close(IN) or die "close $in: $!";
--=20
2.20.1


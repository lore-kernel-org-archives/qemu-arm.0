Received: by 10.28.91.67 with SMTP id p64csp5152444wmb;
        Wed, 21 Mar 2018 07:47:25 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsI/QPv94UIA8CdcNZhiNa+zpTpAUmfymQgk96wpoS7mj54fzZnEAC3OYqEd1Ad3xMt7ii1
X-Received: by 10.55.127.70 with SMTP id a67mr18295889qkd.328.1521643645384;
        Wed, 21 Mar 2018 07:47:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521643645; cv=none;
        d=google.com; s=arc-20160816;
        b=mlB65jkMBFI1A6CkCVNG9ka4EtTJ7w8Rz/Aql7PHI2xKx713PMQ657VS7D7P+05ZeB
         +lZKLbdaLlpJzAsYnZMni/SpIEOF7eyQgqcgWnlcSmXnIjl5GH0HcrXBIhWJPdEjKQ4Z
         upZVJL6wjk6qHORfJRKqDhPXyZkOh6CwOos00BFQL01xJmC73Xjg8lS4tDH03tMGOy/6
         +0KIq4m6qz9CkVb5dpxtFqH16yamCpd25KpV9ROvrDsn5EJRexARAAnxdkfdjV8deTKF
         IUs5CWqqJ7b4ETK5xoBLGecBzzXd3cqmxBS22C7YizjdrYsg9w8j6PwcITD2u+eeYrPb
         k6Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:content-disposition
         :mime-version:message-id:to:from:date:arc-authentication-results;
        bh=BZZtPyCiSeF0d+qQ4C8h94Cocxi86ihd4EMqu1aNE5A=;
        b=mQAbJ/xhVK8XUXtcr6Ux6BFpQxwL3GccL2+QlphNXy6Trdg4sRwMoNpSCLh8YrVhBh
         ILcscOMU4sMUGXr7USfnTtwU3wYztWikk1vJvEtwVXKtZULVZYogwrhSyEQOVxdEHzRF
         BWYlw4KLFzz2imPmndp+h4jyom2C3LjmEBLry39dd77gRhtQWExUpdwNGd3PS/6nWaU2
         2a05XuMiEJdJ5vOg5qiLmrGD8zh1spcmyR4D4oa6jRxmqaFM7GjQ+jlJa9IEnNb0ca5Y
         971AyVcS7xxHpv2ic2fgEcsUGFazMtPIWwRj/IwMrXjXHNToLtW9Rq/5usFpKoRQV3DP
         LfsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t19si2126503qtc.276.2018.03.21.07.47.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Mar 2018 07:47:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55533 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyf1Q-0003vO-Sf
	for alex.bennee@linaro.org; Wed, 21 Mar 2018 10:47:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyf1B-0003r8-Tp
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 10:47:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyf18-00058c-1d
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 10:47:09 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46892 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1eyf17-00058Q-S7; Wed, 21 Mar 2018 10:47:05 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C8254023BB3;
	Wed, 21 Mar 2018 14:47:04 +0000 (UTC)
Received: from redhat.com (ovpn-124-179.rdu2.redhat.com [10.10.124.179])
	by smtp.corp.redhat.com (Postfix) with SMTP id E796A10B00A5;
	Wed, 21 Mar 2018 14:46:32 +0000 (UTC)
Date: Wed, 21 Mar 2018 16:46:32 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Message-ID: <1521642402-197739-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 21 Mar 2018 14:47:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 21 Mar 2018 14:47:05 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2] qemu: replace "" with <> in headers
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
	Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Hannes Reinecke <hare@suse.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Fam Zheng <famz@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
	Josh Durgin <jdurgin@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Ben Warren <ben@skyportsystems.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Yongbok Kim <yongbok.kim@mips.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Liu Yuan <namei.unix@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Andrzej Zaborowski <balrogg@gmail.com>, Jason Wang <jasowang@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, Jiri Pirko <jiri@resnulli.us>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	Stefan Weil <sw@weilnetz.de>, Xie Changlong <xiechanglong.d@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Peter Lieven <pl@kamp.de>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Yuval Shaia <yuval.shaia@oracle.com>, Greg Kurz <groug@kaod.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Zhang Chen <zhangckid@gmail.com>, xen-devel@lists.xenproject.org,
	John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
	Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Juan Quintela <quintela@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
	Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: et1r4L0F/tPO

Our current scheme is to use
 #include ""
for internal headers, and
 #include <>
for external ones.

Unfortunately this is not based on compiler support: from C point of
view, the "" form merely looks up headers in the current directory
and then falls back on <> directories.

Thus, for example, a system header trace.h - should it be present - will
conflict with our local trace.h

As another example of problems, a header by the same name in the source
directory will always be picked up first - before any headers in
the include directory.

Let's change the scheme: make sure all headers that are not
in the source directory are included through a path
starting with qemu/ , thus:

 #include <>

headers in the same directory as source are included with

 #include ""

as per standard.

This (untested) patch is just to start the discussion and does not
change all of the codebase. If there's agreement, this will be
run on all code to converting code to this scheme.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 scripts/changeheaders.pl | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100755 scripts/changeheaders.pl

diff --git a/scripts/changeheaders.pl b/scripts/changeheaders.pl
new file mode 100755
index 0000000..22bd5b8
--- /dev/null
+++ b/scripts/changeheaders.pl
@@ -0,0 +1,20 @@
+#!/usr/bin/perl -pi
+
+if (m@^\s*#include\s+"([^"+]"@o) {
+    next;
+}
+
+my $hdr = $1;
+my $file = $ARGV;
+$file =~ s@/[^/]+$@@g;
+$file .= $hdr;
+
+if (-e $file) {
+    next;
+}
+
+if (m@^\s*#include\s+"qemu/@o) {
+    s@^(\s*#include\s+)"qemu/([^"]+)"(.*)$@$1<qemu/common/$2>$3@o) {
+} else {
+    s@^(\s*#include\s+)"([^"]+)"(.*)$@$1<qemu/$2>$3@o) {
+}
-- 
MST

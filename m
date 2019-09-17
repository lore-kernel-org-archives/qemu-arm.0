Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5075708wrp;
        Tue, 17 Sep 2019 03:49:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx9ceK9tW1OiiT91+IbsjNlIKttITUdwKVSu7d4LPNzlnqd7/mQBckbVWf89EWYmw0GLhqF
X-Received: by 2002:ac8:5448:: with SMTP id d8mr2855883qtq.287.1568717342603;
        Tue, 17 Sep 2019 03:49:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568717342; cv=none;
        d=google.com; s=arc-20160816;
        b=GWI7ASB395PVjNZawA3NvNwitMuS1SX+vTxmk3B9UWARSx+R8nO4Z8+47ZCerfdh4q
         pOBeNTKgSFG72AUoaiOnmoBdOIEnn2noWxttD5SNWulJDfBI+YEGt1uuup97uklRU5gM
         uq22Y7gD8L2tW59Q1kFDD1z77n/DAPgSsZbWJS9DrN0z8C921n6OiORv1Y/w59wySUQn
         UXldFSV1RTQdaIkrC80jJ2il7P+RbfSeR0116LBR1qE1Zm7DxpLXfLdWZvwChT7qx99K
         aKk0zzj1qq3hhMbmhVAR3/fkSidX4CV0l14eDzdrlUZz6NUped5vp4r4q1OuB2qkvI+O
         3MAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id
         :content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from;
        bh=DYL79SkS8+/D1uP7UPW/x85rKi929TMwi1qbb6T3Zi0=;
        b=HV/JhYv7ArBJq1ct/kZkHKbp/GPc0c2PkIZt2J+vP33XUw78vhvHd7pLzaJf3aQctJ
         flHgb1a9JVfX+GeiZCZY9yArrsnh7r41DK+SorMbOdI27cIsRnGS7Y5j8ZXJu4mP6dSP
         YzeBtgr8JI7LqYS/7oAbFx2mwhEYS7LeW6bxwJWNntydiMZ7sWNbgTPQo4nE2Cp+A+Q4
         jpKCvzJfeQPwb9S6nNHtujwMrPX3R8rONz2Iye6gd4cO+lHpt7jpIsBYW4MBEL/5+DHc
         59WIx0wTtxRVM1M0nUt5g/otZHHSim83SXGX1JAhl/ZJeIrotJbAUp6qBLd8BbvAsfRr
         p2ww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 70si1416760qte.223.2019.09.17.03.49.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 03:49:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAB2b-0005V3-2h
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 06:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44037)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iAAcs-0007wX-PF
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:22:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iAAcr-0004Gl-I0
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:22:26 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53370
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iAAcr-0004GE-Aq
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:22:25 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8HAHFVn027341
 for <qemu-devel@nongnu.org>; Tue, 17 Sep 2019 06:22:24 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v2u286vdb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 17 Sep 2019 06:22:24 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <groug@kaod.org>;
 Tue, 17 Sep 2019 11:22:22 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Sep 2019 11:22:15 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8HAMDEn60686354
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 10:22:13 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 505114C046;
 Tue, 17 Sep 2019 10:22:13 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DDA64C04A;
 Tue, 17 Sep 2019 10:22:12 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.22.84])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 10:22:12 +0000 (GMT)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Tue, 17 Sep 2019 12:22:12 +0200
In-Reply-To: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
References: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091710-0028-0000-0000-0000039E0EFE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091710-0029-0000-0000-0000246087A7
Message-Id: <156871573191.196432.7298669690679178817.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-17_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=588 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170106
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: [Qemu-devel] [PATCH 16/17] socket: Pass local error object pointer
 to error_append_hint()
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?utf-8?q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Farman <farman@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. =?utf-8?q?Berrang=C3=A9=22?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org"@d06av22.portsmouth.uk.ibm.com,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YowdlZp0FWcd

Ensure that hints are added even if errp is &error_fatal or &error_abort.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 util/qemu-sockets.c |   14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 98ff3a1cce64..5da7b5f2fa0d 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -882,9 +882,12 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
 
     pathlen = strlen(path);
     if (pathlen > sizeof(un.sun_path)) {
-        error_setg(errp, "UNIX socket path '%s' is too long", path);
-        error_append_hint(errp, "Path must be less than %zu bytes\n",
+        Error *local_err = NULL;
+
+        error_setg(&local_err, "UNIX socket path '%s' is too long", path);
+        error_append_hint(&local_err, "Path must be less than %zu bytes\n",
                           sizeof(un.sun_path));
+        error_propagate(errp, local_err);
         goto err;
     }
 
@@ -952,9 +955,12 @@ static int unix_connect_saddr(UnixSocketAddress *saddr, Error **errp)
 
     pathlen = strlen(saddr->path);
     if (pathlen > sizeof(un.sun_path)) {
-        error_setg(errp, "UNIX socket path '%s' is too long", saddr->path);
-        error_append_hint(errp, "Path must be less than %zu bytes\n",
+        Error *local_err = NULL;
+
+        error_setg(&local_err, "UNIX socket path '%s' is too long", saddr->path);
+        error_append_hint(&local_err, "Path must be less than %zu bytes\n",
                           sizeof(un.sun_path));
+        error_propagate(errp, local_err);
         goto err;
     }
 


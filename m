Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5060044wrp;
        Tue, 17 Sep 2019 03:32:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyKW4EfLrLwqN8aAxdczkx/LR9zEgpV1599o4ZV0dldnzdsgE0kO9Nd5mUczIDzTHiTjbiN
X-Received: by 2002:a50:fd83:: with SMTP id o3mr3845058edt.67.1568716376895;
        Tue, 17 Sep 2019 03:32:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568716376; cv=none;
        d=google.com; s=arc-20160816;
        b=PuzaAWjjTESsl/8Krs6/smcuByZBKTKyrEqFgdONKNPgW/Zpzs7XLg0uLsK6To1uTa
         mCYPNnO/6lXOySwBSdENPsElVvpgwSQK4UqwYqjqVbxI77PGZ4cx53FERD6caoentYM6
         c8nqikwUOUHpo7FaMCkWhOl88NSwp7FRHSMatPsMqTo0WDlqqLQMHGDj2f88tgi3eAgW
         TFZ33ddOKJdzluWftGXaifWEBmOVkDytBvzUVlr+nOrZQFZX+n2tM9qQhUx0Tzqf3Gt5
         sYnYnCEuNkfOO6Yw8MuNBYafkm8hYV6r50oSCX6UV07DPOYlkxWBeI+n7yL0hQ4J1hWk
         +UTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id
         :content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from;
        bh=1wYgdc6SFOM6Zxze7xnKEhTmwnHEIo2UzhEVB2SeuK4=;
        b=dg/GU2/yXHxyWXvHgdeumMJkyAAuPPmCeE2iUcqq0dpI8hRVXsJVH22cipvJbS2dJ0
         Pmdx8xNUeuldTRfjsvnKFgp0lEXgqQqf3bHomMSjadqtnB6HEt+fVJbgXtmnpaandh4B
         gKXADx7gpJZ+Sm20svH6rQDLuMus9tviNYaP79gTlWjGSZ9ykpiCezqM90dE58eJP66G
         wrLBnAMATt6fL0KV5lmeI1CyqUZEgCB7QY7Xk951neCUIGmfjK8DsKZTfZsVk+BsHZ3f
         bcPpaQJVSctJKD+lHryhUtzq1+NiLxzs1FISSb10+8/8WDVipgdcPYyVxmN7MzzJ2qLa
         cQgA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x22si1100350edi.382.2019.09.17.03.32.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 03:32:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAAn1-0007bK-7M
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 06:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43986)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iAAcl-0007nF-Jh
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:22:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iAAcj-00049t-87
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:22:19 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43706
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iAAci-00047Z-MU
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:22:17 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8HAHGQj078288
 for <qemu-devel@nongnu.org>; Tue, 17 Sep 2019 06:22:11 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v2vd5btuv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 17 Sep 2019 06:22:11 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <groug@kaod.org>;
 Tue, 17 Sep 2019 11:22:08 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Sep 2019 11:22:02 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8HALYCI31785400
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 10:21:34 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0CF3A405C;
 Tue, 17 Sep 2019 10:22:00 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8258A4054;
 Tue, 17 Sep 2019 10:21:59 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.22.84])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 10:21:59 +0000 (GMT)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Tue, 17 Sep 2019 12:21:59 +0200
In-Reply-To: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
References: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091710-0016-0000-0000-000002AD13D9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091710-0017-0000-0000-0000330DB75D
Message-Id: <156871571931.196432.3224017086971417625.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-17_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=578 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170106
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: [Qemu-devel] [PATCH 14/17] ccid-card-emul: Pass local error object
 pointer to error_append_hint()
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
 "Daniel P. =?utf-8?q?Berrang=C3=A9=22?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org"@b06wcsmtp001.portsmouth.uk.ibm.com,
 David Gibson <david@gibson.dropbear.id.au>, Eric Farman <farman@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J8TNw3KFm0cK

Ensure that hints are added even if errp is &error_fatal or &error_abort.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/usb/ccid-card-emulated.c |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
index 291e41db8a1e..3bc397341090 100644
--- a/hw/usb/ccid-card-emulated.c
+++ b/hw/usb/ccid-card-emulated.c
@@ -511,10 +511,13 @@ static void emulated_realize(CCIDCardState *base, Error **errp)
     }
 
     if (card->backend == 0) {
-        error_setg(errp, "backend must be one of:");
+        Error *local_err = NULL;
+
+        error_setg(&local_err, "backend must be one of:");
         for (ptable = backend_enum_table; ptable->name != NULL; ++ptable) {
-            error_append_hint(errp, "%s\n", ptable->name);
+            error_append_hint(&local_err, "%s\n", ptable->name);
         }
+        error_propagate(errp, local_err);
         goto out2;
     }
 


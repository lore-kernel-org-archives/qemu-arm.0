Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5068421wrp;
        Tue, 17 Sep 2019 03:41:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwLpZrrktOQ/TdjrQjVtOj8mASVn7shvAn0r6+LQ1rwGq5M1BpuDce+1GqRTVKMjTHgpFet
X-Received: by 2002:a50:f009:: with SMTP id r9mr3934110edl.195.1568716888634;
        Tue, 17 Sep 2019 03:41:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568716888; cv=none;
        d=google.com; s=arc-20160816;
        b=nwLmowokkF8twO3Z6fA5oAL1D08+Ha7IQQQo6MI2z9gjrxgpKY+K5/PCb1y3tC2JHG
         SZvBHQHLOrMuQs/zi17QhFrxsumX/ePSltYPSfL3XNBtpL3eD20UvF8c0fcr7601jFkP
         wwAPY3ghMP4mzCJ/D0PrTCupjGWGIgZh8Rkdy8V0hoTaV9c0K7skE/Wr1p7PIuqW9Dac
         BZaAy4wphAildWymJ9GScwjt1fYL4U9S/gscxqQFku6zhJqaAtgN87TMhlIDUWJhH5cK
         RcqffqWJNz6dAZkAiyGll2aybrpW/Y+rSOy9y5AIB1z8rfQmY9Zop7Hs7nvbQdOSn58Z
         rS7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id
         :content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from;
        bh=gfvSETS3XkNWsxv2C5g0XSLekT7dU95c//nWe77BOac=;
        b=ZnfEYecrEPIUHpLLQA0exlY3b3IYTKt0htbBZCAYg2JH4fWZE5FhR7QO9nGK89w74l
         y3zQzGzZIPuawlCt2RhVU1CEkQaUk94+uvWclcxzMS2OMou4MqMt8Umbip5sBI019+90
         ht4S9bKZ0PjQJPvXsGDmh1x+Ff7KJ5XJD9asVsaG1qMGcgOjhslXDjCte26Fj3GlHgLI
         bJkwxphbsU7ojSZyH/H+zZ33Af5lI9w4z6RR+XGL5Eho7ETV4lrCX62xtPYcJGN2M6R2
         ybM5pfiLt49HEOiMxter+IN4A1JJE8F7zqqEk0qsbqLsGhHhvpmvfVtlYUphurKwzb7l
         mZzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z19si1030783edb.342.2019.09.17.03.41.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 03:41:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAAvH-0006rr-HI
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 06:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44059)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iAAcy-00085H-3f
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:22:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iAAcx-0004Ny-00
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:22:31 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17940
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iAAcw-0004NM-QR
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:22:30 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8HAHlL0103506
 for <qemu-devel@nongnu.org>; Tue, 17 Sep 2019 06:22:30 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v2tk275js-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 17 Sep 2019 06:22:30 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <groug@kaod.org>;
 Tue, 17 Sep 2019 11:22:27 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Sep 2019 11:22:21 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8HAMJ9e46662000
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 10:22:19 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ACB81A4040;
 Tue, 17 Sep 2019 10:22:19 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABAAEA4053;
 Tue, 17 Sep 2019 10:22:18 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.22.84])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 10:22:18 +0000 (GMT)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Tue, 17 Sep 2019 12:22:18 +0200
In-Reply-To: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
References: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091710-0028-0000-0000-0000039E0F00
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091710-0029-0000-0000-0000246087A9
Message-Id: <156871573833.196432.7906362695920387537.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-17_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=445 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170106
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: [Qemu-devel] [PATCH 17/17] checkpatch: Warn when errp is passed to
 error_append_hint()
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
 "Daniel P. =?utf-8?q?Berrang=C3=A9=22?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org"@d06av23.portsmouth.uk.ibm.com,
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
 Alex Williamson <alex.williamson@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +eAn0DWLf9Sv

Passing errp from the argument list to error_append_hint()
isn't recommended because it may cause unwanted behaviours
when errp is equal to &error_fatal or &error_abort.

First, error_append_hint() aborts QEMU when passed either of
those.

Second, consider the following:

    void foo(Error **errp)
    {
         error_setg(errp, "foo");
         error_append_hint(errp, "Try bar\n");
    }

error_setg() causes QEMU to exit or abort, and hints aren't
added.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 scripts/checkpatch.pl |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index aa9a354a0e7e..17ce026282a6 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2902,6 +2902,10 @@ sub process {
 		}
 	}
 
+		if ($line =~ /error_append_hint\(errp/) {
+		    WARN("suspicious errp passed to error_append_hint()\n" .
+			 $herecurr);
+		}
 # check for non-portable libc calls that have portable alternatives in QEMU
 		if ($line =~ /\bffs\(/) {
 			ERROR("use ctz32() instead of ffs()\n" . $herecurr);


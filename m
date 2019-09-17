Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5064446wrp;
        Tue, 17 Sep 2019 03:37:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwbD2IPheOKMcp/6p0Yw3h1zmH+zGdgGby3dILj8cpRabaueNP4qLO3lpqdrCOMH3K/3fKO
X-Received: by 2002:a0c:a241:: with SMTP id f59mr1829069qva.141.1568716647889;
        Tue, 17 Sep 2019 03:37:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568716647; cv=none;
        d=google.com; s=arc-20160816;
        b=V26PaHeNryOag/vcSBl9ydJdFxwaNwztr95LsYT/5kLckYQcioeOTnrMkwOvxz7WI+
         S6ocbCWDAwGWwJZCHgOgiDR0J44sHhT2GJ5PsMhJDCWpPKOV1LosxPYQHXIgbz+CAOL0
         n9V2+nRcrsMH9cBrqnCTJVkUVubZbvWWWlw5gNe4IR4c9xuTqHlWZY9WLvjCO8Vx7IqQ
         q7/oNK9LRZ8p91Tl4SXTrnJeiO9s+twOp2BsLJehJFs6pTu0v1hFA2sDf9xyfMIu9q59
         ao8aKm9iXud+USXfwzrgw6IP80kf/xaqlQxG+hLdA1NALGX+Z/G5BfD8Xv4UnrrwWZAn
         TO3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id
         :content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from;
        bh=xNGH33O2kHDBgYQ3AS7N3xGlab/obqIFy9XwOFgUabg=;
        b=CClxigUl4+WARyVzDm6YVMxmE76ZUGUPBStawDz/awcWjSDviAvi7iv2K+qByV5uVO
         M/Nw8OPDpLiigjGZ3yfqvnrYMItkwliWLRSRXvv9w1FCk3ZnlgrYR5utdSmTbqoEkb0J
         GZSppevZI5QSfS6QN0m2uFgE2dQjPA/TSwp+qaoL1EtlBJzWs+hoC0XU5m9krF4IKPe/
         GzQQK4pcMNtPx9IgzVkfmnkU41p9Us7ej7+xNipXS4tdHq3L00Y+ICP1apzlRuKhn4Qo
         jhXVISM9DgixAEIotAOynAxw0hmZuIjkxL83P1bVAHmBFp7bLQ+JwquJk55QV1vSrcZ9
         jpwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1si1103670qkc.126.2019.09.17.03.37.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 03:37:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAArP-00037A-3X
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 06:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44003)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iAAcn-0007pS-0g
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:22:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iAAcl-0004Az-Se
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:22:20 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26926)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iAAcl-0004AI-Hd
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:22:19 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8HAI58j035038
 for <qemu-devel@nongnu.org>; Tue, 17 Sep 2019 06:22:17 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v2v5vv6u0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 17 Sep 2019 06:22:17 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <groug@kaod.org>;
 Tue, 17 Sep 2019 11:22:14 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Sep 2019 11:22:08 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8HALf4Q33489282
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 10:21:41 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E09CD52057;
 Tue, 17 Sep 2019 10:22:06 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.22.84])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id EFEA15204F;
 Tue, 17 Sep 2019 10:22:05 +0000 (GMT)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Tue, 17 Sep 2019 12:22:05 +0200
In-Reply-To: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
References: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091710-0028-0000-0000-0000039E0EFB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091710-0029-0000-0000-0000246087A4
Message-Id: <156871572566.196432.1432692745517580071.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-17_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=957 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170106
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
Subject: [Qemu-devel] [PATCH 15/17] option: Pass local error object pointer
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
 Juan Quintela <quintela@redhat.com>,
 "Daniel P. =?utf-8?q?Berrang=C3=A9=22?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org"@d06av21.portsmouth.uk.ibm.com,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
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
X-TUID: vt9QbIe+BkNU

Ensure that hints are added even if errp is &error_fatal or &error_abort.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 util/qemu-option.c |   14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/util/qemu-option.c b/util/qemu-option.c
index 97172b5eaa7f..2a45dfa585d4 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -155,11 +155,14 @@ void parse_option_size(const char *name, const char *value,
         return;
     }
     if (err) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, name,
+        Error *local_err = NULL;
+
+        error_setg(&local_err, QERR_INVALID_PARAMETER_VALUE, name,
                    "a non-negative number below 2^64");
-        error_append_hint(errp, "Optional suffix k, M, G, T, P or E means"
+        error_append_hint(&local_err, "Optional suffix k, M, G, T, P or E means"
                           " kilo-, mega-, giga-, tera-, peta-\n"
                           "and exabytes, respectively.\n");
+        error_propagate(errp, local_err);
         return;
     }
     *ret = size;
@@ -664,10 +667,13 @@ QemuOpts *qemu_opts_create(QemuOptsList *list, const char *id,
 
     if (id) {
         if (!id_wellformed(id)) {
-            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "id",
+            Error *local_err = NULL;
+
+            error_setg(&local_err, QERR_INVALID_PARAMETER_VALUE, "id",
                        "an identifier");
-            error_append_hint(errp, "Identifiers consist of letters, digits, "
+            error_append_hint(&local_err, "Identifiers consist of letters, digits, "
                               "'-', '.', '_', starting with a letter.\n");
+            error_propagate(errp, local_err);
             return NULL;
         }
         opts = qemu_opts_find(list, id);


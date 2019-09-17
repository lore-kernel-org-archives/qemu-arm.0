Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5055196wrp;
        Tue, 17 Sep 2019 03:27:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxU/FUfgV1BxwwH/uhnSUYs/gosRTB7R6WIJ1FKPD1C/7Ivt7KZ2DSxpmxKpcPXqQT2eOmo
X-Received: by 2002:a17:906:4a96:: with SMTP id x22mr4114786eju.170.1568716055707;
        Tue, 17 Sep 2019 03:27:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568716055; cv=none;
        d=google.com; s=arc-20160816;
        b=eH3audwJlS8Qf12KwyLChrjOwaUtlCUdNajzLer//49KP4ivlmPzo/gu7UURQFKZ3y
         w64o8Uifyc9Iq/L6g8W6BHCT4S9clbB7qmPxIWNCpaH+hXKvjWS2CSgY7ZnlXtXEuim/
         1r2AOUmpGhJKb8dWFIjsm9Xyu/h68NHbA8NzyOxcg95V09ihbjFdShlAE44Nd2Dwr3qR
         N+/YKxu1R9fb5cf2sawjMSv+geQr5C3rVPIwpP+vkBx/n4k22qa4J9XQVrvRgOmWlK99
         kpirb9P6AVW4B3BocF6giQdjtoUSbaf8nlYxvDbU+KBytbgpaQhIxRpv3oAuR9oCekz/
         mmag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id
         :content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from;
        bh=9FqhQGI8j8wLdYVWgcPgOFEdyxgdLrser/SN2/EEfEE=;
        b=YQcfgVrE5GNOi589ca/kCsx8K6Vel4Bj9VatpCu22az/ZtT5jO8fzZ/B+uWWAP5i3L
         WBuLs0qcmx65nZWyy8muWOCkguMAx3ndbwHmH9LfEJZ618OFhyHScqVIJ04kKkI025Q6
         OBb58y/ldlbtrolPhpfRs5Dii9OlWq/ZsUWcNcqXQM+NPgOvvEb3UPAWqISIKpPK50JJ
         8vlSFbgOQf/NNbjVOnsQhMC+X+dZd+257+NxEu3IiXT/tAzTOtKTMxBQHz9+Zmsog0gg
         qlQ7vZkird8vboPeDrVBUoxyxe1JXz/ShhBEv8ls2JiMeypotSmvadaTD6nLFcvX0hZB
         miUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2si828215ejw.308.2019.09.17.03.27.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 03:27:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAAhq-0003G1-2A
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 06:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43601)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iAAbM-0006Lr-DI
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:20:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iAAbL-0003ZE-4e
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:20:52 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:25626)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iAAbK-0003Yc-So
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:20:51 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8HAHFcg108804
 for <qemu-devel@nongnu.org>; Tue, 17 Sep 2019 06:20:50 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v2tf7qr0n-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 17 Sep 2019 06:20:49 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <groug@kaod.org>;
 Tue, 17 Sep 2019 11:20:46 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Sep 2019 11:20:40 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8HAKcHP48300210
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 10:20:38 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 480EA52054;
 Tue, 17 Sep 2019 10:20:38 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.22.84])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 54F195204E;
 Tue, 17 Sep 2019 10:20:37 +0000 (GMT)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Tue, 17 Sep 2019 12:20:37 +0200
In-Reply-To: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
References: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091710-4275-0000-0000-000003678A37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091710-4276-0000-0000-00003879EF68
Message-Id: <156871563702.196432.5964411202152101367.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-17_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=747 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170106
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
Subject: [Qemu-devel] [PATCH 01/17] error: Update error_append_hint()'s
 documentation
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
X-TUID: N9idUdp6yLyp

error_setg() and error_propagate(), as well as their variants, cause
QEMU to terminate when called with &error_fatal or &error_abort. This
prevents to add hints since error_append_hint() isn't even called in
this case.

It means that error_append_hint() should only be used with a local
error object, and then propagate this local error to the caller.

Document this in <qapi/error.h> .

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/qapi/error.h |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/qapi/error.h b/include/qapi/error.h
index 3f95141a01a8..28174329ba71 100644
--- a/include/qapi/error.h
+++ b/include/qapi/error.h
@@ -27,6 +27,13 @@
  *     error_setg(&err, "invalid quark\n"
  *                "Valid quarks are up, down, strange, charm, top, bottom.");
  *
+ * Dot *not* pass the errp parameter from the caller
+ *     error_setg(errp, "invalid quark");
+ *     error_append_hint(errp, "Valid quarks are up, down, strange, "
+ *                       "charm, top, bottom.\n");
+ * because error_setg() terminates QEMU if @errp is &error_fatal or
+ * &error_abort, and the hints are not even added.
+ *
  * Report an error to the current monitor if we have one, else stderr:
  *     error_report_err(err);
  * This frees the error object.
@@ -252,7 +259,9 @@ void error_prepend(Error **errp, const char *fmt, ...)
  * error message.
  * @errp may be NULL, but not &error_fatal or &error_abort.
  * Trivially the case if you call it only after error_setg() or
- * error_propagate().
+ * error_propagate(). CAUTION: error_setg() and error_propagate() do
+ * not return when passed &error_fatal. Always use a local error object
+ * and propagate it to the caller.
  * May be called multiple times.  The resulting hint should end with a
  * newline.
  */


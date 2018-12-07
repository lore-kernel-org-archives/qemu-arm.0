Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp248381wrt;
        Fri, 7 Dec 2018 01:15:00 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XAomgWhcChL3e87K5fqGoa7RfL0JOjMFdauHbLWpXCHUzkO1NpwNIJzmgnUlEL6WHEMnoK
X-Received: by 2002:aed:2471:: with SMTP id s46mr1207193qtc.160.1544174100736;
        Fri, 07 Dec 2018 01:15:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544174100; cv=none;
        d=google.com; s=arc-20160816;
        b=nVKg5okN8Q0CidM0JObjKhqf9sGKa9/Y9uevkSS46VZzCJzjAewy8BkegX/z/CXReH
         t7bwqIkfLit3WB3XjtQXU+CDumuCqP3pqlNjfDI3JPiHuNQcz8dh+2LLFH2niJM9Rwmd
         gQXdkAZwQJk8PPgGKroX864KSNTVbHs5Bjn/ioCH8l5VN9j3xd7twLEFSOeTfLHGvoHx
         90zWp52kBFIjJXeepdjaVxHyn5SCS7BSTS/fxJ0tzVmNOpfrP/3Gxs7pct9rOfij9Zi7
         4TXQbHU6WuVpYH3/0w8DgmqjiR3GELNd9r2g9BLkTSTEeA6DWzBmEeWW3KOC99Dk2DAm
         1mUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=77hfZAT3L1vg3j+jt7UacIa6AY3J9wxPycs5m1QDrjA=;
        b=QFe/6zwrKwWecwH4cr4PkUUfXfZiuS3AYm9HqYnroK++0cxsvETwMNjCYKQPLt9pKu
         /pJi9cDSzIjFAtbsW8X7cbZV6x/VT7stnM6hGAfHMaNkLaTU2FvvemR6Cd5L3xpa4M+W
         1ePpJd2bwkbaikEdfpEj1acaX77U8WMPEuDR+8IQMoVCOmGhF1GYCy9G6VSlllCDmYg7
         d+zv+byJ3qrvYINbMQZRp8clTczM4fhEVYX/E/iLeKeGI+cVp1i+OU99gBk0jn+PSMVH
         VOVTmDotjdC5Rt6D2l1g+XQzCM6F5pPw/QB9h0NsKnf6V1A7OSlShEJptVRGkZvQ9drX
         uwEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=hgdGBwgT;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=lhRD4wyT;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=lhRD4wyT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f65si588922qkj.251.2018.12.07.01.15.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 01:15:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=hgdGBwgT;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=lhRD4wyT;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=lhRD4wyT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44915 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gVCDr-0002q4-AF
	for alex.bennee@linaro.org; Fri, 07 Dec 2018 04:14:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57647)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1f-0008Fw-FU
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 04:02:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1c-0005hU-8I
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 04:02:23 -0500
Received: from greensocs.com ([193.104.36.180]:52276)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gVC1b-0005XD-Ro; Fri, 07 Dec 2018 04:02:20 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 4645248001C;
	Fri,  7 Dec 2018 10:01:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173319;
	bh=IP6jRQoZE0XKPG4iiMFfY8vpzGwLJrBjjivKVJr6bTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hgdGBwgTxbBPns+RRVz2aI1MVgFXssHXgD4Uqe7t+gyBzqEaodrRE86qJTHICk2MH
	9EcZdA3tq9i2Wwp+ySUNSnuTyeJ2Adt7AM8kSxcaIBhplDYyveRBQc2XqHugC2Jbv5
	GGatb3D8A4S2JCdR1O51BvAG+KQz9uocxWjAHLp4=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=lhRD4wyT;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=lhRD4wyT
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yp5BzxRFgf90; Fri,  7 Dec 2018 10:01:53 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 93A4C480013; Fri,  7 Dec 2018 10:01:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173307;
	bh=IP6jRQoZE0XKPG4iiMFfY8vpzGwLJrBjjivKVJr6bTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lhRD4wyTVgj6/nrZ9qJK2bCrNjDkD5R+ADdGJmPfO5hKJnNPud7Qzx65rJEtNtupX
	g4l34bdMt+VCjWDFirKhrx9gxxKLE8Jb14NCCzAmpl15kwpmEVsedTSF2NNanhiUNE
	8PnyqeIL/oB/lkusHIYPBJTMHFQ7CXHapjOitsP8=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 29AB748002B;
	Fri,  7 Dec 2018 10:01:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173307;
	bh=IP6jRQoZE0XKPG4iiMFfY8vpzGwLJrBjjivKVJr6bTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lhRD4wyTVgj6/nrZ9qJK2bCrNjDkD5R+ADdGJmPfO5hKJnNPud7Qzx65rJEtNtupX
	g4l34bdMt+VCjWDFirKhrx9gxxKLE8Jb14NCCzAmpl15kwpmEVsedTSF2NNanhiUNE
	8PnyqeIL/oB/lkusHIYPBJTMHFQ7CXHapjOitsP8=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Dec 2018 10:01:33 +0100
Message-Id: <20181207090135.7651-16-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181207090135.7651-1-luc.michel@greensocs.com>
References: <20181207090135.7651-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v8 15/16] gdbstub: add multiprocess extension
 support
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
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CxzKWHM5VdlT

Add multiprocess extension support by enabling multiprocess mode when
the peer requests it, and by replying that we actually support it in the
qSupported reply packet.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 gdbstub.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 48b49195f7..bb82d97c5c 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1730,10 +1730,16 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
             snprintf(buf, sizeof(buf), "PacketSize=3D%x", MAX_PACKET_LEN=
GTH);
             cc =3D CPU_GET_CLASS(first_cpu);
             if (cc->gdb_core_xml_file !=3D NULL) {
                 pstrcat(buf, sizeof(buf), ";qXfer:features:read+");
             }
+
+            if (strstr(p, "multiprocess+")) {
+                s->multiprocess =3D true;
+            }
+            pstrcat(buf, sizeof(buf), ";multiprocess+");
+
             put_packet(s, buf);
             break;
         }
         if (strncmp(p, "Xfer:features:read:", 19) =3D=3D 0) {
             const char *xml;
--=20
2.19.2


Received: by 2002:a17:906:d8da:b0:98d:c41:35ab with SMTP id re26csp128125ejb;
        Wed, 21 Jun 2023 13:36:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ50DlejCyRyY0C43koPHlZynbqm1sDBeYKk5ILdJlY8ny+ywUtZVr7VPTnK7vj8nFznzs+A
X-Received: by 2002:a5e:880b:0:b0:774:84f4:6ea with SMTP id l11-20020a5e880b000000b0077484f406eamr13077134ioj.11.1687379819285;
        Wed, 21 Jun 2023 13:36:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687379819; cv=none;
        d=google.com; s=arc-20160816;
        b=wCTQU7n7ppexBkfexljap0L8QV7ceVDRyzLbHLYh0hyB+gyLZypitIcqak55AQ4ENS
         JwxPm7XigG7t7ngCvHErmazke5rkdafZxB75BPFQtItlOir+Z1uGJu31/5mxkK+unEpa
         ovPKKIeixH3XjZelhZaGrH9bTRZkDXJVPduDRQGlhuIz7mCTtcq09Q0+oFb9UlHafI9S
         Glc3Ky3XFMlpaIugMLgqNqwWZxi0KiKwVW6nuqwlic6Zo0MipOX/JW99ZMCp6HJ8zkvs
         +7Svsp2MfMiKeMsTtwMk4i8a+GOBHVR4lTZAnpw5e0EoOVDfRQ4SfCJuEHHBeWN72TZh
         2/2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hkF6Ozvx4FPBA20KrX19IeWIjWHpcac1PcepJTSpkNA=;
        b=LrfeonW1hvtPKrkSkemKfMyzzoa+meJbxjHBt3plJVJPJ3yPa8QX7RIzujbXm7zzEQ
         dLUk1VXPnDQfTpm095Px9Cfz7Bqsa0J9MQWwUAsTwc41Ojjr07YoipKlf2D/PqTFIHCW
         q7vAAo7HLGAwEt+5LpHLW15XiArGlAIRf999R2MRaSXYztgnmaVMahsTvrx2k23CCTaq
         m97isnVoRxEKeWtLrsIGjSODIdcM4E5Y1mqa7UcTUjCD6UsYJlX75DWjn3qpxTJ7VjFC
         uUkv5PL78+33fMG24z3g9ZHeLtsZhaSTDtYffKt7P/7mRfaytNlgfPRhE9LcSgx+GXv4
         bGPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="i8tav/Pt";
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id x9-20020a056638248900b0042525b82212si2369470jat.89.2023.06.21.13.36.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Jun 2023 13:36:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="i8tav/Pt";
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35LKEKiS021963;
	Wed, 21 Jun 2023 20:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=hkF6Ozvx4FPBA20KrX19IeWIjWHpcac1PcepJTSpkNA=;
 b=i8tav/PtsvNIz0jSxH8Rd+Fu+xOrjICCfY5QCodaiEmKzc54EIKJ562ZyZTUIb9OQJMo
 JwQg4hp3JTgk0koJnVHsB+T5rWPPE5SIZTrMigT218zBTiUp06oFWmCDsSvvsyIkrhd4
 zbTtDeFirHmbBhS+WgIl7ZwS64YPGNONwckbjQ6TxaryHOQxluwAfSsyip1Y+Qoilm3L
 nY/BAWUzTqEZEnr1mQRPqT5gT8AEf7bKp+IE0O7Z2/mbnHtdYY8u0OZmmTuYNEoyx/a6
 M9yN+GQB4a55Q430YrmctIzvzBbUcYmf2Zj29gUbGTDUTCxJvXc+RM+a37BaIkEXKgPp Yw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rc82g8f2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 20:36:58 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35LKKpv0010792;
	Wed, 21 Jun 2023 20:36:57 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rc82g8f24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 20:36:57 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35L3AgBn029539;
	Wed, 21 Jun 2023 20:36:54 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3r94f532s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 20:36:54 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35LKaq7o5767806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jun 2023 20:36:52 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3EB262004B;
	Wed, 21 Jun 2023 20:36:52 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A93B120040;
	Wed, 21 Jun 2023 20:36:51 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.179.1.208])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 Jun 2023 20:36:51 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Laurent Vivier <laurent@vivier.eu>,
        Peter Maydell <peter.maydell@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        David Hildenbrand <david@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 7/8] docs: Document security implications of debugging
Date: Wed, 21 Jun 2023 22:36:26 +0200
Message-Id: <20230621203627.1808446-8-iii@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230621203627.1808446-1-iii@linux.ibm.com>
References: <20230621203627.1808446-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8woW_lOX8HUWM-kvDYVt8SFJly4uC4Tr
X-Proofpoint-GUID: GR9kkEMBaZrw5-Fk9_oi7kMvyRb1f2uE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_12,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306210172
X-TUID: GQcWYNoMJsIB

Now that the GDB stub explicitly implements reading host files (note
that it was already possible by changing the emulated code to open and
read those files), concerns may arise that it undermines security.

Document the status quo, which is that the users are already
responsible for securing the GDB connection themselves.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 docs/system/gdb.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/docs/system/gdb.rst b/docs/system/gdb.rst
index 7d3718deef..9906991b84 100644
--- a/docs/system/gdb.rst
+++ b/docs/system/gdb.rst
@@ -214,3 +214,18 @@ The memory mode can be checked by sending the following command:
 
 ``maintenance packet Qqemu.PhyMemMode:0``
     This will change it back to normal memory mode.
+
+Security considerations
+=======================
+
+Connecting to the GDB socket allows running arbitrary code inside the guest;
+in case of the TCG emulation, which is not considered a security boundary, this
+also means running arbitrary code on the host. Additionally, when debugging
+qemu-user, it allows directly downloading any file readable by QEMU from the
+host.
+
+The GDB socket is not protected by authentication, authorization or encryption.
+It is therefore a responsibility of the user to make sure that only authorized
+clients can connect to it, e.g., by using a unix socket with proper
+permissions, or by opening a TCP socket only on interfaces that are not
+reachable by potential attackers.
-- 
2.40.1

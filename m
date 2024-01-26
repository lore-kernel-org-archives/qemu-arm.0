Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp643074ejc;
        Thu, 25 Jan 2024 19:42:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2XEsoi6E1yhgeuw5wnSdp5COKTfw8pX9oUHvICbXMGKeWWKhQKriOZ8PR9+1SX3UWmEEc
X-Received: by 2002:ad4:5d43:0:b0:685:525a:1fc4 with SMTP id jk3-20020ad45d43000000b00685525a1fc4mr991923qvb.36.1706240575028;
        Thu, 25 Jan 2024 19:42:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706240575; cv=none;
        d=google.com; s=arc-20160816;
        b=xl0HvMkRH42gX1EwXUY9cP99PgnbK5SrhIvx4KC6fKAyq9ClkRh/X5TK6YIxAxddGS
         nnR77k6vPX9ZGZ1MP1jeoFqd64PlxdBv+QQ0rhcicnXAI63dXLnEHEHH3uymNrIVD/43
         TlT/wrxSgeayhBPUPRGIcu1o5unc62RV9L2NWaO+O83RWFavWaCvQy0sFgjmZCQ8Kllu
         X59bc34ojnvgMa7mltTNWT55s46uAgP7XelDni0EbEQCY+eiphQHww/RP5TYPyYUTUJW
         71gDpbBGieHen1n/xD+g9pltGSLgKzbvapLOfANcHEN+NPGqWMBXD9WZahIrs7FSITg6
         zfaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Aeh4m6y4uSorIijoXOWHORcwePrt5iAPL8+LUhQbUYk=;
        fh=xrfrdnXt6yALLaQWR1WAebrnD81q5WGqWzq5w17UyxQ=;
        b=YVtD0rt5DoCHOwpkHN9NPCd3Xm2lhmkVdwSFisUOZ8ACSezhSupvFbiGqeJuU9ctjB
         wCt44nlPjfeaQtowTPjDbh6n8G+qyKbYzF8G1nn2wpLNzgjxTnAr1FIHTCLSNaQhj4yT
         1kseU+KdExerTR6A5NNK99ZN2vDQrdQT5z5o59mQhu+KH719NsbrcEydEhI/S2AatiAY
         LD1a/09CE6hmUe8LaeKEPonIZTNxPOvZPYbaYjX4HHqJxgfcoT6XJ23DlA2QLPoab4vS
         gP67G+0M4Gwg6CZrOOUND9+7ekZ9csgkGht+nSB8UbEC/OQyOYCBCa386fyXuZNn4iEb
         pinQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=oH2h5TrJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kd8-20020a056214400800b006819bba47f5si418421qvb.459.2024.01.25.19.42.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jan 2024 19:42:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=oH2h5TrJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rTD5E-0004aZ-JF; Thu, 25 Jan 2024 22:40:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTD5C-0004X2-OM; Thu, 25 Jan 2024 22:40:46 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTD5A-0003NV-Se; Thu, 25 Jan 2024 22:40:46 -0500
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 40Q2vlfO029537; Fri, 26 Jan 2024 03:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Aeh4m6y4uSorIijoXOWHORcwePrt5iAPL8+LUhQbUYk=;
 b=oH2h5TrJON7P8V+O/sXvAIJ6kB0ShfhWwvT4u6ekzSrdEotEWfIsTVSolX/5wYThq4Qe
 FwXvh/hAz5JRLi+iM7m9sF1r+4NSeGXsmk8DnSfCcN7JcDUK43DFGYJJHXoGlGkqZCl+
 eBN19v1lnkDmm4Q19qoL80k/2Axk1ADVqtCFmbNLPMbfnY/IMlPds4H9YySgcsEyVL3b
 QkneqCMagDDG2WEnlI7J6/SjaKnvDBKLsL/ThgBHxdrxVnkXN96UqySJQPCyL/vKVJgt
 4rGm3WDAtvz5mDz2EnFGu2VzQeEv6jgtGCABEFuZNEFGh/RW7iO9G+2z40H/tU8mm18b 3Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vv4dm8yt8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 03:40:34 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40Q3UHCA009734;
 Fri, 26 Jan 2024 03:40:34 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vv4dm8yt1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 03:40:34 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 40Q2dQwX028239; Fri, 26 Jan 2024 03:40:33 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vru7300q1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 03:40:33 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 40Q3eWQ064160168
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jan 2024 03:40:33 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D760A58043;
 Fri, 26 Jan 2024 03:40:32 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 903B75805D;
 Fri, 26 Jan 2024 03:40:32 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jan 2024 03:40:32 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org
Subject: [PATCH v11 11/11] hw/fsi: Update MAINTAINER list
Date: Thu, 25 Jan 2024 21:40:26 -0600
Message-Id: <20240126034026.31068-12-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126034026.31068-1-ninad@linux.ibm.com>
References: <20240126034026.31068-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ju8k8E0s4w2ZUT2lCCIF84w19hnrko_u
X-Proofpoint-GUID: qMUiM410uthhPCYxUjdA6ul2B0__pmFv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=910 suspectscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401260024
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ninad@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pCrke6Gr5m4w

Added maintainer for IBM FSI model

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
v11:
 - Added Cedric as reviewer.
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dfaca8323e..39deb8ee1f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3585,6 +3585,15 @@ F: tests/qtest/adm1272-test.c
 F: tests/qtest/max34451-test.c
 F: tests/qtest/isl_pmbus_vr-test.c
 
+FSI
+M: Ninad Palsule <ninad@linux.ibm.com>
+R: Cédric Le Goater <clg@kaod.org>
+S: Maintained
+F: hw/fsi/*
+F: include/hw/fsi/*
+F: docs/specs/fsi.rst
+F: tests/qtest/fsi-test.c
+
 Firmware schema specifications
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Daniel P. Berrange <berrange@redhat.com>
-- 
2.39.2


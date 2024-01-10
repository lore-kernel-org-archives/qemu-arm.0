Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1348976ejs;
        Wed, 10 Jan 2024 15:17:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG20GZdSuXsyN2esLmCDlAMij3B4xSSFBbw8hGkw2iVBAMQIu5tuoxIRu85Vx+wtBkHgYJY
X-Received: by 2002:a05:6214:1253:b0:680:b6ec:ea05 with SMTP id r19-20020a056214125300b00680b6ecea05mr279599qvv.62.1704928673493;
        Wed, 10 Jan 2024 15:17:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704928673; cv=none;
        d=google.com; s=arc-20160816;
        b=ecXwPjcUGQWAd3KQHyJ0xA/oN+HTRK4brh/uyvuxpTADJF/9e3Bx/j7jkO80gBlVWd
         odHHAo79zgnxRaH9YsXNPOgw1oKwtfbH7fUHX219CD8f4l+CfGc+wHz/yWNmQEwwXJUr
         jExxkAUF58vThN7wfZvDKqcn29pdAVUduPI2KAz7J+m6T9yzUwA5wM/uIElD2PRJqSDs
         R8WuT8LIeDTXvvDPRRDuHc7uos/dCx0vQdAmVt2OYYTFau6cUQUi/mHrSR3YFPdrAtAB
         rgOEZGnFpKQ7HkniPeKuUqivGjwyXRquOhUxeIwxJhH0h5z6dQ4wB1kDERLhEReNcc4T
         co0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CTdm+FVycph91yJXZydhBK1mM2a0J0Ea8io97hvoaFQ=;
        fh=xrfrdnXt6yALLaQWR1WAebrnD81q5WGqWzq5w17UyxQ=;
        b=S1UuRv+PiwgZWZ3+Rh9U5VVf5pkjMHNjL+DVhzs6ic10m99c8YmqTK4bvn5LKBMuh1
         40znblbhWs4qCrZ37Nk9yJiSrQpsGDYhW0R8lhsaEmurTGEYXF98U3CCSxkSf/Aur56K
         yuWksYAkZTSXXSsHyJHE8Tc9jsvemv60ijFg7mkRh35CAZ5OmejAG8ZeixCPlQgC8MlW
         VqFqkRTehdyz9FmzcOGe+5eFgO+X4qGtWl9JqvLCgu+kIdQT4fRxjcDNmkshJ37ByIx4
         nX4PdIde+uuo24eUonaTVxwcN1h6AzdnmOebeOL9/MNSaoXG/sTFfuAM8tk/6cxY1t8a
         bOVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=IWcvebMY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3-20020a0ce4c3000000b0067f0b985f45si5326286qvm.608.2024.01.10.15.17.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jan 2024 15:17:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=IWcvebMY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rNhpP-0000II-2n; Wed, 10 Jan 2024 18:17:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rNhoF-0007VV-MK; Wed, 10 Jan 2024 18:16:38 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rNhoD-0001we-PD; Wed, 10 Jan 2024 18:16:31 -0500
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 40AN9daT005305; Wed, 10 Jan 2024 23:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=CTdm+FVycph91yJXZydhBK1mM2a0J0Ea8io97hvoaFQ=;
 b=IWcvebMYn3Z8GGSMgUOe3k1zwPh0ubhyIfKzuMTIV4xfu9xOXIP8oWA8/hd6XZrb+Wnk
 Zo69zSkMSB5LRkIhGrNwHLGpMyUFuAIC+F3B59Dxwvx5pIgSv1uilaQXqm2xuqmfhAhm
 e+H/87tby3pNztuJliA5WViuuxJpfRd8G6MAxTkk7rhVX91I+pz4eL8EbxA7O41gcd/9
 98SrrW5OzkDofsn9C7UZRi0wgtlLT0j2DHC9Urf+3Bu5ufsf3QFtFc8sE+BzZsvu/2Ty
 /EZ4oMBtOp6yf8wqYQH2TohwL6yHsdnB5sdpk69MXTYmfm1DNasFcObdyVx2IAWO46QR 4A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vj18s4n0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jan 2024 23:15:46 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40AN0oPD012877;
 Wed, 10 Jan 2024 23:15:45 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vj18s4n03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jan 2024 23:15:45 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 40ALOpc8004427; Wed, 10 Jan 2024 23:15:44 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vfjpm005j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jan 2024 23:15:44 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 40ANFh3k20841078
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jan 2024 23:15:43 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E28158065;
 Wed, 10 Jan 2024 23:15:43 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0319F5806E;
 Wed, 10 Jan 2024 23:15:43 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 10 Jan 2024 23:15:42 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org
Subject: [PATCH v10 9/9] hw/fsi: Update MAINTAINER list
Date: Wed, 10 Jan 2024 17:15:37 -0600
Message-Id: <20240110231537.1654478-10-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240110231537.1654478-1-ninad@linux.ibm.com>
References: <20240110231537.1654478-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zFL-M2plfzjh7Jra83Ur70JzBDa6x03y
X-Proofpoint-ORIG-GUID: iVMFEXUnjhnqlG8AbvU20fQD_915xD9h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-10_12,2024-01-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=850 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401100184
Received-SPF: pass client-ip=148.163.156.1; envelope-from=ninad@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
X-TUID: BW4Md3VZoJ4w

Added maintainer for IBM FSI model

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 00ec1f7eca..79f97a3fb9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3569,6 +3569,14 @@ F: tests/qtest/adm1272-test.c
 F: tests/qtest/max34451-test.c
 F: tests/qtest/isl_pmbus_vr-test.c
 
+FSI
+M: Ninad Palsule <ninad@linux.ibm.com>
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


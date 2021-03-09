Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2799895lfg;
        Tue, 9 Mar 2021 05:19:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyemzWVhobt8q/kxVjzAFjF1v/vARsJ8pgkUiipdmWqD2oGgmW53C470i/mpPW6jBgs1nK
X-Received: by 2002:a92:c052:: with SMTP id o18mr24520660ilf.84.1615295958578;
        Tue, 09 Mar 2021 05:19:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615295958; cv=none;
        d=google.com; s=arc-20160816;
        b=0cmdjjhfSg2fLqzN6t+ip8zfVH44+wRynmh2dlZasv0vfCsuHblkTHVhVSBgJJ97sF
         dbreJTnMFLpAN39DWw3n7ddH8V8fK+yOWU81RPRJRsZFFM1q2t9AJDtA03cOQhf35Nc5
         5OXJc8JUgdMmrEoMTPvA8Kg9EwSnt2Q9BKiked87xNjN2ZmdRyQWRdeud0n1c72fdVZS
         i0ocTSyL7e2LifGtlasZlLqpIs/r8fQS/fS5Th+3ZNeg87tnxLBj9RmBoZhcNtN5FFCf
         bXuVApyDE1bOw4nLvjEykrj5eUbdz5lovIMTInDDIH9/GLSGtVLkyAoe+xKvKCtTqxQ6
         oRPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=fna6enZXAYFfcesA62niTMHmMfq8+njy85nCkvdbQ8Q=;
        b=v65NxeNM+uaXH5WOkGmeItgn+s4znPCm/SIeTgAlZL3l+Y2owvv7bgCK7vfNrIdFAQ
         z1u6QIv5jw9wsTtqjDBQbk+TcLercmOdH/YGHVkhMlP9VLOhE53J9fMhineujiyIyxgB
         NQEQftffb18E1Fqph2CVSXgwH3Fjc96ZbIemvDZjW/NfWEgUZi9tKvPo05pyc3l5Zg2n
         Elz6qRflVfTuI1A9pGqSKUvP5ZMs39wj4Y0Dq41glsVr1lZTosqzs/0TwQlQHTHYI3Db
         TKbVlMW8iBNSOcnq9NZf2iQaeXwtDJNdYakyvRZDmd4LgnW2u7gNxnDdlExUBU+9KueQ
         ++Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8si13211672ioj.36.2021.03.09.05.19.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 05:19:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJcGb-00027B-Qp
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 08:19:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lJcEW-00025v-QS; Tue, 09 Mar 2021 08:17:09 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lJcER-0007AZ-Qj; Tue, 09 Mar 2021 08:17:08 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129D3WFe117548; Tue, 9 Mar 2021 08:16:48 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375wcm9ca6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 08:16:47 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 129DBeCl023362;
 Tue, 9 Mar 2021 13:16:46 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 3768v0r0w9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 13:16:46 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 129DGhSW55247346
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Mar 2021 13:16:43 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C842642047;
 Tue,  9 Mar 2021 13:16:43 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C94D42045;
 Tue,  9 Mar 2021 13:16:43 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  9 Mar 2021 13:16:43 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.251])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id E9B8C220270;
 Tue,  9 Mar 2021 14:16:42 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/7] arm/ast2600: Fix SMP booting with -kernel
Date: Tue,  9 Mar 2021 14:16:35 +0100
Message-Id: <20210309131641.2709380-2-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309131641.2709380-1-clg@kaod.org>
References: <20210309131641.2709380-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_11:2021-03-08,
 2021-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 adultscore=0 bulkscore=0 mlxscore=0 clxscore=1034 priorityscore=1501
 mlxlogscore=856 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103090064
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w/hLoOeN0ZIV

From: Joel Stanley <joel@jms.id.au>

The ast2600 machines do not have PSCI firmware, so this property should
have never been set. Removing this node fixes SMP booting Linux kernels
that have PSCI enabled, as Linux fails to find PSCI in the device tree
and falls back to the soc-specific method for enabling secondary CPUs.

The comment is out of date as Qemu has supported -kernel booting since
9bb6d14081ce ("aspeed: Add boot stub for smp booting"), in v5.1.

Fixes: f25c0ae1079d ("aspeed/soc: Add AST2600 support")
Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20210303010505.635621-1-joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast2600.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index bf31ca351feb..49b00763864c 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -241,8 +241,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
=20
     /* CPU */
     for (i =3D 0; i < sc->num_cpus; i++) {
-        object_property_set_int(OBJECT(&s->cpu[i]), "psci-conduit",
-                                QEMU_PSCI_CONDUIT_SMC, &error_abort);
         if (sc->num_cpus > 1) {
             object_property_set_int(OBJECT(&s->cpu[i]), "reset-cbar",
                                     ASPEED_A7MPCORE_ADDR, &error_abort);
@@ -253,11 +251,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *=
dev, Error **errp)
         object_property_set_int(OBJECT(&s->cpu[i]), "cntfrq", 1125000000=
,
                                 &error_abort);
=20
-        /*
-         * TODO: the secondary CPUs are started and a boot helper
-         * is needed when using -kernel
-         */
-
         if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
             return;
         }
--=20
2.26.2


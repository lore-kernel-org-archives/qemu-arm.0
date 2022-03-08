Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2299960lfo;
        Tue, 8 Mar 2022 04:29:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfD0FToIDFD3e3D8pzqgkJLq1m/QzMkxOP860k5bG8zhWH3XbgYnErxDOEHU74E7HsEgTT
X-Received: by 2002:a25:3796:0:b0:628:83b5:b111 with SMTP id e144-20020a253796000000b0062883b5b111mr11708819yba.194.1646742573392;
        Tue, 08 Mar 2022 04:29:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646742573; cv=none;
        d=google.com; s=arc-20160816;
        b=murbtYHLvkQqdVaQ/9gW0vu+bO+NiA84F1Fj7VkxkUfVesiPG1+0XqXFhhIvu7FmDS
         jaGKoCVHsqciA0uim3sWmwqmkFxiC5wLx+Vc2jsPO2uzc6a0UAcmRsJlTt2A5GUxpZkn
         /VWC3eE16XrmGyGFQng+h9sfg+iEb48q5fGCNLThijG+mw04iRb4+xuFeraE8ccXh4qJ
         TQDdwXbwcujr1AgIeYN0XmU6PcITeAhRZwtkKljKccv84AMtM/hfC0wWfN+WmzLMiAWI
         rAWzlzNGtHuI2fJdi5zvqK5zRIC1VH3FdqplI6uAgexKeRIkF4vOTiCvSIWQ1ZnpzZMq
         idwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=a0AE409uQmHZtM3RsRYPWdGG5EccAEMYNB5x7z1bVF8=;
        b=koALRVtT3TE5rZ42ombypgTYmg3h7HCEoKfGpJjqd4PoeLzdVjdyDOvLNhfnhGuMBf
         ECIrybAudPEQjYqLwc8h44gBUhqYCcHtqGHWkW8xlxxAfB8VptRL27LQrtEun14V0s+8
         77s/Nwx34DCsnobba8IZWJ/QWKwa5APfV+oan9iHscmAtEQBjqyeKRMcJDUm0eqyNDWK
         5vtMNfCGl/jYCOGtl1w0RCg7a4lg7LwWxIcIBSv2D1oZXX/jj3A5BNLihnej6JHpkT7V
         ql3LG9maqh6wWroxfjko6xcNhD6qH0b/i9qZ7Et8Io/DXxk4Hw0hFMJsNDpWGszD4nYW
         F4Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y85-20020a813258000000b002dc5d726131si8555348ywy.325.2022.03.08.04.29.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Mar 2022 04:29:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRYy4-0003QJ-PL
	for alex.bennee@linaro.org; Tue, 08 Mar 2022 07:29:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nRYr3-0000R3-8T; Tue, 08 Mar 2022 07:22:17 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:3260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nRYr1-0006GB-NZ; Tue, 08 Mar 2022 07:22:16 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 228CLMiK013316; 
 Tue, 8 Mar 2022 12:22:00 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3envcuv6gp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 12:22:00 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 228C87WV023498;
 Tue, 8 Mar 2022 12:21:58 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3eky4j6brx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 12:21:58 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 228CLu6b46530824
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Mar 2022 12:21:56 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38F1942047;
 Tue,  8 Mar 2022 12:21:56 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA6F742041;
 Tue,  8 Mar 2022 12:21:55 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  8 Mar 2022 12:21:55 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.238])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 3A87F22027F;
 Tue,  8 Mar 2022 13:21:55 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 03/11] aspeed: Rework aspeed_board_init_flashes() interface
Date: Tue,  8 Mar 2022 13:21:41 +0100
Message-Id: <20220308122149.1602798-4-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220308122149.1602798-1-clg@kaod.org>
References: <20220308122149.1602798-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: E6OW69t8kz4vYFYTmpPHQn6mvm8i9IO5
X-Proofpoint-ORIG-GUID: E6OW69t8kz4vYFYTmpPHQn6mvm8i9IO5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-08_03,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 malwarescore=0 clxscore=1034 phishscore=0 impostorscore=0 mlxlogscore=914
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203080063
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cGrbd4cH3Tg3

Currently, the allocation of the flash devices uses the number of
slave selects configured in the SoC realize routine. It is simpler to
use directly the number of FMC devices defined in the machine class
and 1 for spi devices (which is what the SoC does in the back of the
machine).

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220307071856.1410731-3-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index b71bc2559baa..65588017659c 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -271,13 +271,12 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr=
 addr, size_t rom_size,
     rom_add_blob_fixed("aspeed.boot_rom", storage, rom_size, addr);
 }
=20
-static void aspeed_board_init_flashes(AspeedSMCState *s,
-                                      const char *flashtype,
-                                      int unit0)
+static void aspeed_board_init_flashes(AspeedSMCState *s, const char *fla=
shtype,
+                                      unsigned int count, int unit0)
 {
     int i ;
=20
-    for (i =3D 0; i < s->num_cs; ++i) {
+    for (i =3D 0; i < count; ++i) {
         DriveInfo *dinfo =3D drive_get(IF_MTD, 0, unit0 + i);
         qemu_irq cs_line;
         DeviceState *dev;
@@ -373,10 +372,10 @@ static void aspeed_machine_init(MachineState *machi=
ne)
=20
     aspeed_board_init_flashes(&bmc->soc.fmc,
                               bmc->fmc_model ? bmc->fmc_model : amc->fmc=
_model,
-                              0);
+                              amc->num_cs, 0);
     aspeed_board_init_flashes(&bmc->soc.spi[0],
                               bmc->spi_model ? bmc->spi_model : amc->spi=
_model,
-                              bmc->soc.fmc.num_cs);
+                              1, amc->num_cs);
=20
     /* Install first FMC flash content as a boot rom. */
     if (drive0) {
--=20
2.34.1


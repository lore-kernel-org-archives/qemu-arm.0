Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2304101lfo;
        Tue, 8 Mar 2022 04:36:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYMd+3t/1XureF+/QvDy3F4+x8qBfsDzqhsHHMaeOa4TnYmOGVC87OzRMqN96zmtnyGn6z
X-Received: by 2002:a25:c687:0:b0:628:7dc2:c20 with SMTP id k129-20020a25c687000000b006287dc20c20mr11441365ybf.409.1646742975084;
        Tue, 08 Mar 2022 04:36:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646742975; cv=none;
        d=google.com; s=arc-20160816;
        b=bVTVq35ahcNZQmXIkrTpVhCkiSMPSe7gtyMfj9/OVMB8/Dl/d0X95OCEK6JewRD9dO
         wlgh3vhfI+2iJbbSC160GkS2KY1uSUgdxO2i1Mwki83GG+nCL7WEKPz40W23BZSXuV3W
         j0gSmsZe+4wv5OY5D0sgrDQmBpT2V+Qu7fPcjl7WUbyUIgP1A29KnJ6Q5fnjl+YnND70
         hoDN/yWTxkFY2oPodHBewNOKEbuwxLxhRakCfRUF4G6tm2BoZfAq/Ca/z2X2ELRKV0wd
         KL9SFPuew61VKFcz7W8REWSyutKy1lhWVJkMlt2Hyuqll/QErEMUZR1CIO0+YokmFmaU
         DVRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=eK+Lr04nZ0lhV30V+qvtfKSJKCLzII0qKu1nZ8u1QNY=;
        b=x8cNEqOki3hjkVDRTDRCYKWt9V4Dn6a6/dzTw+rx0BFvV0yvXeV91WASM5MT8ePT59
         uu18dxa0Y/N96EjPvAXG4L17yNZBYLOjkHdWajWMVu7CU0P69XeJViy1OEYCaO5RJtdR
         pF4FsV43DISJkNhnkZ2fl4kT466YqsAKd72pppi4KK/9UgWZYcr5n/f63vZiRWnLdqGL
         uuF7Ga1xIO6urNlt4G90mUY/kEVyh6j9sLEKPF39rZjpYEyd/dB/Tuq06NRZwCcBjEwG
         niKCmi8waqUv3h0pQLYiP5XOI2Ah7OdB/LH6A2mD8385zJFMDnT6cv9lpgYAsymacvLz
         cWtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5-20020a259885000000b0062469b60d3bsi9725251ybo.173.2022.03.08.04.36.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Mar 2022 04:36:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRZ4Y-00015c-HV
	for alex.bennee@linaro.org; Tue, 08 Mar 2022 07:36:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nRYrB-0000rL-1g; Tue, 08 Mar 2022 07:22:25 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nRYr9-0006IP-7j; Tue, 08 Mar 2022 07:22:24 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 228AE3GZ013713; 
 Tue, 8 Mar 2022 12:22:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3enxs01vrd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 12:22:05 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 228C3pnF004904;
 Tue, 8 Mar 2022 12:22:05 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3enxs01vqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 12:22:04 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 228C96mW019231;
 Tue, 8 Mar 2022 12:22:02 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3eky4hygrh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Mar 2022 12:22:02 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 228CApMD38273474
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Mar 2022 12:10:51 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E44EDA4040;
 Tue,  8 Mar 2022 12:21:59 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90DE4A4051;
 Tue,  8 Mar 2022 12:21:59 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  8 Mar 2022 12:21:59 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.238])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A989B2201DC;
 Tue,  8 Mar 2022 13:21:58 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 08/11] hw/block: m25p80: Add support for w25q01jvq
Date: Tue,  8 Mar 2022 13:21:46 +0100
Message-Id: <20220308122149.1602798-9-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220308122149.1602798-1-clg@kaod.org>
References: <20220308122149.1602798-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: h1vvF3nkM3xon75xWuayRC_KGkPwUgxn
X-Proofpoint-ORIG-GUID: KR3jYxm5fYGaUilPUrAOBXs9D5htLuws
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-08_03,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=884 clxscore=1034 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203080063
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Potin Lai <potin.lai@quantatw.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Patrick Williams <patrick@stwcx.xyz>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 09Mc0woGYymy

From: Patrick Williams <patrick@stwcx.xyz>

The w25q01jvq is a 128MB part.  Support is being added to the kernel[1]
and the two have been tested together.

1. https://lore.kernel.org/lkml/20220222092222.23108-1-potin.lai@quantatw.c=
om/

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
Cc: Potin Lai <potin.lai@quantatw.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-Id: <20220304180920.1780992-1-patrick@stwcx.xyz>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index c6bf3c6bfa83..7d3d8b12e01f 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -340,6 +340,7 @@ static const FlashPartInfo known_devices[] =3D {
     { INFO("w25q80bl",    0xef4014,      0,  64 << 10,  16, ER_4K) },
     { INFO("w25q256",     0xef4019,      0,  64 << 10, 512, ER_4K) },
     { INFO("w25q512jv",   0xef4020,      0,  64 << 10, 1024, ER_4K) },
+    { INFO("w25q01jvq",   0xef4021,      0,  64 << 10, 2048, ER_4K) },
 };
=20
 typedef enum {
--=20
2.34.1


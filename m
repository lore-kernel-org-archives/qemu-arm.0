Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp2365357lfg;
        Sun, 2 May 2021 22:28:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqGWaD49MpQzEK8nxZd4j784CG+3bLdEXGvjpM9CkqjNVefrYXUmXt0li7NTr1ZkxOkP+T
X-Received: by 2002:a5d:8b1a:: with SMTP id k26mr13386593ion.191.1620019712704;
        Sun, 02 May 2021 22:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620019712; cv=none;
        d=google.com; s=arc-20160816;
        b=O5cRhKHwKFH+xIDUOviKLveYCht9CZ5CsY3whXic7Mp2WnmfG0J69NdDLpeaxSRrok
         eS5lomhi5FRLh7WpZe70lV20JftiihH10T82kCFI0CKK/3LX/bWrZ5qMz/ypjanBPD1a
         THuIIH0ri40ZnYrhCoygNhFgDVSM2cLzPOlavJGKOmiZofpa6mjcCqSP5xXofivtx3/7
         j1UdzLo2fIBs0Z0zIDjXyOWm3JxVmQHCK/ZFnKsdqboWM6D6FKfGoGUZ4JXEddhw08FD
         s2QWYGFdahuCbGUQuwFftiRc6sPuQj7Ag0UeTzE8ZBDjJG2MUk3QRvmhYnueQp7AM03V
         aLaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=SObVNy07hYoD3tPMduphydeBj5hAX+tkS4AZoGtV1ok=;
        b=KuH5hCBmjodfc2dLERSiOibi13JzOyqn7WxHShldgR6A/SaeiRXMv+nxMofeKaPFTx
         ikSvVl6gKJ8HmHtkVKH4/5Lh4H5H1Fbbmq6vCXvksYlj6diJ8q8bO41fb6zpxKDnjGyx
         gkdO9oLEmcoEaX1yyczM2KZDHzympOHvcyfLFSICaKN+9aZqnR0JdRk3eZwQVS2WwCUd
         WZrNB+1WbIldlZRtp7vQkwWdgfsM3T7CsPHKhY1yxutyil6m9R+yXSEVdzs8X2tyTO0E
         WLjwcPLvnBFtpGWXtwy7JIjyf44wCh2mh9nGuD3uIZQ23Vkfn0oTHIhxk3wIVvtHL3Qy
         A/SA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7si11172024ili.130.2021.05.02.22.28.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 May 2021 22:28:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ldR8B-000741-O2
	for alex.bennee@linaro.org; Mon, 03 May 2021 01:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ldR6J-0004q3-1c; Mon, 03 May 2021 01:26:36 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:19386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ldR6F-000699-FX; Mon, 03 May 2021 01:26:34 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14353MrM100532; Mon, 3 May 2021 01:26:14 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38aadfrnku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 01:26:14 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1435Laqq013201;
 Mon, 3 May 2021 05:26:12 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 388xm8g9kr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 05:26:11 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1435Q9Oq32964986
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 May 2021 05:26:09 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8787BA405C;
 Mon,  3 May 2021 05:26:09 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50E33A4054;
 Mon,  3 May 2021 05:26:09 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  3 May 2021 05:26:09 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 8849722007C;
 Mon,  3 May 2021 07:26:08 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/18] aspeed/i2c: Fix DMA address mask
Date: Mon,  3 May 2021 07:25:45 +0200
Message-Id: <20210503052600.290483-4-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503052600.290483-1-clg@kaod.org>
References: <20210503052600.290483-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _qt8fYrFimSh10c0ZxSCt7461weGDt8_
X-Proofpoint-ORIG-GUID: _qt8fYrFimSh10c0ZxSCt7461weGDt8_
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-03_02:2021-04-30,
 2021-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034
 priorityscore=1501 impostorscore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 mlxlogscore=833 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2105030033
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4poUhGoL27/b

The RAM memory region is now used for DMAs accesses instead of the
memory address space region. Mask off the top bits of the DMA address
to reflect this change.

Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20210407171637.777743-4-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/i2c/aspeed_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 518a3f5c6f9d..e7133528899f 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -601,7 +601,7 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr=
 offset,
             break;
         }
=20
-        bus->dma_addr =3D value & 0xfffffffc;
+        bus->dma_addr =3D value & 0x3ffffffc;
         break;
=20
     case I2CD_DMA_LEN:
--=20
2.26.3


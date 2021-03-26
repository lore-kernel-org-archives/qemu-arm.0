Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1679347lfg;
        Fri, 26 Mar 2021 13:14:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcTUmx8VfM9nf5sFd93xEpH7qa/YCK8tGBO6IyB6LjFDgSuPz8XmII0xDr2xh4+qoa7jkZ
X-Received: by 2002:a02:6a14:: with SMTP id l20mr14036217jac.12.1616789671053;
        Fri, 26 Mar 2021 13:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616789671; cv=none;
        d=google.com; s=arc-20160816;
        b=CG0xQb32p2hZ7c4eoJl4l2CeEooC48+ZKmMhztWk1ZFeBx6jew5Hb5Jagku5V8XiRD
         6du0o7vmBDJXGS9KC/ZE9olRAez8NEgf6iY/wak1YekvfQq6Rj/BJ4cr0UrczjVobl0Z
         bYdJ1RTyhNa12idS9hbMOsp0VTCktfEcHndBdB/KFwZMyZ+nDeqLdgPH/oveS762Jo09
         Ok4MrXHD3YX3Pwa005AVO/Hc4q8aFPq+c6JDOadbNC2BbNREMnWggcNtCk6EI7R7oeD6
         cc3zguE9df/P8ykg73mn1rL7+SN5w+mSKqK5QpBoIoAilbnZmhlgY+zR106yUZlEgVsO
         cChA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=aCX6EOQYU43I/5w0SV+0kox7NSw3Ty82+5aPUT6e8rU=;
        b=B5ugn/aeDp+RoKhUNvdrbninH8iMHYIu+OgNLxhE7usjmgyDZZUeQZrOhU2+Gj0b5C
         EoJw96VMSAkqQ3J1udRETV+x8ipe0amYMWlgBEwQHlrfT4/owinL1wNHjPKpgoibWGyE
         CxTFa9n0afs8SEiyV2iXqxuGHl9lN/ZsrrNZhxKrWBt8x2piVaVP9w8LK3ULnWZg+x9h
         eLKQIYp2dq5H6zXx5aY9C4qgJGNyONUbEX9m+sje8iuiCWKHHqrVPIFlOE355joSYST3
         mwwUywSY2JoUctasbyMz9MI9nxv8dkEr85kQUiRyWnehQINWCMey6IEY1xs1183RqPbm
         Mbdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=FlWmA+vP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10si3839885ils.82.2021.03.26.13.14.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Mar 2021 13:14:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=FlWmA+vP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:34610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPsqk-0006tD-A4
	for alex.bennee@linaro.org; Fri, 26 Mar 2021 16:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lPsHa-0006yI-17; Fri, 26 Mar 2021 15:38:10 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lPsHX-0001HZ-7M; Fri, 26 Mar 2021 15:38:09 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12QJX788112473; Fri, 26 Mar 2021 15:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=aCX6EOQYU43I/5w0SV+0kox7NSw3Ty82+5aPUT6e8rU=;
 b=FlWmA+vPNbySxr29GMglIx4hTesndsaia8P0OQuOAJoykjv8TdTIeyLcjt3KkGUj7zAX
 AUsWKC+34iYIcg+5yXwHpqc0pLIX9oxW+Xahh57EWtrzL0iCZtMDFyEndyigxHOLII0z
 4fS1xT/35EDXpRgnYc/FjTWX0BSlnxsr0ix2T5V9v60O49+HxGK1vpovQRxb5YbXjliq
 V17rsqQgV4dmmQ6CsNTBzMLxzmzI2V1yogP27K6/ZIKKCg3ipKXLLUAIUAuUZXeeo9eq
 JLJGuIMdoeuHhajc8JBhJ7EEYaxRsNxOqIgbRcqGL3l/739A5KOiDXSClQJykReHBCNC Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37hhq0yhtg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 15:37:54 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12QJXR6m114553;
 Fri, 26 Mar 2021 15:37:54 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37hhq0yhsk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 15:37:54 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12QJbdPJ006856;
 Fri, 26 Mar 2021 19:37:52 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 37h150hcuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 19:37:52 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12QJbp4t38076774
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 19:37:51 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6DF01AE062;
 Fri, 26 Mar 2021 19:37:51 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9991CAE063;
 Fri, 26 Mar 2021 19:37:49 +0000 (GMT)
Received: from T480-KlausKiwi.localdomain (unknown [9.85.195.191])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 26 Mar 2021 19:37:49 +0000 (GMT)
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] aspeed: HACE hash Scatter-Gather support
Date: Fri, 26 Mar 2021 16:37:43 -0300
Message-Id: <20210326193745.13558-1-klaus@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1cOZ34HFcyz0_sD8DHkfFZHoxPhWD7E2
X-Proofpoint-ORIG-GUID: 00hwbMV9miSnGP59_5TADkFBwgbW9AVA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-26_08:2021-03-26,
 2021-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103260145
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=klaus@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2DPGPZlb29bK

These operations are supported on AST2600 series of machines.

Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

---
Changes since V2:
 * Fixed spurious comment removing conditional 

Changes since V1:

 * Use address_space_ldl_le() to load single addresses instead of
   address_space_map()
 * Updated documentation
 * Removed several uneeded variables / casts
 * Confirmed behavior on real hardware for register masks, IRQ register
   etc
 * Adjusted testcases accordingly
 * Coding style fixes

 docs/system/arm/aspeed.rst     |   2 +-
 hw/misc/aspeed_hace.c          | 126 +++++++++++++++++++++++++++++++--
 tests/qtest/aspeed_hace-test.c | 156 ++++++++++++++++++++++++++++++++++++++---
 3 files changed, 268 insertions(+), 16 deletions(-)


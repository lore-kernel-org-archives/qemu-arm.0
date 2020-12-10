Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5891960lfb;
        Thu, 10 Dec 2020 05:20:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPYFI+TPIS3tB/mF/M/ABEGJz6VmAOAzvTzhIdK1VRhKC6ovaMu4Q6n3y0zYHdI9TRK35l
X-Received: by 2002:a25:348a:: with SMTP id b132mr2905966yba.378.1607606409205;
        Thu, 10 Dec 2020 05:20:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607606409; cv=none;
        d=google.com; s=arc-20160816;
        b=wRIGmmxJMqec5tl0lGESjwEfRowNciedMa48WcBmMSM9pSlWRHWcRKiFrcm9SlMSw9
         8XSYpkD/fEjejAyiRKSoE7quADTRsON4Qx/65BKRvIGWYzmlBPXra0nSj0ryHaW9GcsH
         DKMY9QJz+wXiEnUtYA4mKxbtRyVJq6McuHVjHyD25jbJ4gdcro4BhtIGHHxIUKdZHN3l
         kfKULeK3j+nj2w3qUdHS55gjWuoOwkffplo/FxBNnAUo4yLugLrVBGHjkIwK0dAkJZ92
         Xgeat/3ZDUc1qAJS+CdaYJzfq57RqINSbMeCfbxDHFkzhidb17Xh3qBzw778xX7lzcs1
         ZbyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=LuklwB7eU9dVj1vtrAhmx/P3/HUfmtdHfystlM8tVjo=;
        b=og8HyJDXWpe7SxdbYZv1oi2t5IyZCd9HGOdxFP6gAoGAByWHMDBR9AQxOSe85VCuEe
         wfhC1EyhyoSB8t9vvQfEfqjc1L7woWJQqSYaWM9KgLbDPh8k+7WmnltQW+g6moeqLMnr
         hPMf7ZWT68Hx5/xyCg46z6CKsf80nTKmfoywJ2wW0v50Tfne2LO2GfqUsjLPSeoLc7Rq
         2xkBCGXDPyTARhA9E14+TiNLiBYsaFO9CdUHRU9ldvYbwZuzCy5/ZcGLL2ah5uQyrDE4
         mukzwNzZcl1IkBR8iy3vxouvs9PY2XDUcfwPhbVtr+mX3VcqJX5FNx009SoSBXmI1x2T
         AXtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e141si5385553ybb.120.2020.12.10.05.20.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Dec 2020 05:20:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1knLrc-0006rC-Fh
	for alex.bennee@linaro.org; Thu, 10 Dec 2020 08:20:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1knLR9-00034G-JK; Thu, 10 Dec 2020 07:52:47 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1knLR8-0001oE-5g; Thu, 10 Dec 2020 07:52:47 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BACXD6g067315; Thu, 10 Dec 2020 07:52:39 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35bkbkhbds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 07:52:39 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BACqXiZ021407;
 Thu, 10 Dec 2020 12:52:37 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3581u8rhyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 12:52:37 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BACpK6w21299688
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 12:51:20 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F0FF52051;
 Thu, 10 Dec 2020 12:51:20 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 33F355204F;
 Thu, 10 Dec 2020 12:51:20 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-158-23.de.ibm.com [9.145.158.23])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 779BE220188;
 Thu, 10 Dec 2020 13:51:19 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/5] ast2600: SRAM is 89KB
Date: Thu, 10 Dec 2020 13:51:13 +0100
Message-Id: <20201210125115.1812083-4-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201210125115.1812083-1-clg@kaod.org>
References: <20201210125115.1812083-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-10_05:2020-12-09,
 2020-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=793 spamscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 clxscore=1034 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012100082
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: poTtCQKJCjta

From: Joel Stanley <joel@jms.id.au>

On the AST2600A1, the SRAM size was increased to 89KB.

Fixes: 7582591ae745 ("aspeed: Support AST2600A1 silicon revision")
Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20201112012113.835858-1-joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast2600.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 1450bde7cf26..12e4a16d3765 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -481,7 +481,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass=
 *oc, void *data)
     sc->name         =3D "ast2600-a1";
     sc->cpu_type     =3D ARM_CPU_TYPE_NAME("cortex-a7");
     sc->silicon_rev  =3D AST2600_A1_SILICON_REV;
-    sc->sram_size    =3D 0x10000;
+    sc->sram_size    =3D 0x16400;
     sc->spis_num     =3D 2;
     sc->ehcis_num    =3D 2;
     sc->wdts_num     =3D 4;
--=20
2.26.2


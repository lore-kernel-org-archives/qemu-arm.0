Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp623184njd;
        Fri, 28 Mar 2025 09:16:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVs5U7qUtTZy2nrYD5Xff1R8I9Fx1v5stsnQtYSh8CE0GFyBSFYGbRXrAs0v6FLT5Myd1j8iGWj6Q4apA==@linaro.org
X-Google-Smtp-Source: AGHT+IGtI9qcv/3+H0n582K04gBaLysg6RZPULZjYj1Vc+OnDhfVsxja6zdkawmlDdsnjDdqvrd/
X-Received: by 2002:a05:6000:1863:b0:39c:cc7:3db6 with SMTP id ffacd0b85a97d-39c0cc73ea6mr2724505f8f.19.1743178567096;
        Fri, 28 Mar 2025 09:16:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743178567; cv=none;
        d=google.com; s=arc-20240605;
        b=WvOdI3CtB2/Nl3WeUPmFg7yaSCUfWHE/Tg46haohrKU25xLZPOh/ml/hCySwGJ+BY1
         SvNQrqoxOBXLQopUcHbvqUI0Xw83Q/ARpdLDg2k7bQuZzbomO9L3v7aNL+kfohA0yzM9
         61b5JXDR4zL2MOqu5kyWfL4FcHYRccXhxA5z+PIleLGKyF6yfGpUa4xwUJHNym/wah32
         GIHDC8zSbhI/Fyd84rDejhkeYg9PaA857Ak9KGJrIb3LxgB6Rk5yfkmpg7KEm4Oxr4MO
         2i+t1Oif+O6T3izhvtphloBProV6TxeBElImUJg3xxvtKVdySNW9DaUy8cJ201gDGU8t
         N5BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=RHDZXk4BKNFCQ9WAa8i9qag5x/ll1/870SqJIvG4AUI=;
        fh=nCdwRRHI/+XecApR9Gvvwr8Ql1eSdUiDYDDa74qkhfc=;
        b=HBnqhz9EivdrGR1hob83vI51immocn+iqQaUimSrGNCp61v4IdzKoqAo35RUDJFnnX
         l1CWLjhXlPrGC8++ISq8/WFJpOqXaPENILz65xhn2N0awIriIfc91R7HXODaDh5D1pz1
         pEPT4964Wp2eUqzt/5ty4X0/YW4q2lxfyUB4OIrC8dcty/qGDmyx1ZLdRaws9D9psMiI
         k9SLDUQBTfX8A7/uZ1vYf/hb/QPiaypBN/vfhnc/hVYxmAhECSCtpH7DLBfXJRBoUREh
         O12lKCdUzyh8NWZiDeiWqalRm969NqOQwu0gTYVgmdPph6o3twWPmFp67w/fikc3r83c
         +0Ng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=sZuKOaPW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-43d831db592si38455295e9.159.2025.03.28.09.16.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Mar 2025 09:16:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=sZuKOaPW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tyCMG-0000om-I5; Fri, 28 Mar 2025 12:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1tyCM5-0000ni-FP; Fri, 28 Mar 2025 12:14:50 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1tyCM2-0005Tf-GH; Fri, 28 Mar 2025 12:14:48 -0400
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SCRuoJ011179;
 Fri, 28 Mar 2025 16:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pp1; bh=RHDZXk
 4BKNFCQ9WAa8i9qag5x/ll1/870SqJIvG4AUI=; b=sZuKOaPWMQYEkwaaqcFzZd
 5jpXP76WYiawKEmrVqNcDilYocgg1+n6pgd2ZsSA5TbWcv3VKDJX4t8kQNJ/D7AK
 2RhgwsIGQxyPwpBauFnBBiDRhI/996NL9XYRN3skV2CmAVF/Uuz5mG4xdc29cqUl
 gjUS0EFOlN/ccJrM2hi7VBBk94+zsCV2pFTqbAAAFFZ26TJl9vtLGquP3b3nEfIW
 1DU7wyllMcKI8gq2j9+ly2UcooRdVQ1tqyfNvtPDeiWoBAXrDAS7YZvvIAap0fSY
 +y0CC3b/JqNXVrwIj2PA34A8zR16jKdFtc2jZse2H5OkaWCm/okMzL7sk8Qeobsw
 ==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45nut2h6rn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Mar 2025 16:14:24 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
 by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52SGBNP4031016;
 Fri, 28 Mar 2025 16:14:23 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45nut2h6re-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Mar 2025 16:14:23 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52SEDDi2009694;
 Fri, 28 Mar 2025 16:14:22 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45j9rm2x04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Mar 2025 16:14:22 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 52SGEIp159638028
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Mar 2025 16:14:19 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAFD820040;
 Fri, 28 Mar 2025 16:14:18 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2FE92004B;
 Fri, 28 Mar 2025 16:14:17 +0000 (GMT)
Received: from li-978a334c-2cba-11b2-a85c-a0743a31b510.ibm.com (unknown
 [9.171.51.25]) by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 28 Mar 2025 16:14:17 +0000 (GMT)
Message-ID: <d3f978823d97b329993f9374422ea4effdd8eae4.camel@linux.ibm.com>
Subject: Re: [PATCH] tests/functional: Remove semicolons at the end of lines
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, =?ISO-8859-1?Q?C=E9dric?= Le Goater
 <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, Niek Linnenbank
 <nieklinnenbank@gmail.com>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 "Daniel P ." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>
Date: Fri, 28 Mar 2025 17:14:17 +0100
In-Reply-To: <20250327201305.996241-1-thuth@redhat.com>
References: <20250327201305.996241-1-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zfvsikr9uEtEKouFlrW8MJr63R8qiH4L
X-Proofpoint-GUID: uugSM969TBSxLUMZUA6RB4vtWp4VsmzL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 clxscore=1011 mlxscore=0 suspectscore=0 mlxlogscore=827
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503280111
Received-SPF: pass client-ip=148.163.156.1; envelope-from=nsg@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: zjKX34lUCrKI

On Thu, 2025-03-27 at 21:13 +0100, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
>=20
> Yes, we are all C coders who try to write Python code for testing...
> but still, let's better avoid semicolons at the end of the lines
> to keep "pylint" happy!
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>

[...]

--=20
IBM Deutschland Research & Development GmbH
Vorsitzender des Aufsichtsrats: Wolfgang Wendt
Gesch=C3=A4ftsf=C3=BChrung: David Faller
Sitz der Gesellschaft: B=C3=B6blingen / Registergericht: Amtsgericht Stuttg=
art, HRB 243294

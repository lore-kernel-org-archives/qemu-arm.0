Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1228489ejt;
        Mon, 27 Nov 2023 08:59:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzCU0tHAgX0Dz0riFGjNRjwiiZwVB7so47cjN1R/AuoOu4s7ffbp321bMCE/BGsprcPfh9
X-Received: by 2002:a05:6830:6b42:b0:6bb:1c30:6f3c with SMTP id dc2-20020a0568306b4200b006bb1c306f3cmr15795414otb.0.1701104349329;
        Mon, 27 Nov 2023 08:59:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701104349; cv=none;
        d=google.com; s=arc-20160816;
        b=Ioi7spwIvb9eybbh+mvd7xxoP7ASeeW1MKeFe3iQ/UZUKauFnttPHPcuGCHT00NelV
         iakVkCxKGBEEmV2NXTA2AVTZr98w3KXmsFd8G7P5Z54FT0fq/B8MzRAfHXqbL/+CKdfB
         6tcVx9cNNH0EhO23J0Q+0M2Y3d6QJV3FLtgv5kBg6ORoBThuRvHRL2XagzjUAYd0+gtj
         XwjaNEi7IIhmAA+8J7YLHl6F7GVoFZ0PnKqR114uPJMNX3PM6EjfxD+ic/Yg1WuqDQLw
         Uo+F3XYsJczITS9KHtMVPkUeYf4EUVauZOY9qIoEoznCu1d9rLY00Sc9EwI48VYlIprH
         yTLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=Sg0DDbuymi++WbzGDQsfcymNNTEk8vno1HHizEVvSkE=;
        fh=Zcq0JbCdP3ufDBrGVcMezb+Z09otguYcJBxp6Klg+Kg=;
        b=JAN2oYqzcmrUiZB7HUyA6BBONgeEdKAkawKpZ59+uGaH5TMk74AOmJ/0u6r+ROmC/I
         eBGgQuUlwCTDhkeWI5SSnAaXijAt5xo6VNId/NValJH03yb1DdbZjTfucoYfbsGXQyU4
         gt4Uc6R+PQJmmd5mceBp7GlIZNGIb1QmhoTx3dPhT4Z6MknI7vFO1x+eyR7YggKnui8S
         K0I6rRQDFIRlZmQsGnpgL3N32GIT5btb+fvA11k8WwXnZyxQ4a7zzCpYASaLPdmQBy8p
         dJetR12bLsuvAEm9M48jaCndJN5ghE/zv/4+PZaVNqHZjP6PvLYn1YWoQuMK/02Ibtuw
         SIjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=fGSPY8CF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fk10-20020a05622a558a00b004238e50730dsi9388447qtb.73.2023.11.27.08.59.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Nov 2023 08:59:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=fGSPY8CF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7ewA-0000qk-3Y; Mon, 27 Nov 2023 11:58:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1r7ew8-0000q5-FO; Mon, 27 Nov 2023 11:58:20 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1r7ew6-0002h3-T0; Mon, 27 Nov 2023 11:58:20 -0500
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ARGN2wN006728; Mon, 27 Nov 2023 16:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Sg0DDbuymi++WbzGDQsfcymNNTEk8vno1HHizEVvSkE=;
 b=fGSPY8CFIM7x2Y31OJnH8epTYMQL/mZGQg2Tat3ap8zC0itot/n5yQAwtkTw+hoGwe0P
 kUjCEPBLar86tK8RsOGk05CVqlD4K6IEARlQkezW4OYzxOOszP2S78N3T1Xvq6mpAtEV
 ZnYw9NBQq/2plIvqu/GVELFdPjUdWN5HEe25vpRohGvjTWtfnjMnQXD+Y61iZWEwBa6s
 4+3wZasAR0QDPd1KYQMKKpfbwGSrdF6gcYFWuoUjNqNTW22+DAlFpdZQp/mdABBGYr4v
 9/a6VLsrZTcu8eKeiQpWOfeorFB98JvwGkfwEybjZJ9jnwLxntCLfV+ml9T/thsmvoC0 ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3umxd51ec4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Nov 2023 16:57:39 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3ARGf5hZ023804;
 Mon, 27 Nov 2023 16:57:39 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3umxd51ebv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Nov 2023 16:57:39 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ARGqbQ7009557; Mon, 27 Nov 2023 16:57:38 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ukv8na0r9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Nov 2023 16:57:38 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3ARGvboM21103224
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Nov 2023 16:57:37 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BADE58062;
 Mon, 27 Nov 2023 16:57:37 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6B3E5805A;
 Mon, 27 Nov 2023 16:57:34 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown
 [9.61.23.212]) by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Nov 2023 16:57:34 +0000 (GMT)
Message-ID: <da385a33c43f7396f7e60f96c3c983efe5e8ffc0.camel@linux.ibm.com>
Subject: Re: [PATCH for-9.0] hw: Add compat machines for 9.0
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang
 <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, =?ISO-8859-1?Q?C=E9dric?= Le Goater
 <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>, Harsh Prateek
 Bora <harshpb@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, Halil
 Pasic <pasic@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
Date: Mon, 27 Nov 2023 11:57:34 -0500
In-Reply-To: <20231120094259.1191804-1-cohuck@redhat.com>
References: <20231120094259.1191804-1-cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jvrrmPRfsNNZySUSOC9FcpiZLeqk-ukC
X-Proofpoint-GUID: 560ox74gE2x8e4WuHcsbDhejmQouES6T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_15,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=549 mlxscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311270117
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jlWSdyd+MsyD

T24gTW9uLCAyMDIzLTExLTIwIGF0IDEwOjQyICswMTAwLCBDb3JuZWxpYSBIdWNrIHdyb3RlOgo+
IEFkZCA5LjAgbWFjaGluZSB0eXBlcyBmb3IgYXJtL2k0NDBmeC9tNjhrL3EzNS9zMzkweC9zcGFw
ci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDb3JuZWxpYSBIdWNrIDxjb2h1Y2tAcmVkaGF0LmNvbT4K
PiAtLS0KPiDCoGh3L2FybS92aXJ0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgOSAr
KysrKysrKy0KPiDCoGh3L2NvcmUvbWFjaGluZS5jwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzICsr
Kwo+IMKgaHcvaTM4Ni9wYy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMyArKysK
PiDCoGh3L2kzODYvcGNfcGlpeC5jwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTcgKysrKysrKysrKysr
KystLS0KPiDCoGh3L2kzODYvcGNfcTM1LmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEzICsrKysr
KysrKysrKy0KPiDCoGh3L202OGsvdmlydC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA5
ICsrKysrKysrLQo+IMKgaHcvcHBjL3NwYXByLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAx
NSArKysrKysrKysrKysrLS0KPiDCoGh3L3MzOTB4L3MzOTAtdmlydGlvLWNjdy5jIHwgMTQgKysr
KysrKysrKysrKy0KPiDCoGluY2x1ZGUvaHcvYm9hcmRzLmjCoMKgwqDCoMKgwqDCoCB8wqAgMyAr
KysKPiDCoGluY2x1ZGUvaHcvaTM4Ni9wYy5owqDCoMKgwqDCoMKgIHzCoCAzICsrKwo+IMKgMTAg
ZmlsZXMgY2hhbmdlZCwgODAgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCkFja2VkLWJ5
OiBFcmljIEZhcm1hbiA8ZmFybWFuQGxpbnV4LmlibS5jb20+ICAjIHMzOTB4Cgo=


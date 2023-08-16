Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp246174ejs;
        Wed, 16 Aug 2023 03:21:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbsqlkS/jpRh0+wfGOycrOMTw8U8GBlT/m12GZlalZCFQ50TW7dUEF5mKsYemSSuh9jfH+
X-Received: by 2002:a0d:eb81:0:b0:58c:b8b4:2785 with SMTP id u123-20020a0deb81000000b0058cb8b42785mr1238368ywe.45.1692181286848;
        Wed, 16 Aug 2023 03:21:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692181286; cv=none;
        d=google.com; s=arc-20160816;
        b=euE/Mv2dEqCtX7MgRhRfe+wGI4zgAf+LS2PJIhFz4ZtHe0b8JH0jbAaIPW589mEf9m
         ZDfxxzmUUdPei/g17Xkynz+VX4g7+2v85o78Cqw4eKK2LqrHZIW+v/V/Y+KlsR/52Px4
         +G7OKSOkLKS38a8ZF68TSYbUZZmDaYRd/peqd9PB5tl/UZGQLzMIh0G/M2Ywwrw7x4qg
         6nJ/eLxZtZcW4fWKiFd3m53faXyMUHDHasgBpfH4cHnPGHOhJoTf+d3XX5A7/aTYRzde
         0LpuGLJVg/bqUtegC9LnPKTjnz4dK8tI0qxmk9DPQMiXjee1lClazf7eoMJ53AkyeYJn
         RxpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:dkim-signature;
        bh=my98DqpJsGjhJRWyTjoeT8RWhtWMpxbap4VzCASW7+8=;
        fh=DJ3cW1lhZUD6rdt+wp48oldBTaPOco977KIJI8tUevE=;
        b=v/1yAbegkrIZmL9BCf9ZIugweoi4hnZvLP4bYQDPc2hybEX81Ume+7VPlGBDta8k7r
         zdw8x6zbpzxoIVAGSf8WvxAYvKWENuId7xO0BwhBkjoMhn0fFBKCFof92u5/PDjbDU8d
         Ik65uL4k/sDQr1crvsyazVkmPDVRH50VPg1EPBvxWmndN5vVfxSX34lRkISe18OBOzJy
         /OGD4oCdd+Zf8VyjdO3po61br7C5UVt1iHcR1MNgUjanF2LxATFI74GzwbFc1DjeTvAz
         4Z0+cBdTukMmrJlYQHsi2fRrE64Y7HsDHswRagiCGsuLAtjWklW6d4OzwgcMbM64ysqJ
         CzvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=WfjkkTrU;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id i7-20020a81aa07000000b00576c835770asi11771432ywh.204.2023.08.16.03.21.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Aug 2023 03:21:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=WfjkkTrU;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37GA9kDV029758;
	Wed, 16 Aug 2023 10:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=my98DqpJsGjhJRWyTjoeT8RWhtWMpxbap4VzCASW7+8=;
 b=WfjkkTrUAEYdjCVGCLBfFQ6ytDlNo33R6A3Uu4stfk94gj31VXuZWi3AlMiU/sX+eT/+
 iXBOhW+6Z/DM24XOUw5wFcO67GdEtbr/10RzU0v5bLHoRCH2DfPKMdCso48J5qF4dqAL
 tTLWp9Uh2h1iBjJOZRlcPg8ZzQ6FsnO9PvttTzhLTE389cQEgTfOYgBuaLh7YD0yMrEV
 i4wVjAC/tCTKPd4eu7V0mSSQXHqaWYCDHll4gG/yVU5SBRcaFqzRPkkDXxrV29PD9pTN
 j2NBib+iIpvFUf1XTUakEcLEZSzVwKXK2nXxvDJM6jXBZJEyf0erGn03fwltUxMqBhGj Xg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sgv96grry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 10:21:14 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37GAAqX8003918;
	Wed, 16 Aug 2023 10:21:14 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sgv96grrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 10:21:14 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37G7tKhf001073;
	Wed, 16 Aug 2023 10:21:13 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3semsybu46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 10:21:13 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37GALB7m13238934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Aug 2023 10:21:11 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A20520043;
	Wed, 16 Aug 2023 10:21:11 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC7A920040;
	Wed, 16 Aug 2023 10:21:10 +0000 (GMT)
Received: from [9.155.200.166] (unknown [9.155.200.166])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Aug 2023 10:21:10 +0000 (GMT)
Message-ID: <500264e15aa52df6350474407533722451b03667.camel@linux.ibm.com>
Subject: Re: [PATCH 5/9] tests/tcg: clean-up gdb confirm/pagination settings
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
        Wainer dos Santos Moschetta
 <wainersm@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Akihiko
 Odaki <akihiko.odaki@daynix.com>,
        Thomas Huth <thuth@redhat.com>, David
 Hildenbrand <david@redhat.com>,
        Yonggang Luo <luoyonggang@gmail.com>, qemu-arm@nongnu.org,
        Daniel Henrique Barboza <danielhb413@gmail.com>,
        David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
        =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
        Richard Henderson
 <richard.henderson@linaro.org>,
        qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
        Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
        Nicholas
 Piggin <npiggin@gmail.com>
Date: Wed, 16 Aug 2023 12:20:55 +0200
In-Reply-To: <20230815145126.3444183-6-alex.bennee@linaro.org>
References: <20230815145126.3444183-1-alex.bennee@linaro.org>
	 <20230815145126.3444183-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gXdsJjk_pGp47ClM3elmEkTFF1VRImsQ
X-Proofpoint-ORIG-GUID: FQRAqIT9N_0wfRphBCdyYLBfyJBE5SC9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_08,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308160090
X-TUID: o2HustSjcYqM

T24gVHVlLCAyMDIzLTA4LTE1IGF0IDE1OjUxICswMTAwLCBBbGV4IEJlbm7DqWUgd3JvdGU6Cj4g
V2UgY2FuIGRvIHRoaXMgYWxsIGluIHRoZSBydW4tdGVzdC5weSBzY3JpcHQgc28gcmVtb3ZlIHRo
ZSBleHRyYW5lb3VzCj4gYml0cyBmcm9tIHRoZSBpbmRpdmlkdWFsIHRlc3RzIHdoaWNoIGdvdCBj
b3BpZWQgZnJvbSB0aGUgb3JpZ2luYWwKPiBub24tQ0kgZ2RiIHRlc3RzLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KPiAtLS0KPiDCoHRl
c3RzL2d1ZXN0LWRlYnVnL3J1bi10ZXN0LnB5wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHwgMiArKwo+IMKgdGVzdHMvdGNnL2FhcmNoNjQvZ2Ric3R1Yi90
ZXN0LXN2ZS1pb2N0bC5wecKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMyAtLS0KPiDCoHRlc3RzL3Rj
Zy9hYXJjaDY0L2dkYnN0dWIvdGVzdC1zdmUucHnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDMgLS0tCj4gwqB0ZXN0cy90Y2cvbXVsdGlhcmNoL2dkYnN0dWIvbWVtb3J5LnB5wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzIC0tLQo+IMKgdGVzdHMvdGNnL211bHRp
YXJjaC9nZGJzdHViL3NoYTEucHnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCA0IC0tLS0KPiDCoHRlc3RzL3RjZy9tdWx0aWFyY2gvZ2Ric3R1Yi90ZXN0LXByb2MtbWFwcGlu
Z3MucHnCoMKgwqDCoCB8IDQgLS0tLQo+IMKgdGVzdHMvdGNnL211bHRpYXJjaC9nZGJzdHViL3Rl
c3QtcXhmZXItYXV4di1yZWFkLnB5wqDCoCB8IDQgLS0tLQo+IMKgdGVzdHMvdGNnL211bHRpYXJj
aC9nZGJzdHViL3Rlc3QtdGhyZWFkLWJyZWFrcG9pbnQucHkgfCA0IC0tLS0KPiDCoHRlc3RzL3Rj
Zy9zMzkweC9nZGJzdHViL3Rlc3Qtc2lnbmFscy1zMzkweC5wecKgwqDCoMKgwqDCoMKgwqAgfCA0
IC0tLS0KPiDCoHRlc3RzL3RjZy9zMzkweC9nZGJzdHViL3Rlc3Qtc3ZjLnB5wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNCAtLS0tCj4gwqAxMCBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQoKQWNrZWQtYnk6IElseWEgTGVvc2hrZXZp
Y2ggPGlpaUBsaW51eC5pYm0uY29tPgo=

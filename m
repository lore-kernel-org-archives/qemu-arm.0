Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp245667ejs;
        Wed, 16 Aug 2023 03:20:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9QpfaGrCcEfaJqEYd25AVKkr/zX3FfRXophaBNGKWXTOrZHa713nnyOSZACg5ROtCjcr3
X-Received: by 2002:a05:6902:504:b0:d14:b4bc:d574 with SMTP id x4-20020a056902050400b00d14b4bcd574mr2050867ybs.34.1692181221222;
        Wed, 16 Aug 2023 03:20:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692181221; cv=none;
        d=google.com; s=arc-20160816;
        b=flctOrdTYtUUqfeblSA0KbW5VeAZ4ZSiF8tVCKMtJ095a2dk2DfOyoiE1Q8IEnhnsj
         VDMYOx6vJM6thcf3rBORocRKrKHgTCluyS3NBf48V4rUbqO0+/QOE5IkEpn3ozGeK7Aq
         wt9XNKQW8tAQR++36DNZOPqQeJm1POztWkMARbI34sEXhuN+RBS65UBWNkuW57kS+AH+
         GbnR9bcAOrbcd78Ijn/C6ay/xb7PvllP3/khkRzjKWfwt0pufir/2DMIONg8LbyVBHyd
         u4aRE6a2t/HXsrrwDE8s8sq5Btvhxv3IHzy+h9L5/XvnCxV4krTlxmyKt5hTKQwc6haE
         0DdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:dkim-signature;
        bh=9u900TCHbujvcFWLfqN5QGm8BAQg5s0UB5ycX/mLN88=;
        fh=DJ3cW1lhZUD6rdt+wp48oldBTaPOco977KIJI8tUevE=;
        b=FtTkCOUwnekk/uTPHRq1qdyruw7KJAUYEEpRai1ZY4unRk2knxf3KhytxxduSEuoxn
         ceDKNlwz9iCsdS9lRdOZGtgoLmJJk0kyt1vbTAEwdtZMZgKuGu/018FoqR9UmvJ2W+yi
         olVE15B5VZ34TQ1ryOXfdydYSXYfQ0LNdXfplJTlOR8h6QAAcfY5L9KrOp9q1Y8mAJXh
         4SHoSa97i7dQLQfCXzU/KM+GUYqxgtmxmTwQu0ds7c4yd0j1XAksDvWgoXeLWtgw4dn3
         krD5zAyOLJW+spmUTTOUVkmngUEA3V3yF5GUjUyFWKp0bmWvPu6O9EG77tvonkZBxPTA
         HX5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=kCHxSDQR;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id p191-20020a2542c8000000b00d66b71b402dsi9549166yba.471.2023.08.16.03.20.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Aug 2023 03:20:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=kCHxSDQR;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37GAAGUs010194;
	Wed, 16 Aug 2023 10:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=9u900TCHbujvcFWLfqN5QGm8BAQg5s0UB5ycX/mLN88=;
 b=kCHxSDQRcrFoxqP3in4ab13FZUA0E2W7rWTy55E8rHMbcBgq6cF5x/qiFlsw+cBEqeuy
 /nKiGYrxiYwvPqd0E0sUKsX1ymb1vW4WswKNW9uhFe+GRLb0weqWDS0ifgrktmLVblT3
 ZtEtjEPREzfdoPo43H0aFCjC15vM/rwPiV4/4kkyss3qeTC8jgqky5lnkATiHOoekMlt
 YMznEdIci5P1AH0Mq0PRZZw19OxcIHnf75FpJqTAqZ+tr1ILaUzHPpcx8OOGavEiKlN0
 +xLonj62ueCoMUOx+Kg/9YEjZhMlnMboIHaPHKS5diZeV1lglZd4PWaje/QTDT0E0xXG TA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sgv49s6cr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 10:20:06 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37GAB3cY016667;
	Wed, 16 Aug 2023 10:20:05 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sgv49s6c9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 10:20:05 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37G8sVlb002418;
	Wed, 16 Aug 2023 10:20:04 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sendnbgyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 10:20:04 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37GAK1nc43123036
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Aug 2023 10:20:02 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A55352004D;
	Wed, 16 Aug 2023 10:20:01 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F9362004B;
	Wed, 16 Aug 2023 10:20:01 +0000 (GMT)
Received: from [9.155.200.166] (unknown [9.155.200.166])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Aug 2023 10:20:01 +0000 (GMT)
Message-ID: <130aa9ee49dffd9ecc1006b17b9e82734837d7d9.camel@linux.ibm.com>
Subject: Re: [PATCH 4/9] tests: remove test-gdbstub.py
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
Date: Wed, 16 Aug 2023 12:20:01 +0200
In-Reply-To: <20230815145126.3444183-5-alex.bennee@linaro.org>
References: <20230815145126.3444183-1-alex.bennee@linaro.org>
	 <20230815145126.3444183-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FWSOOWtZ3zsaCxVSnJ9iK_iQImQnL2Hi
X-Proofpoint-GUID: y5vWNht9k8vlPQaD1DUiIywo0YhqueDm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_08,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=929 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308160090
X-TUID: oPRX0g+uYXcv

On Tue, 2023-08-15 at 15:51 +0100, Alex Benn=C3=A9e wrote:
> This isn't directly called by our CI and because it doesn't run via
> our run-test.py script does things slightly differently. Lets remove
> it as we have plenty of working in-tree tests now for various aspects
> of gdbstub.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
> =C2=A0tests/guest-debug/test-gdbstub.py | 177 ---------------------------=
-
> --
> =C2=A01 file changed, 177 deletions(-)
> =C2=A0delete mode 100644 tests/guest-debug/test-gdbstub.py

There doesn't seem to be a hbreak test elsewhere, but according to a
comment in tcg/multiarch/gdbstub/memory.py it would be mapped to a
normal break anyway.

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>

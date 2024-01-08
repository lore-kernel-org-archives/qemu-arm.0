Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp2246740ejo;
        Mon, 8 Jan 2024 04:27:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHU9HxbRIVbig83nNkMzz1wojPwWvVDq6ACX1UNnKWx75awLdL8zrA/xXkK3qUhXfvWrf0
X-Received: by 2002:a81:dd11:0:b0:5f0:8435:12dd with SMTP id e17-20020a81dd11000000b005f0843512ddmr1176873ywn.90.1704716846759;
        Mon, 08 Jan 2024 04:27:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704716846; cv=none;
        d=google.com; s=arc-20160816;
        b=Xj0/F8ZvlcuyAlpI6oocDNpqS+t53wNdnG5yeub7H6mimjovkQ3vj/eHH/qKAQhsu1
         13QeDfhrpg2BQKkIlTf2fqQ60++5UuYoOKHE5dnwSL3HNE3H7AznurtSlupAurjsXYgG
         l1xSx/c1cfU1j9CLtruXKh9myElxueMKynSVSZmIVXdMSMdLUplDcvrz8bugFZLx+xBt
         5vkJjHGUgbfua5jA7vfZ5BKRM39u1Gh/9YmTucwNO9bfBx8o1P7U3mKK7dPTcRuYPuO4
         tWbtHREKqTyz+0nvspHJUlYRa0Cec9TJGO960Hz8I1GPTAJFy64Dzyn2sqguIrvtGlNX
         IKyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:dkim-signature;
        bh=GWZ5VSSILwvZEYjs2ah+vKQhv71Sizq1i7905GYRhVg=;
        fh=2QcN1tI5b7naT/FLurtvL4iJwZzFASJKw3ErYn9FD2c=;
        b=TPjg9lwoTLHk3UmowuqQZcfa70IiOHabeUp21R2VbkKaAWnx7pRMqIKXY3rKD2tReq
         bSbRkEoL8KxjOT9VM51W9ins14WRz1D1il8QlMwESvvWbJQcFNmYUNyeDP7bp9Vif69A
         BXDKWmDI00g3LXtVxKRjiDFKjXBQZqDzJTXNtroZGGfkxXMWoF0BUmBiewv5j3Z/tZDt
         GqaPvMvT/l2wsbzPoy1i9hAK10CORE/isu3JkWrrTtKyMf2NlBDzW+0Mj3j9oXWLVIjh
         9yHdmHTdPrHJehTwZT2MyYInYKt8VgQferBLybLypQF8ip0QkuUL6vMqwrYo10CSzzep
         CQYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=eXwElvQ2;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id fl10-20020a05690c338a00b005efdba7a8cbsi3176797ywb.263.2024.01.08.04.27.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jan 2024 04:27:26 -0800 (PST)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=eXwElvQ2;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 408CJ7eF011242;
	Mon, 8 Jan 2024 12:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=GWZ5VSSILwvZEYjs2ah+vKQhv71Sizq1i7905GYRhVg=;
 b=eXwElvQ2AvLzT8soE9YIYlVKrCndglb1kIKoouuKU76bE7+DNgp0fD6YYJ+loqDS/6/Y
 s80tA2b98JpSCfA26XiYwgSWexblKVBHX4Xx6JD+HvFcQ8zo+/eX/ydma+hAPoYeVjOM
 PDOAhMQQIx3k3pc/y9cz7QSzYvZPGvp4vtq3Esbc3L9f9SgRjzrjU4ujze8fLW6zHqOK
 nl/EGDZMcHZGPMw4AG1bXzVX9+MpaJYc/R7GPhMytjP10aIZKnbJnR0VuRQ/YW5qsQ7A
 u7ykuStrbzvnGdeK+TFvh1A2g5aO+yyOKXQIvJXzmqkOZUTOy9vaRtVnHOeZGrv1AFeF Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vggxs857n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 12:26:47 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 408CMM9j023215;
	Mon, 8 Jan 2024 12:26:47 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vggxs856j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 12:26:46 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 408C5E66022845;
	Mon, 8 Jan 2024 12:26:44 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vfhjy7yjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 12:26:44 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 408CQgO538797722
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Jan 2024 12:26:42 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 951E420043;
	Mon,  8 Jan 2024 12:26:42 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B6D5D20040;
	Mon,  8 Jan 2024 12:26:41 +0000 (GMT)
Received: from [9.155.200.166] (unknown [9.155.200.166])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Jan 2024 12:26:41 +0000 (GMT)
Message-ID: <1e5fb129a184ce743365f3503bc3ba2e47676b5c.camel@linux.ibm.com>
Subject: Re: [PATCH v2 08/43] qtest: bump npcm7xx_pwn-test timeout to 5
 minutes
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
        Richard Henderson
 <richard.henderson@linaro.org>,
        Song Gao <gaosong@loongson.cn>,
        =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
        David
 Hildenbrand <david@redhat.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Yanan Wang
 <wangyanan55@huawei.com>,
        Bin Meng <bin.meng@windriver.com>,
        Laurent Vivier
 <lvivier@redhat.com>,
        Michael Rolnik <mrolnik@gmail.com>,
        Alexandre Iooss
 <erdnaxe@crans.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Laurent Vivier
 <laurent@vivier.eu>,
        Paolo Bonzini <pbonzini@redhat.com>, Brian Cain
 <bcain@quicinc.com>,
        Daniel Henrique Barboza <danielhb413@gmail.com>,
        Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
        Mahmoud
 Mandour <ma.mandourr@gmail.com>,
        Thomas Huth <thuth@redhat.com>,
        Liu
 Zhiwei <zhiwei_liu@linux.alibaba.com>,
        Cleber Rosa <crosa@redhat.com>, kvm@vger.kernel.org,
        Peter Maydell <peter.maydell@linaro.org>,
        Wainer dos
 Santos Moschetta <wainersm@redhat.com>,
        qemu-arm@nongnu.org, Weiwei Li
 <liwei1518@gmail.com>,
        Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@linaro.org>,
        John Snow <jsnow@redhat.com>,
        Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Palmer
 Dabbelt <palmer@dabbelt.com>,
        Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,
        =?ISO-8859-1?Q?C=E9dric?= Le Goater
 <clg@kaod.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Eduardo
 Habkost <eduardo@habkost.net>,
        Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
        Alistair Francis
 <alistair.francis@wdc.com>,
        "Daniel P." =?ISO-8859-1?Q?Berrang=E9?=
 <berrange@redhat.com>
Date: Mon, 08 Jan 2024 13:26:41 +0100
In-Reply-To: <20240103173349.398526-9-alex.bennee@linaro.org>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
	 <20240103173349.398526-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3n4703UJLu9UuNQtQwKGxRASFadYab6V
X-Proofpoint-ORIG-GUID: uFOpD788Yz5ZHIHSnHD0G_5gxHCVFtIt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-08_04,2024-01-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=922 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401080106
X-TUID: n1INFi5MmkpV

On Wed, 2024-01-03 at 17:33 +0000, Alex Benn=C3=A9e wrote:
> From: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>=20
> The npcm7xx_pwn-test takes 3 & 1/2 minutes in a --enable-debug build.
> Bumping to 5 minutes will give more headroom.
>=20
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-ID: <20230717182859.707658-5-berrange@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20231215070357.10888-5-thuth@redhat.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
> =C2=A0tests/qtest/meson.build | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 000ac54b7d6..84cec0a847d 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -1,7 +1,7 @@
> =C2=A0slow_qtests =3D {
> =C2=A0=C2=A0 'bios-tables-test' : 120,
> =C2=A0=C2=A0 'migration-test' : 480,
> -=C2=A0 'npcm7xx_pwm-test': 150,
> +=C2=A0 'npcm7xx_pwm-test': 300,
> =C2=A0=C2=A0 'qom-test' : 900,
> =C2=A0=C2=A0 'test-hmp' : 120,
> =C2=A0}

Nit: s/pwn/pwm/ in the commit subject and message.

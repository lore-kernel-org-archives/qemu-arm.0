Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1015062lfy;
        Tue, 28 Jul 2020 16:01:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcwg1KqKheE7HZ7/YbX7IZwtFAEMWY3abqtXSILc7gpVaojPaMZsd9k+deF76IdoeM672u
X-Received: by 2002:a5b:78c:: with SMTP id b12mr49103974ybq.8.1595977272121;
        Tue, 28 Jul 2020 16:01:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595977272; cv=none;
        d=google.com; s=arc-20160816;
        b=UjCP74E8hvx60BGoP+qmPwQ7e+OmPxT65VDcfjYZD8XikJfAzObj0y6l5W0xgkTDg8
         3B9yzUl9MWc25eCrF6Lk9dgcFZ9FIpFxsQws0P5wvXqCizsrRoRKZnz3rlA+prqOWOsE
         xkGQ/2+LE/BCY6m2SvTvFpV/hzSCRm1/nCTfzooe7VdL1SM5WgjBMXUW4rpRLtk28Vdv
         0LTBg4GfdrUBkqcP3zKowCCaByJtFSj2vLl2M1F28/pJ27rNyMdu/YMes2OUedn6ObPW
         hdjmCtkZIzgpd1174oIvh3uTmXSybwBd7ECFha4b8I1DDAXrwxQI7e3dswXKIEq5v4bH
         QjqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
         :subject:cc:to:from:user-agent:references;
        bh=QxUwvlXRo4KChU8vkn3+qh9hLt8FtjdiU24PeoobucI=;
        b=dJritipQXU2+9CsHF6dTFhqKA1Y207Aexyzft+kAaE2AJ/rvJvddZ+TRu/4IklPMWV
         OCBL+DhCUpsBvt792bCh7loGbsyssOSrAaw4dmV6O6xY+hKiiXtjnQrEyrNWQKCZiybt
         A1KDiY5tn9DFPS0WSKDqjmxtIdP3JQgbbDImIKLHlyDFmFAsASOqbDIRHc8Iw8LIK43S
         3CNIUJLaSOvLf6pS+1rJJyacvG1qyUDHn2s6gN/c9W+IZjWHOpT8LSAirZ9gApPglxBm
         1HV3psl6crtD4uvCSND97EM/oBdWjbPQJrjjfnSsCtVyvGKBmKeuwKd1FN+syk04xOc9
         g7fg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id o126si260826ybc.46.2020.07.28.16.01.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 16:01:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06SMVfoJ086740;
	Tue, 28 Jul 2020 19:00:39 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 32jpw3kb0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2020 19:00:39 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06SMa2Ku098741;
	Tue, 28 Jul 2020 19:00:38 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0b-001b2d01.pphosted.com with ESMTP id 32jpw3kaym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2020 19:00:38 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06SMu3uq010609;
	Tue, 28 Jul 2020 23:00:37 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma01wdc.us.ibm.com with ESMTP id 32gcycn5q1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2020 23:00:37 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 06SN0aNP55378176
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jul 2020 23:00:36 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8DAF7112063;
	Tue, 28 Jul 2020 23:00:36 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F1F2112061;
	Tue, 28 Jul 2020 23:00:30 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.54.39])
	by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
	Tue, 28 Jul 2020 23:00:29 +0000 (GMT)
References: <20200723025657.644724-1-bauerman@linux.ibm.com> <20200723025657.644724-2-bauerman@linux.ibm.com> <20200723030609.GL5513@umbus.fritz.box> <20200727143656.277500f0@bahia.lan>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Greg Kurz <groug@kaod.org>
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
        qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
        "Paolo
 Bonzini" <pbonzini@redhat.com>,
        Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Peter Maydell
 <peter.maydell@linaro.org>,
        Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>,
        Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
        "David
 Hildenbrand" <david@redhat.com>,
        Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v3 1/8] target/arm: Move start-powered-off property to generic CPUState
In-reply-to: <20200727143656.277500f0@bahia.lan>
Date: Tue, 28 Jul 2020 20:00:21 -0300
Message-ID: <87d04futx6.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-28_17:2020-07-28,2020-07-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007280156
X-TUID: X+StAwv09slw


Greg Kurz <groug@kaod.org> writes:

> On Thu, 23 Jul 2020 13:06:09 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>
>> On Wed, Jul 22, 2020 at 11:56:50PM -0300, Thiago Jung Bauermann wrote:
>> > There are other platforms which also have CPUs that start powered off,=
 so
>> > generalize the start-powered-off property so that it can be used by th=
em.
>> >=20
>> > Note that ARMv7MState also has a property of the same name but this pa=
tch
>> > doesn't change it because that class isn't a subclass of CPUState so it
>> > wouldn't be a trivial change.
>> >=20
>> > This change should not cause any change in behavior.
>> >=20
>> > Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
>> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> > Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>>=20
>> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
>>=20
>
> Reviewed-by: Greg Kurz <groug@kaod.org>

Thanks!

--=20
Thiago Jung Bauermann
IBM Linux Technology Center

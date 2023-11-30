Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp85897ejb;
        Thu, 30 Nov 2023 01:15:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERowCfyF+HfjWfvwowDAlAifNmDKWZUUFWOnHfNuq7KC8Fkp//6hoLHzarry4Pa0c4anMU
X-Received: by 2002:a5e:c111:0:b0:7b3:6e29:c32f with SMTP id v17-20020a5ec111000000b007b36e29c32fmr18185052iol.18.1701335734236;
        Thu, 30 Nov 2023 01:15:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701335734; cv=none;
        d=google.com; s=arc-20160816;
        b=pmZN/aHIGMpKuPiyq61kHCw+oGKD0EdpP6By7+y+n2AAMXR6j5mS8ozvqQW2Vzu48V
         nEL+i4kdniDa5tywId+fHbfuiSl0P8D5z91BMWdb8KpoRCg5DmxcBbJ58ySq3/pWQUO8
         juZJ2pRDQVvxtGBWtXLNcMxPYFlD/BBNPydP2On/PVjCzc/TG9GfRMqmKafEItfAUXeP
         97aIBefPR/TMTssy249fG/00KN+X7XMW7Rbd41dsnSioUzAi+Bsv7u9ui0QP6qvL6/KY
         hUU4VLAV5kO6zBIJs/MT6j43quz5ksFZlmSRhtcSNfqI5kiG9OkkwgbRVNFj+qE80Vbz
         F4OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:dkim-signature;
        bh=U7xhAiXyHYuSi9gQG6NV4CZH7LkdmdMB32D1ZOqvl2E=;
        fh=ZU6DfU29xeuOc7RZGcw8SL/6sVo72owshW2QysJLysc=;
        b=fG4/P4aK3h+efIbf4n/oks8V1fVBJfZUH7eeSTqvSJggnydTuuwJshyWhHN1dlLTz2
         dqRgFyNkE1HNjbheL7BzWU8vAGA6qNJTIZ+YMTzozU2mdv1JUFDugHwL3o3C6DMr/jeZ
         oKUvhqxkL83wEv9r6l5boiVEZvPoFovK/AcIGl9wFX78sidBu5Mm+Du3Ye7LD84aV+hH
         RCedjNhF7mGdg2QRIWLJ3m1p9i4K4PP8ztmsq/qCsrjxPyADkAyu100kVJRz9NZYYgWY
         PliX8otmZXieyNWJjx7PlrW5jXW//zZDrO0fzRtbooccaW6hCy1Zt8TJ1hhr8SQcsvnS
         RTFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=AFBdvLer;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id dj16-20020a0566384b9000b004664b9040c2si311628jab.144.2023.11.30.01.15.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 01:15:34 -0800 (PST)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=AFBdvLer;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AU9CGNH028745;
	Thu, 30 Nov 2023 09:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=U7xhAiXyHYuSi9gQG6NV4CZH7LkdmdMB32D1ZOqvl2E=;
 b=AFBdvLera18ekFkEDQHSP2T6dJxy+bj5KW/jP/YQxVyqxiHZtRJXrFC+0ntnZuEvmXMl
 m5dICRXNSmZBGnKsumVVgBAXL4u0dvBZSGFJjow9KpyWozqGgg5e9lV0A3P1DYtJVgrk
 fcIAkenPAVxLZnA9inVImJFIRFFp84wVlNbQYq2PnUAD94eddwhNGmE1WEaq+o2oyHt9
 lgMLNpBO+kPcZI3+78p/T21qN3TQ/nrMIklnS6Mpmi8dOIQR1PJPM8F2VFLdmlnmfYt2
 bNGyD4yvrGuvjfFw260kty5gkpovVQqcuoFvY7pDIz7evPqH74AstesKRFOdN22SZxO6 0g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3upqj4g6aa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 09:14:59 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AU9CSaJ029884;
	Thu, 30 Nov 2023 09:14:58 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3upqj4g684-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 09:14:58 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AU7Xw9A030737;
	Thu, 30 Nov 2023 09:14:55 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uku8tddeu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 09:14:55 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AU9EqIJ6750948
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Nov 2023 09:14:52 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F14720043;
	Thu, 30 Nov 2023 09:14:52 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2CB6D20040;
	Thu, 30 Nov 2023 09:14:48 +0000 (GMT)
Received: from [9.171.32.92] (unknown [9.171.32.92])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Nov 2023 09:14:48 +0000 (GMT)
Message-ID: <c3ac8d9c2b9d611e84672436ce1a96aedcaacf5e.camel@linux.ibm.com>
Subject: Re: [PATCH 2/6] qemu/main-loop: rename QEMU_IOTHREAD_LOCK_GUARD to
 QEMU_BQL_LOCK_GUARD
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
        Fabiano Rosas
 <farosas@suse.de>, qemu-s390x@nongnu.org,
        Song Gao <gaosong@loongson.cn>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Thomas Huth
 <thuth@redhat.com>, Hyman Huang <yong.huang@smartx.com>,
        Marcelo Tosatti
 <mtosatti@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Andrey
 Smirnov <andrew.smirnov@gmail.com>,
        Peter Maydell
 <peter.maydell@linaro.org>,
        Kevin Wolf <kwolf@redhat.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Alistair Francis
 <alistair.francis@wdc.com>,
        Paul Durrant <paul@xen.org>, Jagannathan Raman
 <jag.raman@oracle.com>,
        Juan Quintela <quintela@redhat.com>,
        "Daniel P."
 =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>,
        qemu-arm@nongnu.org, Jason Wang <jasowang@redhat.com>,
        Gerd Hoffmann <kraxel@redhat.com>, Hanna
 Reitz <hreitz@redhat.com>,
        =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau
 <marcandre.lureau@redhat.com>,
        BALATON Zoltan <balaton@eik.bme.hu>,
        Daniel
 Henrique Barboza <danielhb413@gmail.com>,
        Elena Ufimtseva
 <elena.ufimtseva@oracle.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Hailiang Zhang <zhanghailiang@xfusion.com>,
        Roman Bolshakov
 <rbolshakov@ddn.com>,
        Huacai Chen <chenhuacai@kernel.org>, Fam Zheng
 <fam@euphon.net>,
        Eric Blake <eblake@redhat.com>, Jiri Slaby
 <jslaby@suse.cz>,
        Alexander Graf <agraf@csgraf.de>,
        Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,
        Weiwei Li <liwei1518@gmail.com>, Eric
 Farman <farman@linux.ibm.com>,
        Stafford Horne <shorne@gmail.com>,
        David
 Hildenbrand <david@redhat.com>,
        Markus Armbruster <armbru@redhat.com>,
        Reinoud Zandijk <reinoud@netbsd.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Cameron Esfahani <dirty@apple.com>, xen-devel@lists.xenproject.org,
        Pavel
 Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-riscv@nongnu.org,
        Aleksandar
 Rikalo <aleksandar.rikalo@syrmia.com>,
        John Snow <jsnow@redhat.com>,
        Sunil
 Muthuswamy <sunilmut@microsoft.com>,
        Michael Roth <michael.roth@amd.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        "Michael S. Tsirkin"
 <mst@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Bin
 Meng <bin.meng@windriver.com>,
        Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
        qemu-block@nongnu.org, Halil Pasic
 <pasic@linux.ibm.com>,
        Peter Xu <peterx@redhat.com>,
        Anthony Perard
 <anthony.perard@citrix.com>,
        Harsh Prateek Bora <harshpb@linux.ibm.com>,
        Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        Eduardo Habkost
 <eduardo@habkost.net>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
        =?ISO-8859-1?Q?C=E9dric?=
 Le Goater <clg@kaod.org>,
        qemu-ppc@nongnu.org,
        Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
        Christian Borntraeger
 <borntraeger@linux.ibm.com>,
        Akihiko Odaki <akihiko.odaki@daynix.com>,
        Leonardo Bras <leobras@redhat.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Thu, 30 Nov 2023 10:14:47 +0100
In-Reply-To: <20231129212625.1051502-3-stefanha@redhat.com>
References: <20231129212625.1051502-1-stefanha@redhat.com>
	 <20231129212625.1051502-3-stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: k5g-bglZZ81amYqAueJeLCJOKEKz4uGW
X-Proofpoint-GUID: hyHEB3c1P1gBAyQsdYHk4l82Bt-Qzmtx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_07,2023-11-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1011 impostorscore=0
 phishscore=0 mlxlogscore=810 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311300068
X-TUID: wTluOKuVtLYA

On Wed, 2023-11-29 at 16:26 -0500, Stefan Hajnoczi wrote:
> The name "iothread" is overloaded. Use the term Big QEMU Lock (BQL)
> instead, it is already widely used and unambiguous.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> =C2=A0include/qemu/main-loop.h=C2=A0 | 20 ++++++++++----------
> =C2=A0hw/i386/kvm/xen_evtchn.c=C2=A0 | 14 +++++++-------
> =C2=A0hw/i386/kvm/xen_gnttab.c=C2=A0 |=C2=A0 2 +-
> =C2=A0hw/mips/mips_int.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
> =C2=A0hw/ppc/ppc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0target/i386/kvm/xen-emu.c |=C2=A0 2 +-
> =C2=A0target/ppc/excp_helper.c=C2=A0 |=C2=A0 2 +-
> =C2=A0target/ppc/helper_regs.c=C2=A0 |=C2=A0 2 +-
> =C2=A0target/riscv/cpu_helper.c |=C2=A0 4 ++--
> =C2=A09 files changed, 25 insertions(+), 25 deletions(-)
>=20
> diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
> index d6f75e57bd..0b6a3e4824 100644
> --- a/include/qemu/main-loop.h
> +++ b/include/qemu/main-loop.h
> @@ -344,13 +344,13 @@ void qemu_bql_lock_impl(const char *file, int
> line);
> =C2=A0void qemu_bql_unlock(void);
> =C2=A0
> =C2=A0/**
> - * QEMU_IOTHREAD_LOCK_GUARD
> + * QEMU_BQL_LOCK_GUARD
> =C2=A0 *
> - * Wrap a block of code in a conditional
> qemu_mutex_{lock,unlock}_iothread.
> + * Wrap a block of code in a conditional qemu_bql_{lock,unlock}.
> =C2=A0 */
> -typedef struct IOThreadLockAuto IOThreadLockAuto;
> +typedef struct BQLLockAuto BQLLockAuto;
> =C2=A0
> -static inline IOThreadLockAuto *qemu_iothread_auto_lock(const char
> *file,
> +static inline BQLLockAuto *qemu_bql_auto_lock(const char *file,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int line)

The padding is not correct anymore.

Other than this:

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>

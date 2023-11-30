Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp551203ejb;
        Thu, 30 Nov 2023 13:49:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKymWxKKVUTcZFbVl9mDy34gYbRSBd1kAAS4IGVT7M8ceRfV1lVbT36VYPCLAjm/eXwHi5
X-Received: by 2002:a6b:f914:0:b0:7b3:de34:95e2 with SMTP id j20-20020a6bf914000000b007b3de3495e2mr9217863iog.17.1701380961765;
        Thu, 30 Nov 2023 13:49:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701380961; cv=none;
        d=google.com; s=arc-20160816;
        b=rUSxr3MkP1xMjDjRWfEa5azeS0RcfqFcoZDsSG0k/EHb2X3/MD1N2tVwdfm8LPeCPF
         wAL9ojLFTMMhTZVioKJDG6iDUe4pT7vJK1AdehtZBmG62K35SzZhLcD+zds81XfIecTU
         QCsnnhpr8m7LT8PG8qQXzEgj26df0mgVwjA9n9BBR9nY+0cvyraxbJEdcqG3h6LHC7ZR
         xVSB22WX4X4+sy/oRmFLXsMWntK0fKF+QVONNBBQ9ZZRoOK4SpwLLfUwLXPG0eg54HXn
         gHvYzMzCjP2SEjMr9Gzs6ZWR+8NMSZu7DFjomtqins5TpObzmnmojwV2VNJ31p6XtQAV
         dsZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:dkim-signature;
        bh=3Lkv/02q48e2jWfrLkO6fctRZOAuJaxGyH4fdQWyo74=;
        fh=fKPYdzZB8bxyWBqPtRMak1unANaffwjp3yab7CdHg/U=;
        b=x07hkxoHDY9KMaB9wf8jbWrThQKaBhugjgr7WN27/Jb/T1j6tUJdUkx96HGddAg7B4
         LpypZyfiS7euisLQn1tyjGNzoTB5tkhsXMpgLO+ylBdIiEWUJ4nZ6JK6doVup85/DiDB
         Yt0yxbOEPWuCFgySWHARkkGEe5C5zfHb4eFS1d229SQdE6cHIJ0Ax0YaSyQ+1xiTHHL3
         pIgCeLWV10SIFFjJ1i5Zhq0si7BPs2pfw74PcpGOxbam0eykKyFKBOWm2g5eKXj5kj65
         EGBaETSMTEZkDqRSnihZL2M1BmDF18VA9OjyM8FpbjA3w8IJQR8LusutFh1VO7FWarpK
         0XQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=Z8j3SiJo;
       spf=pass (google.com: domain of farman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=farman@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <farman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id y12-20020a05663824cc00b004667a2d69desi1016934jat.34.2023.11.30.13.49.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 13:49:21 -0800 (PST)
Received-SPF: pass (google.com: domain of farman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=Z8j3SiJo;
       spf=pass (google.com: domain of farman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=farman@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AULeDZS027517;
	Thu, 30 Nov 2023 21:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=3Lkv/02q48e2jWfrLkO6fctRZOAuJaxGyH4fdQWyo74=;
 b=Z8j3SiJoFgCBPPyg5iDaUlsJsboZQYhHZhQ/LoTMST1r78wFU8m1R06sJ5BSv8lRVYRb
 zdzOM64m3u1M54Dt2eJDNnuNfvUHViaxPTuf1S8xZXZap7aL83BZ5TM2XEL3MuFSKQC5
 VD9ArDJVODobePvT62TaDdnHvZn0bIHtYeKF6DIwlezQf+qFTJ6VkL9dOQru1TqlEDOi
 Ia5rg6qPY/IBdVBfvOY1MEiWurDCD5G9wJkxyQ7XD12QqfiRmQeLCs1JcAfacuAlVlso
 eJNxsB8Obgz7MsFBJxjno31QAspoKCWlAtg/0r6dBBNXFkfiX6qx8MLNl4KtoeFnPTN3 yg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uq28arjre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 21:48:52 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AULglYD002887;
	Thu, 30 Nov 2023 21:48:52 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uq28arjr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 21:48:52 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AUJhQMe029858;
	Thu, 30 Nov 2023 21:48:50 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ukvrm0y2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 21:48:50 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AULmngv13828844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Nov 2023 21:48:49 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F13CE58052;
	Thu, 30 Nov 2023 21:48:48 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F86658050;
	Thu, 30 Nov 2023 21:48:41 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown [9.61.95.112])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Nov 2023 21:48:41 +0000 (GMT)
Message-ID: <05f53a0e5d65287fa9fdf03ca67e5cf186b8d858.camel@linux.ibm.com>
Subject: Re: [PATCH 1/6] system/cpus: rename qemu_mutex_lock_iothread() to
 qemu_bql_lock()
From: Eric Farman <farman@linux.ibm.com>
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
        Kevin Wolf <kwolf@redhat.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Max Filippov
 <jcmvbkbc@gmail.com>,
        Alistair Francis <alistair.francis@wdc.com>,
        Paul
 Durrant <paul@xen.org>, Jagannathan Raman <jag.raman@oracle.com>,
        Juan
 Quintela <quintela@redhat.com>,
        "Daniel P." =?ISO-8859-1?Q?Berrang=E9?=
 <berrange@redhat.com>,
        qemu-arm@nongnu.org, Jason Wang
 <jasowang@redhat.com>,
        Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>,
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
        Weiwei Li <liwei1518@gmail.com>, Stafford
 Horne <shorne@gmail.com>,
        David Hildenbrand <david@redhat.com>,
        Markus
 Armbruster <armbru@redhat.com>,
        Reinoud Zandijk <reinoud@netbsd.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Cameron Esfahani <dirty@apple.com>, xen-devel@lists.xenproject.org,
        Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-riscv@nongnu.org,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        John Snow <jsnow@redhat.com>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Michael Roth <michael.roth@amd.com>,
        David Gibson
 <david@gibson.dropbear.id.au>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Bin Meng
 <bin.meng@windriver.com>,
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
Date: Thu, 30 Nov 2023 16:48:41 -0500
In-Reply-To: <20231129212625.1051502-2-stefanha@redhat.com>
References: <20231129212625.1051502-1-stefanha@redhat.com>
	 <20231129212625.1051502-2-stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 425_reiecxV4wDHgNFADyvMsZGA6fbvk
X-Proofpoint-ORIG-GUID: L2MIErO798SVE0kwCrDtReSEksriyd8b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_22,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 phishscore=0 clxscore=1011 impostorscore=0 mlxlogscore=827 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311300160
X-TUID: FCuE90omHUjI

On Wed, 2023-11-29 at 16:26 -0500, Stefan Hajnoczi wrote:
> The Big QEMU Lock (BQL) has many names and they are confusing. The
> actual QemuMutex variable is called qemu_global_mutex but it's
> commonly
> referred to as the BQL in discussions and some code comments. The
> locking APIs, however, are called qemu_mutex_lock_iothread() and
> qemu_mutex_unlock_iothread().
>=20
> The "iothread" name is historic and comes from when the main thread
> was
> split into into KVM vcpu threads and the "iothread" (now called the
> main
> loop thread). I have contributed to the confusion myself by
> introducing
> a separate --object iothread, a separate concept unrelated to the
> BQL.
>=20
> The "iothread" name is no longer appropriate for the BQL. Rename the
> locking APIs to:
> - void qemu_bql_lock(void)
> - void qemu_bql_unlock(void)
> - bool qemu_bql_locked(void)
>=20
> There are more APIs with "iothread" in their names. Subsequent
> patches
> will rename them. There are also comments and documentation that will
> be
> updated in later patches.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Acked-by: Eric Farman <farman@linux.ibm.com>

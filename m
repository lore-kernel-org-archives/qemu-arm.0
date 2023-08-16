Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp371150ejs;
        Wed, 16 Aug 2023 06:52:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqmvYAmCtz0BLPQ4/eEYTHSypcbK8z/bbZz6v94lExokzp4REEZ8PVy8yss9f15jG9QwV7
X-Received: by 2002:a05:6a20:ce9c:b0:131:5f8b:9c7d with SMTP id if28-20020a056a20ce9c00b001315f8b9c7dmr1608722pzb.22.1692193968689;
        Wed, 16 Aug 2023 06:52:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692193968; cv=none;
        d=google.com; s=arc-20160816;
        b=MKRIt5Qti0koE08Nu9AE2+BgTa2udpXcYYj0LXEBCMgkA3NJrZc+fjbR6MLbAzp5yI
         h0d9tqA172OcQBhjPyN2FECfma2+zinKtGVOhjNFJh5ATXaZAJrsj5braHyNr1UeI3vP
         BRWSTXHEhX3rMRa/FTmQPx1DFqBeZCwoE+hua6hddJgJ358YSLy3WmGSFNPzaNQHoiSk
         fOz1PVMWjOUI8pvmoKRC+ODGXEVasSHbjvrshHBjzyC3thQch1fuoQjumq0uCmDwIRXT
         +fOo2UVX00LV3wIYWdPilK+fgmM1lIiLOVp/htI9n7Sil2/clYkMW4icy7MDV7+JwD5w
         lkIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:dkim-signature;
        bh=xRRU3RFSZsbdvilORURzGUYmelh6TkAb5D63J+up9Hc=;
        fh=DJ3cW1lhZUD6rdt+wp48oldBTaPOco977KIJI8tUevE=;
        b=pO5R0Pkh8XKwm0G31qP/3MXT3N+iX9zumCbx/IEV8aWG9IRqdsRO8Vs34WfNFFJ66k
         SCoER+5HPN3T4yiurZyqFVetw3llvRPlxZWZP4ADOqHRhyKdQrEXJvFtiq/zq4MaFnsq
         b9ETlh8fXS0jH3g9j8zqyqv325iZcWd3U3ctBrIQyUzI5YQbyykr+c97EWsIp22qogt8
         rpntRztdSxfP0JNZP8YaCSVRm3jbKQKXFG5+fIt5hd9JVu/0pYsogdxip4SmSvk29tGu
         nRmUSZcxFnnOkL36Rhba4jWP7l6N7a9cGl+aBTas9Ue0cV9/nTeb8qRMpj60/3SPj0/t
         2Wjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=lUYlyyF2;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id r81-20020a632b54000000b0056572b7e0dcsi9392063pgr.664.2023.08.16.06.52.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Aug 2023 06:52:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=lUYlyyF2;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37GDgCdA032398;
	Wed, 16 Aug 2023 13:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=xRRU3RFSZsbdvilORURzGUYmelh6TkAb5D63J+up9Hc=;
 b=lUYlyyF2HCmOmi2D8bk3928bKcx5hKFDYWD1emlWCx/rz/eIlUeq5DcXjgaBKtOo7bZj
 MX+klAZr0Oq2KRXc0gXqnZ9dpEpd6r4tFDi4FRMAWCUEX8nTo3+8lytfYS8GISFj1nu8
 PLM17gmjhri4gypkNz85vLOmKb2vWshBshV7G8a//OgV5Cst39YAg1SF7KBuV7M2vNWa
 X/tmyitrSU/fpbZe314oTEDeeXY0SbZ8HpLLk0TCaYe29/7q+xngwOAcUHIX+ys6YZMD
 4i/4ZmkkeIss0Duf9GQmHArypqsLGP4jV9AKEKbDfqs0Vnu2m4I86j7Qt3mS6b63Y8th nA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sgyjrg9u6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 13:52:27 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37GDhiSh005124;
	Wed, 16 Aug 2023 13:52:27 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sgyjrg9tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 13:52:27 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37GBgctF002421;
	Wed, 16 Aug 2023 13:52:18 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sendncmk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 13:52:18 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37GDqGnK12583654
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Aug 2023 13:52:16 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 24A5520074;
	Wed, 16 Aug 2023 13:52:16 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C5142004B;
	Wed, 16 Aug 2023 13:52:15 +0000 (GMT)
Received: from [9.155.200.166] (unknown [9.155.200.166])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Aug 2023 13:52:15 +0000 (GMT)
Message-ID: <16b706dc49021acca0b3f490eb23b379b4e999d7.camel@linux.ibm.com>
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
Date: Wed, 16 Aug 2023 15:52:15 +0200
In-Reply-To: <87zg2rnoyv.fsf@linaro.org>
References: <20230815145126.3444183-1-alex.bennee@linaro.org>
	 <20230815145126.3444183-5-alex.bennee@linaro.org>
	 <130aa9ee49dffd9ecc1006b17b9e82734837d7d9.camel@linux.ibm.com>
	 <87zg2rnoyv.fsf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yftG0zrRJWNDMVrXyGzINXIVVFVh82O2
X-Proofpoint-ORIG-GUID: xuVwqsxBOWEj0EvLViU1shn3ZqW6yxKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_13,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=906 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308160116
X-TUID: iWqGGqGWOCgM

On Wed, 2023-08-16 at 13:33 +0100, Alex Benn=C3=A9e wrote:
>=20
> Ilya Leoshkevich <iii@linux.ibm.com> writes:
>=20
> > On Tue, 2023-08-15 at 15:51 +0100, Alex Benn=C3=A9e wrote:
> > > This isn't directly called by our CI and because it doesn't run
> > > via
> > > our run-test.py script does things slightly differently. Lets
> > > remove
> > > it as we have plenty of working in-tree tests now for various
> > > aspects
> > > of gdbstub.
> > >=20
> > > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > > ---
> > > =C2=A0tests/guest-debug/test-gdbstub.py | 177 -----------------------=
-
> > > ----
> > > --
> > > =C2=A01 file changed, 177 deletions(-)
> > > =C2=A0delete mode 100644 tests/guest-debug/test-gdbstub.py
> >=20
> > There doesn't seem to be a hbreak test elsewhere, but according to
> > a
> > comment in tcg/multiarch/gdbstub/memory.py it would be mapped to a
> > normal break anyway.
>=20
> It is for TCG but for other accelerators there will be different
> handling (although I'm fairly sure only x86 and aarch64 are currently
> plumbed to use the CPUs hbreak bits on KVM).
>=20
> However this particular script was a very early addition when I was
> testing stuff manually with images I'd built on my system. If we want
> to
> exercise the gdbstub for accelerators it might be better porting the
> test to avocado?

That would be good, yes.

I was always wondering if the TCG sotfmmu tests could be used to test
the other accelerators? At least for s390x there is nothing
TCG-specific there (besides that they try to trigger TCG-specific
problems), and I sometimes run them manually with KVM as a sanity
check.

>=20
> >=20
> > Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
>=20
>=20

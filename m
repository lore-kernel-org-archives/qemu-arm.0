Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1194871ejb;
        Fri, 16 Feb 2024 04:36:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkKUw7qFhiK2dJRwowKN9o5A5F9DgibQgw5Sk1vlXtTy4YT/PMlENBYVFlr0pg6qcxqpUs
X-Received: by 2002:a81:4886:0:b0:602:ccb6:5da6 with SMTP id v128-20020a814886000000b00602ccb65da6mr4339489ywa.35.1708086971632;
        Fri, 16 Feb 2024 04:36:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708086971; cv=none;
        d=google.com; s=arc-20160816;
        b=lTVlTNdhxpDWz2/WYbzSdRlCuV6Yew5PH2LjgzlqD9tR1XcEhonnwe5m6lFzYyO7Yn
         DKjmJmFsW7tgcIpdEzaglEiGo9HxywRTH35j8r0bx1phhAhpcC8lHiWQo72pChGAkvg7
         UK9I4ra7rrAf8pBsSJbL98d9wAzd5iURqqToHuwZHl8tg/bfr+iMNOCr/R/4zKrMEXz5
         xxBzXaS41nEQi/ilGYNjGjK5pzY8wuruRqCakRZK044zfcGaDU0DbraUnm1pHguNgb11
         qtAOpelRHLzj65i1yBLwSfUTac4KFpuQ1TQgjojruNKMqoeQ2BX8mfF1P2J3BdF9Semi
         aEAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:dkim-signature;
        bh=cnToKUixDXBsx8pdHKHq+fKg5kdlvPefxVeDI6EEP/0=;
        fh=5lADdclxAefq9h/dRaBSs2QLuzefhCqVTRXXxC4dQDs=;
        b=TXo9cXzG+1o5oqbzxskfpjuT5XcnYsbvprM97zPxrf6bnq/YObWB9J0clxc7nGVEUF
         oR08fQD0e4Bvmrkzs1abiKGr3qbE8v5q5hJ8kW4o++tnHkGYVUDpKxmG8gIxAqlaqJ33
         PQOgHp9DMV0gDFpI4N/dum8IQ/1bM2D/3Sng8X+CA3D6HEGFVpL7+qmqSoSz7tr0Jawm
         3ttWTTPcJI67uTu9xFUCmtRhPeZDKDJisg0bSxeulGSN32QJi7kbsL1HW9xwB/7zMPMY
         9fq5kGv70WwB+axcA2T9z6zG/kJR5roCCtMPcwf8AXjelTfnQpbclMkz54tZAq6QKL/f
         n7hQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=bmCeEGEJ;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id o16-20020a81de50000000b006079744dabdsi643563ywl.575.2024.02.16.04.36.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Feb 2024 04:36:11 -0800 (PST)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=bmCeEGEJ;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41GBa2Ns022388;
	Fri, 16 Feb 2024 12:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=cnToKUixDXBsx8pdHKHq+fKg5kdlvPefxVeDI6EEP/0=;
 b=bmCeEGEJPafkfEIG1XBTkf3Ju/mmiVNUnyJdvY5os9C6xz0jMS+Y6U0J2+7PrQ+WJ+3j
 kre6aYXmB0PkRlqnYC+loNeBlFHhZAQxgyFGsb5VCjYbIguoM35nitgjkGcvRYJJlNki
 ZGOEIH3ULeW6wSBKek/Mbk+YBB6SY631t2Esfp1HBcDfFmIpd1DLdvcfa0DCFqofYrA5
 5VZsjN0Qq6lOAVj0tAJw526t8mVQHpAgr3x7B3JS4cy9p/jyFWOzpV73qMO41w9SWmpd
 lZ5riY1VyoaEHHF9VZb8zJmf+2/Zx3Urxt85etjcFVdm/2DZEhs4NxiGZAFMfFaoDm7s /A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wa5f7twcw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 12:36:10 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41GCaAFu029473;
	Fri, 16 Feb 2024 12:36:10 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wa5f7twch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 12:36:10 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41GB0xAj010045;
	Fri, 16 Feb 2024 12:36:09 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6npmauw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 12:36:09 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41GCa6Hm61538582
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Feb 2024 12:36:08 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 03DBE2004B;
	Fri, 16 Feb 2024 12:36:06 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CAF6820040;
	Fri, 16 Feb 2024 12:36:05 +0000 (GMT)
Received: from [9.155.200.166] (unknown [9.155.200.166])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Feb 2024 12:36:05 +0000 (GMT)
Message-ID: <a403dda185d7830f048aed8740bcf6c7ffeb3ac0.camel@linux.ibm.com>
Subject: Re: [PATCH v5 0/3] linux-user: Allow gdbstub to ignore page
 protection
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
        Peter Maydell
 <peter.maydell@linaro.org>,
        David Hildenbrand <david@redhat.com>,
        Paolo
 Bonzini <pbonzini@redhat.com>,
        Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Date: Fri, 16 Feb 2024 13:36:05 +0100
In-Reply-To: <87h6i84os9.fsf@draig.linaro.org>
References: <20240131114817.288027-1-iii@linux.ibm.com>
	 <87h6i84os9.fsf@draig.linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6Y4vNd83BWWKkH25fCyedmRDg8GMLhdr
X-Proofpoint-GUID: fknAwRMq22oLu4VUdL5ni3_-mSaKFhuZ
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_09,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 adultscore=0
 mlxscore=0 clxscore=1011 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402160101
X-TUID: 4uLzn9WARfkD

On Fri, 2024-02-16 at 11:44 +0000, Alex Benn=C3=A9e wrote:
> Ilya Leoshkevich <iii@linux.ibm.com> writes:
>=20
> > v4:
> > https://lists.gnu.org/archive/html/qemu-devel/2024-01/msg05857.html
> > v4 -> v5: Fix the probe_proc_self_mem vs probe_proc_self_mem()
> > typo.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Add Alex's R-b a=
nd A-b.
>=20
> I was going to pull this and realised it already went in via
> Richard's
> tcg-next. Did this fix get merged?
>=20

Hi, yes, I submitted it separately and it was merged as:

commit da4038d2da6d3a3d5f86665bd51b2ba49df5d652
Author: Ilya Leoshkevich <iii@linux.ibm.com>
Date:   Wed Jan 31 23:02:18 2024 +0100

    tests/tcg: Fix the /proc/self/mem probing in the PROT_NONE gdbstub
test


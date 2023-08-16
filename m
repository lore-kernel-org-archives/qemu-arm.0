Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp308477ejs;
        Wed, 16 Aug 2023 05:15:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQD0cdEPjF31N7y6UqwjaWQIKe2mvxlsJB06QL9qZ2MUwy6v+K/X1ONaAS6a8P6LsblIAD
X-Received: by 2002:a25:e091:0:b0:d71:696a:25f2 with SMTP id x139-20020a25e091000000b00d71696a25f2mr1806382ybg.28.1692188107976;
        Wed, 16 Aug 2023 05:15:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692188107; cv=none;
        d=google.com; s=arc-20160816;
        b=cI/L4VvZlRLfTNqhX/RrN6k+fKaWClYOPDpwyBXwFfj7nnnIZSNu627jlD1I5YPGPq
         wtTd4lzlcE0j3yNxS6fy7JS6QpRGCLPBp4WyviGLG7EeuTbbmWXdYNxOBigKby8nispw
         fiv/6WJRr2KiUliExAiGPPNguFBnDv7OlbrpIvwJ+wAq4iHQg7NxHDB2Th1ovwcCtNDI
         v2siWTtGMck6tNN4pUep2ZA02oRFKomFaSVENnkdDblJI9x2GHE9FCHSGTOBIPHr0w7Y
         jS/YwzL6iKijznnS2elMNcQ7B5J4vOOSTvThUMtwPxpEuWFPyMvQ5uQWc4+VG7O6esda
         Spsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:dkim-signature;
        bh=fkcoUQO65x6p8ntqiks4DWdDPSArzB/Mrz2hQCYPFos=;
        fh=DJ3cW1lhZUD6rdt+wp48oldBTaPOco977KIJI8tUevE=;
        b=MnIAH9HMz8/YG13ZESVA17HaOc9AWczivZ7x1sbfLhgNn3XWg8S2hf8v4EcFP3A81e
         Xb6yX+4fB7CvuGkrSau0Sw8i6aXYkCf1r+eoo5J53xtDDNsIU5/Klpx1yD0mM5Z6WQV/
         ykLRoRC5hy6ijHYQvu0Bm7BwHWSfu9KB+lnQgj3kiHdnyZVH6XCa6Vf/oesVDTO67ZZ9
         hEdl50GeAS4mIp1iqdcQlBf3BoXKFdeoloVibEX2vWvu4hm1fIUNDrMSSLmipJak9KO2
         gNGrJVNKboMdDiYl1qi5lWcDrdKrbEmVH+eszLPXIqUgIVeVRo47xppU1lxS14pKSphG
         pwFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=k+ZIlFUP;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id n194-20020a25dacb000000b00d7254bfa848si339304ybf.85.2023.08.16.05.15.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Aug 2023 05:15:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=k+ZIlFUP;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37GCCJUM021627;
	Wed, 16 Aug 2023 12:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=fkcoUQO65x6p8ntqiks4DWdDPSArzB/Mrz2hQCYPFos=;
 b=k+ZIlFUPL1mawNKExdn4S0FPQM6K7+MEexwWXrBn/9+VXjWQjl0h+PaiaFDNDdo5yr0H
 31Gmm+cYut7zpQugK3Vs5BhyCqI3AjJYoAtvuno3hDRwPc3GjuIzUWch5Udv0WwgN6Fn
 YmhUmcaYfOsQ0h/uHe59N8uh26bPo2fdLxdWqFaq9NpQWAbUt5K1mZ3L20kCJySffAJq
 /QilrL2f6vJx/QwTz2wokk97xHx6NtMgDJChZI9RCBvQHBtv2e/rGsFs5MTl8TATWDW7
 NR090Nd4rao8xNfOcrTtNI/b6NAYwXj3RnK0EFZIAR3+ylDe7oP10GxSqmmthHAlg/lz MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sgx1dgca3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 12:14:54 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37GCDVNn027079;
	Wed, 16 Aug 2023 12:14:54 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sgx1dgc9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 12:14:54 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37GAgE3Z013234;
	Wed, 16 Aug 2023 12:14:52 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sepmjukbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 12:14:52 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37GCEolq27263584
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Aug 2023 12:14:50 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3ABCB20040;
	Wed, 16 Aug 2023 12:14:50 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD72320043;
	Wed, 16 Aug 2023 12:14:49 +0000 (GMT)
Received: from [9.155.200.166] (unknown [9.155.200.166])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Aug 2023 12:14:49 +0000 (GMT)
Message-ID: <f4819a35a00829516ba6bee70701bb8f2f4f965a.camel@linux.ibm.com>
Subject: Re: [PATCH 7/9] gdbstub: remove unused user_ctx field
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
Date: Wed, 16 Aug 2023 14:14:49 +0200
In-Reply-To: <20230815145126.3444183-8-alex.bennee@linaro.org>
References: <20230815145126.3444183-1-alex.bennee@linaro.org>
	 <20230815145126.3444183-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Hx5v_GGu1mogj0fQ-8zvnvAKyplehSej
X-Proofpoint-GUID: uSxrTQp8i7dePoeXXTTOtl-Fo1FZZNDd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_10,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 mlxscore=0 adultscore=0
 mlxlogscore=749 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308160105
X-TUID: 8s6y6cHSirzD

On Tue, 2023-08-15 at 15:51 +0100, Alex Benn=C3=A9e wrote:
> This was always NULL so drop it.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
> =C2=A0gdbstub/gdbstub.c | 16 ++++++++--------
> =C2=A01 file changed, 8 insertions(+), 8 deletions(-)

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>

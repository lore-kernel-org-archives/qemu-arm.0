Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3704294ejb;
        Tue, 6 Jun 2023 12:29:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5II+rn2YkPslZl2V40aRVk6/hRR58NFlHzdOY9vjQ76OxS3hNe9Q5dOCefrwjXkvtoQdfZ
X-Received: by 2002:a81:4e55:0:b0:568:8e96:7008 with SMTP id c82-20020a814e55000000b005688e967008mr3447748ywb.0.1686079753700;
        Tue, 06 Jun 2023 12:29:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686079753; cv=none;
        d=google.com; s=arc-20160816;
        b=Qvr0c8p6dEjrx+vdMewp7wfviweYDHllb5Gnofj9Pc0Yt35nlduKXwlq7xWxaYPRwN
         a+w2y96qE85QWSzdWpF1M+6RllxC7HQaj6KN/A+UkqGIX/nIoxBwUbkzHoYUY8ERlBvE
         ye8l4wxIkrYlUt2sgH+xDNQz6q5Q+GlUvqqnKHaN3Fq5Mk8GFJviH+fM/VUjDmNoMgTU
         JvI3ZlaHr9pQjytxbfOurU2xH2KRND+cFnHIERbRbh8e1IXEWYz/JWVF6lYXKv6LhQIK
         Wu1mN7Olo1AW5BWkKVc1jxo2+CubYklDgP8E2+DkcFaS3DZrwse2t4Wvu0vngAE/Yzml
         5Qtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:dkim-signature;
        bh=n78VaPQMM4BWAcNTYBayvcjW5p5AXnzFDxlYIAeRgIM=;
        b=UpD0S+1yjfovFL8ruZeMZXYvtFhxJSjxcPake11mpY/J9lDn1h86IOpRK8n+c1uENU
         Td0jAAXitVQCMQoJ154c6VuotsRqf1g+HQwiUgvRzN9CRPWb8I4RG9kcKuYbGye9a+Lw
         IcpC+8qFYD2yY5mrzfaQ+uNl4Tgi5KshrOZQcIqRcO5gNTKfAJsEk7JBhwIG9ngRAJvC
         wWeaHfHVJp7Rj809Hg9onTcvxWF+wZv5KhVchYIZ7YDxhWVvZyeH9N1U5K8AOun3bKnc
         LVDgfDFdTBOr8Ngc/VIbFF8coOlGc/ROzehMPDFyDe8arpwN54TjoITHbI+95AN+C2EP
         brVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=fmt6DQ4U;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <iii@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id d10-20020a814f0a000000b00565bb3831a5si9348127ywb.412.2023.06.06.12.29.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Jun 2023 12:29:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=fmt6DQ4U;
       spf=pass (google.com: domain of iii@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=iii@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 356JN1se023941;
	Tue, 6 Jun 2023 19:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=n78VaPQMM4BWAcNTYBayvcjW5p5AXnzFDxlYIAeRgIM=;
 b=fmt6DQ4U9H2aD727ghjtUZkzwinBII4Q51EMjiCQr0zmxq6aiwWqIX9thhMSANCUGpFG
 koHB8kLwzVmWTglFw/RTQig/DP85bRYF7SngRDHQvmU5deIWtwCE+bpGKgy7rQWuZrIw
 tZZwSXYYeXBPj1sZwwdVBNSToHC3ILozwuXN3YOsIVavHmZmzdeW/b4HrlrHVnZIYDyE
 IHRExZV1wJlW2WKpEwclX+wBLwWCfFqJ4i4rxmW4HJzZDuo9pYeANSe3KdoS68vRPdJb
 BX3biJNfy1lIj0NU7nrNhlM0ja1Q000tu124ejSMZ0xtvK3GpY2fukcJaQ3lu935u5HM +A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r2awmr40j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 19:29:13 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 356JNjCm027051;
	Tue, 6 Jun 2023 19:29:12 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r2awmr3yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 19:29:12 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 356IZD8K014735;
	Tue, 6 Jun 2023 19:29:10 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3r2a77g1qx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 19:29:10 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 356JT8mP44892530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jun 2023 19:29:08 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2378420043;
	Tue,  6 Jun 2023 19:29:08 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C31A20040;
	Tue,  6 Jun 2023 19:29:07 +0000 (GMT)
Received: from [9.171.41.107] (unknown [9.171.41.107])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Jun 2023 19:29:07 +0000 (GMT)
Message-ID: <3c3df53d22f6f122cd389a9ed748c1655f8d77a6.camel@linux.ibm.com>
Subject: Re: [PATCH v3 2/8] linux-user: Add "safe" parameter to
 do_guest_openat()
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
        Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        Laurent Vivier
 <laurent@vivier.eu>,
        Peter Maydell <peter.maydell@linaro.org>,
        David
 Hildenbrand <david@redhat.com>
Cc: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Date: Tue, 06 Jun 2023 21:29:07 +0200
In-Reply-To: <ad49111a-5dd9-671b-f18f-009a7eae73b0@linaro.org>
References: <20230606132743.1386003-1-iii@linux.ibm.com>
	 <20230606132743.1386003-3-iii@linux.ibm.com>
	 <ad49111a-5dd9-671b-f18f-009a7eae73b0@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BCib8dL1E-XC1SvputxouHPyBhQ_jmjm
X-Proofpoint-ORIG-GUID: _dUF8T9s6hA8na34JGvTTX2v5gFWywa7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_14,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 spamscore=0 mlxscore=0 adultscore=0 mlxlogscore=696 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306060163
X-TUID: Yo/5QwG1eiEW

On Tue, 2023-06-06 at 11:24 -0700, Richard Henderson wrote:
> On 6/6/23 06:27, Ilya Leoshkevich wrote:
> > @@ -8518,7 +8522,11 @@ int do_guest_openat(CPUArchState *cpu_env,
> > int dirfd, const char *pathname,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return fd;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0=20
> > -=C2=A0=C2=A0=C2=A0 return safe_openat(dirfd, path(pathname), flags, mo=
de);
> > +=C2=A0=C2=A0=C2=A0 if (safe) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return safe_openat(dirfd, p=
ath(pathname), flags, mode);
> > +=C2=A0=C2=A0=C2=A0 } else {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return openat(dirfd, path(p=
athname), flags, mode);
> > +=C2=A0=C2=A0=C2=A0 }
> > =C2=A0 }
>=20
> I'm not keen on this, as it seems like the wrong abstraction.=C2=A0 But I
> can't immediately=20
> think of how it could be better structured.

I also thought about temporarily clearing signal_pending in gdbstub,
but could not convince myself that this were safe.

> The only concrete objection I have is the change of API, which could
> be fixed with return=20
> get_errno(openat(...)).

I believe both openat() and safe_openat() return -1 on error and set
errno, or am I missing something?

>=20
> With that,
>=20
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>=20
>=20
> r~

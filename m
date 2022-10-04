Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp69994ocb;
        Tue, 4 Oct 2022 03:25:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM42qnoWnq8r3uv67jZ/No/OAKwmReim62GMpEtG4KWtxrnrJ1TqMp3wC1VhoJ0fl11Ap7tW
X-Received: by 2002:a17:902:e414:b0:17f:5c82:ac01 with SMTP id m20-20020a170902e41400b0017f5c82ac01mr9133471ple.123.1664879142984;
        Tue, 04 Oct 2022 03:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664879142; cv=none;
        d=google.com; s=arc-20160816;
        b=YBPb6bHgAm92cv6bWG3JfDeYfyVhzBU0s33uY0/BZ5mxDj32TXrt0vd/bbus+cjbvL
         FU9Y/iQ42ZDoTZg5gDc2C9UyJHgOdNKsSd3sjAV/qfM10a4Fv2XcEq+yQ2VbZJ8GeEn/
         zjDXRe9ukItKDcSJYs0ErjoSZusXKEiAD/jNcbGE0FSmN8d3s7ndW0DFQ3opF2h/pRZ/
         WuxINAxMoJ45D5Y0XWFfHkdmvQaQo0X6MNDeDCWrmRErlwfK7sCUnNwnTW8mYzENz9Sr
         +SUNvnCf/sW7mPB0WeQvVBA/vu6P7oKd9j2iRr5wzS7bsvQ8jtOmAyw0c6lQSX0FMk9X
         SrOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=Mc9SKPjS+zJA0G5WEib9D/fYuCld+4eFmEHniPH1AIc=;
        b=bJjq5cVEd4wWJzLHlbHkwjEKquqFvC/aMAUBtXAwBx60c98kgM9AXN0QZkF089Znsq
         MYZtDSsjyqOEVdUi5d0LfX2Aisx28gpsfTC5gNsv/LVops5GVRkNuLHdQrPeft1Ol3xi
         kcOsEeTsaabTY+uQbrn6JTv+PVGvEk2R+V9N62lo02YDiwX6Aw2/lVrrjm+x3HLgB1Zq
         aKSSAXlZ0ryceEzQcskcWtknkFxLfvUINoiwkf/ksLLPDcBtq1fjC1oFYDEjLqOYvflm
         nrhcuX2Qm3zFrhC2lFttscevMe8cQXqvn2psrRZ1I1PToMo7sS1Y++CouHw0OXYAZQHI
         5PQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b="ADuW/2dG";
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.58.6.55 as permitted sender) smtp.mailfrom=mads@ynddal.dk
Return-Path: <mads@ynddal.dk>
Received: from pv50p00im-ztdg10021901.me.com (pv50p00im-ztdg10021901.me.com. [17.58.6.55])
        by mx.google.com with ESMTPS id ng11-20020a17090b1a8b00b001fbbcd6f8eesi2734704pjb.73.2022.10.04.03.25.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 03:25:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of mads@ynddal.dk designates 17.58.6.55 as permitted sender) client-ip=17.58.6.55;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b="ADuW/2dG";
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.58.6.55 as permitted sender) smtp.mailfrom=mads@ynddal.dk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
	t=1664879142; bh=Mc9SKPjS+zJA0G5WEib9D/fYuCld+4eFmEHniPH1AIc=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
	b=ADuW/2dGCtIsUlhClvTTUFmcV1GMxbkD5WXLkgLQcWEvjb8DbBC+u/wmFz9FiXQ58
	 vB+F1+UUKi5/po8ZNHmc4h0HnnFaBayqlEJU7rP27rCqLpFn9i6ZvBFjZngtCk/fjb
	 0Hql0MGitqD/pRQwYnPO6LOk1EKlESkGhILmMIuCbCsQMFZ358mti8nmVJZzFGUo6R
	 rSQtumJO0eFcudhes71BbAkQQSV9KzxOL8tEY4JSUqgL0JiWnYFP4V8MqzCSVw4QfH
	 ke4T8ZECnUVnVQpjiSjL7v+ftxb5K/DCzIK3IVTPpICG4dx8Knp6ie5rfzXwmwRjhZ
	 FNn27SXSv2iWw==
Received: from smtpclient.apple (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10021901.me.com (Postfix) with ESMTPSA id CD9EF8197B;
	Tue,  4 Oct 2022 10:25:39 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH  v3 14/15] gdbstub: move guest debug support check to ops
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20220927141504.3886314-15-alex.bennee@linaro.org>
Date: Tue, 4 Oct 2022 12:25:33 +0200
Cc: qemu-devel@nongnu.org,
 "open list:ARM cores" <qemu-arm@nongnu.org>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2F256D6E-40B8-49F8-99E7-70B60127E7D6@ynddal.dk>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-15-alex.bennee@linaro.org>
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Proofpoint-GUID: QDvbfUURPPEqV9J9o6cbN-_cddP3bhUS
X-Proofpoint-ORIG-GUID: QDvbfUURPPEqV9J9o6cbN-_cddP3bhUS
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.11.64.514.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2022-02-23?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=959 adultscore=0 mlxscore=0 suspectscore=0 clxscore=1030
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210040067
X-TUID: XzNyH6hvHfIz


> This removes the final hard coding of kvm_enabled() in gdbstub and
> moves the check to an AccelOps.
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Mads Ynddal <mads@ynddal.dk>
> ---
> accel/kvm/kvm-cpus.h       | 1 +
> gdbstub/internals.h        | 1 +
> include/sysemu/accel-ops.h | 1 +
> include/sysemu/kvm.h       | 7 -------
> accel/kvm/kvm-accel-ops.c  | 1 +
> accel/kvm/kvm-all.c        | 6 ++++++
> accel/tcg/tcg-accel-ops.c  | 6 ++++++
> gdbstub/gdbstub.c          | 5 ++---
> gdbstub/softmmu.c          | 9 +++++++++
> gdbstub/user.c             | 6 ++++++
> 10 files changed, 33 insertions(+), 10 deletions(-)

Reviewed-by: Mads Ynddal <mads@ynddal.dk>=

Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp69977ocb;
        Tue, 4 Oct 2022 03:25:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM531aJyDmAyHPQ4DeHi62XUeFSgSS/X5KvFzfXXp0xvSO71K1NgDNAQ/kOvlitkFQHkl6It
X-Received: by 2002:a05:6402:4150:b0:44a:ec16:def4 with SMTP id x16-20020a056402415000b0044aec16def4mr23060394eda.21.1664879140751;
        Tue, 04 Oct 2022 03:25:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664879140; cv=none;
        d=google.com; s=arc-20160816;
        b=G+V50esc0wfZ6QIIJJUBNEiYck8Y8NJDrizmiQWByeAD4/XKZ2n3qdUHXAosWJ+JXx
         y5fsKGYObQxFhdAKpF+92axhpFqtKWLzX+VtEIwg+e8Vyy1Vl5TJUAMTuOYmMEjZ7ej0
         zvkFmSArtATHJKtV0dXrDwQNhxrPy2Sx2HHikngu77e1gBvmEyDg0PxhzuXxCrpwOYH8
         9k9kqVuE1UZ++QBwzR5s8y2NgQ7K3NVpf29UK6D4itg/uOdaHXdA0gGTMo5OfFPlV0gh
         UPIA2HiswLVa9cFuaxyss2d16gFz8otGAwQc7Fdzzr9gz9b27iJqMdZepdFT5E3r6Y2f
         2Odw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=+B7IsfEP9clHsLTHWL2KWswD6d2kq73Gw6oQ20/UQNk=;
        b=j2xyX57DxwCfJ76tnjcGkO1FPDQGEmvIJQRd9ai7IG5LTahfqAF5ESWg8D2OTd3wOB
         CdbFIurHK7fGb8P1MN/0+gueFd8XfK0KHqsQv5A9vwjCPvs6S8fNkkP6f+HwIiEsrrJM
         l5lR9FrBpEbcoA5TbclmCpsnoT7vTBGZ2I7vKNIwT6RkbfsprYtkssb7DQT2omXWoRdw
         mqMGTT0T3AK3Dh3Rm05ERx4kLYQ1cTMwNMkAA0MAu9alWvvwoqfQalVbEbPPP8Zysjym
         qGXxBJTSXaZWuRGst3YoHRJH89CTbxB0z3+3mPBbRVfXkq4XQ0DeLLL+/TFoe1ZsPRFJ
         CZtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=AWuaI8lK;
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.58.6.55 as permitted sender) smtp.mailfrom=mads@ynddal.dk
Return-Path: <mads@ynddal.dk>
Received: from pv50p00im-ztdg10021901.me.com (pv50p00im-ztdg10021901.me.com. [17.58.6.55])
        by mx.google.com with ESMTPS id t5-20020a05640203c500b00458e16f28b5si5710297edw.366.2022.10.04.03.25.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 03:25:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of mads@ynddal.dk designates 17.58.6.55 as permitted sender) client-ip=17.58.6.55;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=AWuaI8lK;
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.58.6.55 as permitted sender) smtp.mailfrom=mads@ynddal.dk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
	t=1664879139; bh=+B7IsfEP9clHsLTHWL2KWswD6d2kq73Gw6oQ20/UQNk=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
	b=AWuaI8lKNKUTbhPnHbaT5AEqO7XSQjiNxJ9j6IJcYT/I4HKyNvNhoLzeYzPeUeM0c
	 ABaD/Py3DrStVCa9Jij39wnjnQkSkGgDcjpKXQxKXBGCTpx3yWFUmqJTAlT2WkJ/WQ
	 sQOZAo3xKzMxpmCnO9c2+Gn47/qKzo0QcIbYFop68vx8s6dOeaJoy9iptFHtHOJXui
	 tFvhmNrDlEY9qp/r+xehMwZueD5rdAKovi7YaxoX2l8HVrRvVmxJ/HySZjFgYWrai7
	 gx3b3iFdXXRNZBIT/SdV7AmBeD41o3EPtomX+xwGoQZntnQ8QqgbMcNv5RT61lYMZm
	 cdmMUA0BOd2lQ==
Received: from smtpclient.apple (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10021901.me.com (Postfix) with ESMTPSA id E175D81BDD;
	Tue,  4 Oct 2022 10:25:36 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH  v3 03/15] target/arm: ensure HVF traps set appropriate
 MemTxAttrs
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20220927141504.3886314-4-alex.bennee@linaro.org>
Date: Tue, 4 Oct 2022 12:25:31 +0200
Cc: qemu-devel@nongnu.org,
 qemu-arm@nongnu.org,
 Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B685DFF5-137E-4CA0-B360-CF9D340FDC1A@ynddal.dk>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-4-alex.bennee@linaro.org>
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Proofpoint-GUID: FzCPH9dG4XbLN-ypDyy6djJ4KuHeTzJy
X-Proofpoint-ORIG-GUID: FzCPH9dG4XbLN-ypDyy6djJ4KuHeTzJy
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.11.64.514.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2022-02-23?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=635 adultscore=0 mlxscore=0 suspectscore=0 clxscore=1030
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210040067
X-TUID: vj5FHjGOwkJP


> As most HVF devices are done purely in software we need to make sure
> we properly encode the source CPU in MemTxAttrs. This will allow the
> device emulations to use those attributes rather than relying on
> current_cpu (although current_cpu will still be correct in this case).
>=20
> Acked-by: Alexander Graf <agraf@csgraf.de>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Mads Ynddal <mads@ynddal.dk>
>=20
> ---
> v2
>  - update MEMTXATTRS macro
> ---
> target/arm/hvf/hvf.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Mads Ynddal <mads@ynddal.dk>=

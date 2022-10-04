Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp69950ocb;
        Tue, 4 Oct 2022 03:25:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5HT4gyKQVm2DLuSU8atcORU2Np4LQ4l7KHzNkAJ4kF7ae6RXpjNi60oOrxyaoryV8j8Wd9
X-Received: by 2002:a17:90b:1c09:b0:20a:d962:5beb with SMTP id oc9-20020a17090b1c0900b0020ad9625bebmr2163006pjb.81.1664879137139;
        Tue, 04 Oct 2022 03:25:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664879137; cv=none;
        d=google.com; s=arc-20160816;
        b=z6ci4Zx9w4+j9KscldeenraFS/D4hU0wgIYARmCjOnp4UF5Ch/vaDA3D0dCYpwPDXn
         uMAP86VnQ6UTDBIZ60kE7ibP6yDWu7B8yJ/7r2CxjBr5kaBF5Qt41WmxlBkrk/uzjLET
         ZDBzt2unRdqEgbUptpCx7Zs10vCDJjUY8msl6L748UZeNQDs3RfWIb8hh3maJo1bcQJ8
         PnZdDbXbECJyazwkc8hOgpzWXvci0qlTPtgHSOKhHGer8EiYYMPlG4i2zcO13mVcgF8/
         OOkIkY5fXwvYMSflzoNJHZvWJkUYK5xfiUecYCvR5KT0uTswDiR10GUn2NWkIOe6De5g
         zWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=irS+IMj7fxUkA3LyldGd+V+KREAfBoo4MYjatluiGoY=;
        b=rlnh1BH+8RXQEgaLisasQmB1GW+gs4uh1wHilDJngMeMRP4Wmeo7YzD6fHaOmGeBVR
         Lcy6QTJLyMyxYW76USvlI2HTcirLnc5CU0Rxk/w1W0c/m2f9G5lwWJDK8vPbTLcJ9d4d
         MRen6WECSPN/saixD2eOKe8sXMCD8SOs3AK9vHzrJP6scTaQVZcR4egAQ+M5w6uLRh+3
         Zu30E8r7zReV+pwZ4AOu13BWgbka9RmG5/qhjtWuQ1DwiNUl9LebJPbOblrTBtlCrFBP
         C0Bl059cH8Tg/0rKmcY9hKwxct/W8F89h4cpBgQJwDGfGHsZ1roo4r9A4XEpRZ/DngYu
         rTGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=YHCKcP+i;
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.58.6.55 as permitted sender) smtp.mailfrom=mads@ynddal.dk
Return-Path: <mads@ynddal.dk>
Received: from pv50p00im-ztdg10021901.me.com (pv50p00im-ztdg10021901.me.com. [17.58.6.55])
        by mx.google.com with ESMTPS id co9-20020a17090afe8900b0020ae0c31812si226303pjb.38.2022.10.04.03.25.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 03:25:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of mads@ynddal.dk designates 17.58.6.55 as permitted sender) client-ip=17.58.6.55;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=YHCKcP+i;
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.58.6.55 as permitted sender) smtp.mailfrom=mads@ynddal.dk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
	t=1664879136; bh=irS+IMj7fxUkA3LyldGd+V+KREAfBoo4MYjatluiGoY=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
	b=YHCKcP+ivmDMcpuNWxQx4sV5UV/DOUt1MHzIXu/Wa8t3EALQUmVgG/YvFTBHorxaH
	 0Ugl2BqMAQKVolV4mnnceuCTrlYGv022i99U92J9kEwpP9gJkQKjzi/IqdHdX/gh3z
	 pwRZlu1DgwA++4bp1mBPkqB0BfQw8+r/UrQwP3ycpD1cJ/yGF9Hgv1wHWeBLUpyhZ7
	 qWDo7HHiF85H7jm6fg3nweu+mxgIoLL0Kt0LGkeWg1iG8efSodgat/Tw2wGpJsWW6n
	 alyowHJFmbKwyX68FAUwJPxAN4dptdFxrCITa+o9gVw1v2s9tTmEdsNX9wdTTwRDsX
	 gzW/xDlKg86wA==
Received: from smtpclient.apple (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10021901.me.com (Postfix) with ESMTPSA id 28A5081A09;
	Tue,  4 Oct 2022 10:25:32 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH  v3 12/15] gdbstub: move sstep flags probing into
 AccelClass
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20220927141504.3886314-13-alex.bennee@linaro.org>
Date: Tue, 4 Oct 2022 12:25:30 +0200
Cc: qemu-devel@nongnu.org,
 "open list:ARM cores" <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <84FB206A-5BFF-403F-84B9-2AC9F353096B@ynddal.dk>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-13-alex.bennee@linaro.org>
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Proofpoint-GUID: JimXms5MbrMWolMGRiZc5txqLU-VC4hy
X-Proofpoint-ORIG-GUID: JimXms5MbrMWolMGRiZc5txqLU-VC4hy
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.11.64.514.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2022-02-23?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=818 adultscore=0 mlxscore=0 suspectscore=0 clxscore=1030
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210040067
X-TUID: GRvd4LKUb9HK


> The support of single-stepping is very much dependent on support from
> the accelerator we are using. To avoid special casing in gdbstub move
> the probing out to an AccelClass function so future accelerators can
> put their code there.
>=20
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Mads Ynddal <mads@ynddal.dk>
> ---
> include/qemu/accel.h | 12 ++++++++++++
> include/sysemu/kvm.h |  8 --------
> accel/accel-common.c | 10 ++++++++++
> accel/kvm/kvm-all.c  | 14 +++++++++++++-
> accel/tcg/tcg-all.c  | 17 +++++++++++++++++
> gdbstub/gdbstub.c    | 22 ++++------------------
> 6 files changed, 56 insertions(+), 27 deletions(-)

Reviewed-by: Mads Ynddal <mads@ynddal.dk>=

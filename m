Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp137156ejx;
        Wed, 9 Nov 2022 02:12:51 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7oB43aMirrVxf0MADk9lWBOkmp4jB8TXpNZxj8+up00Rw5FNCx+XDJRMuZ0rezfU4ke26O
X-Received: by 2002:a17:90a:d70a:b0:213:8550:730e with SMTP id y10-20020a17090ad70a00b002138550730emr63202848pju.24.1667988771643;
        Wed, 09 Nov 2022 02:12:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667988771; cv=none;
        d=google.com; s=arc-20160816;
        b=TRkT1lVauNtxrr1FVMMIrq5ifjTpfand7ei3I2BFYdQlaAtP21EsU0hykgEZpsOcyc
         4nY64+FW5tDWsYHz88OOFF9Q1S5oCc9Mckeo+Kg4TVSes6u7EQIlJCuBvH5qbUpAOz4Y
         dwUAyRc3E4ZM1cEH8GtE+bb/SgWiellQ22lrzPiq5DZzl+P5ArryfROb1fCxq3j66cZI
         euEKSqr1tg8jaXmTyD5+PUGGuauXlmtZ9JHQ2HahlszU04WRgF52cFwpOZ7ILqwNAJ4v
         0pZ+TrpDn29oRWzoe0YZgo/hj3bSYrHmETMvQ0bnxcNQVdWkxelQ9als1N35rrFSVs8Q
         INiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=BFNhYGg9PQArRQyA69WUp2ISuGC+rzVLCTn1PuAYVks=;
        b=zi/eRuHRo/E4sZJmU3UA90VCTvRu4sBlWkdDD8ku5V7ogMoUJy6c4QM+IGLVpK6XVG
         ahM9dMEU2Q8aSGxPYbTHvF2znw7xmx+h169a0G/1aK+P+pPoN9KYQg1rXSvJsBmEMMIe
         WFdeXuctUwN4wZ9jTqM5HkmXQe9EaUHGhAXiUreZ5pz6haSrxNUNC6zlehOE1L5bRiML
         0imdrIvO6WBjr/HTnwCTd4s/6p0fYT+1XnnXjyNjGlhy7TxKhDkEKtDqPrtiPiqz9nWg
         bTwIE0cT3yBYfuruO02GJFYhtwCzRyrZ6DkPAOW5ZLcHddbz9oBWXoRlwy0EWh0oRkCy
         UStw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=cYncNX1Y;
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.58.23.186 as permitted sender) smtp.mailfrom=mads@ynddal.dk
Return-Path: <mads@ynddal.dk>
Received: from mr85p00im-zteg06011601.me.com (mr85p00im-zteg06011601.me.com. [17.58.23.186])
        by mx.google.com with ESMTPS id g22-20020a056a000b9600b0056caa27df70si18333337pfj.87.2022.11.09.02.12.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 02:12:51 -0800 (PST)
Received-SPF: pass (google.com: domain of mads@ynddal.dk designates 17.58.23.186 as permitted sender) client-ip=17.58.23.186;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=cYncNX1Y;
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.58.23.186 as permitted sender) smtp.mailfrom=mads@ynddal.dk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
	t=1667988770; bh=BFNhYGg9PQArRQyA69WUp2ISuGC+rzVLCTn1PuAYVks=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
	b=cYncNX1YQ5bHDBZO+re4DwbNUGuueTNOUHxLwNf5fgfYC4A8Sw9Scof8IakSI6MjW
	 T6FuCLjvvq7nZB83AcX1bWkT2khVR6KWtA3GSZYDofjTUygfKazfuBTej2Fn9CoKcy
	 F5RiCa5O0KQODIHpK+bwHdbQ1VuoT8uqn9ur7hCdhS6v3ZHt7/yUWYP6c0+YCpxrVt
	 A09asNHawe2u5d3JlZ2wMWcC0Ka4t1AsFCzIGh4hSA+oe6nUp+cjRUH1KFV1QvMupS
	 4zzFkrFmE9zblrOStmBm9p9ui83wPYETvXpfXo+U6+2FhTML8r1Jt7FvcWkdo7aazz
	 VXxyRVjG+MiGQ==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
	by mr85p00im-zteg06011601.me.com (Postfix) with ESMTPSA id 8AD1C180CA0;
	Wed,  9 Nov 2022 10:12:48 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH 2/3] hvf: implement guest debugging on Apple Silicon hosts
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <D86C8F4E-517E-4ECC-A66D-E57F551FFECF@ynddal.dk>
Date: Wed, 9 Nov 2022 11:12:36 +0100
Cc: qemu-devel@nongnu.org,
 dirty@apple.com,
 r.bolshakov@yadro.com,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM cores" <qemu-arm@nongnu.org>,
 Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Francesco Cagnin <fcagnin@quarkslab.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EF30A57C-C82F-41C0-A8B2-047DFF696A7C@ynddal.dk>
References: <20221104184101.6923-1-fcagnin@quarkslab.com>
 <20221104184101.6923-3-fcagnin@quarkslab.com>
 <2B918171-9464-40DC-AE11-D25E60858370@ynddal.dk>
 <CAF8_6KmwMCiNcC-romHoGZhcpPph71b3qv7yn9RHQArV3Q+nDA@mail.gmail.com>
 <D86C8F4E-517E-4ECC-A66D-E57F551FFECF@ynddal.dk>
To: Francesco Cagnin <francesco.cagnin@gmail.com>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-Proofpoint-GUID: pBGoCoOX0g80k4yA6J_mK0C_gHeTkaRV
X-Proofpoint-ORIG-GUID: pBGoCoOX0g80k4yA6J_mK0C_gHeTkaRV
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=462
 adultscore=0 mlxscore=0 phishscore=0 malwarescore=0 suspectscore=0
 spamscore=0 clxscore=1030 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2211090078
X-TUID: dV/QcrdWLmq+


> On 8 Nov 2022, at 12.51, Mads Ynddal <mads@ynddal.dk> wrote:
>=20
> I also noticed you are adding 1 to the WRPs and BRPs. As I interpret =
the
> documentation, you should subtract 1 instead, given the value 0 is =
reserved:

I tested it, and you do have to add 1. I guess it's implied that you =
cannot have
less than 2 WRPs/BRPs then.=

Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4332333wru;
        Tue, 14 Aug 2018 10:34:36 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPy/g7wUnfRoZ8HPuspHDRGlvy9ud/vFY2mrTMtjE4Bs+ODyLhCXmZq3h0U6uTR/P8a06txF
X-Received: by 2002:a37:9486:: with SMTP id w128-v6mr20759047qkd.362.1534268076469;
        Tue, 14 Aug 2018 10:34:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534268076; cv=none;
        d=google.com; s=arc-20160816;
        b=DUcQjlKWi/TBsARhNPx2niLBsWb6r3EIhtKiXx5YnIyHMe5UEW0nPZgfi6em0L4gmL
         IMKs09v9AbwWH85SFbSN94S1FLpbtdhczuCkm41qDLpApoD2ANHHrkTnc5K9LRFQoqFI
         g4xv7MIX6Ft/4ivyttx0CYQY2aeSABZcF9cOlUtjaah32lsd+jacoSgANWhXlEWudqyi
         GHi+ntE4cglufuDCNPnT7PwLu87a5FjJTo5UOzg7TZ+hJVGMVjjyUTYOgAtcXHfovsAk
         pptREA3yxWD2YR/LSYa+Fe0GOXKe1LsXBPCups9szVIrVkx3l6ti4sWI5XBDj84d1KVY
         Vj4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:arc-authentication-results;
        bh=PxiCZuQXxXn+ctqfeQdsfb3nnvT3FCWNGqVvyS4bLpg=;
        b=X/bsEE8iL2Zgm7G8rRr7S4AOOkwvy2/NJvIRkdmFxietwC+C5ynLT/sVQhH49pNuxx
         4lXo6YeBLiXsbp37IB5BzphT2ECqB0NoTAJu+1RJsukTHYHttmTPimAn91BSmDYQOXK5
         xBR5ynPiC4DFgCibxYkecED7ZZShkv0ndNxkwsTYi57mdL6lfWnoXER2uQa+2OLJEkmJ
         l9wMhS3DJjURhkQEeEY25hoH/nrYmhMEA1hKKQWDTwExJvp7mm0n5qlKrJZ8ctB3gee3
         kOLFViGrS3Z09De9kvPv6KDqwv2eyIojZMaCLjjgI4FKJFOvxATqDPnazyua7QURFxoj
         U7tQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nu+67pWV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m18-v6si8521556qkk.222.2018.08.14.10.34.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 10:34:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nu+67pWV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45255 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpdDH-0004Nb-Qg
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 13:34:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fpdAH-0002OZ-5e
	for qemu-devel@nongnu.org; Tue, 14 Aug 2018 13:31:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fpdA2-0002Xo-3V
	for qemu-devel@nongnu.org; Tue, 14 Aug 2018 13:31:29 -0400
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:52414)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fpdA1-0002Wv-SF; Tue, 14 Aug 2018 13:31:14 -0400
Received: by mail-wm0-x229.google.com with SMTP id o11-v6so13012261wmh.2;
	Tue, 14 Aug 2018 10:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=PxiCZuQXxXn+ctqfeQdsfb3nnvT3FCWNGqVvyS4bLpg=;
	b=nu+67pWVy/H/g+HCxF+CaAKyX495N0FGrJd/LkuUhhSPCiNYyF+OdqevgcFei0um28
	wTsEd9N+AkQekg8mCdoe3PR07trM4YfFoHaUPZIrz6739FLQ/kFBhTwBJq12ifFMux/3
	JxaJYxBMEDR+0YTMKfR9eoat/huvZeWb17gcFGnxtWRFvMN5MW3HqVCE0zag98Vtl7Gk
	mZ1xrTozSn34BB6zyeGQAivJI9G9B2EM+BvaibA9jyUCZuB17GN1F3JYUEVs4B4qKxYL
	8PZyl23NtB/XX31iqQEypbAd3qyDPZExckFB7owuUG2n7xdB4eOxdw/1DHY9Zdv27ZgY
	NHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PxiCZuQXxXn+ctqfeQdsfb3nnvT3FCWNGqVvyS4bLpg=;
	b=Yn25/BqG0lUnc1Tly7hSMZ635/s5ixIvnanD8+8vs5ExvS5+2Hyt8ajvobLmIKqkKK
	CMpHQU3ygiE7jtPacm2pVslVHnWtbL1l3VUOwZWwrHvxx7F/ein8O/QLUX0HJjXAaMrE
	0OM6hIiaXYkLGvOU8V5D88KWRBhs/wwhnCIBYN591Dxktkyk6efwvzFM5LSDbiJB539m
	2TxBcgVQfOR+1ZZfF/i97kwOHBJgNih2IFvbtO7Fpe6MLaeHvmVO3ZzP2Lchfsaj1kZp
	ZkdAe7Q41pyvhGYTU9aimxNyhq5CsLw9CAswBq94/5cVurvoeU15fqDRT5eYOSlIu4g9
	nZxA==
X-Gm-Message-State: AOUpUlEoeFlCn7j1UcGZobcF5XTBk72ShAg6jx79HurGoYW+S0yQno3C
	rLmJfkQE/1/j+tpaUpVBVwc7HJqxNu/KoHFEJ7VJM9h7
X-Received: by 2002:a1c:8b86:: with SMTP id
	n128-v6mr9969887wmd.42.1534263740735; 
	Tue, 14 Aug 2018 09:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20180813184624.12071-1-stefanha@redhat.com>
	<20180813184624.12071-7-stefanha@redhat.com>
	<012316fe-edc8-689a-b328-d84e2268a7e4@amsat.org>
In-Reply-To: <012316fe-edc8-689a-b328-d84e2268a7e4@amsat.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 14 Aug 2018 17:22:09 +0100
Message-ID: <CAJSP0QWKC71JiXu8TKG1PSHhZA4QT6deLD5A=Mfryjo=A+TY9A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::229
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v5 6/6] Add QTest testcase for
 the Intel Hexadecimal
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>,
	Liviu Ionescu <ilg@livius.net>, Alistair Francis <alistair@alistair23.me>,
	qemu-devel <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <qemu.ml@steffen-goertz.de>,
	=?UTF-8?B?6IuP6Iiq?= <suhang16@mails.ucas.ac.cn>,
	Joel Stanley <joel@jms.id.au>, Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VwWxJlE3C1kN

On Tue, Aug 14, 2018 at 5:18 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> On 08/13/2018 03:46 PM, Stefan Hajnoczi wrote:
> > From: Su Hang <suhang16@mails.ucas.ac.cn>
> >
> > 'test.hex' file is a memory test pattern stored in Hexadecimal Object
> > Format.  It loads at 0x10000 in RAM and contains values from 0 through
> > 255.
>
> Please add this comment in the source file.

Will fix.

Stefan

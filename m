Received: by 10.223.134.117 with SMTP id 50csp11403104wrw;
        Tue, 2 Jan 2018 17:09:53 -0800 (PST)
X-Google-Smtp-Source: ACJfBotGAXcDDicdk6Kul2JVlNGVT3l/9jZ91ahtkpVmaoP9t0adgNgzwrQnIopyriZUu0roVwKz
X-Received: by 10.13.237.65 with SMTP id w62mr35370855ywe.388.1514941793378;
        Tue, 02 Jan 2018 17:09:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514941793; cv=none;
        d=google.com; s=arc-20160816;
        b=WlIszayQ2YSBEIR9aJb/LCLLckMNbuRP1UMYNQWYrNzEgIZXBSaXpSNVc3AE3sUW6S
         zjNY9lag/ganjgxGPAP0TRVDSg+CWsuqJPycYj99dbPYPBhMZ5ZfVUniHBasB2mQf4Mg
         g6hkRqsrWvIV6XmbkFDr1Ek4ClDvIINVvbmwmKTxuhKs/0d65C3pAACva5IJ8S6KcplA
         4GHWA1Bnc/lpYsJW6IbR0434K/gvTVUjmh3YyXCj8p5j9vV1jSzH9m2zQyqn2T62lm5D
         NvnyVFcAd8vBueXMpIs02Zkt7L0ZQEUbPN58myFVZGWg2CJSIFIZ+9EUDrfD7gjL85GD
         pQWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=l31QdcHREAWZ89wX/zvzwG2CLaED3NlimIVH62Hq4uM=;
        b=IuJXi7ZA6FmTOMMxhNwQdzVa7XnvYgzoPjQkGO8fY6CpBYkjuHl7aKDoX3CijjLl9B
         GfkXPPSkLJ412eAsQXvofvMIqIq9DT5kt744YPjyLofXzCittd+Tfl9Vda7alhhsmETC
         GGRFEHwD5JXjvmgMAJuGY+4gllzBW/PuH31EePaWcOKBFxwcF9Z4T21yPKN9ZwdSD/Cg
         6iv6VlxP85xrbrC6sBaeBgpsQu913+BMJ2LXG0QSemiQNU0Qmhw+lhZYjyqxMsKWtQqW
         IvX1Ro0rHxTlA0AmBIXlRVR3Z2K4xphPFD7ca8omet/Oeizc97X/PsHP4fmM07LFSJ3i
         sOTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=N8GXUtv0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u10si3278432ybu.486.2018.01.02.17.09.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Jan 2018 17:09:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=N8GXUtv0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33689 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWXZ2-000815-Rf
	for alex.bennee@linaro.org; Tue, 02 Jan 2018 20:09:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44314)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWXY7-0007ho-OB
	for qemu-devel@nongnu.org; Tue, 02 Jan 2018 20:08:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWXY7-00039u-1I
	for qemu-devel@nongnu.org; Tue, 02 Jan 2018 20:08:55 -0500
Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235]:32913)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWXY3-00037E-13; Tue, 02 Jan 2018 20:08:51 -0500
Received: by mail-qt0-x235.google.com with SMTP id e2so448203qti.0;
	Tue, 02 Jan 2018 17:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=l31QdcHREAWZ89wX/zvzwG2CLaED3NlimIVH62Hq4uM=;
	b=N8GXUtv0CuFsYRgRe2G+VGFQ+p9HwHPjufamw7gA+qSj81FhMz9fpVqs1I6GOlNQ/D
	DSyc3vaDdMVVQ/eNC2UMiybTCZ3gmwnYinisp427aQwOEmvZd62xhjqCfUxrqhNHdtZG
	4EFRQfvW8MdAtXv7lhtvhkoBm3WRAo3eMlOAiiF6lM1AE+zXAuHg5MHHlfzsxUYQd3fx
	JqxdjW7H14XLKCWp4AOr6otfSPvkkqjU1IXuw9kd/F77VdkhUA+on2oyUBTAHXtbJRB4
	pyFfU9LyMR8q9az1vTBSIqewWaXls8jMjEj0Yfmm6fncTg9Drb4pQXshK84Mu5Vb8vUw
	7Dpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=l31QdcHREAWZ89wX/zvzwG2CLaED3NlimIVH62Hq4uM=;
	b=RsvOtnlP6Vx1AdifbJFtF4hISDBoHhmCmKTr+hOEl0b4ziyW7iZCBsXe4lEUjQsjwc
	SUNxH34I4uJPbJbBUGCWMJMrEI9J3M+Og89o/mLXc3wxyVU6EDQHwn9duaxnyWQeYMrd
	3UKDvCq1y2K/OPYi7h6ng0/lHAL9vgo6MOTDCA9wLG7U4nPH/n3jLAc0iN+dpJx+z8Ps
	jQITDC39sRZ1OqupGSDHDX/pDnYezDeSGBReeXgEbrmxBHydFRcMKOjuToI2Y80EImlf
	kq4vT9uFAFKer10UPxpkyUxXwtObBNKAVG+Pcl6b1nibcJ5Do+lU75Q0xNFluQJNOVe4
	GKyw==
X-Gm-Message-State: AKGB3mISNAu+/S4fY6Am6FAgSunN3WCX0AU5uNBF1TKi+IfsOTm2WM6l
	wDW++tv2fJhAa9cJdXQtCHc=
X-Received: by 10.200.57.116 with SMTP id t49mr65002648qtb.235.1514941730207; 
	Tue, 02 Jan 2018 17:08:50 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id r89sm8503304qkl.5.2018.01.02.17.08.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Jan 2018 17:08:49 -0800 (PST)
To: Alistair Francis <alistair.francis@xilinx.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Fam Zheng <famz@redhat.com>,
	Xiaoqiang Zhao <zxq_yx_007@163.com>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
	<afaerber@suse.de>
References: <20171229174933.1781-1-f4bug@amsat.org>
	<CAKmqyKNDbhAQWXYPrhFnbqcCRDO_ZeBdUuC_xna9XpqCvw452g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <31aa78d3-5bd3-0495-8f9e-795efebdd69d@amsat.org>
Date: Tue, 2 Jan 2018 22:08:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNDbhAQWXYPrhFnbqcCRDO_ZeBdUuC_xna9XpqCvw452g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::235
Subject: Re: [Qemu-devel] [PATCH v3 00/42] SDHCI: housekeeping,
 add a qtest and fix few issues
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?Q?Gr=c3=a9gory_Estrade?= <gregory.estrade@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DNm5AHkFj6Cs

On 01/02/2018 09:15 PM, Alistair Francis wrote:
> We are making progress here. Do you think it would be worth splitting
> out the earlier patches that have been reviewed so far so they can be
> merged? A 42 patch series it pretty daunting and most of the first 20
> are pretty straightforward and have been reviewed.

Andreas or Eduardo could you help reviewing patches 4-7 please? These
are QOM-related changes.

Thanks!

Phil.

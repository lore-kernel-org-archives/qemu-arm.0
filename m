Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1843256wre;
        Thu, 24 May 2018 06:07:57 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqO67jxAdMOtTAVQok9EvasA52EbHe5IUWdPYOWZjl2TA5vGT5K4ezg71S6+DNH57ZdgQOX
X-Received: by 2002:a0c:d290:: with SMTP id q16-v6mr6598007qvh.145.1527167277169;
        Thu, 24 May 2018 06:07:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527167277; cv=none;
        d=google.com; s=arc-20160816;
        b=jOa6whG3K6H+qWFbC7LLDP9uogUnUhUMw7dQ4G4nX9JYTjlXyxxYajgEqV2YRBqBM7
         KOsWwOW0pj+sAiPQLkKjTWQnstYPf9673jzJy/c1PBbsKOTSkugi3J0vt7MhS2XbWpUK
         mvBOHzsEBArdqxbjuoO46vCYE++ETJ4r591RlcgVIMRqTFfvuKiPzzY6poi1oyTZEKpB
         anK1UST/JWw5AQdax0X05hedGXCCv41xSLyhDQbfv5oPHmCNWOoERVWAEQdjbz2Gof+F
         HDs+KKO7UB7gYBY/i9DHOPfKzo9s5Z7Fdog6/wK+yONToSF1TpOm6rbCbf2GufO3hJT8
         2n/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=GBVyBzSKCV2iiwwQ3z12gC6ILTkjtAWep/nE/Z8vbXU=;
        b=rKtXwjCQ+otS9XsCyt62Y0pCT5UZ3j1zwKnc1ui0INvjjbKCRLIuOnl/8afYObB98m
         n1NN2OwTaSrMEP0XnCO7jXsnt04fD5woU+h14plWqD0/mmgQASmFHpKzofaK0HGBkLFj
         OllxZ1xeqcUXf29Pr2G7OeGDusFGpt69kHrGlrBkbE+70S2cTSYtekfwBD4dU3tulpKl
         2rumJ2o4bncBea6TKMX0DEwVBb2tp54SQxJ1QB7Y+ImEEb14QM0E04kgQCBeXSkKQX6X
         8BMvLPgmEMq6Nwc694wziT1vod9GIH9aKEd1KbkwMSw6hEqZRtwUMx0OLgOUuKjVYic/
         APsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JGO9Nkos;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z16-v6si2708951qvn.132.2018.05.24.06.07.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 06:07:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JGO9Nkos;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38614 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLpyG-0003HU-Lg
	for alex.bennee@linaro.org; Thu, 24 May 2018 09:07:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLpy2-0003Dq-2o
	for qemu-arm@nongnu.org; Thu, 24 May 2018 09:07:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLpxw-0003BG-H7
	for qemu-arm@nongnu.org; Thu, 24 May 2018 09:07:42 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:46200)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fLpxw-0003Ap-Bw
	for qemu-arm@nongnu.org; Thu, 24 May 2018 09:07:36 -0400
Received: by mail-ot0-x241.google.com with SMTP id t1-v6so1808379ott.13
	for <qemu-arm@nongnu.org>; Thu, 24 May 2018 06:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GBVyBzSKCV2iiwwQ3z12gC6ILTkjtAWep/nE/Z8vbXU=;
	b=JGO9Nkos3hKL0WsLth2ORLprTbpWJnI5P7W5l38qoV28HYJh4y8DMmNmDW8CRcuLdQ
	D+jTuwBdvBS4GQTWtv4klyuCqmz4wRbShzu2Q9ih2FyykGfacoxSbGBT7E0TeYGTWbWn
	PGlAg6WzDBBQb0cdWFL9O2SYjVrGAaZPhhgMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GBVyBzSKCV2iiwwQ3z12gC6ILTkjtAWep/nE/Z8vbXU=;
	b=WaMkVPZq+n56BGVk6+uvpqaUIC3F2sCsFF8ADzk2DRWBCc8F8Y/EC+IgCCX1pxuiNA
	B9ci+7Qc8mTIO6ypm9o27h39gqTmOiS8M1E4Yp7L2PF3RGkyi1l1OJ3+2dATWC07MEo1
	ifJkHcoGMWYvweYUroRUtexhcmc3/hDCL/f2bdHY+7kcz3AWqudY54hOYoYMwuSrUYyS
	GoCqMQmr6ALbZJu9roINkXTumHSPEv5ihrd9+DBkQQK6htuxLDmmbJDdDeQkb5ubxi9y
	aLEVBF8Hy1rAp8Dax8fmc0YguvyFiRFMxq9RYFznnQ+Gl5yoXFv7FjFvhbppgECzDMhi
	S4fw==
X-Gm-Message-State: ALKqPweYE4znDy6dOyc7Co9CiyByTMtPeSLLcjkj0sIfjPiLx6vqXe+Q
	cpz0A7Lthma1NiwKRT+rwu5SVWuCRHg1sSAbw6LcXQ==
X-Received: by 2002:a9d:2842:: with SMTP id
	h2-v6mr4885378otd.210.1527167255644; 
	Thu, 24 May 2018 06:07:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 24 May 2018 06:07:15
	-0700 (PDT)
In-Reply-To: <550464ac-5155-6311-d0f7-92c7c0813f82@redhat.com>
References: <1527091418-11874-1-git-send-email-eric.auger@redhat.com>
	<ec6bc0b3-5f0b-bf0c-7d9b-0382e114ee9e@redhat.com>
	<bf99311a-823d-34e8-1892-be27534afc32@redhat.com>
	<22c4e504-a7b4-e6dd-b2cc-618d306b6f0c@redhat.com>
	<CAFEAcA9LMV_-vVAwUkuY=uw2Gf6XLvsgmi8y0PgHPJnQZkWC0w@mail.gmail.com>
	<550464ac-5155-6311-d0f7-92c7c0813f82@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 May 2018 14:07:15 +0100
Message-ID: <CAFEAcA-hobu_=VKhYQ+UZ1WX_JFfwCarkPKQhiBtXc3fre57rg@mail.gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 0/2] ARM virt: Support up to 256
 PCIe buses
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Auger Eric <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3ELeAhmVyJZ+

On 24 May 2018 at 13:59, Laszlo Ersek <lersek@redhat.com> wrote:
> On 05/24/18 11:11, Peter Maydell wrote:
>> Won't it also break a guest which is just Linux loaded not via
>> firmware which is an aarch32 kernel without LPAE support?
>
> Does such a thing exist? (I honestly have no clue.)

Yes, it does; LPAE isn't a mandatory kernel config option.
This is why we have the machine 'highmem' option, so that
we can run on those kernels by not putting anything above
the 4G boundary. Looking back at the history on that, we
opted at the time for "default to highmem on, and if you're
running an non-lpae kernel you need to turn it off manually".
So we can handle those kernels by just not putting ECAM
above 4G if highmem is false.

thanks
-- PMM

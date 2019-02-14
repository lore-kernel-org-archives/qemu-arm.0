Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1199791wrp;
        Thu, 14 Feb 2019 08:51:14 -0800 (PST)
X-Google-Smtp-Source: AHgI3Iap+ncgDKKDTcYXIFvUOp8H6fg827hQT9eiy51to4pyXfQGNrPhUuFgbSPghVykPsjVTQY0
X-Received: by 2002:a25:b06:: with SMTP id 6mr4090105ybl.355.1550163074234;
        Thu, 14 Feb 2019 08:51:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550163074; cv=none;
        d=google.com; s=arc-20160816;
        b=ylOc0StF3tyBXsM87mx7cmOYrbbsk74kp+72yB7NqyejzuuKI3I1Mltxrl/yIcLBMm
         yEmb6+tnh0WtLTlGKT6hoQDTLBhE6cvPMLyghc1/HfCmVBjYch6HgwsbXkz7vLskM/P/
         aa7zbqN+tIYLoxAwyyToFF9fjinbbknb22/DWX0vyftYgyJfNAyK8z90aZTlqNR3uHjh
         GM4HbSLHyEA05ES2qc8UPAXGZ/xyJxeggPyUuu5vbAvBAR5QmUWXkL6e4Hlb1fMy9zFn
         rsrpdwaS+oGkjMh7qmHNmKO9NLTb9JzqONEYphm6Jual8nwB4uIkRC9a0GTY27anZ48t
         H/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bRn/hbPdMR4Reyag1cKftL5skZ8XdC34+0v+wkWnvG4=;
        b=lF6By46J8uRUbfaQK98pFewleKGJ0CO8GxzvuBV6oxib5YNXSeBfflHhq8pSaioBMt
         g6I/4cr5djAEeqW6+NoZkoVHq7b1PKlcmFrH3cytL73xfdtjZ2m+w9gMsmPgF5/+rvCd
         4apQgaay5H3ZWhbU9EAwOa+whrybGdQtksBz9uDjK2iv3xTdHxMjiA+UqB07fyKstKEv
         BgxuOk3T5wePI4nkb4zrbpnE7KAOwiFY16UQP0LV5VzbMDBCz2bqX+YoO8qwLpxlshIh
         3HfIUcEcPVBfRV3VfzHgLkKHQorzrrUl9arqK3gGxifQsap8ESYAypIKQkAnKlIlhK7/
         VIxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H4InARP6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e63si1747751ywd.177.2019.02.14.08.51.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 08:51:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H4InARP6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:51390 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guKED-00040a-FI
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 11:51:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guKDx-0003xZ-Ve
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 11:50:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guKDw-0006tI-GQ
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 11:50:57 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33838)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guKDw-0006fM-9q
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 11:50:56 -0500
Received: by mail-ot1-x342.google.com with SMTP id 98so11670496oty.1
	for <qemu-arm@nongnu.org>; Thu, 14 Feb 2019 08:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bRn/hbPdMR4Reyag1cKftL5skZ8XdC34+0v+wkWnvG4=;
	b=H4InARP6A0aOx7O1ca/fonEEo6Em36cwhZ/MSqHG2wqaFvex9VqC++x5yXaiCGlyWy
	O4RgSkpivyD+3ovM5mGw1WqBG8bbnoCEzIFKk6WwMFEm1mva6luRuzG10HX30uuxBQ/D
	cxf9W2X9rQRyI18RPek1eNcYZ4BPc83es73SfU0uzCyAmniMjJ2bU0uMOem78yDzKRmw
	THI2Siy1bNBdxGihzcVcdmKH/8S5EA3vgZSFYsgby3hsmGUs+OY9i3AddQxsmiVqPIve
	a64FCMNoMbFbA74vZvTA21pI13j1bmQh0KtHzGhg0eyXk7lnZAC8de2kv6UBrudnn8x8
	xsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bRn/hbPdMR4Reyag1cKftL5skZ8XdC34+0v+wkWnvG4=;
	b=EZ3IqpZCNSjOL7R0REdbQHayDUEt/h2xfEtjjBTGjZAoNr542JoR2OmQJA+sD5l+wk
	BPZqgJphY0iZo3aCzbek1V26RM+eNnggzF/d9FdVhoRDlYJsB43N9Yd/VJMRlUwqfrhr
	QtrqqO+XcTFTrc8Ozzt5tGZfvXy31dLidUDxIb1XI5OiW7kIkrn45Fsge7ZFsw10+jf2
	HyLEYXsnZ4DENbj0Q185GoYYCJWxhf+13Vk7UoZEp60Y7ZqDPWU92LvItjeSNmuudZ9K
	5X2AL/m8sa612yEmPQ5yGe18Hl9JC+b7EptF4MaY813K+HsG7Tq47bzQVrgAXUXAMWLa
	kNbw==
X-Gm-Message-State: AHQUAuaO6psyQtbJ1MLXbQIbr363c6QLL0peoEmWp+bmBK5l2O+FtEy5
	vMj8tCSrrFYQKqrwCV+y4f4Kqkx4XqvC1EBVBRsm1A==
X-Received: by 2002:aca:b341:: with SMTP id c62mr2775655oif.112.1550163047785; 
	Thu, 14 Feb 2019 08:50:47 -0800 (PST)
MIME-Version: 1.0
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-5-eric.auger@redhat.com>
In-Reply-To: <20190205173306.20483-5-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Feb 2019 16:50:36 +0000
Message-ID: <CAFEAcA8RYbew8Om4nUG2Y3JyMtmmmM1oj0_iOOtSSp6yP8nLQA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v6 04/18] hw/arm/virt: Rename highmem IO
 regions
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
Cc: Andrew Jones <drjones@redhat.com>, David Hildenbrand <david@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Sca6QYDqY+EC

On Tue, 5 Feb 2019 at 17:33, Eric Auger <eric.auger@redhat.com> wrote:
>
> In preparation for a split of the memory map into a static
> part and a dynamic part floating after the RAM, let's rename the
> regions located after the RAM
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

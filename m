Received: by 10.25.0.23 with SMTP id 23csp1691779lfa;
        Tue, 6 Jun 2017 10:14:57 -0700 (PDT)
X-Received: by 10.55.150.71 with SMTP id y68mr33355891qkd.193.1496769297079;
        Tue, 06 Jun 2017 10:14:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496769297; cv=none;
        d=google.com; s=arc-20160816;
        b=BZYNDi29bTU0uFurv5DgM4vMSliXdunX+W+JNb8+20YA1qnpR+OHvJ6+sza3T5GqcC
         5d2Ytmmwc8GMYco3qOwMI+Hp+p+zoh532YRExXsvDbM20QDKExsOLwI4gzKfD+pxwlgx
         aPjcQbufoal2gQlTuYfuddq6i/8Pcm8D0Pw3syhxAYo648zTi7gJFM7EH+kJ+qrFR3bi
         kv+NGfnN0UQF8vggGKgtOJhNh9Y/JoYCgsDenFud31c5eThjVlZndzXMvrJvT6Mu82n2
         eYP/PjjK/k5KYoaQEtsba35CGUkNPm0WEX4n2Sk5l2pDK7Oqacl7e17IkKdRHtAanPmu
         /QwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=8eOvaFSarkEBdcSdxxrB6ghqHWxjjfv/hGDOZDPdWvw=;
        b=xdXyvpq/zqO17mK5Q+zfGjP0KBXBNkCxM94NV22xbcIAovCEcT2MXHptKZOX42dWQy
         B8kAJvgDDOw0ZF1LbTKqXijc1o1wd6iQjtDlLi5YVRhn7P+KgRZGHil8MPeORxCgzVtX
         bLDveXWOy1nQyqEkYLREwVcu6iWHUOlbk76LLLdYXP7ylKpfIVfcVaWE1WKsJyugoD1x
         Ou4/tlowJewtasVy+u53x1AHOY5hpggJ6ZVRxYixXhHSE1a1KCl9CIrzk8kgI+aiGF53
         1OJzwA8EV3FRcWNSik6AIc8yS+Bb2VeiakR7T1yPkmezsXgy+dK5Y7VnX561PuzcIfHB
         IATQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f63si29355197qka.10.2017.06.06.10.14.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Jun 2017 10:14:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39411 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dII4E-00021Y-7M
	for alex.bennee@linaro.org; Tue, 06 Jun 2017 13:14:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dII44-000204-5y
	for qemu-arm@nongnu.org; Tue, 06 Jun 2017 13:14:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dII43-0005KD-Df
	for qemu-arm@nongnu.org; Tue, 06 Jun 2017 13:14:44 -0400
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:36300)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dII43-0005Jx-7C
	for qemu-arm@nongnu.org; Tue, 06 Jun 2017 13:14:43 -0400
Received: by mail-wm0-x232.google.com with SMTP id 7so102159367wmo.1
	for <qemu-arm@nongnu.org>; Tue, 06 Jun 2017 10:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8eOvaFSarkEBdcSdxxrB6ghqHWxjjfv/hGDOZDPdWvw=;
	b=bM+YiyPW41NaUFRm3iKJIVHc2bBTZeo0wLYrWJXRmpHSzwov3T1nQEyIQ09ZMOA7vp
	K3n8P08Bz8EhkaoT8XMJAyN1C1LqcCNAZTJz7uUbu5VHxXqjv/tBs8gc8Aaws7ppT6hn
	yGXQobRURG4TSIJTgxX8TFmUAj4O26pQQCi9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8eOvaFSarkEBdcSdxxrB6ghqHWxjjfv/hGDOZDPdWvw=;
	b=ehaMOqYxaw92eSR+V4fp5w9ItOpFFaWj7jkBFSSUeRIEdEQdUJsEnOaxL4mpa7LoOh
	i4Zj+nizULyGesxsUNIJ3MbbCb+V+YWLmlYaIOSBD5c46dpe3ZpBK3mVJxoY47P//jul
	Fw+ke0mxfVqjHRkRo92pukyucZKZ21K7FGPTHXJWoiKXwgvwJSwln5+fA7IVXMmgfdOG
	agib2iLHiwbzRvCj2GPWmFXJszGZbN4dB83JMVCmIn9P3G9MlSZULekrZDiu8dBtQ85n
	Kd3JoUEJK0o9smSbmTir3pBE/tIG+VkPLIQ1V0tMDh3SsaG4h/OZg3CPyyRmHNYhsUO4
	Nq6Q==
X-Gm-Message-State: AODbwcBFZJOPlvENlLWQprWVW5SGuDjRR8WS5CNXWkMvhx1EzGpTbqhG
	Ic+jeTTkCN8LU8bDPd5w9zgIcnB8YGxD
X-Received: by 10.28.72.7 with SMTP id v7mr6188234wma.125.1496769282078; Tue,
	06 Jun 2017 10:14:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.55 with HTTP; Tue, 6 Jun 2017 10:14:21 -0700 (PDT)
In-Reply-To: <20170602162857.6065-1-krzk@kernel.org>
References: <20170602162857.6065-1-krzk@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Jun 2017 18:14:21 +0100
Message-ID: <CAFEAcA8MnUERMj4_KTu6RAw3bJBT63YkrAJj7eKU=oRxK2=mLw@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::232
Subject: Re: [Qemu-arm] [PATCH v4 0/9] hw: arm: exynos: Improvements and
 cleanups
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Eric Blake <eblake@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MUSEwJ7GTZGI

On 2 June 2017 at 17:28, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Hi,
>
> I split non-intrusive changes from my previous attempts [1].
>
> This patchset contains only cleanups, minor improvements and support for
> power off. Power off itself will not happen because kernel will hang
> before trying it, on syncing IRQ works (fix for this is [2], but this will
> be separate).
>
> Changes since v3:
> 1. Rebase on current master (API for shutdown changed).
> 2. Apply Peter's reviewed-by tag.

Thanks for splitting these out.
Applied to target-arm.next, thanks.

-- PMM

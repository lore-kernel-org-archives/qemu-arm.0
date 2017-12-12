Received: by 10.223.159.74 with SMTP id f10csp3733925wrg;
        Tue, 12 Dec 2017 04:08:08 -0800 (PST)
X-Google-Smtp-Source: ACJfBou7WGEZwq+1Wn7oEuUp3DV3gTydSWmUwow+Ttr2Xry/CMwJp/CmaVDLyO8OmjWgiatlNVq9
X-Received: by 10.37.183.11 with SMTP id t11mr2256943ybj.3.1513080488069;
        Tue, 12 Dec 2017 04:08:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513080488; cv=none;
        d=google.com; s=arc-20160816;
        b=car7WuJVUfw2Ou7URikLy7wxy1axOpowBIMwcRBsKfrsOydsxaiJz+xReCBg9EVZbb
         6i9pIX/Rts3Cu04LFhKqAmwfUvlzCiow5paOBPYl2U5E3VSmrYTH2cua/LUl6NEPiN5f
         0yKKIjjjdMt2T3IfxqDJ+WYjqIXrlzDVibzXiDKx/UKoilbU0PT6GNSePJarXpuIEunG
         sJ/l/e7gut62T5ZWWR2O6K7bsoEB4PhS+OdzBQTrkYqSu7yJpDepuWJTqO2p5mSM0bu/
         KOqNGBlM03VUHw9mRiHoH1TUn+ZV6xzQz7bE5xbfLhoannHOZjxOSCNQcB9s5hKklfqm
         B7Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Obu4AFi81g4PGFg79BbaI988MTMKt+kvupZOo9gGPNk=;
        b=w6DLIyZvQeBJro4X5LUK3jb7leKwU70ALVVFNzut2GABzL7aDPC+RKgmWZMq9cDeL7
         hK2ya/on86hAB5LiHZ+7kIe0Uh32w2zeOzEuDM7kQXpUIt4WCRO+NSE28QcV2B8jp/Tl
         I42s80qz1reNJOO9PdKA7OrbsGoDw71ycp8m/Vv0ybShY2AE4tnUesYjBJz1jLcD9tBu
         b6NAQ15pPRrlSu7k89oA41hBAc/PmmQya1KI3kU4wqj6izXRwp29i7uVtUjDLQNMUCOV
         gQHktKGvFZ0kBEsvKDmfY+T+nROcEfBHDORKTc65UUqyd4dUpwjMfObf3uUv4esD4wjl
         e3lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kWhdEjcU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w7si3342514ybk.222.2017.12.12.04.08.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 04:08:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kWhdEjcU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57841 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOjLz-0004Qp-Hw
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 07:08:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOjLs-0004K8-Re
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 07:08:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOjLs-0003uH-0L
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 07:08:00 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:35095)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eOjLr-0003u2-SG
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 07:07:59 -0500
Received: by mail-oi0-x242.google.com with SMTP id 184so13829025oii.2
	for <qemu-arm@nongnu.org>; Tue, 12 Dec 2017 04:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Obu4AFi81g4PGFg79BbaI988MTMKt+kvupZOo9gGPNk=;
	b=kWhdEjcUO+L+4CoNzJK8VqgF9XCXT9hPdDO5w/euVHRVQM3MtDN2R5qKfonB8zKXW0
	0aOKNsJIfzxgAzmwYnDgMceb3JVam4Zj6jn2dgsZ/ySpfymMU9E1ZyMBMiJsm5314986
	PEibM99Xhp/eWqA9xtZXjyhRFFLLZNVuQrAGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Obu4AFi81g4PGFg79BbaI988MTMKt+kvupZOo9gGPNk=;
	b=AzhKlzc0VU4/oXjnb9aGqAn8v1e1c1900XHN+0t2O6Bdjym+mv32TWhQ1l5K1FMoUA
	56np2zl3sLjbN4Vp67eEbEq/e+UgEbDrrrHgPdx0XyWEOHBStco4vLOPJ59F9z/YTCaF
	NYFYCYmv521geoCIc+DrEaeDR+hTAwJu2WFUjScAIgEwaRoqkSaCQSMFi6G8FLkWX80K
	kxUwqoUZ/HYQGj0UEx7tGJTwJ/Xl3ttRnCOD+sq9pqDrn1ImXX9anajhTbaaFAruzm25
	rPxD1Y7/5n+nIlOyKvwbEiKTO7hnyn2YRp1mjnhZ0wPxSyzvGK0Ed0hzYfhU52kSwnsm
	XvsQ==
X-Gm-Message-State: AKGB3mIBv1iu9x0iULImJLgHcLV6toVPfwvzlpsGtTjDc7d0B2RfWu1i
	O69omHF7pmE5IzxubNsPSREZN3s9WawLYshd0SFlnQ==
X-Received: by 10.202.180.132 with SMTP id d126mr2842744oif.299.1513080479208; 
	Tue, 12 Dec 2017 04:07:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 12 Dec 2017 04:07:38 -0800 (PST)
In-Reply-To: <5e3798f7-e280-b6c3-1504-828283617c52@redhat.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-4-git-send-email-peter.maydell@linaro.org>
	<5A2F6ED9.5030605@huawei.com>
	<ac182406-8011-9f19-38e7-37328434095b@redhat.com>
	<CAFEAcA_9pee99KpL4zwVS5jJuiv2MCGp79crufpU1kH1Okg-Hg@mail.gmail.com>
	<6b4b6351-eeb4-a4d3-8ddf-5401516671ae@redhat.com>
	<CAKv+Gu-Ugm1g8twoKwgXAPtDfETvXntk2h4WzMVuUTDF7GhMvA@mail.gmail.com>
	<5e3798f7-e280-b6c3-1504-828283617c52@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2017 12:07:38 +0000
Message-ID: <CAFEAcA_+NnpeP9Le7bp9yrYQDwtuP79pt8GpVzJ4RBDMx1iomA@mail.gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] hw/arm/virt-acpi-build: Add
 second UART to ACPI tables
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Drew Jones <drjones@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Andrea Bolognani <abologna@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZnDP6QoISTDn

On 12 December 2017 at 11:59, Laszlo Ersek <lersek@redhat.com> wrote:
> Peter, what is the intended use of the second UART?

Per the commit message:
# there are some
# use cases where having a second UART would be useful (like
# bare-metal testing where you don't really want to have to
# probe and set up a PCI device just to have a second comms
# channel).

From QEMU's point of view this is just "some people would like
more than one UART, x86 provides more than one UART, it's
easy to provide an extra UART and it's up to the guest what
it would like to do with it". If there's utility for the
OVMF firmware in having 2 UARTs that's doubly good reason
to have it.

thanks
-- PMM

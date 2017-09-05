Received: by 10.223.172.38 with SMTP id v35csp1368224wrc;
        Tue, 5 Sep 2017 05:39:20 -0700 (PDT)
X-Received: by 10.55.149.70 with SMTP id x67mr3055869qkd.149.1504615160001;
        Tue, 05 Sep 2017 05:39:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504615159; cv=none;
        d=google.com; s=arc-20160816;
        b=SEYkh7HzIW0tV3RRxwLF8uw0CAQshvbqohl1WpO8FHPoSb7h/mWlMC0ChQfNFyDkWg
         3eJ95GPmB7nw6x9L7btbpHxk3Sdb3YNYdRWyBVHJ79zKdgQn3nKI+Jj6vxucKu9jHK03
         LOhhNpQL0qcmpI1BapBA5pt7WK51DGPQoh3yYn2/kiGo+GjTARR0Wk8Gb1tUR5u2llA8
         BfcaYNJS9alAbjf0i+hmN0FC8+0dcNuGE76zBm/6Eo8GWqyij456h5cHlnMsRhro5455
         zAaUk9qKO1H7Pqdo7V/GE6OW+A3GHxwr/m3ZQPhtjWiA3P4Zh5Fh3i67iqYZGTqNHSrY
         TvQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=4k6/cMj0I+y29sxZH+yEcFXnuq31L3KFr+JoPVglMV8=;
        b=DB48th//wfsojEGajAXiipSzaK31hUD1pDK7Y6HuARL9sqJW9jucP7jBxsL8s2d13U
         b+SH8orLlFGh1UgbTbG0RkXCjuNosq/oqwspsCYJdp1CbWibiH17UQZ1oK/KgT4i6Mlt
         uq15JD4+oCzTEn1oyMn2tYemKjHiZUbkLbBNTm7n0E7hIWNfRZhoxaWsUq9f7PctYbSw
         iAR2yLeOslk/rlTA1oH8H7KUlJyWrRsSu9E9KQj29g2XxDlJ0qhscU7eNDCKPtKu2ue3
         LMQ8zimV2KNj6dMtRNgTpglXZdDh+QR0oFZY7YpIjd4y4dbAV0n6ItPY5uIkQ8N41X6M
         LmwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WwnKJUr6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n25si135720qtb.277.2017.09.05.05.39.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 05:39:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WwnKJUr6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58705 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpD8P-00042K-JF
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 08:39:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpD5S-000209-AO
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 08:36:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpD5E-0004MT-Ak
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 08:36:14 -0400
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:35036)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dpD5E-0004LK-2H
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 08:36:00 -0400
Received: by mail-wm0-x22e.google.com with SMTP id h144so4788718wme.0
	for <qemu-arm@nongnu.org>; Tue, 05 Sep 2017 05:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4k6/cMj0I+y29sxZH+yEcFXnuq31L3KFr+JoPVglMV8=;
	b=WwnKJUr6jiltn07RWiEktH2hiKkekOe6gLGHiYbNvPy2HAfkvjJzGOSln7+1J30HPZ
	MYT9Ifg9LOadBpxR8Og1HuDAZiNw7sYLsqxI/Gj4YsVzuBBzeQIFY12TP6HwK9lKrRkt
	kMn1CB+djU5GDIqffLELrOsDW1v4Px8xNjjAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4k6/cMj0I+y29sxZH+yEcFXnuq31L3KFr+JoPVglMV8=;
	b=NY7DadNqkl4yl3hJJrKl1zDfAUq/GN+fV69VUsf2Ut7khSgHjVz/wqMxU3lK/ZU33X
	6I+VVYLJz3cgU42ssBj1IljLSf3iJC8PRaAgiEcHLUrT9b4lImlOHbuOd8oiCC3MW764
	/Y9ZpvyaEqqzUaTOVMCYwJ4Pba/upHBxphRLkwTVVIUshiI0mMg0DnODyFI18S1S9MRc
	kmY7JRPb0YUJH/p1n2Hcls5B7RxwON1XMuhgHFfwRhRadIe+QxzqiZeBGqUZYjd3WNqj
	SaKIIwLkzVxHPruA7crkdjPpcXC1NZIawZjLd5wAw6MlRBhD7nEWyXYTA7P5ZNT5wrjT
	dpSA==
X-Gm-Message-State: AHPjjUiQbidBwCekhNwRxGZu5Wh5nbkRaWMqs4oozm5SQOHMK7LFfo+4
	NgVh+2HukM/k9TPvFPg537icW/X2548+
X-Google-Smtp-Source: ADKCNb5OIo+QCRpjOo8Zd1Yq9U9uj4HG789kuGj3rvh9zAaomY0CaZQjmsIvvuj6+bs/ilBKvwR+QUCnrFU5gj0+WYo=
X-Received: by 10.28.236.91 with SMTP id k88mr1590783wmh.95.1504614958879;
	Tue, 05 Sep 2017 05:35:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.159.68 with HTTP; Tue, 5 Sep 2017 05:35:38 -0700 (PDT)
In-Reply-To: <7FD21DDFE9A3784693E393AF276FE7D21F17E49E@DGGEMA501-MBX.china.huawei.com>
References: <20170905112152.8851-1-ppandit@redhat.com>
	<CAFEAcA8B4EwXCPSBsftt=QkAuH8jCBbK23-uU7NA7G3k6ADHLw@mail.gmail.com>
	<7FD21DDFE9A3784693E393AF276FE7D21F17E49E@DGGEMA501-MBX.china.huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Sep 2017 13:35:38 +0100
Message-ID: <CAFEAcA8JxuM-ddQVTBfgnSDD2fD+kz_RNShdNDqMqVH=zOKBfw@mail.gmail.com>
To: niuguoxiang <niuguoxiang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22e
Subject: Re: [Qemu-arm] =?utf-8?b?562U5aSNOiBbUEFUQ0hdIGludGM6IGFybV9naWN2?=
	=?utf-8?q?3=3A_limit_GICR_ipriority_index?=
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 26VGFOvVMe3+

On 5 September 2017 at 13:30, niuguoxiang <niuguoxiang@huawei.com> wrote:
> I think only assert is not enough, because assert() depends on NDEBUG
> preprocessing

The code cannot be reached with a non-aligned value,
because we register these functions via the gic_ops[]
MemoryRegionops in hw/intc/arm_gicv3.c, and since we
do not specify .valid.unaligned=true there, the memory.c
code will throw out attempts at unaligned accesses.

The assert is just checking at runtime that this never
becomes false accidentally (and also for the benefit of
people reading the code).

Incidentally, QEMU can never be compiled with NDEBUG not
set -- we will #error in the compilation if it is not set.
(It's not good practice to depend on the assert() actually
doing anything though, and indeed in this case we don't.)

thanks
-- PMM

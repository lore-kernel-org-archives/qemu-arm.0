Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2811314wre;
        Fri, 25 May 2018 02:01:24 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLc8SUImwDeg4gmVkyZ7Ca85BGvcwdWLRHV1sOkD5gI74TtOHTM+iHuzrLUPY4TTulnWekH
X-Received: by 2002:ac8:2f8f:: with SMTP id l15-v6mr1302887qta.337.1527238884249;
        Fri, 25 May 2018 02:01:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527238884; cv=none;
        d=google.com; s=arc-20160816;
        b=CQ8j0tY3/7NSraghpk9MQnORCW0HbQQfm3T9ucIgtpuZG8EarwbTt65DTU8AllTPTb
         GendTgpPgTo3DKGqeQgDvuvfitt6mwUFqguUC4RRdWyEQF70Cvff0DGzjY0NCGnYFSdf
         irKl+i0ii/YRQ+DLs0NGjsNEErAZ9kcpF3rSxEdOqBQgbjVy8/U5QjFhGGTvO3ydB1oG
         7eBPgJua02clOe+CU99AYTVxCa0EvWg4eSbepsTgodTu34rpq8FGn3zaqOycIErDPhTr
         wiJqk9QE9VCoVys+9Lsz+g12S2+QMc53VzMohDCaBPB9H2fOfmToWl59qJZxCrtcSu9L
         tRLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=jvGj0EYYVLkufOBLVzDsWQNwgVrtixAqZLHinyZqyTA=;
        b=JLrz4E4+dS3uZYESB9A3M7RukNgVCn56LIv+U/u+7WQ1EVAM8YxhjbVKhE/q5678ph
         g1sXhW5wig/8UydsCRMwteHleXWTgKQBcbR6HfhbMySWYgGpeXQXadNoSAkokcC2yR/n
         8wmjet+f90z4Xlp5K41HOO8UZjr6ILfgRdan8TJn2XdHQu2NtcZ/2rwevPyx0Xz41XCE
         G/niR2NcSs8Qeio+qY3Gw88xf0W+cYYufgTQjXP6bTY+l0dG+OZJ0uQm844z5Nwo1nJj
         V1IuHy6vq49QQw52xp3BNcM/cG47ZFF6AiYIoXbz/1rJHpOYr4dU/0CCJLrg3ohr7WR2
         nIuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fECznaES;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w4-v6si104442qtc.187.2018.05.25.02.01.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 May 2018 02:01:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fECznaES;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42583 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fM8bD-0002F4-Pr
	for alex.bennee@linaro.org; Fri, 25 May 2018 05:01:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fM8az-0002D7-Vk
	for qemu-arm@nongnu.org; Fri, 25 May 2018 05:01:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fM8aw-0005Si-3c
	for qemu-arm@nongnu.org; Fri, 25 May 2018 05:01:10 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:42872)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fM8av-0005SV-Ur
	for qemu-arm@nongnu.org; Fri, 25 May 2018 05:01:06 -0400
Received: by mail-ot0-x243.google.com with SMTP id l13-v6so5256431otk.9
	for <qemu-arm@nongnu.org>; Fri, 25 May 2018 02:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jvGj0EYYVLkufOBLVzDsWQNwgVrtixAqZLHinyZqyTA=;
	b=fECznaESSJzUmlzxPK2yFC0L2d3nf+p1Rt9fazQTAro6xF1BTQ7VdnsQ6Yuc0fpQfq
	w4Ok8BDlZoHnaCXYtj/tLgPdW+URxGYKxpB5nDORvaRZkgs+9LyUE4QYMZ6nm2kMRHP5
	x2rZ7ix6YRPVacQsC1FZLyUeAZP8JlxPQ1QWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jvGj0EYYVLkufOBLVzDsWQNwgVrtixAqZLHinyZqyTA=;
	b=IVO0v80r2KaJr4G6L7amqKM56t/kFQEaN0oOT0fof2gBVnBHdVphG0U9teZrSFc/fw
	5OGwUnwTmRNZsii98j2ur1QXhgzn7uciTmBqGGy3fpV5tmhZpLqkvLzF9PFeksEZ1f9t
	EoLpXzzW+Zksw/O0Z/S/RbpUz4Fv+6BkamH5x9OQkT7jvR4pGT3mbm78msO/xFGOZ8Zf
	ZNh7ApUMizfYsF3TO0UiNRucJN9gyBUfq2md9A/roXCh6G+OSfRZ3ehkICJyUbsPnTXU
	IJJHQJIcI9tfQm/qRf8vC44UFdTnMb+KnasFE1XEL2z16Pk0LkNEUmwY7IKvGA6bT+Wy
	oM1g==
X-Gm-Message-State: ALKqPwfNEQeLdCS7l94M6AMxYqArOQP50omxdVwd3KAR0tL96T6a71p6
	EvN25F/E5c9TpRnstV7jYEJESzdmjsoWM4tbMK3kJg==
X-Received: by 2002:a9d:429c:: with SMTP id
	r28-v6mr912909ote.126.1527238865236; 
	Fri, 25 May 2018 02:01:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 25 May 2018 02:00:44
	-0700 (PDT)
In-Reply-To: <5B07CC79.1070905@huawei.com>
References: <1527047633-12368-1-git-send-email-zhaoshenglong@huawei.com>
	<1527047633-12368-2-git-send-email-zhaoshenglong@huawei.com>
	<acca5b80-f527-bc39-0b63-147e53affb4b@redhat.com>
	<CAFEAcA-xbHtxora5TU9psYnBgP0+N8_nznhVppEkg7fmmwip3w@mail.gmail.com>
	<10801e6c-5028-add6-b082-22c5dc9758ca@redhat.com>
	<CAFEAcA-eW_1M42c+Fjt98AgVsnbwjwWap3JZFHNU9f8S0H_qww@mail.gmail.com>
	<38aee779-1baf-ab96-7489-0f34bda2f8e6@redhat.com>
	<CAFEAcA9oCppg2C32vd3YKKmvfO7n1KnFeXG14CV7UHcZpxcTqA@mail.gmail.com>
	<5B07CC79.1070905@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 May 2018 10:00:44 +0100
Message-ID: <CAFEAcA-k4Yz3bfXWsB1fGGoTMV_A016nasyagKrO9TuSObyW6A@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V3 2/2] arm_gicv3_kvm:
 kvm_dist_get/put: skip the registers banked by GICR
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
Cc: Auger Eric <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CFONUHe/n5b7

On 25 May 2018 at 09:42, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> On 2018/5/24 22:56, Peter Maydell wrote:
>> We can fix the gicd_ipriority[] case simply by adding
>>    bmp = GIC_INTERNAL;
>> before the assignment to 'field' in both kvm_dist_get_priority()
>> and kvm_dist_put_priority(). This doesn't affect migration
>> compatibility. We should do this separately from fixing the
>> other bitmaps, because it's simpler.
>>
> If we do bmp += GIC_INTERNAL, we should also add this to offset,
> otherwise we will put the SGI/PPIs data to SPIs, right?

Yes. This code seems remarkably hard to get right, I think
because we effectively have three different things indexing
through the loop -- irq, field, offset -- and they're all
independently set to starting values in different places.

thanks
-- PMM

Received: by 10.182.158.201 with SMTP id ww9csp1863258obb;
        Sat, 19 Dec 2015 11:46:33 -0800 (PST)
X-Received: by 10.140.28.66 with SMTP id 60mr14232157qgy.74.1450554393060;
        Sat, 19 Dec 2015 11:46:33 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b23si7314550qge.114.2015.12.19.11.46.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 19 Dec 2015 11:46:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38455 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aANSa-00020Y-Qw
	for alex.bennee@linaro.org; Sat, 19 Dec 2015 14:46:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58110)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1aANSI-0001iX-MU
	for qemu-devel@nongnu.org; Sat, 19 Dec 2015 14:46:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1aANSH-00021d-P2
	for qemu-devel@nongnu.org; Sat, 19 Dec 2015 14:46:14 -0500
Received: from mail-ob0-x22f.google.com ([2607:f8b0:4003:c01::22f]:35904)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>)
	id 1aANSH-00021X-JN; Sat, 19 Dec 2015 14:46:13 -0500
Received: by mail-ob0-x22f.google.com with SMTP id ba1so8981291obb.3;
	Sat, 19 Dec 2015 11:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=fGKmXaNq1WSWP5eDL364CdHMQZLy2sGwb381ClSOGiU=;
	b=1IibNo/zFkyWYg5fyLVZJhlgpZDDe+tPbEGiRSt9h73Ew25pVPebqPQCX7dn5yYxRb
	aUgbYJ6JhiDx7P7YUFSeECItYWtTQbsV0CjsH19XhoWRv95z7tssJ++JRItc0xFy5dO6
	ztmvh7OCR/4o7AGlakkrtmDxw6G9PYqFzVOyVl1HIm8T+oT3Xt2VupWpJlTwfTfKPl0E
	t/Nr0lzQuJONktu3TAYZcErTqRpIvP+w8xFeGtX8jaVhW74FkmSJQag1M+0T5qrQ7fT9
	cjsQGe4f0onmXpcxUKC1jkeHrY9iHUfjOcdU3nanPx/puroKru1ovd1x1W4BW8sX1sHE
	5vaA==
X-Received: by 10.182.65.5 with SMTP id t5mr2467036obs.28.1450554372992; Sat,
	19 Dec 2015 11:46:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.69.69 with HTTP; Sat, 19 Dec 2015 11:45:53 -0800 (PST)
In-Reply-To: <CAF4BF-SHKWWCZT_uEV39-YphhwVSUqwQpM6UKckUPTe8JAtZ=A@mail.gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-9-git-send-email-mdavidsaver@gmail.com>
	<CAF4BF-SHKWWCZT_uEV39-YphhwVSUqwQpM6UKckUPTe8JAtZ=A@mail.gmail.com>
From: Christopher Friedt <chrisfriedt@gmail.com>
Date: Sat, 19 Dec 2015 14:45:53 -0500
Message-ID: <CAF4BF-QgCY-LgUD6G3uYWCYZg6E0p639qBiNjinbdN6KMh2RZw@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::22f
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH v2 08/26] armv7m: rewrite NVIC
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XM/L2dfHVcad

On Sat, Dec 19, 2015 at 2:08 PM, Christopher Friedt
<chrisfriedt@gmail.com> wrote:
> On Wed, Dec 2, 2015 at 7:18 PM, Michael Davidsaver
> <mdavidsaver@gmail.com> wrote:
>> Expand the NVIC to fully support -M priorities and masking.
>
> Wow - this whole patch series is quite impressive. I was just about to
> start doing a MemManage implementation when I saw this and some
> previous posts on the topic.
>
> Michael, I've previously written an emulator that covers v6M & v7M
> (unfortunately no DSP or floating point - yet). Do you have a branch
> in github that I could track?
>
> I'm sure I could be of some use for feedback and to help get your
> patchset accepted.

I think I found your github tree already: https://github.com/mdavidsaver/qemu

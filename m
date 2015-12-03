Received: by 10.182.158.201 with SMTP id ww9csp176031obb;
        Thu, 3 Dec 2015 11:56:45 -0800 (PST)
X-Received: by 10.55.76.213 with SMTP id z204mr13180096qka.58.1449172605381;
        Thu, 03 Dec 2015 11:56:45 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v11si10085222qka.39.2015.12.03.11.56.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 11:56:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:37194 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4Zzh-0002c6-5K
	for alex.bennee@linaro.org; Thu, 03 Dec 2015 14:56:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4Zz1-0001fR-VA
	for qemu-devel@nongnu.org; Thu, 03 Dec 2015 14:56:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4Zz1-0007iK-8Y
	for qemu-devel@nongnu.org; Thu, 03 Dec 2015 14:56:03 -0500
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:34647)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4Zz1-0007hp-4R
	for qemu-devel@nongnu.org; Thu, 03 Dec 2015 14:56:03 -0500
Received: by vkbs1 with SMTP id s1so52439024vkb.1
	for <qemu-devel@nongnu.org>; Thu, 03 Dec 2015 11:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=TEEkFSOnahUYXCJ1AyiHdfcz/k2OgsSIRxYHkd/93is=;
	b=RkDsK61n+eG0AX+PVpsV8hhjiaQNj8k31Ot432TxrZNZbByBsJur8/CucHhaNYY0wI
	rXQA/d25E3pKJlJb30Ai/azLq1I4IcJ+bDJDDYa7hTW1YRqBqY6gzhy+NJjE/xydsj5N
	lY+jb/4bzb6lHSkOgHmo7R3Lc5fdb0KV4hi3m/9rtGPLNc2CxoemhACmsElIWhMbypUC
	XJYbNUxPMLb32xPklg9eSHLfnmJ+0LfC9PXa1cWohfl9zEakty3obgfTUF7jxbHiBPTS
	l6IKxduOpdkMS8MKFjv4lEzPrJQ/ohtp0QGQ6vX/a1XFBbiyp8n1Wwo6irUkqePsLO3h
	cQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TEEkFSOnahUYXCJ1AyiHdfcz/k2OgsSIRxYHkd/93is=;
	b=GDh0AvrO8JnM7aOzdeguy4eD4nqjZLc55CwsNCvk9acMav4ihEhpPYQ+LMi9K8TEg1
	r4pfYUlO3ntKeibfIm7SZwoCCDDx6oROCn9agOmfiN8zrmSog1mybwKAQMJNMP6LZquV
	heafA0+GwyWqxfJ8URI2uWtx1/LbEAjfznv0b0K0NcAkic7plkC7dS5qkzRaxlAg9woY
	qDPjdixS0ezwyiJNde06urdKuOxkAA6dJF54FGFjX6AvLdxHpkWhwDX5kTMghHO7rnGv
	rrDenyiqDKEXEyBJqJ2Gi7GWegq1rQchDIhhI06uNjJEmc7Ii4zQq8y9Q03+bkl/BbPj
	zINg==
X-Gm-Message-State: ALoCoQmy3Btvf8AKQ3ctQBdOmJjpE82U/U/3cMNDNLbOB2OpRGsw3BqpD23kClBBnny526Ikkz71
X-Received: by 10.31.47.197 with SMTP id v188mr7227026vkv.6.1449172562753;
	Thu, 03 Dec 2015 11:56:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 3 Dec 2015 11:55:43 -0800 (PST)
In-Reply-To: <20151203190057.GB4850@hawk.localdomain>
References: <1448411877-22019-1-git-send-email-drjones@redhat.com>
	<1448411877-22019-7-git-send-email-drjones@redhat.com>
	<CAFEAcA8FDB3KUUyu=3tHsBrfFNo7BxnFJa_-0bQe6=LF3KEs_Q@mail.gmail.com>
	<20151203190057.GB4850@hawk.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Dec 2015 19:55:43 +0000
Message-ID: <CAFEAcA_U2tByvNXA2HgRLUe-1NkKiWpZHUP5p7r5_UnAisokOA@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: Alexander Graf <agraf@suse.de>, QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-devel] [PATCH v2 6/6] target-arm: dump-guest-memory: add
 fpregset notes
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
X-TUID: bsSBTpiYHK8Q

On 3 December 2015 at 19:00, Andrew Jones <drjones@redhat.com> wrote:
> On Thu, Dec 03, 2015 at 12:27:34PM +0000, Peter Maydell wrote:
>> Do consumers care if we write out a dump with FP register
>> state for a CPU which doesn't implement FP? (For AArch64
>> FP is always present, but for AArch32 it may not be.)
>
> I don't know, but it should be easy to avoid writing them when FP
> isn't present, based on some status, so I'll look into doing that.

if (arm_feature(env, ARM_FEATURE_VFP)) is probably what you want.

thanks
-- PMM

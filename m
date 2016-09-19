Received: by 10.80.163.71 with SMTP id 65csp757172edn;
        Mon, 19 Sep 2016 11:09:14 -0700 (PDT)
X-Received: by 10.200.42.236 with SMTP id c41mr31913644qta.121.1474308554155;
        Mon, 19 Sep 2016 11:09:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c68si18686756qkd.159.2016.09.19.11.09.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Sep 2016 11:09:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57391 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bm30D-0001gK-E4
	for alex.bennee@linaro.org; Mon, 19 Sep 2016 14:09:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bm306-0001eX-AY
	for qemu-arm@nongnu.org; Mon, 19 Sep 2016 14:09:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bm305-0003bc-8n
	for qemu-arm@nongnu.org; Mon, 19 Sep 2016 14:09:06 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:34834)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bm305-0003b2-3c
	for qemu-arm@nongnu.org; Mon, 19 Sep 2016 14:09:05 -0400
Received: by mail-vk0-x22c.google.com with SMTP id g9so3270919vkg.2
	for <qemu-arm@nongnu.org>; Mon, 19 Sep 2016 11:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pXSE0/xf9CR8ad+WArV4CI8jqKSwBL4xxD8l8zsh330=;
	b=B0g0glRUwyMjYYu+lOHAp9dJRqghuPVDYVWxaBkJiPOjRG6bX6tHcTz50nH7/4n7Ea
	HGm/n5V+1Xr6XV0MC4qkTRKXNKpS2b22AXUcBDhIoAjt2ksnsc/PgvRMMgtprEuh3LpD
	4T62rSeFKbA+HKYwxy8ng1NhK4OBkzVfS03wY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pXSE0/xf9CR8ad+WArV4CI8jqKSwBL4xxD8l8zsh330=;
	b=Q+uFwH4w7G2z5EApwdJW7RNKgdiWoqgbZO+VIEzD8jLpolt0/IzWILEq05MNdWsXe7
	k0MEaYW44uCzuETP24msCC8sMBzwbUy0/5sKeGpzEHKQQu/XUsDGw9mNyTYZw/YUhKMa
	ZV8pEtaWIoxpKctNTZY/Nz1aUyDF7Jz8AHE3mbS56ThksiEYMUITJcBttnmFzynn2B/G
	JaMEW4BnridrQe2TJ0vPUd4q4j/PLLVH4PoqCJlfMB16ZU85HBU5ifoj/v+4WY9eN1DI
	t/7xkP9cJP3LXpK1Zk/HxuknPsacKu/dbXtPF7jn7eWwHLaNziqTqr/B1GGoWcrROQ1z
	UPGg==
X-Gm-Message-State: AE9vXwOXNPYI0Hj4x96dq/RiZlzWIvvHrq2FWyn0sE9+8GqDFj88OIu+2scV/7lM3+WJkillZzWV0bCd5ryfwGf3
X-Received: by 10.31.94.142 with SMTP id s136mr316616vkb.3.1474308544116; Mon,
	19 Sep 2016 11:09:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Mon, 19 Sep 2016 11:08:43 -0700 (PDT)
In-Reply-To: <cover.1469727764.git.alistair.francis@xilinx.com>
References: <cover.1469727764.git.alistair.francis@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Sep 2016 19:08:43 +0100
Message-ID: <CAFEAcA_PWX=6HhzP2nBOn6kF6oMu0ZyDry4N4BCBcv7UQKiN2w@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Subject: Re: [Qemu-arm] [PATCH for-2.8 v4 0/6] Add support for Cadence GEM
 priority queues
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d6Inaes6ViJr

On 28 July 2016 at 20:00, Alistair Francis <alistair.francis@xilinx.com> wrote:
>
> This patch series adds initial priority queue support to the Cadence GEM
> device. This is based on original work by Peter C, that has been ported
> to the latest version of QEMU.
>
> There is more GEM work that I'd like to upstream after this, but I
> figured this a good place to start. I have done limited testing on the
> Xilinx machine, including running some of our GEM regressions, although
> they don't cover everything. I can't really think of too many other test
> cases that I can run at the moment.

Hi -- I just found this in a random mail folder I forgot to check
very often -- I'm guessing it's still relevant and I should review/apply
it to target-arm.next?

thanks
-- PMM

Received: by 10.80.163.71 with SMTP id 65csp759744edn;
        Mon, 19 Sep 2016 11:17:28 -0700 (PDT)
X-Received: by 10.55.184.198 with SMTP id i189mr29176667qkf.96.1474309047963;
        Mon, 19 Sep 2016 11:17:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y84si20775702qka.218.2016.09.19.11.17.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Sep 2016 11:17:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57441 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bm38B-0007df-9d
	for alex.bennee@linaro.org; Mon, 19 Sep 2016 14:17:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bm383-0007bY-CT
	for qemu-arm@nongnu.org; Mon, 19 Sep 2016 14:17:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bm381-0007aZ-Kd
	for qemu-arm@nongnu.org; Mon, 19 Sep 2016 14:17:18 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:34828)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1bm381-0007a0-Go; Mon, 19 Sep 2016 14:17:17 -0400
Received: by mail-oi0-x241.google.com with SMTP id n202so962857oig.2;
	Mon, 19 Sep 2016 11:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=6gM+GKY3qzqkQibKAfhNuPJGRZPk6hoMMST7br26vOE=;
	b=NgucUF2+1DRkQ/su6ZklZsujqi5Y9KasPvTsjNWstWptP5oHH2UliL4YZgx+8NOLAb
	kfsbtsJzC2PXUJESPNup8On3IKnv/dqcBczcYHPmL7dsB5kznTvSlzsI1bw55bs7XrFQ
	ohG2WlR5tJzmqgvcTDG5rCmbbuG8wTf1eGm8v1xxT48WI/njXu7un0JOOTi6DzlH8bOM
	E3Uu17rH+Ad1P2q6mmSbaDGSPdRW1MwJ/qGHE7E11f02bJ/yWOr8SbHbPkY6DGUNLgWe
	XVVPFADUXXMeKUq/uDaY4LDvgelzMbQEofSs65QU4K3u+7dnl0WkyIVq92F1qR5GSjks
	uK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=6gM+GKY3qzqkQibKAfhNuPJGRZPk6hoMMST7br26vOE=;
	b=GZh0fzH8wN/0yB8ZhCRoctq0nVmKKo1c5V0L1znaEs5jWSML6NMCtA96JyXwN1PCzL
	k6mPNJlNhPKudVZga0Al7um32h8EDC0aTJL3guW1WWQqag339yDys3todCtsXuSQDQpn
	L/H/OjFFvffJXh+LabXFGDueGaaGOp0xAddM2CbhvR8oNU62FsXE2y6amxwjSIC6IDa1
	lfMJ/9MtUac2u0uHwBfsYgyQc7sB0Te9PjzP0NuoY4ujXXmWay/xNlZggeooUtvFkdVR
	7RMzhiQgpke1JtpE07fNuBJ2LSO9U0f8f18+I7f6fZXiOI6McJ/qzvPglzNKJp9MVe1x
	MO2Q==
X-Gm-Message-State: AE9vXwMxWBpLhwXrqtbXb2DJwdgu3QfhDHrMm7ClWVqWe/8yMAIU3Ol3Nu12eBYAGjtHL643JNoJWoEmkuHFCQ==
X-Received: by 10.202.168.209 with SMTP id r200mr30813372oie.33.1474309036831; 
	Mon, 19 Sep 2016 11:17:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.181.7 with HTTP; Mon, 19 Sep 2016 11:16:46 -0700 (PDT)
In-Reply-To: <CAFEAcA_PWX=6HhzP2nBOn6kF6oMu0ZyDry4N4BCBcv7UQKiN2w@mail.gmail.com>
References: <cover.1469727764.git.alistair.francis@xilinx.com>
	<CAFEAcA_PWX=6HhzP2nBOn6kF6oMu0ZyDry4N4BCBcv7UQKiN2w@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 19 Sep 2016 11:16:46 -0700
X-Google-Sender-Auth: ePOSZOPXScH38ghau2nFSXjD5yA
Message-ID: <CAKmqyKPCoeoM945hsokDUWPvfaRJxYg=ve5DWZebuDqwfc8PyA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.8 v4 0/6] Add support for
 Cadence GEM priority queues
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
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rL0hQTvZLJGA

On Mon, Sep 19, 2016 at 11:08 AM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> On 28 July 2016 at 20:00, Alistair Francis <alistair.francis@xilinx.com> wrote:
>>
>> This patch series adds initial priority queue support to the Cadence GEM
>> device. This is based on original work by Peter C, that has been ported
>> to the latest version of QEMU.
>>
>> There is more GEM work that I'd like to upstream after this, but I
>> figured this a good place to start. I have done limited testing on the
>> Xilinx machine, including running some of our GEM regressions, although
>> they don't cover everything. I can't really think of too many other test
>> cases that I can run at the moment.
>
> Hi -- I just found this in a random mail folder I forgot to check
> very often -- I'm guessing it's still relevant and I should review/apply
> it to target-arm.next?

Yes, you fully reviewed it during the 2.7 freeze. It should be ready
to apply to master now.

Thanks,

Alistair

>
> thanks
> -- PMM
>

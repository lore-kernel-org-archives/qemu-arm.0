Received: by 10.80.163.71 with SMTP id 65csp1155486edn;
        Tue, 20 Sep 2016 11:22:20 -0700 (PDT)
X-Received: by 10.200.46.76 with SMTP id s12mr35789566qta.126.1474395740304;
        Tue, 20 Sep 2016 11:22:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 92si25011202qkw.300.2016.09.20.11.22.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Sep 2016 11:22:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37359 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bmPgR-0003pC-Ms
	for alex.bennee@linaro.org; Tue, 20 Sep 2016 14:22:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bmPgN-0003os-QT
	for qemu-arm@nongnu.org; Tue, 20 Sep 2016 14:22:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bmPgL-00052Z-M2
	for qemu-arm@nongnu.org; Tue, 20 Sep 2016 14:22:14 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:35047)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1bmPgL-00052O-HR; Tue, 20 Sep 2016 14:22:13 -0400
Received: by mail-oi0-x244.google.com with SMTP id n202so2055542oig.2;
	Tue, 20 Sep 2016 11:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=t8T5X7rKUlz3TF3Bx0x62BaYLmHs/OW3ThIvRVFPymY=;
	b=OVBeGxinfSH6T1Q1SvXVdr4nnEnmy6mN73lEPg+Z/sAZ87joYJJkeraC1FXis4vEqv
	UoKjQar0s3x+9rGoLbMVleURsy4gb6UDwE9Sz5epVYLYftVtqVqXxPjDYUhd+K8eyL0a
	1C7vzXc21mVckKoi8k+7quD+D8BXdLtA3tUlCSpdLhr9kZD52qrFIHYGdIfuq8vb/P9I
	YpC215FswjuZmK1q2N4BKsskWxn5JNQm/F8ivULffKbzIWEXGu1iI8h7GWouo9k5XeXw
	XAZZXz8vr5pmm9g5vaz3OcJ8hAZ9buuJVbGXr7A8IB0hZ0nbb5zchbyZzwy5J6mqg+vR
	wAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=t8T5X7rKUlz3TF3Bx0x62BaYLmHs/OW3ThIvRVFPymY=;
	b=jbx5Ils+7fEHL62NT1nnZb2wpPZ+Ne/6qHVTPkQkNjcZxdoPJhnoMv3MM46ISLb3Pj
	IhmV9Z5y+9y9h5LPkzkOkNLiI6yj9xlxXRT1xPlm9kA5QP2+J7hV+XojL6U6qQLu6+k6
	iEf8H0Rjfjzuqu0X5Fd2tHPNwNj4waZiwxPrHFSgX6wuHH/ivCUQIWyf9TmpHxH+43zi
	KqGMBBD46C6br0eynB68anlAN3xCrx5kQE8qL/aMcT/soVvwj7JQCnIZUCYPV+Gx5Bex
	7G4kAieVfpA2CW3+EhMUrezgQhY5yEX0TlQb6pVpxESDe9mnNyU4+On1333mx3qRCKEx
	fDMg==
X-Gm-Message-State: AE9vXwNsoV4cslrUh+ZXxPUgewUz6PLikSMrmUO9vVQ10XHaeV5w/FiUFMpr3RTLgC3WpGgmvDy+i35ltJhSiQ==
X-Received: by 10.202.114.23 with SMTP id p23mr38615083oic.132.1474395732627; 
	Tue, 20 Sep 2016 11:22:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.181.7 with HTTP; Tue, 20 Sep 2016 11:21:42 -0700 (PDT)
In-Reply-To: <CAFEAcA9QtrQT4xTX_KTtxM7sPKGVZy-SrnemFgCOn7Yk+JqdaA@mail.gmail.com>
References: <cover.1469727764.git.alistair.francis@xilinx.com>
	<CAFEAcA_PWX=6HhzP2nBOn6kF6oMu0ZyDry4N4BCBcv7UQKiN2w@mail.gmail.com>
	<CAKmqyKPCoeoM945hsokDUWPvfaRJxYg=ve5DWZebuDqwfc8PyA@mail.gmail.com>
	<CAFEAcA9QtrQT4xTX_KTtxM7sPKGVZy-SrnemFgCOn7Yk+JqdaA@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 20 Sep 2016 11:21:42 -0700
X-Google-Sender-Auth: 9_iPW3urNUWZfuFxTj2HeovI0Ow
Message-ID: <CAKmqyKPArHUAoRqsr8KDotQPz_QJQdGCjfxXB3NsyosxoQOcAQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::244
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
X-TUID: EQg8ayqSWE54

On Tue, Sep 20, 2016 at 10:30 AM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> On 19 September 2016 at 19:16, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>> On Mon, Sep 19, 2016 at 11:08 AM, Peter Maydell
>> <peter.maydell@linaro.org> wrote:
>>> On 28 July 2016 at 20:00, Alistair Francis <alistair.francis@xilinx.com> wrote:
>>>>
>>>> This patch series adds initial priority queue support to the Cadence GEM
>>>> device. This is based on original work by Peter C, that has been ported
>>>> to the latest version of QEMU.
>>>>
>>>> There is more GEM work that I'd like to upstream after this, but I
>>>> figured this a good place to start. I have done limited testing on the
>>>> Xilinx machine, including running some of our GEM regressions, although
>>>> they don't cover everything. I can't really think of too many other test
>>>> cases that I can run at the moment.
>>>
>>> Hi -- I just found this in a random mail folder I forgot to check
>>> very often -- I'm guessing it's still relevant and I should review/apply
>>> it to target-arm.next?
>>
>> Yes, you fully reviewed it during the 2.7 freeze. It should be ready
>> to apply to master now.
>
> Applied to target-arm.next, thanks (and sorry about the delay).

Great! No worries, I should have reminded you.

Thanks,

Alistair

>
> -- PMM
>

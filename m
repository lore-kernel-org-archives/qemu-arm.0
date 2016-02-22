Received: by 10.25.208.211 with SMTP id h202csp1320331lfg;
        Mon, 22 Feb 2016 10:08:53 -0800 (PST)
X-Received: by 10.140.25.161 with SMTP id 30mr35885592qgt.73.1456164533059;
        Mon, 22 Feb 2016 10:08:53 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 128si30412431qhw.119.2016.02.22.10.08.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 10:08:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51025 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXuuf-0006R1-MV
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 13:08:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aXuuN-0005tx-Nc
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 13:08:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aXuuM-0004Li-UO
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 13:08:31 -0500
Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229]:34298)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1aXuuM-0004LX-Ar; Mon, 22 Feb 2016 13:08:30 -0500
Received: by mail-oi0-x229.google.com with SMTP id m82so60595151oif.1;
	Mon, 22 Feb 2016 10:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vZTKe/vsImiJgtG01mvZom+1aw10lmRD91MP+EhqHiM=;
	b=DAPROhCY2fbvu6CPOcx4JofxXkOdOENBJIx1aUEd+943BIA4GD9YVt3g9oO1+wnWrP
	p0VBAs0HyHQUdcN3I7i2Oq3YLK0nt32slyeb+JkegwwtXJilQtk3HA5iTWmZ2qorO9E3
	fFaK/rshSl0k49yayssrPt2WWkwuqn+ADX2p8oalOq0d8/nLiDIoCYOPI3NaHlmPmotz
	uRAB3dq2LgxYkRzD34KcXZdid9L6gZoHWUZpOqYjMKkZXS2FcCcyjlOSPQ7k32WuDdGU
	JDbI+jJDoFJSE5oaGfceRvgJ7NVJcnJyFW6/aI/rDu//hFXRZhcQ6qoDm9lOmg643dta
	LBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vZTKe/vsImiJgtG01mvZom+1aw10lmRD91MP+EhqHiM=;
	b=MDH3FBj4J7QIth93GIll9P07vgWeiPGh03dM6KxEb0KE4N0qYijuXoGQwE4skrxb9z
	KONykSFiQlScG88g6M+v5UppWsIX57uC1kJLWTQzTwxerxGSqiBVFoGkRMeVTE8Dw53L
	+7OqxVlarh/yZLXdLPDOpqRs2Wux6bFMfL5t6SO5aUYcrEkUroNPjh4Y3gGDuuuwaS1D
	CQlNWc5CvsCUeZMRnjYI95Z39qxnmJM1hloMTGoFdjHJpb+l1njVvdEMGnfWbMTSANzV
	es8wYj1oLsAPvxWgsdCkQJYNj4Pxuis7zHpiXyWq0AQqOfjH3I+aowsajYVnJ2GaiaO0
	ZF3g==
X-Gm-Message-State: AG10YOTjqF0D5lv83spzC97udqrMcSQGNv4jbhJED+53vTAbxO2MryfarEl1AsHOTfb9rQEaqROGNf6lL5+dYA==
X-Received: by 10.202.63.86 with SMTP id m83mr23342136oia.76.1456164509738;
	Mon, 22 Feb 2016 10:08:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Mon, 22 Feb 2016 10:08:00 -0800 (PST)
In-Reply-To: <1455892784-11328-2-git-send-email-peter.maydell@linaro.org>
References: <1455892784-11328-1-git-send-email-peter.maydell@linaro.org>
	<1455892784-11328-2-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Feb 2016 10:08:00 -0800
Message-ID: <CAKmqyKN6=Oajgahi22eHU=zyoQqquj+bQ9-n8qGL2zVG91TB0w@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::229
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/2] target-arm: Fix handling
 of SDCR for 32-bit code
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xboCAMC6ePBS

On Fri, Feb 19, 2016 at 6:39 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> Fix two issues with our implementation of the SDCR:
>  * it is only present from ARMv8 onwards
>  * it does not contain several of the trap bits present in its 64-bit
>    counterpart the MDCR_EL3
>
> Put the register description in the right place so that it does not
> get enabled for ARMv7 and earlier, and give it a write function so that
> we can mask out the bits which should not be allowed to have an effect
> if EL3 is 32-bit.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  target-arm/cpu.h    |  4 ++++
>  target-arm/helper.c | 23 +++++++++++++++--------
>  2 files changed, 19 insertions(+), 8 deletions(-)
>

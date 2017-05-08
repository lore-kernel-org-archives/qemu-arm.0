Received: by 10.25.0.198 with SMTP id 189csp1487507lfa;
        Mon, 8 May 2017 11:22:40 -0700 (PDT)
X-Received: by 10.55.76.69 with SMTP id z66mr26099814qka.1.1494267759962;
        Mon, 08 May 2017 11:22:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y5si13404642qkc.328.2017.05.08.11.22.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 May 2017 11:22:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60863 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d7nIt-0008Az-AT
	for alex.bennee@linaro.org; Mon, 08 May 2017 14:22:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1d7nIl-0008Aa-4L
	for qemu-arm@nongnu.org; Mon, 08 May 2017 14:22:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <k.kozlowski.k@gmail.com>) id 1d7nIh-0001IB-U4
	for qemu-arm@nongnu.org; Mon, 08 May 2017 14:22:31 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35693)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <k.kozlowski.k@gmail.com>)
	id 1d7nIh-0001GW-Na; Mon, 08 May 2017 14:22:27 -0400
Received: by mail-wm0-f68.google.com with SMTP id v4so12389683wmb.2;
	Mon, 08 May 2017 11:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=f9nNlv+skx6pzGAiC8gOxieYYRLEVhAYXdE1JK0oZkg=;
	b=DoTwIil6udvH/j9AFyw2M5xIIVPPTfilt8ZQgnLkayC1mqhnjfwiI2bmb947PdHMg7
	fkVBphYc6P1tPWtzep9lQRTbnIaSIM9Ms6LzP6pbF/InMTNJ3x2gXjcWekaMiQ12yn2k
	ls9vvB9afsNdHWdOwODTjhuMl/IJriTOdJR+LW9TT6uffiznNyeeDpIm7z4jYBz+6Y8J
	mm/IzXAYMfxclA8ntccauyx1XlTUqetPVf6vXU0y2uidTM530IO7VCSyUQylPb8W9XPz
	+iVLBX+y80b6pVzYRHLl9lOEhHMXnVEhgNsZqX6scZEj9/qlSJCa7MF7s+88KDqV70Ky
	DTpw==
X-Gm-Message-State: AN3rC/7eYipOhjHN5D68EN2Ur86l6CgZvUqFiG3UrdyyaFI5YqEoQLx/
	twJZszH+tZ/+gbmszcM=
X-Received: by 10.80.214.25 with SMTP id x25mr19969824edi.13.1494267746543;
	Mon, 08 May 2017 11:22:26 -0700 (PDT)
Received: from kozik-lap (pub082136089155.dh-hfc.datazug.ch. [82.136.89.155])
	by smtp.googlemail.com with ESMTPSA id
	i28sm4525530ede.38.2017.05.08.11.22.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 08 May 2017 11:22:26 -0700 (PDT)
Date: Mon, 8 May 2017 20:22:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20170508182224.dfbvmfb4fxfbe3ys@kozik-lap>
References: <20170507113540.8687-1-krzk@kernel.org>
	<20170507113540.8687-4-krzk@kernel.org>
	<f8b021fa-e3f8-50d7-8013-d67e66e25ce6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f8b021fa-e3f8-50d7-8013-d67e66e25ce6@redhat.com>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] hw/arm/exynos: Add support
 for system poweroff
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GuhtKrOZ77yt

On Mon, May 08, 2017 at 09:21:40AM -0500, Eric Blake wrote:
> On 05/07/2017 06:35 AM, Krzysztof Kozlowski wrote:
> > On all Exynos-based boards, the system powers down itself by driving
> > PS_HOLD signal low.  Handle writing to respective PMU register to fix
> > power off failure:
> > 
> >     reboot: Power down
> >     Unable to poweroff system
> >     shutdown: 31 output lines suppressed due to ratelimiting
> >     Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000
> > 
> >     CPU: 0 PID: 1 Comm: shutdown Not tainted 4.11.0-rc8 #846
> >     Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
> >     [<c031050c>] (unwind_backtrace) from [<c030ba6c>] (show_stack+0x10/0x14)
> >     [<c030ba6c>] (show_stack) from [<c05b2800>] (dump_stack+0x88/0x9c)
> >     [<c05b2800>] (dump_stack) from [<c03d3140>] (panic+0xdc/0x268)
> >     [<c03d3140>] (panic) from [<c0343614>] (do_exit+0xa90/0xab4)
> >     [<c0343614>] (do_exit) from [<c035f2dc>] (SyS_reboot+0x164/0x1d0)
> >     [<c035f2dc>] (SyS_reboot) from [<c0307c80>] (ret_fast_syscall+0x0/0x3c)
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  hw/misc/exynos4210_pmu.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> 
> > @@ -397,6 +398,12 @@ typedef struct Exynos4210PmuState {
> >      uint32_t reg[PMU_NUM_OF_REGISTERS];
> >  } Exynos4210PmuState;
> >  
> > +static void exynos4210_pmu_poweroff(void)
> > +{
> > +    PRINT_DEBUG("QEMU PMU: PS_HOLD bit down, powering off\n");
> > +    qemu_system_shutdown_request();
> 
> Depending on whether your patch lands before or after mine, we'll have
> to update this. It sounds like it is a guest-triggered reset, so my
> patch would have this use SHUTDOWN_CAUSE_GUEST_SHUTDOWN.
> 
> https://lists.gnu.org/archive/html/qemu-devel/2017-05/msg01380.html

Sure, I can rebase and fix the difference once your patchset gets in.

Best regards,
Krzysztof


Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp721400wrt;
        Thu, 13 Dec 2018 03:57:52 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VoxggpjiWqa4++acq5ZCefVxHcWJT0BDV8LIcYJkILWnhUfEBBrduirAJiwtMINFgwlXx5
X-Received: by 2002:aca:a57:: with SMTP id 84mr2810337oik.197.1544702272381;
        Thu, 13 Dec 2018 03:57:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544702272; cv=none;
        d=google.com; s=arc-20160816;
        b=r1VehLe7dWAPDn+NgiXQNiYdRfvNNLcXkQvVE1HxqP9pe3cPVRKTKbpsNjEOq/jh3a
         c36XdYsAzu4sXlcjisyHbcSozWKCv8fgA9N/0UzxAy6jMnAzWP1DZHHu5Y7vn7+56ZQH
         mTI00WiYvpR3z6o9zIMRNfQgWdNa+/nXnuuA+bWzNOFK9x2iS5tI6opbvHVmwa+GCNVU
         x0FIrNZjsYPO8tKCZhWBskTkT+DIURTAM2YcfvwyhLEtqVpZc0aiSM3ENSUAsccVF3DY
         O0QLWkQBofJTYglsB6i5Wp93FgbaZeuWKVX/ph5VXLvPL5Mzt4ZBT4T1KuhEYNdcQyYZ
         GTYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date;
        bh=D3oo4YAgjS0T7SEIMzhisNUiyakVxv2DBbLBz1nq5Js=;
        b=zh1FyDwdSfnRbtV4lO7/MY2avvcuwRiZHsy769/n6vKHzoJ7YrJG6Qgk0Ta6uzitUm
         byZoDtswFjKGUCIR2IIFwsmP9FJ3v+pFZ4L9I2gQweHEw3aMAanYGzbHKfR9thZ/Ihrq
         vWDdupvs8uVZCXVU33QFyjL8kT78GUwJcwMoE70hS5GxGMi90TArz33CLeiSZNW12ah6
         4JDgL0G6kzNJz/r3mCUucVo2HVKzeM2Q7ugDEEihxaHkSiKPo0Qw9wvhB0PQSqNmPS8G
         /MJH3e6ih4zE0t2wLkZYepYHH47GZ1Do04W6tWcdDkwQB3ywIX1o3R+WxQ4twyhZu6UJ
         I81w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of mark.rutland@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=mark.rutland@arm.com
Return-Path: <mark.rutland@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.101.70])
        by mx.google.com with ESMTP id w16si670820otl.261.2018.12.13.03.57.51;
        Thu, 13 Dec 2018 03:57:51 -0800 (PST)
Received-SPF: pass (google.com: domain of mark.rutland@arm.com designates 217.140.101.70 as permitted sender) client-ip=217.140.101.70;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of mark.rutland@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=mark.rutland@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AF50A78;
	Thu, 13 Dec 2018 03:57:51 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A9D23F575;
	Thu, 13 Dec 2018 03:57:50 -0800 (PST)
Date: Thu, 13 Dec 2018 11:57:45 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, ard.biesheuvel@linaro.org,
	marc.zyngier@arm.com
Subject: Re: [PATCH  v1 0/2] Fix kvm guest debugging of AA32 guests on AA64
Message-ID: <20181213115745.ronekr5cz67nap4b@lakrids.cambridge.arm.com>
References: <20181213115503.24188-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181213115503.24188-1-alex.bennee@linaro.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-TUID: ACTLaeSy1WWF

Hi Alex,

On Thu, Dec 13, 2018 at 11:55:01AM +0000, Alex Bennée wrote:
> Hi,
> 
> This is an attempt to fix debugging of AArch32 binaries when running
> under KVM on AArch64 hardware. There are two parts to this, the first is
> a handling the possibility of AArch32 software breakpoints with a
> heuristic based on the current execution mode. The second part is
> delaying the setup of aarch64 debugging until the shared arm_cpu_realize
> function is run by which point we have parsed and decoded the actual
> execution mode of the guest. This doesn't solve the problem of split
> mode guests which switch between an AA64 EL1 and an AA32 EL0 though.
> 
> I still ran into a problem with single-step. Even with Mark's
> single-step fixup series:
> 
>   To: linux-arm-kernel@lists.infradead.org
>   Cc: kvmarm@lists.cs.columbia.edu,
>   Subject: [PATCH 0/2] kvm/arm: make singlestep behaviour consistent
>   Date: Fri, 9 Nov 2018 15:07:09 +0000
>   Message-Id: <20181109150711.45864-1-mark.rutland@arm.com>
> 
> some instructions do single-step but sometimes the single-step doesn't
> return leading to a runaway until it hits a breakpoint. I'm not sure why
> this is the case because the SS state machine shouldn't be instruction
> sensitive.

Could you please give an example sequence where this occurs? I'd be
happy to take a look.

Thanks,
Mark.

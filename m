Received: by 10.25.208.211 with SMTP id h202csp2136993lfg;
        Wed, 2 Mar 2016 04:33:36 -0800 (PST)
X-Received: by 10.140.107.74 with SMTP id g68mr32568004qgf.82.1456922016498;
        Wed, 02 Mar 2016 04:33:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r7si34545288qhc.78.2016.03.02.04.33.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Mar 2016 04:33:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:56026 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ab5yB-0008SE-SB
	for alex.bennee@linaro.org; Wed, 02 Mar 2016 07:33:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ab5y5-0008Rs-Sw
	for qemu-arm@nongnu.org; Wed, 02 Mar 2016 07:33:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ab5y5-0002cK-2L
	for qemu-arm@nongnu.org; Wed, 02 Mar 2016 07:33:29 -0500
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:35347)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ab5y4-0002cB-UD
	for qemu-arm@nongnu.org; Wed, 02 Mar 2016 07:33:28 -0500
Received: by mail-vk0-x232.google.com with SMTP id e6so199512629vkh.2
	for <qemu-arm@nongnu.org>; Wed, 02 Mar 2016 04:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Zq8cPB/1ir891AyxpLPOmhN7aFq5ggk9ANRIE7au83U=;
	b=fcUQGyto3Vj7u7SxmHIFmDPklCWL92RpEEpsWpIGBx5vrDhgZpYipmijSTHuTFBziH
	gKm4JDWTrzuhQjm63/4wWjBWt2SMjBsdEIxVPOZf0cHOcRc8ZyHzXOWRK3DmOPJcXYAV
	+JvukysNGvHN7VG9Y8+gEASzpLMzhvp8TSlno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Zq8cPB/1ir891AyxpLPOmhN7aFq5ggk9ANRIE7au83U=;
	b=gfOxjidWigyWdgCIoK2GeYDUyQDJonTsqlsBnIubWIG0ZCBpMsWw0EHzOHMwqF5J59
	8+ZzCrvxOE8idQBE6/Q8QN3LUkq7+u8IU2E0rT9yvPMd+MVbpBsjen898trwoUrufiSO
	Hp7W3iUC0WftXAC5czRHH7/P6D3OpH60UAMDaG9mwRPcUtjQadi0vYtYnQeWPwgSPHRn
	/J+AIBWmiQ0qDjwx8xAR04MMO2d3rhBLbDJHZ/zOyS5/h15P7/PzPhffGlqTLPRWRMBM
	ZLaHcwTtzrGrMLkItriDTAVJEq+1QaDtCvvkxr+sAiiGYjpcZam8EQORWN8VT0UixPS1
	EaEw==
X-Gm-Message-State: AD7BkJI4y98RV8DeiWtqHWZGXi7IpnHo8bSrnnaoHnG8wVEI5bC4WsZ8f41nC1AdQLjCKumM7BE845Ix/5rdb4NZ
X-Received: by 10.31.180.85 with SMTP id d82mr16821457vkf.83.1456922008281;
	Wed, 02 Mar 2016 04:33:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Wed, 2 Mar 2016 04:33:08 -0800 (PST)
In-Reply-To: <BLUPR0301MB20348F5E58AD95D26649F04C9EBC0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1456532174-17432-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1456532174-17432-4-git-send-email-Andrew.Baumann@microsoft.com>
	<CAFEAcA9qA_xDy52wVF8wzxxdVVg2MgLbHPcJh4z9de-3Dh-r2g@mail.gmail.com>
	<BLUPR0301MB20348F5E58AD95D26649F04C9EBC0@BLUPR0301MB2034.namprd03.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Mar 2016 12:33:08 +0000
Message-ID: <CAFEAcA-Q5vD+S8UC3-OiiF4rr=RvdGmet8Gj=AETxvDUH6gAQA@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Cc: =?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 3/4] bcm2835_fb: add framebuffer device for
	Raspberry Pi
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
X-TUID: bMh4NjZHdpnS

On 2 March 2016 at 00:19, Andrew Baumann <Andrew.Baumann@microsoft.com> wrote:
>> From: Peter Maydell [mailto:peter.maydell@linaro.org]
>> More interestingly, why can't you just read from the source
>> pointer you're passed in here? The framebuffer_update_display()
>> code should have obtained it by looking up the location of the
>> host RAM where the guest video RAM is, so if you ignore it and
>> do a complete physical-address-to-memory-region lookup for every
>> pixel it's going to make redraws unnecessarily slow.
>
> That is what's happening for the 16-, 24- and 32-bit modes. For
> 8-bit, it appears to be doing a palette lookup (using the 8-bit
> value at the pointer as an index into the 256-colour palette
> starting at vcram_base).

Oh, right, it's a palette lookup. That's fine, then. A
comment mentioning that this is doing palette lookup would
help. I wouldn't worry about efficiency for this mode because
who's using 8-bit colour in 2016 ?

thanks
-- PMM

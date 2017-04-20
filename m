Received: by 10.25.0.144 with SMTP id 138csp760955lfa;
        Thu, 20 Apr 2017 07:30:36 -0700 (PDT)
X-Received: by 10.200.52.85 with SMTP id v21mr8563936qtb.155.1492698635938;
        Thu, 20 Apr 2017 07:30:35 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r25si1085443qki.133.2017.04.20.07.30.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 20 Apr 2017 07:30:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54385 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d1D6R-0008W6-B6
	for alex.bennee@linaro.org; Thu, 20 Apr 2017 10:30:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d1D5G-0007f7-HB
	for qemu-devel@nongnu.org; Thu, 20 Apr 2017 10:29:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d1D5F-0002kV-EE
	for qemu-devel@nongnu.org; Thu, 20 Apr 2017 10:29:22 -0400
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:38401)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1d1D5F-0002jr-7N
	for qemu-devel@nongnu.org; Thu, 20 Apr 2017 10:29:21 -0400
Received: by mail-wm0-x22d.google.com with SMTP id r190so49999964wme.1
	for <qemu-devel@nongnu.org>; Thu, 20 Apr 2017 07:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eUE1e0G2ePMvgEzwXTcjgBFx1BfyL3FeGGwek4Rdkh4=;
	b=SSxTcW4S2tCbrHyAnWW0B7wrJmp5x/lOqaDewYIFwh6XwTLfMnBGQ+Mqpvkkk+aRpH
	IE/II7BsQBvWYbyf3v8NlCuZygAVQkzkjIcxqQDPEQfxNQqiaruHkq4nRHkZyRCyLyWU
	gJO6DwFjW2S5RPlPYCwxBoCYAW211TTjFQIC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eUE1e0G2ePMvgEzwXTcjgBFx1BfyL3FeGGwek4Rdkh4=;
	b=JT6oU7mxnxuLueCGMUPanGf0v0HBV2mJGmOemimebojg5oPS1pIlXZrMwA6Nqrr/Nz
	VstaYjcg5DM5UYJ6/YpRuQo7r/Ux0SZ/Vl4N9JIo9j+bxRtXnkzR8V1jDrTd/JDcMFKp
	hkkoIyYU49edkRjCNrZ8UNvjtCLyi56UPY0vShxQ6A9BBo7ngI7khaX7DEZD5fJmf7e2
	PpgaSCXrsHGCBh5HbiOIaNu8VwsIdw3Lsy4p/uPGbQ3XT7ZHUmVVwMOpLFwFxiu2+2Oj
	XzHGHlUQp6w81j6Tj2e+5PFNJf7qwDI2BUJkBqTYUS8/C+Wz2Kcy9k7WR4Vjm6Zmq2vo
	I+0Q==
X-Gm-Message-State: AN3rC/5iVDTJD2ti/fvQYfUuKeo/bK9lLBQmTH/RVfzDNhk4NHVv7PgO
	6yPBp7vPNXWIDTIKDur2F6kwMU9lm+Jk
X-Received: by 10.28.104.195 with SMTP id d186mr3485049wmc.111.1492698560225; 
	Thu, 20 Apr 2017 07:29:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.68 with HTTP; Thu, 20 Apr 2017 07:28:59 -0700 (PDT)
In-Reply-To: <0f3ee3f1-5d73-79be-2e7d-45c0385c6758@twiddle.net>
References: <1491844419-12485-1-git-send-email-peter.maydell@linaro.org>
	<0f3ee3f1-5d73-79be-2e7d-45c0385c6758@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Apr 2017 15:28:59 +0100
Message-ID: <CAFEAcA_9=zNiJvbbg-Cdc5_rSkA3ySYeo=quP6ApdGG6wibMoA@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-devel] [PATCH v2 0/9] arm: Implement M profile exception
 return properly
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tjvHNrWSZ/GF

On 15 April 2017 at 13:31, Richard Henderson <rth@twiddle.net> wrote:
> On 04/10/2017 10:13 AM, Peter Maydell wrote:
>>
>> Peter Maydell (9):
>>   arm: Don't implement BXJ on M-profile CPUs
>>   arm: Thumb shift operations should not permit interworking branches
>>   arm: Factor out "generate right kind of step exception"
>>   arm: Move gen_set_condexec() and gen_set_pc_im() up in the file
>>   arm: Move condition-failed codepath generation out of if()
>>   arm: Abstract out "are we singlestepping" test to utility function
>>   arm: Track M profile handler mode state in TB flags
>>   arm: Implement M profile exception return properly
>>   arm: Remove workarounds for old M-profile exception return
>>     implementation
>>
>>  target/arm/cpu.h       |   9 +++
>>  target/arm/translate.h |   5 ++
>>  target/arm/cpu.c       |  43 +-----------
>>  target/arm/translate.c | 181
>> +++++++++++++++++++++++++++++++++----------------
>>  4 files changed, 138 insertions(+), 100 deletions(-)
>
>
> Reviewed-by: Richard Henderson <rth@twiddle.net>

Thanks; applied to target-arm.next.

-- PMM

Received: by 10.25.208.211 with SMTP id h202csp1083822lfg;
        Sun, 6 Mar 2016 13:15:05 -0800 (PST)
X-Received: by 10.140.21.232 with SMTP id 95mr24308022qgl.12.1457298905203;
        Sun, 06 Mar 2016 13:15:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x13si13879501qka.33.2016.03.06.13.15.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Mar 2016 13:15:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:52151 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1acg12-0004Vr-21
	for alex.bennee@linaro.org; Sun, 06 Mar 2016 16:15:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1acg0z-0004VJ-J2
	for qemu-arm@nongnu.org; Sun, 06 Mar 2016 16:15:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1acg0y-00070R-Ls
	for qemu-arm@nongnu.org; Sun, 06 Mar 2016 16:15:01 -0500
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:35655)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1acg0y-00070G-9J
	for qemu-arm@nongnu.org; Sun, 06 Mar 2016 16:15:00 -0500
Received: by mail-vk0-x22a.google.com with SMTP id e6so99429377vkh.2
	for <qemu-arm@nongnu.org>; Sun, 06 Mar 2016 13:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=A39W95XrGNZ+GHMdSfgiFlvgnyGEm9UYoiODkOOqzkA=;
	b=fm7yEUzqznyl2TJ47tHs2tJVPx601wpQbie0SEGHrdRJwTnO01A6pA+cAHGKj/cIVu
	eL/hUhcEwC6AcbzK7ulRxz/Jg7i6+PsQLIVhzo/stLEAuasQxBdZ6Vx0ovEh9H2+gYVd
	8+pbhbB0r3epX9bgz2nslIY1XNTVq5AxyFbUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=A39W95XrGNZ+GHMdSfgiFlvgnyGEm9UYoiODkOOqzkA=;
	b=RdKojw///umJNY4KlMc/yovDZgE5P/9074/dUWKOF5VOa9Wgk3VTUHyTlV2mNxBDpJ
	b1qdBAXFZWc+38A8QHHbUcEvb7l3T/ZZUEdFihq+drkU0sYo3QJAzTnN3+/PabTAARuN
	/WThfezW9hVBgIfosIciCKE4mPLFrZNJbRCc8MYWXHT+tVEooabWaTfem97UCOJ7L7gD
	PB06pnBE7a4Sk6hXt6LO6x240qEQy55K21v89R2ndxSueT6TBRbOF2SJGLUhutkwBexe
	6z9ctc/e6EayU6aaq/EgQq1EE18Lcmb/53h03ns7f/5cD56rQWqo8gMOha2ikKaI94e8
	TFTw==
X-Gm-Message-State: AD7BkJL8M9f6XM9/ydtY9fy9lFpmlmSsdXHvaB1FDGFKSdZ9rJehOL8O/5OV4Ys9XEesaHG+Gbg96tIUx9VnMO7J
X-Received: by 10.31.141.2 with SMTP id p2mr17767135vkd.37.1457298899390; Sun,
	06 Mar 2016 13:14:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.96.194 with HTTP; Sun, 6 Mar 2016 13:14:39 -0800 (PST)
In-Reply-To: <56DC7F23.8030104@gmail.com>
References: <20160222222554.GA11598@beta.comsecuris.com>
	<56DC7F23.8030104@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Mar 2016 04:14:39 +0700
Message-ID: <CAFEAcA-h9MfC0xc9jc=nXSnX+AnCZngkdvJd=9nuSN1ndM6d2w@mail.gmail.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Ralf-Philipp Weinmann <ralf+devel@comsecuris.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] Fix bug: SRS instructions would
 trap to EL3 in Secure EL1 even if specified mode was not monitor mode.
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
X-TUID: 1YdHkPXczjLP

On 7 March 2016 at 02:04, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
> On 23.02.2016 01:25, Ralf-Philipp Weinmann wrote:
>>
>> According to the ARMv8 Architecture reference manual [F6.1.203], ALL
>> of the following conditions need to be met for SRS to trap to EL3:
>> * It is executed at Secure PL1.
>> * The specified mode is monitor mode.
>> * EL3 is using AArch64.
>
>
> The code changes in the patch looks good for me. But anyway, you should:
>  (1) tweak the commit message title according to the requirements [1] and
>  (2) add your "Singed-off-by:" line [2]

Ralf-Philipp sent a second version of this email which did
have the signed-off-by line, so this patch is already in
master (as commit ba63cf47a9304113); I did tweak the
commit message as I applied it.

thanks
-- PMM

Received: by 10.25.205.13 with SMTP id d13csp1271507lfg;
        Thu, 12 Jan 2017 06:19:25 -0800 (PST)
X-Received: by 10.200.48.172 with SMTP id v41mr12331018qta.54.1484230765196;
        Thu, 12 Jan 2017 06:19:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y6si6186902qkg.9.2017.01.12.06.19.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jan 2017 06:19:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34286 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cRgDs-0007SH-I6
	for alex.bennee@linaro.org; Thu, 12 Jan 2017 09:19:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40656)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cRg9D-0003YR-52
	for qemu-arm@nongnu.org; Thu, 12 Jan 2017 09:14:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cRg9B-0008IX-BQ
	for qemu-arm@nongnu.org; Thu, 12 Jan 2017 09:14:35 -0500
Received: from mail-ua0-x22a.google.com ([2607:f8b0:400c:c08::22a]:34187)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cRg9B-0008I2-5O
	for qemu-arm@nongnu.org; Thu, 12 Jan 2017 09:14:33 -0500
Received: by mail-ua0-x22a.google.com with SMTP id 35so14913549uak.1
	for <qemu-arm@nongnu.org>; Thu, 12 Jan 2017 06:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fJkZ+n82Dql22BKEUv65aMEXXhBqcGb5vCQsqut89Hc=;
	b=FzFHqtcU82yzoXIbExc0bJ3ern13+WajbhVfSf+sJcLQrCfJQm0AxyuOYbTEQinqdT
	H6YGJvAG4wb0HL9ValwfDzpHq1F8CqO8tDbzLkPMV0Bj52MDFlOxvqYv+P5mTA6kGMhu
	IXtWL9cxr90XSROZkoowoLMUbyOU1Q9pbF8Mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fJkZ+n82Dql22BKEUv65aMEXXhBqcGb5vCQsqut89Hc=;
	b=DHgpo/z4WSSuhvG1mSQHZaMrf9D/4j4qo5cyBznA/AJXal13x+XTScShPUziq/LkC1
	LTVhgyg5MxjbjdZL46TCoTWy6L94QGtS6WUF6YeT5iMCuhgX+sQq31ntFV4qcBuGo4xJ
	jCORjoLfraP4TsQ6tkKwYtFaMESGMOWS+DtOYgdvA91Rkw3/ey8tOLFWkIlr4R790f0U
	7bCQeLW9Xij3Tj9fcicLj46UR0YT9mXFyrvlvYlBiaNAqgRSFyZd8KymgQZMFR8ssrBC
	3yfKu+OMHwgAnsMS47YVm/tV+IAgXM2nq4D8I7lPUvOcc7nyrvRBlAL1Qp9uerbWzyF/
	vJIA==
X-Gm-Message-State: AIkVDXICkST+EKDKg3BnyTCZB00lPnUIj+x1+IfG2ZngGJUeyB452gNnwnpLDy49lWe8w22zkui4b2kSr82z3Ggm
X-Received: by 10.176.3.196 with SMTP id 62mr6589287uau.120.1484230472496;
	Thu, 12 Jan 2017 06:14:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Thu, 12 Jan 2017 06:14:12 -0800 (PST)
In-Reply-To: <CAFEAcA_53j-DGqW7WMzWaofUK9zFmeORUSFNAdHUPFKTZyqZ+Q@mail.gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-2-git-send-email-mdavidsaver@gmail.com>
	<CAFEAcA_53j-DGqW7WMzWaofUK9zFmeORUSFNAdHUPFKTZyqZ+Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jan 2017 14:14:12 +0000
Message-ID: <CAFEAcA9u2MPh7tKoaMwfeMf04VOWnR-ScJhBvnpBNO-7-kkywg@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22a
Subject: Re: [Qemu-arm] [PATCH v2 01/26] armv7m: MRS/MSR handle unprivileged
 access
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
X-TUID: /swaSDzncq4n

On 17 December 2015 at 13:10, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 3 December 2015 at 00:18, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
>> The MRS and MSR instruction handling isn't checking
>> the current permission level.
>>
>> Prevent privlaged from changing writing EPSR fields.
>> Access to unknown/undefined special registers not
>> fatal (read 0, write ignored) w/ guest error message.
>
> This patch and all the others in this series seem to be
> missing your Signed-off-by: line.

Michael has confirmed to me that this was just an oversight.
Cleanup of the NVIC has finally reached the top of my todo
list, so I'm planning to take this patchset and finish
the process of fixing it up to go into master.

thanks
-- PMM

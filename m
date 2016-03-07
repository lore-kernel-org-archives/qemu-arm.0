Received: by 10.25.208.211 with SMTP id h202csp1638180lfg;
        Mon, 7 Mar 2016 15:34:52 -0800 (PST)
X-Received: by 10.55.78.84 with SMTP id c81mr31953319qkb.85.1457393691237;
        Mon, 07 Mar 2016 15:34:51 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v202si12857qka.128.2016.03.07.15.34.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Mar 2016 15:34:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:59185 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ad4fq-0001jr-Pd
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 18:34:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ad4fU-0001Sp-P3
	for qemu-devel@nongnu.org; Mon, 07 Mar 2016 18:34:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ad4fT-0001Ee-N9
	for qemu-devel@nongnu.org; Mon, 07 Mar 2016 18:34:28 -0500
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:35089)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ad4fT-0001EZ-Fi
	for qemu-devel@nongnu.org; Mon, 07 Mar 2016 18:34:27 -0500
Received: by mail-vk0-x234.google.com with SMTP id e6so135922108vkh.2
	for <qemu-devel@nongnu.org>; Mon, 07 Mar 2016 15:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=liTwAuy8CC4PU8ZrZ3f4RQWFEMwLOidaL5NLItjwn+E=;
	b=NjPiZXCVdqUjXrK1Li+K/jvEe4y4Qz64m6y/VvwAqXXer4w3Pe2lPAul7Y7X0q4NZM
	RXE8H0Yzx+aOhYQ+ZVVm7/Do24uqEGGQy2yyLDBX7Hm6py32Pgxp2eJXVNhLa5q14nb/
	8uPAJtA/9TA8U+XukAWJdm7AkN6ereeuudPHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=liTwAuy8CC4PU8ZrZ3f4RQWFEMwLOidaL5NLItjwn+E=;
	b=D6dL7xLMKXgIeM5/Z0NFyy/XXYMr/ZdLlBX8xwglOaFVgYVgqPy+k+x7SbXLzqkArR
	+an20l7G9Hk9610zDi360m+ZMjxco0CqIgluQX5m0VoxYPmOUfcHzm2gHBHEvrT58er4
	XZ9TBc9UDEEKlg4aYbcGmHyNms0cC23hrwKQqFHqUZG30y5urbYVN6c+igHV05KtmOx8
	Rv3PYv5t7rVUwVlXPHzrmBa0tHN2dl4/VN14t19IwSH2o6d+iMUsUA0uTLIkJ1ru6t/Y
	vFYFGF2uNt9Gm7N7gR3udPzUm/pOPzou+2SLBcC9URGuxQu4seRCY1vpdsXF31tQ9mM4
	nqiA==
X-Gm-Message-State: AD7BkJKXKGjp/JmyiH10LFReKUVtWv0RFCpmu+77FbhoQJfbDI1H0VbgmxtcO7sy0XCVjyYSlirio/QfV+zOaDRg
X-Received: by 10.31.194.130 with SMTP id s124mr23397178vkf.92.1457393666738; 
	Mon, 07 Mar 2016 15:34:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 7 Mar 2016 15:34:07 -0800 (PST)
In-Reply-To: <56DD9C58.7050306@redhat.com>
References: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
	<56DD9C58.7050306@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2016 06:34:07 +0700
Message-ID: <CAFEAcA8C2VzkD=87W5Jn7X523cFZLZL6onxjKDoOcZsCPMQxZw@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 0/4] virt: provide secure-only RAM and
	first flash
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6bHSBCtCip57

On 7 March 2016 at 22:20, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 12/02/2016 15:45, Peter Maydell wrote:
>> This patchset adds some more secure-only devices to the virt board:
>>  (1) a 16MB secure-only RAM
>>  (2) the first flash device is secure-only
>>
>> The second of these is strictly speaking a breaking change, but I don't
>> expect it in practice to break anybody:
>>  (a) there's not much use of the secure support in virt yet
>>  (b) anything booting a rom image from that flash if TZ is enabled
>>   will be booting it in Secure mode anyway so will be able to access
>>   the code -- the only thing that would stop working would be if the
>>   guest flipped to NS and still expected to be able to access the flash
>>
>> The second flash device remains NS-accessible (with the expectation that
>> it will be used for NS UEFI environment variable storage).
>
> I think that, if UEFI secure boot is in use, the UEFI environment
> variables should also be only accessible from TrustZone, because they
> store the key database.  At least that's how it works on x86, where both
> pflash devices have the secure=on flag.

If I understand the setup that is being used correctly, UEFI runs
in Non-secure, so making the second flash device secure would mean
it could not access it.

Ard, do I have that right?

thanks
-- PMM

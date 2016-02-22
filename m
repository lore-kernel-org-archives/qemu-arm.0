Received: by 10.25.208.211 with SMTP id h202csp1416049lfg;
        Mon, 22 Feb 2016 14:14:30 -0800 (PST)
X-Received: by 10.55.75.144 with SMTP id y138mr37827083qka.96.1456179270156;
        Mon, 22 Feb 2016 14:14:30 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u4si31474471qka.50.2016.02.22.14.14.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 14:14:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:52351 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXykP-0006MR-Jj
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 17:14:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aXykN-0006KO-Ro
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 17:14:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aXykM-0006CY-O8
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 17:14:27 -0500
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:35859)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aXykM-0006CQ-B7
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 17:14:26 -0500
Received: by mail-vk0-x232.google.com with SMTP id c3so143889282vkb.3
	for <qemu-arm@nongnu.org>; Mon, 22 Feb 2016 14:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=2Ky0ABe/UCvvDyGawvizScWUEgfKuwUCkUxy1qKLjGw=;
	b=kDcEf90e/hrtqHU4LHIxLzJJ3l2DmoN8PuvIN0tQK8cYhAoAfTJ3NWTW1P6zYUbELe
	IDuBfqOJtgNaZONGR6mxuLWDj9IF8zxZS41sRqShs5VIhw5TXEMykTGk6zYT+eAQM09q
	lf0yfvX4zODSeA5tg9pNOMgAvuHqctD7AQnxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2Ky0ABe/UCvvDyGawvizScWUEgfKuwUCkUxy1qKLjGw=;
	b=gQU1H5+50k4WfTN2GUmQxr8XsR9Wy68OzMljvPkNN4/t97WEYMsQyDSt3f5hvSU+C/
	FACndRjhRzjg7a2lX0waZeHMeM7r1TQdFe3PFvnSuKE/1cDqIL0vxSHgSfmx94smWyjC
	ZUQ5ZwIwlzMUvUGwF9rSSpyIK4ICpAUMnjv5FkqA177gu8kMHWo/X1wOmN3e/9bsRehq
	6q1n0IHBUbt1NA/xbbGQT3ObZvy4dZ0ilo/XNtqMbhkZB3OmjQzOTpkfgA5YoCXSduOP
	ThKImhJNFqXm8b06vN5t0mmadt/VOefJh2XEmZrQLZLkj7iIob0aRdMhXAwL69vwgCW8
	YzVQ==
X-Gm-Message-State: AG10YOSck/kzrSA215w0narUHnbCxNFyNkZOe3hfoTr342ljqUYFR+0JDtdCJadwpwTCrqL6ansEfF1I3/Jy0rJm
X-Received: by 10.31.1.6 with SMTP id 6mr22353547vkb.139.1456179262331; Mon,
	22 Feb 2016 14:14:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 22 Feb 2016 14:14:02 -0800 (PST)
In-Reply-To: <1456175198-25210-1-git-send-email-wei@redhat.com>
References: <1456175198-25210-1-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Feb 2016 22:14:02 +0000
Message-ID: <CAFEAcA8vyVL6jyMTGCap9Bu=eyqR2OUN5LzH5Sjo965Fn4PmHA@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>
Subject: Re: [Qemu-arm] [PATCH RFC 0/2] Versioning ARM virt machine types
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
X-TUID: vCEVNFGqrRsu

On 22 February 2016 at 21:06, Wei Huang <wei@redhat.com> wrote:
> We start to see more features been added to ARM virtual machine models.
> For the purpose of backward compatibility (e.g. migration), it is time
> to consider versioning machine types for ARM VMs. As a beginning step, this
> patchset defines an abstract machine type for ARM VMs. The current
> "virt" machine is re-written based on this new machine type accordingly.
> These patches have been verified by booting existing VMs.
>
> Note that I am seeking inputs from the community by putting RFC in the
> subject line. Please let me know your opinions. I will send out V1
> afterwards.

My view here is the same as it has been in the past regarding
adding versioned machine types for 'virt': are you (in this case
Redhat) willing to stand behind it, in the sense of taking on
the maintenance burden of adding new machine versions, reviewing
new code contributions for issues that require changes to make sure
that the old versions stay looking like the old machine, testing
that old versions look right, testing cross version migration,
and so on?

We need versioned machine types at *some* point; my intent here
is to provide sufficient pushback to ensure that we don't give
ourselves the maintenance headache until we truly need it...

thanks
-- PMM

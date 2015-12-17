Received: by 10.182.158.201 with SMTP id ww9csp370064obb;
        Thu, 17 Dec 2015 05:10:58 -0800 (PST)
X-Received: by 10.140.28.97 with SMTP id 88mr66807895qgy.74.1450357858778;
        Thu, 17 Dec 2015 05:10:58 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u143si11260647qka.86.2015.12.17.05.10.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 05:10:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:53546 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9YKg-0007en-Av
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 08:10:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9YKd-0007bc-85
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 08:10:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9YKZ-0001sp-Ek
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 08:10:55 -0500
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:33985)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9YKZ-0001sQ-8d
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 08:10:51 -0500
Received: by mail-vk0-x22d.google.com with SMTP id j66so45872482vkg.1
	for <qemu-arm@nongnu.org>; Thu, 17 Dec 2015 05:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vyNp49n8GiPVed48WsoQVVn39LzOoODrfC7XASSJMoA=;
	b=N57XJJWumpjJkSH+tHIXKrOvw+twgNAkhPjHljzQiEX/Vs6M+GnTUcgQUk0ViFoO7i
	VhDfRmgz3ENNlq+94SLkPwDttckS/AetxvwggWuI3BmFup9yZt0mG6LpceqhYxIFqNhb
	sHPvrm+kDeruC/UQWnC8aQmCpgv6128jhWvdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vyNp49n8GiPVed48WsoQVVn39LzOoODrfC7XASSJMoA=;
	b=dIRvML0IMVrmQK9Ju/gBY8x6SsLa1Hprj2YF5xQJ2tAru4FedTcrgS+zRxrNcUqYG0
	5Bo9jlCmx7GSI2dckFxVNNQBnRFyQ/1LgRDRZT5BczhOvHaMo2xy4mL/O6//oB85krpD
	HltYN+cD08/BjWcHzFws4fgER81JH3HKE6RJf2AAk4qicT/JdeYzOFAOBLwBlq6+tYua
	IR4Tar7aygSD8Md4l02rgknRp8AL+kzh/i/GekMFJKJB67JPOUI3t+xxt+VjZ8r4STLZ
	BAoyWVgiWi+TiTC56GPwN7vhQp6ilpOdDoPSeiPXUyDHOHV5Q3XBhwYv6/3qd4As1hEh
	W0Mg==
X-Gm-Message-State: ALoCoQkHW96SCeMu0sx72p1Loyc00e17bbJlJYMmx1g5wVnAPkYt0KbpOd6BGnoHvGUrXy7/gsNVwa/SXpqbBokC+T0DszjmUhOsPvGmqqwOb8y9PALlMmo=
X-Received: by 10.31.107.138 with SMTP id k10mr17473149vki.27.1450357849706;
	Thu, 17 Dec 2015 05:10:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 17 Dec 2015 05:10:30 -0800 (PST)
In-Reply-To: <1449101933-24928-2-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-2-git-send-email-mdavidsaver@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2015 13:10:30 +0000
Message-ID: <CAFEAcA_53j-DGqW7WMzWaofUK9zFmeORUSFNAdHUPFKTZyqZ+Q@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2 01/26] armv7m: MRS/MSR handle unprivileged
	access
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
X-TUID: 9X11TnMICz59

On 3 December 2015 at 00:18, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> The MRS and MSR instruction handling isn't checking
> the current permission level.
>
> Prevent privlaged from changing writing EPSR fields.
> Access to unknown/undefined special registers not
> fatal (read 0, write ignored) w/ guest error message.

This patch and all the others in this series seem to be
missing your Signed-off-by: line.

(scripts/checkpatch.pl will catch this, among other things.)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

When you send out this patch in future versions of this series,
please include my Reviewed-by: tag in the commit message
after your signed-off-by line; that way I know I don't have
to recheck it. (If a patch changes much after somebody's
reviewed it you should drop the reviewed-by line and say why
in the cover letter.)

thanks
-- PMM

Received: by 10.182.158.201 with SMTP id ww9csp1021469obb;
        Fri, 18 Dec 2015 04:05:26 -0800 (PST)
X-Received: by 10.140.248.70 with SMTP id t67mr4497818qhc.97.1450440326491;
        Fri, 18 Dec 2015 04:05:26 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z71si15950948qka.32.2015.12.18.04.05.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 Dec 2015 04:05:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:59852 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9tmo-0004NT-49
	for alex.bennee@linaro.org; Fri, 18 Dec 2015 07:05:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41105)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9tml-0004LX-Uo
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 07:05:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9tml-0001Vl-7S
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 07:05:23 -0500
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:36024)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9tml-0001TO-3T
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 07:05:23 -0500
Received: by mail-vk0-x230.google.com with SMTP id f2so25355863vkb.3
	for <qemu-arm@nongnu.org>; Fri, 18 Dec 2015 04:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=cRtJthuyH1NQ5oVTz+cr6cCCQTmBYlmFBLPH/1IPe6A=;
	b=Qij94igDbvW7GFYa/V0gfFI3rnlR3vEYch86fP3fNaB3zjd5T8fktMvNjpa/njzdGl
	M1Z1JhjAlRODKNx38hWyPgTJKjdrPiAHoWdch8+EgnhIhPjCZ2oh5mO9sTt0lQoJ7PbC
	mEGgSemBPuGvvZtjxOrkF2JPeFV9gjHcFgI2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cRtJthuyH1NQ5oVTz+cr6cCCQTmBYlmFBLPH/1IPe6A=;
	b=P0VC4UMeTIM+WN8FXMsp5OdghIrbx+HQ8sdnVz1E4luihQEGg+D27Se97FOEApBbA6
	8XT+YiNnO3n4/jS2SlK3Hcj5UnjFflqeGwl4A/jVIPlkT0tDxlh4VcqekKdu9mws/WjV
	SNc1uyv9O1kWn37Y5YeD0ha45XQ0hlt5z1iM2bZFQT7skwNp4lD7YXkOIL50Tfe28HDV
	0u9xWk6DMcH9+mGJjv6lrTK7YT7zj4yzheT5Vd0UyJidwvoIBXpuJ7Vuc6U8gZ2fHJyA
	Xo/BwU78hIB6oVV2/tvfiIfEuv2fFlBzyJXmvVaVXStypMoS+7MDCnrNasSSGkldxVAA
	tztQ==
X-Gm-Message-State: ALoCoQlen/2mKUn8KvKKcZZEIg8jEuOdLN+8hgTDA0vKn13SCb9AP6I0El2ymi/L61G9JrBKl0saozQQvav8xwFGDbCdgQBbzW+eG63YV0eitpU5p7vJf0g=
X-Received: by 10.31.180.145 with SMTP id d139mr1670343vkf.83.1450440321512;
	Fri, 18 Dec 2015 04:05:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 18 Dec 2015 04:05:02 -0800 (PST)
In-Reply-To: <1450219878-5293-10-git-send-email-drjones@redhat.com>
References: <1450219878-5293-1-git-send-email-drjones@redhat.com>
	<1450219878-5293-10-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Dec 2015 12:05:02 +0000
Message-ID: <CAFEAcA8+u0oX-maZvZRwSBGdYV2c4bAQ1un9xpX5orgmBLN6rA@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Cc: Markus Armbruster <armbru@redhat.com>, Alexander Graf <agraf@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [PATCH v3 9/9] target-arm: dump-guest-memory: add
	vfp notes for arm
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
X-TUID: o5u6zZ8kJ0Z4

On 15 December 2015 at 22:51, Andrew Jones <drjones@redhat.com> wrote:
> gdb won't actually dump these with 'info all-registers' since
> it first tries to confirm that it should by checking the VFP
> hwcap in the .auxv note. Well, we don't generate an .auxv note.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

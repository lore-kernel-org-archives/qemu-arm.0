Received: by 10.25.208.211 with SMTP id h202csp122824lfg;
        Fri, 4 Mar 2016 07:19:07 -0800 (PST)
X-Received: by 10.140.105.198 with SMTP id c64mr10822057qgf.94.1457104747364;
        Fri, 04 Mar 2016 07:19:07 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a14si3988223qgf.96.2016.03.04.07.19.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Mar 2016 07:19:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:41688 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abrVR-0000jV-NB
	for alex.bennee@linaro.org; Fri, 04 Mar 2016 10:19:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abrVL-0000b2-U0
	for qemu-arm@nongnu.org; Fri, 04 Mar 2016 10:19:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abrVI-0005lo-31
	for qemu-arm@nongnu.org; Fri, 04 Mar 2016 10:18:59 -0500
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:33449)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abrVH-0005l2-VM
	for qemu-arm@nongnu.org; Fri, 04 Mar 2016 10:18:56 -0500
Received: by mail-vk0-x22f.google.com with SMTP id k1so40266907vkb.0
	for <qemu-arm@nongnu.org>; Fri, 04 Mar 2016 07:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B2EFZIoEtSIP6Y6i04SfyuA4qQNjaM2oxNgNfx4lf3M=;
	b=YXbnrV/os7AX/qxBbJuUgob8oglrBWTXG7w6v1jDz2jCRdSZtZj1+dg3i8yACrA7Sh
	BG/c+MtDd6J+xVvtOYc+hZMJIDBBcILi7E36x/NNj2zHI/YbIi8kyJ99E90zin2+2ffJ
	9I3SeJDB6kKR/QBlI8Idv7IVpPwUg04JrIjFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B2EFZIoEtSIP6Y6i04SfyuA4qQNjaM2oxNgNfx4lf3M=;
	b=TgOElkHfQM7KfGEa/MNuqLzSSI2Xsp4CvRVkUiOwtTasYiUKlgU30hRNvVcZSK5G2F
	Wu4e9ZOSs2K5QhSj5OTel1xBIq0iCmsS+MuOEFZ9IXgBjky3HBOK/Z2NIqLF007QAbc7
	mw76pk9/1ST7Yl71F4OR7Fg6rqUSj6TH5Y68K8W8Z3g4WXaGv7Bfoo9DwmqM0hyn0bg7
	VgOAl5Fw7Kf0jw56WvcdkT+4B2P/ZJgt8EM+l2p2angEnw3QxyNqgYb6hkVxGGDtHTGa
	Dd1Xu0Ubu2Y3AZdweTNvz7CZj9Zt5ynO2orS7XDuadsq/Z4BFZ9c3lU7L8PiDrtgPQUF
	8//Q==
X-Gm-Message-State: AD7BkJJH+dZX6rDF58m9keNKViHtCRHkLB+K5H1xKjEGNuTfMs+x+goBfIgTqKOwsycytVo8YzO4ozYzIWDaal70
X-Received: by 10.31.1.6 with SMTP id 6mr5550121vkb.139.1457104734327; Fri, 04
	Mar 2016 07:18:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 4 Mar 2016 07:18:34 -0800 (PST)
In-Reply-To: <5345871457103838@web18m.yandex.ru>
References: <1456941872-8791-1-git-send-email-afarallax@yandex.ru>
	<56D73CB6.7040702@gmail.com>
	<CAFEAcA9gPrmcn3TNUueei1f5V0QMr-Nox9JHEE23EsQxbEO9qQ@mail.gmail.com>
	<56D84EB5.30808@gmail.com>
	<CAFEAcA9Sp5282BfXFK8W9x8N0HJCbmxZBNL7Cxof7cYRsp8FgA@mail.gmail.com>
	<56D8683D.1080004@gmail.com>
	<CAFEAcA9dPg9Zs4LMzjb738nsVQXPicQSLU5yHXgG0wffD0M=Gg@mail.gmail.com>
	<5345871457103838@web18m.yandex.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2016 15:18:34 +0000
Message-ID: <CAFEAcA9fNYKAAB=khTDtumrgHLHKD-J2TUR0s_oMEmsQ2qM42w@mail.gmail.com>
To: Sergey Sorokin <afarallax@yandex.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target-arm: Fix translation
 level on early translation faults
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
X-TUID: 1dDe6Bi/DF5V

On 4 March 2016 at 15:03, Sergey Sorokin <afarallax@yandex.ru> wrote:
> Do we really need to rearrange the code?
> In pseudo-code the level is set explicitly as well, in case of a fault.

That's why when I originally brought the point up I said
"but I'm not sure it's worth rearranging that code"...
If you want to neaten things up so that we pick the initial
level for faults (0 or 1 depending on va_size) in one place,
then you need to rearrange the code. If you don't want to
rearrange that bit of code you can leave it all as it is, but
you don't get the neat "only one place makes this decision"
structure. You could argue either way and I don't much mind
which we do.

(Incidentally the pseudocode is not always a good guide
for the structure of code; sometimes it makes clear choices,
but sometimes it makes confusing choices.)

thanks
-- PMM

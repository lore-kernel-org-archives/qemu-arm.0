Received: by 10.25.208.211 with SMTP id h202csp802162lfg;
        Tue, 15 Mar 2016 13:33:41 -0700 (PDT)
X-Received: by 10.141.3.11 with SMTP id f11mr31469qhd.90.1458074020970;
        Tue, 15 Mar 2016 13:33:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f6si2158524qkb.10.2016.03.15.13.33.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Mar 2016 13:33:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:51406 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1afveu-0007oX-ER
	for alex.bennee@linaro.org; Tue, 15 Mar 2016 16:33:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46383)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1afveq-0007l9-PP
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 16:33:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1afvep-0007LS-VX
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 16:33:36 -0400
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:36081)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1afveo-0007Kh-P8
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 16:33:35 -0400
Received: by mail-vk0-x233.google.com with SMTP id c3so36462511vkb.3
	for <qemu-arm@nongnu.org>; Tue, 15 Mar 2016 13:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jUBFedyrQvyyUT5ezhxazsWrOLMi44js+E+3rtMpARs=;
	b=KwlGfLHnvXumeJBKkhXknMmnA9FG77nDhgriuoYXClS2f2iSZzUcN5q2pJIPj+Orur
	0pmEZY0lCE73HITfk0Bf1qlqRJLIacio6TgmnsjtmG+HAlnaa2CIRHHFWkrrpr1/3kE6
	3KIeiKkzWgZzDzmEQ8u9J7NIfzkoFF6mRe6V0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jUBFedyrQvyyUT5ezhxazsWrOLMi44js+E+3rtMpARs=;
	b=mzEL4CFNv92ppPz+rne4MzrspBuQEP6L9c3wmkq+hWEoGEav0FLp4R46GL7MlB3CQZ
	FpvsrTL7EMTgVDUzGgfuDHsPgu3J+0hU+2wKq/TyC5FTwJCi/zshqH0tiLd69izcAFqQ
	Z70G0NM4Ta8JtbffWLTnpCTUBoDNNa1ywePEKHxaoprgl/swULk4PUrnxYHmTMbTin3O
	T+s7A3uJdWvuRon65yUgO4Ztq4reztXcnOJmKpotSjuy9h1oxlTtNlh2CkTsn4vxvG0+
	bbMwQL1YQFe/QqhNEqvNQRtSOXhf7B6eXLs+cxGaViCDuYinp5eecq5Ev9N82TJHd84F
	Dx8w==
X-Gm-Message-State: AD7BkJLIzzBdNiTs+AUts7G/uMhvQP0tBypem9JJ2WgjroQd727NpOfzPwmzgw2ofbGiny260eJLJgkvpWBl3P0h
X-Received: by 10.31.45.143 with SMTP id t137mr32837196vkt.143.1458074014244; 
	Tue, 15 Mar 2016 13:33:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Tue, 15 Mar 2016 13:33:14 -0700 (PDT)
In-Reply-To: <CAA8zJ3AxgAAKzHr_sALQQ1VT5fTHRNrxot4--VREtZ2-6kK92w@mail.gmail.com>
References: <1458061009-7733-1-git-send-email-peter.maydell@linaro.org>
	<CAA8zJ3AxgAAKzHr_sALQQ1VT5fTHRNrxot4--VREtZ2-6kK92w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2016 20:33:14 +0000
Message-ID: <CAFEAcA8SXBURzdHsKgZGNuEO==jAAKUyj6cxH3VbqrTXo1ocnw@mail.gmail.com>
To: Thomas Hanson <thomas.hanson@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Cc: Patch Tracking <patches@linaro.org>, hitmoon <zxq_yx_007@163.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-arm] [PATCH] sd: Fix "info qtree" on boards with SD cards
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
X-TUID: Y6DCsYbrcjLE

On 15 March 2016 at 20:28, Thomas Hanson <thomas.hanson@linaro.org> wrote:
> The patch looks good.
>
> Would it also be good to update bus_add_child() so that it NULL-checks
> its "bus" parameter before dereferencing it?

No, I think it's just a programming error to call qdev_set_parent_bus()
with a NULL bus parameter, so crashing is fine.

(The problem fixed by this patch doesn't involve calling bus_add_child()
with a NULL pointer, in any case -- qdev_try_create() will handle
a NULL bus pointer as "use the default system bus", so by the time
it gets to bus_add_child() the bus pointer is never NULL. It's
using the default bus at all that causes things to go wrong much
later on down the line.)

thanks
-- PMM

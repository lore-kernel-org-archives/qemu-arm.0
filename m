Received: by 10.25.208.137 with SMTP id h131csp2082183lfg;
        Tue, 10 May 2016 06:23:18 -0700 (PDT)
X-Received: by 10.141.46.71 with SMTP id x68mr44399758qhe.70.1462886597990;
        Tue, 10 May 2016 06:23:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k4si1378147qkd.165.2016.05.10.06.23.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 May 2016 06:23:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46266 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b07d7-00048x-C6
	for alex.bennee@linaro.org; Tue, 10 May 2016 09:23:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b07cz-0003oB-86
	for qemu-arm@nongnu.org; Tue, 10 May 2016 09:23:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b07ct-0004Dq-5A
	for qemu-arm@nongnu.org; Tue, 10 May 2016 09:23:08 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:35768)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b07cs-0004Db-Pb
	for qemu-arm@nongnu.org; Tue, 10 May 2016 09:23:03 -0400
Received: by mail-vk0-x22c.google.com with SMTP id f66so15382168vkh.2
	for <qemu-arm@nongnu.org>; Tue, 10 May 2016 06:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=psizZEcUMIfDCwjU03hATipSUtx3VlunQtUS79IYBKo=;
	b=eSmqf5FGtBneRykOCQ1bG+4myxjZ/ILlI+uQD1eIN7oPIupVtHS/DKhmMtVnS3WstB
	C92bPRnDia/v5+UyxzYVIfKnl+3vsWg6JxU4frKd+QOs3AV+D9vMxvcvoZl4HucyAfsV
	U3cRVhvMa/c+oViKJYWJLbQaJUrfboi/aEqkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=psizZEcUMIfDCwjU03hATipSUtx3VlunQtUS79IYBKo=;
	b=WGKHstsIEVuapeTHR5hQK720EXFb8biuLCo19mi0rR/5PUUr0o5gS6Pdz5yMPCX1d6
	l1mpFPKjma6FzJSFIEgVLN9mY32Zu9cGfNhvli0I/fiWaBGgA2H8U2B7NPtT2ZFE/Js0
	YkMhwYbTg1TLcREgP8XSHhGG8+nCSi298ti3a5EJUR4tNNdxacO0sFajaCGUpElkz5nX
	Nh/o//M6Lyq37WPzahZJLVr5EoaScIwn9WVWhbYTQzje7FM0VcWNgXyeHy8xGfRVW9dc
	gVfGZz9SRw0xD0nzQewgqFXN90QCK56vT2uNCkEyAuuyZdBT9NIyrEIb9Q29nIDYaZsT
	+PUg==
X-Gm-Message-State: AOPr4FVHk2bckpHV2MwllqYU7ealFydIvHqckejcgdxSgd0lYl1VEwA8KvCxQ1jbid2+6sL41IUpk/RJzoM7QkZs
X-Received: by 10.31.89.196 with SMTP id n187mr8247468vkb.83.1462886581960;
	Tue, 10 May 2016 06:23:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Tue, 10 May 2016 06:22:42 -0700 (PDT)
In-Reply-To: <20160510103637.GH16305@toto>
References: <cover.1462557987.git.alistair.francis@xilinx.com>
	<6459df5e54365d5dbe8a1b047a85ec65c67e9232.1462557987.git.alistair.francis@xilinx.com>
	<CAFEAcA-G1jfUuK5JDFDnrFG5tKOt_VPnLBj7CD4WGkhrx_zp8w@mail.gmail.com>
	<20160507015121.GF16305@toto>
	<CAKmqyKMNbNoph2s1F4ZnC_Dqc-t_=bRtm5+oAHXnvdF09KHVeg@mail.gmail.com>
	<CAFEAcA9cGbU+LdZD9YzkJ8VMEyt+gKd5+8qi+Q-m+tgtNBg10w@mail.gmail.com>
	<CAKmqyKOjOwWOp-6kzOunxf0F8c8r+ua62gxFJ6x2vJR2Yaz_Nw@mail.gmail.com>
	<CAFEAcA84aHCj2ADGkuxEbdx1qy7scu+nXSTU5K70ZPXR2PL1Ng@mail.gmail.com>
	<20160510103637.GH16305@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 May 2016 14:22:42 +0100
Message-ID: <CAFEAcA_yEjopJ_m2pXjPJC4u3n1YquAhAhSJ4=B8tvC1hn6H5Q@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 2/2] target-arm: Enable EL2
 for the A53s and A57s
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /rCKDA7Mhd55

On 10 May 2016 at 11:36, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> On Tue, May 10, 2016 at 09:09:55AM +0100, Peter Maydell wrote:
>> Edgar, do you have the list of what we're still missing before we
>> can turn on EL2?
>
> We're missing the Data Abort ISS:s, we're missing modelling of a few registers
> (like HSTR_EL2). Some regs are quite incomplete like HCR but I think we can
> live with that. GICv2 virtualization is missing. We are also missing a few
> AT_ modes. AArch32 support is probably lacking alot of more stuff.
>
> IIRC, last time this came up we talked about enabling EL2 after ISS and
> GICv2 virtualization support gets merged + a few odd regs. Enough to allow
> Xen and KVM to work under emulation.

Yeah, my practical guide for when we can turn on EL2 would be
"when you can run at least one of Xen and KVM, and not break
booting of Linux", even if we're not 100% feature-complete.
I think GIC virt support is the biggie here.

thanks
-- PMM

Received: by 10.25.159.19 with SMTP id i19csp2580830lfe;
        Tue, 19 Jan 2016 08:08:36 -0800 (PST)
X-Received: by 10.37.14.132 with SMTP id 126mr8461100ybo.69.1453219716830;
        Tue, 19 Jan 2016 08:08:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b192si17430286ywa.422.2016.01.19.08.08.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jan 2016 08:08:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:37724 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLYpg-0000d0-1l
	for alex.bennee@linaro.org; Tue, 19 Jan 2016 11:08:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40862)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLYpd-0000Yz-Fc
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 11:08:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLYpb-0000sX-5z
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 11:08:32 -0500
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:33004)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLYpa-0000sQ-Rc
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 11:08:31 -0500
Received: by mail-vk0-x22a.google.com with SMTP id e64so14573099vkg.0
	for <qemu-arm@nongnu.org>; Tue, 19 Jan 2016 08:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=gcX0llKzC2q48PJFvj1FXHVJvbn6ZqwBnne8HeB1mbY=;
	b=RO9FgpLv58xhEjI8OWUaI8BLlmC+9ML0BNCz4qh1luE+uvW/Cd722KXi7uKriPqTV6
	pLrUEeFacGnONhJCKrPMYXAUVyHCupNxQ1rJVOYw0uQizAg7TovBVFGrDUXjdy6WKJb3
	AjYmpI4JZ/gcNSxwJZtD+E9lesT32avjUm8vU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gcX0llKzC2q48PJFvj1FXHVJvbn6ZqwBnne8HeB1mbY=;
	b=Led6/cLi9WaqPKAcZ/Z/9OoZk0Z+47d8mlz2t4W0BlgblDi1b69n1uiJHQkJ+STohC
	O1maOdwMKfTGU/H4l8Ug0Si3ppjXXcAeLG8b8rmpkZsmoOi5RtdN9QRRT4GQleVq48PG
	CTXvt1orZrkppTn0u9HIJQuMFNND4GWOGyLUPAgHYVc0G12YmB7vA9yu9SkbfA7tNc98
	x2du7/NTGUiYciz/V2wQo5IxGoG4TTQQhalzL8uTrRLuDeE5CHFM7RUilWQ7unMBcRWe
	u+jjowE7D0xDuLs42EncXslo8Cc5LHAg+yfAeyCBAeaIVsmnXs4W0hi4aotZ4oEIPu1A
	7Teg==
X-Gm-Message-State: AG10YORdW4++5jBnFIh/GCrWOUYtQXrNy2mFe6CynULyyJGlHq/IPPHJWA3iyrskzYR//dZ7/I3WWKlDncE9pSBw
X-Received: by 10.31.2.200 with SMTP id 191mr5868317vkc.6.1453219710361; Tue,
	19 Jan 2016 08:08:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 19 Jan 2016 08:08:10 -0800 (PST)
In-Reply-To: <5258352497f088c6ef964f2a30ed1c87a7ecad88.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<5258352497f088c6ef964f2a30ed1c87a7ecad88.1453100525.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2016 16:08:10 +0000
Message-ID: <CAFEAcA9gnM8hWtX_ZTMyhRe9ANBTfxgGSk7cCgzWH4V56HmNgA@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [PATCH v1 05/17] target-arm: pass DisasContext to
	gen_aa32_ld*/st*
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
X-TUID: seZVe/xsfXWF

On 18 January 2016 at 07:12, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
>
> We'll need the DisasContext in the next patch to retrieve the
> desired endianness, so pass it as a whole to gen_aa32_ld*/st*.
>
> Unfortunately we cannot let those functions call get_mem_index,
> because of user-mode load/store instructions.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> [ PC changes:
>  * Fix long lines
> ]
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

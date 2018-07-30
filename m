Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3802874wru;
        Mon, 30 Jul 2018 06:53:00 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdvSdjas7tz9EdJPmdQQ8DHK7Bpuc9mXVJmgLuPUKj1sd4Mq7wseRZW4JpD3Rcd77iglLuP
X-Received: by 2002:a0c:f90e:: with SMTP id v14-v6mr14940206qvn.207.1532958780598;
        Mon, 30 Jul 2018 06:53:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532958780; cv=none;
        d=google.com; s=arc-20160816;
        b=PRfmUH0QUO6xfTG6EEMwzlW0nryBb1HAtaYw08//2sy/X4bfRYo4/rr47rmNyCiAl8
         ZCxZ6AmvNXgtVq+btLP0woECsn43yfD9UCo1p4ZgDNo1klCr+nHWi1zbzWbGUJLSlkgc
         JH2ctlevSMsKWM3oPbzT+0z1OPWyoXe/pG1qG5g69kx9aH9c/x6BEJDhGOGZQ0y5TFTc
         u24CjD0ArSiBYdZ7qlTWN4fD386C5a+pasOLt4JZJ9oaTo4A8nuPM8odCAKqxhqpMJxr
         QQf/CMV7/1h/8HJHgtWBg8CBLBQkPW68kG/MFs5BRKcGLE/kpsGw5VJRjoW02Z1m04y/
         la7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=S+0YSdlzet70yQz6Ik9O3atVi/oIZi2Eqp3/0cKvC9U=;
        b=KnwK4nn7PUAx09xaM5o/TyafR7D8QDwip6eryk8j5K0EWmv8w7RMreCpIjtR/APAyb
         uipaHf3putjnATJgEjizBEMKGS979Yv2QS4+xcIpHGDlRMXEiXmU4oTtdNRvHbloUdfi
         SdJbBRoH6pvxYcv1J+wjF5NEQEzj/DowBlqZtQCzQsJ9R9ccIQDyg8gLpHApZf4rZFCG
         /ioFaresMsKUk90EI65Y+ljx/kSA3d6VpBVYorJDND6JLaj9ytHVILmqODFygQaB/pc1
         VroLQ3lIYUqB6w4jVeSIywJ0Zp7Tzp9ARNZV0SQFi5eYBX4EhPmHh4g3RiYcstFwWAZY
         DvOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FZAzpxoc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 8-v6si137064qtw.283.2018.07.30.06.53.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jul 2018 06:53:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FZAzpxoc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52753 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fk8bc-0003qW-3m
	for alex.bennee@linaro.org; Mon, 30 Jul 2018 09:53:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fk8ZT-0002ns-4i
	for qemu-devel@nongnu.org; Mon, 30 Jul 2018 09:50:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fk8ZS-0003fv-C0
	for qemu-devel@nongnu.org; Mon, 30 Jul 2018 09:50:47 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:46509)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fk8ZS-0003fh-5W
	for qemu-devel@nongnu.org; Mon, 30 Jul 2018 09:50:46 -0400
Received: by mail-oi0-x244.google.com with SMTP id y207-v6so21323059oie.13
	for <qemu-devel@nongnu.org>; Mon, 30 Jul 2018 06:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S+0YSdlzet70yQz6Ik9O3atVi/oIZi2Eqp3/0cKvC9U=;
	b=FZAzpxocjBRrpxHfB2d8ZzGApf3twftHm+gc1ZAEdZ4wqdn0VV95AYrgvC0oMhuap1
	v6KTy+w/EBBa2DY5L1oqJiAxujEyESJns92Zb1xXGI0VDnOYGirCSGRe6LoJeXzAkFrn
	0uF2ayJHQLeamz5Uo7eWpKiibKEeI53XeXA2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S+0YSdlzet70yQz6Ik9O3atVi/oIZi2Eqp3/0cKvC9U=;
	b=sOzIODJKZFmxAFSeTopqCTGgy7m2POSkj0zY9Kdz4uocZYFMcen53noF2vaPQ/vpya
	spRjKCYOfi5vtoRYbXqwFMVwyTo/fCrSluP9ctu6DR0nYHwanyv3hJizkNvrZHOxIoyv
	bI0gVaL3yfMlGEGDIghu/CVvyt85vvEghFK9Y6H+GPtD4Gt6HwK/MaLLt/GzZO/7G2cR
	2neXohjE67IB4EDV46xnrGu67dsZlywKWH9WB8j5WjBIfrU/gNuOWNxnD0hBWirv88aX
	8IEyFaq2ryq1JHchn13FyURxam1J2A9/w9NGfqNhwo+Pkoi0G9MXawDxO+wAkIMkSVoQ
	jtpQ==
X-Gm-Message-State: AOUpUlGTBwa3dbNqFVhiIVf786eAeRgaGAf+7LuY8cW3RcDCJtBbFP2Q
	cwHZLpKaG1izHsAe/o3VxuEDL8YxDvvKZHKSBOewaQ==
X-Received: by 2002:aca:a982:: with SMTP id
	s124-v6mr18883404oie.80.1532958645525; 
	Mon, 30 Jul 2018 06:50:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 06:50:25
	-0700 (PDT)
In-Reply-To: <20180725113000.11014-1-geert+renesas@glider.be>
References: <20180725113000.11014-1-geert+renesas@glider.be>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jul 2018 14:50:25 +0100
Message-ID: <CAFEAcA8jw0d5BOHx_vMBM32w194mb3rkLmUyo5t1zRhpApgJZQ@mail.gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-devel] [PATCH] hw/arm/sysbus-fdt: Fix assertion in
 copy_properties_from_host()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kqJ7o4Dzvp0X

On 25 July 2018 at 12:30, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> When copy_properties_from_host() ignores the error for an optional
> property, it frees the error, but fails to reset it.
>
> Hence if two or more optional properties are missing, an assertion is
> triggered:
>
>     util/error.c:57: error_setv: Assertion `*errp == NULL' failed.
>
> Fis this by resetting err to NULL after ignoring the error.
>
> Fixes: 9481cf2e5f2f2bb6 ("hw/arm/sysbus-fdt: helpers for clock node generation")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied to target-arm.next for 3.0.

-- PMM

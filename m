Received: by 10.25.0.6 with SMTP id 6csp1878067lfa;
        Tue, 30 May 2017 08:46:13 -0700 (PDT)
X-Received: by 10.200.58.130 with SMTP id x2mr24278298qte.110.1496159173836;
        Tue, 30 May 2017 08:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496159173; cv=none;
        d=google.com; s=arc-20160816;
        b=hxswqAoaPS7FNvjbX5XLfi8uAJCm1DTX9Hp4UOB0oMA3ay/aJa5oyRdR/f50bAuYk3
         kd9XE/vCAdWzrjhc0yet4MI3v3Q8nPWsBTdXgFsT7P35fwFIbuKf0UDlSkbZC9vHjtV6
         b0ZyYU3sw0HXCxQfHwl15/D/J4IDJfeiZqsnMr7LXKoFF438+ROyIQCsP1PjP+iBC8Tz
         rynd6PZY9tSQ3pY+LDOg/7H0oUDTL9Bh55/L/zGnmE/eDqTgfiRDPfJKwZH0vP44nRn4
         yNNUzqu0umMzDMwf3DIausWuKv1XLZ57KWcFgNOylDSmb3KZ0YNAfwFZ74SssAAwgLO+
         hlUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=3iwBB2i5JddIxvad4xrdBimuCFDG+xXTMoYGkjaBUGc=;
        b=pYC5QBfbLJZytd5rnQQWrzjHkH5sid+8zD95YtcUyf8nXurjGXs30zrRM1xYNE3Abb
         S4eeZHV+YXOwAiatYTu6I1+DkbiQh3kbdNoVFtkPZNzH1FtLabsk6TqQHHlUzccNVqt5
         bBiN4U4aSz3XSXSBxqyqrm88lJhG1/ykB/TDJtOuBarl7ugYZxtYOiEAFUxzw+WArEd2
         CcGPA/Cu31EzdzhlBjBoHyvEi5Gt5URDxGABBCf+Vul3LtO5X6WzOR2zzL8KiGDbg/M/
         3B/gpItgeiwmJKuMRihWTgrB5XxV0xfkqL3gOT6a2fIJWaqB3sHqwFOH3S/tK+GDYz8K
         FGfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q1si13259733qte.107.2017.05.30.08.46.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 08:46:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54630 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFjLZ-0002O9-AT
	for alex.bennee@linaro.org; Tue, 30 May 2017 11:46:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dFjLR-0002Nv-7p
	for qemu-arm@nongnu.org; Tue, 30 May 2017 11:46:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dFjLQ-0001jT-4R
	for qemu-arm@nongnu.org; Tue, 30 May 2017 11:46:05 -0400
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d]:36702)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dFjLP-0001iy-Lv
	for qemu-arm@nongnu.org; Tue, 30 May 2017 11:46:03 -0400
Received: by mail-wr0-x22d.google.com with SMTP id j27so3058287wre.3
	for <qemu-arm@nongnu.org>; Tue, 30 May 2017 08:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3iwBB2i5JddIxvad4xrdBimuCFDG+xXTMoYGkjaBUGc=;
	b=iYH+E5znbTQRokHY3Zpam+nPtVr4czw6LsmTouBvq6L3K55/fMg07ihQITmFoyHLuT
	539R/a3DgxTWuY4T3K17v89Xh+K7lhrcrowr6ZZw5auUeL1MNno3polNOMRQ21e/0mhX
	xOwFQjwENG8XSRL1LzZqrv9iEXpZAbntZCxlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3iwBB2i5JddIxvad4xrdBimuCFDG+xXTMoYGkjaBUGc=;
	b=Eqsj7euzaBjmn0BeSZOfUaYMNG7HPeFPgtsatCBOe3JZZDCNePkA2h7r0PL6KT3F5u
	GhFDzBytST8IMc3VDHHUezhOcCcX/zFG3naO/ZJwSFGwmMwAffUzPFeeMTQuMQq+RyBi
	VjNpsivHXNhvw+6briPI1sEjkOsRO3aol7yuhYehn+N6zBVMcMS/UBHMCS8hBn2MQaaW
	3XnRIt9GlvD6szqLa1+aAu42FKnGncjkftcvaV2zdCoGHS05qPs6YXZjduyguywsAcfk
	E6wjT35OL9VNXzbj7fb8+z9tO0IamvHuA5ERMAS+VclOaBzYMJOQO6LhNeAoZWhS6R1l
	PlIw==
X-Gm-Message-State: AODbwcD3SNQzyuapO6fhduqYdjPgScpsSnA3PCBG+4zikEI+eue3gyOY
	/ruBwn5m3MAss/cFOf4sEguKW546h7X8
X-Received: by 10.223.152.227 with SMTP id w90mr8217567wrb.151.1496159162500; 
	Tue, 30 May 2017 08:46:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.135.82 with HTTP; Tue, 30 May 2017 08:45:41 -0700 (PDT)
In-Reply-To: <20170507113540.8687-4-krzk@kernel.org>
References: <20170507113540.8687-1-krzk@kernel.org>
	<20170507113540.8687-4-krzk@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2017 16:45:41 +0100
Message-ID: <CAFEAcA9Erpv3x2x6eRtJL7tSHv+Fm9Tmomi18n8QwmkWU5sJcw@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22d
Subject: Re: [Qemu-arm] [PATCH 3/3] hw/arm/exynos: Add support for system
 poweroff
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tnVu1Z7LOZuk

On 7 May 2017 at 12:35, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On all Exynos-based boards, the system powers down itself by driving
> PS_HOLD signal low.  Handle writing to respective PMU register to fix
> power off failure:
>
>     reboot: Power down
>     Unable to poweroff system
>     shutdown: 31 output lines suppressed due to ratelimiting
>     Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000
>
>     CPU: 0 PID: 1 Comm: shutdown Not tainted 4.11.0-rc8 #846
>     Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
>     [<c031050c>] (unwind_backtrace) from [<c030ba6c>] (show_stack+0x10/0x14)
>     [<c030ba6c>] (show_stack) from [<c05b2800>] (dump_stack+0x88/0x9c)
>     [<c05b2800>] (dump_stack) from [<c03d3140>] (panic+0xdc/0x268)
>     [<c03d3140>] (panic) from [<c0343614>] (do_exit+0xa90/0xab4)
>     [<c0343614>] (do_exit) from [<c035f2dc>] (SyS_reboot+0x164/0x1d0)
>     [<c035f2dc>] (SyS_reboot) from [<c0307c80>] (ret_fast_syscall+0x0/0x3c)
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

give or take the minor change mentioned by Eric if needed.

thanks
-- PMM

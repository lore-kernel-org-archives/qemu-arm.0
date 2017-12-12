Received: by 10.223.159.74 with SMTP id f10csp3681996wrg;
        Tue, 12 Dec 2017 03:12:10 -0800 (PST)
X-Google-Smtp-Source: ACJfBovxAQriyPHqhar6MKRD+0PPNtKZznnuS9sKLOfK989bD9DgMIeMtrsfcr1RM3/oFI542yDg
X-Received: by 10.129.101.70 with SMTP id z67mr2540135ywb.474.1513077130361;
        Tue, 12 Dec 2017 03:12:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513077130; cv=none;
        d=google.com; s=arc-20160816;
        b=pH3vmI/MtMjgTnOsBIuViiCwseFBIpq8f8a61G/uGBYTCV5qvjax0u2q/3wTY1dRWA
         i7Lth+CqhsiZu0bPURrzo3S1CC97uoW9yiyDefa3msiuHyZXmxY3kEQgr7KRW50wH1yK
         qKm0kr2aYNmL1aPggCK7hUCgroEceSG3d1Oori1Di4ZCOyMc99J2kqovv8zc+sRHPdmg
         QOAjA7xEmD7Eh7T+qAIgr1gLcBHuwrzoz4R0yN/+DpiH7eRiWE2oxZK5026s1d7I0l2A
         twSKz/O0VSwDJ1ANW7eOXlQDS0zN37GFBDEIpbwzVF6FjVmFDX66+BDh0l/tgrly8bv8
         zE3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=tk0B/gAhH5xCYobEqHLx7hp9UVvEnCDuaQx9O+2h16c=;
        b=MiPNSHJTCJ+JlgmnVvYXX+MiSMPD116LHefI/MrRVDz2n/v+iJzrxi69fDHTJDPUQc
         zIJdI9clo9g7GRVcwPeNnXv8gyT4k3EAk87JLsSKNEe6Iig+xmIYNGOMVmUNi8reZGga
         lZAGYPpT6zIqcAmGNINxsIrw40cLiaxAF75wAE7L/7xbls6MfhAt2+W2vWqqPqe5HtMW
         2YiWiHIVRVjSNVRBmbEtEw9bid0MNw7ksuz3Din9uzhW3fBRXGhEGIU3PqHeIvbcGpx9
         /lJ7RafYg+aQMHuvzSV3rQrtx7l2j+FUdNxOoWHwYGktfjbRDO0SmAjhx8FGwLOtxykU
         1N6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ia7/eW7u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h14si1676471ybg.280.2017.12.12.03.12.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 03:12:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ia7/eW7u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57666 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOiTp-0001Ks-Oz
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 06:12:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOiTb-0001Ht-BK
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 06:12:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOiTa-0008FT-Jw
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 06:11:55 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:32818)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eOiTa-0008FE-EF
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 06:11:54 -0500
Received: by mail-oi0-x241.google.com with SMTP id w131so13738839oiw.0
	for <qemu-arm@nongnu.org>; Tue, 12 Dec 2017 03:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tk0B/gAhH5xCYobEqHLx7hp9UVvEnCDuaQx9O+2h16c=;
	b=ia7/eW7uwvzjrRtgOFduOKWpGgCA09AZQN35H/By2DV7XftSqvOv3lv3noIev19REU
	43Nef9l4ZrfYtTTWjlTbVwgfLqBjUd4+oGwyhDMU/9XCAIO7o/TVcO7X3B+YIwFOe/oR
	esiTf/ItS/rBEP7Opn1U/9ksEZvPhStJcHb28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tk0B/gAhH5xCYobEqHLx7hp9UVvEnCDuaQx9O+2h16c=;
	b=noNlqvJJ1TIqTaiecr+Zb9Ab9OozmlzM3eLkkJ1iHu8tBKu2U6IWM6Hx7lcEp/faLY
	3G2EnmJtyN5GNgk/lrtXC/0esqgzC95chNCQohi7/m1rZ8yfbYDdmXWKyekLjqrpvX/e
	Qso1AprNOqlxqAAdBxuj3aE/fFSCV7igeupYguUOV4sAaPPK8Tg8x+jheV0R9aHe5hSS
	Mr22jGFeVakwwLNUvTL6LP+ndBmzdYIccNMC1EIj+behRQdCVXwMkl0C78LsDAPNqGqG
	0tawwyqV1ihnfhmNZ2rFTcvdwkL29K64vsKl4YA3kvQ4YFry+g7+qAArvbSYxHB9lIVN
	llnA==
X-Gm-Message-State: AKGB3mIf4tH1xHS8H+aYaCyyAyudelgZWerFqNVn1gqzMD55MVff9stm
	fxLMaTZAZg6uQETmPv6dNtkzf6Cc+LgxCWNabVE3Gw==
X-Received: by 10.202.199.134 with SMTP id x128mr2789772oif.63.1513077113657; 
	Tue, 12 Dec 2017 03:11:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 12 Dec 2017 03:11:33 -0800 (PST)
In-Reply-To: <ac182406-8011-9f19-38e7-37328434095b@redhat.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-4-git-send-email-peter.maydell@linaro.org>
	<5A2F6ED9.5030605@huawei.com>
	<ac182406-8011-9f19-38e7-37328434095b@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2017 11:11:33 +0000
Message-ID: <CAFEAcA_9pee99KpL4zwVS5jJuiv2MCGp79crufpU1kH1Okg-Hg@mail.gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] hw/arm/virt-acpi-build: Add
 second UART to ACPI tables
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Drew Jones <drjones@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Andrea Bolognani <abologna@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nKTKtrhrpolN

On 12 December 2017 at 11:06, Laszlo Ersek <lersek@redhat.com> wrote:
> BTW, has anyone tested this with the ArmVirtQemu firmware? As far as I
> can see from the firmware code, the firmware will use the PL011 whose
> description comes first in the DTB (and ignore the other PL011), in an
> fdt_next_node() traversal. Is that OK for the intended use case?
> (Perhaps I should have asked this under the second patch, which updates
> the DTB generator.)

I haven't tested, since I don't have a working setup for that to hand.
(Do you have instructions somewhere for getting it working?)

The behaviour we would want would be for the firmware to keep using
the PL011 at 0x09000000. (In an ideal world the firmware would
prefer the UART marked in the 'stdout-path' in the DTB /chosen node,
as the kernel does, I guess.)

thanks
-- PMM

Received: by 10.223.159.74 with SMTP id f10csp5111434wrg;
        Wed, 13 Dec 2017 05:57:10 -0800 (PST)
X-Google-Smtp-Source: ACJfBouCvoUyCqajwn0BdrNvXEd+Y8rAhHT2GcwM5P7FYcWz0HDSn21pgZoyJliWhuYqPztFnrcv
X-Received: by 10.129.155.140 with SMTP id s134mr1634836ywg.500.1513173430384;
        Wed, 13 Dec 2017 05:57:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513173430; cv=none;
        d=google.com; s=arc-20160816;
        b=KiG9hdwrlllZKYoAi+a7RKLY+C4ju19Ab2TblaRQlGd+ZEqXh+M6BpPGMT/mlvCQA/
         ed8EMs37Iv4oADzYkLRTnO6U5y19gCm1kL3TpRPaseoxWqdMKlSPwQyMmrJ885AjU2rC
         fKOwU96CRSGck05bp5JVDtb5Vyb3W4a2+3CbOKZZzBlMh+FXg/yyprVwjp84L9r6y2uU
         IW/5jsUcwTERLX0ejLgDGDGW4JTa23U/PfQ9+t8Wd3I9ZA+iWVGLQBd28t7CgAUShZPI
         7p7GsqPC34QLKe/KEem+NKFbuYSB9FBXu4XA8yGf+m8Xe6NUgMIuowVMYBq3zB8Rfeu1
         Zgfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ocgMmpYtFZEuKV17x3BPAwz/UHNxWzJydWmIL3+Dn0c=;
        b=yF9OhStviJ6C1yduLdZi+4Eq6JRjscgwTNClTSE/9iGkk0tNQM1SZc5qmHVtws9Eyd
         VksYQkRC3n0WX3+XohRa1fwmn87dXkTVHTGo0YRgixsTWst8k4vX3XVScIJzlTwleBIL
         aL9+M4Y9XFu80wVgdt8vXmAeysqlT8mjaZ49Cgxe6dvBECfWL3zs1Y/5NlaWd1u8bsuq
         3AULKO8WVlQVtQfEXkZgiOOwISZFdx9PIy35AxlyiVR9o7POfPHLHSWRIYkR4if+gWxQ
         uLfNhZeE2lxmCqCLMI1DALrnGtXcVlekB64M6p09UxovbCNl/CGSkZTumXNLCjHSXXnB
         CyMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VdLvEmnT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i15si341204ywa.9.2017.12.13.05.57.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Dec 2017 05:57:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VdLvEmnT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35630 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eP7X3-0000IP-Ru
	for alex.bennee@linaro.org; Wed, 13 Dec 2017 08:57:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eP7Ws-0000I1-L7
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 08:56:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eP7Wr-000409-Rl
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 08:56:58 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:45409)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eP7Wr-0003zr-M1
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 08:56:57 -0500
Received: by mail-oi0-x242.google.com with SMTP id x20so1572951oix.12
	for <qemu-arm@nongnu.org>; Wed, 13 Dec 2017 05:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ocgMmpYtFZEuKV17x3BPAwz/UHNxWzJydWmIL3+Dn0c=;
	b=VdLvEmnT9CVzUSVC1iI6d49NWL8qr/tZivrwtfRwZZ9Zv8zoABanNk55F1EuUUsg3N
	2e8K1ydqWYxwwlD42r3kcbEJRpvFSgFVErW7vh2tzhRA5s78T2tF01M9qDd4HWMCZVja
	yjXfMugLkclodJrXHsrdqDex177Ey6BOUKeYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ocgMmpYtFZEuKV17x3BPAwz/UHNxWzJydWmIL3+Dn0c=;
	b=Em/XNuBGjjrHml/F/6IgeB1kHaN0MAlgwligOhwTxpsMrezI9YZ1H+HEBxE2LybbaD
	fK5AkRTKFSQ5BBRmSpQQVZldTbYOLmYnFqpKdaNUa1y4hK9Ooz0KpwWkV5ziwto3yhTl
	SJbvGiEA/4c34N9+fj8th6I8oX9HOXi9ZdMubHZQoNxbXQxllGZjXGm/z4kFaZALJINp
	a6Tt9iiCWC1PzhryA0jSJw/fBajre9k1hkCMSszUWW/lpwMT0MMbHSeJkIqfu+SMsNEY
	yPmIGH0TaSSweLrPVgAg6oXL70Df/p5cKlL+a81VoKDljbSBWaU0D2HHCUSMIhYe/gUL
	pehQ==
X-Gm-Message-State: AKGB3mILIDzHGy10SR/rdnDU6NfKnDj3EnGpiYElrx3nsUUbNoMzT352
	ATL8QqpF0W8qKe1QaYIMjTFkTwcwPRh5eIaD6RF2+A==
X-Received: by 10.202.199.134 with SMTP id x128mr1879051oif.63.1513173416793; 
	Wed, 13 Dec 2017 05:56:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Wed, 13 Dec 2017 05:56:36 -0800 (PST)
In-Reply-To: <ac182406-8011-9f19-38e7-37328434095b@redhat.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-4-git-send-email-peter.maydell@linaro.org>
	<5A2F6ED9.5030605@huawei.com>
	<ac182406-8011-9f19-38e7-37328434095b@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Dec 2017 13:56:36 +0000
Message-ID: <CAFEAcA8ySsNx-rz__Nfbmd+QM3nKbgRXJtwSYjhRRvqbokt+uQ@mail.gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
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
X-TUID: wgGiKaFgOuVD

On 12 December 2017 at 11:06, Laszlo Ersek <lersek@redhat.com> wrote:
> BTW, has anyone tested this with the ArmVirtQemu firmware? As far as I
> can see from the firmware code, the firmware will use the PL011 whose
> description comes first in the DTB (and ignore the other PL011), in an
> fdt_next_node() traversal. Is that OK for the intended use case?

I have now tested this, and annoyingly UEFI and the kernel seem
to disagree about enumeration order. That is, if QEMU creates
them in the code in the order 0x09050000 (uart 2), 0x09000000 (uart 1),
then they appear in the dtb with uart 1 first, and the kernel enumerates
them as ttyAMA0 being uart 1 and ttyAMA1 being uart 2, but UEFI
outputs to uart 2...

thanks
-- PMM

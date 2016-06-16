Received: by 10.25.21.96 with SMTP id l93csp376907lfi;
        Thu, 16 Jun 2016 08:39:23 -0700 (PDT)
X-Received: by 10.55.18.80 with SMTP id c77mr5503991qkh.199.1466091563260;
        Thu, 16 Jun 2016 08:39:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 63si26919096qkm.83.2016.06.16.08.39.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Jun 2016 08:39:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50167 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDZO6-0007ZV-Jg
	for alex.bennee@linaro.org; Thu, 16 Jun 2016 11:39:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDYGp-00010O-9v
	for qemu-arm@nongnu.org; Thu, 16 Jun 2016 10:27:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDYGn-0005Tw-Cn
	for qemu-arm@nongnu.org; Thu, 16 Jun 2016 10:27:46 -0400
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:32779)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bDYGn-0005TL-8T
	for qemu-arm@nongnu.org; Thu, 16 Jun 2016 10:27:45 -0400
Received: by mail-vk0-x232.google.com with SMTP id d185so75641732vkg.0
	for <qemu-arm@nongnu.org>; Thu, 16 Jun 2016 07:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DEJWTlXnKxtiM5H2vw2nmNtUJk+U44A3p7/QmP0WMPY=;
	b=JrZMMj2TKhKSfv9YQLkVBAzYBKJIU14YjjrqCFAcWLXzPh5J0q2PyFTv+qSi01BvBk
	0e8jkkINvl/MV62DueMe5x1t95kJAQaMdmO4OvyGtbZmW6VdGcZ4jITGeD6N/drLmLWM
	YlC0HoeCYQFMSLlJzZVzionN21w+dLksaE8EE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DEJWTlXnKxtiM5H2vw2nmNtUJk+U44A3p7/QmP0WMPY=;
	b=ZYqrwzRcJ/HCURKaDY98cJYzkKXdxKG2aiok+gE0mU1E+WYLRw/SaBpeSByNI6MFJW
	GsPsmUyJN5fDH+NLs5j3xed03JYxMvpzi2dgAyH/S/GIx1j3HGtguGlFB6FXLX5ZxIuO
	9z+ciOBMNevxkfs9jVu/kDCWcwyr4qJPDT7Ja2YM0hcGDD80QZkym9EQ/JnWBG/Hjv0U
	OlmhX/mjleTo3yBsymfXat8Vi1qGDcxD1rOYjaDo/Q4CYu4i//4ZXwL0GKfT8/T/gSDN
	exni+mkqrD4Key6AecD0zQg0rqCv7uIWHEE/NXNCmbsVWjdtYM1lBBR3QheIrTA0XOBv
	1AQg==
X-Gm-Message-State: ALyK8tLQPrBgfPSg/56Bv3DbRZzUpQMHf37MK7Woe1wzMDcyUWWK8UetYR/9K/9vZQjq9OBuaVV7oQb/d5PH5cSa
X-Received: by 10.176.64.69 with SMTP id h63mr2162439uad.125.1466087263848;
	Thu, 16 Jun 2016 07:27:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Thu, 16 Jun 2016 07:27:24 -0700 (PDT)
In-Reply-To: <1465974248-20434-1-git-send-email-andrew@aj.id.au>
References: <1465974248-20434-1-git-send-email-andrew@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Jun 2016 15:27:24 +0100
Message-ID: <CAFEAcA8V=UaAgvE+V5SB2JEb4ZH=p3saSdxTQ7bp91h6H7wGSg@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Subject: Re: [Qemu-arm] [PATCH v2] hw/timer: Add value matching support to
 aspeed_timer
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uNt3ypZeUN6y

On 15 June 2016 at 08:04, Andrew Jeffery <andrew@aj.id.au> wrote:
> Value matching allows Linux to boot with CONFIG_NO_HZ_IDLE=y on the
> palmetto-bmc machine. Two match registers are provided for each timer.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> Since v1: Address comments from Peter
>
> * Switch calculations to use muldiv64()
> * Switch to loops when calculating the next event after wrap
> * Bump VMStateDescription versions as required



Applied to target-arm.next, thanks.

-- PMM

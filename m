Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp530280wro;
        Fri, 26 Oct 2018 03:13:25 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eH53OXmaxeBNKr3tX+fH4T3n2ys7QX3CtBJvDf1r6eXrhMSfB5dagyDCw4tFI/QF40kg9G
X-Received: by 2002:aed:3bf9:: with SMTP id s54-v6mr2482498qte.207.1540548805244;
        Fri, 26 Oct 2018 03:13:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540548805; cv=none;
        d=google.com; s=arc-20160816;
        b=yCaXkg5ni4+ZHVnA2dP8gmAIWZ4J6srpxkPgpFtpsRSVjvicfpPK9coA5urPZCL5ZJ
         9vCAf9G1oFOKoIJAbqQkVFyUOGgRH3lJtsr8tKuDZAkGZ8H0jiFoG+YRowxLLU3N9TpZ
         5Ft/4RYFLCAVXmqNlMtfI0Ys8mOpNiT2fqcntq20vqA+JHbKWcI+Uq2lpKtplM9Ss4zm
         cy9xqDJ6+59qWgKs+whOdfc2s62N/Bi+CYnbw+q6DObvHkVwYEkAyvLjqQiYK/Zg8pL1
         CUCzdOprQv1cUVdP5AuEeKEOc2fhC7R/CtxA0tuIExLMP24WLaY6LgmawzdfcEPoiUBp
         z23g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=Rh9kAUzK2/b/+VIyOw3EFLBBHbHuunAdnxvJwtV9PJk=;
        b=U7OLCJ+0/o4Z2VQ6xHz1IZs+ymvGDe0IsPvUn38aL+KOfIAz6apV1pxW0PvCgIyg1b
         Pki5aads3vEZeNSHcgBc2jmw0i/mDQ8wPEmRhvP0Ca9TaxboZclo5FMXq+r2tHGzvIVH
         ty5aXvOWiJnBN6d359Osw8LRbYEuFI/VL5BPrNmaBgfolR4QlhDxjj9RxfL6zzkDl6j0
         X6r/uFz+41hI+BvRjwo+lRkuWDYFhT+hkL8z6iQymuA6g1O4waKvQBP01u3xzsfd7aMp
         Zu7rf2BOTQBbTfdYhH36Pw4Gind5u4B/DtpoqNek8uZWGGilxWH7NZQRqcczEcFWdCgq
         LMhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gn22unCx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m34si2582466qkh.8.2018.10.26.03.13.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Oct 2018 03:13:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gn22unCx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFz7M-0002EK-Ox
	for alex.bennee@linaro.org; Fri, 26 Oct 2018 06:13:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gFz7C-0002D7-Ef
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 06:13:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gFz7B-0001Lu-Cl
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 06:13:14 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38882)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gFz7A-0001LS-MA
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 06:13:13 -0400
Received: by mail-ot1-x344.google.com with SMTP id l1so558316otj.5
	for <qemu-arm@nongnu.org>; Fri, 26 Oct 2018 03:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Rh9kAUzK2/b/+VIyOw3EFLBBHbHuunAdnxvJwtV9PJk=;
	b=gn22unCxqAyal6Xu9tBctz0heK8jnvoUsXp9vLNHeQsNZ2IQ2JpWLpm6AioSaI4SaS
	Q8lTs1Zcyd3fpjowfZjQJrE260kfIaH4u8JBrHSUOyHHm/WQ2/b6TqcO1YKKWB7hNuXp
	7TVrF50GEnnrzafZiya6foab4W9AXoU+2Hdn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Rh9kAUzK2/b/+VIyOw3EFLBBHbHuunAdnxvJwtV9PJk=;
	b=Xe4oyEne0ZEWptfy9SpQGf/TOx2IXDhiNpgcIvWPBltornaIAnx54DF+KYFxC6y6hN
	oiR7mC7hDZ7DcxCp8AacWtd+ooIObv+YR16Q07GnO1w5Z6klDZXzy1diojFkjhoYF26t
	pW7eoJtOjKsHLW3EiLMb6Qs04TKif1Bk60U7ZEaZLoVZLjqG3RZ9dK6CZOtBREA90e//
	e+cv9e8ChZh/NjXylhNtGIHANKoE4X7EsB8Y3VwrKyU8WTZ11T9WxFCP0DmAsHabqdNC
	tvq8J+/8SCQRZzMU+LvlNfVA6rzcOzPiJURzxVcOC/YVY4RzGokIAV4kBuh519yf1bNy
	RoIQ==
X-Gm-Message-State: AGRZ1gKSpVl1NfoVOI+YR3GaFXFA5NkY7XBpCD0oCSgQVQ32MK/GNPo4
	394TAWVNQrmUcJ9wx2I0zKKOAnNcGJzzZ2TDg4T8gg==
X-Received: by 2002:a9d:cd8:: with SMTP id o24mr1591636otd.363.1540548791994; 
	Fri, 26 Oct 2018 03:13:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Fri, 26 Oct 2018 03:12:51
	-0700 (PDT)
In-Reply-To: <1540548409-22560-1-git-send-email-thuth@redhat.com>
References: <1540548409-22560-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Oct 2018 11:12:51 +0100
Message-ID: <CAFEAcA8EubWya8ey9VxhaCw4m2U=KA+i2C-R9P-p+P6oEBBLew@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH 0/2] Deprecate the "collie" machine and
 Strongarm devices
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3nhDw0xRPOxI

On 26 October 2018 at 11:06, Thomas Huth <thuth@redhat.com> wrote:
> These files lack an entry in the MAINTAINERS file, and according to
> the initial commits, the board and devices are incomplete. Since there
> have hardly been any commits in the past to really improve them, we
> should consider to mark them as deprecated now.
>
> Thomas Huth (2):
>   hw/arm: Deprecate the "collie" board
>   arm: Deprecate the Strongarm sa1100 and sa1110 processors

Hi Guenter; there's a proposal here to deprecate (and eventually
remove) the 'collie' board (strongarm) from QEMU. Is that one of
the ones you're currently using in your automated testing of Linux
kernels on QEMU?

thanks
-- PMM

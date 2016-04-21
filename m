Received: by 10.25.208.194 with SMTP id h185csp158701lfg;
        Thu, 21 Apr 2016 05:45:59 -0700 (PDT)
X-Received: by 10.55.204.197 with SMTP id n66mr19963370qkl.95.1461242758902;
        Thu, 21 Apr 2016 05:45:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l20si501884qhc.62.2016.04.21.05.45.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Apr 2016 05:45:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40618 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atDza-0006mW-Ff
	for alex.bennee@linaro.org; Thu, 21 Apr 2016 08:45:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1atDzX-0006kH-F0
	for qemu-arm@nongnu.org; Thu, 21 Apr 2016 08:45:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1atDzW-0002Y5-KJ
	for qemu-arm@nongnu.org; Thu, 21 Apr 2016 08:45:55 -0400
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:35810)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1atDzV-0002Xa-Dw
	for qemu-arm@nongnu.org; Thu, 21 Apr 2016 08:45:54 -0400
Received: by mail-vk0-x232.google.com with SMTP id t129so96518981vkg.2
	for <qemu-arm@nongnu.org>; Thu, 21 Apr 2016 05:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CLLjBiUWGFiJ0VZb7rwrm+D3ycN3XA9JSeBrGYxMj6k=;
	b=TlyyRe62adJWwSTqjQO4ASCwIPFxFQUkvOx3vWXv2c9iAeOPfQeE10Xjt3sDAxYmRH
	Z+yZRZa8UNOGIzuIInMjOEJiEClT5LVVCggG8k72i3kTytWFCex3L9gi6a76YvXWuTxf
	P9pbQSge2OBJi0EjOUKHLMMsUG5Gi8AblW/yQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CLLjBiUWGFiJ0VZb7rwrm+D3ycN3XA9JSeBrGYxMj6k=;
	b=MpH7QXIcwB2I6LABu3hpKM4X7khyvMEcwpv8JdP4SY0hnfX+gyZC1+d42oRKCXmUK2
	8T3I53+k4DhpTPrac4c++znNM2P1nXXgtWwb0Ne7pQukI8e/ZFzqONJbuvJSr2fGMHk7
	xuDyRaCQ/c+Zlh0Bm7nl2UVU4bMOA49NsAGKKommi+MdC6lhYIEllLbOAlfL482A+EFP
	dNDjVKQbLAUFmrgXaXjbfFTUZo8He5PcM3FoZ+ntVpo8bduKO5SWHCno7m79oTjsKgTr
	33D+NFXYehDNZYpLAi1LkKnSR/bc06m1nW3gX61HeuSVh+/lP/2G+5acTkCl3CXHy4cF
	HFKw==
X-Gm-Message-State: AOPr4FX9ePcW8BSEn0uImbGkifofKFyEPe+8N2IDhBdYRi0eRg03EF+KXBxykA5m7hivW/otfh3tpgKCCQTU06vq
X-Received: by 10.159.35.12 with SMTP id 12mr6936184uae.119.1461242752958;
	Thu, 21 Apr 2016 05:45:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 21 Apr 2016 05:45:33 -0700 (PDT)
In-Reply-To: <1461235306-3393-1-git-send-email-sylvain@sylvaingarrigues.com>
References: <1461235306-3393-1-git-send-email-sylvain@sylvaingarrigues.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2016 13:45:33 +0100
Message-ID: <CAFEAcA8mLk+3t+ypR96WPG9yMsvbJ4hmgk1NwfxPLHzk0R=Dwg@mail.gmail.com>
To: Sylvain Garrigues <sylvain@sylvaingarrigues.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Subject: Re: [Qemu-arm] [PATCH] bcm2835_property: use cached values when
 querying framebuffer
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
Cc: Markus Armbruster <armbru@redhat.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NpRbmu7CDfKR

On 21 April 2016 at 11:41, Sylvain Garrigues
<sylvain@sylvaingarrigues.com> wrote:
> As the framebuffer settings are copied into the result message before
> it is reconfigured, inconsistent behavior can happen when, for instance,
> you set with a sinle message the width, height, and depth, and ask at
> the same time to allocate the buffer and get the pitch and the size.
>
> In this case, the reported pitch and size would be incorrect as they
> were computed with the initial values of width, height and depth, not
> the ones the client requested.

Thanks for this patch. I think at this point in the 2.6 release cycle
we should leave this for the 2.7 release, given that it doesn't affect
the booting of the older Linux and Windows versions that work on the raspi2
board.

I'll let Andrew review the patch...

-- PMM

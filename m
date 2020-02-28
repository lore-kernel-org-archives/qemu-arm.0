Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp833211lfg;
        Fri, 28 Feb 2020 08:05:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqyCaUxu3IqOiPLBma0U0EO//ZnGZltZvyWvturAryqw0VZeN50OYB+AfQoQv/6UqMYIph+e
X-Received: by 2002:a37:e10f:: with SMTP id c15mr5277236qkm.143.1582905954453;
        Fri, 28 Feb 2020 08:05:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582905954; cv=none;
        d=google.com; s=arc-20160816;
        b=D1QR0PTHt7rg8iEe2VETgBHxz/yTvyDIyBiUGU6+2KpER4vVZlah67IqSmWvmfO9na
         3qnrJPKjyXRQKZFvNpiuaQRYs5tPEoyMXishHnJS/z+/t6oO3jpRG5Pm/l5C8Xq4albL
         kDGEdMkmj0jaJt0Z2K7nDIRPTJUP0x34Pvxbe7o4LFYFReSebg1J/z9m5rwzCK77dUu/
         i9B1NF24pQrl+VAIFa5n0chdeSI0C3PzyXg3uRDOg3bjOHr43/hM4OojYVlm32OAne3R
         6e9tsi6xvjZuNWMwXU65G+njakK746d2MBy4OZsNthbv72gv5bz8B34MFeWt7W67YtR2
         t4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=pgPpw1Fi1Ykytb0XJ7J0i83/eo1eMeohnndGMXJ4snQ=;
        b=zJX0sx2nibqTFsaDFgJ6eyyp1JWewMMgRaXpV38TeaIKowXtBvTwdeclBX9M05iyf/
         VnN+QkYDDLB1S0UHczd8MoNywoMTfC/Zt3QpIc9dhNUQNo6kq/TZeRCMswB6TgYblDNc
         4Hdakr0KfLAZ0bhFT6O+gRwNp+5LmxykBGmc3Y4TiVTn9JG6E70/HBaIwRYZ2OgugNPK
         KwhdRs4XYwQiIK/OFD/hUP6thkZy1UQaIod/PiLLN2vXQ5a1vh7jorgKuWzOFPtEPRfe
         bWd4D1N5cQEkfXWq6n2LcEQiCNBk4UslMMkToytrGA5rJCnj1zsZ7ty7TrxXsqX0yr2P
         1/mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nzn478lV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3si1624860qvu.53.2020.02.28.08.05.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 08:05:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nzn478lV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7i9B-0003WU-RB
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 11:05:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51477)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j7i93-0003Vd-6L
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 11:05:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j7i92-0001jw-0F
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 11:05:44 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:34612)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j7i91-0001iJ-Qf
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 11:05:43 -0500
Received: by mail-oi1-x244.google.com with SMTP id g6so1610928oiy.1
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2020 08:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pgPpw1Fi1Ykytb0XJ7J0i83/eo1eMeohnndGMXJ4snQ=;
 b=Nzn478lV6//uxLU4vBnOVYB4TEPmTwoWgLu0CS0bEJmnqnDk1uYR9buiBB3cXea1iC
 JHtwwmrpp6G45SoDnvWEhAiWg1EvpSSo3q1Vdb5VFtAFx6vUpQo0wR25kujcdDlyC1Ag
 GUT+Sephc5VpDFKPFpUpAOLhEqTN8WdSrVY+yly9l6YPsJanhe/LHkKh6yzKjcBjFX1J
 fUR+TU3Ii5d6eUTOFFYYisMRn9hMGJDTDj9+CPu2wue8msgNepLcYi8VsEKDUe0+vrC9
 KpkGHGDwIGHVyLO7O9UHWKuIeT3aYWIqNikkvk6CQRADbEtWYUAiEye+VK29SLA2Ivhq
 Wzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pgPpw1Fi1Ykytb0XJ7J0i83/eo1eMeohnndGMXJ4snQ=;
 b=AS7xTxp7aK2MapGevvsjBdpqRuNVZw9rGqgf8jsuCZfAdmtr08fE9d6cqwZOMZwS0/
 aGzV4Ta07VZTxZ1dxthkOTQnZ+ZlUVxLhWMKwM0a7w7sAa7A6LLfXJPxL2TWfHLiahDD
 hBgkIl/2HG7gF5q8kDBrA0sN8XXU2H/BQ2oZV3/pz/n6UQUxx7gsKZUoisyaQ3eyRDwE
 M8m1QdLg6rf5dlSRdOT7MvEqEjbSZ0k+awGnFaapUhJDTkuLgSPbYxv1DXRuhwXtMC6T
 hv+iBOuuq2vpFk3lwHdFR+spYz/AGOrJf003Mabacr85op8XA3QzyLbO6B9BAoxm2u5O
 n69A==
X-Gm-Message-State: APjAAAXCid7aLymuBYBUJeleOADqR7QXjHh+JWu61OA0Rf2WoLUVA4oR
 tvThXOx2BFjUeElDmK+WTlLUZHd2zKIuPYzhQvlU9Q==
X-Received: by 2002:a05:6808:3b2:: with SMTP id
 n18mr3535113oie.146.1582905943002; 
 Fri, 28 Feb 2020 08:05:43 -0800 (PST)
MIME-Version: 1.0
References: <20200225172501.29609-1-philmd@redhat.com>
In-Reply-To: <20200225172501.29609-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Feb 2020 16:05:32 +0000
Message-ID: <CAFEAcA8TmqGxjk9hSfFJ2AKH-9p7dt++kpc9WQ1kRzA73o-Rgg@mail.gmail.com>
Subject: Re: [PATCH 0/4] tests/acceptance: nSeries and integrator/CP tests
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 784Ll0iWAI9h

On Tue, 25 Feb 2020 at 17:25, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> This series collects patches adding tests for arm machines.
> All patches are reviewed.
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   tests/acceptance: Extract boot_integratorcp() from test_integratorcp()
>   tests/acceptance/integratorcp: Verify Tux is displayed on framebuffer
>
> Thomas Huth (2):
>   tests/acceptance: Add a test for the N800 and N810 arm machines
>   tests/acceptance: Add a test for the integratorcp arm machine
>
>  MAINTAINERS                                  |  2 +
>  tests/acceptance/machine_arm_integratorcp.py | 99 ++++++++++++++++++++
>  tests/acceptance/machine_arm_n8x0.py         | 49 ++++++++++
>  3 files changed, 150 insertions(+)
>  create mode 100644 tests/acceptance/machine_arm_integratorcp.py
>  create mode 100644 tests/acceptance/machine_arm_n8x0.py



Applied to target-arm.next, thanks.

-- PMM

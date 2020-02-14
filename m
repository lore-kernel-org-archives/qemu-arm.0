Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1678607lfp;
        Fri, 14 Feb 2020 01:26:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqzWYXv48ry7JyTmNJ9cYhS3CWChBpTmrpxzKZlsjMWYB1ODHCITmJqdgaz1TNTF3flmS2eQ
X-Received: by 2002:ad4:4c42:: with SMTP id cs2mr1306152qvb.198.1581672409289;
        Fri, 14 Feb 2020 01:26:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581672409; cv=none;
        d=google.com; s=arc-20160816;
        b=MR/zpQM/hLPuKyRxJJAqfMZ8T1LTXYshCkgIje2irETQxImV4KkbKEPPVKji/VsTl8
         +FOfqqlf2wIjyCOn1sddiozrj0/JMOzGUCOcTkvoRM/eLGKgjdgNhJhk33lx8GUZr4QQ
         EiAre1MSLfMxy/OBUqTgOvffpAVo16TAyjvh9ZdJ4vkX1W5a/LNfg5FmcMdp6GDDVtLb
         gl1Og3p7+A6vSu65h9s7Ysbd4FjyDQIquniBeGKHvuexFPlhYeBUwoEvl9pQbc7PIH75
         JmHMBFKAKefRpjJpLqRB7khRK1Xv7baDyreZHAQGLvS++5dwIFd8RYFXdwDHsPFrN3Ht
         b8aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Naq8o0gstU0K0l8QzCdUTMTZTl72zzwe6tWvByxFx6I=;
        b=eSsh2EUwPukPXJ08UDNh8cO1emmjxOuCLiSTe83UQ8PXucPaWh8GoCSXNY6ZPYRAKh
         /uGEjAgXXX43+QiZenEzvcQecznTPWAffXiSUTzvQIX+9t9WII2V+ILW4AmALYxxLa5S
         dbdYEMlGqNv/lF+NUDPZCTLs6GDU96yXhm6T/UG2KHmzc3nQ/tr9yCfCiDGOtyQGCDlB
         ROuxATVLdeA2jBe6VzBYfu3ynstkbYfMs7IeD7vgfbd5p6iABhN8+m58LfQEsK2LG02g
         beI+ShO3qR7uhBSjnwZgdWsReBuAIIO1MHeQgmCFDEyrVuiY40G/KEU+41/lQJxEZr14
         2/7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tyEV6hN7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k71si2502813qke.214.2020.02.14.01.26.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 01:26:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tyEV6hN7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2XFI-0005zz-I7
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 04:26:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49593)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2XF2-0005zn-5K
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 04:26:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2XF1-00077M-8g
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 04:26:32 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:32840)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2XF1-00076R-2f
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 04:26:31 -0500
Received: by mail-oi1-x244.google.com with SMTP id q81so8832469oig.0
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 01:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Naq8o0gstU0K0l8QzCdUTMTZTl72zzwe6tWvByxFx6I=;
 b=tyEV6hN7zeb685p0dU1hMJ/iYKOSL6MM9OZcee0FQi1IIuWxHuIlRDQEW6Shh3fTRv
 G3mCiY1eIXkZQbzZwo0cV3s7I9vwTdNWqgdFOVe93ymmwhfZ8cHq47kvOA9tJJsLlr+9
 zIgmQDpv5lyAfDlc/WyM8LUPP3xUs8iUqKqNLU31QRXkjygpIZzY9XBP7Tl79usu0EYB
 cD2uItsohv86400cPruuymWhncwkzD79VcV8ZSChkhOty9IWn63erhfWQtn6TYLCVBVX
 iPL2W8t/YtmJ41XhDeA+QzidGDiyf1QsSP/u/0M7N5GBzr/aA3/aHAib0DsKQkwgNUcg
 qHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Naq8o0gstU0K0l8QzCdUTMTZTl72zzwe6tWvByxFx6I=;
 b=gj29lAZ/xhHH0s2GwO5f893YlZZCCOqBDo/rkhdxtyPCk/2ZgT1Xb2882JgKqkOFRQ
 a1zmPLcbXTSosbQrrLZGE2y+9sF7If81nYyqw7/N/A//Ih19seq3ReEgPqvAq4/W7e/h
 jKaKQnroiWHAU85NZRuZXAPly30LIj/G24r3ZwsfP+4lpiZcT1XoHwyCmJpWIDdW3aCU
 3x5bJt17esFVQxn6iZN4ts8zxIoZgnIpzyLv7CIWLlByWMvKMP54FhN4UmATllFeqSOH
 n/P4CD74lmggkEumVMe6kk0xS5dS7tuZy3H/8viYoWSBE1CXd5i4cjJhASrYYqbmuWZo
 ucGg==
X-Gm-Message-State: APjAAAWUHFCdl8zS/SaucR2lez77vg81Kxx6N49DZzE4ZvLE+bHk+bOu
 syaBpbdefh7WS416UKVCwIw0JOq9p+ePhl1gyoM4kw==
X-Received: by 2002:aca:b2c5:: with SMTP id b188mr1221123oif.163.1581672390142; 
 Fri, 14 Feb 2020 01:26:30 -0800 (PST)
MIME-Version: 1.0
References: <20200214060548.24939-1-linux@roeck-us.net>
In-Reply-To: <20200214060548.24939-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Feb 2020 09:26:19 +0000
Message-ID: <CAFEAcA9nojfAx_MevUE5Z44cJ7OQzv7Dy5wRYy22tZpbnz-NAA@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/arm/xilinx_zynq: Fix USB port instantiation
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YNRSLDZqB0r/

On Fri, 14 Feb 2020 at 06:05, Guenter Roeck <linux@roeck-us.net> wrote:
>
> USB ports must be instantiated as TYPE_CHIPIDEA to work.
> Linux expects and checks various chipidea registers, which
> do not exist with the basic ehci emulation.

Hi; I didn't see a cover letter email for this series (sorry if
I missed it). Would you mind including a cover letter email
for any more-than-one-patch set, please? It helps the
automatic tools and it also decreases the chances that
I miss the patches when I'm scanning through my email
(when I'm tagging things I might want to review I basically
look through subject lines for single patch patches
and for 00/nn cover letters and ignore middle-of-patchset
emails...)


thanks
-- PMM

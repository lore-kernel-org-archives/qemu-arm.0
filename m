Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1201764lfi;
        Mon, 23 Mar 2020 02:15:28 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vukc2rny4czNGMWFk6YTCgfSaDdVRrkBrmrVZ5dkeFvR0370TIb7cbMbkmeCpjgws/nK5We
X-Received: by 2002:a05:6214:aa2:: with SMTP id ew2mr124291qvb.123.1584954928001;
        Mon, 23 Mar 2020 02:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584954927; cv=none;
        d=google.com; s=arc-20160816;
        b=TjD4Y7imDaJ5lFQGcQNK1ShGRKA1e5wLApHMKkQpgJz8mN8qeGDClEky/kRchO4mrE
         VhgizAPyVxbY4ArOe1CjEpX+WJVtx4lhaFIP804nKrt8A65eEe1ISSt27z2GuZ7A8mho
         8bWDqEn/vMnDXkEiztaqdWd78IjE6+1wS4bZEIjICfL50DWOLzxYq8xWC9nqjKIDaTWv
         T9INELJpUyYE3dU05qtUP2jDg12c+tsqyyr0g2ca3UkZdSzL0SzsAMhFErLrZTD8tS+q
         tn7efOiqZK3dPKP/yrZDNAivz69iKKIxnfED7y2XQViG2JddqLRvnZjYdi4GApVzKSBE
         tXow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=EUWJ8GOUn9hwL9Yz9puJR4/8Y57GGwK7T665TeWw/8I=;
        b=FSIlSbfJCn+Smujn8uzHx+u3xlfgeuEShMMTcsYAQT55eXKI0a+PFdcM9x8/3Mt+j+
         xqSFEkIvT+0WmPq4xlFOtlJf0jcj0Ij+b0UNJrPmi6CVse6fDbxeAkmeCbMv3GSt4Ndf
         W3tB62EYlu9ZRBZvR67hcbMad/qtP17D0WernPKeGmQMwlm6zXz7Hei4Kqw80wDT6OVc
         ff+dB8v2OizqCBfgNpja/YR+VRcZXkseWdU3thqEih7uogUUGcqKB54FuNXx96B1GHnG
         L6Tr3wFKM8ep/fc4s9roKfGIRR0upCrRIREiCHBpSMdeJ5nF9ADi6+vIdHehu3D1xMUU
         EAhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tIJiaCIs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1si8039766qkb.29.2020.03.23.02.15.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 02:15:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tIJiaCIs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGJB9-00084W-Ev
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 05:15:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51820)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jGJAF-0007IT-IU
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 05:14:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jGJAE-0004tE-Gr
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 05:14:31 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:46903)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jGJAE-0004sx-Ah
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 05:14:30 -0400
Received: by mail-ot1-x341.google.com with SMTP id 111so12590713oth.13
 for <qemu-devel@nongnu.org>; Mon, 23 Mar 2020 02:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EUWJ8GOUn9hwL9Yz9puJR4/8Y57GGwK7T665TeWw/8I=;
 b=tIJiaCIspPeTW5n9OrlzwUfFhBOuPl/1pL/04Ktl0AK/brzBkIqnMyJL5Lzocly3ov
 7ogIqCl7zjdhaCN/YJIaa3vBv6/B/cXYa+A829jOXuRn/McGBgKSoCnHtrBhyRpvmAtm
 7Aeo6lGiMZNhqXNdHZHS0iWkMZVuTBftpsC0VuRxaIS6CrtoHWoNOp8Uvb4ccE12X0ce
 SdYsuT/8ekbJwPr/STTj9WfF94VIxYU93V5OfuHVBZEuWsPQq2sGTW2VOcT96orJsHB3
 7twNhx88W9Yfj38W4z3Vpl8hI+Asa711j212iSDJtziN/14WV3bMKuXYUWkD5ZW9JODf
 PH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EUWJ8GOUn9hwL9Yz9puJR4/8Y57GGwK7T665TeWw/8I=;
 b=hApIbg/TlhlCETI0jyn7xGf0ZUPmATigHwIuyAI+KsjTwOXNrtzMP7fVFVMWoICdTg
 CEXqIMvqqHjJJwWmpfoiwDGhr7Al0SRo/8YEp/cOxhTHf8gFGO9rKXlGJpoyzCzRHizF
 QHO5BRN3WnjI7WvxTMND1W40/PUSBL682HdZDsBOQl0JEDWzFaveVzndQxxFrF2eqOyV
 tGDAphmxvmey0wl4spx7mp/5omE0RhAhJbkKKWvlsiNLLR99v6Z3U65D8dQeGWpDX2uj
 K0dzoUBLz7j/9Fe//KS9dZj2jGAU3nCiGzDlFw5aVnkwJRgKiTB7XqCq2O+muoJsYYbM
 3r9Q==
X-Gm-Message-State: ANhLgQ0b9f3bAeth9Asm9EeB6UbOyCG3CdOkvP76zNHfI3kCTsi7mCqi
 HSi+b+eYbCcW8ET9DdG8hLhyLXfa+/YfxH/WkY9Enw==
X-Received: by 2002:a05:6830:1f39:: with SMTP id
 e25mr2183048oth.135.1584954869501; 
 Mon, 23 Mar 2020 02:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200320053923.20565-1-clg@kaod.org>
In-Reply-To: <20200320053923.20565-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Mar 2020 09:14:18 +0000
Message-ID: <CAFEAcA9BTThqvOofRR4g_vbdgVkMf0083cy6jj3vE3Mevu09kg@mail.gmail.com>
Subject: Re: [PATCH] aspeed/smc: Fix DMA support for AST2600
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 Joel Stanley <joel@jms.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oh9jPgnTv37D

On Fri, 20 Mar 2020 at 05:39, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Recent firmwares uses SPI DMA transfers in U-Boot to load the
> different images (kernel, initrd, dtb) in the SoC DRAM. The AST2600
> FMC model is missing the masks to be applied on the DMA registers
> which resulted in incorrect values. Fix that and wire the SPI
> controllers which have DMA support on the AST2600.
>
> Fixes: bcaa8ddd081c ("aspeed/smc: Add AST2600 support")
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/arm/aspeed_ast2600.c |  6 ++++++
>  hw/ssi/aspeed_smc.c     | 15 +++++++++++++--
>  hw/ssi/trace-events     |  1 +
>  3 files changed, 20 insertions(+), 2 deletions(-)
>



Applied to target-arm.next, thanks.

-- PMM

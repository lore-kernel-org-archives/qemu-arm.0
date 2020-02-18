Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6353615lfp;
        Tue, 18 Feb 2020 09:29:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqwd1bgEZvH09zBczm0yL1hFR82MwdXaSBunC6d4IRrB/p0QY88p04IySP13g+VdSUUkyYn/
X-Received: by 2002:a0c:eed2:: with SMTP id h18mr17853091qvs.184.1582046979633;
        Tue, 18 Feb 2020 09:29:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582046979; cv=none;
        d=google.com; s=arc-20160816;
        b=wCBOs0g8Jj2cxHLybzYHG5l/+Z0Z09X8Jt2e7jQu8X7ZFh6BfrL797yp5yf2xSHp0y
         Zu9ay7GsebZrHUfKWXojZkmbQLov8Tq1mHdimdiFh93e+1pMoeD+pQyr6Fbz/fa+CzRh
         9mM48rjp7Ft0Ef+EgTxmO1kTNFHHI5Mv315CsdR51ztXc5KpNECTlCFSFlCsjUPSRUPQ
         dZwrSVVVcHszyCdiEmxnoNACBEpj24OipaP/ErpX0mwjGHRV9KNyDsaU9qxzkGEeAzku
         pgOf5WJluUK7xcan8lQY9GhJWdcHFZHWrEVYO3YluX+avU5nV2Lz5K8xLQPTPZmEyKPI
         iS8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MFL3lvzBKh6IY2wBd5R4FKgAYOptiR6fvNbeRvwFmC4=;
        b=Z5ssNHh1GFpBrBJOv7bH3aXlQwnsajh6k8gUU1LKRv8kzUo7jcPtR+rEdQ3W8AaZnf
         AP5PrLDRBh1bqaq4XdgTaaEy9PhWqyL0coAld3BculeU6katL9WtwQXuRxQkzf1WTlbS
         Z7qxDmXGpXXPq1cd0AOECWdJY1vBB6udXJm368fNBJuSnVzgVTGJQJER/chOntO5dmE6
         qWR9kjDpmAoPCojPoVrhdOM9Msd4H3lAVZcCmShUzmoJxHmiqxgMQ5IYeApZ7vTu86qX
         rqSvBP6R6mX4J/7+oc4EgDs7xjgZpsNrgjn0njNuot+ozw3CEFxbAXK+WIaVHoOcdgG8
         UA0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WQQJasgy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y123si2278949qkb.325.2020.02.18.09.29.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 09:29:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WQQJasgy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j46gl-00062p-3k
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 12:29:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53736)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j46gK-0005iQ-7O
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 12:29:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j46gI-0007J4-Oh
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 12:29:11 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:46602)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j46gI-0007HB-HK
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 12:29:10 -0500
Received: by mail-oi1-x244.google.com with SMTP id a22so20866885oid.13
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 09:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MFL3lvzBKh6IY2wBd5R4FKgAYOptiR6fvNbeRvwFmC4=;
 b=WQQJasgykmPAOBMHhe+qC9FKQ9efDZFMifdxdqoVmVQ8IEgjUZ4NFb6b3MebAAlieq
 ynJ81KOAyeSb4DzUtivOGRHRrN/gp3gA49PMA7JJhcYbi1uR6F14NFZ/c/ZYspJ+V6Ti
 oKKIMllieArx7hpctxJIGj7BIktZ/AOSq5pBffP23GXCKGhhBuwsnXVcB7RLKSOhdX2x
 h4d6ZmgvmG273ij/3+qpGqFSjudLal2PhcwlMFe/lpPgahtnAn5/WjQBiXOmwL1nbdVs
 FZYzNS/7IILlAbrAtM5+Viq789ljZdcJnrwsbKwMZK7aFR/2Er5DFgQYeVWIpRa805WF
 rWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MFL3lvzBKh6IY2wBd5R4FKgAYOptiR6fvNbeRvwFmC4=;
 b=lvIiRqTmvEx+s9jlAEV8liawUQUqMARRIbiQGSq2mMxq9Lkmo3Bh4loaJM9v6dJCcw
 wZub401wdQJIWFgv132F1YHjnX6Fx5qQ4TJ8NRE3zNp3A72obFSQcvMapYV875Yd+zNh
 b2FgE6+WS1yWgqZTN81tI3aW6VprXQ0zxMotdfg16mY9marNAZm6u8q5sjQmP80ljDXn
 dd/oGvMlo8FJTTMZdfd0KPZOa3wdyqZ4NnL4NLS465EsAP9hge3YBTn6qHLbO7KlkxRO
 jWAdEN9mmUGt4hGX8gEfNWeYwL7+4M71tzWJ4YQESCm2J0Vst+oF6FHAldKKrDGTt5uK
 WrDQ==
X-Gm-Message-State: APjAAAUkXW104HBIYMGPs0J6Sg8ENu93li+CsVex4755LMjNZLQIRvtW
 YhGdo9Z86Kinq+4azSxRxRNdh/cEKI/D0yk/8xalAw==
X-Received: by 2002:aca:b2c5:: with SMTP id b188mr1974655oif.163.1582046947625; 
 Tue, 18 Feb 2020 09:29:07 -0800 (PST)
MIME-Version: 1.0
References: <20200214194643.23317-1-richard.henderson@linaro.org>
In-Reply-To: <20200214194643.23317-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Feb 2020 17:28:56 +0000
Message-ID: <CAFEAcA-cm8bZRz1ZTut=p9x3pTfAe6yqJGZKxMVTOU4GX8Azjw@mail.gmail.com>
Subject: Re: [PATCH 0/4] target/arm: fix some simd writes vs sve
To: Richard Henderson <richard.henderson@linaro.org>
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wTfneSZ971s5

On Fri, 14 Feb 2020 at 19:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The launchpad bug only mentions EXT, but I found three more
> via inspection.  I really should extend RISU so that we can
> do AdvSIMD testing with SVE enabled...

Applied to target-arm.next, thanks.

I did a quick pass through for other functions that seem to call
write_vec_element() but not clear_vec_high() -- do any of these
need fixes?
- handle_vec_simd_wshli()
- handle_3rd_widening()
- handle_3rd_wide()
- handle_pmull_64()
- handle_simd_3same_pair(), "size == 3" branch
- handle_2misc_widening()
- handle_rev(), "size != 0" branch
- handle_2misc_pairwise()
- handle_shll()
- disas_simd_indexed() final else branch (the one with the second
  of the two identical comments about "The simplest way to handle
  the 16x16 indexed ops")
- disas_crypto_three_reg_sha512()
- disas_crypto_four_reg()
- disas_crypto_xar()

Probably false positives in that list, I just did a quick eyeball.

We could probably test this with risu by having the startup code
fill in the top parts of the SVE regs with non-zero and then
making sure they're included in the comparison after insns.
You'd need to test each insn in a separate risu run, though,
otherwise the first insn in the block clears the Z regs and we
don't get to tell if the insn after it does...

thanks
-- PMM

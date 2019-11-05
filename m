Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp1199806wri;
        Tue, 5 Nov 2019 12:28:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqzvxfxi2zgm3S/ilkuA3cxlP9gD8Fht+a0bSDqGN7RbKS1uAtFHf0Bja1MTsAJNdawn9OaD
X-Received: by 2002:a17:906:e2cb:: with SMTP id gr11mr32220414ejb.205.1572985699841;
        Tue, 05 Nov 2019 12:28:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572985699; cv=none;
        d=google.com; s=arc-20160816;
        b=AkwrWdFWElO5J9T/f5k/B/44bgw1e4Vby0FT9/KBRemiWpdV2FBYMKUohVQslG8skI
         DVX553SYJA+VHXHTF1tYbzRo8oN329VW8+ENpkYHnqbaWXa7SJ08CtRhKtajMwjNrWhj
         p6tIEVXAlpjP7V7T8O3M68LWpnUgGprJXMcRnuyIyGEwVa/pLNjbtPG21J2H3ZQQYqKw
         0lZnHTwRo5ZKQj+QwPh9Hjxtu63ESioEI0H1Bf1+YdWTJlzqvBxwRzyJNkLZRG30PHvl
         nzmBj5Cw0ZPakdIe0ge+ikUw0gsWpjsfELqKaXP3fqEPCtB02mNqOMA+G7UQO9W5lwFd
         GEDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=57MtDgGya2ixDopTm0gAiXbS8omOEDYfogKw+vGRjhI=;
        b=Rz5+sxUyuKgwnKp2UkbjVPH45fAHuchGGZgYMJ81dMChXpIPT07ng3KYidNXXAaPtz
         Hs+eQPf2HA/QS0zsF/pRkdaW0W8iqtzTRzCs77maiPObtpOG9fa16DwuhSmmw5W2N/g/
         axh1ZeWbVfiw8ZjduDhyksMgms5RwmdamySoG3POx3ePNUDKMb05PiVvRS3ZXU68yG6J
         Ka70cV7z+Q53c4E2GG6VJIHR2kMI3YJhKQR8ZR2Z5bLMRCvxOrtyGeFudNjQ9zyJqp64
         18f792C+Gj0RFglNOX66+cVtc5AimZTASttWsVm5BK7R0tLaiuio0WxZ/9vKA8yIPO4z
         xDFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZGvqdpvf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n1si13024968eda.359.2019.11.05.12.28.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2019 12:28:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZGvqdpvf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iS5R4-0005QE-QF
	for alex.bennee@linaro.org; Tue, 05 Nov 2019 15:28:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54923)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iS5Qv-0005Pz-0O
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 15:28:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iS5Qu-0006Kd-2j
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 15:28:08 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:42989)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iS5Qt-0006KG-Ut
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 15:28:08 -0500
Received: by mail-ot1-x343.google.com with SMTP id b16so18809511otk.9
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2019 12:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=57MtDgGya2ixDopTm0gAiXbS8omOEDYfogKw+vGRjhI=;
 b=ZGvqdpvfnQyqTLv/MkMjdDGyVc15ttlZ5MksgLkwcA6KwIc9rRDLQ/poLcyV1yvLrX
 KRvku6zCccMzyWqcXa2VbNTbnBjDV96592miGLatFcnwplPafMeNmCEMYyop4Z5mJksA
 JEe7y2YBDNlzMPk3JOx0knNzLOWuIsrIVk779ATBYGY2w6PPsgUzmEVklUAimS1AGi8q
 obPkmAX7e8ouWA5amKAVXXfKle7knW/PJM2ZznrkgwNMekf467huYDxB2NpMO8HrxqVl
 f0tpfhiiooN44DOv+fWMCTJoQvWCPLucA6//8mEHf5BrySPiOVH57YK/k5/xjABvSXWX
 Iqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=57MtDgGya2ixDopTm0gAiXbS8omOEDYfogKw+vGRjhI=;
 b=YwvX7dhu9eh3goj9GXxyps/UyXUCMh+adVlzczF9nthxqkfsJF+4RFxuTafhJeMXUb
 3iZNLhNGPnIMnCpBrRhx48P8v5brQvtW7PFz2geMGSipBcfSq2Xt/VKON8WaKkss6AYF
 JNtfT298e6gVg5Fy8p+fwtqUqp6RsR6MtYbxNsx16W03wNTVBSteZytnzrggYUvXKI7D
 fmnN7mo3xsIbRZ3EhGvW6nFMVXysS1oYQHYYqrwhFWKCAjMQpzgNJN8li7w41PREnKj8
 8SoF9N8gcXkTD6LM5VXrME+klYkXaFWuQDK5R5TQFPYtOIIqIilv9Mc0MmiqGJV5dv/g
 SL7A==
X-Gm-Message-State: APjAAAVH+5wjuv815kJeo/feqp4xJ+PpudHqyUBNbek4NWKwDtqSYD5f
 RKEsBZ+5PqH4adw3MJSzubtNFFCDOqGgKT5Q0Dabjg==
X-Received: by 2002:a05:6830:ca:: with SMTP id
 x10mr22806746oto.221.1572985687172; 
 Tue, 05 Nov 2019 12:28:07 -0800 (PST)
MIME-Version: 1.0
References: <20191101103232.3692818-1-luc.michel@greensocs.com>
 <CAFEAcA96tfJNVrnQzKyzooy7sJ__WKWWHXdAy_TNy=hSB_DOQQ@mail.gmail.com>
 <aff8e672-e0c7-a0f5-9c53-403a2e57524d@linaro.org>
In-Reply-To: <aff8e672-e0c7-a0f5-9c53-403a2e57524d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Nov 2019 20:27:59 +0000
Message-ID: <CAFEAcA__axmxsKL6NPYbGBMLS+YZ-aKNntn9hkSSg3nQR9Ksnw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/pxa2xx: rebuild hflags cache when modifying CPU
 state
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cbveHZrVbtma

On Tue, 5 Nov 2019 at 11:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/1/19 11:42 AM, Peter Maydell wrote:
> > The other place that might need checking is the PSCI/etc
> > code for doing CPU power on/off (and other callers to the
> > power up/down functions like the imx6 power control regs).
> > Richard, did you look at that code to see if it needed hflags updates?
>
> I had a quick grovel through hw/misc/imx6_src.c and didn't see anything; was
> there something more specific you were thinking of?

Not anything all that specific, but all the power-on/off
code is basically doing "change the state of this other
CPU by mangling its register state/etc". I forget how much
of this we do in common code and how much in the calling
code that handles the specifics of ACPI/imx6/etc.

thanks
-- PMM

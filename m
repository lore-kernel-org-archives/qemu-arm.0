Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2412785lfi;
        Thu, 26 Mar 2020 14:33:06 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsqshiU18WYWSD2HdhHwjTkfPetOuSl4oOJXxYE733QNqKbbw2CwvDeh/u3GG0M3kedY7nZ
X-Received: by 2002:ae9:c206:: with SMTP id j6mr11211520qkg.84.1585258385871;
        Thu, 26 Mar 2020 14:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585258385; cv=none;
        d=google.com; s=arc-20160816;
        b=Zi9qlh4QrvQigcR++teXUBcEQ1S4YecY6lQF2MZjEdZiTP5U9DGxQn9KXJL2qF0nMv
         +5XMBDFaufaFdedaueBPWXW1AhLofL7U5/Xqc6OkfBa+EL0krtzFlvPTwe5WIX1nTgqK
         h1KzCGsY6nlLFXlMOGE72fd5Gt1Y57rEdyf42auRhn0i6l7ntXpe3or9gvOP6JsJP48y
         byT98PvYE+pH4WnFr4BKHapwUK+tR8VBqhdZilbPyBJZ0jOSP74ni8ykBp0eLDWBb1aO
         gcO+xTjM0qVIF6phpSKHWrz9hk5v6FDvG3MIWlbnamrVtlMQ8Jptz3KIWLi9j4ZFcxHA
         NOpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=4bQJElQtxExdNClri0m5sgcXCnjLo99SHgCzJWX7tCU=;
        b=dwIRNi5ozhxGkJF8LDCalGdf1eJ2RGqc+WlnWuy1hSecnR0udOl4jh13xKcJTg6c2D
         YAQnaUcn/+qSVZawEk5WwNhKoEu8DWDA37Mp+LncKlhivjWmm26+Lpr9tijM/D3pWCet
         dZhMUTblcMG7R8cpovEPUo15IIs/qNnh01Cw+2dTtloygQL0j4b2V5R9saDJQoEvuiVo
         PJfapKmZeuGQG4Si3Sa2Tqw3ssMfxEStMVNtLq23CmP0VYTBFzcr2TCHyjmgEgYqeHj9
         EaeYQ2R23brMqXtggCQCAPt8eWm5TtW9PNDJ+GkE+HmSfqv988T04RSfqn/iMQW7UC3N
         /I/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r4wtG65F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w190si2265041qkd.9.2020.03.26.14.33.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 14:33:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r4wtG65F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHa7d-0006z3-9r
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 17:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52213)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHa7P-0006y5-P9
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:32:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHa7O-0005KW-Bj
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:32:51 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41379)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHa7N-0005Jk-9q
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:32:50 -0400
Received: by mail-oi1-x244.google.com with SMTP id k9so6953201oia.8
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 14:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4bQJElQtxExdNClri0m5sgcXCnjLo99SHgCzJWX7tCU=;
 b=r4wtG65F0C2G/xy8cnOso46Q1Kq9XK70ovOONPapRMhNsSTuv8jehWPG+LVe/Ur5XM
 WKXO94T1RtNgqdsNJe6O4LV5kApbV90934Vdxwu+tQKu2+PtJJGYHS+Ak+WFEtTaBZ+q
 f0bXdqljRCWtsNrJTyAvVqyqYWKE4cbCK/ODpn2ZDRivd5bWzbuQgNqJWDCpVgfOz5IS
 i0lDaz5iDOjoyMnjN+kRfRpAlFcjCyHpZo6rChP7yq5mnwsq4B4RkMuvTyBO/zYYiQdt
 vvF9U2Gcfcu8z5DKVhxyWCKWyfGiGzxISq013pYrAGpzAOZxGFG0lIZj57dUOIjWgulU
 WjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4bQJElQtxExdNClri0m5sgcXCnjLo99SHgCzJWX7tCU=;
 b=ilVcYZfX31+cytzkuWu7P7hb65pUSLO2XUY6ubwyiWYfQYB6bFuK+JogHOBJ4qZfC7
 LB87azHFIzq/MFSbfaguhSJ6YUinMM/hv25tLTA0bSbl76j58PobFhbPims9gsb5pISA
 +DOpB4NEo7hImF2r72MPfdXl01dtucEC//UzqTnHAC+zpPkhRhvI9ZFmGB++4ULynU7W
 oT8qZP0S1r0XiK6b8tWmomPO3vcX962frd+lgegn3pbtKmoT158HdBSJfKCtkqzvwAHo
 +yfA3Lt0ZcNt3WNYYgFa7cz9VynSxJTil6HAB/io1DzR3AIZzZElukdes7LjGDW/YgMK
 7dZw==
X-Gm-Message-State: ANhLgQ3YeulwgjWpVR3zmx2q/76gJlkj3tfNOTVZxKDE9ZbAKzLbSFF0
 pBU4Y9blwLYyzcC2TX6xeYedhZY2DHZwkN001e1erg==
X-Received: by 2002:a05:6808:64c:: with SMTP id
 z12mr1790415oih.146.1585258368267; 
 Thu, 26 Mar 2020 14:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-2-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 21:32:36 +0000
Message-ID: <CAFEAcA9qmwCmu-0OmNF-TkXzdd3qrhPxQRO6DS36X=Up2g4QoQ@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 01/12] scripts/coccinelle: Add script to catch
 missing error_propagate() calls
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
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
Cc: Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mNaSOovNVyQ1

On Wed, 25 Mar 2020 at 19:18, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> In some places in we put an error into a local Error*, but forget
> to check for failure and pass it back to the caller.
> Add a Coccinelle patch to catch automatically add the missing code.
>
> Inspired-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---

This coccinelle script is impressively deep magic...
My general rule with cocci scripts is that if they serve
the purpose they're written for then that's sufficient
and they're not worth trying to polish further, but just
for my own education I have some questions below about how
this one works.

> +@match exists@
> +typedef Error;
> +Error *err;

I didn't realize you could do this kind of "this thing
must be this type" stuff in the metavariable declaration
section...

> +identifier func, errp;
> +identifier object_property_set_type1 =3D~ "^object_property_set_.*";
> +identifier object_property_set_type2 =3D~ "^object_property_set_.*";

If we relax this so that we just look for "anything that takes
an &err as its final argument" do we hit way too many false
positives ?

> +expression obj;
> +@@
> +void func(..., Error **errp)
> +{
> + <+...
> + object_property_set_type1(obj, ..., &err);
> + ... when !=3D err

This 'when' clause means "match only when the code doesn't
touch 'err' anywhere between the two calls", right?

> + object_property_set_type2(obj, ..., &err);
> + ...+>
> +}
> +
> +@@
> +Error *match.err;
> +identifier match.errp;
> +identifier match.object_property_set_type1;
> +expression match.obj;
> +@@
> + object_property_set_type1(obj, ..., &err);
> ++if (err) {
> ++    error_propagate(errp, err);
> ++    return;
> ++}

Is there a reason we can't do the substitution
in the same rule we were using to find the match,
or was it just easier this way/done this way in
some other example you were following ?

> +
> +@manual depends on never match@
> +Error *err;
> +identifier object_property_set_type1 =3D~ "^object_property_set_.*";
> +identifier object_property_set_type2 =3D~ "^object_property_set_.*";
> +position p;
> +@@
> + object_property_set_type1@p(..., &err);
> + ... when !=3D err
> + object_property_set_type2(..., &err);
> +
> +@script:python@
> +f << manual.object_property_set_type1;
> +p << manual.p;
> +@@
> +print("[[manual check required: "
> +      "error_propagate() might be missing in {}() {}:{}:{}]]".format(
> +            f, p[0].file, p[0].line, p[0].column))

Nice to have an example of how to do a "find these things
and print a diagnostic". This 'manual' match is handling
the cases where we got two consecutive uses of &err but
not in a function that took "Error *errp", yes?

thanks
-- PMM

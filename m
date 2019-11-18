Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp204522lfi;
        Mon, 18 Nov 2019 07:38:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqykDHwouvwTlPfGcbEvbpWLoXmgijB3b4euhfiuCL+aTuVFVyT0/2sbJH0NVtlUIRXcMU9m
X-Received: by 2002:ac8:3475:: with SMTP id v50mr27877359qtb.105.1574091533255;
        Mon, 18 Nov 2019 07:38:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574091533; cv=none;
        d=google.com; s=arc-20160816;
        b=vuYbLIRErIRkkrzs9d86+IU1Q3kAZ2HQfA/wtnJpb/nniXk5sOCc6ph0g6yDMDOrFI
         /VfTp+Ci+nZU85MxNqbSRlo19JlpuBHaC5HYgUTznAxyIA+GfX3buu74k/8aYjU0ec9n
         o0DM2dZQe5z3WXKpXOMhG61l6KRF16hQLDj8LSMxu8CBDizuqag+P0OwaC6NYNgbTLua
         kl1X1RY3Q3mzOAnDrPATsEFVjUGxj21KVr7t3Gps3fdTvR5btNTrgp+GLDc0AEpopjsy
         p9ht/y05lLXxEn+XJfhuD10yrbb1xbiHlW8m6kfTHdQAkfnrRTw/y+yJ3HRnsO0eZ6Bq
         QE/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=1pD54Fbas7sgzt3kUq9V6FfsWPFxMPrH/M0BmfGXJdc=;
        b=biIegqDxm3Zee0Nfr3sNKculrvhc6lLv6tJKkQOtSJ5h7NkyUu0qOsGovOkvoYIBz0
         nELh4aQYskEB9xsvFDoZGtLHqEfQVK8tkbbxmgHh0nN8LK47usf16aQ83eBmajiUUh8h
         pS9JT3Fzhf+EByFoJfDb8y2O5UybKLzUJXdJOM+oca6xjfuzk77ZkEFlM9QlkXffEpZw
         8aCAOoC8+A80Qu2fzztytkIgacYjAKnVtJgCGErnEf5/dfrr+h9mUyYIa2/2mIajqtgZ
         /flUR1I9GxgDxqAb6jgrxv+UeNq3HaChmAVyYX8KdISiNsR4fMeVbEvObJYmT/Hq/GHq
         3WkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ffLsnQ71;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c137si11701353qkg.7.2019.11.18.07.38.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 07:38:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ffLsnQ71;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWj76-0001Xb-Mn
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 10:38:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39297)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iWj6u-0001Rx-GB
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 10:38:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iWj6t-0008WT-CI
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 10:38:40 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:34700)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iWj6t-0008V9-4n
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 10:38:39 -0500
Received: by mail-ot1-x342.google.com with SMTP id 19so4959309otz.1
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2019 07:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1pD54Fbas7sgzt3kUq9V6FfsWPFxMPrH/M0BmfGXJdc=;
 b=ffLsnQ71+f9vFFPY2XnobtteFoDAXJiLhYOw8TpFdK0Wxjw0uu8k57QwfDfc/ZKrWy
 gOe4598bK2zi5MB4gp88P/iIzB7zUJwkdt+ub7Z2xf1OmhftGwaV4Y0PiQ3GbyP6ziR1
 F/WqATmH0AXrgXbJyRY7XPHNQ0jqSeAAKPgzcvrBXfezSB5clE848v9sCMb0bQtbbo54
 uIve7eRJVmkDTYkaXQfWxWKTIcrCCCGApNCdKfhIq2I6vjv/ui21RRmC+H0a8Tj0y5JG
 2kDGmiEIeaujzIxKhISLPvnRyaEnfzDQaCc8O1UtxpbPgoVc/+Nqc9skWGK5H00aejMU
 ON1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1pD54Fbas7sgzt3kUq9V6FfsWPFxMPrH/M0BmfGXJdc=;
 b=MQk7lwq8b/WVPFlddoC+nbmWZrDStnLcV6MbwlGs5V2n/PpmcF3HocsWvekjmeCQSj
 QlsmFQ7WpmDPokJy5WzG8CRcwYIFULnUqYqp2USFRor26li002xe7pDdX3MgfknMmBny
 yWy0OAHQBkaMWx+/H8ISBbTOGsEkQ0XhHBU0Z0dnCr7tUDwsBVfH1hrJS+mlLUpyqcKs
 bHsycLeLszrgnwqZoRURBFeUf2t4rGGoND03t9KsZoA8Wh4N9X9GockGj4CS2ivIFN+d
 JxFqdP31rAqVXQOnks0DELpFRCS64Uq/d73lQOibvlZJA9kOnNmPGw8WM9e9RRTzY9eK
 nhSQ==
X-Gm-Message-State: APjAAAXqSUb7fc2GatgQeTGpgEn7HgSbEXX7byKa7cIcJyDXOlta3PNZ
 D1qMTYv+LxdzeQpS2xZB2HG2KycigQTF6c22DrVz2A==
X-Received: by 2002:a9d:6357:: with SMTP id y23mr320752otk.91.1574091518044;
 Mon, 18 Nov 2019 07:38:38 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-26-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-26-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2019 15:38:27 +0000
Message-ID: <CAFEAcA_gW21o9KoNyRkQNEh+ZZf7Orm5fymr=v94iVmXmRtSrw@mail.gmail.com>
Subject: Re: [PATCH v3 25/33] sparc: move PIL irq handling to cpu.c
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Paul Burton <pburton@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6vlZtGcb/E1z

On Wed, 23 Oct 2019 at 18:34, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Rather than tweaking CPU bits from leon3 machine, move it to cpu.c.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/sparc/leon3.c          | 37 -------------------------------------
>  hw/sparc/trace-events     |  4 ----
>  target/sparc/cpu.c        | 39 +++++++++++++++++++++++++++++++++++++++
>  target/sparc/trace-events |  4 ++++
>  4 files changed, 43 insertions(+), 41 deletions(-)

> @@ -762,6 +799,8 @@ static void sparc_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>      env->version |=3D env->def.nwindows - 1;
>  #endif
>
> +    env->pil_irq =3D qemu_allocate_irq(sparc_set_pil_in, env, 0);
> +

I think what I had in mind when I suggested this was that
once this was part of a DeviceState device you would then
create the IRQs with gpio_init_gpio_in_named() and
connect them on the board side with the usual gpio
connection functions.

I also don't know enough SPARC stuff to suggest whether this
irq creation should be conditional on "is this CPU a leon3"
or not.

thanks
-- PMM

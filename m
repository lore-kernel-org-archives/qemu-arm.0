Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp662803wrs;
        Mon, 12 Aug 2019 08:03:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyNjlYtYkuZyvkd2HhkeESJpUH0HdyvjsdYrwlyT+d+rKBXvasrv6o3olyhVOhoDqDGiaWb
X-Received: by 2002:ac8:1a36:: with SMTP id v51mr30298688qtj.201.1565622197711;
        Mon, 12 Aug 2019 08:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565622197; cv=none;
        d=google.com; s=arc-20160816;
        b=xBA7eJdRtW9pZ+evS5JEPum8Um4zyVs0GXPHpDFJmwMuv4KC2dvLaj4qAM1pDqBc1N
         2NjJWYeZGzVDh6vGRWvbZtqglvMkF3Fv/26mNIx/YMjANfdyMIdHxaCAWIyB50pvYTN9
         4/1Y1B72Ruf7oBaRc7dZ/+l2ASSusZAXkR+b7pCWet5npV2+KKPJQp4zb5U1nGbbdcWM
         EjYHmo1d2XIz20Fa5HqE4ECjPjHZD2tn3PQwdLTMfNiMXhwBmDKFXRHrr8uPdypf5MAG
         qRdSLnWaJlp6jXNmp+Ftkj90WXpnZ7PZv2104A5Oq81/U82kw9+LjV14J584JHznUGW1
         fg/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tC6Srj74zjvGWIhfZf4qft75KEFoF39M0w32NpsseYk=;
        b=w1RNWtYCWYNSsbqMyApzr+motHPiP7L5yEjuuTkVagRTEvyGu6dP+DddtgTf/SlacC
         5W1tjyzgcDrWhuknc3x9XkEUm5ZfDnAB6whMzzXsNBcT8x+PDfZ6Pfd8qBb/UrPtiEmk
         pwP+Ns/eNYme/oHbUVw4csedgp5zioAkXqBgSDdhJdG2iZRhDeOY+ETVQu5/W0FHRM9M
         djg7jmGy09hbjcMDBptpH/8vf0sBFCjEFITYf+zYrJvWmi883w57ldLMVv0vQGTPJ2ge
         MJgZ456eRlYiQGYcVtICmWpb3Fo0G+5jDNBijaM3sKv9gckBfbpgBYTIX/aVIUnC7Hva
         XK7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IbtJ8Ha+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14si4525461qvf.154.2019.08.12.08.03.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 08:03:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IbtJ8Ha+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hxBqv-0007ve-9P
	for alex.bennee@linaro.org; Mon, 12 Aug 2019 11:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39779)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hxBqn-0007tS-Cr
 for qemu-arm@nongnu.org; Mon, 12 Aug 2019 11:03:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hxBqm-0002o1-9a
 for qemu-arm@nongnu.org; Mon, 12 Aug 2019 11:03:09 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:35912)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hxBqm-0002nk-3s
 for qemu-arm@nongnu.org; Mon, 12 Aug 2019 11:03:08 -0400
Received: by mail-ot1-x344.google.com with SMTP id k18so27781202otr.3
 for <qemu-arm@nongnu.org>; Mon, 12 Aug 2019 08:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tC6Srj74zjvGWIhfZf4qft75KEFoF39M0w32NpsseYk=;
 b=IbtJ8Ha+oIhXenXWNMHwttWMaA/Q4Y0Fe/oXENFY30UHKM7nMDx/VnVqTk5T5JAILZ
 sAp+8Jwhht1mwAeZu5pn7ph7lQRJvqJCakrOQmqE9ZQxjsVRC2NIM5EqQi2eJKMqKAG7
 LsvGrgy2qoa75+Q34M8xkBcVmr/DNR7uwcCsGU2nLR+5pu1LOv5WnLypd8SFgr2ipEva
 ym4AXYBbvzjT4FrYND719C/CCdLXvWcapwLXCZZfLQW9aejIufjhwN0uF4nELA8TKwJu
 lAWXqjCzJ+FlPaoFprTHpNQlVDKTDR7RwRHaXThucI2yk+J7EN+PjatrbsJJAi5W5ZSI
 wuvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tC6Srj74zjvGWIhfZf4qft75KEFoF39M0w32NpsseYk=;
 b=SSuFaKPttKhH7zBdMYIPmbPYoyG51dMr6kC0N2Hvhq6lUaY0hjXjDUxzV/1ETWhbK0
 i08bXjQITOz9sgjOB+ZYZroIvroRopOnVrQi63pRFaBxZKPwPS1cMO4WQaZH4E7798rF
 Oz0iHyqd7qSntp29Fyg06t/5R/18hR0L1znlLjcw7NRi1+kSj5StKdTlPV16F3RGY8uO
 SKoDEimOvkr9DeUrq0+Ek9CCtPzKPzWyANOL3/z2ewy9VzLQlX3OmZctl790fwtwvxcw
 qwv7Dqk9LlCAQkZGkGheX69/HpfKHxFXbjH5TDZmr+8IwvQPJlpKZ8W3UIQURBa/C+9M
 0RKA==
X-Gm-Message-State: APjAAAVW34YmFM2sHa2sHTsRFqBrVX9CE2c9sjVvNnbeswoLiCmWz0Wz
 ZUIRs9sGW09h9E7NwVUOnWhs1m2y9gVhX7P87gHmGXUu
X-Received: by 2002:aca:6185:: with SMTP id
 v127mr15868637oib.163.1565622187184; 
 Mon, 12 Aug 2019 08:03:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190812144442.30027-1-aaron@os.amperecomputing.com>
In-Reply-To: <20190812144442.30027-1-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Aug 2019 16:02:55 +0100
Message-ID: <CAFEAcA-GnPAL41MQouLxs_7y9Xj_E30k4Agx20eWObau2p02AA@mail.gmail.com>
To: Aaron Lindsay OS <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH] elf: Allow loading AArch64 ELF files
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HkJx/xU5T+KK

On Mon, 12 Aug 2019 at 15:46, Aaron Lindsay OS via Qemu-arm
<qemu-arm@nongnu.org> wrote:
>
> Treat EM_AARCH64 as a valid value when checking the ELF's machine-type
> header.
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>  include/hw/elf_ops.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
> index 690f9238c8..f12faa90a1 100644
> --- a/include/hw/elf_ops.h
> +++ b/include/hw/elf_ops.h
> @@ -381,6 +381,12 @@ static int glue(load_elf, SZ)(const char *name, int fd,
>                  goto fail;
>              }
>              break;
> +        case EM_AARCH64:
> +            if (ehdr.e_machine != EM_AARCH64) {
> +                ret = ELF_LOAD_WRONG_ARCH;
> +                goto fail;
> +            }
> +            break;
>          default:
>              if (elf_machine != ehdr.e_machine) {
>                  ret = ELF_LOAD_WRONG_ARCH;
> --
> 2.17.1

What problem are we trying to solve here ? If I'm reading your patch
correctly then it makes no difference to execution, because we're
switching on 'elf_machine', and so this extra case is saying
"if elf_machine is EM_AARCH64, insist that ehdr.e_machine
is also EM_AARCH64", which is exactly what the default
case would do anyway. The only reason to add extra cases in
this switch is to handle the situation where a target's board/loader
code says "I can handle elf files of type X" but actually this
implicitly means it can handle both X and Y (so for EM_X86_64 we
need to accept both EM_X86_64 and EM_386, for EM_PPC64 we need to
accept both EM_PPC64 and EM_PPC, and so on). We don't have a
case like that for aarch64/arm because the boot loader code has
to deal with the 32 bit and 64 bit code separately anyway, so
we can pass in the correct value depending on whether the CPU
is 32-bit or 64-bit.

The code in hw/arm/boot.c passes in an elf_machine value of
EM_AARCH64 when it wants to load an AArch64 ELF file, so
for that the default case is OK. The code in hw/core/generic-loader.c
passes in 0 (EM_NONE) which will be handled by the check just
before this switch statement, so the default case should
work there too. Presumably there's some other code path
for ELF file loading that doesn't work that you're trying to fix?

thanks
-- PMM

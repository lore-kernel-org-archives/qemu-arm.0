Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp191777lfm;
        Tue, 28 Apr 2020 23:17:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypLc4NIocvQzi0pfoT0u7c8AcLhXm8vdP/9LNxG+fuN418uTA0DYBB6Whbmwg7OTUw1Z8s5k
X-Received: by 2002:a0c:fa4c:: with SMTP id k12mr14431138qvo.85.1588141061612;
        Tue, 28 Apr 2020 23:17:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588141061; cv=none;
        d=google.com; s=arc-20160816;
        b=LwZ5kQyduStc1OCENr+IWI/oAxfFej+A2Kpuv9/OGEMqZMLVYTwrcLlLVih7uTQdFb
         2cvzG4O3u9//bFFcyBPPiVEpZn8DwXsxPBWLSbzJtIG+p/Godl/nBy3Zz9iqI/CJGPDT
         0gkdJzZeZRI8V3P8dDwad7lf/HdqE7wtPBoTF9ycMsSOOrO2L+2aXRerJb15ffUl0iB9
         Y2QYX6Hfx+ysHNrP8WelPAhT6p+yh1Z/IWMLTuI6hHNCv9xedMT+1++Jm/oNH9Z1K0zq
         rjnr+/tKC1EDZU+FyrbSn9fUgVmjTTkWe/sUtft+bGfKgbbS8Yw1jnhmd3ZUTzeuLoPN
         Ug/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=iSIbzNzDUoU2tb+jAkvnU1+YMosV9gs5oQXAMlCd7EU=;
        b=mVXDYGgWf9rk67eNGb8jhDebxBLzl/jdZPp43Vri4lEZDe1YBT0k5DTidRUxGTjRJA
         0jzvIR8wAcGNfDjIqfdJiYfBaP4nur67pGivYmWmegt8eCSKUZu6VblXuLu6LDYJGJqY
         r9ygAJuI9AnAG9WwJxsyNlUqrpSRtFgxVRuH3wRtmt2r6BmJQJTnJpnhk/+QIvUpzHzW
         x4pVKlRy+RuCmNvno5ZblVt+KbQzp5X4/qGEfxW0SRfqOo4APr0VqW6AgaiZxp7CEhe4
         RdaDgZboDWXXiLyBVzBa+vZPBoTN2FAPCjyZ+4ypA44g/UDB2BmQA727WAab4Jpx9ASQ
         4YYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rpnGuceE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id 84si12114517qko.191.2020.04.28.23.17.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 23:17:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rpnGuceE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTg2P-0007kB-0I
	for alex.bennee@linaro.org; Wed, 29 Apr 2020 02:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39928)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent.desnogues@gmail.com>) id 1jTg25-0007hP-GQ
 for qemu-arm@nongnu.org; Wed, 29 Apr 2020 02:17:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <laurent.desnogues@gmail.com>) id 1jTg25-00066z-1h
 for qemu-arm@nongnu.org; Wed, 29 Apr 2020 02:17:21 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:44570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent.desnogues@gmail.com>)
 id 1jTg23-00066D-Dg; Wed, 29 Apr 2020 02:17:19 -0400
Received: by mail-il1-x141.google.com with SMTP id s10so1288801iln.11;
 Tue, 28 Apr 2020 23:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iSIbzNzDUoU2tb+jAkvnU1+YMosV9gs5oQXAMlCd7EU=;
 b=rpnGuceESD1r1pGomRxn30x7zVyMDexrwTnuxxqPP45hS5Y8J1mN0eEi30T68/fWGX
 RP3l8NYRH16MD464hV69j2XKmJaR9/+kVKHvqbfc57PRfRhrWGXlQT+p1IDIWd8rmfCn
 Hi9b9a+dw26GYu9VGBq2l+PsaBY+UgFNm1Rt27Yi1btwuU0sWGVBHb4h3xo3ZrBFIwBE
 hhbcFYLgYu2HnrHzQDwrdZMw2L+yUfuy/CeeRmYXZDnLDLDfOm/EBeF5GWrcSjFYusVs
 9f48xi9Os6mB3Qm06y7KBOi+EofBnmlq1W94kvnc52IYcppKMYiHv86c6eBGk9Oj9fIu
 g8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iSIbzNzDUoU2tb+jAkvnU1+YMosV9gs5oQXAMlCd7EU=;
 b=JezPMPsQJEHUw7/YTIcsMhAeKcVwQgSej7kRSWWKBiLMbHlBMi6Tz12VlSjXWF/P0M
 XE7e/lxe8KbqQ8ooFFoYW0Y1aQBlyFZLdrF0ZX9FT7OgleXPYCnOo5G8s6qfkwNLtElo
 ZnPZq4KYBVHo38ar5HRkTJGWWhLA/JgqRy6UKiqj0M62+uyyJx3KSpeUYL/Xswn/A7gK
 /ibf5kUKgGYH3gd+DDbkRVPVzm/Paiy6XV3GVWaa3Dymy79xLP+v6GQily6NbBm0xFMD
 SWtZSn+YkMeAn0rOOZeYiKIy0ak8wwTXvJUrHnFVHiWjYaQ0ePVnN/diYhobbr8/bSMy
 Utgw==
X-Gm-Message-State: AGi0PubtUFpvxPLPmHxCX1F35LgUJLsj2nC/LyeZ47S+4Jz6qIaPzWA9
 Eiztmx/oaUWxcUyaCNpmCrRuxfvfjlKb5T0mM68RVDtZvfY=
X-Received: by 2002:a92:3dca:: with SMTP id k71mr11134521ilf.22.1588141037809; 
 Tue, 28 Apr 2020 23:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200428172634.29707-1-f4bug@amsat.org>
In-Reply-To: <20200428172634.29707-1-f4bug@amsat.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Wed, 29 Apr 2020 08:17:06 +0200
Message-ID: <CABoDooMniYBAJPCkSjBwgRAQNpt_7P6PwnpoZKrdHBaEQQ0mGw@mail.gmail.com>
Subject: Re: [PATCH v3] target/arm: Use correct variable for setting 'max'
 cpu's MIDR_EL1
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=laurent.desnogues@gmail.com; helo=mail-il1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::141
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +LVsVOfBVo9R

On Tue, Apr 28, 2020 at 7:26 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> MIDR_EL1 a 64-bit system register with the top 32-bit being RES0.
>
> This fixes when compiling with -Werror=3Dconversion:
>
>   target/arm/cpu64.c: In function =E2=80=98aarch64_max_initfn=E2=80=99:
>   target/arm/cpu64.c:628:21: error: conversion from =E2=80=98uint64_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} to =E2=80=98uint32_t=E2=80=
=99 {aka =E2=80=98unsigned int=E2=80=99} may change value [-Werror=3Dconver=
sion]
>     628 |         cpu->midr =3D t;
>         |                     ^
>
> Suggested-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Thanks,

Laurent

> ---
> Since v2: Do not use RESERVED bits.
> Since v1: Follow Laurent and Peter suggestion.
> ---
>  target/arm/cpu.h | 2 +-
>  target/arm/cpu.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 8b9f2961ba..592fb217d6 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -894,7 +894,7 @@ struct ARMCPU {
>          uint64_t id_aa64dfr0;
>          uint64_t id_aa64dfr1;
>      } isar;
> -    uint32_t midr;
> +    uint64_t midr;
>      uint32_t revidr;
>      uint32_t reset_fpsid;
>      uint32_t ctr;
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index a79f233b17..7ff80894b6 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2757,7 +2757,7 @@ static const ARMCPUInfo arm_cpus[] =3D {
>  static Property arm_cpu_properties[] =3D {
>      DEFINE_PROP_BOOL("start-powered-off", ARMCPU, start_powered_off, fal=
se),
>      DEFINE_PROP_UINT32("psci-conduit", ARMCPU, psci_conduit, 0),
> -    DEFINE_PROP_UINT32("midr", ARMCPU, midr, 0),
> +    DEFINE_PROP_UINT64("midr", ARMCPU, midr, 0),
>      DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
>                          mp_affinity, ARM64_AFFINITY_INVALID),
>      DEFINE_PROP_INT32("node-id", ARMCPU, node_id, CPU_UNSET_NUMA_NODE_ID=
),
> --
> 2.21.1
>

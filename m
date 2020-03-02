Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2571876lfg;
        Mon, 2 Mar 2020 07:34:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqzV2lzwPNctqq2ughCKigtiBVBXGsvsRfl6bT+qfZJzVeUivwrFXGJYOC8QVme6+VxWpTbB
X-Received: by 2002:ae9:f819:: with SMTP id x25mr17041389qkh.9.1583163273492;
        Mon, 02 Mar 2020 07:34:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583163273; cv=none;
        d=google.com; s=arc-20160816;
        b=H+/3shaRM2Fj+t5R5XRZBnuIJR5MGuVM5b7vyTS2v6v6C8VqoD0WBonfs15NiYOnqn
         2yySnP5FKhc1NwZdoMynRwlIAOxPgzOAR+WPyLYp3Ahi+6GsbBaOpa2/TYRGxkKt+mk0
         cDhz1pn0yYx0WwqhWOj1FVwhQ+jtR2hIx0LCTZ01BWhlxwvbZwBnn66YKCd8Df90slHD
         /6FNE7cLfmNCn5FREtIjpRqZZuthxFxegChV1grEnk4cipYXmufzZBgzFbwr0Rx/qPJd
         hWpODe6Xlp8qugrxISuQlLuzZr15OZ8F03Xm+dpdEDPx5xSEEsg5lkv9rYXIma5CdNrg
         265g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YkLw5iFYwtgAxG69XoDXapikUPoI3cTv7TsRqAXNEkA=;
        b=Cf7uEq3WIJCHDgV0TGXEysGTckNrHNS7GjVSnxTooKMEgEOybW0+l++rhKa+tA6OO7
         d5C4c++rZ2p8BSVq7dK/+i12urMLxInP23GD1PqQYMQ9Rt7X9dkV46iJowhD3qUWey1Z
         in2IOwxuKSGRkJLbBOV79xhZ/tZN+QrI585t5+Kw/Y9tn9KClJPD+jnnA5t0c3WGvDNf
         X61zwWV9gDX72+SGssDrTkLpepxiA2mmwH11aAXvh+x2TBhQlQXJiptgkpAvkcFfTUcl
         oXkmMwli/3RgLmqRZ8qfLUi+yMDe/AkomQDB0hvPUqFJSMvToisVpzpZocOI5uj43Z61
         5QAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vQ8SQ0vG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9si5923981qkz.146.2020.03.02.07.34.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 07:34:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vQ8SQ0vG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8n5U-0000Ac-Up
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 10:34:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41640)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j8n4E-0007bP-Gj
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 10:33:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j8n4D-0005pB-EE
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 10:33:14 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:37092)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j8n4D-0005ov-96
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 10:33:13 -0500
Received: by mail-ot1-x342.google.com with SMTP id b3so10124498otp.4
 for <qemu-devel@nongnu.org>; Mon, 02 Mar 2020 07:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YkLw5iFYwtgAxG69XoDXapikUPoI3cTv7TsRqAXNEkA=;
 b=vQ8SQ0vGFffkQM8fgG1oNh+i8WBA9qoh1n+1wRhq1b/Psz0mhGV8QoENtNNZ1PKBS1
 vv0z9cLYTD/ap47Nv2da7lEktoF9lPbyjXvtigfvVnS9wySg+MYKnt2GN9kATTTud5GI
 Fbft+86i76hgHXMHRV76rGlQf6J+teubIuDd/kWRURJppMULLFGWge9wTcXoFEmJ3QmD
 2DKdWdhhF+AfeOP+x7t7yFfrTdUeRY2tR2w3ZwzwNR46ID2PfqthooMbXfjem1AqyZ3T
 CsB04EMlHDCg9k3xIvv/Uz7FvdHuEqGPDUkJgc5s/izqjqUp/AhyEf80449J1N5nBq69
 +xRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YkLw5iFYwtgAxG69XoDXapikUPoI3cTv7TsRqAXNEkA=;
 b=TekOAGc+cVsJKohKDnvLze6WRCGzAJv4i6Bfc9Jkn7uboM4yAZiFmNKC90hEwZPoUe
 3AU/OvB1iNy/PUIRPgyPcHkaL2B7ON37+kxtPKOojXwe30Mr91BbwDv0WdN3FZqhIkZx
 ftlmvpv612gk2MhECTzeeA0mB1gR9CA3V0+RO9l7T+aeDtJY1BWAGBk7setTYrhinuM7
 gg9Li6qerz5yDLw+x7WSBCMF+Dx4Unnx//IvwLTNtfFvyRJKwMHIuTPUv8E1XpRk+yIq
 72aXmzUCRenpoLQRLDA3dtQMPKentnE7QY7xT7sKxQSKN4yHX1oJGFyZpRBOVnR2jq4b
 nOVg==
X-Gm-Message-State: ANhLgQ2dqA5/h/GhVYaFCQL97FIpQZzoX1o5xTk7gI6ZG8x/SIJDZ8aA
 9DINOgnz+Yx/+1mKzqhjS1jOK8btTaC+qAOKGNRqFA==
X-Received: by 2002:a05:6830:1406:: with SMTP id
 v6mr4404067otp.232.1583163192261; 
 Mon, 02 Mar 2020 07:33:12 -0800 (PST)
MIME-Version: 1.0
References: <20200227220149.6845-1-nieklinnenbank@gmail.com>
 <20200227220149.6845-3-nieklinnenbank@gmail.com>
In-Reply-To: <20200227220149.6845-3-nieklinnenbank@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Mar 2020 15:33:01 +0000
Message-ID: <CAFEAcA9cbCNYo_RP7VnHxuR7LNjdwViE6NCVCuoea1Q2SsrvEg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] hw/arm/cubieboard: restrict allowed CPU type to
 ARM Cortex-A8
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aUyCSuokNLup

On Thu, 27 Feb 2020 at 22:01, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
> The Cubieboard has an ARM Cortex-A8. Prevent changing the CPU
> to a different type which could break user programs.
>
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>  hw/arm/cubieboard.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
> index 0195925c73..010375f0a8 100644
> --- a/hw/arm/cubieboard.c
> +++ b/hw/arm/cubieboard.c
> @@ -30,9 +30,17 @@ static struct arm_boot_info cubieboard_binfo = {
>
>  static void cubieboard_init(MachineState *machine)
>  {
> -    AwA10State *a10 = AW_A10(object_new(TYPE_AW_A10));
> +    AwA10State *a10;
>      Error *err = NULL;
>
> +    /* Only allow Cortex-A8 for this board */
> +    if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a8")) != 0) {
> +        error_report("This board can only be used with cortex-a8 CPU");
> +        exit(1);
> +    }
> +
> +    a10 = AW_A10(object_new(TYPE_AW_A10));
> +
>      object_property_set_int(OBJECT(&a10->emac), 1, "phy-addr", &err);
>      if (err != NULL) {
>          error_reportf_err(err, "Couldn't set phy address: ");

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

except that we're not preventing the user changing the
CPU type, we're just giving a helpful error message instead
of ignoring the bogus -cpu option.

thanks
-- PMM

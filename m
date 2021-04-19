Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1221894lfb;
        Mon, 19 Apr 2021 07:30:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsN8bfm4uKZS3mw8bNl3kOXDARAs9CVAVGLIJQK4u4ZAhgxzqf7zea6EpOsnyq2gfIZEu9
X-Received: by 2002:a05:6e02:1ca1:: with SMTP id x1mr17504575ill.86.1618842611685;
        Mon, 19 Apr 2021 07:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618842611; cv=none;
        d=google.com; s=arc-20160816;
        b=U4PrMu0z72HcJry6JjXySCAJim/jyvxB8EMq7tC0ohpo2Nr48wU4Sv0YGbTOJSYefk
         7FDZg8hqyrQbLGDw53ZltkGTwW9y6k+XwzoALPq3Uh+w7wNS7Tj2/qXRHm7ctx1d+jHN
         DprWyVMysJhUMKQXiMeUbuKq25JywpT3EKh9e67Og8HVocOvJzmXtEVZgG8FYjbu5bvR
         hy5cmS9wKDk5pT6J04Le+d0yr+XiIITUyZW/B15OvGXUDxXRx9ZBkfSjLsnjTXkrAcYO
         5NAjjEhCESAeJIxmVYlUiz/KOCDuvpCDeYeVPuluxfrVmUI6oYtEJ/3NakFcqU6D4GZ0
         z1Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Vn8ttxvU1uZLhGd3j4uqhbl/CWQ5aFOsoM4eJo5C9+Q=;
        b=JghuXm0Nd59UY/PQCdfxA8p4Zh30qc6YjsHHCXQsREzeSXmYsC4EMVvQvz+BylWMEw
         RG0O/HuhS6ADt3Q7XgV7VdV3mlbuM2OxR6nA8Nrb3C7aorbK2KXNC0rQFqYFpw3apR96
         cSfv7DrfeT5RcuwAPdcukKuF6eoWW+1mxCpzuupUDJzx6zSC5117wEpU1LDQPaz18ghS
         82PBkuLzCBeD0XCTx7raPqSwzFnSzZEs9hE1efhKDCo3Dg+5inc7fjjhD+h/9y1bZALV
         wVs44pUIaWyrqW0g9le30PpecEszjhiXhzYohbSQ1Roq2S29k2EKqeb65LxZp9rqZGq2
         m57g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LowJQSAz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a25si12034810jam.32.2021.04.19.07.30.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 07:30:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LowJQSAz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYUuh-0005mL-0a
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 10:30:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYUtO-0004VB-KA
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 10:28:50 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYUtM-0008El-Fs
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 10:28:50 -0400
Received: by mail-ej1-x636.google.com with SMTP id w3so53282553ejc.4
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 07:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Vn8ttxvU1uZLhGd3j4uqhbl/CWQ5aFOsoM4eJo5C9+Q=;
 b=LowJQSAzVkeRhtYWECzgOJIv0dr09A2fuEwh0l2ejE566KPWwh7BUXBIoMUR63s0VF
 kAypN6nK/JyIdi/S0M5DormS2euOIJ6wJ5qZ532ZK+bQgviLShzPr8Domrnfv6j+eCK4
 1qXH29dMCBHB9znaI/NqFNJKCdWknFS3cG47fgEy8Q4DO3Refia3wnyIwdQxKmT4be8L
 0IjFlFESVWEufOtgyskREfnwpM4qiStfejbMggVi9AzYglMj2Sj530cCkd74qTUTV7Aj
 r0BuuHuSoxXC0VT2hFKrtVosJDx/2KHw6NuIGqfH7kZpV2j2Qc28MgBcfdBiMoMlO12t
 0kXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Vn8ttxvU1uZLhGd3j4uqhbl/CWQ5aFOsoM4eJo5C9+Q=;
 b=QMwfboDelWqs+6t9cNAL7qhz8bv0yVOGx4BdwbcYxmcfYHdFPsc/Lce6WAgZDih1RU
 oL2ZoN4JEhm0jn37nNGSvbg5ePwK2NfqpMnSl8EHNSUw72MmTvkIWwkj+kQ/Cr6RobhJ
 VlZ8hSD2mwfZe9jwIQ5sVbc5CEVnLf2SMPSNZE9nyfv17A3Qn3IL2xBWyq/u4zclgJJf
 KWETdc6GLyho82xREaYjJJDKv6DfZhZzXV1yxiE6aM2h7KYtpai7ivimEPKOSiNUP1cg
 egUWIybEqQPZB/fG7OkJU7Yo8ZN3LPZDjmsA3CRKrSEeXVfWGg+HGQI1zoKV7N4H3xSD
 AZKw==
X-Gm-Message-State: AOAM532yF8SOS4HmFKQpjlkFWbMV6J3Yicp57laKpm/1Nt7rIfQTYPyl
 gvv8//gW/cAnLYwKROJaKePqlO2peoO7dscFuqG5lQ==
X-Received: by 2002:a17:906:953:: with SMTP id
 j19mr22696665ejd.56.1618842526949; 
 Mon, 19 Apr 2021 07:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210409062401.2350436-1-f4bug@amsat.org>
 <20210409062401.2350436-10-f4bug@amsat.org>
In-Reply-To: <20210409062401.2350436-10-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 15:27:55 +0100
Message-ID: <CAFEAcA8-Nd7MNU1pWB0JvnaiHN_o2_iQqhL+j8B_5DVBDh9nSw@mail.gmail.com>
Subject: Re: [RFC PATCH-for-6.1 9/9] hw/core/machine: Reset machine clocks
 using qemu_register_reset()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lKruFBT+Bxro

On Fri, 9 Apr 2021 at 07:24, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> While the documentation mentions:
>
>   Note that if you are creating a clock with a fixed period which
>   will never change (for example the main clock source of a board),
>   then you'll have nothing else to do. This value will be propagated
>   to other clocks when connecting the clocks together and devices
>   will fetch the right value during the first reset.
>
> the clocks created in machine_init() aren't propagating their value
> because they are never reset (not part of the reset tree, such
> TYPE_DEVICE).
>
> Register a generic reset handler to have them properly reset.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/core/machine.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index e8bdcd10854..2817fe6a567 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1234,6 +1234,13 @@ void machine_run_board_init(MachineState *machine)
>      phase_advance(PHASE_MACHINE_INITIALIZED);
>  }
>
> +static void constant_clock_reset(void *opaque)
> +{
> +    Clock *clk =3D opaque;
> +
> +    clock_propagate(clk);
> +}
> +
>  Clock *machine_create_constant_clock(MachineState *machine,
>                                       const char *name, unsigned freq_hz)
>  {
> @@ -1241,6 +1248,7 @@ Clock *machine_create_constant_clock(MachineState *=
machine,
>
>      clk =3D clock_new(OBJECT(machine), name);
>      clock_set_hz(clk, freq_hz);
> +    qemu_register_reset(constant_clock_reset, clk);

You mention this in the cover letter, but I agree that this
isn't really very nice. The machine's reset method ought to
reset the clocks (either explicitly or maybe some day implicitly).

thanks
-- PMM

Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DB8CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:27:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtV4-0007ud-HA; Fri, 15 May 2026 10:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtUy-0007h0-9D
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:26:44 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtUw-0001WF-JQ
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:26:43 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-44dd5cb0f81so666927f8f.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778855201; cv=none;
 d=google.com; s=arc-20240605;
 b=ChFDh8sAoQQNAXJGNFaI6ugrn/ix7tz5BAnFLKF7T7ostQO++pf36mvS4MVL7FMy+m
 OVJKOFI93pW++XKnDvE4k8m3CsWHTjMER4gP6iP8gZU00niWnnjfQex3sgYEvY8rbewc
 9oyS5FxlXxETVa1pK81RoB2BxOkEkBTf4Wfr/q8L/xUfowNPS22G8FUpxp9qbpQlHfBH
 KnWVJMslK+7l/cOJs6OB+/JZ2zjL0CTphsLW7pBDgQL5v5DEzxa5nplmHYDe+o6qv8AC
 aVfciPvDPeKEKoZp2qMQt62QjHOKfJa+2CIipKL1q7wFZ4xOm9DJU8OP6LNfMBPqqqYp
 srXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=BMI8Uk1wST0Ujsp4FbaBayK7DvVHn7e24vZuJ4mzK2o=;
 fh=CDCoMxDwjNb6ApMHh9gmz17dsL4pO0RVqdt18JPPkkw=;
 b=E/6+hhvMJAxevZM4xUPbYu6+Aj4WHm0h3GAzz/zl4uP1QIOImOMRAlMAvitKb4BdeH
 QCeuUp1NjRE/0NCmAvBC51/pR3T5eVaGpIjcEH2PwdCgnSG0bsIs8cTSqvquuuZOAecw
 1NA1w7AENLCxmB+ICzpLBYlfNL3+wWTY1ew02K8yf9uE5LPAtej93wRZenPYK5/6sWt+
 ZvXTGUqYXAPrvA2sd5F+NAJGMQgUO7NzczNyRX95ekm+gfiqjBGkZg8CrG5hALD4cudt
 4mDPfXjNetiKn0dQeGgzwVIGvJGPVREqh5qskcpt8GjG9N/G5BX6huh94VNocO/FHI6w
 a/5A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778855201; x=1779460001; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BMI8Uk1wST0Ujsp4FbaBayK7DvVHn7e24vZuJ4mzK2o=;
 b=A2qdeRCJXsYERrophik18SZaA39t/+FSvNCuufMGZZLBLD2Q02yhtkkiz4Svxx8B88
 OucGXU7K2zD3Ovlhq4zekr9QUnWAGhXMI4rZYNvx6r7EMeGf4H5D8D4dS10Z1/NOP0we
 d85kciqq32Mz9XoVjjKoSdvmn9gtE3z05EUQ2HQHZzCrDCWGQuDwFj+9kV6HS0JzNUTT
 vbnZP6P9eQMI2r8M2vT9ECue9TpVDw/oYLYyyuoc/HLNXjjeBew9KoOAPCtwhXirt3W8
 QAaMarqIOtg3pbynR9QbeNN4N4wOuAcKeZClfQ2wyAzEdF8teWo/fNY3eKiWriGlAqxI
 o8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778855201; x=1779460001;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BMI8Uk1wST0Ujsp4FbaBayK7DvVHn7e24vZuJ4mzK2o=;
 b=GT+OM6NDkHU9XDE/wdta/N+KC5x9m5wcLy+MrK2/F4wg2t2TfIDVhcx5/GWn3wsLJz
 BbQGC89opiZRqddz7L8q0SPk9gP4m35qgIjfDR8axrHXjs8YxZxWbGlHGxeipOq8shTu
 C/NEql1L0aFl8W9zOK0FEcN4m1NSEw+K1L5NUP05NpdQaofYFnZlOycfWeV2ZPMNd1so
 dKMlboYwYPS/MHCt1YpzQjB4yq9rGfb8BGofkiNH621XOYShnKobe/rpbZU1cViQY6pZ
 HapTSCEQkEDKbwv10PZmEt2ITU2unegQHmsLEt/mGmFnQmrxEyBHy2+vNxPAUmIb7NLU
 zXIg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8qutw3NBr1E/ig5Vhn2uU53smsRDGb+FGxLpkQOSfD/bCpen4R50pUyKdBHPjdfxhskaSay3vh4g==@nongnu.org
X-Gm-Message-State: AOJu0YyR42OuR2w/Rrh+D2KeRpIdPLy8OIwP4TWlM+EwAaPpQUjFv5J3
 d8RHpqRpdDoOZVX3aeUBcQ0VaQUFw0zQ4I/PAOzop4FjViESh2MAx1rzsbclMf4Ij3F4zHgCRbm
 TNcZr5Bb5Ef4OdtLCXs/P+MSVWrSJmlSXfWG1Yy1SAQ==
X-Gm-Gg: Acq92OE8oAAfwOOddF6tj2VKW1IRbwbP4qmjWJLRPKHO8gec9zG1+cV6Axb4k2RVuLK
 BCPPozbXTW7TSYv+ROH+DhrZjAAMIe/GBvKAPFODi7NlBkUJLHo28/c+vjUxsTU/PgPYAEHeyH4
 x593EyGYKGGyvsvfssn11Z9sT2ioqODJDPcMtu1VIOZUHfg5qIwfQKiz1WYbRX32Ym73FJjczb3
 gezYyYo0eiDeD8WrpM715GobjEOXfrGoxSCiriiM6SjLUVyE4p+ABOPvzdQgdA7hwXbgby9x31W
 noh5s4MXyISTILlWQIjN1OnQ79LkYIqycWjgyeMGc9fo1fPv7SDbW0DrxZ05
X-Received: by 2002:a05:6000:4691:b0:43e:ab40:28d with SMTP id
 ffacd0b85a97d-45d901e0d04mr10092142f8f.2.1778855201007; Fri, 15 May 2026
 07:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-15-philmd@linaro.org>
In-Reply-To: <20260515141032.3271-15-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 15 May 2026 17:26:14 +0300
X-Gm-Features: AVHnY4LwB3h2S6UqDbppdwNew7xWtPoiQ6FJLMWmfm5mX5s-rJbw7GdUL_1d0FU
Message-ID: <CAAjaMXaU50Qhn-eWuskpmDd9T_+3Vr5nemDsW_vXZXf8s1v=aQ@mail.gmail.com>
Subject: Re: [PATCH v6 14/20] target/arm: Implement DBGDEVID* registers in max
 AArch32 CPU
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, May 15, 2026 at 5:12=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> 32-bit ARM max CPU is a 'Cortex-A57 advertising none of the AArch64
> features'. Keep it as close as possible as the A57, by implementing
> the debug ID registers, following the changes in aarch64_a57_initfn
> added by commits 48eb3ae64b3 ("target-arm: Adjust debug ID registers
> per-CPU") and 09754ca867f ("target/arm: Implement AArch32 DBGDEVID,
> DBGDEVID1, DBGDEVID2").
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  target/arm/tcg/cpu32.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
> index cf643ce43b1..2e8afc28602 100644
> --- a/target/arm/tcg/cpu32.c
> +++ b/target/arm/tcg/cpu32.c
> @@ -755,6 +755,9 @@ static void arm_max_initfn(Object *obj)
>      SET_IDREG(isar, ID_ISAR4, 0x00011142);
>      SET_IDREG(isar, ID_ISAR5, 0x00011121);
>      SET_IDREG(isar, ID_ISAR6, 0);
> +    cpu->isar.dbgdidr =3D 0x3516d000;
> +    cpu->isar.dbgdevid =3D 0x01110f13;
> +    cpu->isar.dbgdevid1 =3D 0x2;
>      cpu->isar.reset_pmcr_el0 =3D 0x41013000;
>      SET_IDREG(isar, CLIDR, 0x0a200023);
>      /* 32KB L1 dcache */
> --
> 2.53.0
>


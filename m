Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp402013dyc;
        Thu, 3 Jul 2025 02:10:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUynkmZKsu62c8htD55uj8Cd1MChU6utIPGHnYWYRGtkC0YHVFi1kaOpjgE/8Ma4DJ3c24dFYsUWBFiHg==@linaro.org
X-Google-Smtp-Source: AGHT+IERyByifnd45sA8/W+2vKt6N6qv7KqIdLDDYDkJXh9zfdfw7WbyK6yaEU36OrhfmoyY7kEH
X-Received: by 2002:a05:620a:2b94:b0:7d4:6126:51ea with SMTP id af79cd13be357-7d5d43ceec2mr206954385a.14.1751533834201;
        Thu, 03 Jul 2025 02:10:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751533834; cv=none;
        d=google.com; s=arc-20240605;
        b=W49R8HTVRvjf4vSMh/IHevxTwPKBisPXCvwigGAmct3zBP/anWDB5ZiZjeWp6EavEG
         1jBPjTu990yyYGOOna7ajAlMGJ/fhphytnB8gzT7V92HhaR6/Q4I2oVE9Mhb0+P7tXsS
         PCQi4wXB2u8CVn768y2qqwnuHHKKQfWUSGV7v9nGzn+PwPMyk/LD18zVQDsz8dlVHpOI
         zYoPh9l2XefKjLysavEK8AvK7vvM3UA5egp/Blnp4sxO5V88taGY+47zjNSgNSaQLyt2
         cXKq/T9u/zwZuTsDyAegwIjyVHJlZuzyk6ZH+AKUefCRfid0AkDK1f3vZCYpNqhTToX2
         H9ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=KANvE0inrR17KctVR9drusYPwMQON/tTP6wjvM8ARco=;
        fh=XzzZqdPst4ymzJ1k/6BD3VIjQRxvfXAviwcstAfXeoM=;
        b=RU8uENGiyI1vBfkW1rIsIK7lDyw2bWUONMtb0dIeUVTmJfSDlsebSinRT12bQqDSEt
         3CeIvkHrTeKEGNnLw4ZJNNpQvljLexuM5rFUTeurSgI/pG/O5r2S5b7r0aoZBVzX5Kfz
         W5h770PSINbLWrspckC0vsJiTYYcGB3HgBNAV6DLtKtARKSX03cLaGWzpuDGDyJbvsvE
         +s1PvLkXYlPFJXgwzjcePwjgwOEFsg4kF+iRsUW7xU+UUtRWR6u1F0wPdIk1TU0bbY/q
         NwlNgP/zjYFovqWDKyRVEfKBEPaQG9snBtxDpLpcroyXwUzm2LxbmZE/gFvP4Herxm3S
         gCiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m5NSWaAy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d443193db6si1488137485a.121.2025.07.03.02.10.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 02:10:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m5NSWaAy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXFxe-0000tA-Qm; Thu, 03 Jul 2025 05:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXFxd-0000sa-AR
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 05:10:29 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXFxb-0001K8-Fi
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 05:10:28 -0400
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e81877c1ed6so682111276.0
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 02:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751533826; x=1752138626; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KANvE0inrR17KctVR9drusYPwMQON/tTP6wjvM8ARco=;
 b=m5NSWaAy7Ud/R/xug2CjJgHCTjP7S4QtRVdl/UJ6Qw4EcHmIlsl4+Y+fLoQIrADtPX
 0jd2ObwuQZOFepVUZ/kGew2NoUHLhf+oNzKFcZJMw64cX5NqkPdK28sJFAN9nbPmvF/7
 T4RXjwqv57MpBzEaKhcwfTzc8SgYeVOOc8VsWlUyHz/UHY2Mgb1llCKSZ2mw6LaEmWud
 G7+vs4wNTtsbfWVm3bEQkaZXj5Mgm7iOKL4eEH3U1ldCroIqbS8gSCsvJe4lGnXXQI+m
 Gs3c2WPf8sAYQw6/caWs53ScQblurgVjBKvDW4xQNN86oVfMLXayQ3QvcHhzYIubypAn
 5VTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751533826; x=1752138626;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KANvE0inrR17KctVR9drusYPwMQON/tTP6wjvM8ARco=;
 b=DjQq6du1jlCPhhm9JFQKwzk6m5z6s4IzpjW2fQ0wwY1N0esiBxlGxHzkbxW71eTW9O
 n+JLPYCNawrRalrZGrt2UVBLahbPne+f9LqP6/imuRDOtBaWL8ZRZKEOGgBzUTzpKsCf
 VeQMTDPAAl2QNa6I7Ej8ZEDmBb+0tHm8Q5x7exdqQ3Ffe3uv19v8a3SaV7hjXOwSYk7n
 vCJy9sFhYyuHfiqFEyv3226L52DSwjbVU162p2sVtUrD4MEp/fBmn3L4eTGwj9tNNU9k
 UCjcKK+2l8TcOXFsxp9JH8z7RRLOF7ZB0XiiMeQxnWD8eyP6TCw8Mh5EyZq/BCht+csP
 GWpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPaq7HUuJDsPbhR5OeRHjGqtHRKio2OjVsYNiVb5989XRCsOGqAXPGHdI4LoJwKIupEB6pKSR1LQ==@nongnu.org
X-Gm-Message-State: AOJu0YytPAYC8Ag8DnoalFjsbdx1GAn8sjyhwf85w7Kt5+iHgo94pBJo
 5h55kKwsJC8IlqQTa9lW18+p7jy/QMOuhvOUpiEo7+VQfu3TNeaVakhJ4kbrMAYWGU8VK0pQ6Mp
 tYMPVdi2ZmaLzUQMO7Gkwj1HLTV2I6muFKCPG/NMy9tE5NYWeeaeg
X-Gm-Gg: ASbGncsS7n7qc1mV6FIyemGy5JwWhEv2HDtjmta8Fy1BiY0hmYPVkDlCBoww0vyfhCr
 2V5W1jhnrUtUyr6l1UzdygehG2QTuN+vGNxZPqgqNxQjg/XRBnXru+fWGSCBfQ1dVizq31B5xVR
 zT6uY5F1ASkXst/0XdzaWIHB4FuHJjJXOX0Ft/oY4BfGw3KBaxTBW6+Ec=
X-Received: by 2002:a05:690c:b:b0:712:c295:d012 with SMTP id
 00721157ae682-7165d15bd39mr17711597b3.13.1751533826054; Thu, 03 Jul 2025
 02:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250702122213.758588-1-richard.henderson@linaro.org>
 <20250702122213.758588-7-richard.henderson@linaro.org>
In-Reply-To: <20250702122213.758588-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 10:10:14 +0100
X-Gm-Features: Ac12FXyq4Hh6fDrPhIssnibB_y3xJskzIh4RMbQQYuW4al8kmCKbqxe8I7KVjkw
Message-ID: <CAFEAcA9jgUzvoWyEuk-d+NB_j=889Qgqx-aRBW0bej5sPHfoAg@mail.gmail.com>
Subject: Re: [PATCH v3 06/10] target/arm: Disable FEAT_F64MM if maximum SVE
 vector size too small
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zU6UpXqRe4M6

On Wed, 2 Jul 2025 at 13:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> All F64MM instructions operate on a 256-bit vector.
> If only 128-bit vectors is supported by the cpu,
> then the cpu cannot enable F64MM.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu64.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 200da1c489..c5c289eadf 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -237,6 +237,12 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
>      /* From now on sve_max_vq is the actual maximum supported length. */
>      cpu->sve_max_vq = max_vq;
>      cpu->sve_vq.map = vq_map;
> +
> +    /* FEAT_F64MM requires the existence of a 256-bit vector size. */
> +    if (max_vq < 2) {
> +        cpu->isar.id_aa64zfr0 = FIELD_DP64(cpu->isar.id_aa64zfr0,
> +                                           ID_AA64ZFR0, F64MM, 0);
> +    }
>  }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(with, as you say, the obvious fixup for the id register changes)

thanks
-- PMM

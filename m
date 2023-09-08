Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp377893ejb;
        Fri, 8 Sep 2023 05:17:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpmsyCmmNUcIXqRxIXlgV/GQuhkHJAeLdKWLSg2x1Af9An2cKhrnWCEfx6EkcGMTynhOBm
X-Received: by 2002:a05:6358:e4a2:b0:134:f0c7:90ae with SMTP id by34-20020a056358e4a200b00134f0c790aemr2437621rwb.5.1694175456237;
        Fri, 08 Sep 2023 05:17:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694175456; cv=none;
        d=google.com; s=arc-20160816;
        b=PG+Don7ehoIc2d0EUElfHHXgP/vM+umAisJcVLahzw29l7RPchsAypaLygxQIfPEhH
         qUDxa8538zUmHHPQEdJVOyR8MNii/jvgYjUls9KH/aT1mkxvOOuplpsjgK0OIqRjlRe5
         pZ8uCr3na4HtxCP41SzgrhkmJHsjjZYlVGYiJeuYfgDzziATkkETcV+6B4E4c+3rpGBc
         P5YhEKCyk9CjBxwJJDft1zOWj2apOx6gpFPiufAlduMPwxZgbzt0kOUdj9cAGzj2jrdp
         Hd/fxsVRdLViMA9Xq1Pj4txeSq9K+86omnVhpXlZN1lJgI1QyIqkBRxKmCH3YNFmn4Qu
         lAzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=eJFV3k9sG9fZcxBlzsNxMg5ieLD1/LoHcz9Lyc+RwLM=;
        fh=ZunbYo7vBCjqSWc9622LTLPHQcfFJMelhG0lIzAt0Bo=;
        b=OVOe2tBgKI0V5rfgDjJzCF2O9ivtTr3YIKqbG8Fi56R/NOzwyZzi1wsU3unXpCXnrF
         T+82HfvZY9p74rwDSHgoyS/W9WwZn4fnOp5vkzXs3KuFvBwrvUQ9v+NPYrjWqb6B9FB7
         tkPT0FfydObvG6aSJrcr1mIYwInAP2IP3ThKcySMBQttzf5aFul0zoX3Mpk0gQySaM5A
         /jrULs3kVRbXuJFb0j76STDNvhu+wjr1J/mjQLbd7A5QGkbZS20JJkhAi4Eul1e1jsz1
         JvPXOpkTDWyp8q5jL+aREYr4wS3MgVZa/tjHeH3BdZvq2WqQSdYNLBdvu0CaNeDyUBqL
         4UHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ct/9U32u";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a12-20020a0ce34c000000b0063d6cf5bab0si1052291qvm.197.2023.09.08.05.17.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 05:17:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ct/9U32u";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeaPn-0006Oz-89; Fri, 08 Sep 2023 08:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qeaPj-0006Ku-Og
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 08:16:45 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qeaPg-00057Z-8G
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 08:16:42 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-523100882f2so2651232a12.2
 for <qemu-arm@nongnu.org>; Fri, 08 Sep 2023 05:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694175398; x=1694780198; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eJFV3k9sG9fZcxBlzsNxMg5ieLD1/LoHcz9Lyc+RwLM=;
 b=Ct/9U32uhGH/W8NMykCd6Poso++vZtdESKooEJPLnpVn58RSO0s/0E6hI03KoJeuK+
 pD8B8SyOSoOWghJ8j/wruCfkQ8HC+iS/R5ip/JHCFI0tX7FDKXj0bHOiSI+BbF4xkJkZ
 ZC9afpLBdmwoP8I5kb9idVNBTZhLmokxReuQ2skZhrSK/0gLvYnrRPRP/ejjMJVNOcNL
 py5mae3yWh6mf6rH2sTbbm3N0cvV5b0Z/f+nawLx0IZ3tj9pxafHg3OiCRvfFJTIEbKk
 z2sGGOTwCNG7frqWNwGCXAylF+T2D+52xcC/QZ324A+h1PQUkKb+sXGMDawFxWoojjiT
 J3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694175398; x=1694780198;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eJFV3k9sG9fZcxBlzsNxMg5ieLD1/LoHcz9Lyc+RwLM=;
 b=PxKF2aTyJmmOeCd8IHs9r38dSE3aT25IhmQGObikS6l8digXP65JYqY37eOn20iGvI
 i8qusqRt1wmetidgSb915xsPciytOVE93VqcseHLEsWdz1W3PTMrNXGfN1LYVXwXVzN1
 JI8oHX+VJoHvSkOjPBABVmtmC62NG5+hs8TKE7V0oYm/6KJ3o0SVR4Sr6pmKvw0wsPS7
 A5YirdDnBKhLO/rzKC3jjFurxr/PykfYzFeucyrRZyUP0hMoFou4NPPI9IwXeHuhGPAZ
 vyjrJvoBZ594JRypGkXK44t4EUmZ0fEw8m/o9PexS8f88SQtn429nWEVhPyRCbCc3vYZ
 GAGw==
X-Gm-Message-State: AOJu0Ywu30bHaOb+1Lqn0c62aKsPr1noEc/88Z6/Q+BatRB/Bc0APNkk
 gzrO2r4vwt/TNivU/QT8VCC/iIKyUiBQqj/YqTXk9Q==
X-Received: by 2002:aa7:c696:0:b0:522:cef7:83c3 with SMTP id
 n22-20020aa7c696000000b00522cef783c3mr1879740edq.8.1694175398379; Fri, 08 Sep
 2023 05:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230905145651.8199-1-philmd@linaro.org>
In-Reply-To: <20230905145651.8199-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Sep 2023 13:16:27 +0100
Message-ID: <CAFEAcA_6c90YC-Dg7SBhgx=0UMLEe1zjcHHQDgufC5CPQHwhhw@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3: Simplify gicv3_class_name() logic
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Rd9Is0PrKAEv

On Tue, 5 Sept 2023 at 15:56, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Simplify gicv3_class_name() logic. No functional change intended.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/intc/arm_gicv3_common.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 2ebf880ead..8863f06b67 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -612,13 +612,12 @@ type_init(register_types)
>
>  const char *gicv3_class_name(void)
>  {
> -    if (kvm_irqchip_in_kernel()) {
> -        return "kvm-arm-gicv3";
> -    } else {
> -        if (kvm_enabled()) {
> +    if (kvm_enabled()) {
> +        if (!kvm_irqchip_in_kernel()) {
>              error_report("Userspace GICv3 is not supported with KVM");
>              exit(1);
>          }
> -        return "arm-gicv3";
> +        return "kvm-arm-gicv3";
>      }
> +    return "arm-gicv3";
>  }

This doesn't seem to me to be obviously clearer or
simpler than the current code, which is the same basic
logic as the GICv2 gic_class_name(), but with the extra
condition of "report the error for the case we don't
support yet". In particular the major condition for
"should we be using kvm-arm-gicv3" is not "are we
using KVM?" but "are we using the KVM in-kernel irqchip?".

thanks
-- PMM

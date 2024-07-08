Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2738691njb;
        Mon, 8 Jul 2024 07:51:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWbJbYbIHs3A0nXNFOZAQPRDnZY/ge+s0hsgu/AE6LDx+1n7yQomkiPq7EWSd3zUe3omM/PHAKYPI9q/zVg+QowO1ghUQ85
X-Google-Smtp-Source: AGHT+IGvlzXs7TFY6y3u42P6r9jdN1ovRxl60WgH3+/Egh8lFym8ji55SF0QQQzUC0NRykKNA9ml
X-Received: by 2002:a05:620a:29c5:b0:79f:1860:563a with SMTP id af79cd13be357-79f186057ebmr59789285a.24.1720450309354;
        Mon, 08 Jul 2024 07:51:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720450309; cv=none;
        d=google.com; s=arc-20160816;
        b=r5G/Uiz1xv8nXp0EZthkK6g7i4dSPj069iB0k7Bmf5x7CAKPIGSHFCXYaNnRqDsEpI
         ut775F+5qWSp8B9SELHS7x/8XE1QgaIP0cfUvp7lY4H6iP6ov83hQWxInsptnRBOo7v8
         GU1xnWzIDaj1bFqX3BYez8RENztwL5HrSvrzp3zy8bNHgHERSauj41tSxlNxgANe8xL4
         PolkthWdsd++oV4/JtzIaxLOot4m8Z3IfIoMYSxd5ODDe4MXWcRVq+44KzfreI+bTh9u
         d1la12AGZB1D2v0QXZyuEDkkF41zzsMzstqRND466DbYo7EPd8TyJ0/CDhgvdzqsnPDv
         ipsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=lcWaRLCRcltFzrZD7uyMSRteYZApdqogMNAhv6d5RII=;
        fh=EqTVK2Gas8qHT10vPfU18HQeQzrvgx5wxPSBfVnAgf4=;
        b=bJMyV4JN9jV8vV3bjDJGMkBGjB/5cQXZliky+gdGU1Ti+Kqz/l1UAevlQ6k3RxfsNR
         azp99FBWSq7UU9vwVvaLy1t7Za+m1bX0rHKXFuuiZhS7/rZcEgDyAT/CtcRlZ9z5MRks
         pi6uxm7YvRBnto9tooXhSSEFLgZMcj//W4jSPOJxoLwjOki5XSl22Os/RkePEHXKBA9x
         ZIhACcLXcxeX+WOYz70YFaMIZw2YvHFDUHUcg3+xdXOfhSQN1ljvuIYLnq0nc0YPGvQY
         TMu7eQkujRCoVMu0KnEVm6UpChr9LKYDKkoXMHylKLPB1XXkiKv52hCFcIpAwQWBWZOM
         rQ1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yWKqKmkX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f0cf2c69asi262907185a.708.2024.07.08.07.51.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jul 2024 07:51:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yWKqKmkX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sQpiF-00028H-AO; Mon, 08 Jul 2024 10:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sQpiB-0001uu-2j
 for qemu-arm@nongnu.org; Mon, 08 Jul 2024 10:51:27 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sQpi4-0006tx-O6
 for qemu-arm@nongnu.org; Mon, 08 Jul 2024 10:51:23 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-58b966b4166so4799828a12.1
 for <qemu-arm@nongnu.org>; Mon, 08 Jul 2024 07:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720450278; x=1721055078; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lcWaRLCRcltFzrZD7uyMSRteYZApdqogMNAhv6d5RII=;
 b=yWKqKmkXbrM5X3EwJcWcLJ76xXwp9iVJvBFKAn74v0G02L6LJPWxjJvGTxDtrGB2be
 fh7hyNZTxci+8810mqYeAZGOKmisb+WMN01/RqMZmNdRCLqZg8UQoB/gNGQUa3tMk7Iu
 upFFbA/LIpGuhH+cW4Jtm3cBUWSPNtLOjyTyaLR1GNir6tYztRgVsz5bgwSBE2zy9oWZ
 4fiZNefaO698zmOWjoTn+xZ/mi6uE+3zaJ1Z9Xa6haxo3lw0UlDcxCQtHd2m7AZ1yJGJ
 vu4f+R4hYt3ogHX5cuDvia4Ooau34dE4fPJnUb92oxWXoYjdagiOakoYNjuBWYN7DI+y
 atBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720450278; x=1721055078;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lcWaRLCRcltFzrZD7uyMSRteYZApdqogMNAhv6d5RII=;
 b=QhHKEMUMqmoKCAUCZrna08l0sF/7xLDvuHIKfMRvR0IiBYRVrujRlStzp/5eyJecSh
 yYW3kdhRYgu57eZNw+Mceu3qqDmG8oumtEMvlod/74frDHNAe+SJGDf+tCJ1iv6TWzey
 DTKcKyoZTdBAzcL9lR21VD3xe8HxhsodQKqZdKMYfctPDBfOXLWhcF9pwKr9CI0ofV5T
 mMJ0Zl/LS0kadLJcTLEEYGsEldwHZaUB2Z90kqBPi3q82DcynaI+ttXDeTx75uRwUU04
 AyhdMfHNuyBIWZx0lvgYVjflZ3RRZ7KNjwokR/od09kFdwyLM5BvRNB1M2037vsKQnF5
 r2SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMhxjSg15pbcD1Pzv0LvZHS2mnrktAwDZy1cKVg60qclHWMNZyN7KSEFoE4G5iiizwTllD9uP0XmvPmgXMOlF7yVWR
X-Gm-Message-State: AOJu0Yw5le61BJPc9qTQ2pru3MiN0EyWT3zU3rgMgVOrj0Umq5AZfdMy
 J4ccoveggHUbQzDTDhuaeY48qIf2JEI1tPupRHWraWV7j6jvW/qsdB0glDQtF0nZ3KMAuRWnHHu
 37LfEvyuEcOzFJT4NowB9ei5SZ0Ry2MDkdJj5RQ==
X-Received: by 2002:a05:6402:2803:b0:57c:c10c:eee8 with SMTP id
 4fb4d7f45d1cf-58e59b3f7f4mr9113069a12.19.1720450278145; Mon, 08 Jul 2024
 07:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240707085927.122867-1-ines.varhol@telecom-paris.fr>
In-Reply-To: <20240707085927.122867-1-ines.varhol@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jul 2024 15:51:06 +0100
Message-ID: <CAFEAcA9MDLPAqQWMADPupSJmheHuCPUnf+9Uebrt9x+ikZmRaA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Connect STM32L4x5 USART devices to the EXTI
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
X-TUID: tmN7/hOmiUbC

On Sun, 7 Jul 2024 at 09:59, In=C3=A8s Varhol <ines.varhol@telecom-paris.fr=
> wrote:
>
> STM32L4x5 EXTI was handling only configurable interrupts
> (such as those coming from STM32L4x5 SYSCFG which was the
> only device connected to the EXTI).
> This patch adds support for direct line interrupts and
> connects the existing STM32L4x5 USART devices to the EXTI.
> The patch also corrects the handling of configurable line
> interrupts in the EXTI.
>
> Changes from v2 (2nd commit):
> - The 2nd commit was split, part of the changes went in
> another patch correcting EXTI configurable interrupts.
> Stayed in the commit only changes relevant to direct interrupts.
>
> Changes from v1 (2nd commit):
> - add STM32L4x5 EXTI status fields `irq_levels` to track
> configurable irq levels and do edge detection
> - use `qemu_set_irq` instead of qemu_irq_raise/lower
>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>



Applied to target-arm.next, thanks.

-- PMM

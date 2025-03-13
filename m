Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp828708njc;
        Thu, 13 Mar 2025 03:13:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTM0B+MAh7z8eEZ4rhzkSgUyVXxWrVaPziBFi7rKxO6KcZxeetquJoTYBj7avAq+sabNdKwacgAX6mZA==@linaro.org
X-Google-Smtp-Source: AGHT+IGKcqPSDNJCPdpCKPDpDBzFcxRGEitlmvWNx38/Nq0QjL8lLGHkzNovCymKq2Och6Q9OFqA
X-Received: by 2002:a05:622a:144:b0:472:1aed:c8b4 with SMTP id d75a77b69052e-47611959eefmr383136211cf.34.1741860787618;
        Thu, 13 Mar 2025 03:13:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741860787; cv=none;
        d=google.com; s=arc-20240605;
        b=FB5/p3WBPaMU2t58sSSjbcO4J8RiFjb0U2zDrvgdH7Ersbfy5o3L0MQksBPq+ehRND
         ppel+96T/26nYdQ7bOaaBT3l6aDtIOEQ/WLI1o4cgr+fiiOsEUWZP9xSeKIhl1Gk4/Ow
         z65OvYZpxRzZpXLEiv/qYyLg3FKqsPjYWja26Q99mwjcl5miM+OuofGbSxD+pmG7NTDc
         UQEAuhKv49HvwOZK6s5887cC6IspwIQBv/9cTpcp2PkU5mUHekMJQs9tpk/+5UKFynr2
         qDpd0lVFPB4EhGKBsVDlU0NA+h5vWUSFOsHTDsrsMcUREJJd7uOwNkQzGANXZY2Ta23A
         Ug+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=E8BNtE4D22LZkURYCBj+A5vFJT9ApgOGodu949sObHo=;
        fh=E8q1jl62fdrhHGVO5V+66kP42u8xB9cyaXOiltdUYrE=;
        b=U4m+RAy7WCQzp3nQRGkgC6ru01/kNuc/8svn5XkIxRVqwBbnNzbEk9+eRt1Wm/BQOT
         aSdPhwDXWIApJCfqd3q0ceWCizsKl8SxXtByQzcMhuKn6VgQdwXxB6SjtyGnb7L/B5+t
         Kg4XpjS9K9soQjamiGarkb+gOkG45p5BTDEa1Gqz86N01i3Nc6gM+b9+Sj1zkrCSklGU
         V4dgiqx32Nr0AvYf/GxzpmVi4n179Wd1W8q5ql98H0Thb5vmGZ8OsIF0rimfGt6TyhqQ
         j0WPv5QwYXTTfl095iqIwuGTq+eeUxmaeXRgxgpAZghBu0oWyATMYvExXi+3SqglCP7i
         203g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bGkhQzpy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb64cbf2si13230191cf.184.2025.03.13.03.13.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Mar 2025 03:13:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bGkhQzpy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tsfYY-0008Vh-PU; Thu, 13 Mar 2025 06:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tsfYJ-0008Ul-Tw
 for qemu-arm@nongnu.org; Thu, 13 Mar 2025 06:12:36 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tsfYF-0001FB-PD
 for qemu-arm@nongnu.org; Thu, 13 Mar 2025 06:12:33 -0400
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e6343c68b8fso608799276.2
 for <qemu-arm@nongnu.org>; Thu, 13 Mar 2025 03:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741860749; x=1742465549; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E8BNtE4D22LZkURYCBj+A5vFJT9ApgOGodu949sObHo=;
 b=bGkhQzpy4+CCFF8ay4bKWJrdXUPNnmJ29KK27c5wY6vTnBas68fnWj3moxSTuLbzF8
 6aHJxwz3P0DlHmwWicEpU4PMoeE11af5rFIt083e6sKiYcaIUNnJcwoZ2/ghD6p8xhLM
 1/pY5nXifYeC7Zg4lQf2O6X1aA72/57qHTYV5A5//TQxxF3aOufJTcK2KkXaY6g4BGCB
 7a2/csGffW6pkLaatxnWlsEY2jEdSSB+LLJaIsrg/+88JSktQDxnLS6k+UvjgzJBw2GB
 aEJ1jE+uD93XY/jnGSYYP6jbkOFM7ye5dp/29DXp2qK6IpjPWrdHa2jD1EmdHFegY3mX
 fmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741860749; x=1742465549;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E8BNtE4D22LZkURYCBj+A5vFJT9ApgOGodu949sObHo=;
 b=WFcRMT0cY8tAlH2EkIUl574s4Y1eKd1sP81tKnIwbBR5VPY1zBkEoMS6yRsh8ATp1s
 5wPcogKTbjSfKHyZsdovkIkQv2OhQFtpbFM6+gfhSjdJI6376cGVUYsgu3MpH7OWDJuW
 Pm5tM+f2CRZn24LkdbLB9irEXAhqEppMiU19vgJAPl8CrSaaGbSErg5avyPPx6m/cBS6
 vVvroe6muI4Wttmt+8vla5DL9y8hfW88oIE96fvqOvNEebg5QheFldm7h7bH+9PiUelq
 s1exqhYafjwVpktaTBNnWNQi7I5oUi+4uQt3yHE1QAZ+FrjqTsWI9K+ZvqNRqwvJDKC1
 G/fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYeTjF/4l1NmZXG0WXgHGQPzqm/oznIACc2L7XW9AMOCGd7CINN41W1UG4jmGnhyZHCvp3VhZAyA==@nongnu.org
X-Gm-Message-State: AOJu0YyzOJRlqPo/tzkqAiFyZO09NHzX9MezLHcUgbKKbqMY7A6d67dF
 2/cqNA1/ou0Ks6JbYJAYg7VbbE25u5Hpgsy3p3QVzOV0wfF17895IQjcePjyzhJLlx8lwWBiaJx
 daZphfdw+CBRcOJ9ltswEfmfNge/YIC6z4krFIg==
X-Gm-Gg: ASbGncvK9UrbcH4ZCzNtjAZ2dwwnryOKTFIxUlbzXonLvAQ5M1XSr5sxNnCLNwp7xkn
 dYl44wBNXpmcHJ8BG1NJCn44jH63WHBR60yCXOiRH1mmEYYDPP7kfk/a587kGl+z30Xd14Vv8v0
 FwSnuL/Uw7FNhbwDiReK4clf4q1I0=
X-Received: by 2002:a05:6902:2788:b0:e60:c442:afbf with SMTP id
 3f1490d57ef6-e635c1f37f4mr32913337276.44.1741860749422; Thu, 13 Mar 2025
 03:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250312212611.51667-1-shentey@gmail.com>
 <20250312212611.51667-2-shentey@gmail.com>
 <065c6990-d2dc-7b03-cd0c-344ee6b6a619@eik.bme.hu>
In-Reply-To: <065c6990-d2dc-7b03-cd0c-344ee6b6a619@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Mar 2025 10:12:18 +0000
X-Gm-Features: AQ5f1JoxIFraBNw8Cg2E6XTijML8zd0g0vjS17-0zc8ULDgPKiudkOd-TfyK2Cw
Message-ID: <CAFEAcA9ivdbKoe2ip9njx4hFkkCsQCUHnMDrKeH-iQ_5368bJw@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/arm/fsl-imx8mp: Make SoC not user-creatable,
 derive from TYPE_SYS_BUS_DEVICE
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
X-TUID: HqwQhSegez4G

On Wed, 12 Mar 2025 at 23:58, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> On Wed, 12 Mar 2025, Bernhard Beschow wrote:
> > Fixes a crash when creating the SoC object on the command line:
> >
> >  $ ./qemu-system-aarch64  -M virt -device fsl-imx8mp
> >  **
> >  ERROR:../../devel/qemu/tcg/tcg.c:1006:tcg_register_thread: assertion failed:
> >  (n < tcg_max_ctxs)
> >  Bail out! ERROR:../../devel/qemu/tcg/tcg.c:1006:tcg_register_thread:
> >  assertion failed: (n < tcg_max_ctxs)
> >  Aborted (core dumped)
> >
> > Furthermore, the SoC object should be derived from TYPE_SYS_BUS_DEVICE such that
> > it gets properly reset.
> >
> > Fixes: a4eefc69b237 "hw/arm: Add i.MX 8M Plus EVK board"
> > Reported-by: Thomas Huth <thuth@redhat.com>
> > Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Bernhard Beschow <shentey@gmail.com>

> > diff --git a/hw/arm/fsl-imx8mp.c b/hw/arm/fsl-imx8mp.c
> > index 1ea98e1463..9133d49383 100644
> > --- a/hw/arm/fsl-imx8mp.c
> > +++ b/hw/arm/fsl-imx8mp.c
> > @@ -698,13 +698,15 @@ static void fsl_imx8mp_class_init(ObjectClass *oc, void *data)
> >     device_class_set_props(dc, fsl_imx8mp_properties);
> >     dc->realize = fsl_imx8mp_realize;
> >
> > +    /* Reason: SoC can only be instantiated from a board */
> > +    dc->user_creatable = false;
>
> I think sysbus devices are not user creatable by default (that's why
> dynamic sysbus device was introduced) so either this or the .parent change
> below is enough. You can have both just in case but maybe not necessary as
> other sysbus devices usually don't set user_createble either.

Yes, that's correct -- we don't need to manually set the
user_creatable flag here now we've changed the parent class
to be sysbus.

-- PMM

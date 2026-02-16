Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC31E7BD8C
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Feb 2026 10:53:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vrwEZ-0000Uc-5o; Mon, 16 Feb 2026 05:53:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vrwEX-0000U3-55
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 05:53:41 -0500
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vrwEV-0002Qw-IU
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 05:53:40 -0500
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-649c070ef3bso2784957d50.3
 for <qemu-arm@nongnu.org>; Mon, 16 Feb 2026 02:53:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771239218; cv=none;
 d=google.com; s=arc-20240605;
 b=N+GthiHe5jY8q0TWadNb2JPnldMHWOgw0Tbn5i7S1XLwE4JOj56nNM7gaOAwM8KhGB
 cwqKHqnj0MjAsGQtqkp0/1BAHwlSFyqzy4uFlcAF0iUroabtwuce26cLjrDHi4vVWUZv
 kqVL/BESdNfiKP9CKWztEjp8UwzFOVMxNEi889MTu4hlJqkS5MkY+UmziwdBxGpBzG1U
 Cb8n78Jr85ECHXry+bCW8JLGrRC1DICuXdjWuzC/Fy5YfgG9Cr+hkZyB+S6HXyH/Cjdm
 5KQWdcHqdprFX6/fn7c5StYqYNlXM4lQ5s8KOjyg9udbuoHDG9ZGCqnFpVN+pPxftY6y
 44wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=3r6gceMc31Kn1NaBbHeBtt7sGJfmSVtZPxIASHmbdeA=;
 fh=0YlB5TPQoTcxXzQoucfoNyyJwH5nDqrthDUs4NtQw1A=;
 b=FNbF3M3TDA1Qyd9+d7RLOyA2a4p7Sq0kbUdZ4h/n64QbekZOwF8lBnDqIfRzLxjX9K
 x8m0g2kMnaf8VMz/g/IaEbkji0Gqap9AiFL2XaPG8dwPdgna7E+vo0hf/PfINlAsp73r
 hKh/UmlseObryh1Imch2BCT0GyzAgsR3frsTlPMYACbofXVZkUUsBpBJuCzD2JgyotXS
 w5HJKiirFJ25jsa8+JrMWUzvoisc1WiqcWHb9NUVIepgWXv70ghIfmQ0zemyOOU0r7VZ
 WtjRdRvWT4NFcbC0fTq6W4Gk/iw+6yoyB2Y+ZtccLAPruvGUBymnX9Q0Dau3niEzxTuj
 F7hQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771239218; x=1771844018; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3r6gceMc31Kn1NaBbHeBtt7sGJfmSVtZPxIASHmbdeA=;
 b=Xy2mtnOeWLtpxKNPEF2bPcqHCz0GWM1rg4oozz2eqvmZ0AkQdIAddhQ4GZ+oy95VeG
 osusq0aSF1QgUulH8p2wUInJ991R9k6GmN62neaxetNcfi1sZEwNMBNyiv7tImKgN1pX
 Ihk15W0qB2NAiGugTtBwqe6an6iPdrGkULad+KdGAmSuI6wVerFh/PTdp5LKdKwvCABY
 Hf1AU17ej6rd36yzZjiRRAyZZvoiTIUNw4WRTeRcfttZbffZAfQk6eKohd4WTC8cP/w5
 gVFwCuFoWDYolFmrGibZ3IXP1EUVLPxkfmdFC2FOwQWf/VT5RQFnmQQbSrF4zqe62zrB
 JG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771239218; x=1771844018;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3r6gceMc31Kn1NaBbHeBtt7sGJfmSVtZPxIASHmbdeA=;
 b=RsE3Qcs8OtkfRhZQJE9YU03WXomr0FJAh7ZxfAqYQ61QOppVPWSlD5yyYoXzqYeDNq
 50f4NLF6Rv5EvnCMETEkQyhElPBzfgimOY6Lv4FWMCtBl0QQ2KtponD/69C8jeD+wjHJ
 DOW4WWk/HFJ6c78TVelkg8dpQ26fNpyBpzcRoa4DQv+2VOsAXmnd+vap/Zaq0RG5EFwe
 2W5pSZzZ6Pq2v5942phR4QvXpO484TZBcO0BwQojI6o0RzyZM6oCHH1qjPuB57JL95id
 towxT4BywwJIyn9UyqBu9IWpO+gMdHQlIMDh1M1z1ckBDDlXu8s9XoY4QOnFAO7B9Pob
 3KYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCCaD8lFhEY9yO/GLUqjwr0yqK8AcFu5lPG9cd4lLmvEq/u6JduXDA8SkrgegFx+Jv8IcUVgOSVg==@nongnu.org
X-Gm-Message-State: AOJu0Yy9DGnzi4tOjYsaY1n4vSLCGVniRRcHis0/joRl/uweGuYVm8ny
 nAK2jjVvbwxD0MktRVGA+0zj2U2OzcEa8wL0ULj9X2MTRzrjeFkGtD+2SLjW0313qQihgnjO/8f
 Zd3/vECIlaP/uaFg2Fn23SE4scX9o5bOPK2gypSoviw==
X-Gm-Gg: AZuq6aJNpS9YagG/PgIahlpnSPKWxBKg7em5XJ4LcOp98dXzezFN9ZJr6JxLpYgEap9
 q/KjGb/YvvwVwaQ2aC4+mTijJt38F38EteT2qN31K0cHk17DTGLSDj7W1dk5zI79IQoLOZzpI6C
 HMDLmko1bE/fjKM4740WEcInTjUorhMlJr8UYbyi0uyPE7V+b2xUys0LWJncCYypryOevz9YJwq
 GP0S2zsDFVE9nF3yvYWOSAlYfqNfkQUOO8LO8F/ijyDBz/ulqEqTH4faIkJ7jBRGSn+u9kByQAB
 PVMxpoCDA8NvwCQnkemAABjoIlFOD2jK741rvlRySko9Q9R5gJHSM8pNii5HkXQmMAU=
X-Received: by 2002:a53:b74f:0:b0:64a:dbb5:2849 with SMTP id
 956f58d0204a3-64c19b7b686mr4865378d50.97.1771239218299; Mon, 16 Feb 2026
 02:53:38 -0800 (PST)
MIME-Version: 1.0
References: <20260212104432.4168886-1-kchiu@axiado.com>
In-Reply-To: <20260212104432.4168886-1-kchiu@axiado.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Feb 2026 10:53:26 +0000
X-Gm-Features: AZwV_Qg2ou8jI52ex9Ood6Pt-5QN0WRtTzAWyX6bh6ir_CkCsSIsmoHsADzsgwE
Message-ID: <CAFEAcA_u5B2RdVEaGycCQ6gCx1pQuT8rvGVGZpoKLTK+2s72+w@mail.gmail.com>
Subject: Re: [PATCH v1] hw/char/cadence_uart: Add BXRS register
To: Kuan-Jui Chiu <kchiu@axiado.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, alistair@alistair23.me, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Thu, 12 Feb 2026 at 10:47, Kuan-Jui Chiu <kchiu@axiado.com> wrote:
>
> The new CADENCE UART driver in upstream kernel access BXRS register
> This patch adds BXRS (RX FIFO byte status register) or there would be
> kernel panic if user are using the new CADENCE UART driver
>
> Signed-off-by: Kuan-Jui Chiu <kchiu@axiado.com>

Hi; thanks for this patch.

> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index eff6a3c4d1..f57cad57a8 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -120,6 +120,7 @@
>  #define R_PMIN     (0x3C/4)
>  #define R_PWID     (0x40/4)
>  #define R_TTRIG    (0x44/4)
> +#define R_RXBS     (0x48/4)

Where is this register documented? The cadence_uart.c file
references the Zynq 7000 Soc TRM UG585; its URL for that
is out of date, but looking at the copy on the AMD website,
there is a table giving the register summary for the UART:
https://docs.amd.com/r/en-US/ug585-zynq-7000-SoC-TRM/UART-Controller-UART
and it lists only registers from offsets 0 to 0x44.

thanks
-- PMM


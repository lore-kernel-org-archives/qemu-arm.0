Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp1125258ejy;
        Thu, 2 May 2024 05:12:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVK3w9rvU5cAe7fLNrdJBgAr30BJJ6TuMleYWKnQfB/WMSAnkg8pkqCLw/4RM11lo8ML3WC39IDW6saL+5xAoih/Hinrop2
X-Google-Smtp-Source: AGHT+IGChZj/HwjS97d2DRwPtiwMVaUflFb7TFAmMOvJ46v54fxAwAcumd2u6eFkJ/R8rm3S5901
X-Received: by 2002:ac2:5551:0:b0:51c:cd6d:ad21 with SMTP id l17-20020ac25551000000b0051ccd6dad21mr594303lfk.47.1714651923452;
        Thu, 02 May 2024 05:12:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714651923; cv=none;
        d=google.com; s=arc-20160816;
        b=d0KfaNkmxljjQoI4zeRxVUQVwdxRueaC3w7HpCIan3W3LlBgfVkYzsL43XqoVgMi0R
         PU+j7946A99xUdBx9Ey7366cxPhRw+KcEhRK47VNncIWtW0uPMrpse/tLWOsvv31y3Vu
         gq28O02fMBwTtlJGwnsIrf6Opgy5w0wTp7TlFYXPGDGAfdLVi+S+PtmRa8RsZiYNtlrA
         Wd9pmzTbdzfRnkck8GiE7z8WepC4XS4B84dc+t2xj9ojCw7rHVEOdCPawFeSGnqXHq59
         ufaOa3q3AJfKucqRX7HzI+byKt1qhSQfrnszpQSTrw6ZaF5y1MK2pZ4NkBZhCMY48utJ
         ixSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=jsrKDleFzHSj0P76ZC+1+SnrGqsGd846AhS22yDI8ck=;
        fh=DCJadm5pCOrmq2KUulsnAXgl9pezrix1fOPR52J5JBc=;
        b=quxlqctnwNUd6hKc8XWNHMYRKIA7VK65Tx2RfP0Nm/INwkEDtVd9FVW7lFrtiL5+3M
         6YN6RG/1KDjQe1GbE5yvV+lxsLyul1WOo1DhVXtpH08eVojmGrbFNH+kEhTf3Ryrjd+4
         dx+AK1p+xhMblXd6hKPPoCg0IERMWrQRnTNlKvAQPmjeC73sXKkkLP39o/VomL2PpVXr
         4SW9JZ2bfSG5W21azvSp2fHhRir3ALgMQri6STd1IoMw5HeuCdYRPVtCzokumUv5kOBb
         jRivC0PHIBQGPCAqbieS34kG55Sw7XcA+0ZpE5E+n3YQRvcYK3nK01gWUOKLO7VTnbMu
         lg9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eT9WL/CG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4-20020a056000136400b0034da7e019a7si589233wrz.589.2024.05.02.05.12.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2024 05:12:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eT9WL/CG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s2VHq-0004hQ-BL; Thu, 02 May 2024 08:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s2VHg-0004bb-L1
 for qemu-arm@nongnu.org; Thu, 02 May 2024 08:11:35 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s2VHP-0000Uq-Mf
 for qemu-arm@nongnu.org; Thu, 02 May 2024 08:11:31 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a58d0aea14cso828932766b.2
 for <qemu-arm@nongnu.org>; Thu, 02 May 2024 05:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714651873; x=1715256673; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jsrKDleFzHSj0P76ZC+1+SnrGqsGd846AhS22yDI8ck=;
 b=eT9WL/CGnwjHyL338Iq60It857IykcMVH4CgBJZI/CAgY/wsGwiCnScPME158C+kEd
 KVa44Z9k4A+4tJ1uBpkJfC4v8IbyX0eWh3xEQO24UfekE5uTgMIjU8R9f5FGdeN2CHrM
 hhdcwPBHVPd/Cgp8Pt6oI1ruzq23h6fG6Yux7p6ztRAjBpgv0kcRk+Y2ufZRGAo8FzKr
 QIrDn4Mm6OoPPJ1WbZ0IrueTUeiUniI2KqbdeKeAFWjJvmOzRn8LzfGzoHsQdGM4ikpy
 s1BQjYDzMyZmgkVQaxMUSellsMCb5Kx0TAQcM7WDd/k7QTJaUuFnBT+hmBDmo7YVuI9+
 Kwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714651873; x=1715256673;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jsrKDleFzHSj0P76ZC+1+SnrGqsGd846AhS22yDI8ck=;
 b=tAJjCL194fQFVKi5oNIGMmhXLGRVklLg3hp7/m1ZNmiXvc0my9n9A+3F7AqMQetY7Y
 tStAHlPNkO/MUtE3Mt4Lggb4UiLznqiROggD6G/JElLURzsA2B68/WGvzm8DcVN5Blf3
 +L7BA6NV1lAphUnm+mQ6jtJ5b02jk1+hyWpQ7ohNiBMAzHHmuD2SwE4uLsb0oyhINWa/
 HBElgYnsTkHqFDiv44nJKI7H3z/xWFRH0n12q18F4sY9LJYdWzl4O4PLMvqmstDU3N+U
 7lUPeclHzFUWsLzIl1UwgyKvESc1NQ00buwhsH+FURDnZ5IV1CtPbuyO2cnfsOk7D87q
 712Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3DtMv73v9k8t7NFNgP7b2c3W+U30obNqcu/UUv1sYKcyfivWD8Yz1gwTwwYvxiF8GkPPud6rgELBZVBjSx9tQ87PI
X-Gm-Message-State: AOJu0YzR7PVbVMckC+3rIynkETD+tSrHaW1v5Q0S2saAaL5TSio5CeLE
 /ZTseO1CoEVac2i1sxdl4F0nqkYXE8eQogjHQXhoda+ZnSc7p0BehV0VQwf9SRKUYOIDXIrsC29
 sPF7hqxv7KW7tw+RmDuCDFG58CcPIRq3Hn5cYZA==
X-Received: by 2002:a50:8d12:0:b0:572:4fc3:3a28 with SMTP id
 s18-20020a508d12000000b005724fc33a28mr3749241eds.23.1714651872847; Thu, 02
 May 2024 05:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240502074158.85800-1-philmd@linaro.org>
In-Reply-To: <20240502074158.85800-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 May 2024 13:11:01 +0100
Message-ID: <CAFEAcA8R6mGCPvtDEfUUxPLz1w084hof-FdADnmXHOWj6aAvaA@mail.gmail.com>
Subject: Re: [PATCH] hw/input/tsc2005: Fix -Wchar-subscripts warning in
 tsc2005_txrx()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: xoWgMpDEeO+n

On Thu, 2 May 2024 at 08:42, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Check the function index is not negative and use an unsigned
> variable to avoid the following warning with GCC 13.2.0:
>
>   [666/5358] Compiling C object libcommon.fa.p/hw_input_tsc2005.c.o
>   hw/input/tsc2005.c: In function 'tsc2005_timer_tick':
>   hw/input/tsc2005.c:416:26: warning: array subscript has type 'char' [-W=
char-subscripts]
>     416 |     s->dav |=3D mode_regs[s->function];
>         |                         ~^~~~~~~~~~
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/input/tsc2005.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/hw/input/tsc2005.c b/hw/input/tsc2005.c
> index 941f163d36..fa93eb5d25 100644
> --- a/hw/input/tsc2005.c
> +++ b/hw/input/tsc2005.c
> @@ -406,6 +406,7 @@ uint32_t tsc2005_txrx(void *opaque, uint32_t value, i=
nt len)
>  static void tsc2005_timer_tick(void *opaque)
>  {
>      TSC2005State *s =3D opaque;
> +    unsigned func_idx;
>
>      /* Timer ticked -- a set of conversions has been finished.  */
>
> @@ -413,7 +414,9 @@ static void tsc2005_timer_tick(void *opaque)
>          return;
>
>      s->busy =3D false;
> -    s->dav |=3D mode_regs[s->function];
> +    assert(s->function >=3D 0);
> +    func_idx =3D s->function;
> +    s->dav |=3D mode_regs[func_idx];
>      s->function =3D -1;
>      tsc2005_pin_update(s);
>  }

This code is in a deprecated device, but it makes sense to
avoid the compiler warning in the meantime. (I'm curious why this
only comes up now, since I thought this warning had been around
for a while. Maybe gcc 13 is applying it in a wider range of
situations.)

If we're going to assert I think we might as well catch
array overruns in both directions:

     unsigned int function =3D s->function;

     assert(function < ARRAY_SIZE(mode_regs);
     s->dav |=3D mode_regs[function];

thanks
-- PMM

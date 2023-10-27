Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp131930ejc;
        Fri, 27 Oct 2023 04:50:51 -0700 (PDT)
X-Received: by 2002:a05:6402:520d:b0:53b:3225:93c2 with SMTP id s13-20020a056402520d00b0053b322593c2mr2761325edd.8.1698407451526;
        Fri, 27 Oct 2023 04:50:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698407451; cv=none;
        d=google.com; s=arc-20160816;
        b=e+a50pSr1QlB/H9W6vWZTlD7W1SIIqNe3TpfbAIBbRu6DIIFUCr7lq+S8BQFoqzflZ
         odwbuzieoNdBCsCok6ACUjQUHbO3u8qjNK2MElGXmr9cBFIbC9JNwajem3Di/TGRFA18
         5N/zz0CBgvxywBRJ9pDKbrZwHQj0QZ8oCK6iJBZ6+YrB4s5LeObKatWMrHPYcavC82ZQ
         I1+g+yrRaIAAZdTxHdpxYL/1bWh4nA404avulgCME8Q8GxLFzWMOPTW7h+m/giUlTBdv
         sXwlg2nDKhYiwnEisXNpLf13n56yEzDeR1uTr+9H2wpbXA5l9/LtXuA5OMaIBuOk1icE
         4JpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sfVCRhTvg2AKt7pFrqXCIbLBZfzHqk8QnIhyroAtK40=;
        fh=p2AIrvQPROPJ+zOdhdG7N/nhQSNUA+0TIn9RlD222V4=;
        b=uRk77VDElaT6rczfFjcReQuq0RcrkEYF9lA4WpQdDy5mHZQH61DV9YiMxb6MEBhIxd
         vItY3q9imBwuWNwqocZ78//EyIPCAEl6TjLjr9+Cs4STVkL5O3HFuOk4RvKvN562U1zn
         jEziWtNgKMhgCzcsJ4ZkpaEdWtvVI3bUrWTy+9qFKz2PyZtnM5LXyJ4ozYW63StEfCDE
         sz+mbc1chdAI7OqHahGe+vddpM8e1RK0n1RGIHxHx0WAJnkRmf5NzMzf0/UdL0M21iWA
         7+0ZNPhiCFZ9nJWXp6PN0xpgNjJEpoX17ATy1PpayDaTNBCGa+rRIk4PeLJuX6cMRQpG
         xAng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dbYHlnPf;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u18-20020a509512000000b0053fc3c5acfasor507071eda.0.2023.10.27.04.50.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Oct 2023 04:50:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dbYHlnPf;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698407451; x=1699012251; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfVCRhTvg2AKt7pFrqXCIbLBZfzHqk8QnIhyroAtK40=;
        b=dbYHlnPftWnahjKSNO+0xWnPfK6nqug2Qo9Gyc+6+Q6y9sSyYhCiovlWQZYd2AT2Li
         /xxDjRfdEeXu7Wpqv0810r1oBG3gg43/VBjp38gQeX0binOVGzEF3llKln5E96DMZ9MM
         /Bd0/jNqV9cE/DZ8SNVWxAwGAPIbzsRRKTWafdGntoB1aT9/fcNYcKeqxrogxBFtrxRT
         h2d+Gjxfnx2BrE2NSC8mnxZtZvEIFld8RtLV1yIO9+8U13GzcTsU14tQngYQSp4/ZBe2
         CA3cgvjNTtHVMhbvLvkH9+FdzqATPRZLJcY4CSP6VEaJJzn87CjEyuxs9T/rXIzyS9cD
         0GpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698407451; x=1699012251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfVCRhTvg2AKt7pFrqXCIbLBZfzHqk8QnIhyroAtK40=;
        b=EOztVzPkrP9oXxtHlzwd/ufArU0liAC2pHhLcrqdirDmHrO5tqa3WpcWhS0IUerm6I
         lruSOG4eaP/WOpzczPCDkCokKt2Stf87kH3CPrYcWNcXJJJ/b42O3FgoWz9nJb1+yUYh
         bvr937Ng8vvAe8s6oPFJZpzc3M8h95USgIvf7y7vUArxGXhHergv3OkuGDyGUfUlHW3U
         EoyjrpUD15nbMP4xEjMMK+NGxyO60mFxBCwi3ZojqV1HVEtaiWqrWdilZ8Ery2HONfos
         I1FcP88oWss35tzrj147l4ZVc2wHRcxDekdpGrzSWzngAY7bYedlK8iF2PSBcZfAPNg0
         OtGw==
X-Gm-Message-State: AOJu0YxSSnmycxTBxjqLQP5s0VLFyQZEZ7Wtb4fnSOnZNKrK9naqM+5M
	+wc5Q+vbxyy5MHCPDmzixXdlULYYwn7Cmt5LgJYGmQCI
X-Google-Smtp-Source: AGHT+IG0aeDLhSo1OjLoWuLJrj1AAjKrho6QPU3nIfOqWywiZrCtzWubh3NsEhtixnL0rePrmpB0WHpgwJU8KMQZ03o=
X-Received: by 2002:aa7:cf1a:0:b0:53f:6ee5:2cea with SMTP id
 a26-20020aa7cf1a000000b0053f6ee52ceamr1942372edy.17.1698407451203; Fri, 27
 Oct 2023 04:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20231025065909.57344-1-philmd@linaro.org>
In-Reply-To: <20231025065909.57344-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Oct 2023 12:50:40 +0100
Message-ID: <CAFEAcA8aspECn4d=V7N0fb8mkJqVSSkRBaCRzMo70T2ZFYzHVw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Avoid using 'first_cpu' when first ARM CPU is reachable
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org, 
	Niek Linnenbank <nieklinnenbank@gmail.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: GJtIrGJEz5lT

On Wed, 25 Oct 2023 at 07:59, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Prefer using a well known local first CPU rather than a global one.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---



Applied to target-arm.next, thanks.

-- PMM

Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp2347706ejb;
        Mon, 20 Nov 2023 09:25:16 -0800 (PST)
X-Received: by 2002:a17:906:1859:b0:9e8:2c4d:40d4 with SMTP id w25-20020a170906185900b009e82c4d40d4mr7545184eje.30.1700501116048;
        Mon, 20 Nov 2023 09:25:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700501116; cv=none;
        d=google.com; s=arc-20160816;
        b=IWCgdhIjvpaiGTjexQ3LP+OYkzLrX/eJZuWU00+WWkKQhX642rfm7IxMOVIdTs1Mxq
         6to82eOKU0lbkaQYRdMrFxGBV1Ah2usF8bxpn7BTF6WWpGXAuHtLWIMN7AXMQfG4PZyD
         sBuadO7zLLUIB1eUDNgtu5aIPtD1x7GNjXNZsonIFau0aGWDK2Oblqnmmk+p0fuQA+9x
         is+or0zAvrceS9VZd/saO8J8Gylqe0hXJ+elsIe1ipqQrCvuUfY3Fl8hldAFMp6P23Kq
         yu2BT96zIyRWgB3e6jQQQHEUYLZtDxVHB6nhuIk31mDvC1yUcFaSCmcKNQmeQV0yysSA
         ek9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rt6yvIhC3Ev+7ooito66m4fp8ulzbX39qgkqxP3R/Fg=;
        fh=/UlhpyZbq2zH+qA+avu/2OTfcdlQj9UMJPfDI/YBVak=;
        b=kEXvUAlbrutjej2Bmiqn6vO6ur6b/9/5DkGhORdmgMXEARYOEAG53Kc5JN8tsbYeoq
         QiCd8/W25+Xxz7bOdqBIugjnmbYSPrYJzOEbtTUOZihVr6hHdEB0GKE9d5t8/V6p1nN2
         oM6gDscTWcQu4+LtjsiKK8WfyH6IeLW2ukEEOH57gL/dSz9zw2op7IJ557rDYlS1NgYj
         MX3afgpNXc6ANtJs3igkDpsTKd1UNzNzmaGmRc/aTpzv2szmJgcqWlFq3orvBQ/KkYtf
         0cc/PtSlPyfPcpWAILQdEGT9IdgNtk/d0/bvADTHBpmofqchg36+1BoJKYucF2F4kS3r
         mQfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aPxn/7Uv";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e27-20020a170906749b00b009fb0888b203sor1370247ejl.18.2023.11.20.09.25.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 20 Nov 2023 09:25:16 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aPxn/7Uv";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700501115; x=1701105915; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rt6yvIhC3Ev+7ooito66m4fp8ulzbX39qgkqxP3R/Fg=;
        b=aPxn/7UvYbSFRuHNYlpKtxmC1pCt0p5+YPLlmlIyqXpizIGWOLk1HGzqjHaLePLJdA
         3rMtfFHXHraTp/ZD4p1J38WFeSmCoq5L4lFmfvBlY+A2EcxT2PKva7KFwdWF75vA2tXL
         Vly6RYE9/T83tfz1YgS1vgQd7Hfead9wCw8rcchkia8Dmq6QBEkSLfhi+N7IM7NdyjYL
         sEXLFQByJYj8vXw1xJnOkwLlbEnEG9EjMvChLQJOfk0tiqVAn6g/JRHWtdn5jpL8bojn
         AtHnGsA+mYpCX8yxukpCBVRKujSjZzUSF/+/PxkBeiPFSnpeuwoT7t5QW3Dil9jhDEnD
         hPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700501115; x=1701105915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rt6yvIhC3Ev+7ooito66m4fp8ulzbX39qgkqxP3R/Fg=;
        b=Idna5GE7OhfG2MTLl7O4cAjhM56Wl/U0JfWbd5Wiqw+6v59SX0oWaLjcw/1evaTeK5
         CdYWGego3m19N5oc0AB6YrJL2AELtfVz01OYN6l57syoplfYeltRBwuTQs3sq1W5EUEX
         T6zEel+kW8nRF1vi4tpzrdyszARjY8ppvt26hoKplACfPiUCrEEilnb/mbfBGNAO51T3
         6RGuNMPl+SllzTh4A7+S0VsLeu7XiFGb0JSqfftqYTrSrpL/mFrpi/2rSs92NIm8Oag9
         kneaSPTF8IUMbWO0Ce91YWCCgiqA4VA1ha1IWfn7r5kJvAEKSNjVUMWjohTJ8ykwn+Lx
         l9VQ==
X-Gm-Message-State: AOJu0Yze5gWM+zlh8SL+Lgm0tTCGqiI6cIaXVej37M82PbR5qIVt5N7a
	tBpiST6cu4Vt60g2o0V7Zgv2IsxpV7hNcvPIR2GP5BxoRnOM0EoqR/U=
X-Google-Smtp-Source: AGHT+IHUPzvuL4D5bW87jvt9+3tI9CkZu1gwEXCUgdaVDL8WlhPbVavuyUvtrEYJRofrLc/NHtSqA3dIg0mB2JPZKzk=
X-Received: by 2002:a05:6402:688:b0:543:52be:e6ad with SMTP id
 f8-20020a056402068800b0054352bee6admr68352edy.5.1700501115673; Mon, 20 Nov
 2023 09:25:15 -0800 (PST)
MIME-Version: 1.0
References: <20231120150833.2552739-1-alex.bennee@linaro.org> <20231120150833.2552739-12-alex.bennee@linaro.org>
In-Reply-To: <20231120150833.2552739-12-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Nov 2023 17:25:04 +0000
Message-ID: <CAFEAcA_QP7QZb04Op-U_jYGpVckSkzgQrFnJghywLK1NgX6sxQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/14] tests/tcg: enable arm softmmu tests
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Mahmoud Mandour <ma.mandourr@gmail.com>, David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org, 
	Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org, devel@lists.libvirt.org, 
	qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Alexandre Iooss <erdnaxe@crans.org>, Marek Vasut <marex@denx.de>, Thomas Huth <thuth@redhat.com>, 
	Chris Wulff <crwulff@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: xRpo+jdlK/dp

On Mon, 20 Nov 2023 at 15:08, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> To make it easier to test 32 bit Arm softmmu issues implement a basic
> boot.S so we can build the multiarch tests. Currently CHECK_UNALIGNED
> is disabled as I haven't got the right magic set for it to work.
>
> Message-Id: <20231115205542.3092038-10-alex.bennee@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


> +# Running
> +QEMU_BASE_MACHINE=3D-M virt -cpu max -display none
> +QEMU_OPTS+=3D$(QEMU_BASE_MACHINE) -semihosting-config enable=3Don,target=
=3Dnative,chardev=3Doutput -kernel
> +

A minor thing, but I just ran into an awkwardness in the
equivalent set of variables in the aarch64 subdirectory:
if you ever want to define a different machine type then
there's no convenient way to say "give me the standard
options but a different machine", because the QEMU_OPTS
has the base machine in it and there's no variable with
just the semihosting etc options in it. For aarch64 I opted for:

+QEMU_BASE_ARGS=3D-semihosting-config enable=3Don,target=3Dnative,chardev=
=3Doutput
+QEMU_OPTS+=3D$(QEMU_BASE_MACHINE) $(QEMU_BASE_ARGS) -kernel

because then you can have a particular test do something like
+QEMU_EL2_MACHINE=3D-machine virt,virtualization=3Don,gic-version=3D2 -cpu
cortex-a57 -smp 4
+run-vtimer: QEMU_OPTS=3D$(QEMU_EL2_MACHINE) $(QEMU_BASE_ARGS) -kernel

You could argue about whether '-display none' should be in
QEMU_BASE_ARGS. I figure -kernel should not be because it
has the weird "must go last" property.

(These tweaks to the aarch64 makefile coming soon in a different
patch...)

thanks
-- PMM

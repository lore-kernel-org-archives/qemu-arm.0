Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp992791lfy;
        Sat, 22 Aug 2020 01:59:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzubq19liHtPuwyhw+l6Adt18LO9nRhq+0f6qKRE/EIvO8meFBrrv6LhqTaiN5cefzdQr9Z
X-Received: by 2002:adf:f48d:: with SMTP id l13mr6036027wro.43.1598086799623;
        Sat, 22 Aug 2020 01:59:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598086799; cv=none;
        d=google.com; s=arc-20160816;
        b=t3Z9tXgi2nM5s0seRYM9GtN+s7mkfFJqUwSIZnmuyH6aiUYB1jcSRDPMG2IPfIVGnB
         qmJhwdC3B2bFRppwTmyJCtBUObF5oI3TWX/W9OcB1tad19sY0BPyJYH4nRXP01Ij1qbn
         CdxovsXVUb4R01kCRKmLgwUuNjQeRpTreRIs2mlpa/FAmxoh78/AhFaSC6TFFGwef/TT
         f/LqZPoI7LWhT4rx303t9GESD96B4EgGqpUQjtQAcB+kyl8D58Wi4mnKJ5EPfGvGuN13
         jPmxM6cA3++OdOgQjYoV5ahzMP4C1LbPPygq0nn5NsbnyJS6iGcR99GITcL9le2qv1VR
         /Tgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=gW1foIRhNCGj007PHy4veDAOgbnpayN24bwrcFIipvo=;
        b=dFVUAgfnteTAhB4JVqQCY3xgfHdXGMdQPGWxBAZnlqkeA9CJB8OwqnmMKZNDncAIDz
         wGQ/igZol4kVIY/Z7X5yZZD2non4wHsQlywXMbPl+g8azbP3ESvq5YwCEgox+LH/gV2Z
         FDyEfQLfpFMz5NJkX3Jz3aRnER8Q8CaNt6Jsm2chrHQQ/m0tndZiHYPgZdKoxdNFrvLh
         Avl2s5rr0CAjL14fjoBkQAtbMdXymGd68j+Eu0GyX4RQmfGTRO5hASEApx7l9ncmHNCE
         WjgqxFRC3YTAnzL6x2ZS9toxA0S40ihrus1QcpBRr2GcmnfbG0jJ3efY5lpTjkVOXhNn
         Pbzw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 79.137.123.220 as permitted sender) smtp.mailfrom=clg@kaod.org
Return-Path: <clg@kaod.org>
Received: from smtpout1.mo804.mail-out.ovh.net (smtpout1.mo804.mail-out.ovh.net. [79.137.123.220])
        by mx.google.com with ESMTPS id x4si4177326wmc.154.2020.08.22.01.59.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 22 Aug 2020 01:59:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of clg@kaod.org designates 79.137.123.220 as permitted sender) client-ip=79.137.123.220;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 79.137.123.220 as permitted sender) smtp.mailfrom=clg@kaod.org
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.2])
	by mo804.mail-out.ovh.net (Postfix) with ESMTPS id BA3BC59932F3;
	Sat, 22 Aug 2020 10:59:57 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Sat, 22 Aug
 2020 10:59:56 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-99G0039f398cef-ed1d-4c8c-9689-b06051627c32,
                    3BE414691F1E901D170BBC22D222B03988F0DEFC) smtp.auth=clg@kaod.org
Subject: Re: [PATCH v6 4/8] ppc/e500: Use start-powered-off CPUState property
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>, <qemu-ppc@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, David Hildenbrand
	<david@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	<qemu-devel@nongnu.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar
 Markovic <aleksandar.qemu.devel@gmail.com>, Thomas Huth <thuth@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, Artyom Tarasenko
	<atar4qemu@gmail.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
	<qemu-s390x@nongnu.org>, <qemu-arm@nongnu.org>, Paolo Bonzini
	<pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>, Cornelia Huck <cohuck@redhat.com>, Igor
 Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20200819164306.625357-1-bauerman@linux.ibm.com>
 <20200819164306.625357-5-bauerman@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <3dd050ad-147e-c365-883a-3384130b0d2f@kaod.org>
Date: Sat, 22 Aug 2020 10:59:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819164306.625357-5-bauerman@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: dad23c6b-c7fe-4bcf-8773-6c35175e3896
X-Ovh-Tracer-Id: 16036473850654722969
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedruddugedguddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
X-TUID: S2CcoUQr9xvv

Hello,

On 8/19/20 6:43 PM, Thiago Jung Bauermann wrote:
> Instead of setting CPUState::halted to 1 in ppce500_cpu_reset_sec(), use
> the start-powered-off property which makes cpu_common_reset() initialize it
> to 1 in common code.
> 
> Also change creation of CPU object from cpu_create() to object_new() and
> qdev_realize_and_unref() because cpu_create() realizes the CPU and it's not
> possible to set a property after the object is realized.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>


This is breaking make check : 

    tests/qtest/libqtest.c:175: kill_qemu() detected QEMU death from signal 11 (Segmentation fault) (core dumped)
    ERROR boot-serial-test - too few tests run (expected 7, got 0)
    make: *** [/home/legoater/work/qemu/qemu-powernv-5.2.git/tests/Makefile.include:650: check-qtest-ppc64] Error 1
    make: *** Waiting for unfinished jobs....
    
    
    gdb --args build/ppc64-softmmu/qemu-system-ppc64  -display none   -M ppce500
    ...
    Thread 1 "qemu-system-ppc" received signal SIGSEGV, Segmentation fault.
    0x000055555596ebf2 in ppce500_init (machine=0x5555567aa6e0)
        at /home/legoater/work/qemu/qemu-powernv-5.2.git/hw/ppc/e500.c:880
    880	        irqs[i].irq[OPENPIC_OUTPUT_INT] = input[PPCE500_INPUT_INT];
 
    
    AFAIUI, 'input is not initialized since the CPU is not yet realized.

    C.

> ---
>  hw/ppc/e500.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index ab9884e315..d7b803ef26 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -704,9 +704,6 @@ static void ppce500_cpu_reset_sec(void *opaque)
> 
>      cpu_reset(cs);
> 
> -    /* Secondary CPU starts in halted state for now. Needs to change when
> -       implementing non-kernel boot. */
> -    cs->halted = 1;
>      cs->exception_index = EXCP_HLT;
>  }
> 
> @@ -865,7 +862,7 @@ void ppce500_init(MachineState *machine)
>          CPUState *cs;
>          qemu_irq *input;
> 
> -        cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
> +        cpu = POWERPC_CPU(object_new(machine->cpu_type));
>          env = &cpu->env;
>          cs = CPU(cpu);
> 
> @@ -897,7 +894,16 @@ void ppce500_init(MachineState *machine)
>          } else {
>              /* Secondary CPUs */
>              qemu_register_reset(ppce500_cpu_reset_sec, cpu);
> +
> +            /*
> +             * Secondary CPU starts in halted state for now. Needs to change
> +             * when implementing non-kernel boot.
> +             */
> +            object_property_set_bool(OBJECT(cs), "start-powered-off", true,
> +                                     &error_fatal);
>          }
> +
> +        qdev_realize_and_unref(DEVICE(cs), NULL, &error_fatal);
>      }
> 
>      env = firstenv;
> 

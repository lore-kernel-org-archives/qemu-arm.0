Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2857138lfy;
        Mon, 27 Jul 2020 06:28:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3Wvy2eJDzEEXKjdX8p1Z43MJBSfMc+hpVZZTAj5tkzS1W6MKSqBvRfxm8LtFO3bjMPgLO
X-Received: by 2002:adf:f008:: with SMTP id j8mr19425555wro.385.1595856537878;
        Mon, 27 Jul 2020 06:28:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595856537; cv=none;
        d=google.com; s=arc-20160816;
        b=wtoBYUnHUpTvghAsRt49p09ZaaCaQUiq2UXdkYaMx2z/PrAidZXbJeB1ajPiMo3mtA
         si7eN2xJmwqzkeUR+2/5zOFMan2cp2iAWHtdl7su787gAhsfdkgLX/Zci4smhDIclcME
         GGLD2ocAx4cYTCHvhvGwlZB1piwZmAvHh9tvfArhyoJKFs1oRJfW/UVbdaOQxrKwxZN1
         sT+TgtvXzIbF5p+Q992yoHmek5jf0fYaYJKimtt/0JWdmAfoTPfpgOvbqVRi1mFdFf6a
         4l/PpP4Bu/izB6C3SeZS8WplIs0wHBaChlZFTwFU0p7q+C30mCMVCknxnMl7OL96xivb
         ShDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=pWaOpsnrEsgtvooek4yBnxXe8AUAQBtQX+nVpr1u8SA=;
        b=BskrAnVAvcO+CZ8gWTGL2FZksZBO79L+37NZSkjpR6bcdXPdjilBaO/FeJ5+ClD9Kg
         geEnwOB3mV+XMmiWXMEWYW6fP7sTCI8CmFd4Z7CbVxEVFHcmE8IfmQ/A3d6ZGGW5xLvu
         YhfZRX+6CALJJSxAin38Xb0SEG53uew2V9PX6778AyC66R3wTSIoA4l2fe6t5S4o2mpx
         4N1Ynn3xrDsXxajY3MsLLQjLnNteqJUhqWuBxF6wG4aDV98ZvT2X5ER9R+0k4ab0ik+F
         WJOlclTp+1zHWAF9iP96dMYj3J3EDo89Y5ArIhF8cYDFN0gEffzLJS7uV1V1mL6QX3Yu
         MtwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of groug@kaod.org designates 178.33.42.204 as permitted sender) smtp.mailfrom=groug@kaod.org
Return-Path: <groug@kaod.org>
Received: from 8.mo6.mail-out.ovh.net (8.mo6.mail-out.ovh.net. [178.33.42.204])
        by mx.google.com with ESMTPS id d128si10302294wmd.220.2020.07.27.06.28.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jul 2020 06:28:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of groug@kaod.org designates 178.33.42.204 as permitted sender) client-ip=178.33.42.204;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of groug@kaod.org designates 178.33.42.204 as permitted sender) smtp.mailfrom=groug@kaod.org
Received: from player758.ha.ovh.net (unknown [10.108.57.49])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 770862211B0
	for <alex.bennee@linaro.org>; Mon, 27 Jul 2020 15:28:57 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net [82.253.208.248])
	(Authenticated sender: groug@kaod.org)
	by player758.ha.ovh.net (Postfix) with ESMTPSA id 7AC9814BEF0FE;
	Mon, 27 Jul 2020 13:28:29 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-95G001df390063-5d11-49a8-8d69-092e0317f1a0,B7B50C960922AB26A7D550ED897AF9E452A9EBFF) smtp.auth=groug@kaod.org
Date: Mon, 27 Jul 2020 15:28:28 +0200
From: Greg Kurz <groug@kaod.org>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>, Paolo
 Bonzini <pbonzini@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Peter Maydell
 <peter.maydell@linaro.org>, Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, David
 Hildenbrand <david@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@redhat.com>, Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v3 3/8] ppc/spapr: Use start-powered-off CPUState
 property
Message-ID: <20200727152828.133ee76a@bahia.lan>
In-Reply-To: <20200723025657.644724-4-bauerman@linux.ibm.com>
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
	<20200723025657.644724-4-bauerman@linux.ibm.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 15463109323247032622
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedriedtgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehkefhtdehgeehheejledufeekhfdvleefvdeihefhkefhudffhfeuuedvffdthfenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeehkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegrlhgvgidrsggvnhhnvggvsehlihhnrghrohdrohhrgh
X-TUID: RYTLFQiw0C5E

On Wed, 22 Jul 2020 23:56:52 -0300
Thiago Jung Bauermann <bauerman@linux.ibm.com> wrote:

> PowerPC sPAPR CPUs start in the halted state, and spapr_reset_vcpu()
> attempts to implement this by setting CPUState::halted to 1. But that's too
> late for the case of hotplugged CPUs in a machine configure with 2 or more
> threads per core.
> 
> By then, other parts of QEMU have already caused the vCPU to run in an
> unitialized state a couple of times. For example, ppc_cpu_reset() calls
> ppc_tlb_invalidate_all(), which ends up calling async_run_on_cpu(). This
> kicks the new vCPU while it has CPUState::halted = 0, causing QEMU to issue
> a KVM_RUN ioctl on the new vCPU before the guest is able to make the
> start-cpu RTAS call to initialize its register state.
> 
> This problem doesn't seem to cause visible issues for regular guests, but
> on a secure guest running under the Ultravisor it does. The Ultravisor
> relies on being able to snoop on the start-cpu RTAS call to map vCPUs to
> guests, and this issue causes it to see a stray vCPU that doesn't belong to
> any guest.
> 
> Fix by setting the start-powered-off CPUState property in
> spapr_create_vcpu(), which makes cpu_common_reset() initialize
> CPUState::halted to 1 at an earlier moment.
> 
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---

Thanks for doing this ! I remember seeing partly initialized CPUs being
kicked in the past, which is clearly wrong but I never got time to find
a proper fix (especially since it didn't seem to break anything).

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr_cpu_core.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> NB: Tested on ppc64le pseries KVM guest with two threads per core. 
> Hot-plugging additional cores doesn't cause the bug described above
> anymore.
> 
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index c4f47dcc04..2125fdac34 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -36,11 +36,6 @@ static void spapr_reset_vcpu(PowerPCCPU *cpu)
>  
>      cpu_reset(cs);
>  
> -    /* All CPUs start halted.  CPU0 is unhalted from the machine level
> -     * reset code and the rest are explicitly started up by the guest
> -     * using an RTAS call */
> -    cs->halted = 1;
> -
>      env->spr[SPR_HIOR] = 0;
>  
>      lpcr = env->spr[SPR_LPCR];
> @@ -274,6 +269,11 @@ static PowerPCCPU *spapr_create_vcpu(SpaprCpuCore *sc, int i, Error **errp)
>  
>      cs = CPU(obj);
>      cpu = POWERPC_CPU(obj);
> +    /*
> +     * All CPUs start halted. CPU0 is unhalted from the machine level reset code
> +     * and the rest are explicitly started up by the guest using an RTAS call.
> +     */
> +    cs->start_powered_off = true;
>      cs->cpu_index = cc->core_id + i;
>      spapr_set_vcpu_id(cpu, cs->cpu_index, &local_err);
>      if (local_err) {

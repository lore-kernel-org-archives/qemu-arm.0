Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2426107lff;
        Thu, 9 Jan 2020 09:44:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqwyexj+t3K/MEbr7CE1pv8kvyyGVuQT3fjRS2vGBodPMuIFm6BNwXtlT7yyf34sUNFDOKsZ
X-Received: by 2002:a9d:811:: with SMTP id 17mr8956533oty.369.1578591851431;
        Thu, 09 Jan 2020 09:44:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578591851; cv=none;
        d=google.com; s=arc-20160816;
        b=QbnpTFfnJdwwgS33kHM3HYBqc/7OxE3gSWZF+xDKDNF50EdOQ99nAfrRaEy60wSGAc
         RgGH8sQ8tO4ySbvGS3E7+43CdM1TjkojumgCb9GNW0j4NGG+RC63nG/5qz10cBwTcOlQ
         zFw8q40dWaYxdTN6YwhBi5kWMVIyvFK8s5+2vqUvAGU6oDKl/bWeD9s9+9VmkOr/FHes
         dokqbfgwjHyk5J3gI4LlOM98DvTiJVJVRapRXeZNLtnfVHdeP8vS4r7qsZNIoeRH1Kax
         dLcv4g9N2rKDq7NBIrT3kXuQVPg2z9jhcVeBdCOTH7dfn2nto89tUOx6mdCHrK5IQx4+
         bBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date;
        bh=jxMT8lXSZCkhZDu4mLfZodbG34XrjqlFQ0MajwzR/UQ=;
        b=pUzTdJLvMZA7+vdt17twXjgKa7BPYmqlDE3njTWY/vez7q6mddQXdszB9MJAduL45B
         65sBPMhF3npNqAkdAJznTyZ7SBNkeCUjAcmcKXwUFJiH++VazchClMqE3iMc8FM3DvCo
         /vjmxfkqK7kBkzCAPozlfiEWXB46Nn5uII7jwjTsL6FrJpe0TDT/j5oXL1xex5Oy+5DU
         IWnZOc9kVYrWC2D1NiS9SmodLVFkWwH3RwUsi2kltvMhTsXl2MXMbtMQTKuwRJiII4t7
         k6bv2jr6aE9sXv4OA/J0nY6JLVJUM+7b4cUnNADS8qaal01tfZjxU25G1MxsdWzHLy0v
         IIJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id p19si3953844oic.216.2020.01.09.09.44.11;
        Thu, 09 Jan 2020 09:44:11 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388247AbgAIRoK convert rfc822-to-8bit (ORCPT
        <rfc822;daniel.diaz@linaro.org> + 4 others);
        Thu, 9 Jan 2020 12:44:10 -0500
Received: from 11.mo1.mail-out.ovh.net ([188.165.48.29]:43220 "EHLO
        11.mo1.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728724AbgAIRoK (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 9 Jan 2020 12:44:10 -0500
X-Greylist: delayed 1270 seconds by postgrey-1.27 at vger.kernel.org; Thu, 09 Jan 2020 12:44:09 EST
Received: from player690.ha.ovh.net (unknown [10.108.16.63])
        by mo1.mail-out.ovh.net (Postfix) with ESMTP id EAA0819E4E6
        for <kvm@vger.kernel.org>; Thu,  9 Jan 2020 18:44:07 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net [82.253.208.248])
        (Authenticated sender: groug@kaod.org)
        by player690.ha.ovh.net (Postfix) with ESMTPSA id 23679DEC9C13;
        Thu,  9 Jan 2020 17:43:50 +0000 (UTC)
Date:   Thu, 9 Jan 2020 18:43:49 +0100
From:   Greg Kurz <groug@kaod.org>
To:     Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc:     qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
        Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
        Juan Quintela <quintela@redhat.com>, qemu-ppc@nongnu.org,
        Marcelo Tosatti <mtosatti@redhat.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 04/15] hw/ppc/spapr_rtas: Restrict variables scope to
 single switch case
Message-ID: <20200109184349.1aefa074@bahia.lan>
In-Reply-To: <20200109152133.23649-5-philmd@redhat.com>
References: <20200109152133.23649-1-philmd@redhat.com>
        <20200109152133.23649-5-philmd@redhat.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Ovh-Tracer-Id: 7378866518583449891
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdeiuddgieelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieeltddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehkvhhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Dk11RMNeHuCb

On Thu,  9 Jan 2020 16:21:22 +0100
Philippe Mathieu-Daudé <philmd@redhat.com> wrote:

> We only access these variables in RTAS_SYSPARM_SPLPAR_CHARACTERISTICS
> case, restrict their scope to avoid unnecessary initialization.
> 

I guess a decent compiler can be smart enough detect that the initialization
isn't needed outside of the RTAS_SYSPARM_SPLPAR_CHARACTERISTICS branch...
Anyway, reducing scope isn't bad. The only hitch I could see is that some
people do prefer to have all variables declared upfront, but there's a nested
param_val variable already so I guess it's okay.

> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/ppc/spapr_rtas.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index 6f06e9d7fe..7237e5ebf2 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -267,8 +267,6 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU *cpu,
>                                            uint32_t nret, target_ulong rets)
>  {
>      PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
> -    MachineState *ms = MACHINE(spapr);
> -    unsigned int max_cpus = ms->smp.max_cpus;
>      target_ulong parameter = rtas_ld(args, 0);
>      target_ulong buffer = rtas_ld(args, 1);
>      target_ulong length = rtas_ld(args, 2);
> @@ -276,6 +274,8 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU *cpu,
>  
>      switch (parameter) {
>      case RTAS_SYSPARM_SPLPAR_CHARACTERISTICS: {
> +        MachineState *ms = MACHINE(spapr);
> +        unsigned int max_cpus = ms->smp.max_cpus;

The max_cpus variable used to be a global. Now that it got moved
below ms->smp, I'm not sure it's worth keeping it IMHO. What about
dropping it completely and do:

        char *param_val = g_strdup_printf("MaxEntCap=%d,"
                                          "DesMem=%" PRIu64 ","
                                          "DesProcs=%d,"
                                          "MaxPlatProcs=%d",
                                          ms->smp.max_cpus,
                                          current_machine->ram_size / MiB,
                                          ms->smp.cpus,
                                          ms->smp.max_cpus);

And maybe insert an empty line between the declaration of param_val
and the code for a better readability ?

>          char *param_val = g_strdup_printf("MaxEntCap=%d,"
>                                            "DesMem=%" PRIu64 ","
>                                            "DesProcs=%d,"

Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1286229ejb;
        Thu, 6 Apr 2023 10:46:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350YqXEqaae5RnKRs8vVEPt9LrBjqCRFNVErzt0kJqesWhz+Ci9YLxpE7K+H+11D6wdxzCnF8
X-Received: by 2002:a5d:6348:0:b0:2ee:f1f0:14bd with SMTP id b8-20020a5d6348000000b002eef1f014bdmr2224805wrw.46.1680803172335;
        Thu, 06 Apr 2023 10:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680803172; cv=none;
        d=google.com; s=arc-20160816;
        b=zsSk2TMaUyLgJ6O6igTGo8FP0SXE4x8PYi14gHdBeBHuZUrxGFMGMVAkxAP1uJJMSO
         cXM7NqIIBvhTVv84dK+hhHD3BYgzRt6olqd+XSMA9YEF0t4fTQEu3xBSPW0W5EaAQQ+F
         F7e6h0VAtMSHSCGTmfrpdC0KWQuKlYep87A/GpINCazyugTEiv5Mv+CRItcpooyeaPL2
         eR3HtAx3sdeCRflCC5CSv7yYghyR6JNvzMzNljnIklOCvDHvoWkXKpxXGq42n4Y6ZZd/
         4QrkLzO51ksD5s4Ov1kVTJRsSx+RF4qzlf6fnVtPSoRhBzQwSMdm5btt/ri92Fr8pI9z
         gZ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=SIie+wqEHi3BFfRQD3OJ0k+jpUx+4D853SkyI1WECr8=;
        b=ECVqI38YBXgfziGV9IJ+X+FhNpWhcXzP2isBL4eiAP7sGs8fIGo81hmwxLQFV6+dZX
         3su37VrbxYfZ+1V/KfYMWmB5rTl7TcUs2UIzTrDDVJSDdzng6Zih08nCfTJQMpR2ZVm6
         vHbI6oM+Hh1jpqbhugF1HEDzN9G3lUgJo2HjPF/9QsYe/zOw/FG8BLDHy9Hv1SEAP9Yt
         DcZqiV0CENl9rOhLY52Aq+uznkNF5i7DSVRL5He4GgAsBCBKaEYTVEUnF6y3H/D5MBGP
         G/CitYadNabZqahgNtEa9c6o5zoqricT/uZTdhdiP9IwliI4ZcsT9ZMPrW1rIKoL6QXs
         solw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 178.33.254.192 as permitted sender) smtp.mailfrom=clg@kaod.org
Return-Path: <clg@kaod.org>
Received: from 3.mo552.mail-out.ovh.net (3.mo552.mail-out.ovh.net. [178.33.254.192])
        by mx.google.com with ESMTPS id z23-20020a1c4c17000000b003ee41a7fae9si1196192wmf.78.2023.04.06.10.46.12
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 10:46:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of clg@kaod.org designates 178.33.254.192 as permitted sender) client-ip=178.33.254.192;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 178.33.254.192 as permitted sender) smtp.mailfrom=clg@kaod.org
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.227])
	by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 4294527142;
	Thu,  6 Apr 2023 17:46:11 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 6 Apr
 2023 19:46:10 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-96R001bbd69b5d-5ba5-40e2-98d5-61c75b75d5d4,
                    FAD431FEE685CF753936F989CEAB98D84F5F9206) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5b90b770-b420-1dab-401e-b1ed5b5d7e94@kaod.org>
Date: Thu, 6 Apr 2023 19:46:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 08/10] target/ppc: Restrict KVM-specific field from
 ArchCPU
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
	<qemu-devel@nongnu.org>
CC: <qemu-s390x@nongnu.org>, <qemu-riscv@nongnu.org>,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, <qemu-arm@nongnu.org>,
	<kvm@vger.kernel.org>, <qemu-ppc@nongnu.org>, Daniel Henrique Barboza
	<danielhb413@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Greg
 Kurz <groug@kaod.org>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-9-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230405160454.97436-9-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 4ee85be4-94f7-4812-b6b2-e6f1dcb9ab6d
X-Ovh-Tracer-Id: 388153995401333749
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejfedgudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdeliedpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhsfeeltdigsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhrihhstghvsehnohhnghhnuhdrohhrghdprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhkvhhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpd
 gurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdgurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdhgrhhouhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
X-TUID: tOBfPAb1Nznn

Hello Philippe

On 4/5/23 18:04, Philippe Mathieu-Daudé wrote:
> The 'kvm_sw_tlb' field shouldn't be accessed when KVM is not available.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/ppc/cpu.h        | 2 ++
>   target/ppc/mmu_common.c | 4 ++++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 557d736dab..0ec3957397 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1148,7 +1148,9 @@ struct CPUArchState {
>       int tlb_type;    /* Type of TLB we're dealing with */
>       ppc_tlb_t tlb;   /* TLB is optional. Allocate them only if needed */
>       bool tlb_dirty;  /* Set to non-zero when modifying TLB */

'tlb_dirty' was part of the same commit 93dd5e852c ("kvm: ppc: booke206:
use MMU API"). So we might as well include it in the #ifdef section.

Thanks,

C.

> +#ifdef CONFIG_KVM
>       bool kvm_sw_tlb; /* non-zero if KVM SW TLB API is active */
> +#endif /* CONFIG_KVM */
>       uint32_t tlb_need_flush; /* Delayed flush needed */
>   #define TLB_NEED_LOCAL_FLUSH   0x1
>   #define TLB_NEED_GLOBAL_FLUSH  0x2
> diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
> index 7235a4befe..21843c69f6 100644
> --- a/target/ppc/mmu_common.c
> +++ b/target/ppc/mmu_common.c
> @@ -917,10 +917,12 @@ static void mmubooke_dump_mmu(CPUPPCState *env)
>       ppcemb_tlb_t *entry;
>       int i;
>   
> +#ifdef CONFIG_KVM
>       if (kvm_enabled() && !env->kvm_sw_tlb) {
>           qemu_printf("Cannot access KVM TLB\n");
>           return;
>       }
> +#endif
>   
>       qemu_printf("\nTLB:\n");
>       qemu_printf("Effective          Physical           Size PID   Prot     "
> @@ -1008,10 +1010,12 @@ static void mmubooke206_dump_mmu(CPUPPCState *env)
>       int offset = 0;
>       int i;
>   
> +#ifdef CONFIG_KVM
>       if (kvm_enabled() && !env->kvm_sw_tlb) {
>           qemu_printf("Cannot access KVM TLB\n");
>           return;
>       }
> +#endif
>   
>       for (i = 0; i < BOOKE206_MAX_TLBN; i++) {
>           int size = booke206_tlb_size(env, i);

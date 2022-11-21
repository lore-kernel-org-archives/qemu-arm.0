Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp2267589ejx;
        Mon, 21 Nov 2022 03:03:52 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4FPxCbDFdVuiJHp4w/pJAsfjKt2DVbr3PeNrLl/EPkb8hj1MB7W2AMWRKjR9WTY7cXgFVz
X-Received: by 2002:ae9:eb4c:0:b0:6fa:4749:cbe3 with SMTP id b73-20020ae9eb4c000000b006fa4749cbe3mr15771941qkg.171.1669028632542;
        Mon, 21 Nov 2022 03:03:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669028632; cv=none;
        d=google.com; s=arc-20160816;
        b=m5ayIpZyd65pQQ6M3OucMd9VWSh9NgNIVHTglT8B0+P6mrCcpNOkJHaUe6zsbXDcCm
         sjAlD5T3fgJyN6mFhFchQnY92MsQFbcV2q5eVAj/hCo/p1Ny2YRTfIVIwtA3ceW29GOx
         zXxa1AL4l2ZPU25fdvORkI1hp6EJ5FTnVCEE8plGHi+Z+kFOMjKP2doGbuuIvM0Hj4+T
         1FoY4SPrwoR+1AiqTSvkpfQnS6Z2tfRi7iF/nmtEjI9FO2mWKdMnqht74lH6j97YTDg9
         AU+6RdGScWrGZVQ7DM3jK3JZmhNYNsvcVCAslq1R8guGvnxgZrfjyFTTddEqpcvtwRUa
         Ugmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date;
        bh=NBHa1fq+dkB/cbMR5xUlYkqcXQiU82edTxzWNpEQY7E=;
        b=uxA8EAjE1t8Iht+MQlxe8lLNZ1E0U2BHHEsFcBLjKHK6lcRjwv5rPIFFoKrH4GOIAV
         wuike4LUQ/oWej1e3XAKArfTJ2QlE19EMpPjGjOtQoQ0ySxdZOqsos94Xtx71XGd9QAG
         HtMK3Gf/T+o89hQzDtd1Lv1dKZsxWUe+TSPZwITeVHPmusINuzts7C62a3o7F96XVQH7
         XTuCyzVu3ZbvxmUD4grRa4Bvg0trigUO1Th5xPcCN/IE9A2HYKy/WaBAH9HaZv6FtaXZ
         0osm8SRqjkY0GHYdRcng/7BbbFaOVNpOLO0kZlLAt6x6SLXdvY8JK94qVJ1qagRP5X5I
         vZiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9-20020a05620a28c900b006cde5dd186esi6398800qkp.245.2022.11.21.03.03.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Nov 2022 03:03:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ox4aU-00028l-7i; Mon, 21 Nov 2022 06:03:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ox4aK-00025c-EA
 for qemu-arm@nongnu.org; Mon, 21 Nov 2022 06:03:36 -0500
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ox4aF-0007GU-5c
 for qemu-arm@nongnu.org; Mon, 21 Nov 2022 06:03:31 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.6])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id C440423070;
 Mon, 21 Nov 2022 11:03:13 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 21 Nov
 2022 12:03:12 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002374dfbf7-e072-4805-b686-6b2b08b22e5e,
 DDADA6E0A258960EA2C3EFDC8F36B73C7D77DF4E) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Mon, 21 Nov 2022 12:03:11 +0100
From: Greg Kurz <groug@kaod.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
CC: <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <qemu-ppc@nongnu.org>, <qemu-riscv@nongnu.org>, <qemu-s390x@nongnu.org>,
 <pbonzini@redhat.com>, <peter.maydell@linaro.org>, <mtosatti@redhat.com>,
 <chenhuacai@kernel.org>, <philmd@linaro.org>, <aurelien@aurel32.net>,
 <jiaxun.yang@flygoat.com>, <aleksandar.rikalo@syrmia.com>,
 <danielhb413@gmail.com>, <clg@kaod.org>, <david@gibson.dropbear.id.au>,
 <palmer@dabbelt.com>, <alistair.francis@wdc.com>, <bin.meng@windriver.com>,
 <pasic@linux.ibm.com>, <borntraeger@linux.ibm.com>,
 <richard.henderson@linaro.org>, <david@redhat.com>, <iii@linux.ibm.com>,
 <thuth@redhat.com>, <joe.jin@oracle.com>, <likexu@tencent.com>
Subject: Re: [PATCH 2/3] i386: kvm: disable KVM_CAP_PMU_CAPABILITY if "pmu"
 is disabled
Message-ID: <20221121120311.2731a912@bahia>
In-Reply-To: <20221119122901.2469-3-dongli.zhang@oracle.com>
References: <20221119122901.2469-1-dongli.zhang@oracle.com>
 <20221119122901.2469-3-dongli.zhang@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 23266189-71d4-438d-a62b-bfc5ce6d4539
X-Ovh-Tracer-Id: 6553018936605383147
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrheeigddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegkeejtdevgeekieelffdvtedvvdegtdduudeigffhhffgvdfhgeejteekheefkeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoghhrohhugheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopeguohhnghhlihdriihhrghnghesohhrrggtlhgvrdgtohhmpdhthhhuthhhsehrvgguhhgrthdrtghomhdpihhiiheslhhinhhugidrihgsmhdrtghomhdpuggrvhhiugesrhgvughhrghtrdgtohhmpdhrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdpsghorhhnthhrrggvghgvrheslhhinhhugidrihgsmhdrtghomhdpphgrshhitgeslhhinhhugidrihgsmhdrtghomhdpsghinhdrmhgvnhhgseifihhnughrihhvvghrrdgtohhmpdgrlhhishhtrghirhdrfhhrrg
 hntghishesfigutgdrtghomhdpphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdgurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdhjohgvrdhjihhnsehorhgrtghlvgdrtghomhdprghlvghkshgrnhgurghrrdhrihhkrghlohesshihrhhmihgrrdgtohhmpdgruhhrvghlihgvnhesrghurhgvlhefvddrnhgvthdpphhhihhlmhgusehlihhnrghrohdrohhrghdptghhvghnhhhurggtrghisehkvghrnhgvlhdrohhrghdpmhhtohhsrghtthhisehrvgguhhgrthdrtghomhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhpsghonhiiihhnihesrhgvughhrghtrdgtohhmpdhqvghmuhdqshefledtgiesnhhonhhgnhhurdhorhhgpdhqvghmuhdqrhhishgtvhesnhhonhhgnhhurdhorhhgpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhkvhhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhlihhkvgiguhesthgvnhgtvghnthdrtghomhdptghlgheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.58.48; envelope-from=groug@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: TYPKdx+Vsa9+

On Sat, 19 Nov 2022 04:29:00 -0800
Dongli Zhang <dongli.zhang@oracle.com> wrote:

> The "perf stat" at the VM side still works even we set "-cpu host,-pmu" in
> the QEMU command line. That is, neither "-cpu host,-pmu" nor "-cpu EPYC"
> could disable the pmu virtualization in an AMD environment.
> 
> We still see below at VM kernel side ...
> 
> [    0.510611] Performance Events: Fam17h+ core perfctr, AMD PMU driver.
> 
> ... although we expect something like below.
> 
> [    0.596381] Performance Events: PMU not available due to virtualization, using software events only.
> [    0.600972] NMI watchdog: Perf NMI watchdog permanently disabled
> 
> This is because the AMD pmu (v1) does not rely on cpuid to decide if the
> pmu virtualization is supported.
> 
> We disable KVM_CAP_PMU_CAPABILITY if the 'pmu' is disabled in the vcpu
> properties.
> 
> Cc: Joe Jin <joe.jin@oracle.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
>  target/i386/kvm/kvm.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 8fec0bc5b5..0b1226ff7f 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -137,6 +137,8 @@ static int has_triple_fault_event;
>  
>  static bool has_msr_mcg_ext_ctl;
>  
> +static int has_pmu_cap;
> +
>  static struct kvm_cpuid2 *cpuid_cache;
>  static struct kvm_cpuid2 *hv_cpuid_cache;
>  static struct kvm_msr_list *kvm_feature_msrs;
> @@ -1725,6 +1727,19 @@ static void kvm_init_nested_state(CPUX86State *env)
>  
>  void kvm_arch_pre_create_vcpu(CPUState *cs)
>  {
> +    X86CPU *cpu = X86_CPU(cs);
> +    int ret;
> +
> +    if (has_pmu_cap && !cpu->enable_pmu) {
> +        ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_PMU_CAPABILITY, 0,
> +                                KVM_PMU_CAP_DISABLE);

It doesn't seem conceptually correct to configure VM level stuff out of
a vCPU property, which could theoretically be different for each vCPU,
even if this isn't the case with the current code base.

Maybe consider controlling PMU with a machine property and this
could be done in kvm_arch_init() like other VM level stuff ?

> +        if (ret < 0) {
> +            error_report("kvm: Failed to disable pmu cap: %s",
> +                         strerror(-ret));
> +        }
> +
> +        has_pmu_cap = 0;
> +    }
>  }
>  
>  int kvm_arch_init_vcpu(CPUState *cs)
> @@ -2517,6 +2532,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>          }
>      }
>  
> +    has_pmu_cap = kvm_check_extension(s, KVM_CAP_PMU_CAPABILITY);
> +
>      ret = kvm_get_supported_msrs(s);
>      if (ret < 0) {
>          return ret;


Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp5162636ejx;
        Thu, 24 Nov 2022 07:18:49 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7IYrV108knxqroMbDiT97fWo1SD7kPVI6OGo/CSYJ4F1fW0SxMwuNwSoCY+R9zk4ldg64w
X-Received: by 2002:ae9:f506:0:b0:6ee:3e43:ac50 with SMTP id o6-20020ae9f506000000b006ee3e43ac50mr30475958qkg.359.1669303129348;
        Thu, 24 Nov 2022 07:18:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669303129; cv=none;
        d=google.com; s=arc-20160816;
        b=d/PQezkW5fHo7d31xOii0Jn/bTwuYAzH/6Gk/ZOwJtAGFIBwebZW07gajimMlZeFnv
         t7tbb17EykKIcIFawIDVOnhBNur/qE9I6E6Dit/ZSCXf/0vovvpb9/gIpzRam2REqQGT
         ETLE6MtviAl/yYqngoImPb2lSA5PCQCyxEA5NKquW7bpaKlLWjMt2fMWLHhXGdpMwwTs
         /KFUVzJpWhYEPBNonQk9PcuSi+6QKCsnnd3V8JxOPY9/iqJuRhMX1TamUJaXUzVx4OG4
         vgu0up3IyFKjwGUggM2rPzEqCZhnK7SS58igdwWFgDrFWAY0mQLeM3/mFuSumJIdNsC6
         XkvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date;
        bh=d5GRsv8uxL6Wf3bzvhxzMqK9RvsbKMss89HO4srNhEw=;
        b=b5psNif9oVteL4lmSo58lvhOYYPJ3UewoMlZgOn30na5GT8HIuKgzc6lXkQn3ABwLF
         Z9xJ9wAROQVBPF5Dv4q0K6oD+AaX7f7MS1nSajImNBeTpwWqmD5E4nTW+GnIh0BWJJPG
         oGYKMbmE3+Dv0AbJKsuFaxDXeqtlknxdqH41CFYAmtf7rPYh4jrfMtdNzn+TN3z3ZTdq
         mrJqr96nIysRwXdcnHGlGfC+gbZbUzZXp8Potmmr6zeE2Rvo9wEBp6F6bu8LeJQAmQl6
         q9S5QwpXO136Ump0UR+jEA8Rvi94yS3xbrux5gYg5typ8k0SXbwjuuIpPsRGJvhx2C5X
         x37w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p13-20020a05620a132d00b006eaef7c08f5si773533qkj.197.2022.11.24.07.18.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Nov 2022 07:18:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyDzy-0002c7-C2; Thu, 24 Nov 2022 10:18:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oyDzu-0002aL-Fi
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 10:18:44 -0500
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oyDzs-00059Z-Km
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 10:18:42 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.249])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 443992074B;
 Thu, 24 Nov 2022 15:18:34 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 24 Nov
 2022 16:18:32 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001b1952c19-a79f-48b9-8a59-60334ae8f2e7,
 DDB2ECFE20CB56AE513B1B85273A418DB31AAA82) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 24 Nov 2022 16:18:30 +0100
From: Greg Kurz <groug@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-devel@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, "Aleksandar Rikalo"
 <aleksandar.rikalo@syrmia.com>, Chris Wulff <crwulff@gmail.com>, Marek Vasut
 <marex@denx.de>, Stafford Horne <shorne@gmail.com>, "Daniel Henrique Barboza"
 <danielhb413@gmail.com>, "=?UTF-8?B?Q8OpZHJpYw==?= Le Goater" <clg@kaod.org>, 
 David Gibson <david@gibson.dropbear.id.au>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, Bin Meng
 <bin.meng@windriver.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, <qemu-arm@nongnu.org>,
 <qemu-ppc@nongnu.org>, <qemu-riscv@nongnu.org>
Subject: Re: [PATCH for-8.0 13/19] target/ppc: Convert to 3-phase reset
Message-ID: <20221124161830.3411f177@bahia>
In-Reply-To: <20221124115023.2437291-14-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
 <20221124115023.2437291-14-peter.maydell@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 8c723b80-b8f5-4908-94da-7a0c47feb902
X-Ovh-Tracer-Id: 10036834722037733867
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrieefgdejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegkeejtdevgeekieelffdvtedvvdegtdduudeigffhhffgvdfhgeejteekheefkeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehgrhhouhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhjtghmvhgskhgstgesghhmrghilhdrtghomhdpkhgsrghsthhirghnsehmrghilhdruhhnihdqphgruggvrhgsohhrnhdruggvpdgrthgrrhegqhgvmhhusehgmhgrihhlrdgtohhmpdhmrghrkhdrtggrvhgvqdgrhihlrghnugesihhlrghnuggvrdgtohdruhhkpdihshgrthhosehushgvrhhsrdhsohhurhgtvghfohhrghgvrdhjphdpsghinhdrmhgvnhhgseifihhnug
 hrihhvvghrrdgtohhmpdgrlhhishhtrghirhdrfhhrrghntghishesfigutgdrtghomhdpphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdgurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhshhhorhhnvgesghhmrghilhdrtghomhdptghrfihulhhffhesghhmrghilhdrtghomhdprghlvghkshgrnhgurghrrdhrihhkrghlohesshihrhhmihgrrdgtohhmpdhjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdgruhhrvghlihgvnhesrghurhgvlhefvddrnhgvthdpphhhihhlmhgusehlihhnrghrohdrohhrghdplhgruhhrvghnthesvhhivhhivghrrdgvuhdphigrnhhggihirghojhhurghnsehlohhonhhgshhonhdrtghnpdhgrghoshhonhhgsehlohhonhhgshhonhdrtghnpdhtshhimhhpshhonhesqhhuihgtihhntgdrtghomhdpvggughgrrhdrihhglhgvshhirghssehgmhgrihhlrdgtohhmpdhmrhholhhnihhksehgmhgrihhlrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhmrghrvgigseguvghngidruggvpdhqvghmuhdqrhhishgtvhesnhhonhhgnhhurdhorhhgpdgtlhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.58.48; envelope-from=groug@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DL1TbJ5aL/iV

On Thu, 24 Nov 2022 11:50:16 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> Convert the ppc CPU class to use 3-phase reset, so it doesn't
> need to use device_class_set_parent_reset() any more.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  target/ppc/cpu-qom.h  |  4 ++--
>  target/ppc/cpu_init.c | 12 ++++++++----
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
> index 89ff88f28c9..0fbd8b72468 100644
> --- a/target/ppc/cpu-qom.h
> +++ b/target/ppc/cpu-qom.h
> @@ -143,7 +143,7 @@ typedef struct PPCHash64Options PPCHash64Options;
>  /**
>   * PowerPCCPUClass:
>   * @parent_realize: The parent class' realize handler.
> - * @parent_reset: The parent class' reset handler.
> + * @parent_phases: The parent class' reset phase handlers.
>   *
>   * A PowerPC CPU model.
>   */
> @@ -154,7 +154,7 @@ struct PowerPCCPUClass {
>  
>      DeviceRealize parent_realize;
>      DeviceUnrealize parent_unrealize;
> -    DeviceReset parent_reset;
> +    ResettablePhases parent_phases;
>      void (*parent_parse_features)(const char *type, char *str, Error **errp);
>  
>      uint32_t pvr;
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index cbf00813743..95d25856a0e 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -7031,16 +7031,18 @@ static bool ppc_cpu_has_work(CPUState *cs)
>      return cs->interrupt_request & CPU_INTERRUPT_HARD;
>  }
>  
> -static void ppc_cpu_reset(DeviceState *dev)
> +static void ppc_cpu_reset_hold(Object *obj)
>  {
> -    CPUState *s = CPU(dev);
> +    CPUState *s = CPU(obj);
>      PowerPCCPU *cpu = POWERPC_CPU(s);
>      PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
>      CPUPPCState *env = &cpu->env;
>      target_ulong msr;
>      int i;
>  
> -    pcc->parent_reset(dev);
> +    if (pcc->parent_phases.hold) {
> +        pcc->parent_phases.hold(obj);
> +    }
>  
>      msr = (target_ulong)0;
>      msr |= (target_ulong)MSR_HVB;
> @@ -7267,6 +7269,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
>      PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
>      CPUClass *cc = CPU_CLASS(oc);
>      DeviceClass *dc = DEVICE_CLASS(oc);
> +    ResettableClass *rc = RESETTABLE_CLASS(oc);
>  
>      device_class_set_parent_realize(dc, ppc_cpu_realize,
>                                      &pcc->parent_realize);
> @@ -7275,7 +7278,8 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
>      pcc->pvr_match = ppc_pvr_match_default;
>      device_class_set_props(dc, ppc_cpu_properties);
>  
> -    device_class_set_parent_reset(dc, ppc_cpu_reset, &pcc->parent_reset);
> +    resettable_class_set_parent_phases(rc, NULL, ppc_cpu_reset_hold, NULL,
> +                                       &pcc->parent_phases);
>  
>      cc->class_by_name = ppc_cpu_class_by_name;
>      cc->has_work = ppc_cpu_has_work;


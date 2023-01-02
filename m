Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp6713149ejb;
        Mon, 2 Jan 2023 05:46:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsXQH4yZgGRM0m3QCB90JdvfooI0dzJLrw6KxekpHa6OI1FYtbWDGmg/XXc23RY+piqm/hx
X-Received: by 2002:a81:3907:0:b0:461:bc41:3c7a with SMTP id g7-20020a813907000000b00461bc413c7amr34624761ywa.26.1672667184931;
        Mon, 02 Jan 2023 05:46:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672667184; cv=none;
        d=google.com; s=arc-20160816;
        b=sWYK1eDb7SBSMD07a9QZWSZ9QTz7nMyZpuZR9nySo+fXTgOLi/8vz2YRuRQzt38GY8
         XZtLe78+Q3Jy96fWSm8GR9P8PxC7+ewLdkm65+fHXFkRZwPQke4Sj06XWa9RVBLaQgUm
         IOx2P0Sd63MIp+hGplsyaoesBqhV51JfH08t5tECgNkR/N1NIe82o+xU9PPySL5RZEs+
         i7TimEoW2ii7Mw6U76O2ZeNQJCFiqUok+X9BO+3GD90DBa1JfDpKE/Vr0Fz/fFbdKCH9
         n1bYXqAH+oVVujrgTIz1fmvm4mrD/bhl1/WyK5pmz0mLfOjV2+J4Xco9iFVCFIFfFP4Q
         VRRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=JgrUu7GR1WWc4AGRt2uW8pmOTod+uEVImrNqQWrAexw=;
        b=OSdAA7hsC9e5bKTD1YgIyxytxab9Cs0Fv08zHLO/4OLCVW1Kt224LEBPb4PaO2rAL3
         ZLyBMt9YlXMkjggT+WrF2TJDv9T6Z91tKfcPWW8jI8YYEoWybLbpukicp/Nr1t6/eDGO
         0VwLfgOu5gtoinZjj1C0WgLzLcUy1elAryQmg3kGSQgE2BkoxABT/nuwfUWmrSvDxPcm
         4EXbGGSp9yvnPT8f5FfGjn7FvHtFwEwLsnP57apD1rt7kQSWQfbTW2VcLBVpGJ6V2EQG
         Tg2nppsxZ+vE5rNufLmdR1VoYuoBuB91VNTuFz8EvZZCdsTDSvMnRXy2bGtfL7ZVrcAW
         qS0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs19-20020a05620a471300b006fa239df48bsi14726791qkb.455.2023.01.02.05.46.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Jan 2023 05:46:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pCL8b-0004zy-Rl; Mon, 02 Jan 2023 08:46:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCL8V-0004x8-7Z
 for qemu-arm@nongnu.org; Mon, 02 Jan 2023 08:45:59 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCL8T-0007n9-9o
 for qemu-arm@nongnu.org; Mon, 02 Jan 2023 08:45:54 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.179])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id F2CD915056AEF;
 Mon,  2 Jan 2023 14:45:50 +0100 (CET)
Received: from kaod.org (37.59.142.110) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 2 Jan
 2023 14:45:49 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004971a7d3d-b5d8-4508-8e8c-4615a0151ee7,
 EB6D15DD045C308F841A27F8E66F545441276E15) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7f99bb94-8b27-23fd-5cb6-5ea22ca194fc@kaod.org>
Date: Mon, 2 Jan 2023 14:45:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 10/11] hw/arm/aspeed_ast10x0: Add TODO comment to use
 Cortex-M4F
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
CC: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>, Beraldo
 Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Peter Delevoryas
 <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>, Peter Delevoryas
 <pdel@meta.com>, <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>
References: <20221230113504.37032-1-philmd@linaro.org>
 <20221230113504.37032-11-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221230113504.37032-11-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: e0ff19db-0779-4fa2-9570-309c9c079c85
X-Ovh-Tracer-Id: 16144841715911854980
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrjedvgdehjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhjohgvlhesjhhmshdrihgurdgruhdpthhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomhdpsghlvggrlhesrhgvughhrghtrdgtohhmpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpfigrihhnvghrshhmsehrvgguhhgrthdrtghomhdprghnughrvgifsegrjhdrihgurdgruhdptghhihhnqdhtihhnghgpkhhuohesrghsphgvvgguthgvtghhrd
 gtohhmpdhpvghtvghrsehpjhgurdguvghvpdhsthgvvhgvnhgplhgvvgesrghsphgvvgguthgvtghhrdgtohhmpdhjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomhdpphguvghlsehfsgdrtghomhdpphguvghlsehmvghtrgdrtghomhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdptghrohhsrgesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.142,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: Q0ZQSkbZfttE

On 12/30/22 12:35, Philippe Mathieu-Daudé wrote:
> This SoC uses a Cortex-M4F. QEMU only implements a M4,
> which is good enough. Add a TODO note in case the M4F
> is added.

How complex would it be to add the FPU version of the M4 ? I suppose we have
all the instructions already implemented ?
  
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Peter Delevoryas <peter@pjd.dev>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



> ---
>   hw/arm/aspeed_ast10x0.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index 7a7443a95b..a3bcbef24a 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -421,7 +421,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
>       dc->realize = aspeed_soc_ast1030_realize;
>   
>       sc->name = "ast1030-a1";
> -    sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
> +    sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4"); /* TODO cortex-m4f */
>       sc->silicon_rev = AST1030_A1_SILICON_REV;
>       sc->sram_size = 768 * KiB;
>       sc->secsram_size = 9 * KiB;


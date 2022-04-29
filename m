Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp2258554lfu;
        Fri, 29 Apr 2022 00:33:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHQxZasy424fPHjbHl4aAYbqtnJgCyqU8N+ytegQgOccYY6WCBPL2z51af17I868P8WJWk
X-Received: by 2002:a05:6214:2344:b0:441:8201:7246 with SMTP id hu4-20020a056214234400b0044182017246mr27726502qvb.120.1651217585304;
        Fri, 29 Apr 2022 00:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651217585; cv=none;
        d=google.com; s=arc-20160816;
        b=xRcG6wzaid5iVXID65vWL3VVX9pPMdCliPvn1lSxyz1Sgqk2oH0MLzDT52OEEjKJP9
         kWP1LnzhFnd/LDGKl3KJzqmUPvFAITer/VpbltTuzZR0yZlUNbdscVRLLLduoQIwhJMA
         lmVWNw0hyCqhwnKKr2bbIhMc0TXRTSWC4JqbwOZ6tXOfDsBh9eTojt+hKTBk/jz696DL
         K6C1dUER86v8e4s1QXh272xnb4la1BQkMIH+0zzunnhuXCK5YPAnTP0sJT02aGH6TIuD
         OUodzfWfjo6vImNvgE+4MjLAvVylkbFa8Z38g0vt5EyEyV+CcvY10zuu9Cz0k0YjfXFU
         B05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=nnHP/Xrc8QDe4tQ1RPpF7YZFZ8Uc2Unrry6njqCxzsM=;
        b=PTIB/pxZokbMIHoZGVZWbrEhiDmuFH6tuT/a9FkGj1hQflDy76T6nA06xZDmZvnHYj
         hwmiQrgyPn12gh8Atz1ieEYb4WOddG47WysaqKlvlU1hADvw2quG3GYrmM3qjjbAokg4
         LqXEFn/tUvwv4GpvynH2ZvQMcGk/7LqDyP5utLpDACQKli6jMeY4nAhO/KAvDC52QU4l
         TbhroV2zqxsYvwyiIJYKFvvI4gkorIB14aYFTG7/rmv7bvRDwOk0TnNUbK2/LWvyPO1D
         csXnFhW8CyEKwyUSjT/zsYHNDLJbjWQYAnuze+/yyOReCYkxP550FzKiSWqp//4l19sz
         DJMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 68-20020a0c804a000000b00452056f840bsi2288194qva.287.2022.04.29.00.33.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Apr 2022 00:33:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nkL7g-0008SB-QU
	for alex.bennee@linaro.org; Fri, 29 Apr 2022 03:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nkKsc-0003hr-M2
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 03:17:30 -0400
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:58469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nkKsZ-0001oe-Lb
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 03:17:30 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.17])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id F3A0F210C4;
 Fri, 29 Apr 2022 07:17:15 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 29 Apr
 2022 09:17:15 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002ca64166f-6bca-4fde-8c0f-0fa9cc2a9fee,
 412C68CED1BAB306384967E30B6A70C231848F32) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <991dee2c-c189-087b-f576-b2473cae229b@kaod.org>
Date: Fri, 29 Apr 2022 09:17:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] hw/arm: add versioning to sbsa-ref machine DT
Content-Language: en-US
To: Leif Lindholm <quic_llindhol@quicinc.com>, <qemu-devel@nongnu.org>
References: <20220427182934.27075-1-quic_llindhol@quicinc.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220427182934.27075-1-quic_llindhol@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b6d8701e-0b25-491d-8119-55c911fed5b7
X-Ovh-Tracer-Id: 10446943761429334947
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudekgdduudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprhgrugesshgvmhhihhgrlhhfrdgtohhm
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kcSCndJBs2Lp

On 4/27/22 20:29, Leif Lindholm wrote:
> The sbsa-ref machine is continuously evolving. Some of the changes we
> want to make in the near future, to align with real components (e.g.
> the GIC-700), will break compatibility for existing firmware.
> 
> Introduce two new properties to the DT generated on machine generation:
> - machine-version-major
>    To be incremented when a platform change makes the machine
>    incompatible with existing firmware.
> - machine-version-minor
>    To be incremented when functionality is added to the machine
>    without causing incompatibility with existing firmware.
>    to be reset to 0 when machine-version-major is incremented.
> 
> These properties are both introduced with the value 0.
> (Hence, a machine where the DT is lacking these nodes is equivalent
> to version 0.0.)
> 
> Signed-off-by: Leif Lindholm <quic_llindhol@quicinc.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Radoslaw Biernacki <rad@semihalf.com>
> Cc: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/arm/sbsa-ref.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 2387401963..e05f6056c7 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -190,6 +190,9 @@ static void create_fdt(SBSAMachineState *sms)
>       qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
>       qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
>   
> +    qemu_fdt_setprop_cell(fdt, "/", "machine-version-major", 0);
> +    qemu_fdt_setprop_cell(fdt, "/", "machine-version-minor", 0);


Thanks for your reply in the other email. From what I captured, the
DT aspect is not that important, but still, we could may be use some
specific 'sbsa' property names :

     qemu_fdt_setprop_cell(fdt, "/", "sbsa,version-major", 0);
     qemu_fdt_setprop_cell(fdt, "/", "sbsa,version-minor", 0);


?

C.

> +
>       if (ms->numa_state->have_numa_distance) {
>           int size = nb_numa_nodes * nb_numa_nodes * 3 * sizeof(uint32_t);
>           uint32_t *matrix = g_malloc0(size);


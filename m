Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp2312729lfb;
        Sat, 28 Aug 2021 01:29:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuAV6a4wLkyMEo74j9pqBAStHzVckAgZWoJZ9jfvRlxFkKcPglr5YIXtD/yEJ/j9Jrn4ba
X-Received: by 2002:a5d:818b:: with SMTP id u11mr10519073ion.43.1630139344333;
        Sat, 28 Aug 2021 01:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630139344; cv=none;
        d=google.com; s=arc-20160816;
        b=UJM2cuLxMUuKBaX1YXIgLq50zka2RfbQ0Y7fIZ0O8lyoi4XU5GD8/MPYjuWXsC8uCt
         CgbXKH8CR9cMHS/aCcrmoyroLMxVVmtIP4CA4j9fLH2W2xAz50fPdzFJ8zEbIzN54Hty
         57vavJjcTuEvBR3yp9ApSv0PhUgYlvNZVGpNPrUq5rbhSC+PDEI/SfZO4yY4enqnBMtx
         HIx6X0RbM02cT4XPReWKtFzl0i4SjeSp+GN6qUUsoWzuJeMk/jOVFD/OW0EisNBQOadj
         IirJSU+bMS0rZ4v55bESrkb7bssBGbsXGS3uk2hNw6pbWWYF35LHyNNmiBy4DkgEcy+2
         RerA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=RGcY5j3DRtejYVxpe8vo+utg6QW5k1yiNlmQwCcrWrk=;
        b=njSWHjr1LvbLK+Yz0u447yP3KpPB+bxk7bFwOjpaFqxOlwLLfxNhXGNxu4TiWSicgL
         8hcuQcrMt6980B2GEnrt1c3glYzsg1/nLA1kqMaa5/LsYC+t77yZ4Opgqa+Uc9IF2E8i
         lrOEubICi6DLYUAhWz+KcXmmPjc2Cvl8TKRQVVNod74SqR0gv7KQ3eOxZPdhyZCW0+pT
         IPErOouEp26A3naOhRiPimSsAuHnK0mujOvWVQl//DGCnWjBK08zztIhHWz25SXO9AgG
         9mpXSKKmbnfcCm4GKTFJwKMpWAjXE3p8BwcoCWghGUS4zWWVoKAwiZU0okvDx4mqSa/k
         pwpA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17si8157864iln.134.2021.08.28.01.29.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Aug 2021 01:29:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJti3-0007dq-KK
	for alex.bennee@linaro.org; Sat, 28 Aug 2021 04:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mJthq-0007bs-Q0; Sat, 28 Aug 2021 04:28:50 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:45751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mJthp-0000gr-1P; Sat, 28 Aug 2021 04:28:50 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.92])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DC8A5BB55BB1;
 Sat, 28 Aug 2021 10:28:45 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Sat, 28 Aug
 2021 10:28:45 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001388c11c8-f242-4be7-b2e4-bf1f984e5923,
 6CE952B1E590FC391734534FA2C2FCCDA042449D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 83.199.102.86
Subject: Re: [PATCH 3/5] hw/arm/aspeed: Add fuji machine type
To: <pdel@fb.com>
References: <20210827210417.4022054-1-pdel@fb.com>
 <20210827210417.4022054-4-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5278af17-e56a-772a-21fe-8594790427d3@kaod.org>
Date: Sat, 28 Aug 2021 10:28:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210827210417.4022054-4-pdel@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 95fa02b2-8c51-4d4b-8cf6-87a557fe82ba
X-Ovh-Tracer-Id: 17563194125917195232
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudduhedgtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegvdeijeefvdfhudfhffeuveehledufffhvdekheelgedttddthfeigeevgefhffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehpuggvlhesfhgsrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.437,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, joel@jms.id.au, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vCVGMQPfy4EZ

On 8/27/21 11:04 PM, pdel@fb.com wrote:
> From: Peter Delevoryas <pdel@fb.com>
> 
> Fuji uses the AST2600, so it's very similar to `ast2600-evb`, but it has
> a few slight differences, such as using UART1 for the serial console.

Do we have a public DTS for this board ? 

Thanks,

C.

> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>  hw/arm/aspeed.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index ff53d12395..d2eb516a1d 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1029,6 +1029,15 @@ static void aspeed_machine_rainier_class_init(ObjectClass *oc, void *data)
>          aspeed_soc_num_cpus(amc->soc_name);
>  };
>  
> +static void aspeed_machine_fuji_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc = "Facebook Fuji BMC (Aspeed AST2600, Cortex-A7)";
> +    amc->serial_dev = ASPEED_DEV_UART1;
> +}
> +
>  static const TypeInfo aspeed_machine_types[] = {
>      {
>          .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
> @@ -1078,6 +1087,10 @@ static const TypeInfo aspeed_machine_types[] = {
>          .name          = MACHINE_TYPE_NAME("rainier-bmc"),
>          .parent        = TYPE_ASPEED_MACHINE,
>          .class_init    = aspeed_machine_rainier_class_init,
> +    }, {
> +        .name          = MACHINE_TYPE_NAME("fuji"),
> +        .parent        = MACHINE_TYPE_NAME("ast2600-evb"),
> +        .class_init    = aspeed_machine_fuji_class_init,
>      }, {
>          .name          = TYPE_ASPEED_MACHINE,
>          .parent        = TYPE_MACHINE,
> 


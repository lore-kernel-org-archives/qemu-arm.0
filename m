Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2487946lft;
        Mon, 27 Jun 2022 09:06:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tyFFPAD/FIlZVMmGLore5gEbIV2LcXVVrO5CP5hG1YV7QPoeyFD4DfGQa+EaHuUt6KM7gn
X-Received: by 2002:a05:622a:6098:b0:2f0:f0d2:b5f0 with SMTP id hf24-20020a05622a609800b002f0f0d2b5f0mr9808453qtb.583.1656346001269;
        Mon, 27 Jun 2022 09:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656346001; cv=none;
        d=google.com; s=arc-20160816;
        b=ofWi/T+cD7FRRfWFaKxNBLxgA9WbnUK2xhZwKvqLwVlKLTagq00w0JY9FgdBgM72ys
         dQFdYy8zlOFUz6uWSdrowCdw5xK/aHu9C96U7mKmW3r84AJcfvPFRmLayZROQtXmfAse
         QHnV0A5eHv0BmnzEov00DpoGczozYA/Ati5V7/Dx0oTjNHohxo/xN58k1wzJrNReZqB7
         wrtCJ+lbdBnU0UW86qBXCFOqXKwc7PxQfjmbw/a6sDI+Wf4CnLE3BmXqcIU4R4+Vk1KL
         BtPoKqo15BXRXNVfUczPhzMVQaLENbTBGRy5Mwbh38QWgnUZoRCgKQopUFeXNHj9YY05
         us0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=PChz++RQC2jXaCsxwa3CSwwDlIle4TzYkXVPEU7dwXI=;
        b=lD4Qv0w4TvxpT2ol1p8qvHq+VOQGiXT+Wd2GBJhMIUJ0srmJQzhxCd5q5F4hjNVjes
         v8x9lm667nk9PE+i0+MM4Bi/lmZU566t9/sJBAgCpzSGWQAoSLzbTjiWTVRPSUPqoaae
         1SKFlc4owhd5nK9JQBex0lgdUdrby3kgfKJpKKketUBCPjQOgVwxQNl0lBpVCDjR9Tau
         GR45wHl1exAEnke7IrsQzb325JMKCqKnemu6JLWL2pHdFWmQC97ArVrPgjRemMSPkNXZ
         2IS97IFsUIgKn7O8TJJK1gwwD8w1KsvpGWjTW6YZgeKCSWgPYafTzaRJt9zOMsax6YkV
         mlEg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n2-20020a05622a11c200b002fb85bcffebsi955512qtk.28.2022.06.27.09.06.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 09:06:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5rG4-0003i4-P5
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 12:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o5r6x-00028d-5M
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 11:57:15 -0400
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:33815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o5r6v-0006wv-7Y
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 11:57:14 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.108])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 1C39E249DF;
 Mon, 27 Jun 2022 15:57:09 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 27 Jun
 2022 17:57:08 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0014d870ca8-bebd-4dc7-9465-137165fafad5,
 D5BAD815273CE4794DDBC5929823026F491AE39B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <25db4069-b761-1d06-c7b3-e4d05d368480@kaod.org>
Date: Mon, 27 Jun 2022 17:57:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 3/9] hw/arm/aspeed: qcom-dc-scm-v1: add block backed FRU
 device
Content-Language: en-US
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Peter Maydell
 <peter.maydell@linaro.org>, Titus Rwantare <titusr@google.com>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
 <20220622172830.101210-4-quic_jaehyoo@quicinc.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220622172830.101210-4-quic_jaehyoo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fa3722d6-3ffa-4d7e-b726-b488dbd39af9
X-Ovh-Tracer-Id: 15227796243274435375
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeghedgleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: more7OS/SDhD

On 6/22/22 19:28, Jae Hyun Yoo wrote:
> From: Graeme Gregory <quic_ggregory@quicinc.com>
> 
> The FRU device uses the index 0 device on bus IF_NONE.
> 
> -drive file=$FRU,format=raw,if=none
> 
> file must match FRU size of 128k
> 
> Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>



Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/arm/aspeed.c | 22 +++++++++++++++++-----
>   1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 785cc543d046..36d6b2c33e48 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -992,17 +992,29 @@ static void fby35_i2c_init(AspeedMachineState *bmc)
>        */
>   }
>   
> +static void qcom_dc_scm_fru_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
> +{
> +    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
> +    DeviceState *dev = DEVICE(i2c_dev);
> +    /* Use First Index for DC-SCM FRU */
> +    DriveInfo *dinfo = drive_get(IF_NONE, 0, 0);
> +
> +    qdev_prop_set_uint32(dev, "rom-size", rsize);
> +
> +    if (dinfo) {
> +        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
> +    }
> +
> +    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> +}
> +
>   static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
>   {
>       AspeedSoCState *soc = &bmc->soc;
>   
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 15), "tmp105", 0x4d);
>   
> -    uint8_t *eeprom_buf = g_malloc0(128 * 1024);
> -    if (eeprom_buf) {
> -        smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 15), 0x53,
> -                              eeprom_buf);
> -    }
> +    qcom_dc_scm_fru_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x53, 128 * 1024);
>   }
>   
>   static bool aspeed_get_mmio_exec(Object *obj, Error **errp)


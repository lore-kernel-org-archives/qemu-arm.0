Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2487741lft;
        Mon, 27 Jun 2022 09:06:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vMksA0RMthaYDAhwC4HlsedBqunSozu1XaQMPY5l6razuBYpMqxdqwsdkZVqjFQ6MstkvM
X-Received: by 2002:a05:622a:608c:b0:2f1:e3fa:b603 with SMTP id hf12-20020a05622a608c00b002f1e3fab603mr9770198qtb.48.1656345985449;
        Mon, 27 Jun 2022 09:06:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656345985; cv=none;
        d=google.com; s=arc-20160816;
        b=auL6kFerhhpW6nouP437mtBrbPg/mKRdd3H0U+qmbYY3Uieye1DklzsVxj4p8MOkni
         gkbFWnENMGAeNdnk0oimzAGsaTd5NHpHoTGdMeryGNA1TD5ueMLTmimFU+16jL7xN3qb
         YiikSeqWYASMyH+hCp9KBxRcMfdx//Enhii0vBDUk5+18vmR4lcd82Ms4MqPdd/2EiAG
         p9zOa/FZWe6wqztHOwhU8L6Bfiy199IPxaCjCrIl9tsxQH54zu7llnwKbMGisGttTXVQ
         1my3a2uax7xn9rWSD+HkzWRfRnO5LaShzab4z97DlKd3BxLGS19Yhlk/nIayYphnOngX
         IMIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=nBmZ44OUlHSUvp5eo+uTW9QXUB8NRQWHLHNcrUBTca0=;
        b=ZOrnnWnzCSWlujLwXS3sZJ3Wh8a7KfxMFjCBVZFG8COEF7QrO7Jp0dTBhwsD4S6vUA
         9TDm2SPL1wrgEwFuQOrl/E+IFARoIpkMK8mv6j6eJNYGqbLQp12pzIUzAJUglnCFMcro
         E5BLBX59UtBXfxCsbKYVPao73EHVp9l8dPmGxz+nFPMYqIqTypHfIifpA2METkjHZ8yR
         hDSXdBZC2kNBVmnhM+dV13Yj8NNPTqDwE1PSgl0nDKHqhxHdKzMv58777S+UDr7W98nv
         k+kSQWgNBn6lC6jqJA/x9HteLWWJWLB6fsPsbLOBOQGDU/+zuS1uc5tXXVjJv8AtqEw4
         S/Zg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17-20020a05620a25d100b006a69f93be6fsi7397794qko.733.2022.06.27.09.06.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 09:06:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5rFo-0002rI-Uq
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 12:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o5r6V-0001gR-Mv
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 11:56:47 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:46263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o5r6S-0006r0-PL
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 11:56:47 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.123])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B5586111D9497;
 Mon, 27 Jun 2022 17:56:41 +0200 (CEST)
Received: from kaod.org (37.59.142.109) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 27 Jun
 2022 17:56:40 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S00309517655-9251-4fb9-a0e2-b80df037be20,
 659C98CE65B422D4D127A36693B7EAD6442F0B22) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <77f7d3ed-304b-2709-cc70-2e5ea3f5a287@kaod.org>
Date: Mon, 27 Jun 2022 17:56:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 1/7] hw/arm/aspeed: add support for the Qualcomm DC-SCM
 v1 board
Content-Language: en-US
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Peter Maydell
 <peter.maydell@linaro.org>, Titus Rwantare <titusr@google.com>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Patrick Venture
 <venture@google.com>, Hao Wu <wuhaotsh@google.com>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220627154703.148943-1-quic_jaehyoo@quicinc.com>
 <20220627154703.148943-2-quic_jaehyoo@quicinc.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220627154703.148943-2-quic_jaehyoo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c8af353f-ec8f-4b73-a64c-f9c145c6e9a2
X-Ovh-Tracer-Id: 15220196416000723957
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeghedgleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: QLnrzCBxpeGD

On 6/27/22 17:46, Jae Hyun Yoo wrote:
> Add qcom-dc-scm-v1 board support.
> 
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>



Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
> Changes in v2:
> * Fixed a typo in HW strap value comment. (Rebecca)
> * Removed a useless change which is reverted by the next patch. (Joel)
> 
>   hw/arm/aspeed.c | 35 +++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 98dc185acd9a..cb7d99513816 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -174,6 +174,10 @@ struct AspeedMachineState {
>   #define BLETCHLEY_BMC_HW_STRAP1 AST2600_EVB_HW_STRAP1
>   #define BLETCHLEY_BMC_HW_STRAP2 AST2600_EVB_HW_STRAP2
>   
> +/* Qualcomm DC-SCM hardware value */
> +#define QCOM_DC_SCM_V1_BMC_HW_STRAP1  0x00000000
> +#define QCOM_DC_SCM_V1_BMC_HW_STRAP2  0x00000041
> +
>   /*
>    * The max ram region is for firmwares that scan the address space
>    * with load/store to guess how much RAM the SoC has.
> @@ -988,6 +992,13 @@ static void fby35_i2c_init(AspeedMachineState *bmc)
>        */
>   }
>   
> +static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
> +{
> +    AspeedSoCState *soc = &bmc->soc;
> +
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 15), "tmp105", 0x4d);
> +}
> +
>   static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
>   {
>       return ASPEED_MACHINE(obj)->mmio_exec;
> @@ -1420,6 +1431,26 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
>       amc->macs_mask = 0;
>   }
>   
> +static void aspeed_machine_qcom_dc_scm_v1_class_init(ObjectClass *oc,
> +                                                     void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc       = "Qualcomm DC-SCM V1 BMC (Cortex A7)";
> +    amc->soc_name  = "ast2600-a3";
> +    amc->hw_strap1 = QCOM_DC_SCM_V1_BMC_HW_STRAP1;
> +    amc->hw_strap2 = QCOM_DC_SCM_V1_BMC_HW_STRAP2;
> +    amc->fmc_model = "n25q512a";
> +    amc->spi_model = "n25q512a";
> +    amc->num_cs    = 2;
> +    amc->macs_mask = ASPEED_MAC2_ON | ASPEED_MAC3_ON;
> +    amc->i2c_init  = qcom_dc_scm_bmc_i2c_init;
> +    mc->default_ram_size = 1 * GiB;
> +    mc->default_cpus = mc->min_cpus = mc->max_cpus =
> +        aspeed_soc_num_cpus(amc->soc_name);
> +};
> +
>   static const TypeInfo aspeed_machine_types[] = {
>       {
>           .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
> @@ -1457,6 +1488,10 @@ static const TypeInfo aspeed_machine_types[] = {
>           .name          = MACHINE_TYPE_NAME("g220a-bmc"),
>           .parent        = TYPE_ASPEED_MACHINE,
>           .class_init    = aspeed_machine_g220a_class_init,
> +    }, {
> +        .name          = MACHINE_TYPE_NAME("qcom-dc-scm-v1-bmc"),
> +        .parent        = TYPE_ASPEED_MACHINE,
> +        .class_init    = aspeed_machine_qcom_dc_scm_v1_class_init,
>       }, {
>           .name          = MACHINE_TYPE_NAME("fp5280g2-bmc"),
>           .parent        = TYPE_ASPEED_MACHINE,


Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp556489lfp;
        Tue, 14 Sep 2021 03:57:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7p8VfbxWXFFfI6GF9T4VHzzdEcpX9UfyRQsQV7PcHBta8VrdeU85eZrLSzxNMvWvTBAf9
X-Received: by 2002:a5e:df0d:: with SMTP id f13mr13334961ioq.108.1631617026372;
        Tue, 14 Sep 2021 03:57:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631617026; cv=none;
        d=google.com; s=arc-20160816;
        b=FX01eGrwfI/HkWnCX8L/utgAh+uDBnzAk/h+xe7NrtF3wvPaNloEndcVSD9gTW4nha
         /aV2w+XWOD5jYH68uL2b/2FH2Y5QHF6sSx1VqdzspgsGA8G8YaVgRdcvqw5U2iFSraqZ
         tF1RHZh+hYPqgkNqXhBfwN+3Axuf/ZzW5XAd6xt1s5nU4MAFXQ9AZ+li8UbWKj0dOW+H
         OMKCLpnPymn90dXKG9bN/AtolvuX6ehbHNb/iRrDEPCeilHn2DNnsKlhp+GS9ipdSlhq
         koVLgg/t9zK7Cc9aoGNAfmQw4p0u3neJh+fqh66I7PpfflJHJMdOAqTFdEwsx4Kdo+fZ
         dINA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=t+8Hzv4GRDAHGMROVuH37Iq6qO0DQvLkRuDhhWpbHLM=;
        b=v2vApziKy9rk2Tg9GZ7ryVL0/p0ibGS+dhvzLsScEaLKyxf/i5qoLTQtKNP29fsSBb
         nDAyQXsP/Y7R+pm3HrnVNByJPoC0I7tdoGazMv4jZXsSwJFT0BWk7WHEimwe3OCGcLPH
         XGLsLpRYhN0lvoaccgRqelxNco/zk3agRyyXB+rGzbE8QjcH4kEq96fHsDoGw3zNrTRU
         1PwGUEZLLWB1Vg729/IgcQXIDW86Y4oJrg+a8Eq7h5W+cMpMwZ6qwx25Sw9AqxBTd7Wy
         M/SVmkpmpxbVvHyz8CySSZGP5oNA2p6gOwnB4/+1Bvrw/brcZtyQmdIWy2Mc0pc0K0xj
         78Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6si10621581ilv.93.2021.09.14.03.57.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 03:57:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQ67d-00044h-Op
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 06:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mQ67U-00041S-W7
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 06:56:57 -0400
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:34773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mQ67R-0004C2-U0
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 06:56:56 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.136])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id EB08020058;
 Tue, 14 Sep 2021 10:56:49 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 14 Sep
 2021 12:56:49 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0069a609b8a-7d05-4373-bb59-9734b4670c60,
 2B4DCE8296B83A4DEFDF4253AFCCF2A4AB0DDD95) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PULL 14/14] hw/arm/aspeed: Add Fuji machine type
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210913161304.3805652-1-clg@kaod.org>
 <20210913161304.3805652-15-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <88c26520-6b87-e7a2-ac78-c1c92477c814@kaod.org>
Date: Tue, 14 Sep 2021 12:56:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210913161304.3805652-15-clg@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 355f6587-0a43-40ab-8c29-4b864fc43796
X-Ovh-Tracer-Id: 9219149912872094502
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgfeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgedvieejfedvhfduhfffueevheeludffhfdvkeehleegtddttdfhieegveeghfffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrgh
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.969,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Peter Delevoryas <pdel@fb.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +tS/uPtG9e3x


Hello Peter D,

> +static void aspeed_machine_fuji_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc = "Facebook Fuji BMC (Cortex-A7)";
> +    amc->soc_name = "ast2600-a3";
> +    amc->hw_strap1 = FUJI_BMC_HW_STRAP1;
> +    amc->hw_strap2 = FUJI_BMC_HW_STRAP2;
> +    amc->fmc_model = "mx66l1g45g";
> +    amc->spi_model = "mx66l1g45g";
> +    amc->num_cs = 2;
> +    amc->macs_mask = ASPEED_MAC3_ON;
> +    amc->i2c_init = fuji_bmc_i2c_init;
> +    amc->uart_default = ASPEED_DEV_UART1;
> +    mc->default_ram_size = 2 * GiB;

Is that the default of the Fuji board ? This is causing an issue in our tests :

   qemu-system-aarch64: at most 2047 MB RAM can be simulated

Could we lower it down to 1G ?

Thanks,

C.

> +    mc->default_cpus = mc->min_cpus = mc->max_cpus =
> +        aspeed_soc_num_cpus(amc->soc_name);
> +};
> +
>  static const TypeInfo aspeed_machine_types[] = {
>      {
>          .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
> @@ -1119,6 +1228,10 @@ static const TypeInfo aspeed_machine_types[] = {
>          .name          = MACHINE_TYPE_NAME("rainier-bmc"),
>          .parent        = TYPE_ASPEED_MACHINE,
>          .class_init    = aspeed_machine_rainier_class_init,
> +    }, {
> +        .name          = MACHINE_TYPE_NAME("fuji-bmc"),
> +        .parent        = TYPE_ASPEED_MACHINE,
> +        .class_init    = aspeed_machine_fuji_class_init,
>      }, {
>          .name          = TYPE_ASPEED_MACHINE,
>          .parent        = TYPE_MACHINE,
> 


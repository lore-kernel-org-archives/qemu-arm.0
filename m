Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp241003lft;
        Thu, 30 Jun 2022 04:06:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s6tPlnfnZKvwBor4tTAXYhDbPQfcddy0RFUomyJGUaoAFqBJUnAwgxs+ykhW5wrjOOdcGE
X-Received: by 2002:ac8:5a47:0:b0:31d:2388:48dc with SMTP id o7-20020ac85a47000000b0031d238848dcmr6611648qta.80.1656587214989;
        Thu, 30 Jun 2022 04:06:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656587214; cv=none;
        d=google.com; s=arc-20160816;
        b=jIDE7d5+j5KEMsiZTnmTwev7CxzGHsGNv+O6HCo29p1eCuaVuhJts5+R14DlG7LMOw
         N2C3J+Jr/y0RIW+G9LBVpJ9SMGnB5upS3zYOpujw1wa15Df4MyvXYquWfGqvnuRwYU7a
         wAghmNzTAinx8RjqwmDzcsrerRfm3cbQ5VP3W6iRrTC47bY6rFi296Bb7VdfN+DwbZMC
         O+WlsKnUj5okKUGfusRu2YNV6D2xN58wPnDgXnx9HgffPliAcpV+mgAhd6dVstK+fjW2
         KdtEvT6xkuqJ3qAWOVzg36jPs+B0JkkcKHKgb+TjWBju8ONj3iw01EK0vZJMizH02h6N
         0DUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=d65F7lIZ56BVVUkWMfWkLn9N1mRmaiBUoAufhl/hF8I=;
        b=edDXxqj25Xt/jdEkrnWOLdV6mVcBBHLaVLbn82lGIErug/7DNtqVTCijUa3PxH6M8W
         WAOHa0BRp3vwrZZPvEV/12ScJOlDoBHSHbwx/5yMD6xMA7a7u9mU7LbSV/E9M21eGSZ9
         Gf9sV9ENFHchAT4QRIbX/BFuWfVVaPvGKafdjaCQyra124OVYdioyQtSclKGGjCSIwOd
         RJwnYZiO8kEwd7qPPlevmhzCVKm55juuaewmf1cD3jw0wNQgmY/dWQWyoiyBAUeIsi1c
         UDK1Oz1qWuc8MfyJPEH6NU6r/dDbpgoEWv4+WtI8ZKHR8u11M/KLn0JXqRJmHEtbOtSM
         8Euw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19-20020ac85713000000b0031b1aa6d347si6637327qtw.402.2022.06.30.04.06.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 04:06:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6s0c-0006HB-Fu
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 07:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o6rwu-0003Tb-Km
 for qemu-arm@nongnu.org; Thu, 30 Jun 2022 07:03:07 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:40343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o6rwr-0001jd-4D
 for qemu-arm@nongnu.org; Thu, 30 Jun 2022 07:03:03 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.76])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id C86D3112EBFD9;
 Thu, 30 Jun 2022 13:02:56 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 30 Jun
 2022 13:02:55 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0046cab118d-25df-4772-8008-f2639a72bd1d,
 40551C6C823FDDA91B74F5D58A080B55BE22893A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <24f848a7-3b3e-9125-bedd-dedc1460a8f0@kaod.org>
Date: Thu, 30 Jun 2022 13:02:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 14/14] hw/arm/aspeed: Add oby35-cl machine
Content-Language: en-US
To: Peter Delevoryas <me@pjd.dev>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <cminyard@mvista.com>, <titusr@google.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <zhdaniel@fb.com>, <pdel@fb.com>
References: <20220630045133.32251-1-me@pjd.dev>
 <20220630045133.32251-15-me@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220630045133.32251-15-me@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 99650269-d544-4906-8a5a-5dc64d8eeea8
X-Ovh-Tracer-Id: 9430537619722505138
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehuddgfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffeggfekveevvddvffelfeehleffhffhteegkeduueevffffkeejieevffeltdfhnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpuggvlhesfhgsrdgtohhmpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
X-TUID: o0vStt+cJX86

On 6/30/22 06:51, Peter Delevoryas wrote:
> From: Peter Delevoryas <pdel@fb.com>
> 
> The fby35 machine includes 4 server boards, each of which has a "bridge
> interconnect" (BIC). This chip abstracts the pinout for the server board
> into a single endpoint that the baseboard management controller (BMC)
> can talk to using IPMB.
> 
> This commit adds a machine for testing the BIC on the server board. It
> runs OpenBIC (https://github.com/facebook/openbic) and the server board
> is called CraterLake, so the code name is oby35-cl. There's also a
> variant of the baseboard that replaces the BMC with a BIC, but that
> machine is not included here.
> 
> A test image can be built from https://github.com/facebook/openbic using
> the instructions in the README.md to build the meta-facebook/yv35-cl
> recipe, or retrieved from my Github:
> 
>      wget https://github.com/peterdelevoryas/OpenBIC/releases/download/oby35-cl-2022.17.01/Y35BCL.elf
> 
> And you can run this machine with the following command:
> 
>      qemu-system-arm -machine oby35-cl -nographic -kernel Y35BCL.elf
> 
> It should produce output like the following:
> 
>      [00:00:00.005,000] <inf> usb_dc_aspeed: select ep[0x81] as IN endpoint
>      [00:00:00.006,000] <inf> usb_dc_aspeed: select ep[0x82] as IN endpoint
>      [00:00:00.006,000] <wrn> usb_dc_aspeed: pre-selected ep[0x1] as IN endpoint
>      [00:00:00.006,000] <wrn> usb_dc_aspeed: pre-selected ep[0x2] as IN endpoint
>      [00:00:00.006,000] <inf> usb_dc_aspeed: select ep[0x3] as OUT endpoint
>      *** Booting Zephyr OS build v00.01.05  ***
>      Hello, welcome to yv35 craterlake 2022.25.1
>      BIC class type(class-1), 1ou present status(0), 2ou present status(0), board revision(0x1)
>      check_vr_type: i2c4 0x62 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>      check_vr_type: i2c4 0x76 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>      check_vr_type: i2c4 0x76 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>      check_vr_type: i2c4 0x60 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>      check_vr_type: i2c4 0x60 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>      check_vr_type: i2c4 0x62 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>      check_vr_type: i2c4 0x76 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>      check_vr_type: i2c4 0x76 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>      check_vr_type: i2c4 0x60 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>      check_vr_type: i2c4 0x60 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>      check_vr_type: i2c4 0x62 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>      check_vr_type: i2c4 0x76 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>      check_vr_type: i2c4 0x76 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>      check_vr_type: i2c4 0x60 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>      check_vr_type: i2c4 0x60 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>      check_vr_type: i2c4 0x62 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>      check_vr_type: i2c4 0x76 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>      check_vr_type: i2c4 0x76 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>      check_vr_type: i2c4 0x60 page 0 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>      check_vr_type: i2c4 0x60 page 1 [04 00 81 d2 49 3c ff ff ff ff ff ff ff ff ff ff]
>      [init_drive_type] sensor 0x14 post sensor read failed!
> 
>      [init_drive_type] sensor 0x30 post sensor read failed!
>      [init_drive_type] sensor 0x39 post sensor read failed!
>      ipmi_init
>      [set_DC_status] gpio number(15) status(0)
>      [set_post_status] gpio number(1) status(1)
>      uart:~$ [00:00:01.010,000] <inf> kcs_aspeed: KCS3: addr=0xca2, idr=0x2c, odr=0x38, str=0x44
> 
>      [00:00:01.016,000] <err> spi_nor_multi_dev: [1216][spi1_cs0]SFDP magic 00000000 invalid
>      [00:00:01.016,000] <err> spi_nor_multi_dev: [1456]SFDP read failed: -22
>      [00:00:01.010,000] <inf> kcs_aspeed: KCS3: addr=0xca2, idr=0x2c, odr=0x38, str=0x44
> 
>      [00:00:01.016,000] <err> spi_nor_multi_dev: [1216][spi1_cs0]SFDP magic 00000000 invalid
>      [00:00:01.016,000] <err> spi_nor_multi_dev: [1456]SFDP read failed: -22
>      uart:~$ BIC Ready
> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

LGTM.

That said I would prefer to introduce the machine first and then
populate with devices.

May be it is time to introduce a new machine file. This one seems
like it could go in a f35.c file, also because a larger f35-* is
in plan. aspeed.c could contain the basic definitions and helpers.


> ---
>   hw/arm/aspeed.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index a06f7c1b62..75971ef2ca 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1429,6 +1429,50 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
>       amc->macs_mask = 0;
>   }
>   
> +static void oby35_cl_i2c_init(AspeedMachineState *bmc)
> +{
> +    AspeedSoCState *soc = &bmc->soc;
> +    I2CBus *i2c[14];
> +    I2CBus *ssd[8];
> +    int i;
> +
> +    for (i = 0; i < 14; i++) {
> +        i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
> +    }
> +    get_pca9548_channels(i2c[1], 0x71, ssd);

We should rename to aspeed_get_pca9548_channels

> +
> +    i2c_slave_create_simple(i2c[0], "fby35-sb-cpld", 0x21);
> +    i2c_slave_create_simple(i2c[1], "tmp105", 0x48);
> +    i2c_slave_create_simple(i2c[1], "tmp105", 0x49);
> +    i2c_slave_create_simple(i2c[1], "tmp105", 0x4a);
> +    i2c_slave_create_simple(i2c[1], "adm1272", 0x40);
> +    i2c_slave_create_simple(i2c[1], "tmp421", 0x4c);
> +    i2c_slave_create_simple(i2c[2], "intel-me", 0x16);
> +    i2c_slave_create_simple(i2c[4], "isl69259", 0x76);
> +    i2c_slave_create_simple(i2c[4], "isl69259", 0x62);
> +    i2c_slave_create_simple(i2c[4], "isl69259", 0x60);
> +
> +    for (int i = 0; i < 8; i++) {
> +        i2c_slave_create_simple(ssd[i], "tmp105", 0x6a);
> +    }
> +
> +    /*
> +     * FIXME: This should actually be the BMC, but both the ME and the BMC

QEMU has an embedded IPMI BMC simulator.

> +     * are IPMB endpoints, and the current ME implementation is generic
> +     * enough to respond normally to some things.
> +     */
> +    i2c_slave_create_simple(i2c[6], "intel-me", 0x10);
> +}
> +
> +static void aspeed_machine_oby35_cl_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc = "Meta Platforms fby35 CraterLake BIC (Cortex-M4)";
> +    amc->i2c_init = oby35_cl_i2c_init;
> +}
> +
>   static const TypeInfo aspeed_machine_types[] = {
>       {
>           .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
> @@ -1494,6 +1538,10 @@ static const TypeInfo aspeed_machine_types[] = {
>           .name           = MACHINE_TYPE_NAME("ast1030-evb"),
>           .parent         = TYPE_ASPEED_MACHINE,
>           .class_init     = aspeed_minibmc_machine_ast1030_evb_class_init,
> +    }, {
> +        .name          = MACHINE_TYPE_NAME("oby35-cl"),
> +        .parent        = MACHINE_TYPE_NAME("ast1030-evb"),

hmm, so we are inheriting from the evb ?

C.


> +        .class_init    = aspeed_machine_oby35_cl_class_init,
>       }, {
>           .name          = TYPE_ASPEED_MACHINE,
>           .parent        = TYPE_MACHINE,


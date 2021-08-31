Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp5173762lfb;
        Tue, 31 Aug 2021 09:05:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/Ay/46degI3BR5H7dt1AloXx3QdNAEDObelSdnLmf6Na6gxdSusX4FP2Jbvlg0vRAlTYB
X-Received: by 2002:a1c:9a91:: with SMTP id c139mr5095466wme.106.1630425953060;
        Tue, 31 Aug 2021 09:05:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630425953; cv=none;
        d=google.com; s=arc-20160816;
        b=wbURFBGiU0GU+X1mNwL7z62qi/SoVHPleiov7H3YEcoyofcGYw4PPlQcQE/L1gw+dy
         Bg3BreZ0zQ8Esgjmd47Om+39XzsHHyudsmygxnBCGXboHNITWSfIjpkxFLM85fm/GRdl
         CXb7fEyUsN+1Tq+Fwbdd34uBA7BQRVj3IaAJDK/91QbsONHL87u0935rZXAMy5JNr3Xe
         zRli2PiGH+L3jZ//oSlhdigb+KjiVrOBJEjwmJogBd7YkpsBb06/ZqVE5jS3JNvwqrR0
         f8QJtCVtfU4lr8h+J7nalLS1/er4vmWnIiVKou1CMkADOogY7WHXnlC7D3Id8FAZkVyM
         zGgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GjDWc7161JU0M8MQqKFpVI4yTllMsLQ9FyNi4oBBezY=;
        b=v+9Y1l+FrkvrhauUmzEK0+YXq2FfWaLIlVgQzsf0V2QCsHKVRIUG0B+pPgX8UPkCWg
         2KL6mmKQXDblwNge7bie3X2yIlm/i9MGOlHakdb583P9XZQDf+pwsIr35hNA4I2ATEfR
         i3Iex1Syur1D7Co9jzGVNNYOMF+05XJiYyVRMK/8W7M+AyvX30nZ4kG0vOAMHTOG4zXN
         rQYFpLSwYUToWY6BEAe+hLHXSDyCfaQKduJPo2RXtx8nQT1uUz9qc0Kg9hSSyU+5dM0A
         YrzDD+2kGeLG2Pf2HzuX/wYZhVwBdzXHFiSpvHG8cJAYSpBxGdAZ+pGRC6/zwvUT5qVN
         tMkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ok+1R7hP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6si18450136wrz.140.2021.08.31.09.05.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Aug 2021 09:05:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ok+1R7hP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mL6Gm-0004us-6B
	for alex.bennee@linaro.org; Tue, 31 Aug 2021 12:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mL6Bh-0006Bd-6O; Tue, 31 Aug 2021 12:00:39 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mL6Bd-00024f-Ok; Tue, 31 Aug 2021 12:00:36 -0400
Received: by mail-wr1-x434.google.com with SMTP id t15so22347082wrg.7;
 Tue, 31 Aug 2021 09:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GjDWc7161JU0M8MQqKFpVI4yTllMsLQ9FyNi4oBBezY=;
 b=ok+1R7hPtyOFpl7a72lMwMqhulbA/a2c2Wc1NImQ0+gDAxfvK00TKoiQHyh7WdIesM
 JEJ+rZ7T7oklq3hwdXpAiZ/bWJWjMs+elzTCuIyzr8GaxsD9bSpj3tKSlMGo2Gxm31y/
 y/soI0eIICwh7F+jpb3zIQgRECnOdmZ8zYkJ4RqTEMV19qjo6r7+xlo2hWar+rFMD3kq
 1cNksfTVmqMXHBkUsv9EvweiyrXW34+Vl5iQBtZp6l8+kDPJoHd7v/4o+uCZRHDW7Zdg
 qoARD13OLTVjYC2kzn4lyBnfCzOMap9Gh+Pu1JX4qj0rZz0v6kH1EAsz96KLp0SzIPvL
 RoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GjDWc7161JU0M8MQqKFpVI4yTllMsLQ9FyNi4oBBezY=;
 b=A4ObEvo9zs3Ig3cyarGuZ4YqskKoBenqqM9iFC+81xScdgngAXLvO8ONOLaONwG0rZ
 QhSy/q3oT/Aik/ko9Yh/zT1AvtkAYwRavrEjnIi1l0Ej+E+PWewxDdRH/uM+UN848Rc1
 x87rpq9zcznRvuiauHaWBjVY6bvXO4PUdKu371XXt4WABMYYxnSihoyTlZYbTW7IDTSl
 xZ/XYOucWbGo7rdc0y9cWXFgI0xBVs+tSYJEr3d/D0HIk0XCuhB/T/KJy/jlONqqnraX
 BRLyS+UgWkjGAdD62+sACQNLz4i9MXcMOpfZBwkDtrMP9TSzLqQOhdagIvMsQdgcmPYY
 4LeA==
X-Gm-Message-State: AOAM530xFXMcZIQl3TfDj9sAqCkjLDpVyMgWsSplaIUyiXqpqbJb1F2l
 m7lPqmvBW8De4mog15uEIvbYV2Vuc2Y=
X-Received: by 2002:adf:cd0f:: with SMTP id w15mr32688559wrm.346.1630425630160; 
 Tue, 31 Aug 2021 09:00:30 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id o8sm2618404wmp.42.2021.08.31.09.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 09:00:29 -0700 (PDT)
Subject: Re: [PATCH 3/5] hw/arm/aspeed: Add fuji machine type
To: Peter Delevoryas <pdel@fb.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <20210827210417.4022054-1-pdel@fb.com>
 <20210827210417.4022054-4-pdel@fb.com>
 <5278af17-e56a-772a-21fe-8594790427d3@kaod.org>
 <BYAPR15MB3032502C1B7CE0F8E8431C73ACC99@BYAPR15MB3032.namprd15.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7ebbc78c-2deb-de51-5c7e-301633cead6e@amsat.org>
Date: Tue, 31 Aug 2021 18:00:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <BYAPR15MB3032502C1B7CE0F8E8431C73ACC99@BYAPR15MB3032.namprd15.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.932,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vKteS45AzXdn

On 8/28/21 6:00 PM, Peter Delevoryas wrote:
> Actually yes! I should have included a link to it:
> https://github.com/facebook/openbmc-uboot/blob/openbmc/helium/v2019.04/arch/arm/dts/aspeed-bmc-facebook-fuji.dts

(On technical lists, it's best to avoid top-posting, and to
instead reply inline to make the conversation easier to follow).

Can you add a test for your board please? See examples
in tests/acceptance/boot_linux_console.py:
- test_arm_ast2500_romulus_openbmc_v2_9_0
- test_arm_ast2600_debian

> *From: *Cédric Le Goater <clg@kaod.org>
> *Date: *Saturday, August 28, 2021 at 1:28 AM
> *To: *Peter Delevoryas <pdel@fb.com>
> *Cc: *joel@jms.id.au <joel@jms.id.au>, qemu-devel@nongnu.org
> <qemu-devel@nongnu.org>, qemu-arm@nongnu.org <qemu-arm@nongnu.org>
> *Subject: *Re: [PATCH 3/5] hw/arm/aspeed: Add fuji machine type
> 
> On 8/27/21 11:04 PM, pdel@fb.com wrote:
>> From: Peter Delevoryas <pdel@fb.com>
>>
>> Fuji uses the AST2600, so it's very similar to `ast2600-evb`, but it has
>> a few slight differences, such as using UART1 for the serial console.
> 
> Do we have a public DTS for this board ?
> 
> Thanks,
> 
> C.
> 
>>
>> Signed-off-by: Peter Delevoryas <pdel@fb.com>
>> ---
>>  hw/arm/aspeed.c | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index ff53d12395..d2eb516a1d 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -1029,6 +1029,15 @@ static void
> aspeed_machine_rainier_class_init(ObjectClass *oc, void *data)
>>          aspeed_soc_num_cpus(amc->soc_name);
>>  };
>> 
>> +static void aspeed_machine_fuji_class_init(ObjectClass *oc, void *data)
>> +{
>> +    MachineClass *mc = MACHINE_CLASS(oc);
>> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
>> +
>> +    mc->desc = "Facebook Fuji BMC (Aspeed AST2600, Cortex-A7)";
>> +    amc->serial_dev = ASPEED_DEV_UART1;
>> +}
>> +
>>  static const TypeInfo aspeed_machine_types[] = {
>>      {
>>          .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
>> @@ -1078,6 +1087,10 @@ static const TypeInfo aspeed_machine_types[] = {
>>          .name          = MACHINE_TYPE_NAME("rainier-bmc"),
>>          .parent        = TYPE_ASPEED_MACHINE,
>>          .class_init    = aspeed_machine_rainier_class_init,
>> +    }, {
>> +        .name          = MACHINE_TYPE_NAME("fuji"),
>> +        .parent        = MACHINE_TYPE_NAME("ast2600-evb"),
>> +        .class_init    = aspeed_machine_fuji_class_init,
>>      }, {
>>          .name          = TYPE_ASPEED_MACHINE,
>>          .parent        = TYPE_MACHINE,
>>
> 


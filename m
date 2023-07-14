Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp3992876eje;
        Fri, 14 Jul 2023 05:12:11 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGaYZEY5Q9gZmIATMsHAo0QzhzNrMs4vmUnxCwCl6wHfr79u2iHEUs6de082Vw7kIfxrkNz
X-Received: by 2002:a0c:f584:0:b0:635:d9c0:3121 with SMTP id k4-20020a0cf584000000b00635d9c03121mr3560970qvm.0.1689336731674;
        Fri, 14 Jul 2023 05:12:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689336731; cv=none;
        d=google.com; s=arc-20160816;
        b=kKN9I5SxM2KzbNMyTQsaSYTLwbAj7sxATDTLbWzufOUMNP2VMKQKaR0y20IM/NLOD4
         g9oipA5x3bPf+9Ez0vt/GIHeBRzS1Ll81Nf2vVImwQppImuIibHweVMsy7spwKwzA279
         VUB0dGucVda1XRnmBIDskXTcOp80cnqg95BHNrjKbX9FKrKU/61rgoqQftI6zFCJFiZE
         Jxi4FCb/1Vdv4CQNHWLML5aVwnGC8qxW4qnjbrR8ORQcBrXE9auYSRVT/ZQJtvsh0xhB
         laA6qYJUIq2NCnfd0s+NzttqZMR4UWocjDvEDyroC5THFsawwh1B5aBS7PeSbvhzqFmw
         dNTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=glW9VQiFTCYRQKc64wosZSQg0PiQuKACp95ogt0befo=;
        fh=odLqd9FFV3i9O0BjT7AvuCttvuSMpMuS2ObrzwglBHk=;
        b=de6lmUX33MYr99mHRgl+VlINzJwElihU+Zwg7Q/aSsORyRm37iD4I6KJWrIbCPn70Y
         LUO6I0JThvRZrEK3X58v8KWl2aNtA70DEuw0lfBGjjqPZYKpGNKAWMyHG/lAg1mGV4Xv
         nIVOVa/Ypw0Jozjf7UHFjg4dLyLNhfEhBJD6Bg0M6X50Htd21r5pQhwQvVOPWRgQd5RM
         q4yhfCC1djhas5g8XyWs5RYu5J3QuFdoI62x4z8InoLr6kyqSUsTeST75RR1QOZgi5ue
         cpmXnodsJvKKON3R0NoMYuRCZ3NpY1aGnsnz4XNkTvYKH3yoTzaQjQcEXO9lnZ5q4UhB
         1tLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=irUG4DfQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi12-20020a05620a318c00b00766fb2210a6si4492762qkb.246.2023.07.14.05.12.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jul 2023 05:12:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=irUG4DfQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qKHe7-0000vi-Ks; Fri, 14 Jul 2023 08:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1qKHe4-0000vN-9c; Fri, 14 Jul 2023 08:11:36 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1qKHe0-0002XK-WF; Fri, 14 Jul 2023 08:11:34 -0400
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36EC7Jh7029813; Fri, 14 Jul 2023 12:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=glW9VQiFTCYRQKc64wosZSQg0PiQuKACp95ogt0befo=;
 b=irUG4DfQQip9DOaLfYiAr2Jzyua0/jZg3Lj1UhXEpi5WoEJzV02Vm+BvNzIHLh0vvuTH
 /46P1dKqDwfPSFFEIyaL4b/Kx2HIDFYi2MJpTRxhOR3uyC67pnXbpzc6rieuB07zoksm
 wGpzs+ZJA4v057CcfirzK3SIXAPfnjAiIL7nSsX4diwCMs6ljSszIApW4zit1rKkdyql
 +Qj9xZ6y1T3PKSZdcmJyxVnaTbE7rH5Hhc6vBr4xBvtMP5t5iIkDyN93YCkBYz+hN5w8
 01MysF9AznfCf28LBDbEceHW2184z8OwhbN14ECLvJwQ6JPioHf4ftSaEr5i3LLseDb6 Lw== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ru5vf88e8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jul 2023 12:11:26 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36E8Uqk6008108;
 Fri, 14 Jul 2023 12:11:25 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3rtqkhue0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jul 2023 12:11:25 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com
 [10.39.53.233])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 36ECBOQe31589094
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jul 2023 12:11:24 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A17A058054;
 Fri, 14 Jul 2023 12:11:24 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 401E05804E;
 Fri, 14 Jul 2023 12:11:24 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 14 Jul 2023 12:11:24 +0000 (GMT)
Message-ID: <14777385-4e13-de09-c58f-bf4a2b5f52fa@linux.ibm.com>
Date: Fri, 14 Jul 2023 08:11:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 07/11] hw/arm/virt: add plug handler for TPM on SysBus
Content-Language: en-US
To: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:Virt" <qemu-arm@nongnu.org>
References: <20230714070931.23476-1-j@getutm.app>
 <20230714070931.23476-8-j@getutm.app>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230714070931.23476-8-j@getutm.app>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PKy_67go_gSLj2jvarhCgJfhTrRCaUpS
X-Proofpoint-GUID: PKy_67go_gSLj2jvarhCgJfhTrRCaUpS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_06,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=912
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307140109
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: o06Bmp6Wdsy5



On 7/14/23 03:09, Joelle van Dyne wrote:
> TPM needs to know its own base address in order to generate its DSDT
> device entry.
> 
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>   hw/arm/virt.c | 37 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7d9dbc2663..432148ef47 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2732,6 +2732,37 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
>                            dev, &error_abort);
>   }
> 
> +#ifdef CONFIG_TPM
> +static void virt_tpm_plug(VirtMachineState *vms, TPMIf *tpmif)
> +{
> +    PlatformBusDevice *pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
> +    hwaddr pbus_base = vms->memmap[VIRT_PLATFORM_BUS].base;

+static void virt_tpm_plug(LoongArchMachineState *lams, TPMIf *tpmif)
+{
+    PlatformBusDevice *pbus = PLATFORM_BUS_DEVICE(lams->platform_bus_dev);
+    hwaddr pbus_base = VIRT_PLATFORM_BUS_BASEADDRESS;

These seem to be the differences between the loongarch and the arm virt implementations.
Why not have a function with this signature that both archs can call?

static void virt_tpm_plug(PlatformBusDevice *pbus, hwaddr pbus_base, TPMIf *tpmif)

Regards,
    Stefan

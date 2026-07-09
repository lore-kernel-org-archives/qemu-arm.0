Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38437C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 22:53:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whxcH-00084A-3g; Thu, 09 Jul 2026 18:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whxcF-00083d-OU
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 18:53:11 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1whxcE-0006ll-9h
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 18:53:11 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 669HY3f02520612
 for <qemu-arm@nongnu.org>; Thu, 9 Jul 2026 22:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 e87iGVll2xIUN1LNGA4IM4XgFh6Nl4c09zWdKpmbViw=; b=jP3RQh1pNn+uM8o0
 0y1jeAAOsuRMY1wI8iBYmIjlRN/lugPEOCTilRgnmHnYdzaChKzXlEZ2L5dqdsw9
 ohvHF4+4gJQ+hLNDwT0Bi0+HmSMNBWQsK9HO7GzasTPnRX6S0JeCSutHS38G1Wlx
 4iB0rLD2tweJAABtp2APYB35Rzr8oESOQqZKIQZyhjsC0zW7KIZYIVugnNze4cph
 yFUzgS9dXk54lgavUckeZYjd9zxxXBr4QrVGvr7bEzLgz+uRlIw60doAZ6F3bRtA
 2HYTVyC/XtmRMjf6FaxvEnR5otRvqPrLTBGSxpxAr4CgQWW+wEGpaBqvrc1wbpN6
 VVysgw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faekn9r96-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 22:53:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8e3ae05d649so5223926d6.0
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 15:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783637588; x=1784242388; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=e87iGVll2xIUN1LNGA4IM4XgFh6Nl4c09zWdKpmbViw=;
 b=PL9LdiMpT/n2gOlHjKtJS/Mo+wRp84R3MtSq5DnXKounBhO4HAVprbq7U/H9YLFKm5
 XGgp3/tNTFKMDx9z4N5+YUFoAc993ZgGryAS5Dn6XlJy0ISjnhKGXbpr2sCKFDRWeH8n
 yYy4uH8u4fi6q+owt8ccqROC5GckjVGKQ1CH/990du78N/czCS10K+u7WYALdh054jLy
 bCVsA6fgUtMqFF4Xt4UGa2vCmIocpAEz14aSDu0jrUMZEM3FaAg4El6ioRcmSAqVxINM
 nv5xbbzToxYGwG1XDe9jQ7WGnjQ/tveM6XFX1jW3eprHjswliATZup46rYwesysa3HG9
 fJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783637588; x=1784242388;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=e87iGVll2xIUN1LNGA4IM4XgFh6Nl4c09zWdKpmbViw=;
 b=r1+5q/EE2iW2cfgWWwVtRc1TMV93SJ30hqP41nVEiTMBU8Oz91HS5c7FF7C6+I5LPT
 eIfwjzDJykUgoh6gvX32TrpoxbzIECaC2sINRo15I/eG+A7YeILgPvs5CMJ7sy959YjD
 y5ziNFKhRXrnTWDt8okW3UbAvN2NnNpzNGptPfoaJJ5VCciwS2ZI16O2MjuB24YSreEu
 LZDkAwplWC1Y93ZuCL2hnFpGv1o+Ws+vVtjHZQ7JYMCvsjVnBJOCn4wHR6a8I4fxvAe/
 8iY04O/D1XO9TPQ0gpFs3Yk+4mJuz0RpEETfUiVDw28TGB6gOrIQLwe/aLQ6pA2Fhuq8
 ZK1g==
X-Forwarded-Encrypted: i=1;
 AHgh+RomDe0pv2XFWpqivMZzCgxqGcifqpTfl9FNR/Wynls4kRi9nCkklPRybv6PtCIVU1riuPC9w7xyzA==@nongnu.org
X-Gm-Message-State: AOJu0YzTRTw8kIl+MVsNyarcwwJLWEnOg60kAfITuKt6ZTfq30ahm4H/
 2lCsZhRJLugXCqE6EiB51iBtBKOB930XaY/AAowdJNXkcb2qlM2EfRazXG58mn1yjpWrxaXT1YU
 +A/8Oc5wtzBHZxlfjahIe8v9I9f35r6kycZ3U3Tjdo5iSBZZW9bqVVy4=
X-Gm-Gg: AfdE7cn8kc1J34uAEhux4so28zpEs4IffnFH3I2CF3js9mj+6a05USYUdOkOfl28JNu
 3LcGKcFdA+2F5kL2r91pPz1Rk+375KH3uq2daKeb7tuAPqPBWzRE117bs3Nk4KfbYMqmFy24a/v
 0nI99txVFc9bSdEO5xd7kIPkFj+iewYYboV6LmwwOhxJlMmMg74Gj/aHIpeFVutaxOPI9Ns63T8
 Lrr7cd33eClF8hTPUa1NMf9twtZN+oXx2SQEOEJufte3AHa5iCOdDkieJaf2hFPl8F4aYiUD9dp
 UAHAkFX2UjoD/0d6hHvwMY/pzIGuSNI3HX5/GcrL02ZXxOU/wZw0tM+A/6ayDveJGCpYeXPaRQb
 172gEP3es80BFx+mIYeq9kUXgsJQU7TM2/oYn0l2lGaL0PaBZ74Q0utOgpKeXEQ==
X-Received: by 2002:a05:622a:281:b0:51c:7b11:41ad with SMTP id
 d75a77b69052e-51c8b51366cmr99602431cf.73.1783637587712; 
 Thu, 09 Jul 2026 15:53:07 -0700 (PDT)
X-Received: by 2002:a05:622a:281:b0:51c:7b11:41ad with SMTP id
 d75a77b69052e-51c8b51366cmr99602241cf.73.1783637587298; 
 Thu, 09 Jul 2026 15:53:07 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb66beddsm106641295e9.0.2026.07.09.15.53.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 15:53:06 -0700 (PDT)
Message-ID: <3a360264-4dbe-4e99-9555-9454d67de533@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 00:53:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Refactor AST2700 SCU preparation for coprocessors
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20260707060919.350637-1-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707060919.350637-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDIyOSBTYWx0ZWRfX8cb8ccsPqSNQ
 /pp+85Q+9grUWMkoywWHL+4d9Tgy9xKSY4bNg61ope4se0ebm2ZaAgSszJSjVXiuK/tIOFiVLb3
 xQ6NzxT4rLH+k2NC6duq7QzXBPtcsy8=
X-Authority-Analysis: v=2.4 cv=SNlykuvH c=1 sm=1 tr=0 ts=6a502654 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Cn5a_A406VAXTJO-DV8A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: PD7aWtqAqFpE7Y-7aOFE00UkCCry4AWK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDIyOSBTYWx0ZWRfX9UOLSSPZzC5I
 kUAhFAY7OHkvWIsMo/1uqX3D/J819+w34x29fo4IJtNDCBnMAfNVfJ4PWT9geE+T5FpzLP2CbDM
 BTHM6GfEIwe4h8asPUtfSs+0hOtaDH4AihBwSm+hvpvfDVkQfip3tY4oNEGtfKwpnt0zppybaql
 8wCmiT7oj64Z8EDkWTbnSBM13m3fXB8jPIQM6AXPuG30Qv3oXmdlNb7IHDMT7H9eYG1rMDITXXA
 dhgvWMRyIPFig1FjZqA+7VgCgOldD6iC+Y2D2B27Y6tpR2T0sbj7oNUtgns/12mcCA7XgXsBe/b
 MiYBE9K2dGFQKton2Pho5JLSNOWAITXU9UtKS3fxwWoolyB9hkaup1U43DWvQh4Pr326CeMS2Jm
 f6tnvXL9bfGDTI9gGBLTfJEV+KnQSRTmb5CuTjDb4fmapmdGif1CcSVh0SY32VmNWHyDN/C5l6/
 iW3TPJJ6Iqtndrne3Zg==
X-Proofpoint-ORIG-GUID: PD7aWtqAqFpE7Y-7aOFE00UkCCry4AWK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090229
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Jamin,

On 7/7/26 08:09, Jamin Lin wrote:
> The original AST2700 FC support series [1] is fairly large, making it
> difficult to review all changes together.
> 
> To help speed up the review process, this series extracts the SCU/FMC-related
> refactoring into a standalone prerequisite series.


> Jamin Lin (8):
>    hw/misc/aspeed_scu: Introduce Aspeed2700SCUState
>    hw/arm/aspeed: Use Aspeed2700SCUState for AST2700 users
>    hw/arm/aspeed_ast27x0: Move SCU link into AST27x0 coprocessors
>    hw/misc/aspeed_scu: Add separate reset handler for AST2700 SCUIO
>    hw/arm/aspeed_ast27x0: Pass realized PSP SoC to SSP/TSP initialization
>    hw/arm/ast27x0: Share single SCUIO instance across PSP, SSP, and TSP
>    hw/arm/ast27x0: Share FMC controller with SSP and TSP
>    hw/ssi/aspeed_smc: Add Data FIFO-based flash access support for
>      AST2700

Looking at this machine in more detail, I think it would be
better modelled as:

struct Ast2700FcMachineState {
     MachineState parent_obj;

     MemoryRegion dram;
     Aspeed2700SCUState scu;

     Aspeed27x0SoCState psp;
     MemoryRegion psp_memory;
     MemoryRegion psp_bootrom;

     Aspeed27x0CoprocessorState ssp;
     Clock *ssp_sysclk;
     MemoryRegion ssp_memory;

     Aspeed27x0CoprocessorState tsp;
     Clock *tsp_sysclk;
     MemoryRegion tsp_memory;
};

- dram and scu are shared within psp/ssp/tsp
   (ca35_dram renamed as generic dram)
   (ca35_memory renamed as psp_memory)
   (ca35_boot_rom renamed as psp_bootrom)

and:

struct Aspeed27x0SoCState {
     AspeedSoCState parent;

     ARMCPU cpu[ASPEED_CPUS_NUM];
     AspeedINTCState intc[ASPEED_INTC_NUM];
     AspeedINTCState intcioexp[ASPEED_IOEXP_NUM];
     GICv3State gic;
     MemoryRegion dram_empty;
     Aspeed2700SCUState *scu;
};

- scu becomes a link property

struct Ast2700FcMachineState {
     MachineState parent_obj;

     MemoryRegion dram;
     Aspeed2700SCUState scu;

     Aspeed27x0SoCState psp;
     MemoryRegion psp_memory;
     MemoryRegion psp_bootrom;

     Aspeed27x0CoprocessorState ssp;
     Clock *ssp_sysclk;
     MemoryRegion ssp_memory;

     Aspeed27x0CoprocessorState tsp;
     Clock *tsp_sysclk;
     MemoryRegion tsp_memory;
};

My personal style preference being:

struct Ast2700FcMachineState {
     MachineState parent_obj;

     MemoryRegion dram;
     Aspeed2700SCUState scu;

     struct {
         Aspeed27x0SoCState mpcore;
         MemoryRegion memory;
         MemoryRegion bootrom;
     } psp;

     struct {
         Aspeed27x0CoprocessorState mcu;
         Clock *sysclk;
         MemoryRegion memory;
     } ssp;

     struct {
         Aspeed27x0CoprocessorState mcu;
         Clock *sysclk;
         MemoryRegion memory;
     } tsp;
};



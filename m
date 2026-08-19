Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89805C5DF85
	for <qemu-arm@archiver.kernel.org>; Wed, 19 Aug 2026 09:43:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wwcpT-0000c9-Ht; Wed, 19 Aug 2026 05:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wwcpI-0000aq-3h
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 05:43:16 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wwcpG-000553-KS
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 05:43:15 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67J6Z1c7026589
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2026 09:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FQDNJ1iZSYfyGBePDDxcO5lT9n0r4vGsLgn9a4MOfgM=; b=Ns69LGltZvqPSKWS
 ANCT6oaA8JSYiFH1oEoY/siwKgYe7I1MiEKC1iZQx5KPPpQwU0SGGLYD2cnmwCa1
 PT4t1myZFzZuSmUtMt+328Jbw/5U53hhbFFF6WTac1dC+5R1vfQLpEsxDWqACmDp
 ez1I7z69s6fv8xuxHXRtcyadFLr5z3vo+pO727RBXvo2rcAlmDXmqeFuLZJ6Ow17
 oqUpVj+tDoYexIGj2USqO/FEGiF6suoykRRZ0tXCrfWLHDSUBCkBVwS8UJolOhWS
 cHc5PayXnYWUZBf5WDpGdVpF7INI2pNW+v6vHwmpWxQWA6YENHjYDmXCGvJWZrOg
 T5aSWw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfpteck-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2026 09:43:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c083f1818so9202321cf.0
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2026 02:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787132590; x=1787737390; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=FQDNJ1iZSYfyGBePDDxcO5lT9n0r4vGsLgn9a4MOfgM=;
 b=IgavoL6Ggd0AfKsT/tT70Fh4MiNN6mvDH4RggydsENqB6EQZu3lNT3POQB32RE22ZG
 JspH0ufQobxxCpJlLOm16+ZFxpddxZpsGqRy+kd04iKNKk4uD10yTZktgiGgYD4pfr8T
 nq/REJlOuTEKDTdB6oUyWspoZ7ulPolFHB/WoIoIbByatrsagvjTpEITiRBKdBYa3The
 uh7ZFdC5AmqsE+3CsF1/eNL0YW1P5VOKmANlMGGN/PgCJYNIUa9r0W0pqyj4YTvL1IuT
 S0/sLdo4q9/Dpu2mtg2C11XLOf0A82FHIJZxZqCWIk5Xej1T+MPzwO6OZHKCgIgQP1el
 duog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787132590; x=1787737390;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FQDNJ1iZSYfyGBePDDxcO5lT9n0r4vGsLgn9a4MOfgM=;
 b=cFj/9fzYnHeU1gqjn/PxDoNUDIK6fNPV9R3Gy5jCAKZWU8SGbbgQ8UYUuY5m0lZuL1
 3BW9GFcv+qqcI91pNo3CkfjKkA7FLGPvwFV6lzgIV02lVVwQXisOPutxEGagR8ejUXl+
 mxyxEFO9l2HgJIwBoNCJux6fI05BZl4SpgbdG/HGyxZuVfmhDVFP+wHapDlZfvHz9Z8C
 74ylDwbTX1LosytkPSI1fcRR85HvwACoDs1CLLALaHwxYbkZvirZZzq9Tb8xRYmOzd7u
 OMtQr+zAlGSL3p+Do9q2UVAG2+eN1vXjwt60YwOsvUVlxJlZeXxgMKDbIRN+lqo8dOQZ
 VhzA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpwY0sFFThHEkNxuCyP0LyK56WHE6ViT4todprndY8lKjFQsxJOZlKCJjUqO5OhFOv/mxRpAgAUcw==@nongnu.org
X-Gm-Message-State: AOJu0YwJtTzBIUpfWZ3spB1zW0bukYSuHm/AEtcdZHyJe74GUt/rR063
 /YFXaIxh/zgOTGK1mzD3ISTH2HCOP/PqgWz3Ptv87M3cwebAx9nanqNjTC+5c6wJvX+bdNESaTi
 VbdA1I8uHDKOEvDqitY87Yh7B7h+xtcVy2M1mBy0/+XaL4QyAX14D7ew=
X-Gm-Gg: AR+sD10r43oRmJf/9CYD8+d+q+gwZGtG+mtuglrhANPqS5y0FXO1cbEXz86XeMdG895
 ncxz5+Iu9aJ3kBSAUwQIoRW+YZnl/8JY/E8ob3Efmhs15ybWh9LdYfeUOAcQ8upLure0jNDBSNg
 BAuOqSz2bHCcNN8YVVI0XWfKTqeXYaj3O2mRo9bSQlbbf8e/J1Ng/OmRxtZX7pse+vR8VTD2ctR
 FPVBSaVO7sCdkZ2hA+DAyiAUJcOI1riaJ2LD4hE1XpxVgpohcnvLLWBm/P/+bQ+xpgWwYAdoWyh
 7IfHxLSSN24Er1idLrSEVBFEP99E7E7oKWLfBdrhO7mnIKqzXgmMVMsk2sjVNrG9aLRMbcYUEBx
 KnuHkibBG/jKqzUw/7hokZLI=
X-Received: by 2002:a05:622a:1e19:b0:51c:1cf8:ca4d with SMTP id
 d75a77b69052e-52dd59f09b8mr29332861cf.13.1787132590391; 
 Wed, 19 Aug 2026 02:43:10 -0700 (PDT)
X-Received: by 2002:a05:622a:1e19:b0:51c:1cf8:ca4d with SMTP id
 d75a77b69052e-52dd59f09b8mr29332451cf.13.1787132590037; 
 Wed, 19 Aug 2026 02:43:10 -0700 (PDT)
Received: from [10.111.143.150] ([212.136.9.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499a9e784a4sm49071205e9.1.2026.08.19.02.43.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 02:43:09 -0700 (PDT)
Message-ID: <0d8ef450-d577-4bca-ac13-3994f4742852@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 11:43:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/misc/aspeed_scu: Set both AST2600 protection key
 registers on reset
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Kane Chen <kane_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org
References: <20260818-dev-ast2600-hw-prot-key-reset-v1-1-5dc3de64c247@codeconstruct.com.au>
 <53ae0209-0fd9-4f62-ac4b-f70b4f92c235@oss.qualcomm.com>
 <0be07514-48df-4168-8acf-8b082b3bebf5@kaod.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <0be07514-48df-4168-8acf-8b082b3bebf5@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JRE8U-0g2e3unnwcOxZbeBFJQFNROczU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA3MyBTYWx0ZWRfX3vEY/4QQtgpY
 cPP3yiayAoaDYH4iskCkEhFc29Zv+TnqGRdSngqwJvyoFSyCTExiYeyQJmlPD9BENSytYnQLYli
 HtD5zY9nbNLhWDowDheVttQQxyBG1oDA4Zl421P9Q534UdANUUJeZU6pKka7ZosJy/1H6HqSEgm
 D7jKLHxK0nb+60vAt2tWqsd8JCNchUqGVwHNAejKPXtbwhSYKMf8n5lL1PahYqEkRGJWjjL5L8w
 olKHA89rpw4nK18E3eR6iFdSipKEbd6pvDWBkECwxCEE8nokZnHHTNoLnsTQ+zsxbaXIhEEQdiZ
 Mf7Ti/gJlnwuppAmgHA8oEah6zfcJtwDyYg1aq57+C/VtyERm7TGwdiT7iXeC8tAqbhPg83oNqj
 c7bq4D8Ul413WN8mnJFWfWJeHpDerJ0hwp+Fz/moJdvMf1RSUqYrF0ksGz30t7lqx6tibsVZw3g
 YDBhrWfKu5wv+HZU8MA==
X-Authority-Analysis: v=2.4 cv=aMrAb79m c=1 sm=1 tr=0 ts=6a857aaf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7KBfExy5AAAA:8 a=69wJf7TsAAAA:8 a=EUspDBNiAAAA:8 a=5cUKKAtOiB15pufxU6QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=eL7OMsOqQ-6kYQPn45L1:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-ORIG-GUID: JRE8U-0g2e3unnwcOxZbeBFJQFNROczU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA3MyBTYWx0ZWRfXyB5JhLVXwqE9
 KH0KXMVEvj1uTtzaROx297GgcUnp8Q5t7Ok0W5FcVbfjBZFzPi0ZcOCJVS3z45eq7c3CJHjSf90
 s9A4AR6XgxuhACMp9Oc6RUVHcEBBZfc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190073
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2026-08-19 9:17, Cédric Le Goater wrote:
> On 8/19/26 02:06, Philippe Mathieu-Daudé wrote:
>> On 18/8/26 03:43, Andrew Jeffery wrote:
>>> Currently, booting Linux on the ast2600-evb machine via -kernel results
>>> in a lot of warnings about failing to apply pinmux configuration when
>>> binding drivers:
[...]

>>> Fixes: e09cf36321f6 ("hw: aspeed_scu: Add AST2600 support")
>>> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
>>> ---
>>> I ran into this issue while improving test coverage in my patch review
>>> process.
>>> ---
>>>   hw/misc/aspeed_scu.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> Cc: qemu-stable@nongnu.org
>> Fixes: e09cf36321f ("hw: aspeed_scu: Add AST2600 support")
> 
> something is wrong with the above hash ?

Nop I just missed it.

> 
> Thanks,
> 
> C.
> 
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> 



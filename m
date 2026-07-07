Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CE6C43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 09:28:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh269-0004tg-1U; Tue, 07 Jul 2026 05:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh268-0004tE-2K
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:28:12 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh266-0006Fg-Jx
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:28:11 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6678DZjq3243036
 for <qemu-arm@nongnu.org>; Tue, 7 Jul 2026 09:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kIjgJXGmQ4n6AbWq2OH31U2Cynm3Ogdoi0tvSJxpsHw=; b=f8TlnYNtq2noHlz+
 owN2aLCyfJR/lrbqS8jf4AuYtucaNFbUQVWaHS7hwM29CbFNpBJv4AM0R179zJiy
 7CKOnsZgLT1nlNrWSbnuEiaRFB1nfcvXAJMt9A51Ru5A3bM2yvtt7CFtRME0rjej
 ytd2OCvzT5huvCzHt+bA+G4nSmOQPnIBVbJA5+nUXfqRCJqMdYJx9vCTF1Ay1XDs
 WtTzd+7pCKUhO2wH2TN0fB6M5lKriGyya9dLJYd3zJZdu3faucGSZziCTs+CFcEo
 c+8HHbqCc8zpVlOdBtz6PPC1HEPA+Bu/SGO8yTpV2FTij1A1ZCCn4kudEMpzaQ9f
 vAPiHA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11rg39-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 09:28:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8ea75996387so81873106d6.1
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 02:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783416488; x=1784021288; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kIjgJXGmQ4n6AbWq2OH31U2Cynm3Ogdoi0tvSJxpsHw=;
 b=YT49ZqQ8nQ3pnZk49tK3QNkvinv3ZB8+E/bNSTtXwW4pX4gIvCCqTdpFUF2Z+cWRgl
 xExF7JESjWpT7Hv6DJN5uO5anA65W03jiBr7YzN32Mo8mFWPELHnceLKrybRJtkhVjgn
 jijCnPfRcgpdFRiprftEpnR3iTlZh0jADHR1WVnEqiS4gCXgjB2YoyjTM1uDqZeTYmgy
 6qqty2rK4lJrhlUgkW1qmSAcLcO7VFdgSXM754rUAWyP48vtkQrKiD2GOVQdDUbdClXL
 il1H9JWF8aP+ZEDtywjapv0+0swRSKnuBwuRemQU4yw/7K9HLHobTRIqRJy9v4NpS70k
 ppLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783416488; x=1784021288;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kIjgJXGmQ4n6AbWq2OH31U2Cynm3Ogdoi0tvSJxpsHw=;
 b=JbaRXNYw9x29AParl6ay+u7gn4+W1Fqk5RQkUAc2p+Q3qfXIVFAVyH3uEx8TW8YWyH
 p4ISmGWdu4mKmCa5jCYUreRhgcdDvK5A0s1cvp5ZWtVQa/Qevco0p/YSw0cIMifFT0uB
 yL131B55p6nvfwTPTJlkfrmJ/e3x5mkMwolkS/BDAS3N2aKegPeZ7Vslhpn9yEM75gfe
 ME5pysJRwNSe1eIg2gfXgrz/eduVBHYOJywTCzCFkCRgqNbvmrDLgeWEvhV9oXMxb2bn
 ZAfTbmTS6UPxk1nsY8k7Vt4mRjmUrF5+CxRsKtyFPhVMk1Bfmn/qnYBZyxz1BYGBC+U9
 gSMg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq6BzyrdPb/+8Y6AXqi7iLwQZ5bgZWnrSHb0U3pA6Nnc8BseH9meoA08YM0gis35dl0T0CH+p8iSA==@nongnu.org
X-Gm-Message-State: AOJu0YxZvFhzdVklS21tXCQ6Ck0zIvGCRduPqu4vRhXF67jKBD6cyQ2u
 Pykz4f1D1orHP1ZID5/gtE+ytcG0jdO+FK/AQSIClsyYj/5xCQq2ZaAVjQ6DYrWbk4TrlMU7omx
 Q9ZqArsIA5oFxnkL+Txb+ghNi9bEg2tjpW8ZIMaZ4w9aArhdG+eqkGto=
X-Gm-Gg: AfdE7clBgF+PXYAxVT7QfzJ/5Dy3lSHzR3yGqptLkM49J4g6Is88+++OoszByHgsnip
 jx87QTomKHan0SIDqtkICmq9UFszXxQ4BXlNRs1KX5rGvq0tNqexUH0iW4hrCTKhJRdvt/v8S0R
 N09G6wf9V3WFnE/g2sCsHduXql2/KRNUz7vgI05nt07Iny6aFrOlAsqz9XJ1QjJcoVyOYfOb26C
 3E/OP9YEL0hU28/mEZrlbZwQxJR+lxJjB/qKqliLGpR0LlpN7RC6jpY2yD8VNRmzKdoRlp1jz7i
 iwrHy3dI8UNPt/opm0spOpUqbGbaOD490A8U1MFoVkToPxr/U/2QOpWwzURc5WdS8bor1aWb1Qw
 oydf+YVYWlZTUyDWGGeP3FsucRTFVD6BCrgvTBxrrVj/AkV9y8CtGOe8T6zz/zQ==
X-Received: by 2002:ac8:59c8:0:b0:51b:ee11:e71e with SMTP id
 d75a77b69052e-51c747ae893mr44334591cf.1.1783416488373; 
 Tue, 07 Jul 2026 02:28:08 -0700 (PDT)
X-Received: by 2002:ac8:59c8:0:b0:51b:ee11:e71e with SMTP id
 d75a77b69052e-51c747ae893mr44334361cf.1.1783416488016; 
 Tue, 07 Jul 2026 02:28:08 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c15ada023cesm90929866b.44.2026.07.07.02.28.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 02:28:07 -0700 (PDT)
Message-ID: <f4570b7e-7f33-4e79-b4e3-1de40c41ce91@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] hw/arm/aspeed: Use Aspeed2700SCUState for AST2700
 users
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
 <20260707060919.350637-3-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707060919.350637-3-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4cc6a9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=V2NxCb60AAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=3L6qF29SlnrayQqPM2jZ:22
X-Proofpoint-GUID: XXv9tY8-lR4hfQ8UTgVpSHo1812GGHCP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5MSBTYWx0ZWRfX/lDgKqxo0ABm
 SE8ghNXSY0LuQ8Sepz7gs5HPC6PDVXd5cbaMCnvUhVdJuAttdarLzou+nm0VJADz9rgunj8G3tm
 Ougsk0JYOmDMqRgaAG60OXArDy4/QIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5MSBTYWx0ZWRfX7RuqNFbW8DOe
 Q8YIOFoF6VhdvH8MXXvEsZZoddu9LMp8HndU9yDcBCyeZEvVrfuWtyCcz7xPATk1j/ZMYLye4js
 XwO9NI0CPtbB6oAdInqFlkWXj5OUV7vRiQ+/Za5t/AprOxnK3gLliTdKxbcMsn0SkW1usnWtP+J
 45/z4f0LWoKX/Pi+SvtCcO9ViWJqbKPw6lcqwjfOuS2IGVXUzfbisV+RilVsxrBKdjX9Mtxtvzr
 Kd060Y79+sBWJLNo9oFfdTgqOSij4yaz6F+7sworfsztLJblm47BF8S6pBdHBMoPcGrsgwoaiZK
 3IDX1k0BhkCgQszBH/fe+lpcPXPab/XUPIZboLO9Ebq1s1pqMRKU0Yx0K2ixpZ7w2tIJsma3hlp
 SgWDy+0Zgp0KyhWccqFi2aFmMWexpOL4ljcpF4Zo4BdYjAXva8O5Kp/sy5d+HrrqPAjiKs9sgCq
 dHWyyWTG/2sGCUE9HtQ==
X-Proofpoint-ORIG-GUID: XXv9tY8-lR4hfQ8UTgVpSHo1812GGHCP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070091
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 7/7/26 08:09, Jamin Lin wrote:
> Now that Aspeed2700SCUState has been introduced, update the AST1700 and
> AST27x0 SoCs to instantiate the AST2700-specific SCU subclass instead of
> the generic AspeedSCUState.
> 
> Also update the AST27x0 FC board to link the SSP/TSP coprocessors to the
> AST2700 SCU instance.
> 
> This prepares the AST2700 platform for subsequent patches that move
> AST2700-specific SCU functionality into the subclass.
> 
> No functional change.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   include/hw/arm/aspeed_ast1700.h |  2 +-
>   include/hw/arm/aspeed_soc.h     |  1 +
>   hw/arm/aspeed_ast27x0-fc.c      |  4 ++--
>   hw/arm/aspeed_ast27x0.c         | 16 ++++++++--------
>   4 files changed, 12 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


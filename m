Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CB1CA6015
	for <qemu-arm@archiver.kernel.org>; Fri,  9 Oct 2026 14:23:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xFBUq-0007eK-JJ; Fri, 09 Oct 2026 10:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xFBTL-00076o-7b
 for qemu-arm@nongnu.org; Fri, 09 Oct 2026 10:21:23 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xFBTJ-0000n9-Ai
 for qemu-arm@nongnu.org; Fri, 09 Oct 2026 10:21:18 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 699DkqK11956644
 for <qemu-arm@nongnu.org>; Fri, 9 Oct 2026 14:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BWoOdcdiLrwDJA1vwtUv/DcmR3CaK9jYxke70afOksM=; b=gCNDkHrrP+Xlgfca
 gtpL4SMLroiUeFiY2Jy91tFuZqclN+orAflcO5ufK6kLBHupPJ8AU3H8QfIn4CUS
 8BkWCQ2fAK0oO1CN+l23huUSGW2c3JbWVV3xyf9O5UoazhMVyLcoeJeZXrso0DZt
 LcZTEejsDNmXMlKBbmGWk525G6FfEX/1W+afka49xuEXvS2Jx8u14Xl2og+rKqPd
 Ffl5OHfm5GOMlf/gB/AxfV9fmVsqKDL3Co9FGfR5trN57LvCst+O9Zk0G3wdLzte
 EnvnCb/v1USqySJ9ZWL3Qd9rrmSPQ+YiMq/uPoi2OW9F16Dc0S3niuACfJXCHHH4
 wio6/Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h71f284vb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 09 Oct 2026 14:21:14 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-97e8be2221eso652986241.2
 for <qemu-arm@nongnu.org>; Fri, 09 Oct 2026 07:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791555674; x=1792160474; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=BWoOdcdiLrwDJA1vwtUv/DcmR3CaK9jYxke70afOksM=;
 b=AJQJU01Jy6J3ZVefLxsIzLFuU9nrMSwRemXfsK4rYhP+odRFjsXKO8rhn+2ylGT8cj
 4IG4XC4tQy1gvPfv8pstUcZIqdp4Tf4bU9wujzPTgxIdtRp0PqozbJFLuNsHLKP8XqiL
 RxjFNc99tYOh7VgOBUYalGpJPjOh53EtWCGLPSlO0VIXIqb1Cslcg+m075UurLZXf/XI
 OpV2CnjoXsv3YhH0QmWLpnfHUy6+m1Qt9yPWc6w9MoHKqh4s4VMWGxDOxWw7cCwvgW5U
 VbsAOBcA/lRaHeiR/fW6gFM0cru+0HhnTD/Oj2s82E/IhzDrKJYUX9z6L7nEQ5dMIR7Q
 sPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791555674; x=1792160474;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=BWoOdcdiLrwDJA1vwtUv/DcmR3CaK9jYxke70afOksM=;
 b=CVPSnYEUqW5zbhrvZX1JA8qbJ705dUSGtAM9zxpLUyjojChv12h+zAZOF3tgYyTWNY
 k03rqY5eH9XtZJx8kpqyQNYqx9bK/YJs+YIpSVLvri3ifqUTfx28xNL8qVQ6aGC/rbAu
 1xCHAEFEaNXtKlSu+FmroKd1zrVK2k1B3udRyRFn9JE7L9jD0/PdR9J3NBxRuXFXPSDS
 7HbC55bZZYSHvRiwvYNlmDgM1MoWKoQslzSW2S+vVtxj1W9H/5AMfdvvyI60Eaq9TpcH
 tUuU/9iqfkplf7uKOc3Z9vvk5FXQbtjHsvtB93xbs008BTYSCUIxMfPJDnvIRJnbOG1B
 iMOQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzaJR99SVH2AS/hiXhFtScmt+rxqBBDq2Zd2xdPda0H5NTA6fo17alC3YYOfguziDg1cHCu98pTrg==@nongnu.org
X-Gm-Message-State: AFq9FYLeEFegfUnlx5/tbeEEJCU8rNOF9Dpc5/8q7uAOsgkSx5I+XGby
 V4SLxODKIKwWowZh/EfZHBSxINBEjGJMlsHzAF/NqhWQRHbgkOeAmsxce/ENo08xaDXjC3wnyOJ
 OO1YnIP8iP6puG0XiJP35VNrA61I2oM/vzqxAH26X5b/Xv2TKWVzhFKw=
X-Gm-Gg: AYBFou1THrr/YRZ38HL6suIEmkNwJeVmajL26v4ySUc8qGHgw5lx8PFlX6RJxynbeNt
 QyF4AWlLjJ7N9KGQaVHP6Tfk7XyXa2WCldyipKl8xPnquNilMIOVpI9Li+aewvPWL/VZRStsSM6
 6bzL3mnJJ8kdJcXv47mwvBUfzZlmjSParUnIgXnqUro77KHw/1L1z8uBbuhiU7Jggarwopi/9Ks
 L6rT6m9J7HzCb6MRg1ENR9ETNjWn+ty75yMtN4z86y3Q9gKpFTRlDn2h2J6HLVji1P2baUd/CCD
 OxSanAWV3ypBZhcewDpfXSLEfTvk4+Zq6n625IAEdWsvQlukUV0JNxopqC1wPcGzcq9J6BX7P4G
 TvI/naQLJ/j63QIxecA7fhGLHZHeZwDgEIw==
X-Received: by 2002:a05:6102:4499:b0:7a7:12c0:f061 with SMTP id
 ada2fe7eead31-7cb372821b1mr629681137.12.1791555673783; 
 Fri, 09 Oct 2026 07:21:13 -0700 (PDT)
X-Received: by 2002:a05:6102:4499:b0:7a7:12c0:f061 with SMTP id
 ada2fe7eead31-7cb372821b1mr629631137.12.1791555672967; 
 Fri, 09 Oct 2026 07:21:12 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9acee65sm4088491f8f.49.2026.10.09.07.21.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2026 07:21:06 -0700 (PDT)
Message-ID: <edd4c810-1bef-499e-9773-64858dc2db86@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:21:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/virt: Use TAG_GRANULE when creating tag memory
Content-Language: en-US
To: Gustavo Romero <gromero@redhat.com>, richard.henderson@linaro.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20261009121545.241772-1-gromero@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261009121545.241772-1-gromero@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: N1aRazwFvtXzXsg-E4Rj6b8i9BWzb7tG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1NyBTYWx0ZWRfX4O/RwyhmHnXo
 fd8IgdyY2HPvXF+H+UL00uwbTihxGf9iYo6oPNIivloJSUUWYHv8lWp3O720eG2heob0XUlBdOz
 xILchqvEA/7Zt6uvmyrrQEIF5N4iwacUsPHHkhYsu6mLVlmFcqwGeSE87rqtRU6eV6kk01cI1tk
 pGs0Ybohn5p1DgBE8G3IhOBEIojWqCDSG8QC8U+yXDeb6xdd5XWcUS1pLjat4J1gpc2/aSEUSpg
 dD0ExjYEfAD1rzJRzpn6azCpAH84A6+0OnZnzsQHhrRrS3xl4eM3prgVPV+zFpXH/xpdC6L8Ryd
 KDxr7tIfdxrEbpQgz5lAQRpvcA2j/EM9ZLQr4x4nPAhUNnYrY7TKmyvB/lsKOe57YgxbKLaa46R
 PusihdWwbSH7cdejDMYSh/+7xD7oPoGxrcI/jZZjDt218XgqnqAmSZo+jeWYOyhDnt31ysj6KZa
 2S6dE9Cp0ZYDCu06TWg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1NyBTYWx0ZWRfXzlHcWgaMCILE
 nrClsieYKTXQN6NKGIdAs4OQH2HN+RVI9Uc67adI2yqTyQar56u5yAY0y5AiElyMgDEU0GpiiIQ
 /U9V6P4tdh4es2MVt9dvw/xLDKyeuaU=
X-Authority-Analysis: v=2.4 cv=B8ksQ+tM c=1 sm=1 tr=0 ts=6ac8f85a cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=Ech0NoflyTbpmrpwpVkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: N1aRazwFvtXzXsg-E4Rj6b8i9BWzb7tG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090057
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 9/10/26 14:15, Gustavo Romero wrote:
> Use TAG_GRANULE definition when creating the memory region where the
> FEAT_MTE tags are stored.
> 
> Signed-off-by: Gustavo Romero <gromero@redhat.com>
> ---
>   hw/arm/virt.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


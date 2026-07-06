Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31465C43602
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Jul 2026 07:00:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgdJD-0007l1-T3; Mon, 06 Jul 2026 03:00:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgdJ9-0007jG-KB
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 02:59:59 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgdJ6-0002Bn-I3
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 02:59:58 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66641SkV3459096
 for <qemu-arm@nongnu.org>; Mon, 6 Jul 2026 06:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mu47gYgYQiRI45K6wXQlr0qL01aom3LjsiBm5tFl8bs=; b=I5DaQbAGWhiSLOrU
 HyXWrBPloZAhg3wpqFQy2hysqpjIzEWHzseOXy+qaExxdmJQF2MfpZnd6dshsWfV
 qqrlzqXtnOn39SHaFdDwDLlPG0PTWsRjaNtjFPcjcw9on0oM7nORvYtgtF3SImtJ
 lECEthPv1W6GZp4pqqDsBJJT9D+epIar/vA2IdPcxJpxhVs0z53sJXKBk7Dv53SG
 5p0GP1+PGEx36RwR2G2omg0H29or0IlFktFo+2dSO8HH4HeLanjbrEbSjraH8aZe
 6/KWV4Dh0ekz4w1eEeXwWD+7jKkq3OV2F2tg+e/Gpu0RpvhprAZQw8RJRsfJSdAi
 rmo8ow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6uf84sac-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 06:59:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92e61b38eddso493668285a.2
 for <qemu-arm@nongnu.org>; Sun, 05 Jul 2026 23:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783321194; x=1783925994; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mu47gYgYQiRI45K6wXQlr0qL01aom3LjsiBm5tFl8bs=;
 b=W4hZCR5pRZjYPKpzSnLBp82bGMSXZfnbo8s2fmttK3Ax7Rp8yQSdUIMrkAweViwlum
 uoVpuul/1ty05VIg2abpEl1FTnrmjGRSyOM4uRyn/g4+g35Hoa8Of6JBf54GV1xMFoBa
 VeFofLA6kvaoOgJtGkjoWo1Lcwi2sJGQdUa51F06zH5Q0V1vOqL9rGoc5FIKzGvJ1R6d
 xVBJ2Nerhs2/ka9VrK4/4hkSIkPJNzToD6EXRHB7lKXP685Y6AqKkdtNAiliOI3w2oLw
 thtrmFWSXZLduXQ9Ta3h3HfTV6SmXWJ4v7RiyF1QmL81vLGQH+EG/nInTT4IAnrhW/To
 z5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783321194; x=1783925994;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mu47gYgYQiRI45K6wXQlr0qL01aom3LjsiBm5tFl8bs=;
 b=HDqNn42z+KVKKRcCshzQJV2QZIeXskhtx5ff8EJtIpJvCa3X1Htq0ax7tdaeZiAe7v
 YR8fv6OreF/Sd/jerX543g5mG88m5ORC0JXcTaK/HQbfiBg97YLgD6rMd19O4ENR7cxS
 aAVQFyWPGUbffsBXOZlpBpk2rtOBeZYHyluEZVrH1l0lj0d2q21WkhcSq6ZcURKMWsnD
 ZmRnZFlVNhAvWTUYVSr9UAr+PDnCv3lJvplhDhggg5bQfAtSmPpR0zAkZWDNgxsLQ8xa
 ofelpKDY5wGt/iVaUAypw3eh2ymCfnPZL4c3ldPehnjXHUcVi99Wj9Fal/OzhMk9jwDY
 xvVQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rra3FmfMQL20DkvY8ELKja/ZbwLVcOjtzJ5kyCAsP4mOYE/2UtrYzRqsDEtOCbdnH9pR9C3ET5hPQ==@nongnu.org
X-Gm-Message-State: AOJu0YxP6vxBc5zEW6has09LjEf6ucm/6fAPWqzmV8OnaESXmxdCpXfk
 Y0Lda7XG8hAY41wNiUZNgtg4gI2hT/iOjUSnvy2ic667cxH9CzuBnuOkFrEhqWfH1IYqz89ccIl
 KD0aPNvNkE668WhM2kcKpQClr73ChU6iZt2ezmu4NAmjGdlDdt4q6t34=
X-Gm-Gg: AfdE7ckJiS8WBCIzA/jhBAxM+wiUgWtSsjtsN+wNKXMmedSODdk9ReCgnSkPP3f4b5t
 LKffsvyv6Ysl0u4XeQ8XoT2K57xItyev2HDHJHI5nwW/r8tdSFTPxNuiglQ5YEmfAiatunEc25N
 wNQKNIah691ZrrQPE4oEjEmrx/7isTzaIVBBGx3QCXIIcQAPvDlcG8BVs6F02dVvyvjHKbZ934F
 AVwd7BwZhJJEs7mDx+R+PTPFYn/pZF7SuUc70nQj/n6FVkRJMuI5a7IRYyDtehf6q+U6PDHje/d
 b2IWZSrEXZIrDC2WKLfaQG7tA8M6xxOoM+nTgobiiBwd8Zyj6wB2AviERkTj8cj+wSju98BwkXQ
 rJqdEyirPKOXeQSO5VpoDIv5KgIPNOTY5S4176lpNQHFPhIHNGI51hC/dEW2m0Q==
X-Received: by 2002:a05:620a:4407:b0:923:8612:f15 with SMTP id
 af79cd13be357-92e9a3a4f82mr1152132085a.18.1783321193928; 
 Sun, 05 Jul 2026 23:59:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4407:b0:923:8612:f15 with SMTP id
 af79cd13be357-92e9a3a4f82mr1152130085a.18.1783321193512; 
 Sun, 05 Jul 2026 23:59:53 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce0a7cfsm258601735e9.9.2026.07.05.23.59.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Jul 2026 23:59:52 -0700 (PDT)
Message-ID: <5ab4ace8-4f2f-4674-8048-5db37cf551d3@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 08:59:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] hw/adc/npcm7xx_adc.c: convert NPCM7XX_ADC object
 props to class props
Content-Language: en-US
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>, kfting@nuvoton.com,
 wuhaotsh@google.com, alistair@alistair23.me, peter.maydell@linaro.org,
 berrange@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20260703143408.3235231-1-mark.caveayland@nutanix.com>
 <20260703143408.3235231-2-mark.caveayland@nutanix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260703143408.3235231-2-mark.caveayland@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KFX9gf3vrdxOhiLr4nxZdNCyb2h2I2u8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2OCBTYWx0ZWRfX0ewWGWRbHiyY
 FFlcRN8f1H6Ha69wSKw+vZPtRi6g5kBh13tqi3n3xnNlzhh7YETBhazUgtSLxkdw/M7+iZa07gp
 qklvKAbUZVupesKD3rbzRWZSvJ+18zw=
X-Authority-Analysis: v=2.4 cv=Z4Tc2nRA c=1 sm=1 tr=0 ts=6a4b526a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=64Cc0HZtAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=AqYkckc_seYA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: KFX9gf3vrdxOhiLr4nxZdNCyb2h2I2u8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2OCBTYWx0ZWRfX+rOCSh7sz7jX
 xZbnJaRvfMllP3DfUe5vEpbKVTsoQOZXwbuU6/pCPdKcxPz7eYPfx2eTvw2YkveSnCDwxVp7vD3
 LzdW/hSeYuYkHMjaIN3iEhZpgHffve89wYOGfZmrlJw3vqRnz2zYeY1vagG2k0deDWREI2GvyIH
 39T5XLL5bemiduQH2HR3uvDQFaT7MaxLQNjH0WfsdFWwWk3FvmCN69lqWZuOs9N+InzN6fAnCAv
 Lpd9VCUOEsO6MsDByBtdwRAe8hVFjKW1OSmefe7nH+vLtu4+N4nl+ak/HgALyAGftmshrlTh0+A
 SvpCP8Cr5GJ5YtjXv1sQJ155Ni3xJ9aiDgGhuKcoCUrr+XN8DHu7jfOIDzqvZa1kH4bHWiwNhnP
 4SsY8hOCuZpib6upYearKTRTu48y5A9ladmkc/uYkS4Xuq27wDkbsFL+JgHAh32J8+gp+cJcoTW
 cPDdxw39nWErHaMw1Ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060068
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

On 3/7/26 16:32, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>   hw/adc/npcm7xx_adc.c | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


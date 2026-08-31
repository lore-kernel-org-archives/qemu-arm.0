Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B97C61DD3
	for <qemu-arm@archiver.kernel.org>; Mon, 31 Aug 2026 04:44:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x0tt1-0007wT-5V; Mon, 31 Aug 2026 00:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0tt0-0007wC-34
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 00:44:46 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0tsy-00057k-GE
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 00:44:45 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67V1bQUK2819893
 for <qemu-arm@nongnu.org>; Mon, 31 Aug 2026 04:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 du1670PtZB0d9+bShrqSzB5zKrmBikvFtLAHDDzeI/Q=; b=jGRNYPQujBEibXoS
 lBPQ6aPFwXzUoemgCiyT/+J9kj7KiuR9oCgqa51AqhBZ5iu/4/2cbwhp79nX4rda
 RsRxglh2Ha+M5k8HrkDMVh07Fx8bnHzMM739OMNST/5YO6OeCV7MF3fRQK909XXz
 odwyecmm4ssJftJSBsA2iKtgzNMutTG1LTkGYx+7ejTQeQpBoTl4DN+Kfzkvgu+Y
 4tn208olO9k4FhfCduKuWIigMKu38BfAXJ+ezNemZLwnqx1Ndifs0e25PMznnLnM
 ahjxFgUltwRSMoOOcZN8JkODA/hjxuko35XAKPeEd4gdfoVRX6kM/TUvhRqcZGiC
 9KrDwA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdfmju4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 31 Aug 2026 04:44:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-9393ac4961fso51830085a.2
 for <qemu-arm@nongnu.org>; Sun, 30 Aug 2026 21:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788151482; x=1788756282; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=du1670PtZB0d9+bShrqSzB5zKrmBikvFtLAHDDzeI/Q=;
 b=gEsKJgJOySVUi+vSwbLb44vXqfS+hKHo+sFokgVNQSSYFafmqrb/FrcB4zNKsB2w7z
 YBYrVYfMwQIEXrWgeIJSF2WorM3yW6hDmDXBaPMS8lU78NYVgr3Jalp56qVyUvpSdcX8
 IiX5uDSoXR4BIIEPRfTdRVtM1suv7YQ1/y6B3quC73uzKL07MWEiOc/dgwexOA9GmYkR
 EvEa6JIKL95bd6GqtHRCLhGhBAm+oU5vkq7sERLcZwzfD9FZcc3pOVdAg6u5HThW6L4h
 er5Vt2X8IaPUV1FXkcrbEJnqAf3UjvN35cPLDJl4qvIwB1/KT5MwbP3XGNSMbUku4bpQ
 4yPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788151482; x=1788756282;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=du1670PtZB0d9+bShrqSzB5zKrmBikvFtLAHDDzeI/Q=;
 b=VuoSqwMYR4IHH0H5mf+YKywta2kNNMkDbcRzBuK3k2kIT/t4iyPa8E1CJPPHpWDdB8
 nZON5DgCMCYI3SfCfLUsUjDvted/sqs5WdkDgODU1ispZ0+VPJ7YUdMg61WK+owRYgr3
 vPRC1lA017+LhERqbyeEHfAtc43kCVBwF62MFhF4uJOle8wHybL0fAy3ZDm1gnMsXyGf
 Onw7iXgN9hUNdSTKPqxvjFDrT+tP2JUVd0Qlo9yPQD2aE52a2uMvLSDF21oILddzclEL
 y+ovF9j5v0ounYdE5CrGGhcXtpDD7F06rn0KVX7SxjEAvNK4P1RawVu0Tz27OZOZ5b5P
 Q/5Q==
X-Gm-Message-State: AFuF++mLZZ/6z3TZkppVzT9r3J9BrB0u7U9XeraZ6v4qy9z4ak2uBGYq
 5QTmD7GFcPFLmg+jVn8R0sEnAzLwy5NP6fL68c/BgqpM9wjRaWteOXCHwxpRNjiY0bzp5DP9pkm
 YGeGIwwcLINWkQrCoBZkXarV/+4M1OdZg7CVheqJBFuim79mTbpyyiedipCXsM6I=
X-Gm-Gg: AR+sD10klTVZ3CUQ0OA2vZovAUdVpAP3p7DzzUdsM6yB2AP6O6PSg+1UveFEuUY3Bxd
 NdPMmd6f9Z4g1DZZQUux6ARUgPqQRilyIku7+Djy5Io/8vlVeQdyHFUvDYOBVtpyQ+HtfdfEPNV
 ZABsk3kOi6THYouoEn79AgYQvZaYz7HD1M0swM/dxinQsUOVUuiq1Of9JY9dIOKo0DTjo40JPbL
 p+dFQwtdcAw+7ASrT0nAvLL81nJjxFbws2rMOgfTxOAuc5Z6cPDgdY8LFpqBrZ2CTOVwp0sy4dU
 SfyDfl9zO+1gOYhVzjtOvRxT+sFAWn7Y7e7MwogdZInkTsUj1DbfIxp91GaehqHFR3J8sJpMysr
 jOrRwZsfJHGOfynKlKIDPv5EHJZriRFrBww==
X-Received: by 2002:a05:620a:319f:b0:939:2af8:5be1 with SMTP id
 af79cd13be357-9392af85c54mr1167672185a.4.1788151481667; 
 Sun, 30 Aug 2026 21:44:41 -0700 (PDT)
X-Received: by 2002:a05:620a:319f:b0:939:2af8:5be1 with SMTP id
 af79cd13be357-9392af85c54mr1167670485a.4.1788151481256; 
 Sun, 30 Aug 2026 21:44:41 -0700 (PDT)
Received: from [192.168.69.226] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b95018ee8sm253997245e9.15.2026.08.30.21.44.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2026 21:44:40 -0700 (PDT)
Message-ID: <51909b26-19df-49ce-8985-e79c200b73e8@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 06:44:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] target/arm: Introduce cpu types max-v8 and max-v9
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260828222639.1432046-1-richard.henderson@linaro.org>
 <20260828222639.1432046-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260828222639.1432046-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAzOCBTYWx0ZWRfXxpQp6sKAwg7+
 kPgoPIXuMAyNYYjF/kaFKQLVjbrjR84Iyf+ozzH1Cjxh11+oTkQDXikDGe7SWqutXGw1A44tIhH
 2PcQ//sXX3NrwB1BlXKiHWs8oI0ZaWBPwXP6MQY67DkjXUN/GhyHM0LEUhRNc4OZ+3NoaWPEceD
 1bAecGG6G8L3PLJU13ZYIVCuXzXFjy0LqiyfY9l14ZseeUEqRvQGu1ubyZfV3WqmGvpIAUN+6mP
 KAbA61OuyAMDaOQmBiLRxq3TmCXG3DH9yKZdsbvyCL3gRJnYCfVpWhAjBmZqmiYe2RTUmQu6Vb+
 lLCfXdgQ5b7O0RVhxtQyrp6Kn4TZhQfcjaBHInnYVp0bKZd8G1Y7EKI/DcKgd20KXYvHcEjvfuI
 QcbK/uQCl3huq01tK2H0foLs4qpGAAUYz/UdBd3oY1sTzUcBaBFydmse74MdztB5oE4x5HEQTyE
 8dLQGYBTphn6YGgE27Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAzOCBTYWx0ZWRfX7Hh36L1vz80D
 FDtjjOP8mtKKlA/FMnFjCpaj0JtyWo6hdlfcA/0ecFG34fU43E3U4ypRDonuKGxu4PHRzMUIc47
 eqBBE7uUDr6Lg/FZfsPhwFWOKhxRXRk=
X-Authority-Analysis: v=2.4 cv=B7eJFutM c=1 sm=1 tr=0 ts=6a9506ba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: apMqmUQpHV6WHYqk0B5hMToPSx6ueDKP
X-Proofpoint-ORIG-GUID: apMqmUQpHV6WHYqk0B5hMToPSx6ueDKP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310038
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

On 29/8/26 00:26, Richard Henderson wrote:
> Introduce the names and allow them with the virt and sbsa-ref
> machine types.  So far, the cpu types both exactly match "max".
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/arm/sbsa-ref.c      | 2 ++
>   hw/arm/virt.c          | 2 ++
>   target/arm/tcg/cpu32.c | 4 ++++
>   target/arm/tcg/cpu64.c | 2 ++
>   4 files changed, 10 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


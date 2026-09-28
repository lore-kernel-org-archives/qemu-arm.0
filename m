Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE31C9833E
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 09:34:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB7kH-0007Sq-Lh; Mon, 28 Sep 2026 05:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB7kG-0007Sa-96
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 05:34:00 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB7kE-0006KZ-Qx
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 05:34:00 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68S9MC1t954336
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 09:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uYENoBj4ykRj8vx6IPgngSQk0xd6V5+algNlEY38L5U=; b=h+1AESC8UFUoC2J+
 Vn9/X5fWQE0DcPQmKl5Lcb2iBVRqGHqrXJz91rYx7pVeLIk5BaR80NP5aeUjEhPM
 39u2ZghBMGl7CTW1UGqy0pxs3e/RncbQemnUABYSvu/BTpY9VK3a5exUR4LJqzlX
 i8Kh6cDHuxWnmmFW5IvO3axkkCdmr9X5sKM5lP4Py9jyzCWLYSmzj7nLkvo6gUEJ
 GjquP8Nq8iJJzpraZP92OoPZ9HcsWx4GNkCfBsTlNz9RTQ0vswPUHVRYFFhQ7v5E
 HBPo6ulsGi9A9pU5E/43Y3nHxOGkiEYTzGFL4Q/svIixcZAkthuFEodn1MrEPdgs
 00F5jQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynbc031f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 09:33:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93bfb2da664so845530385a.1
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 02:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790588037; x=1791192837; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=uYENoBj4ykRj8vx6IPgngSQk0xd6V5+algNlEY38L5U=;
 b=PD22pTf2oG4H+qdMfu9sQCujlx4KJJE5TRdNe0HUaYGgizmMf9F83bgyFvzSf5g3Ry
 b0903RPC83kaQs/uDsdO5XuEfM7PiMuVMNsmxgRpX1wAneWoeS+WPA+KHBf1Goj3vUHP
 iSOUzaoiXpPlOU73nDUaXYgOlZXhmEItwWSeCnl7bgZ0zYmIFPqXZR9ZSXa9d3bvZguS
 Fze7rVYhKR6RC8rsSrwL2P3SXz0D68Vt6L8gPnV8f5IDSGlDuK5Q//Z2Fs3jjTLhaZIn
 IThfS6e/7q0u8xyggxWY8A+JssuuAEvRnVdW+Ken2+GPHT80CQ7oqDltGKgAB+mAjzoC
 gGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790588037; x=1791192837;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uYENoBj4ykRj8vx6IPgngSQk0xd6V5+algNlEY38L5U=;
 b=PIZxbAFmr9I6Cj2HISJAioJpeDam1CDJLdBvo+XtgAmAfG1rb/y0Tq5tkT02vYXVMg
 chAKNo3fCsA9WJb6MOhPCvvsERchCw/T2dbk7Xe751bl8DlMRJbq7vt5c+MrqK0AnOSl
 IC0Fbhs+HC4j0P+Wg/Q7yPQafmExxoZWEGvpBe0vdJA20FyW/cMDovr5cXbfneNPpayf
 KP8rERxDz1RhvUNV3gqPrcqMXQ6/+0bGFd7S2u08GNfk8506tnUshxrH9a7etFB33LNd
 ujSfTzry5mZPFnaVOjdd7pg91Amrq2IjOtA1H4170P2BlMDr0mUqnlfW6erenjOe9usN
 bZhA==
X-Gm-Message-State: AFuF++lGnmBWH/j9GxUBG3JYKbC16tB04F26sKx3OQEjFwn/OW/0Dk/0
 6kDfGw/GcvYNFKMdhWxRhNaPSeA38/RlMWWArEzdOGF/WN1PIUwB06gg86ULi6CddovVDq1fFHQ
 IZShWGxBnCZhkKbXjL6jwFHw1wbyG9gfUXkdAi0JP/H0yhwwJbcJ4z0c=
X-Gm-Gg: AYBFou0e+e3yNSDBVmPqaL1PH+wu/BGo4bVWs2uDmrTgiNEjnmYlDrjcCs+R0eIqGT2
 ow/Ok3khJuJDQ/k4swpi4yVF4EfegGDOXcHt4LfkSJ7lGbQwnfUE7eZjHVmXUZqTPQkrmKYexG2
 BSLj1wWnufx1YV6MhRpkNknJ+D6ysILXqwa9NqGHGbydw6zLsj2QWN5GAqf3wDwOM60YHMWX1dY
 vGVqIzgJFxTK1q2KWOc/DcCmpsdLQse8wAWZou4Dz/dCKkx5Kb0J/Ee0EZ8y9vE4LbB2EUCePOH
 YflISQZzJC6S+80MsKezU4/6CDJMKZqgqWa/iup8py2Hz5avCJ0I4e69bwIeZHhl0stcSgzNhBa
 Eis7oUm28tSuLG2us5FLg4eZEGSSxsOw4dQ==
X-Received: by 2002:a05:620a:2546:b0:93b:da30:8a15 with SMTP id
 af79cd13be357-93c47538931mr1803456685a.55.1790588036651; 
 Mon, 28 Sep 2026 02:33:56 -0700 (PDT)
X-Received: by 2002:a05:620a:2546:b0:93b:da30:8a15 with SMTP id
 af79cd13be357-93c47538931mr1803453485a.55.1790588036152; 
 Mon, 28 Sep 2026 02:33:56 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a007fd182csm27443945e9.2.2026.09.28.02.33.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 02:33:55 -0700 (PDT)
Message-ID: <0e880491-6318-4082-8b67-24eacde636d8@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:33:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/14] target/arm: Sort BE_DATA toward the top of
 rebuild_hflags_a64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260925215004.456336-1-richard.henderson@linaro.org>
 <20260925215004.456336-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260925215004.456336-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Sq4Fe/O0 c=1 sm=1 tr=0 ts=6aba3485 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: GaZSBBn125qdzxwG0UpRyyJNuQ7bQ7hC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNyBTYWx0ZWRfXxHvyWOGmIMLK
 3GxYQdLMnVHkADAYYK7Dz93blQ/ZkdjhHbWnLZuzW+euG1n+Q1fkyN18aqI3XkORjCfWy2lRsNp
 GGKoEMAXBaJcnTIOPLL9/ECwcG/wDnqIy4cpgXm4IW0V8LTLVAa23uDkvEyw3hGY6BPkdgXEuxN
 GrFuHn+TaAbJurWwG4I5NW2K3jslZpjb/E2lVSWE8iqzOzE9l+iejvbMSVcA1lBsiXX9+cJoX0W
 6SS2WaVB38bK2x7Kkv1nYbnmU9n6xjq29GQO9X7eFfI184VgKA0vEuLZw8+vD6oCKFv2UvsyhRh
 pS2IN3Vq3ECD4JevaREFOjQgZWjJ00a/8KQgVYlVMxfF2DMnhZ2Fz2yrFoxrzdZZASFJh8qFnKQ
 OZL1toB8DEC58ZUo3Bo7ZPg6xa7ydxr8NRBHFxQlGVyFurK1eNR/gfUhYy6X+lduM5c8MjtxmEj
 j6Q+8f3LlAOsLOocKlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNyBTYWx0ZWRfXyocFYqizeIxr
 fa1yzG8RUIb+crXuoxTuTGoGVNi2bQGCqSZga5MjBVUtIaCa1GSlCGVCzRL6Go48TP+ByWTyUo8
 SxV2ikCUb6ulqKsfrODrYz1LkVL0AC4=
X-Proofpoint-ORIG-GUID: GaZSBBn125qdzxwG0UpRyyJNuQ7bQ7hC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280037
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

On 25/9/26 23:49, Richard Henderson wrote:
> This is the last of the "ANY" class of flags.  Sort to the top
> with the other "ANY" flags.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/hflags.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


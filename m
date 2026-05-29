Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC21CD6E49
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 18:43:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT2AZ-0003F0-4z; Fri, 29 May 2026 14:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT2AW-0003DH-Rc
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:42:52 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT2AG-0002r9-SI
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:42:43 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TI2Pbf518563
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 U0GiKqxYGVho9sHc5JGqPJeipnbnaqHt+fQle5nA3Sw=; b=Nt4eux0de3HIdqtK
 wE6YHD/2Vw/7sImEKFD6We2XUGiHDbU8aDBaY5nBqnfbb8yPSicG0LMgO8bvf9Zm
 EpTd0nLydmZ+w/zgg99UnPBefMu2/jGZIFo7pZke7VmZAIm1/EnbcurP6sHKCqZD
 sYLI/tl5/KMC07xho3ogHnzwTwxdRcDOq4a9nZQMnpeXD8BxlZTrxP6GI5Ss+YW6
 ujnS7BogI/WXTvD5oaO88bX7yWXxI6FAb/e3i/5pZpneQftiT4egojo2bVp1CS9v
 1VHwZSArcC8DvX2HVYZWjkvCLLeyU76wnSs1K6/Uj9+mrHb70sdwaD5tBvjPLuRA
 Z3h7og==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efechgvu5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:42:35 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-304e3e3fba5so5579036eec.0
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 11:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780080154; x=1780684954; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=U0GiKqxYGVho9sHc5JGqPJeipnbnaqHt+fQle5nA3Sw=;
 b=hbg1G7ErujwE28iVMGql3CKwbvJfsNLsV35tpi4qjjzr34rgsq3KQdS4k4Jp7Q+fSm
 Kmz13QuNPJu/wYfBdvFgN/uqL0P2dKJiKR9E3LufOH+tmfoVCCXnEUmLaLsrgoOVvXYr
 l3vbHFISI5la713gYW3O/khoO5lpfuV7Dg0NVx64/Ir812qdj4aPywQAsPetf3IU88r5
 lQrLAMtNJ+9eY8tBJhed1vdgZmIeu08E6QskjN7uXah9Fg/KIpjBRCHiN3NHzZAoo0VR
 HzY2CE/p0A60YMv5F9te3Tz1PaxCDBEp9WZOtqkdywO12aaNjZbOV1WveolAL53EC+Vb
 5agA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780080154; x=1780684954;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U0GiKqxYGVho9sHc5JGqPJeipnbnaqHt+fQle5nA3Sw=;
 b=SJmzxWp/weVtyZdFAYwuNIXXpFmUVzXiSPKMmbnJLmAkl7vLhbdjVdrwwhnXkX54z2
 P9dyiFgi2WWKF2OF4YRkPeBE1AIylCLCtoA9yJey+t/Wlb0wsMjpT4CHybw1ATJ9Qson
 tqI5Q/4lBAnhiFXYi3bYlbP0SfYrGLKp8MIeXrdO4o6EZvMckcd3bwUiPTtNeXplqdLS
 TJ7fzshX1Y4B2bKtUCfvmvLtFDnGwjEA/0bvRgEO5zlYHzQPOjnDUz4LjoGZRYd2vdZq
 rdSwDU/iuKIZBQHFw+T4qSOGUOaTOJQjqwTDvcfFnd3bqIiwKrsIuEx7QCDw5MOjP/WX
 F1vw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9kv+XUlw3M4VywTJffQ0dHcKfDH32wNiZSbDOKvADyF8B+8gG4C/sSf43gNXvpRx7/lHmFV60jjg==@nongnu.org
X-Gm-Message-State: AOJu0YycmaBnPYWg9DQLWzwEbKv9MqyiRfedRpMePsamFu5IBpLqbtMb
 LV+p80bhgKNNHFqFLGRI9FR64vIEDU5vH2sMqhGy3tiIbdpkVmZ0iAZuA8Y9Fa5ArgeFuOaVLFe
 BWHRrV3NhZsfnS+uYv7Mua5A7y8fniQ1s874cI3so1JGyY7iIJ63ys6A=
X-Gm-Gg: Acq92OEctvoeLQsej6FwWIs1WCkn+lUDkwXMgtMf5gXCHdnLrUnZwI2Y17cf2taYYA4
 lSABPBYVTzAbf2TKVDOouh8ItU+52zdVYGZwTLCUvS0Ch4li3TTbN79pK9ix8JvWCFs5m5pswub
 HE7d1pBmoeaklf0wFWD25ZmHwRdwjwx03fegI1waGXXrTB3XrnJE6CD0LJiAJevjrPiVoo1z5Pi
 JW3wFQuqHmkC+EQZn4ooJA0tXdj47dlImxRBJr4LDPRR5QjuMl85w+E3Jr464YLwWL+T0a8SnG7
 aEoZH6pKEZ9rSIAiobqCEJmbnSGPhFbZDWHmU174Dqpdwhtn3V55vTmACF3ssmzZKnjIQvBTBhE
 RaSfqPptLWB8Bm78dWPlgxOvb6Gi3dYG0SjezcqvpzN4ksD3GE/EnQluo4mGU8S6dfBpTCk9bh0
 6Fuw6LVk5579tXeF8xatSF9GJp
X-Received: by 2002:a05:7301:1f0d:b0:2f5:3641:f126 with SMTP id
 5a478bee46e88-304fa6ac22dmr503373eec.24.1780080154138; 
 Fri, 29 May 2026 11:42:34 -0700 (PDT)
X-Received: by 2002:a05:7301:1f0d:b0:2f5:3641:f126 with SMTP id
 5a478bee46e88-304fa6ac22dmr503339eec.24.1780080153617; 
 Fri, 29 May 2026 11:42:33 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed2c154fsm1883835eec.3.2026.05.29.11.42.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 11:42:32 -0700 (PDT)
Message-ID: <062a4596-25ab-4f4a-accd-4157a58c0fb9@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:42:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: Re: [PATCH 17/17] accel: Remove AccelCPUClass and
 'accel/accel-cpu-target.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Glenn Miles <milesg@linux.ibm.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <gaosong@loongson.cn>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>,
 kvm@vger.kernel.org, Claudio Fontana <cfontana@suse.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20260529142434.87880-1-philmd@linaro.org>
 <20260529142434.87880-18-philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <20260529142434.87880-18-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kJJ1tVM6-NvrZcmJ-_fF1-9ArnI6xJ0M
X-Proofpoint-GUID: kJJ1tVM6-NvrZcmJ-_fF1-9ArnI6xJ0M
X-Authority-Analysis: v=2.4 cv=U6Siy+ru c=1 sm=1 tr=0 ts=6a19de1b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=HiizW7Cylt4g5avhvM4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4NiBTYWx0ZWRfX1seZO6Cq/nYj
 T6xihV7IHGUb5TlXXNOwtfpKypaxFa4i+iAmlze/nnEzPwOASgDL66OqggU/RELs5B+Faupsshq
 eC1JyNl3mN1TrKpUgywG+00DWXF+X2MJk4rRR+zFPdxcub/mqArW/isCRbxQuh+y90naYJWau7s
 XIfBk5H/kFXnuFPH4x8FnalVoX9sQr5bHxXxyBENyETHzVIhnyO+53QHpWKPLvvWOBkAga9ajba
 w4SKOMEDU0LtSXwv2Evvj8Tj8QcT9n3NsIUkruFVDyUj6Bil8ulgCmUNm8N2AvSrhAWnzbO7dT9
 XKlG64qDn65fozdlcyXoT3ozBunGbRier7vh6r9l9a+h14qSmfU5fEAKE9JoprTOiUZbznwaAze
 BX+H4HI06C5aiHkdNhD+odFT2ZOJpDrAzo/9AVxZFJ5Go5IPJk4Fqm/CEL2kpJTd4QJSZPZnaS1
 /OV3v9dDysqHlwrbZAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290186
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 5/29/2026 7:24 AM, Philippe Mathieu-Daudé wrote:
> AccelCPUClass is now an empty class. We removed all uses of
> the TYPE_ACCEL_CPU definition. Remove as dead code, along with
> register_accel_target_type().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/accel/accel-cpu-target.h | 31 -------------------------------
>  include/accel/accel-cpu.h        | 19 -------------------
>  accel/accel-common.c             | 16 ----------------
>  3 files changed, 66 deletions(-)
>  delete mode 100644 include/accel/accel-cpu-target.h
>  delete mode 100644 include/accel/accel-cpu.h
> 

👍
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>


Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67274C43458
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Jul 2026 13:24:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgjIj-0007LR-N7; Mon, 06 Jul 2026 09:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgjIh-0007KI-F6
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 09:23:55 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgjIg-00082C-5T
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 09:23:55 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 666AxLfG387492
 for <qemu-arm@nongnu.org>; Mon, 6 Jul 2026 13:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 X7WMc+n75AIeEaz0vOa03BmlwZRHVpbkoxgIF1OKn+0=; b=U8BLJpP7yO+9gSVt
 62sxD5yQDkiC3BrXBPkXRxzq9/bwDsSHFK3CcrDWA2fFrehQpjLO5/XE2j43+iO7
 7y42aGX4KWFfw8Wu7JfZhVi2CN9A9hFk9qLZi1h4LK3OmOgILsUbUZyRYtJHbA9N
 EA+3rxQAw2sHuORAMY/XCYAPEyovgTtnsr54jSRsfm7wqsZZEGvWIogKgZyiy0ad
 7QeKA8TsmRL8bIOdcJY3BA2nOfZV8rZLnZhIDI9r8aTJAkFUQCt+aXbINe6PQXIT
 lb2MREqLkbCMiWejynK8k6wxNUeORTFmHMYv5yxqpHXewrEOn2vlZxAkpBrdwzBA
 +QM7kA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r0sk5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 13:23:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92e820609d9so221266385a.2
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 06:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783344232; x=1783949032; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X7WMc+n75AIeEaz0vOa03BmlwZRHVpbkoxgIF1OKn+0=;
 b=D0RE28uXTgiw0c+gbCwnz6vKryvfVkE5fjPvV6HmkDMLEE42vqfW9gzCnNPM5/x24/
 sbEN/ZDNiX7gNhFNNGfRfWdf+UQYwhFr+igwZegI/0cdzTENBRnJtAM0KAxY57QbUr1g
 02i0Tw7Im9dyFg6fQpx2jydggwJWBXq0InwefhxQ7so9GXX+hvWobQvVWfN65W3HVLhR
 Oem8j9us/e7VqLcFtPIHeMf8gYDWPysg4h/DDwKp07AbVTen5HJsF45eITICxybx5fH/
 U34E64M35ot63Uzs+N5aaliWe1bNBymA/Ou8Uj2UU4L70GsOwcxtcYSySHjCN3tpRkxb
 zJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783344232; x=1783949032;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X7WMc+n75AIeEaz0vOa03BmlwZRHVpbkoxgIF1OKn+0=;
 b=jzTlmH7FYS6xGSmN/jr04DbVzaOHj5c7ZroJur7pqEDfmEsNFFEqCYmdoCjfqxgOvp
 ZqQ/uCl4RtfIxDGLMKARBiL1YBZtuESBfesK070/4r8Mv0VA32mbw6n5ggbQjQsIU7dL
 NH4qsTfQibnwD9Y4JdbvSyVVq5usAwqiJm3ot6JFK7b7rL/0UJ8D94+LfJ58RqpccPlP
 5fgJMyz/lXNzcJJNWAB7xIAqFAR2HHslZJrEjz//StEo8sNXyjiyC6cWHlzRbnYR91D3
 en9DzK3Te55OZY9eCz4A2jOt5XmUhMdaJHViaGPGf8IrPXC3Wucr479J5SfnmhRccIGB
 m2BA==
X-Forwarded-Encrypted: i=1;
 AHgh+RocucNEuy/QdU89aVEPQgc6CpNcErDviVtIiaxZLCLdYFCsG6sWQSP2NIV7FD1qm3MPL/taQzAc3w==@nongnu.org
X-Gm-Message-State: AOJu0Yw4s0LhfnnrHKnSWOX3UPjoxTZMEUMqLLBDvub337RJ1L9bFBpd
 hNQY0dCtZZjy9Ia4xjq5OyC8VnWs4bMEh3fF5KDy2bEKv3OA8/UzeL7V9b8ZaOmk92uYGC1taX7
 fg1ej5wbU8KyLKdtk/xFiUHLPwDyIut9LuuKjIFf26R5lavvpvjmu4A4=
X-Gm-Gg: AfdE7ckHO+knZcPOblnhORsHv8NyYXrWg5GxWxISUNq3PZXY0NOc9QNUw9Qt6RalFFq
 huKNzdi8iEOGtm1icdHPuNCQ/dRsGoTImZeOPQuUP6COP20CHjDHG/zr1re/CJ6bNBz0dzdlmkj
 XjQ05R3DosYOB3qBeZJ3WsDTiRdKShyXPj3HBMExKysbn54tNvbhFHb/N7kVbqqDOY1hFUV+GBn
 +Zk+QIXXb21g8ESjIvFw7kU3CZEvZAJdtr6KPTmj3hN8QkUV0tjKTKMMKbzkAKMhvp6cPRdCmZN
 O7iiR6QFVduuN5fkx4PEZhZ/YKB2KblkonZ49HI70QjOSekcyPSToyHARKW0++WUPqmb1nYrX33
 j32epx/xAvD+Dic5PHR/zJ5MviACfqyX77S8PN14u3/MtoXz68w==
X-Received: by 2002:a05:620a:6403:b0:92b:67e6:8ac0 with SMTP id
 af79cd13be357-92ebb5d3671mr66990385a.74.1783344229394; 
 Mon, 06 Jul 2026 06:23:49 -0700 (PDT)
X-Received: by 2002:a05:620a:6403:b0:92b:67e6:8ac0 with SMTP id
 af79cd13be357-92ebb5d3671mr66983885a.74.1783344228831; 
 Mon, 06 Jul 2026 06:23:48 -0700 (PDT)
Received: from [10.237.61.207] (1.171.88.92.rev.sfr.net. [92.88.171.1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493bef1807asm322546955e9.1.2026.07.06.06.23.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 06:23:48 -0700 (PDT)
Message-ID: <34d3c169-95fd-4ff0-b0a4-503c3b07fbb0@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:23:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] hw/net/can/flexcan: Subclass TYPE_CAN_FLEXCAN
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Matyas Bobek <matyas.bobek@gmail.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, Paolo Bonzini
 <pbonzini@redhat.com>,
 Jason Wang <jasowangio@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Jason Wang <jasowang@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Francisco Iglesias <francisco.iglesias@amd.com>
References: <20260702184038.178196-1-shentey@gmail.com>
 <20260702184038.178196-3-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260702184038.178196-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfX2RSFBZqtpAiZ
 CHbXNN8xsNMm6bAsLboEeS/uvBOVGlqu0jVigOFFzUTxaK5xuMjgsUHM889iFKIuzxVV6WSt5XZ
 yuTGeDBmiGKfa4GyG2Mhh7QSSyfdXcYr7gEHQuU3TjXYYnI6+GMsPaZhkkBiF2YFyERhXZcbt/3
 qOTtg9Xqq5U3Zpu+s7bTNjOyKOT/4eeNtSX68nxsVDJVS3HSYs9uJIWkUk5virgUMb873RXMj4+
 PqKoKmBVfWPdN9k4QJ2EwJwcVpL28jLX7DRdXhr2BS7SkEwLQ49M3DC6x35SUTJ2vtph5OJMivf
 Zw9NduCnS/gVXZrYT7ywDF8m29k+Hr6m0Kd0vXkuw7w+cnqigy2uG0L5riPtzOB+n1XcwIBDyUy
 +BhwvMtHjTROtv4WwEQjZcuYvQn7r74pkT/JAgUPnk8u8v3MuEj4ho5Hg6O7vT4TEN0hTtYLUds
 lA7dNL8wpVz4a3kgirg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNyBTYWx0ZWRfX4sr/TzIX/LUI
 BNzpo+dh6jh52Q1flOlO/gAMHsMNLyntfTGp24sxb/eYDC5glLdaweuvsMsEPgEI2YD4WnhCHVE
 uQpWcH5XPHwBiLkhB0+NwPd9ZE03P60=
X-Proofpoint-GUID: P9ybAPyry8SfLRmn2RQBtlmijy-LvzJ-
X-Proofpoint-ORIG-GUID: P9ybAPyry8SfLRmn2RQBtlmijy-LvzJ-
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4bac69 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PLEY+c9/kVlxBKEpvFYBUQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060137
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

On 2/7/26 20:40, Bernhard Beschow wrote:
> Subclass TYPE_CAN_FLEXCAN, yielding TYPE_CAN_FLEXCAN2 and
> TYPE_CAN_FLEXCAN3.
> Since TYPE_CAN_FLEXCAN is now abstract, TYPE_FSL_IMX6 needs to use
> TYPE_CAN_FLEXCAN2. TYPE_CAN_FLEXCAN3 will be used in TYPE_FSL_IMX8MP.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/net/flexcan.h |  4 ++-
>   hw/arm/fsl-imx6.c        |  2 +-
>   hw/net/can/flexcan.c     | 78 ++++++++++++++++++++++++++++++++--------
>   3 files changed, 68 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


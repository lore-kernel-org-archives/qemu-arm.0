Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D079BC43458
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Jul 2026 08:20:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgeYb-0002OY-B6; Mon, 06 Jul 2026 04:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgeYM-0002Km-Eq
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 04:19:49 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgeYK-0005oq-IF
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 04:19:46 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66678ON23977007
 for <qemu-arm@nongnu.org>; Mon, 6 Jul 2026 08:19:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 acUH6e5oOeBr+Cko9BRdr9TQwBnwFSwXZjhn4kQ3eWM=; b=GmrFM1XTYLxa8P2y
 3QimuoUXBb27lFeDFIwum+09NMX7oysMX89k4cmP2KJ0/1x45XTryPEeFgVgBxlv
 H8cbIkehJQp5Fxs3hb+YJz4M4StfYh8COE0Grwkw1K4Gnv2dAGJJsNxg6neF1T3i
 TWvGqhodWXkpuOGeVaN9gQCs9OrTIPjacqwKNNso04MyK10gA3kxfCFaCF7FePpE
 lD4sn/UZUrA0B19RhJHLJu66VQz1hsjjox5ZCFDnWUTR3jpThvCGcCuEAO2d7HvK
 y2VquXtHiYAu9wDq0t6BW2UkS7WBNJZJUAAAJlAG5CsE13tw7023e+cXISgMQy05
 mRsQAg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7g8tp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 08:19:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92e9a2b95b5so423998485a.2
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 01:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783325982; x=1783930782; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=acUH6e5oOeBr+Cko9BRdr9TQwBnwFSwXZjhn4kQ3eWM=;
 b=KIjNzcMOSpj9INz3tYCbqkNkLZTJTe/tNkPc2ON4482fACVOB3TxvDugoYzEorGJnn
 au9OYlVJyVfKXKm0A9GxlCrsFyyjqAZV60BsvV0EtDQYCZKrHAAtmOKZoiGlUiHpjOCE
 RYo6K8ay0JYzOAyE3q+RG8awLwe/j5+u4Pv3E7oGh/qao1KDNpm9KlMdmzJfelRDSXQb
 ocgZaMAd8d8RdZlE1txMQTi/GiZwwUk8cPR+fpEFuLu6tFiL5Xbv4s2CV3yXRl5DcQ+1
 TiDFGMYzUktD6x2+8SN9SqVIGVBvD6xEKnZUN7Ob6VJyDtOMIyXEzEnIg5VeZ7b2CRg3
 tFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783325982; x=1783930782;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=acUH6e5oOeBr+Cko9BRdr9TQwBnwFSwXZjhn4kQ3eWM=;
 b=X43K9l4AkgNP9hQ7y+68IWah+UneduSPIsKK8DZIjshefGiP6I0Dv6dg1rqC28Zho8
 H8K4r9v8Ij4kfHnZIBBuOsW8zDPMBkEB0jYgfvVhLa/sqnDkeOLAfUUNyugPaqC4aev9
 FykzVCRfNGeMgT/rmbBbvRWA2IVgoYUiRjyJU7bI253SyI83oR/Mr6UhN0PZ3G0I8GFr
 K1EJ5UyO3XpN782UejU78lQFAOXmzy1fcnWWY4HIn3tWSv70PlX6Ynsyan5mvz810c48
 CdGYt91EmdO/IGKWC9FaT7MUx9dI/sfQuW9OWs2ZTBW7rcZzdxrC/VQi+uN/dS5WVL6T
 KUAw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpo3XORIteBAC+G+wbDG2hnIyLdnyWfXs9PgC7CiBI++DHYj+29ZiO7qxS8s6ZKThE9Gjh0ggXlSg==@nongnu.org
X-Gm-Message-State: AOJu0YzJVhaR1nxpwhvN6mmevFmC44blvdmogRob6AQIeBP/yZa8pbLx
 HiGU8oVYsOLUyn96VELw0WsmMmqdhiQpJ9R5KXaKa49ECC+DtK+fJ45LWTuEtk7pvYUAtLPYqq4
 SsO13vAFuaY3JxSw+iZlRR3Ta+vvTBdzstc7MPOA1rVWuXIbbaWgRfF8=
X-Gm-Gg: AfdE7cn0arUHW3Ft9ojbn4pcTFSBYoGeYcGQ++7l2REeizjGdKyPV1cn5noeShp+NaH
 Q3Nd1k5DuLQDylyXqHno+9zrF6AY5WFH0FMgnqS8L/PoPP0e3iB2Cai6TgtcxvzBl1rIcJKvG62
 S03AySXqs2C+ZXKeTYeDfQGFcQqTWFptjA+AD3auhzrICanYXw7cCFN5Zw67EvV7mg2rHZCtOxh
 IC1snkmVu1ylCTnT3rSuF+oGpxomNUwPUAM46lyac6Wa7wgg5g6wudpkbj1WrsUka0gSYSnBKFS
 pdS+HvyK+01ebwvXHYX6P9gzIirUTMFuH9ybQarhEm2nQSE/YffnrVROIErrPCGGPm1xFVdVa04
 OJWcVq7NqEh5LW0TUJyk2r2UvDzE7DIC2BBZys/wzzkAggNjatQbZL2TRbDrXnw==
X-Received: by 2002:a05:620a:1a18:b0:915:6758:24d8 with SMTP id
 af79cd13be357-92e9a41d6a9mr1190957985a.42.1783325982304; 
 Mon, 06 Jul 2026 01:19:42 -0700 (PDT)
X-Received: by 2002:a05:620a:1a18:b0:915:6758:24d8 with SMTP id
 af79cd13be357-92e9a41d6a9mr1190952485a.42.1783325980772; 
 Mon, 06 Jul 2026 01:19:40 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c12b62c2d37sm684884566b.42.2026.07.06.01.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 01:19:40 -0700 (PDT)
Message-ID: <bb4b7240-ea2c-4738-80e1-83e259f3ef4b@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:19:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] hw/{block,ssi}: Fix spi-nor flash dummy byte
 handling
Content-Language: en-US
To: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>
Cc: Alistair Francis <alistair@alistair23.me>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goat?= =?UTF-8?Q?er?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Kane Chen <kane_chen@aspeedtech.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org
References: <20260630135729.466264-1-bin.meng@processmission.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260630135729.466264-1-bin.meng@processmission.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MiBTYWx0ZWRfXzO/XIHOC7TR/
 gapELEWKwJV9+juBAyoys4hhBKfE3eq+hIY9HZB2GkyLmOsEEVRPVvseuSzJZi7RaQwf+ZsdRxM
 ZerNxxBzrlI85Tbws+H9EozF4+8xDu5R2E5+WkWTt5HRc67DErEXFxY5qrSf5SbsTxa5aZfVT0B
 eGWbtMpHIQS6AO2IxLEYXzuaLtRz3kjE1bMzgndgI9aiDv8am0AVKPDX+2SS9zxwXXs0nfaONeY
 n3GVHep9x8sA0rVBSY3L70FyVszEaxUaoznwxpyALdnk3ZSrTHHLS7ps2P9sN1UC6R11jNnyPx5
 tj1PjUOfGbJYDPK+4fhp6KB1ghXvRPXxrtrfD9QaxwTGk6SqjD0foyQU7PR6W3kifHIF2WJU56W
 2ck1H4oep7Dz/R3z4goWaRkKd0Kwi/H60weI0+bjCpjv+zu1gy/M2fMLN+aaQd5Vt1M3qbhR+qv
 SfmVrFsGWYDqJeRDIFQ==
X-Proofpoint-ORIG-GUID: uxoveM0_nG922YIPruIlrTjB5xkKcgxT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MiBTYWx0ZWRfX6LAZsBhXd8uC
 8Q+Jz6EotSyDWEHomQBe1crBDJOYHeqQOwePVNe+EWxmi/BR0LLVBN48zYLbsNnt9gHfwvSLTLZ
 CsGWB+iDjlej4noIzYssjKrIg0F5uXI=
X-Proofpoint-GUID: uxoveM0_nG922YIPruIlrTjB5xkKcgxT
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4b651e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=B6AAU58NjM16s_FHVf8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060082
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

Hi Bin,

On 30/6/26 15:57, Bin Meng wrote:
> 
> This series fixes dummy-cycle accounting for SPI NOR fast-read
> operations across the m25p80 flash model and several SSI controller
> models.
> 
> The root problem is that the affected code paths mixed two different
> units. Flash datasheets and controller registers often describe
> fast-read dummy phases in clock cycles, while the SSI bus interface used
> by these models transfers byte-sized words to the flash. As a result,
> some paths treated cycle counts as byte counts directly, and other paths
> compensated in controller-specific ways that duplicated flash command
> semantics.


> The final patch documents the intended ownership boundary: flash models
> own command semantics and dummy-byte consumption, while controller
> models own hardware-generated dummy phases and cycle-to-byte conversion.

I'd blame the API. I'd feel safer having the block/ layer use bit
cycles, and a core layer converting bits to bytes when calling the
SSI layer. Maybe too late to improve. The documentation you added
is helpful, but I'm pretty sure we'll introduce more regressions.
Anyway, thanks for your work :)

> Some background:
> 
> While recently working on some device modeling, I hit this issue
> again. I then realized that I had sent a fix series for it more than
> five years ago, but it never made it upstream.
> 
> This series picks up that old work, refreshes it against the current
> tree, and fixes several issues in the SPI controller models. The original
> series is available at [1]. I have tried to verify all the SPI controller
> changes by booting real-world guest software to ensure the change does
> not break anything.
> 
> [1] https://lore.kernel.org/qemu-devel/20210114150902.11515-1-bmeng.cn@gmail.com/

(Could we add this as a functional test?)


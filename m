Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA35CA5FA1
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Sep 2026 12:19:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBWo4-0002J8-HR; Tue, 29 Sep 2026 08:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWo2-0002Fd-HN
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:19:34 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWo0-000365-O9
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:19:34 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68TCE4ln264782
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QFQlP7Gl24sl5yw9tkUTjlHxZhjVyTAgpAkpZPUi/WE=; b=PZY2L5b1Nc2pbGUN
 cYURXlVOyzMM5FysoruGD5YLm8IAU0j8HSsFW6CipOp8CvWdfM4ehiB9hZo21RsY
 elYf8jdgH8f7w/SkF0thdaUhAcp7jQ6pwztUQGUJE+F5PZvzdPFIEeq38oww3wy8
 DSxDf2q+YPbrTOB4OLmBp+FOlHMdvtco+IeWmZGk5NnbQqDV0JSizqSpA0LCf02G
 4qg/Atw2nYb1dbsmdHtaVT1AwnK9npmB8M8w1kilQwmmUfb4BjFDX1IF22bK0+lC
 h2eje3s6IpNf83S0DR3rPPNWj/pwGhBReADWWIsfs3JNl/v0BmDV4jK1v7njr7AA
 /97yDQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkjqsa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:19:31 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-7b43c5f2b6fso259603137.1
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 05:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790684371; x=1791289171; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=QFQlP7Gl24sl5yw9tkUTjlHxZhjVyTAgpAkpZPUi/WE=;
 b=g6mbI8E1ByfUux4/AGSu4K3SHZR1V3ySS33pbr2F5TM40eWmWRYvk/3k493blLHcD+
 uK6R/GKTeJWLMxqTMurWoXZVePJ2pZqhoxBUBHr+42i5v3h8R/F7TOzkMp0MKTjF+VV+
 QVpr/37KDNFtCY7vyoUgKHr6a2vprh2B7bySc9Ik9267xZ49H69X8H6UAX3JrZAA0cYz
 ZfuTOhE8cLnl1Xbklbj6cpUmvbxGP14tjuwaFnQkSkbZuwg5alkaHm7lqYKUk8TYYeAN
 skLkT2uQyDpyQnljx80ZdUBTtWrAmlF/s7YOudO+/3HwXcOVLWB6zJCcZtmWMcgO6SHY
 basA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790684371; x=1791289171;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QFQlP7Gl24sl5yw9tkUTjlHxZhjVyTAgpAkpZPUi/WE=;
 b=vVhFmnaJiVXGQggYncg3FSYOyklW8m434SF0wxAulrS541UCQpmoGPCduqv98s39H7
 4GDSTyZ8xNmBoQSty7w7rPyyRP2lrAsFKEBnYUQDBTiKHn6vYcNE41MV5K8+sSreMjoO
 pSUlvLuc6Sdfu68CewjTAXZbPIdkzjE/YbXHaNW9E3XKeUqd6F9L4uVD1rIYdHe88d9U
 doK9V+kmCaD0dk/e4LWcjdRKO4JCyeZOR5iyQnqDgyhFsf9a8W5oob1oadA4Cv/yehFx
 /Ugy94g1UudmZmiWePGLEZGaDTFkyQG2kqWdJDxq9t0g+WeWSB7HQWRh6YQPDemV0Rw0
 TIXw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwSKsg5P2S1wJE6SwSR89EaCu3vUnNFyLFdLVKPH2vXI3g+pSb9EGhgc4kYrY3iTYzNnHsWWeg7sA==@nongnu.org
X-Gm-Message-State: AFq9FYJFznnUJNzfURJNL2SsVtavNrCc0TwHEgCiHTIAS2LmKGrYyXQk
 zle372lYolbbzohDl0tC9vCtI4E1ssq2yWsiF5IKYIHAPoH6HoK7GGrBP4jAlPsdopfdoy9OR++
 wZ1IF51qBATP2w36K86n3TOWsdPXc1LZu8OvJsv61fPYyGrhq/PFQub8=
X-Gm-Gg: AYBFou0Efkt2b+Hg0szZpBSAq2BSKcqVJ6YAmCLboGgACE+oQ8IAFHg8nKfWKfBbm2x
 D2X3Lfg+NQPTM1uPWXINTr4R/l5yWE1/w/DW9FeID4cFoK86cDTOAZ6YHWPMbWf7jexYTl2YVmy
 FWejEbkI4w5Z1wPKVIEGIP4hcxlH8pc2vUIOyn0XMi03DVx/KYXGA6LzUboFu7G4021Bv/BiSYv
 odSWTuXYaLw0Qe6O+IPib7paaLGlnpOV+LzMm05z1563+4nyYkta9Y/YNiXzbIIDDKou8RYkn4R
 2KVU/5Nx0oRjlS4c1b/egUyfwbgUcwbo4bsLhL0mZ32CEHC8Wnm/HhAEpO6oIkRAs2jrUvn9LTd
 A0uBGdiQ9x1er6MmRM2WQGRC+1GmvRqBaq1iVlMUsrQmu
X-Received: by 2002:a05:6102:504a:b0:7a1:f951:f307 with SMTP id
 ada2fe7eead31-7b1d5498d42mr3259784137.26.1790684370894; 
 Tue, 29 Sep 2026 05:19:30 -0700 (PDT)
X-Received: by 2002:a05:6102:504a:b0:7a1:f951:f307 with SMTP id
 ada2fe7eead31-7b1d5498d42mr3259770137.26.1790684370392; 
 Tue, 29 Sep 2026 05:19:30 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48af5078a0asm4082011f8f.23.2026.09.29.05.19.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 05:19:29 -0700 (PDT)
Message-ID: <ad1f0768-2f56-4905-a974-b9d92302dfe2@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:19:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/42] Kconfig: Extract config IMX_AVIC from config IMX
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
References: <20260921214710.29422-1-shentey@gmail.com>
 <20260921214710.29422-21-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260921214710.29422-21-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfXz6fMt5ParZqF
 fUfGn9YNNHEFFp35+NgxkYOA1NTSmIya9oFU9Vd4MxZ5TzSwZhBm7H0h/HJuBxV/YAEYtFlyHf3
 W6fA+hSGBNhvhffsDEVD6U4J+yLi48VhfMtgJwlOUgCoWg+RNMJazXI3XF98aIoXTYNB5fO8/gt
 5ZTz3Drs3KYSWBi2riJT8UEHF2BvLl0HC9Dj8OpE+LAT0edTgoh5ioHC6GuJwGWlPu+GjKpuCq/
 S6QDdSZmwXTLfQbHBetmnVqSiWMrHd/vIshZ6SBInbLZUYj9ObGXV7Ymh5SIjuhqT9MQYfy7evw
 IGgsP3J75Iw8WZxfE+5lpDqEkIsr+M6qgJFwR428YIb1PN3TVrrpSZ5FCL98ZgF5nK9Nybqjk9u
 +qo2awGBimkAdQtoO6gfqXL22+j1+GS1LgMiorlLvHFbF2awvXzwMO5qO7ur2LV+p9CwIUxvhks
 vWEdw3hreJuvxoDU8wg==
X-Proofpoint-GUID: 7pot__92nalXGYZYMvUXN0RnPX4BNWEq
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abbacd3 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=iL6aATLHOuMsmFBjOvkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 7pot__92nalXGYZYMvUXN0RnPX4BNWEq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfXxl59DY7XZhYJ
 t3QxbJZtuDPasVwXDyD5gXeXJPlk+/StpYbOWGWlpIp3sx75nktyhF7LF2cSznXbvcbvnK8afHb
 zhZqF44O9tAQKZWw8Dy7fM9zBJTnF40=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290049
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

On 21/9/26 23:46, Bernhard Beschow wrote:
> Over time, QEMU has grown a number of i.MX boards and the monolithic
> config IMX drags in unneeded dependencies into each SoC model. Extract
> config IMX_AVIC to eventually eliminate config IMX.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/arm/Kconfig      | 2 ++
>   hw/intc/Kconfig     | 3 +++
>   hw/intc/meson.build | 3 ++-
>   3 files changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


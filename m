Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0B5CA5FA5
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Sep 2026 12:20:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBWoR-0002Wm-4k; Tue, 29 Sep 2026 08:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWoL-0002Re-Ts
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:19:54 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWoJ-000379-JC
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:19:53 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68TCENtI119231
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mrdHD6VOyASGCKeBvmBYKm7ryeKR0EJ3dQeT02DCAeg=; b=Vx/Pzr5dMH87bFhe
 PcTyyhDiLMAApaD77xE3jdUKq6Yzi7EL/tdr6JV82bokAXxcJsBEWCwa9bO65Pan
 eZ2yfRG974bA1+iSfGRCgkpyDJDqRntBQWl+O+17AgJwJpw4Do6Bi+NxFtYDI3iF
 Yx9/WxbCg3v4UDXWicZYWaXzRAGqjb14vPEoVh3Xg07amPVc0eIcQOgDHGN9s2fX
 2UhXw5ADTu5AWQ0JfDVli0JOIYlsHatz/sqdlLcEWvNZXLYeGg3SOLy8LZYE0kNg
 kMGOKFWTbjrpy1bw2/RtkqtX9NXvK68t+9Za9o95Gey1pTrWQ4UMqL8ID2tceH2B
 j6CcSw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144tvun-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:19:50 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-7b4085d29d6so393289137.0
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 05:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790684389; x=1791289189; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=mrdHD6VOyASGCKeBvmBYKm7ryeKR0EJ3dQeT02DCAeg=;
 b=PCJtia81nPKAo7GvrVgxm9/0iMB2gKE3BdfEt3pgdCAYBPTRjQ/FcUvnemuHEc2RYZ
 +p8NmBev4BIQDUMp+DwRr6mA0k7hUu9zzsWXWsRBfvJCKHMNuCy5RSFtoJdHdsumTKbH
 +P65ob70SSzt7qDAcLf5cPgPE6GL4i4kaZcWvr4w7z05ZJRokM9qAol8KhWAbNn+ZzrF
 K+BsaiobLZ2beIOC94Kyh6z91ls6rVJtiQfzKHCOiZyVWpJWw3M2VHU5IaNRPYg9cXbW
 hpXabcc0PEME97ZftMhExm+0hIR/RNnykMz0jVhUIDfQbGs1KoPxWVKTsSMf0lmiNXdC
 2R7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790684389; x=1791289189;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mrdHD6VOyASGCKeBvmBYKm7ryeKR0EJ3dQeT02DCAeg=;
 b=n0HX1j9Xs+EoS6cF+ehZAhM72vxM7UdVyxM4SKqpXMszLl6cbOFIPV8D8s/vh+YTcu
 lQ2gsJ023UzRr2tVa5eyyQKTlp6oMXRsicA1zDvlnAmh3yzKxqZgp4Tlq2CcsPBaZcrW
 Vl44nLbM5gZon0yCVQi2pMS4Vz5mgJ+2OOQYeBv6ke3PP98eW4eJJs3GrbmTBuzTmQox
 0NgoV+vutab2s6c31yB9omiUe3YfUwijvBqy2O9hyeIhlIFHOym0Y6OpXih+QB6WG5Qs
 E/V9JvFVBC2L/GfFMyAxLwu2uCSURNmH26M+LDhKhceSnUgi5LpqozwraqAIIp/QXPGo
 MWEA==
X-Forwarded-Encrypted: i=1;
 AKwUvBz1B7TrolrEjqzcO8QVx+jiP5nsoi7xc35Car5zy3zlr34rKYLS0crSAlXVNNdeyfTnxkfNYt9L4g==@nongnu.org
X-Gm-Message-State: AFq9FYI7Or6Oq7y3wx67ZLGzgQ5DsN707NzHN8JYWETS7cfX91MvVfHp
 yHmKFO6rojU8capo/ooUJ51/QdCMTjXKmCbrIZXohP9UwMpZQ5h+9uRRvzWLoIVwuokfnQA9FNz
 5bSUGcIVNLhIXShiccEf4dFI6YLOfQBeBYwe2Xp846UOVl4q/4dc6ikU=
X-Gm-Gg: AYBFou2NtalBPm42kgHLwc+RNTVDbGhH6FgwzBMRc3oXgP+AIMFhRqB14bYCyWikHCt
 2K5iKxvXx1g7AGFTsufdaPX9gI3poqdcAynQtW4nwv0IbD5KHuERE++HDlJP+DSljuT0OAQh5XS
 pMj68V11TSFSueDstpqchDvwkMM1Kpek+fnk86xa0mVCBnPqYqXXN0G8tb/89lDqhtoArG8HJ/z
 td9fB6aCICc8ny6LQx4GDHe/8uX1ZEPJHyQS5WWUAn7JN1ExiPfHH5cVaXuCFrM5/aKtxSJRxVX
 P5iqhH5UEAXZHMvVxkVXMOCN0wnR94Pb+nr9RLoSrarThnhmxege+PBX9alAAenjUSOVPSFMO08
 Rz41dRdjbChqsN7DehA9vHG2ERJj53VI0vg==
X-Received: by 2002:a05:6102:a4c:b0:7a1:f7d2:e832 with SMTP id
 ada2fe7eead31-7af1d4b7598mr4743209137.18.1790684389489; 
 Tue, 29 Sep 2026 05:19:49 -0700 (PDT)
X-Received: by 2002:a05:6102:a4c:b0:7a1:f7d2:e832 with SMTP id
 ada2fe7eead31-7af1d4b7598mr4743192137.18.1790684389023; 
 Tue, 29 Sep 2026 05:19:49 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00cf868b5sm106688495e9.1.2026.09.29.05.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 05:19:48 -0700 (PDT)
Message-ID: <a721ccaa-57e2-4c22-8a56-6bab47c0f20c@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:19:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/42] Kconfig: Extract config IMX_GPCV2 from config IMX
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
 <20260921214710.29422-22-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260921214710.29422-22-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX/eh42SacUNT8
 HmbWz+LUpzpuslCPUnoQ/RnNSGv3OC7ElvRXPH/shSqzXHWcKbHMaDkK/VK0KtPuNnaKKc1/L50
 d3Ge/axDzaVQ/ShKa2o0AlYC/sQkD1ChEwGvQcF047ZjSS7liy/KlpKxoQ4kmo83kB0UwrMoViA
 Wlcv4lqOmzYdg3YGIbOmliESpbE7frOtFHD/kFJG47GKImyaALhXF4F/0BefbuCh94f69JMZuad
 MkEH9u85/AZZhFjKvWNlHmPDsJ13JHQg0CXQ39tby/xL/I1O0Sz71ZUoKTnfbchhuXvveRmlUPo
 +5aCOXnVLoYHHXEyweMVJwJbFvRTgfo6JUG2nJahNIAfG+csFtVg9fSFQbsT+PyUqzRQKMC1pER
 TA2TiDwns7nLewwNtCs83dgeVXHVWSRw09SoI8AcoM4V3rh2LdVf/ki93wIq0cZUFh0jMyN2fWP
 gxIq7exIw9rk6BYBvuA==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abbace6 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fGIzmx83PPThVkb3g6sA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: MW6XweDEBusB_KKxkXUO2NTUpeM-KhE-
X-Proofpoint-GUID: MW6XweDEBusB_KKxkXUO2NTUpeM-KhE-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX0MeU+Fcqvqbv
 mP02PBQy8m51DTD5FuSlx1M3awgENUUG4s/j2z/zkFTQUAuTgvcK3FGBeOczUNDFYQ8HmAYuIe4
 i+emE5BovP3/7CMFOPLDJMzsItEE3xs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290049
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

On 21/9/26 23:46, Bernhard Beschow wrote:
> Over time, QEMU has grown a number of i.MX boards and the monolithic
> config IMX drags in unneeded dependencies into each SoC model. Extract
> config IMX_GPCV2 to eventually eliminate config IMX.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/arm/Kconfig      | 2 ++
>   hw/intc/Kconfig     | 3 +++
>   hw/intc/meson.build | 2 +-
>   3 files changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


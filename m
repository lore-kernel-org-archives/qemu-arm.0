Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743D1C5DF81
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 07:19:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyOxB-0007By-2i; Mon, 24 Aug 2026 03:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyOx9-0007Ao-7y
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 03:18:43 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyOx7-0008JY-2k
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 03:18:42 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O5RKUB866810
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 07:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HlfoJVW5Q8Z22m/lXizZLeWC05ZR5cIkilEt/Wvsaug=; b=l8ajLSHr5ojKLNH/
 DBIiMi7GGUZlcRd7PAiORu6B49hNLg9HSNUCajb89H7ncV0ghAFiHws54rHz7r+J
 xzlqqjl0ySz/Tr7eejw9IlU6u7BtFaCEn6YoBIcbSBe+fEefTrPL3a7US5wV9iwU
 1XYvuiDGaCri8G4IS/KL8XgZ5+ngibWFwz2LIwMj9qCpBYRcROXYCSic5U1AtQHj
 tre7VCeAn7nUbRUSVtiVjp3DKbG66gvGpaPaRZs2LG9L06zcGFXXGt9VvJSBl/dx
 b8n/ODqkZfLs90181wiPBKpegkrjqb/4n59BEJWJeUueDLMHEqlHwUXSnD1VYjok
 mTgwpA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744qwver-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 07:18:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c1a97644aso40889801cf.2
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 00:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787555918; x=1788160718; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HlfoJVW5Q8Z22m/lXizZLeWC05ZR5cIkilEt/Wvsaug=;
 b=GaPWkUPN+a+8c8YqRMZVySTXyUeThLI+SlOgCEWAXE8WNI5aLGkKBe+znZ8+6gjW22
 hRwsCS6z53GxAIPEdWjhe6ekTtIxQ8xQV+V++zMvq70Js+yQIS7sRS0l7Q4Cr+zKY9zI
 dYb4VCw0qJVVpru55TqUc7Jx2DB6brv9CoN4SOCuuw1Xr/DtsPBdk2B9PrdA+YBdVZlz
 WMxShMidU5nHS0bEGVitO2QmilzdtUE+KuuYGoO3g7kSEpceyEG52hx49al6TKia9cGA
 MJdPbIcgbyqSkmLtvYiLyjZ7nKl1UUOtfG8grfhnqpcFbmF9UnxM2Dc/Xt6CdZ2/Jg2h
 SsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787555918; x=1788160718;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HlfoJVW5Q8Z22m/lXizZLeWC05ZR5cIkilEt/Wvsaug=;
 b=IhZeqHKRI7KTsKx+FiPQjErhnRr3gdIU6aGbabahJOCnMF1JwlrRQwc9oNouL2JVPo
 JJR6nc7ovYyFCup/P13Cf2leeEw4oBXmUmI5rYLH4gR9CUmJcW026JOwS97wtwoI/L0s
 my+S8zfLRaOYldcU1AIWrpX8ovqWzr/PsDhguwjgHwrq/sbH+GMiixz9T5b2C7qM4KJF
 C4HcH5HbjNz6vdIXcH5OyZHu6lZ9sGnohRcMiD0yLey6KfcFp11iPdXsf9PyFr36lNvC
 by3V8TUV0S9xJA8nQdJMEBHFcEYmAo1tCCdnxfSaxyM4IGcJknvr4V/2DLDCLHErtnB4
 yYBg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqGNic0uTLXNg5+b2GdQpjx/rxF+KR0r7JJi7Bimm4UhYPSDenpoiS+/JQUZP+6XL43JXUywtX0kg==@nongnu.org
X-Gm-Message-State: AFuF++mSO/mdjzP3IXr6wKJvGLvg3IYvs4O1ggzeF32jPIZm5nA4ikuV
 fW0ZSc6548rOkTcsJGxFuD1uxmdGDSdkly2rXj+eVSpjB1s6ZP9dpH/MJpdorni7O9U7Nqej2ge
 QCQ0pC32729QNUTomFmHtclr5zlaUZEjSfE1o5lMGZZJhcaDwADqHO1c=
X-Gm-Gg: AR+sD11FcNtt5dxOI3MxigpM4HCl5J42Nk8jdY14EMVYoKgZ16hX8GhDoZ3KwnB2yps
 tKnbliUjLfOQpsZZs3Be4yNlGxyai2vdTdpNFN4hZnDtpomyPYztUIH799pYWlqbCVmrOV2cjrb
 hl3q/3PbecYT72iApEUkXk41bKAA0rI/1IbD9OeJFaKOhcUrbDRas+OhPWtfqJFkH45BIw1djIb
 2aDvYFlO81JkZBUSo8xt/bLHQ3RqWeNsSoDJIE9ak0vMd/9lIuyPDOjnr8GBMtr2KrY1Nznlk+j
 NHYxCbTjWCcWh6ADvmo/LORQoLpkfMFmewYFadxBGiz4rAZEODILnjD3805ILhvptDGg1474fiv
 OdA9pD/dkNEAB8dGUtOB/rrlcKvTcyZr34cihKd5YmyVS
X-Received: by 2002:a05:622a:1b28:b0:51b:ecca:f2e0 with SMTP id
 d75a77b69052e-52df56f7dfamr259021581cf.5.1787555918331; 
 Mon, 24 Aug 2026 00:18:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1b28:b0:51b:ecca:f2e0 with SMTP id
 d75a77b69052e-52df56f7dfamr259020921cf.5.1787555917965; 
 Mon, 24 Aug 2026 00:18:37 -0700 (PDT)
Received: from [10.254.188.74] (132.170.88.92.rev.sfr.net. [92.88.170.132])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24966f64f6sm1164436466b.40.2026.08.24.00.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2026 00:18:37 -0700 (PDT)
Message-ID: <63e1e0d7-aad9-4b75-b71b-b233811dc94d@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 09:18:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] hw/arm/virt: prefix ACPI helpers with arm_virt_
Content-Language: en-US
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Xianglai Li <lixianglai@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Sunil V L <sunilvl@ventanamicro.com>, qemu-riscv@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Zhao Liu <zhao1.liu@intel.com>,
 Eric Farman <farman@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <17746591750@163.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Glenn Miles <milesg@linux.ibm.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 David Hildenbrand <david@kernel.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>
References: <20260823150731.896-1-luoyonggang@gmail.com>
 <20260823150731.896-5-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260823150731.896-5-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gBY1UQMJlkGiIKrhyeNDBgEkzk9VgkUK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2MyBTYWx0ZWRfX1bhUHqL9oNAu
 ruah4JAZToXjXRUbogIFB5mny9v6wMuxwLuxkVYP4tIZ7yhLFBct0E2WNkcjjhUYMd+d8BZ5sKr
 h0uS1LeSC6bZZFwwYCtXl8UGm74lqkkn4QlFBfwIVnXLwTB1IgU+/xVeh072/bCGB0vQB7Z6s9k
 l+1OSQt67Z/TLrG9Z2XERGQfitBbqP4sGcCoA1ouYA3Fkn0Jg5IVFr58/nCZQRI3B5ZNENzVDDU
 1mRkgP+rEzxM3/s/KMOOgV0Cge2uEcZwpb1OwsOtl1XBvSTsmqzhHqcU/joqjWey29v1G9xvbv+
 9J5/8sSF8DNhEGLgNbpEc85AZDfAu+D68gyj8N1GcY0ySENOWP/lf89X+ZpVfHuuwINY2X3YUbR
 O+fJrjhq03m+b+e+1RAM/YN6Y/yBnXS+LLxBwo+LidbNCqh6Ail5JOJL8C4KR9hX4Igyze16/gw
 if3KZ6rHeP30Yp281Iw==
X-Proofpoint-GUID: gBY1UQMJlkGiIKrhyeNDBgEkzk9VgkUK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2MyBTYWx0ZWRfX9qcFNCvjpfVG
 Cjn311jmegO3U+auqvLLVNghjx8IXIadGK/ouQkyuUqmOstjzqoZ5LoIXDULFVS8kaKpdCri/B1
 n8reoXdpq8BGcaTmB1C0BdP+PxOCUqU=
X-Authority-Analysis: v=2.4 cv=BNuDalQG c=1 sm=1 tr=0 ts=6a8bf04e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=k3i2zbviP8V9/5wfVjyM+Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240063
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

On 23/8/26 17:07, Yonggang Luo wrote:
> - virt_acpi_setup and virt_is_acpi_enabled are generic names also used
>    by RISC-V and LoongArch virt. A combined binary cannot export two
>    functions with the same C symbol.
> - Rename the ARM helpers to arm_virt_acpi_setup and
>    arm_virt_is_acpi_enabled. Leave the trace event virt_acpi_setup
>    unchanged; it is a separate identifier.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   hw/arm/virt-acpi-build.c |  4 ++--
>   hw/arm/virt.c            | 12 ++++++------
>   include/hw/arm/virt.h    |  4 ++--
>   3 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


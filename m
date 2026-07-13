Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9EEC44506
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 08:36:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjC90-00024i-Mh; Mon, 13 Jul 2026 04:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjC8w-000239-Qh
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 04:36:04 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjC8v-0002eG-3d
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 04:36:02 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66D6Nhxm648375
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 08:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kf3iIbCEzyEr1balvuZDp90CNghLKf8nQDmFP8uahq0=; b=WsHmxyZXHgaB6+DO
 tz5CaZV9K288njSzjwi7orGKCDZdI8MITy7C5p01SBAdZGeylXvqEGpXnBa1CjVr
 02ilP48fhZ0H17PpvsZgIG+urxkIfjORJsAQ0/ws/BryEw3VxVD2wzxvHme0OCV2
 NWWXyMTp4N4DPGxGhwl/zDN5zbv6hAhZJBfmRgTg59bpTMfQqvu6pXiOUWbO/kd5
 JJ47NBwssz9veLSmfYohzGnqmFEw4KRXGvKl9tOb5ERcm8pDBECQ2WSkxPJZgQcr
 UDTN+jnU2FUh6WRdEyudZNu2ipkiHXbVqvSnElTfmTL9wgGDbyHXzEqzjR/kH0+8
 +K7Hcw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbebr5420-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 08:35:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c20762d21so31425981cf.0
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 01:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783931758; x=1784536558; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=kf3iIbCEzyEr1balvuZDp90CNghLKf8nQDmFP8uahq0=;
 b=QXWKqkR/UWHs3H9HFGifih3C6F8IuYgCydKo6FOLRkZKW7jVsV8c4ff732jP0nO81W
 MGMRYC+JOhYK6MtQTLDZivds6rVMEalvmj9b37relp/9lRaaIWXYGF3sFqLmLSRgRm0A
 y581A3E6U5HG6wETySO/ZANiNcalSWUn8lXL2Y9spMMAYuvasBmXlDEUPw8Pcgcmb1Py
 c4jLb8rS6nrhkv2xe+/DM4hRR+AxLuX6Qdwb5Tu0sOoglAF8mw6q5n7YXtd51U+rF21N
 aYGzMyoNL40KFkxKUmN+AR5dp13r6HwXAV9MW6lxxXTQJcRU28ZPus4PrRNzTjwWp9XE
 v6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783931758; x=1784536558;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kf3iIbCEzyEr1balvuZDp90CNghLKf8nQDmFP8uahq0=;
 b=O2jJcZQKpbY58HJEGmSBnAooP7rxsZ41/0gTgnxar+6t6/6+6Y2PqNd0GBywA4P7Cf
 qb/zV7pG/Gd8DdEHkzprs6k++oXzu5aKiIckTQjC3YNPBKD6T94dC+LfuDibXrGa7bCF
 CQsoNOK3X3Y2/iHYPqZlr7NlhSTPPvH1v0ceKwmPE7Vkn4el0lUUB6viP25jC0ibFlnY
 qr8W1XsSxj3dqoxP05MwQFFAYGuCmhzICBlqpRa7GRvIgy19AGGb1hLH0afgfTxgVFC4
 biX6b6KWHIb7QFY6/CVE3bo6QsxMb2+fqBVN3c+FRyyeo70puplFoUmcLbf90ii3oEFB
 ejxw==
X-Gm-Message-State: AOJu0YycazkDIYqsccGEdEhVN8+C37omZ7hW/qK7mtalZT/kk3J8Xmyk
 E5Fq5dNRUTY5hdciGedzz6Ptwhx5HN2ZBtR9CYxnpv/M6slWduFWXXM3Lgmzj/bmpzc5WpF+YCc
 J2bFbwKNYy+NVStHQrWsVctXAugojIk2VxCLq4va9b5co+albyJYL94Y=
X-Gm-Gg: AfdE7clHH60FxWjY37wFB0GR61eTvamWuQ90Qt4sR2X9eLeMNUYMmeyX30RFiaEfXnu
 TTo8orm1S36d+14tD2n0lYMNwWm/jqNtYsu88b0gv0goI+yCP7XshbQsbrV3N7SJ9H8Ha/Odzkm
 OiVkz4ibWbZcmAaKgK+wDEWI76TCd3F/Vv7KceLUMy+uF2vWmTt7SLvWW0lGWNAepkRaZXq6gTV
 OIvgRQGIPuKabO7XFG+AuYkchp/vXdupsJruFtbMxv6bge+vbECGBjqS/Kg96Vd9Pjaot52Fzi5
 +3NVTG+xE40Vb+pnIJ2CJ1S3y4vLPMezQCXjmllVeQErckj43wN/OPTo/hnH07wehx7ToQrPw2g
 0krPRPUAckX6KZwqb7ndjo/MCaQv9QQ8ksq3olMxsY+PA1VDQyjNl49SwFiGC9g==
X-Received: by 2002:ac8:5a92:0:b0:51c:2685:2952 with SMTP id
 d75a77b69052e-51cbf27e709mr79447951cf.62.1783931758347; 
 Mon, 13 Jul 2026 01:35:58 -0700 (PDT)
X-Received: by 2002:ac8:5a92:0:b0:51c:2685:2952 with SMTP id
 d75a77b69052e-51cbf27e709mr79447701cf.62.1783931757906; 
 Mon, 13 Jul 2026 01:35:57 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c15ad84483csm983969066b.17.2026.07.13.01.35.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 01:35:57 -0700 (PDT)
Message-ID: <116260cb-e46a-4ed9-8eca-a39d0a68b29a@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 10:35:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 084/134] isa: Remove *_orphan() creator variants
Content-Language: en-US
To: Alexander Graf <graf@amazon.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Song Gao <17746591750@163.com>,
 Aditya Gupta <adityag@linux.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Farhan Ali <alifm@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Felipe Balbi <balbi@kernel.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Hendrik Brueckner <brueckner@linux.ibm.com>,
 Chao Liu <chao.liu@processmission.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Helge Deller <deller@gmx.de>, Dorjoy Chowdhury <dorjoychy111@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Eric Farman <farman@linux.ibm.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, Gautam Gala <ggala@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Jan Kiszka <jan.kiszka@web.de>, Max Filippov <jcmvbkbc@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Jared Rossi <jrossi@linux.ibm.com>,
 Tyrone Ting <kfting@nuvoton.com>, Frederic Konrad
 <konrad.frederic@yahoo.fr>, Laurent Vivier <laurent@vivier.eu>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Bibo Mao <maobibo@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Glenn Miles <milesg@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Halil Pasic <pasic@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Samuel Tardieu <sam@rfc1149.net>, Bernhard Beschow <shentey@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Sergio Lopez <slp@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Ran Wang <wangran@bosc.ac.cn>,
 Hao Wu <wuhaotsh@google.com>, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20260711223707.42139-1-graf@amazon.com>
 <20260711223707.42139-85-graf@amazon.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260711223707.42139-85-graf@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4OCBTYWx0ZWRfXyCFYsi+Va+mu
 RdQDQ7cqPIHVl80W/3ICSGStCkWUlz9240j4gDxRGXtXQDdDjYRkrN1w3t/WC9SoNyjqqt83YJC
 I5r2dHtzvcTL2iaEn00N7rBmXmxY2fw=
X-Authority-Analysis: v=2.4 cv=OK8XGyaB c=1 sm=1 tr=0 ts=6a54a36f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=vggBfdFIAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: SQcyLP13WN-_2ObePQ9zBHBRtbCwYzES
X-Proofpoint-ORIG-GUID: SQcyLP13WN-_2ObePQ9zBHBRtbCwYzES
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4OCBTYWx0ZWRfXx5fhOZLCqqwB
 i5D8JM0stTFHsAZB3mmFCUl++z5iibCnUOFkwX6TqGXHTw8rR6MHyVmGwTggmDzRn9kUDfoLv75
 UpKwxwTqK51pzeCwvb4oUtP3wPxYHFxTYdW0GqPj+WKp7ufgAWFfvRpv6GoxtX/bnH6GMfV8ALD
 iL62Wx43C8RK8s2NKGiAPVwDqUaiV0It+FzVB7QD1c7EOaLxQBhGDFbGPmKH9YKAJbSeMevGVBr
 S0I4EdcK+AIV34W070pkdvKME9jAxe/ykXKqVf8VCl26v0sTQeWwt6q6BM3WirgGr2kHnIsf35i
 2+Muyo1iUahh7HqhMNuvIYAVMqJ7CI+Jz+4D+/x89F2rxnaHkesFgzdU/VX4TKCOAByFqShd84B
 iuqjaxLvw2VAXfsMMPBc8szaSW3DG2eySTOJ4DNiL3VvHuQbtT2L0D9cg9wrLci458Dl4ichzdj
 /1T2tRGvo1Wwdq+4L7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130088
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 12/7/26 00:36, Alexander Graf wrote:
> All boards create their ISA devices with an explicit QOM parent
> now.  Drop isa_new_orphan(), isa_try_new_orphan() and
> isa_create_simple_orphan().
> 
> Assisted-by: Kiro
> Signed-off-by: Alexander Graf <graf@amazon.com>
> ---
>   hw/isa/isa-bus.c     | 19 -------------------
>   include/hw/isa/isa.h |  3 ---
>   2 files changed, 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


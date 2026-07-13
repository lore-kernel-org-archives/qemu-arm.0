Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F0BC43458
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 08:37:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjC9l-0002pA-0Y; Mon, 13 Jul 2026 04:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjC9j-0002fd-Cr
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 04:36:51 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjC9h-0002jU-CL
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 04:36:51 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66D6NcWF469173
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 08:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qHGhBTHB+bAm0nSSXXim2etiXX5UkncMiwLS7q/k1/I=; b=Sd0M1OvJYsGLPdZD
 YxOuNSUSTqA3wVyrhiYZeUz2mJpMNPkkSVL9po5/yX3tI7M29BZANHcFrCn7lYOj
 z6W0lYUY2iLGLlxuaOiVEhC9sbvUURbJZgXt1xhVK2YVKD8cL4oGNggssmccdUzZ
 x6ABfyXC92rTQ7S1L0KKvN7bOLR4Stf50WN4/BTYLk+vsWwogPsCLY0fpYEC0hkO
 e3XfWa2MTx+pouVverBEgBHR8QwHeF6UvvH6ULBqgWgDResO4Hc2FpXEyIKBFlXi
 GSFwPRrlp+403/sBJT2Y2aw0Add6Y/7RaaTmGX5we0mZHIYNTqVlPMsfcXvUPstO
 IfNwiQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf48579q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 08:36:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c0d6a2f4cso39918321cf.3
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 01:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783931807; x=1784536607; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=qHGhBTHB+bAm0nSSXXim2etiXX5UkncMiwLS7q/k1/I=;
 b=ECOcVlbwPTL9/E0o+zNf0gocZqTF7MZTS408+hSMcP8FDTyxLbICdaEpdGovlG5vUO
 sZ12vlGwtSNSrzlS75KVsj6iU+JXKTXWa4kaZ4Xs3VtyDplcmS1rf+gY68x2TkgoZ80B
 xuXLxG6jTX3vfvekquvf/TGYjWw/extZn9LkBdn8AVfI2RelkYFj7DCFdjfBSgcN1K6L
 ej8Lq37/cIIRGvIwp0kSHyzGytx2mrYNay9XbbGQdF2Pmf2Nufd0gQyUVf2tL+Dwl1Dz
 rbaxpVLx5ST5qhPazonhkfu1zAljRSr1GnWECnjANS67oZ8XJy7M6ux4rQEDDJP1hmVo
 +x4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783931807; x=1784536607;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qHGhBTHB+bAm0nSSXXim2etiXX5UkncMiwLS7q/k1/I=;
 b=XRwrWWtodd/iqdBsolvM0nwAbS7Hto3AX+1enzSKF7AEVxF3HN58bUmEIGPgvf7RbP
 pHVQMrV1K43iIgri/Qv7DCVsncgc4w81g2xcSJp31RfvSjmWbSnzn2SIIuDfEIFx8z/4
 AjVoVwjuBILwt7YrqehQulMdZHYdRYz6TshTm4CygM7FsyStp8W81pWAGTlbn+CCljPK
 SsC/JzfkTf4bgPYEicWNufO00L0Zdh1+T9jOhiJnpkkWHKVlBUTQuviEKYdFbkRQinRe
 L7eWJ72ETpdqRj/bIWtovNkx2CrG5/m0ObfU1lPxMLJGWEaeiIMKNPB4cVMlTgGKpbdx
 kgSg==
X-Gm-Message-State: AOJu0YzqFkfQDZ1kOVIf4QXWuDyl7ljOgqEYoF6J4rVcfk0gWybadaeu
 XwwbfE+stTkUmVjdV9TiZX6/zIx+Hw3z5D7J/N0a4JU18vvp4Vx5r3/593xY7ZW52i3FRUcKumm
 9BSSpLEA+t8PJw8kkXGbw6DsCHSG7mR6+pXoPkaMvehGiL1gHnR5dzHM=
X-Gm-Gg: AfdE7cl4uMWI7m0kQYxs6z67/07NxdVniBG5Qsmxoz0a1Kuo3MwG8uAq6vti1qaLZlc
 gMdIAUYVWVoCAfhxaGyJjPVxil4JDwSDHb4LeeeWDvM1+R6V94hYqkTjXThb7NYKq/LWBnAGRkQ
 WbYQ58TMQrZo65KMH/TIZbBWR4DNUc/H6Xcj/POonmzw3qwpimjvRbaOyqk9P6MkDoNGDsmBxUZ
 WHtVTqhwhu0nP425SjIshtCy63Y1AO/QoMOZn5fmhx/14rhDgE9YIDpmq/fX2J6XSFgVrD50J7f
 ojhiGHdYwzfNm+W42Bt9z3hQAfKTbUsD6HM0TS4cqZ5/qAg1gF8C52kI0YoQhYHmOxznCOzUeBk
 eOhm+ppYzB1DJkn6/a/UYSw7yvGnoUqqsGrAOqBdTdMNOV/3S+nUnRwP1BOL4QA==
X-Received: by 2002:ac8:5ac1:0:b0:51c:9193:fd9e with SMTP id
 d75a77b69052e-51cbf067fbbmr85518371cf.15.1783931807040; 
 Mon, 13 Jul 2026 01:36:47 -0700 (PDT)
X-Received: by 2002:ac8:5ac1:0:b0:51c:9193:fd9e with SMTP id
 d75a77b69052e-51cbf067fbbmr85517811cf.15.1783931806583; 
 Mon, 13 Jul 2026 01:36:46 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1e6ccsm84044499f8f.5.2026.07.13.01.36.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 01:36:45 -0700 (PDT)
Message-ID: <844669d8-12ca-40f1-9f2f-f09409ea45c4@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 10:36:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 087/134] sysbus: Remove *_orphan() creator variants
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
 <20260711223707.42139-88-graf@amazon.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260711223707.42139-88-graf@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4OCBTYWx0ZWRfX1t68Hd8ebN4v
 Xh0FiZ59kF2SyVeAVFdBTJaUZtERaylJOG126yoHDMSoFxmyF8JHD+bhzqASNMPm5vE42SYAhp3
 M4Xw8r1mQ2Lngv/R67oc2t1cMbq2uLY=
X-Authority-Analysis: v=2.4 cv=OsJ/DS/t c=1 sm=1 tr=0 ts=6a54a39f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=vggBfdFIAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4OCBTYWx0ZWRfX7R6UZz8Ryjwu
 s7IGvi0Yu2yU4CfvdxgpoMkf35YRtNFYcmLPLhA8cjOOiraMe77gt/mZLNI5YpawpEjb52fH+5B
 9vGBbcI183FtIdy37UR8dOkuW0lOK+5wVQcWRkiz0zMMSzXLP1snopNlSd5t2cu1m/bfJY3JnOY
 64FWR/8N+Wi9EFyJhPCy+7va4EhfyXjQths93yA4zm1z5XU39O07r2a3Lkg1eHmat/loi4LF+sh
 gf2riRmaXmlHDUbDe/wrNEJWDd6xb8mL0hqUR1BmQpSZzqur0qxiOWXDIQyHLbYRbgpSs2xaLew
 1uwESidOiYvSP2pXplFeJevRG4ryceL6ZhtvoclgZjHGe/u50GFBaOjUPuN0QM1shMaTT63n85p
 3M0LYsxx5E1lgd0jYPWFsXYdHak7e9s6aqk0GKQ0Rax1BEkDNUXIDALMXu/W1/58ulIM1sFZWnX
 +Y3CiDvwo4UwU/enCQA==
X-Proofpoint-GUID: 3hhGEnZctABTFfLutPmxtvYreqrR1vmD
X-Proofpoint-ORIG-GUID: 3hhGEnZctABTFfLutPmxtvYreqrR1vmD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
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
> All boards create sysbus devices with an explicit parent now.
> Drop sysbus_create_simple_orphan() and
> sysbus_create_varargs_orphan().
> 
> Assisted-by: Kiro
> Signed-off-by: Alexander Graf <graf@amazon.com>
> ---
>   hw/core/sysbus.c         | 29 -----------------------------
>   include/hw/core/sysbus.h | 11 -----------
>   2 files changed, 40 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


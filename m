Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E4EC43458
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 08:36:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjC9G-0002B4-NP; Mon, 13 Jul 2026 04:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjC9F-00029z-LH
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 04:36:21 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjC9D-0002gt-56
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 04:36:21 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66D6NuLV568086
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 08:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pho/1HjVTrTRFZpF/Eg185BPq6uLynSoK4ool5fkEec=; b=bm2Kaqc9kbMlyJT/
 djxFKpS51YIapV/QYpU+L/XffhFApiR/CvDxul3qSarCKsJ0F5hueKnSCfxG87wq
 DaYayJAWciWLbm2B+oPxH/kFRGB0Vccqd9J8NjxBTr5ptAOlpwDTHjB4FMk2dsEN
 Xi+enY0x7zksg8qN9PtUHLCn1KVKmWw5woe08vN4Euw0Q3VdkC1mj9wiqf96h2sP
 GbTTL5eayx8tOyCsrSGncCqSuqu2wZaCuvCkBrHDWQ9AK/DEB+0Mkv6J9rXmAVvs
 ZL+aigqOsZ9uh5RVY4vaYhA/wZeNGa4J0Q1o/ctchbnVw53GsEeHHUik1fpgAur/
 NGMb1Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe9157gq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 08:36:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c1a9764f0so48428921cf.1
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 01:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783931778; x=1784536578; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=pho/1HjVTrTRFZpF/Eg185BPq6uLynSoK4ool5fkEec=;
 b=gs8pd/C92wYRcvhDBigrSGSz0SCoEcmZNeVp4o3RYHzELHvYSR923jLOgxCfr7lOPc
 ePG/kROA27SNKoHGBQJnHhFtlx5IWEgaYGm7zMcfChsVvysR6ciTP17JuBOldnlgCM/8
 QI61ZgJarT+OEgIaq4xB5YFenlUjI6I//Iqdti9S+rGFdT9TQqp3N2uprCJOv1IjiZzs
 CahaP3jnx+X69e0qyDJbgEeHG5uZD/d4maaNa+5yy/Ud+ulK6LBSjqbHjQYWzsTiMZL1
 BaIaOb3YfaS8AaQhAVHst09u+qQslzC9r/xGFV2LrKe9cZnvNw/YJ/W7/gPwmMuPbmlc
 cwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783931778; x=1784536578;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pho/1HjVTrTRFZpF/Eg185BPq6uLynSoK4ool5fkEec=;
 b=fqSFs0A7sRA+wFLGRbfMfbUkqGBz7PgliNwnkQjR2Zr2HfjyfwjmU9jwh8+wO0NhFN
 PVlFO3NmW1YJk31gxRGfJYk6/Au+D7xl34Y4Se9HnL7pwbV6UhIsx+QTJbz/kaGwAlEf
 3ZPQ/X/9jFY+gVNaxFoH70gdXrtqOeS2l4E8sXm7XTj1iUUSzVYP+YQrbHFQSE4BL9om
 VL4bu36Z4MCU5frSVpLF+2eidTr/TjQalYuk9YBebNQJIgJxpBEL0QW7s93r/aDcjCMT
 Rm5boNoxxz26cGuCt80WEB4x7xHrPKlk+9t++QFFFW5nxeeETxeTyS3drMtdO/DEtGo8
 l06A==
X-Gm-Message-State: AOJu0Yz82F4MIBaN7y+KVh11qB8yZlubBPojAajrzO0UaJplkQ88nr31
 YOT8/3FVCekEkpQ3MB8r+ICCQhngW6tcXhFCOcQ1xITk8Wzz8U3/RhLCXXWkXpzhfAyT9+hrzto
 0cMR7w/x0pPaeoMlw1IaPPg9036O1ZLdgqF0T5YoR5g2md5XyzqjuQg0=
X-Gm-Gg: AfdE7ckRLhOj4yldjBXkg5+/vdmsIYzKT10I7ayOaUjq+YxQ4rbWtKwk7vn4gRcfGQG
 MCWipbUJsncBgKpDot/Ldiinc78LWnkjRn8Fh9ReNM/AXWakY/rE7U3DtHvCBHf8rRLnUmtrsFs
 LlmENjE0PodJm/Uhab5VuJEBaFiX9pv9Zr65RNtfOec+b7p81LB7skcKp0+BH5AbhR9LBHmGK62
 vShQuhv7+bCdxNFY0ZkGAWk4zmFV1JJCI8ulg/s2DTE886ssEqH5z4o1g8XM5Rz6YIfuLFzsjEb
 GHPTYSmZS92EGYovNCk8HcpGgGMgQY+2mIa9jnG1FZbd9WxH2ZDzGsvLwhzRJLZnzFgnPSMG2mL
 5/n5EbfXHW+As/vnZ4wniQ/GSmHo7aU0ULq4vUD8TvSkwHd9jroEsCKwcJ2X19g==
X-Received: by 2002:a05:622a:4290:b0:51a:8c9b:64a2 with SMTP id
 d75a77b69052e-51cbf395337mr79147741cf.70.1783931777622; 
 Mon, 13 Jul 2026 01:36:17 -0700 (PDT)
X-Received: by 2002:a05:622a:4290:b0:51a:8c9b:64a2 with SMTP id
 d75a77b69052e-51cbf395337mr79147261cf.70.1783931777230; 
 Mon, 13 Jul 2026 01:36:17 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f373csm577217365e9.14.2026.07.13.01.36.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 01:36:16 -0700 (PDT)
Message-ID: <09dc819a-8bc9-41c6-a7df-8e684f4b7d3e@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 10:36:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 085/134] pci: Remove *_orphan() creator variants
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
 <20260711223707.42139-86-graf@amazon.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260711223707.42139-86-graf@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a54a382 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=vggBfdFIAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4OCBTYWx0ZWRfX+VwwdBKwWHp9
 UhxLQZZg2xJyxNuSGoM4zkKtcP8MtbhHqJCRd/QOxo3qqltLhPq4tHOhEp3wHA7eqsC2GZuzqWr
 V+wIOfHd7DiotThxK6AIrPLt0GiPp2Q=
X-Proofpoint-GUID: JKYuw30iEdaC7usssAcPamh7KQADUcpM
X-Proofpoint-ORIG-GUID: JKYuw30iEdaC7usssAcPamh7KQADUcpM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4OCBTYWx0ZWRfXxxCQUyzuF22C
 UEP/04ly31Vpy9gppdmr9hgJTHhfVVDeCRmTHoj5w4I8EQYk+WW208upRfVly426wmDIfChUKN7
 h0Bio8KkqAVIR0/UAB47K2spQ0cIvuHA5HrFFU/e+xwvs2jgcRPQ3l5Ma+r7upBktr4OTztU8As
 CvWLgM54TVLPq4vKuBdUcbLsggXoygPM9k8QT1f4j74J+iXdIgCaJTSJCcttGbfzHiTmttz1WFO
 kPdhrZhjsHhOMs5g6JiY5M2nQyDi3/o5n/9lQPctljcr+UUni4BtgTEdyzK6cE7Cvt/zTvS6VvQ
 44zezg4U9lEPWTiDLJNXzqyuNRrGCaR06ypO+VahA3StXsHTXfxUFdMzOhUC9542bMnWNQeZxSl
 ElE4SQmJp5H5hIHF5RtxiTCxyBafG/D61p19KFZVhp0o5kZXjk0BTn40wETfyElB8m6lYTaW3UZ
 HX+Sn5hiisSsv9eooWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130088
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

On 12/7/26 00:36, Alexander Graf wrote:
> All boards create their PCI devices with an explicit QOM parent
> now.  Drop pci_new_orphan(), pci_new_multifunction_orphan(),
> pci_create_simple_orphan(), pci_create_simple_multifunction_orphan()
> and the internal pci_new_internal() they wrapped.
> 
> Assisted-by: Kiro
> Signed-off-by: Alexander Graf <graf@amazon.com>
> ---
>   hw/pci/pci.c         | 35 -----------------------------------
>   include/hw/pci/pci.h |  5 -----
>   2 files changed, 40 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


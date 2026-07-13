Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3832C43458
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 08:35:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjC7l-00019W-FV; Mon, 13 Jul 2026 04:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjC7g-00016O-L5
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 04:34:44 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjC7e-0002Oc-Tj
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 04:34:44 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66D6Nnx4469617
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 08:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZfayoF6h0gEMs5Oj/ezHzYISAfGTqjGOW2uBvn0x/OY=; b=GPKUaqPCqmLLy2yC
 4ZcWwRdatVZA3rXPyW4D8F6d7WRgOZXHDyEV0xIU67hJ/EzEG0K9OXKF+YvvaEg4
 3WmXo3uFHOhaaIMyYwPqE5pj7cZOyY4VTKaKz8YBMz68alOB2l4nBJYtWwRThSel
 ToBMUjNc0Un1fLmQDQnLp5aviS9Y8wk5TofbdpS21M27kZB/Z3kVjIyMT6bR7FNy
 TWCs8v28jsugP3WDPm74bUTW14PuGLsurbnPWckAPnEYg7ObEc6ho2CvXmErklxO
 I29a+4uc2TXUmXrBBCd2zurfDF0GVKK9VCyE8K1gREhLxSeDAJqu3bLQXG3oOu04
 CWzBsg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf4856x2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 08:34:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c1e6f602cso57898811cf.3
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 01:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783931680; x=1784536480; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZfayoF6h0gEMs5Oj/ezHzYISAfGTqjGOW2uBvn0x/OY=;
 b=EuK551pV4kCxdoLgGlZXPCULrV1Ub2qLTg+bxSEx3JUKXgtReGQc9aupnSyijw5CcH
 aQNwB30QS+rpK/m2DgxtiRIll7215tvGwkzf5F9NINOuKdBY+Ka3iSoOCMy5ZqiU+riU
 AMxdceN4PNAySvULV8YYyIv17nTHWhLiXobYiXeQ9y10qix48eEdAu7XyzxmTzTXC7Kf
 WfpjrSvZLIERPOw6Ykc7U8mGXTcA3bLqy0/4MER7dSYQbbeMZq1MlnK9LJnJkaMU9+eB
 eWp6payWbFyEztQ4NpB4Yp7TGD9dhACgH0HEtjsifOFqzFAQWeRsCgnZdMg0EveHpXQf
 6x7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783931680; x=1784536480;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZfayoF6h0gEMs5Oj/ezHzYISAfGTqjGOW2uBvn0x/OY=;
 b=tIITXBLC6ejUFZPIqCW9laV2Wouk0wEuH0W7oK9RR7apU4+Ryd659iG6gylp2RIchk
 VtwGKpf/EZ00V4+pchPwB2boOrxe5Z3ScVbE6YvrBeDJOnKMDEIpI9KqcSUZQpP0Mug7
 FFQANXw8bM4RheIXTlDf6rHomAJCoHiYM551P1ROPQj8C4poW7AefTEXGOtlkUJU7BWk
 wtQtch49Mi8FDZ1LHZv+pR3y2V15AlZQOkegYtz+XjjugN+yt5NHruW37XHo75frzE3m
 HADoL23dPOnqiGikd+9BYdPQbRr9dto+nYoHa/P1kT2fSRZZxVYN6uVUjp0iBB5SiLbs
 iJVQ==
X-Gm-Message-State: AOJu0Yw2vFUXKwkKR3eiL547d4GWl2PZeEis3fV8NKsB4zWV8JGMx2/K
 tOcqx/DO5yCQUAIGfFZOAFAh1qFkgU2XKIwM/EDTA3N0DvSJ61zaXpLEAnOSMaOyRE0liw4NK8X
 +IWaBT8lpPz6jKrB546HmShtXq8WKVDvyace4s9sstMflfyX8Id7VRec=
X-Gm-Gg: AfdE7cmC3dppVVYCANhoZ4K3RdGGPeSBJeHGd0EV4ojQpvQaELPFC3nsKbnumxGHtpf
 vcXu5JMACZ0DhiuAONi0vDFq7std6JUfpZKrDwSgNkLAtPYoGDqHEyzwUNhZEpoglXJCKU25G+u
 M8sFE57lm+cQHKVVHPuFYdZizzAzyZMG81gy8wDHpc5QoY1vJLBJN/oSWKnh6o65DHt35Yq6wG9
 fOmxYnYsvglRCFuDgneLgyahSkgBCo3I35AyLb6Friv2wq5RJZoX0hCXLYvi7XTg7nr7QmyiIRU
 TGBqnjnDatlQtCtMxDe+qTFXW7iNaoFYm8rR9tEWsZXK9sGKvB5FBj7KOdQ/559EMd10XwLitIr
 /1lyOy1jVqEWnq6sJx86OS15l7EkDT3aqdHUlo+IyFvUghezyI+iG5mSQYezTiA==
X-Received: by 2002:ac8:5e46:0:b0:51c:11ba:c51e with SMTP id
 d75a77b69052e-51cbf276df7mr77121611cf.56.1783931680101; 
 Mon, 13 Jul 2026 01:34:40 -0700 (PDT)
X-Received: by 2002:ac8:5e46:0:b0:51c:11ba:c51e with SMTP id
 d75a77b69052e-51cbf276df7mr77120881cf.56.1783931679614; 
 Mon, 13 Jul 2026 01:34:39 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039b0cesm85877122f8f.22.2026.07.13.01.34.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 01:34:38 -0700 (PDT)
Message-ID: <d251c63a-b9f9-4c63-9068-bb7dd4f23d82@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 10:34:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 074/134] hw/i386/pc: Give pcspk a QOM parent
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
 <20260711223707.42139-75-graf@amazon.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260711223707.42139-75-graf@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4OCBTYWx0ZWRfX2DluXqDudwXT
 jce7x6n+B8FOm9ZEpKqp3bQZOUBR+Fob7yessTIVmvH1iJreQuOQLeTHw/6TUIb++YlCKt4CnZn
 CvxqsXl8Bcc1S7xdldw0l4DCs7B6j88=
X-Authority-Analysis: v=2.4 cv=OsJ/DS/t c=1 sm=1 tr=0 ts=6a54a321 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vggBfdFIAAAA:8 a=KRBWy9jGwUuiBBz3GDoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4OCBTYWx0ZWRfX0C0PO5qGLLkT
 d7WOW+6nBzwW5+5Eisijax4vr0b+S86trIAlbi2JzmGyLjmAK9ahgcEzY/RB993jho4wan3aP0W
 p9GD/4T/gkiJg7llOafSzGLtkSceG1cLLrbgy0POsBAaojWPb770QzZ80mXsrYfiskImWLWBGE9
 bGnLcLibf2iLGhUoz2l3cLjgBmMsf7+TShfPokNG3NJssbf7+jZpj0xMXI1YAXIGY2dEr8CsOVn
 +FZWDpqu4GnWzKIIUrjLmjicfm//C0vu4ds9Zcq/FQ/nR9/HpcKcmuoj4Nra566YLffLaqQe2fp
 GMTsEm03C/lZYZLCMHofsq9YvljROMSfEqn5eTuPhOE1jPFvDGJpPjoze2EEPSfCaKFtNQW7iti
 FysXdBh9LVKCrl3dDFOCWdUipjKfYIdQQR/Qbg3QhOtC2RaAVgFJocwvwoEhO680bu0O92RXUCt
 wpOpjylqn4gqVnAcPaw==
X-Proofpoint-GUID: n00ysPp_NjFBrpcx3tAgjzIIcyc9tV0C
X-Proofpoint-ORIG-GUID: n00ysPp_NjFBrpcx3tAgjzIIcyc9tV0C
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

On 12/7/26 00:36, Alexander Graf wrote:
> pcspk was created in pc_machine_initfn() as an orphan and manually
> unref'd in pc_machine_finalize() when the machine was never realized
> (e.g. -M pc,help).  Making it a child<> of the machine at creation
> time lets the QOM property teardown in object_property_del_all()
> handle that lifecycle for free, so pc_machine_finalize() and its
> open-coded refcount juggling can go.
> 
> The realize path switches from isa_realize_and_unref() to plain
> qdev_realize() because the reference is now held by the parent's
> child<> property, not the caller.

Nice.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> Assisted-by: Kiro
> Signed-off-by: Alexander Graf <graf@amazon.com>
> ---
>   hw/i386/pc.c | 14 ++------------
>   1 file changed, 2 insertions(+), 12 deletions(-)



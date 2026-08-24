Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E178C5DF94
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 07:22:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyP0r-00023i-Lv; Mon, 24 Aug 2026 03:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyP0p-00022e-8P
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 03:22:31 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyP0n-0001S9-Jt
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 03:22:31 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O5RDtI2602031
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 07:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3hiVGH+fvNIawtlBzDnMnII7Cia2g2ObuQbvc7IiBXo=; b=hK57FsN/JUFwPKzJ
 S2b57K4YhMgomfLXbMpYXcwJZ2ryfFzFE7dvTvs2lhnEccwR1PZMERsZc0y8VSrN
 dmH2Ut+MoKA0TZdF2LlD8ykI4VCrG6RyG3x1mhurbBaZ/s58VbN1ppZ4gp7JEvnI
 NFQI32sWR35oGsypxkww1UIwxhh/ZlqZ70GvA/lPMKzqpIw8pRpFDja5TxTAsEgQ
 0fXpfswHQI8tayN5qzmUwvKDi7QQpJ0a0DKKJkkTbhrxcdZIvbfnBstxKKNxxNxM
 wzI82u7ai4VgboSfQPUxQkk5Czt8HQjPwOmh4TuVGRpe9j9pEAy08EN9GE5Tkof0
 ZaeL4A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744wwqjd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 07:22:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c1d7886cdso64748491cf.1
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 00:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787556146; x=1788160946; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3hiVGH+fvNIawtlBzDnMnII7Cia2g2ObuQbvc7IiBXo=;
 b=e84zSpogH0+wQwPHCHuj8PWcUsx4XAlm83tdJ01iwtEs6IRlkDE9Cxs1AembuXTjtg
 DpLAJD8IgHnTGmDvtjDMDf5DHXd7YS+/SiyUuL6+I+mm/uPV1HC+bGoRMBsFEgtqx2Rz
 oR2Rdb1xsYFN6nmdO4Hr3zJZC133ijUOubHmB+51W/e091/GR//btMS4ap112d9H+Whi
 LW54/WbrcLdduJQWbMHsSjl8S3necFahn6jslHseZ0MJLXBCSgeE/WX5Hw7dJm77as2y
 YZlhX4HxFT2RypQzTlFJFMYesxlVGqGQMaSIzvSEitfxHDalXfhubJ5a+q5WnsFr680C
 O/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787556146; x=1788160946;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3hiVGH+fvNIawtlBzDnMnII7Cia2g2ObuQbvc7IiBXo=;
 b=go4FFUTimgfDkK8ewdQQnFIewWEhs0sXqP3T3nPcmN4Xhl4k8Hyncj2XpgcwUqO3fw
 0OKT0RHOIO6zIEM8OmlGIem7AbY8QY1s0oK0ioMcvIRqdKey94kNhWn0QIORcun3RUZ5
 m1oyWu8CAWMm/7YwDtCkYM4JcnTXD07zCrEscMjv2twaN6H+9XAso04HlhYC5F2JQPy7
 VA6GHExe9QbnQcXpcKnLOlcWfGG8UWQryswkbSeJWpUOvDmeKpEJUJNNOpEXs7iroU6K
 ltmOsbIA3zoGpijEdeBLCH7JBew3wHiCaGJSnmgMW7yyU2nhDtmk0HqMQPP4Viq1bhfr
 vzyQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp7qzTcpQQdgNN3iJxloqDrhNbVh5AO1iTh2Qu/7JV0JwS/PLMBfPi3i9UeO2pIjJoLzgXbEPGjJg==@nongnu.org
X-Gm-Message-State: AFuF++lSJc4RFXaj1oWqY5u5rjmIUDZ2cwsVYNxw9TV5RsDFyCsb91GQ
 /NU5mU6IGkJJ16S3L1+VkkFDVoZFmzjum4zxEe9hrBRaPAkrzV+F1E1ORDm0pEcyrJ+JGzZbdwl
 1dyEkfuLL2PyetAYH8U7t7zrRjJd3JZSTcPItCBrlDLuTYOMj8/7Wnr0=
X-Gm-Gg: AR+sD12tr8qczVdk0FnonQNNHykkWudRyVyZctdxCdvfrsVo1+7DYT424nof0lwdNxw
 1R4soJIpmZsCCFfqEA64k+uMoaCT+ftKo3pz/dwzPUB2tIrVWTZFyJhkDFWc1A4RFoxtmqUf9tC
 5wctRpgSummwjrkfJyQfv8q+W2zcpzhgVSNgRuRBZ/w5BHotqd9+M3g3kv60JwcnmJ6z2JG1nEJ
 YBXuodtmG+MDP8iE7HPDRlFoX+Rl2cDAlNNSN12km24jjnMMdaEFugKy1LDw64vrHZSA+1ligVz
 nUcBsEIOEzLDNedk5DA/mIDLRbsVV9njjfbEykh8Cj41tTbJl567zg6YCrb+q1iFMWj8j5na+Ku
 +tK7+pKdnRFwQn6np09QlAmTmcgvSakHjnOLn4uKfH8dN
X-Received: by 2002:a05:622a:1188:b0:52d:f001:5c4f with SMTP id
 d75a77b69052e-52e09cac8a3mr144160571cf.20.1787556146143; 
 Mon, 24 Aug 2026 00:22:26 -0700 (PDT)
X-Received: by 2002:a05:622a:1188:b0:52d:f001:5c4f with SMTP id
 d75a77b69052e-52e09cac8a3mr144159881cf.20.1787556145561; 
 Mon, 24 Aug 2026 00:22:25 -0700 (PDT)
Received: from [10.254.188.74] (132.170.88.92.rev.sfr.net. [92.88.170.132])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249606b431sm923607266b.1.2026.08.24.00.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2026 00:22:24 -0700 (PDT)
Message-ID: <955a7999-0cb3-47f9-9ea4-1ad33d955285@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 09:22:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] target/riscv: uniquify TCG crc32, crc32c, and wfi
 helper names
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
 <20260823150731.896-8-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260823150731.896-8-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bnbDS17GhAuaG0XU0ft3X-yhw7cKrxeh
X-Proofpoint-GUID: bnbDS17GhAuaG0XU0ft3X-yhw7cKrxeh
X-Authority-Analysis: v=2.4 cv=KuF9H2WN c=1 sm=1 tr=0 ts=6a8bf133 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=k3i2zbviP8V9/5wfVjyM+Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=4BOaLOaMdzIDGvCjThcA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2NCBTYWx0ZWRfX+AcBjHr5fV81
 5zi/WMdjTaiafdujOE2fcOjBE7LaXgAB8TyJNpyerPdJUfknR475+87Ogd5dRWeLSUdUBzKXxFP
 IrZFJHqmBmknnIscnAg23o0bKBLujSxpP0k93/t7TLMRTD+9m1Lh4DwmY8tm00Op4gsUzLEIC11
 Eie/7gbgw4PDIqabZnqBptx8CeKrT/EIsma1XncLxrzwWZerOB7pqoajkb4bpN2SGSGgtEFo7Ce
 qNwmbSKMn6LfdmR/1bODLTe47w1rkmkM4W8B9I7C6eJMxe1rrDu3wrygr4E7GqLM3OfAyTePHGf
 o1HpAfLdBgogekMEs59rvmN/aWQMT+vY7UzyiVvwfJ/gnT4BjKlebTDu8VW7ppg7JX8pePtv+dr
 FvIejLdvGi+CznxTlGEyHm3dwZR5IsZczeOMbN4KGW+M4kS3cpBG08ArfD8pjS1Io922DNTugl4
 7VrNR8FgUnd0ISlyZug==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2NCBTYWx0ZWRfX24uBkP0ditGK
 AZm+64N2WGHNaK6vEzyHa/qQTSVZ2V9AvKw05GmXEGSyZKXyvF0HaqfjkvVrxa0iNKyJ7T5SbYl
 alODpR6thiDA98Dk/DIot/zfXGtAcVI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240064
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

On 23/8/26 17:07, Yonggang Luo wrote:
> - ARM already exports helper_crc32, helper_crc32c, helper_wfi, and the
>    matching helper_info_* objects. RISC-V used the same DEF_HELPER names,
>    which collide in a combined qemu-system link.
> - Rename the RISC-V helpers to riscv_crc32, riscv_crc32c, and riscv_wfi
>    so the generated C symbols are unique without meson -D prefixes.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   target/riscv/helper.h                              | 6 +++---
>   target/riscv/tcg/bitmanip_helper.c                 | 4 ++--
>   target/riscv/tcg/insn_trans/trans_privileged.c.inc | 2 +-
>   target/riscv/tcg/insn_trans/trans_xlrbr.c.inc      | 4 ++--
>   target/riscv/tcg/op_helper.c                       | 2 +-
>   5 files changed, 9 insertions(+), 9 deletions(-)

https://lore.kernel.org/qemu-devel/20260623110209.26861-1-philmd@oss.qualcomm.com/
;)


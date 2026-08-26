Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16940C5DF97
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 18:38:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzIVW-0004LC-Hj; Wed, 26 Aug 2026 14:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzIVU-0004Is-5C
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 14:37:52 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzIVS-0001Od-3I
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 14:37:51 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QGup881541292
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 18:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JCwYThXifyy6LfW29TURN+uYYGzGJkJKgx2XvULwgnY=; b=kfv/+SBhdXsHWsxh
 pw95aOiEaMmuT9ofByLsvf5yLpH0m3nLuxdh1e8lIzTnyIVjAVte+mNR572h/1g/
 7O5SsYfghCXh5pk+PkoK/m8zs6dYsN+41qOiUKF/tBcnWiq9qE0aW2vowhYDV/w1
 usy2msIlDUH7jFvAkqXZJiQ7qtFb6B/6HgG6JrdlUSgL9PUpgNuJBV5m8ANGQIbx
 KNX8Od1aXj9I2s5U9mp2TxXtSUguZ7OkWh3eBPyGiPAGzqzbPq2U0W1cmos4uVHZ
 5HEGmtdEeb0Aolm8YIUi6lUTPYJ4vaRY2lfPOkSeljJqgWVI8HItnANXygE7zSYw
 xZGNLg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga0759g3b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 18:37:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c1a9764f0so13334261cf.1
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 11:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787769468; x=1788374268; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=JCwYThXifyy6LfW29TURN+uYYGzGJkJKgx2XvULwgnY=;
 b=ehGK3iJkmJOnSxNbO43zEoDSlPB5zRbbQNeJT4JqNxiEyNYvMEz8qPbyTbg4thESyw
 aNmjEe2QCT7QdV9myQIEhgixv8p41sZkweYg7+5bSp5Ci9t+tCFkoqaXXH/m+xdP0vvv
 b6HzH4WLbaKKjqZ1yznvTksDS6FUjF0e4oiHmPySqQDtwBOLuE8tTHCvMv0cSFQoSRRZ
 KgIkU9NWr1L574haq3KoZ9OxrXMKhxD4vSCthgcepY6eoZlkzN5CzD6K7oTkKfPGxRO8
 Ed3apULY6PGdE9INceA5PVLDrFXAlqnHIZdSIBrnG11jnyG0bx02snbcYDfhNAjKsXkE
 hp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787769468; x=1788374268;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JCwYThXifyy6LfW29TURN+uYYGzGJkJKgx2XvULwgnY=;
 b=e/hrPjSoLr3JdbLfAhJxmlEye2DfVy5DKNW6yRg3TJo+zlQg3qHVogViIH8MsazT07
 6gKlYKFUn3Sh+h8lF9yvSZRNvUbIdbZYVaMX1XnII/pfUGf1kGO1NWQRmARVIE93ist/
 wQENoQLhIE8mWvlGDA+C2hqIRcAJieJQjeu+NYNr95f7kx/txwx2IisC+7VVUYo36bgr
 g0JCi06H3vHPwvAJJjKimCBanv6hMQWdSUA78KRqsnpfHyLGXSZkWPU97m8FdbbkhljF
 PTSO38HsSM0Nc0XywzsNRu+RncEi8njm0g4B5QId7JfXQE38oCxG8VH4GR2/B4bS2xRF
 HM1A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq2K4x4UFGk2D/mtl3N+s8Q025TLAo3qPKhyFpR4ENmpMtAhCNeZXfAOS12tO4IABfxwfHTr+GRmw==@nongnu.org
X-Gm-Message-State: AFuF++kCBpPl3SgklhEsf1DDG/Rp2tUAcuFwCbE8DjejADhaneCVsQY3
 OJgC+kD/hJorW5tGX/XEAMe2+TNmblaCEbdGU80ycGHyad/h8FwMNeDSACYNqNUK0BCPO6lvlW9
 h+Cfxpu6Chfq3JXgl89TcWmSBDOVZTWNuBr2yxpmymXkpTlxcTgos4mI=
X-Gm-Gg: AR+sD10d96zoqh8NG/mq1ASpG9M/pwK0CahgFpoYD+T6/CyCXRZ1eRX8gzbr3o8GpkH
 TzY1aKGL5rEn2wSwhIjhlzVfCjLGAARLb15mR+c6bsmZdQvg0qLYVOf5DHb5O/YI8RDLxZ2n5pZ
 pZgldiqOdkHmMhhOnZSp0/AOwvrxf6eCGVxeeR+zIrZc2AT9GqMTZJSdn0a+NnnVYnoDXTXb6NR
 AKhEwmfSgS/oP1dtZvDpobxIQ52+bvS7BTFT4b9Q1TFvYAhzNFVLEZXWLoCSrRXjGQlJ/907heh
 Cb1c/LWoj9ngJvY2E3RnWlUxy+eAc7HbXS/29Bcunqr7gW9/CsjtTd9niTrI05sK9jqosdJL78Y
 x3O2QOzLXRz/Sr/TDbK36NbrYW7dc2PxQSwCZp/nf9ISngrEc4A==
X-Received: by 2002:a05:622a:1111:b0:528:32b1:c202 with SMTP id
 d75a77b69052e-52e42235670mr90966761cf.7.1787769468265; 
 Wed, 26 Aug 2026 11:37:48 -0700 (PDT)
X-Received: by 2002:a05:622a:1111:b0:528:32b1:c202 with SMTP id
 d75a77b69052e-52e42235670mr90964331cf.7.1787769466529; 
 Wed, 26 Aug 2026 11:37:46 -0700 (PDT)
Received: from [10.254.188.74] (134.171.88.92.rev.sfr.net. [92.88.171.134])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a6fd00csm662040566b.15.2026.08.26.11.37.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 11:37:45 -0700 (PDT)
Message-ID: <11ab11dc-aa98-467c-bd36-4dad90bc0069@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 20:37:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] target/riscv: seed cfg.big_endian from TargetInfo
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
 <20260823150731.896-9-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260823150731.896-9-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VHlU0BUVqKx8NwL54dWhMd0bfiPMZCtM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE1NiBTYWx0ZWRfX7AlpHemTNAu5
 jYq+Ns2NfKDScvAwmk2WtgeHVHmKytqYtM2pb62Tn/f7yHnvcu7LeGqGD8XqHLVvVbNGdLMGxn+
 UoJjFnjySeFobvnOrbzZa1io+jmN4Y9kXNEv0ghmQBublBLgwnKo3araATLxZQlN6WCqX6KnFjQ
 Gq2ZwTvYc+WodOjupj+jE70tdHnIj5q7dpeDEe/D+r9PTJKHQfN8pqT3HJZoKjI8OdYqyzjJ3c6
 dD1R1jjKbvmyBu5NFbdAPAPl8qj2BtI4vo4hJtMT3clZ1LM9AlgVx/imNrDvbV/QpXWuJG7+CUK
 B91I6O/uMod2HY2F8E8hoBKBZs9rio/o1LMVIV1ImdL2NoJKI0Wx9GgICuhWgTLbMznoyB5zpUk
 plUz61rwKBcpoxmc7x50sb4ub5rGs/ID3774D4WjmHrbe6gahbIhX991vSsggihMPbjYF4p0IVi
 NTJ6VdlwnfvakV2g+qQ==
X-Proofpoint-GUID: VHlU0BUVqKx8NwL54dWhMd0bfiPMZCtM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE1NiBTYWx0ZWRfX/As2iCSWaW1u
 Al1hQwbjDgSD2iDppeY0X8gx1j07cTCQnkAIazEy/XYpnPYzJDCY7srPUWxc1+gDaDx5sTHLFO1
 2XygaB2Qz2qHSK/F6ThvPJZ23g9+H4U=
X-Authority-Analysis: v=2.4 cv=RPiD2Yi+ c=1 sm=1 tr=0 ts=6a8f327d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=o1isufRNksZXpKP+aqnsag==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=sk3sBhc6xHwubYSXd84A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260156
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
> GDB register packets use target_big_endian() only (gdb_get_reg16/32/64).
> RISC-V gdbstub already goes through those helpers, so future GDB
> big-endian support does not need a second endian source in the CPU
> gdbstub. It needs TargetInfo and the hart to agree.
> 
> Hart endian is cpu->cfg.big_endian, copied into mstatus MBE/SBE/UBE at
> reset. The CPU property still defaults to little-endian, so a
> big-endian TargetInfo would make GDB swap as BE while the hart stayed
> LE.
> 
> - Initialize cfg.big_endian from target_big_endian() in cpu init so a
>    big-endian TargetInfo also sets the hart.
> - Fail realize when -cpu big-endian= disagrees with that selection.
>    GDB cannot follow a per-CPU override, so a split would silently
>    corrupt register byte order.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   target/riscv/cpu.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 5a82e6563bf..0681bec0bef 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -29,6 +29,7 @@
>   #include "qapi/error.h"
>   #include "qapi/visitor.h"
>   #include "qemu/error-report.h"
> +#include "qemu/target-info.h"
>   #include "qemu/timer.h"
>   #include "hw/core/qdev-properties.h"
>   #include "hw/core/qdev-prop-internal.h"
> @@ -1226,6 +1227,13 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>       RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
>       Error *local_err = NULL;
>   
> +    if (cpu->cfg.big_endian != target_big_endian()) {
> +        error_setg(errp,
> +                   "CPU big-endian=%s does not match selected target endian",
> +                   cpu->cfg.big_endian ? "on" : "off");

Surely the bug is on the GDB path.
> +        return;
> +    }
> +
>       cpu_exec_realizefn(cs, &local_err);
>       if (local_err != NULL) {
>           error_propagate(errp, local_err);


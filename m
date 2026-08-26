Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4D0C61DBD
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 18:42:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzIZa-000659-3c; Wed, 26 Aug 2026 14:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzIZY-00063b-2T
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 14:42:04 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzIZU-00026E-Rk
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 14:42:03 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QGubp72103197
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 18:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XC9ChOqETLb+aTPzpYEupRJSR0qghypA3tBJYMOrzMM=; b=K6kAfgWtGoCpZOht
 xYDP4377BxcRX+WZMm0SdDznxYxKF8wm7wxDwojZpcBfUbfEG/dq70+N+g68hz71
 UtxyWMbMTNYroix+84266hyIFyh7Ro/YkA24M97b8cwBlkVSxc3CazCs1U+FK30e
 6V0U8po+vi7N4B3s0Zm5VIAMsAPVist1XI4tX00d/vw4VZ1QSKx3UjQzXlDyU9oa
 FBgAOKpNnqLnrI0KzdoCvp2KyLuqEXGp4Q3W9kpdhdBQEZmDbU8rmUqBujV4jyyW
 GuZousNQuExBWLntjxF1zlHFhj1gB+kKfwKt9byAKHZiRoeTgu88NelrFAJ8/5ZO
 svtVWw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga0wbs9ha-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 18:41:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8eec6acbe21so23446166d6.3
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 11:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787769718; x=1788374518; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XC9ChOqETLb+aTPzpYEupRJSR0qghypA3tBJYMOrzMM=;
 b=OrpZZlALKfJ7ytso5nHl8ohEIocqmbOqyDrn5wH1EbPzc62BIqy/SdR/3nhQgz832c
 0A5IPtlonfxyTnf23IWyvY1VLUpG9aIVvenwdWApqH9PHntVOsI0HjvD5G4URhg8b3vf
 UZUVlpX0KOF1Y+DvD6NSwsB4rWA68wb75Q9KG+PxkpzhgNMcrwXGRQg3ngm9FNvdQsUv
 qS5A6bS28fHINYxh8ET1xD4Hn2fQW8NKWkoaVR09w2ZdWNL+R5Lk/3gJplr1phcTEoe3
 qN0uY5RuX3AvVMzDfL+6YgiqBUngVU+W6zagci88/5AWqpeMdJG7MAW+nZdNDtH/Npxm
 lsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787769718; x=1788374518;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XC9ChOqETLb+aTPzpYEupRJSR0qghypA3tBJYMOrzMM=;
 b=aKvDXPIvKSYQV/zIrUbCF4Y8DSarzHWLGOJnSGVchYcKjRov6M7YUDSzBW6yh0yW7H
 5NZ/uu3B89LSB3s4n1JNLUXKF5Cr/BPUUjSP1fxqIlrzXr+598eA8/TOHnkSNy4+jiao
 6VUgQVcUk2ySWTQIHkzEe8l/kzdgktThgWieCFp5luxXeW8+walEhmMJJ4IZUN7/rkwi
 3melCvO614EkuwOTqAg/7kyZADVFLg8HyXR4rU3q2mKje75olicvqiz1t0+s3Gg3uvlF
 n+cESworwTilCt412tWLKLyBruNp8Y0JRFJEvElOPH7xVuSszxm0B+/j4IdXYLjmyUIB
 zhUA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoDBJSyi0s00bIm3nF6FP3KfzeWztmyD/4nNN98q93am9iDa1mdHuud3TVSlWS0ZM7H4M43qGCr6w==@nongnu.org
X-Gm-Message-State: AFuF++n6tcnn2LFL/4d+7/ah0/AHUKD/zUq4jJqg94W2NPmJc40WNHS/
 WMqypve6pPDefFH10xzszLbUEs0w3v+ex+xsAq54cmtWHtAMnDaXx044verKvfaAHc30wUhUH0u
 hYr7cG0C2ar6eJlF3ICy5NdVyfstjEX7Whi/dp5XNIZiFy6vJ0CVbVxg=
X-Gm-Gg: AR+sD108rwsK6+YrLMGOUXoeAnbnQp64kNDSNbZOVCE3X+98ypKHr4qi2h94gFkoLAU
 7jS7PaiANCaomeqyMDwZY6YG5y4GkHTFoWKcI2uQWMRgTjqDC6hjn512GJ6FyO0VK7GUnSSJ3+0
 MWIDPtHGZ48eBtN36YKMp3g7y/WR7W9aOGnhi7/drBsgcI3yqp6A3ZpeGTd0SLSF4vpz3p5dVvp
 GFFv1ylznWrAjc9fz7gVVU6KS5BTta6qznOz1nVuPopXBZC1Knw30ZuICG8ZOYv36RYEKl5t7XP
 TanYmjemFQvW8NQuTpZa3yeEUR07t5eKZwAf7YDcNWF3jWkGNvr21xetgCPE21MKShdbwZoIWUd
 bDLUwl+g4ngLHDZNqVfY4doDReNenFV86lQJ2gEzFN0IPlODv
X-Received: by 2002:a05:622a:1916:b0:52d:882e:4986 with SMTP id
 d75a77b69052e-52e422da0e8mr103266801cf.4.1787769717753; 
 Wed, 26 Aug 2026 11:41:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1916:b0:52d:882e:4986 with SMTP id
 d75a77b69052e-52e422da0e8mr103266251cf.4.1787769717315; 
 Wed, 26 Aug 2026 11:41:57 -0700 (PDT)
Received: from [10.254.188.74] (134.171.88.92.rev.sfr.net. [92.88.171.134])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5de8b621fsm6142510a12.5.2026.08.26.11.41.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 11:41:56 -0700 (PDT)
Message-ID: <e95c14f2-7a39-4ce1-8540-0d6f80301449@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 20:41:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] target-info: register le and be TargetInfo variants
Content-Language: en-US
To: luoyonggang@gmail.com, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Xianglai Li <lixianglai@loongson.cn>,
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
 <20260823150731.896-10-luoyonggang@gmail.com>
 <9b5a4586-be66-4d69-8d08-fc1796336b2c@oss.qualcomm.com>
 <CAE2XoE99hEfbdKEqW-kF7YLeSatPGe0v-Azb9TMXa-sm31TyWg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CAE2XoE99hEfbdKEqW-kF7YLeSatPGe0v-Azb9TMXa-sm31TyWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: AbeLxi255JuJsWLhRfVbToUreBKc0qlL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE1NiBTYWx0ZWRfX2B7BKWLorOtP
 F1+4lUfdUbsWJ/EEYdvdEOabWVqu6wbW6NQmq8aAIML+Z2GM5Ovfdb+TpTYVJPtVbaVYOihcs5h
 Wib72tsKlWWW1bH8KJTZEByWUB+gtJI=
X-Proofpoint-GUID: AbeLxi255JuJsWLhRfVbToUreBKc0qlL
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a8f3376 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=o1isufRNksZXpKP+aqnsag==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=P7ypQ-ddqiMMtdoUKUYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE1NiBTYWx0ZWRfX6Q0e+UnflWUd
 VZN+REPp37zEPdKiujZF1hgC2NkU5UUjqx6lZvPDJ26eBnALyGn4klw3+u6cdYhs9Gkigq5Qrkp
 ZXAaRqmQrPSe9n4+s3tKSDILuhnwCVYTAG58om5iSeEnUGBOmc2P6770UfrMwZsied1EKHawciY
 xHcl5BYV6zc6onX7uMokQzP1rXOKvhAk8e/X45mtdeBkOOO9JOVYYqRfe6QQ0Kesr4zkE9Tafky
 rtn4PF4d7cc4bDhDifAAy1BRlXr+bxbhu8RKCzb+SQ70MiBsgASI9g45U0Uk/7p+ffMjO8G0tW+
 FoCNYYPcsPr00Xc46OqYQBaYDZxVt2ZRqufDiar9Y7KyEOwVK9hsT5bbrusxzc8pAeFTPQfXLOF
 Njf5AYMEtk5FGrMeKA4rNFfAiSPABPVUON1bLEfCUBp12R24AGlzmT1b379kISTKVIT7/fZjFRr
 JLJ6lnO4vjtK5vYGUOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260156
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

On 24/8/26 21:01, Yonggang Luo wrote:
> On Tue, Aug 25, 2026 at 12:22 AM Pierrick Bouvier <
> pierrick.bouvier@oss.qualcomm.com> wrote:
>>
>> On 8/23/2026 8:07 AM, Yonggang Luo wrote:
>>> - Register target-info-<name>-le and -be from one system
>>>    target-info-def.c unit, sharing arch fields.
>>> - Mark is_default from TARGET_BIG_ENDIAN so riscv/arm stay LE and
>>>    ppc/s390x stay BE when -target is omitted.
>>> - Pick the unique default in target_info_qom_set_target() when more
>>>    than one TargetInfo is registered. Leave user-mode as a single
>>>    target_info().
>>>
>>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>>> ---
>>>   include/qemu/target-info-impl.h |  6 ++++
>>>   include/qemu/target-info-init.h | 29 +++++++++++++---
>>>   target-info-def.c               | 61 +++++++++++++++++++++++++--------
>>>   target-info-qom.c               | 33 ++++++++++++++----
>>>   4 files changed, 104 insertions(+), 25 deletions(-)

Clearly not the path we choose, have a look for example at how
we converted MicroBlaze:

$ git log --oneline */microblaze/ | fgrep -i endian
41c417290df target/microblaze: Fix endianness used to disassemble
1346a811234 hw/microblaze: Replace TARGET_BIG_ENDIAN -> target_big_endian()
9281c68deca target/microblaze: Directly check endianness via 
CPUConfig::endi flag
91fc6d8101d linux-user/microblaze: Fix little-endianness binary
0e259fa5a13 hw/microblaze: Remove the big-endian variants of ml605 and 
xlnx-zynqmp-pmu
141ec228deb hw/microblaze: Add endianness property to the 
petalogix_s3adsp1800 machine
eb3020b6ed2 hw/microblaze: Evaluate TARGET_BIG_ENDIAN at compile time
840e0862c52 target/microblaze: Set disassemble_info::endian value in 
disas_set_info
415aae543ed target/microblaze: Consider endianness while translating code
2c9e8ddd769 target/microblaze: Introduce mo_endian() helper
e87c93df113 hw/ssi/xilinx_spi: Make device endianness configurable
8a8c92c8afb hw/char/xilinx_uartlite: Make device endianness configurable
df1f35ab67e hw/timer/xilinx_timer: Make device endianness configurable
644276db5d7 hw/net/xilinx_ethlite: Make device endianness configurable
2cdf693b197 hw/intc/xilinx_intc: Make device endianness configurable
adc1a4a26a9 hw/loader: Pass ELFDATA endian order argument to load_elf()
8f27e70e3bc hw/microblaze: Propagate CPU endianness to 
microblaze_load_kernel()
c36ec3a9655 hw/microblaze/s3adsp1800: Explicit CPU endianness
181b3a7bb03 hw/microblaze: Deprecate big-endian petalogix-ml605 & 
xlnx-zynqmp-pmu
6c8cec822f1 target/microblaze: Alias CPU endianness property as 
'little-endian'

>> Is it representing existing targets, or adding new ones per endianness?
>> I'm not sure if the goal is to add new binaries, or mimic existing ones
>> with specific parameters.
> 
> 
> Is optional now, not a force requirement, this is needed when we use GDB
> debug qemu riscv-be, as gdbstub are depends on target_info

Again the bug you want to fix is on the gdbstub path.


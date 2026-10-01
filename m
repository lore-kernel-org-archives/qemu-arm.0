Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8718DCA5FB3
	for <qemu-arm@archiver.kernel.org>; Thu,  1 Oct 2026 04:24:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xC8Ku-0007Sz-Jj; Thu, 01 Oct 2026 00:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xC8Kr-0007S8-E8
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 00:23:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xC8Kp-0004I5-Gn
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 00:23:57 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6913g53W4169806
 for <qemu-arm@nongnu.org>; Thu, 1 Oct 2026 04:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 18Rg/dajCd0tognlWy5soatv6SKrqtyjs7v2WXJTJIo=; b=cN9rrnyZIUwuA0as
 g9+arcdswh4CNlqg4WJQrsYU6sj+t9kGaCKeg97Pe2POchiMXaPpa30X0J4cpG42
 QMYm4+I8IxTsxblirQ4bVhwMVIPHiojoQIn0ztp7LF0epfC/IygX2dgnFmuNhqal
 ifKnB9DeSrSchk0f2t/ty2tVLZpn1Yx8Mp0e5BbGj1zlMh0/4fBnuanWuI6cXfBa
 bksDK3yKcI3oMywMgOkfLQsqkalZI0cFg3ir+kvhp0i+15qfNXn+OIvXhsEzSQTs
 EpjKfXAIMwu9Bx0GXkkfgdpDEU4Sfpa4MJ1UYpA2cD+vNr5pT/tBAovwAh9dyiiC
 9j15cg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh58xx9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 04:23:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3a47617a0b3so4161336a91.2
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 21:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790828633; x=1791433433; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=18Rg/dajCd0tognlWy5soatv6SKrqtyjs7v2WXJTJIo=;
 b=dbTzc6JkvhFc5J3PK/7eRKZ/ovNloANH+ceNjIfiKU8om0bM2xWSJMhH8lKXToTpf9
 aVQbGFD9uivRCkWhYpVWtLXzJzsIyeB2bEq3joJO+hzuCaLiu745wC59Y6BNaO1MblM6
 bHrUV1+yNakxna2f1itbEY2wsk+GURQXTM4Ln44lG9HIObn4Ezc0czzkt8ImevwzG57i
 cRvk2YFeCYi/9kB/wtq4D3AyEnpAhBqYEaNiaL1ccpihHjEPFzkxfrn+oPL0qdC5mUep
 9NcsZULHoVJxqXR+j44ibL9d21HMApkYMUyh5M4pnUpc+pPNJ8O16TBPBl3yDnhd0hXO
 C1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790828633; x=1791433433;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=18Rg/dajCd0tognlWy5soatv6SKrqtyjs7v2WXJTJIo=;
 b=iPkiwrMNXkTBNwlZctpd87h7Q5FLVIoId2HEmuokw/t1Rkfd/yyONngtSCJl7dq3eF
 KPbP5olbclq6eZ+zlVtoukdvo2pj3IvFZNYx4sH2W8AukVoRriYhCLO3apikySid1Ks3
 fViTH1+5yd8JOX43DxhGM/Tp+6XBzASmsB7jrM7Zg4CeQDnGKsCnIRCZZtJTIpdQ1kGo
 NURjMSPES/50sR/FoG3Ud/5LI5UT80x80t4MfyCS9UdekzA4a62DsmrIfC85Fx8wanig
 hRjzDedyQgAnyEiKDX2xyKsl4LPmKVmQAPvOJ2xLPQx1P7XAeRU7bIbUAzN4HWb7edEM
 uKEg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwumDuthBr9Lcj2usEXOsmosRdgK0s57gCIQ8CdU12kn/77ZDkqtMsdUkeSm92U8m2xlQCQKU5Jyw==@nongnu.org
X-Gm-Message-State: AFuF++lhoZamWpY2YyKQPJnEKnADMlhPurIJ2RJHwkFzudHRQgZkgpOA
 QsQnzJzi0n48vEh/vyU+2qWP2bPa4vBiSfNo8RYNHq8Axco9IgiBoeM90GR3QGRH+5xcX/qemjY
 R98uGnpzs/JKiXZmHpcQolpYLcHLd9fsIMEVpuKCpC8WP+msAMkfefbg=
X-Gm-Gg: AYBFou2wwqTFoyF0LuCgj4M4+UdtI9pxEjHAgl15jEiljRiowsgkU1q6ibqvOTA3qFf
 I/Fm3zwvLnf/UFcclV2Tf57/ThexyAck3ZaSSmQliwnpPw9wfojXDeJmkccA3Io+bO8RWH2SMMO
 PNhaD4tffbOYMY9YIUhSLV+k3QDp7skbYXPEhCf9tgqvRYNqgczcGurVBkqrNABcYXAonkdk1W7
 AgDBsR8qC7VItdYiJXRFtuNk1w9AWeozJheqP7v+q5cZs7p60y1xVaiUJI18+mG9BlDgcjefrqx
 8LyC1wXsVFWjOudR9zpDiFNy7xEmO/ludzlew97AOiuomMQ4wjqxPOHPdOTprlE+OGlh5tYBpDa
 CM7iRw0Y7+urm/llrd7kMlXdJNX/ubEFgLJih0t9bdrmIe0z1szmgCOkW
X-Received: by 2002:a05:6a21:101:b0:3dd:a006:7b3c with SMTP id
 adf61e73a8af0-3de9e75259fmr3425384637.59.1790828632494; 
 Wed, 30 Sep 2026 21:23:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:101:b0:3dd:a006:7b3c with SMTP id
 adf61e73a8af0-3de9e75259fmr3425371637.59.1790828632054; 
 Wed, 30 Sep 2026 21:23:52 -0700 (PDT)
Received: from [192.168.1.169] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-888193d2061sm415713b3a.36.2026.09.30.21.23.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 21:23:51 -0700 (PDT)
Message-ID: <74853ef8-7315-466a-99ac-41c8182f9b13@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 21:23:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/10] machine: allow -M name to differ from QOM type
To: luoyonggang@gmail.com
Cc: qemu-devel@nongnu.org, Chao Liu <chao.liu@processmission.com>,
 Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Song Gao <17746591750@163.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20260926081551.29-1-luoyonggang@gmail.com>
 <20260926081551.29-2-luoyonggang@gmail.com>
 <82250296-78bc-4345-9e57-1fcac485d18a@oss.qualcomm.com>
 <CAE2XoE_+nhj58M9_yx6wf532qCSVcERpTw7F4AU7PXN7prhpzg@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAE2XoE_+nhj58M9_yx6wf532qCSVcERpTw7F4AU7PXN7prhpzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAxNyBTYWx0ZWRfXx0rNRLm6Qfez
 5IwY++N/nvCWssb4ewoL3GqdB1eItLkEZ6n/sa0Cc5tO7Otiz9jrBX0AIBzbHWXRUIePvHDqTl4
 u67hckv4qF0wWX5/7/ygzdbvLiVCZiR0ZkrJwOe2IANPTJ0A62WLCC9Skia67uhUZN6io+flQYq
 FCrlemCveOhqWgw247T5cRNRPM6pTV4wXYdWj/BWOayE14XWMsGL13Tx2GFB7CkvPj/t0ckbKK+
 JRT8psOb8/9SZaZt6H6Ry0M6Qnvl6ERVJK5uS7XXgn1nWcyh0wB0I9kL1BE5cQcOwkyfaP/4jlL
 H6JRefAF/A4LDC7MdNqxXCWuZmhDGgkGyQ6qj3+XHMw/T8o0WFS/T5pFIcmydbOcnSZaq6YiqS+
 6xXoOb3wlO3X7ldj9ktP6tOAeEgICAz2adIzsc9uZSCg1DtqSvA9WWrgD1fFBE+dQ9bM/uKQ0F0
 0fkH4gqxwPg7MGgpguA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAxNyBTYWx0ZWRfXxHllupcQTADh
 mRJSKnRk7f1bB1gbsrzo+XKMbkJsgn4MIczR/vtya3L+78VDCQnSMcMd9fGNN2nFAAWD4hRonZX
 oaBi/9tWEba73S8x6tYMZk0l6rZuu74=
X-Proofpoint-ORIG-GUID: JpmpRXd6MzkfrjwhcBNYRHEMk0W_8BLG
X-Proofpoint-GUID: JpmpRXd6MzkfrjwhcBNYRHEMk0W_8BLG
X-Authority-Analysis: v=2.4 cv=NrJE4MdJ c=1 sm=1 tr=0 ts=6abde059 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8
 a=yrPBLZhDcz1HLbYK-PQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010017
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 9/30/26 6:55 PM, Yonggang Luo wrote:
> On Thu, Oct 1, 2026 at 2:19 AM Pierrick Bouvier
> <pierrick.bouvier@oss.qualcomm.com> wrote:
>>
>> On 9/26/26 1:15 AM, Yonggang Luo wrote:
>>> - Add machine_class_set_name() so boards can keep a stable -M name
>>>     when the QOM type is uniquified. machine_class_base_init still
>>>     defaults the name to the QOM type without -machine.
>>> - Document that MachineClass::name is the -M name, not the QOM type.
>>> - Sort -M help by MachineClass::name so order matches the printed names
>>>     when QOM types are prefixed (arm-virt-11.1-machine vs virt-11.1).
>>>
>>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>>> ---
>>>    hw/core/machine.c        |  6 ++++++
>>>    include/hw/core/boards.h | 12 +++++++++++-
>>>    system/vl.c              |  8 +++-----
>>>    3 files changed, 20 insertions(+), 6 deletions(-)
>>>
>>
>> First, I'm not opposed to this series, and if anyone wants to pull this,
>> I'm ok with that decision. It's just unclear for me what will be
>> direction after this step.
>>
>> If I understand correctly, the goal here is to allow to register
>> multiple "virt" machines, while still having distinct QOM types behind
>> the hood, which does no affect behavior of current binaries who have
>> only a single "virt" type at most.
>>
>> That said, if we project in the future where we have a binary with
>> multiple of those "virt" machines, how will the current series help? The
>> situation we'll have is distinct QOM types, that all answer to the name
>> "virt", so we have no way to select them individually.
>>
>> Slightly worse, find_machine() will just pick the first machine name
>> virt, which is a non-deterministic order at the moment.
>> https://gitlab.com/qemu-project/qemu/-/blob/master/system/vl.c?ref_type=heads#L846
> 
> That will handle it properly. For single-target binary qemu-system-$arch.exe,
> this won't be an issue, as there is no conflict as they won't be compiled in.
> For multi-target binary qemu-system.exe, we will choose the target through
> -M $arch:$machine, and when no $arch is specified, the default to arch
> to be "none",
> so still won't be non-deterministic.
>

 > "when no $arch is specified, the default to arch to be "none",so 
still > won't be non-deterministic.

That's my point, the current abstraction will create something ambiguous 
by design. When people will specify -M virt, without $arch:, a random 
machine will be selected. At least, maybe this series should ensure 
there is only one virt alias, or make it forbidden and uses unambiguous 
names only.

"$arch:" is just a workaround to not add -target option, except that it 
comes with additional problems, creating inconsistent command lines.
I already expressed my skepticism about the "machine prefix" based 
approach, being more in favor to strongly filter types per target with 
an unambiguous -target option. I'll accept the community's choice on 
this, but just wanted to see this explained before someone hits the pull 
button on this series, so they know what will come down the road.

> 
>>
> 
>> A possible alternative could be to use ".is_available = target_X" on
>> those virt types, which will ensure only one is effectively registered
>> at runtime, thus, there is no ambiguity on name or who is the "virt"
>> machine.
> 
> That's the issue I want to fix, ensure it is registered at runtime. So
> we can list them
> all when a "none" target is selected.
> 
> 
>>
>> Again, I'm ok if anyone wants to pull this.
>>
>> Regards,
>> Pierrick
> 
> 
> 



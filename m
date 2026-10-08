Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA033CA6012
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Oct 2026 18:42:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEt37-00059P-Ml; Thu, 08 Oct 2026 14:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEt36-00058j-9u
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 14:41:00 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEt34-0004iK-4M
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 14:40:59 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 698HVTRZ3411987
 for <qemu-arm@nongnu.org>; Thu, 8 Oct 2026 18:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 p/4kx1/Ax8IbTS4kbHtNk6JB/jhmXP/JGosi+LW0Bok=; b=eM8LttJv1lwLeqlK
 kKDxHyrjM8N7Xz9FSEtEat+SKaVnPofCyWKYJYORGHZdrai7T8+Xdx73Xglt1ERY
 2+cbqsF1Fvm104k7QCL75irrP+F83wK5o/q/+AQoV9KPmjtbNIwGu0hYJsK83ltc
 itBUBSNs4nriNbknfDZqGrDQ9pDw2ngVIr2/6J7jXaE9/LaQItHRLHnyzqYG1CZd
 yBqw+XAtWWt0lGsW3UraPHMAJx8iJvDJwgDDUhYm5E6bK59K4zjVetnMI6QsfjtK
 ysMJSE+C6bbdTUYtYwlCbDUxfWZROQnE9ZxPeOiewWfoijNbV1Tx20ygGd4iKMCF
 77bBkQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6b9khd7r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2026 18:40:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3ab0a814c67so720020a91.1
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2026 11:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791484856; x=1792089656; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=p/4kx1/Ax8IbTS4kbHtNk6JB/jhmXP/JGosi+LW0Bok=;
 b=HCSvyK7WgJf6nXZQkMKprRimCElp2LGYlbEpxF4qmwIfl2m6j5jOnABRXv4AbJm42p
 tveTVnAazq8v7QQqdQGQB5ngqaEPNUuwhc+4PmeKBI0rrbYUyXaKGlAlHyIC3rm2un1a
 Ml61C8uBdiSRRMNlda2N5lqB8U2r6swKNQ4/+WBktqNNM0QVXcSiLegjojRElfNYUeWh
 D7HfC3y3I2R7TJAZeLlotzd9dCPkrHL3cfKJKkkOssvGeE3NdId41Tl9okS2qOZcP/eW
 noswcXVWGYrX2Uneq4v1NzYSubtpkO+wnf1KvdnHLCKlwRMIu4UoJOAUMLInmTmX2ofL
 NiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791484856; x=1792089656;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=p/4kx1/Ax8IbTS4kbHtNk6JB/jhmXP/JGosi+LW0Bok=;
 b=iCyUEEL9Xq+sZAARtFloDnmj0Eitce/Epq6gqDHLsvdDhQPnibyMGPqLYuvZlkTcJp
 znozWl9q3Jp5HoHvalElMN79Xe8/ADLlomqkvClp0SOV9h1PRnLtNbMcHGgVgidDIkQs
 JnYICFCVZ3R+s20KPTI3LgOrU7QedxwpiuoCc9S1vbRohwFaYc/NqCxfE612KcKMcX4V
 yCFNWCh1bqffxzgIt/pyaluLGDFkKnM5+TnoCVzZAOlbVOvf72VQWs2ZUvNpSHgnR5Nz
 1pVVRnRssiMz8+Ak7y+eQb5pqMYjeGNy4btdyA4a9EbKCooVxTkAQzmT5eXOSculT883
 rBUw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwyQAKH1T3gZ+Z2QKe0QDJX2u0UlAC4869Z5PjwkZFkVzPmqUpYtWO3pljqju/YsBi1bazMaipYGg==@nongnu.org
X-Gm-Message-State: AFq9FYJin+RHm13JlFcGwDofNiG93yGxjuRq0hjMwPwzYH3Jh34kMKhm
 q0CcdPLnzu0PLD+vN7XEUYTKsPgEO1U4rmjL0OWnBHWUvxTb47f2KpIZsy7rG24QdPTpfsqmIF4
 aOP7CX2lgffXzDfMucMe86UwU6D1P8fHcHyyxoPgt5KG8VFJnDFHOIBQ=
X-Gm-Gg: AYBFou28o+wpN9YwRG/apWttS6/28tb1/DXLch7mkOkbdhA3+1J6LcUNtdoyRWPuFXc
 xqRKUW84FkPACoIbIOC5ROb1IDyzqnv1htqmM0WrUwVa8X19jSevw+aEfcDnugvUT1pJpC5Hmhj
 oSa26I19utF78kiVuzQfeAyC+euQitYi6v/pRa1ork/8Le0UP/IHHepLEypPXAABMO1fCCd/qE4
 ssgAAEsoUqXJQAQL0NE+C+xZpPAanBbjhG18nuEL0NtEPH+ycsjH7XhH2GVZx7VrvO2cKu6V1ID
 1ZswH+BdSjL4NIWXjzrQt93VyTVb5hgi9MYQG3EPzmtucZ1K6i4QC5VeeZ+1E0HRSilA9JrKJr0
 LrmJmCZldEGQSnkIbBFKHF9X017MfxQELCTDvGJtYr094f+khXXbnQ1UJWB9qG1olYdQDZw==
X-Received: by 2002:a17:90b:3bc7:b0:3ab:22fe:b142 with SMTP id
 98e67ed59e1d1-3ab22fecf9fmr975330a91.1.1791484855365; 
 Thu, 08 Oct 2026 11:40:55 -0700 (PDT)
X-Received: by 2002:a17:90b:3bc7:b0:3ab:22fe:b142 with SMTP id
 98e67ed59e1d1-3ab22fecf9fmr975305a91.1.1791484854806; 
 Thu, 08 Oct 2026 11:40:54 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a9ff8c2396sm5197306a91.11.2026.10.08.11.40.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 11:40:54 -0700 (PDT)
Message-ID: <b2d62e5c-19d5-4bdf-81ad-2f3eba90b071@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:40:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] qom: pass TargetInfo to is_available for later use
To: luoyonggang@gmail.com
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Stafford Horne <shorne@gmail.com>, qemu-arm@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
References: <20261007115253.328-1-luoyonggang@gmail.com>
 <20261007115253.328-9-luoyonggang@gmail.com>
 <7fc0d377-a994-41f4-aa98-7ed56db11447@oss.qualcomm.com>
 <CAE2XoE8K+3e8h6H9NrPk1WWMmJfG807bN_Kh5qje-5pKWUUg5w@mail.gmail.com>
 <b2d89a92-0197-4873-b4ea-75bb21c0d0ae@oss.qualcomm.com>
 <asdkF80SJzF2W3sD@redhat.com>
 <CAE2XoE-Vc+CaE-3FerW3eXtTgspwxZJ6ZT0CZyg3ZYpoJ8xYXw@mail.gmail.com>
 <98644e74-9219-42f0-bcf7-8cd7f02353af@oss.qualcomm.com>
 <CAE2XoE8qSVczu5R1HTwOV+PhPo7_wWzB=KSqhJroqbgcP5GDRQ@mail.gmail.com>
 <8c3e6104-f59c-42d9-949a-1f0c7c8dd567@oss.qualcomm.com>
 <CAE2XoE9b3BW4+m_7o=C9wxk76wTE+aF0eJf91R5oQxhTMNiJ6A@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAE2XoE9b3BW4+m_7o=C9wxk76wTE+aF0eJf91R5oQxhTMNiJ6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oVhKwDdryiyBHGID87WYGGuMpRqQZBMZ
X-Authority-Analysis: v=2.4 cv=U98Hnuru c=1 sm=1 tr=0 ts=6ac7e3b8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7h54msdGEgNczswVZ3cA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA3NCBTYWx0ZWRfXyCeEbZcnPt2k
 PTTvfqSdgf9HqSKO4fci0Dntoy5o7qeARGiwOBJ2ncTARC2wTL4rZG1V/3URZMWXQrhhj/0Zowy
 susH9vWT0bEG+4gir/yhl6B61KXnJdU=
X-Proofpoint-GUID: oVhKwDdryiyBHGID87WYGGuMpRqQZBMZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA3NCBTYWx0ZWRfX87PUM4fUuZd6
 DHFIEHKLbAIVdBtOLTqNggXmPXaKONL+K00KC6aDTSDCG/CNTxrqw2gMec/6WYHcbgE+XFOlQG6
 q9tMNTRUgiUIhmVSDBe7k/g5Bs3Ge5zqRSyxP6fF0cxDQyZo0xj2EJQsYR2XS/cJpIe4HVk/rGE
 kA9+gqYHLL87LcjS028jBhWTxwL4+ynjaOhU9FK5Bi5+F+qHq4lhAFKPz+8JPp7alWX+6XuoSqN
 AecEBfpw8b0a0ds/6aTV7TtgXjSB+mU0WV7rqpkmKg140kM4/Qo53Wc/p8gQGvVQH4EhyyfD3gv
 SgLX/qTO8SXqCoWhx2byhrLcw8zZfq9K+inPqciH0x/E0MoGCjxRvNP+Ov3EjkMuR43SdnDo45I
 nEoUBQK1ryb9GhYlkCTRZH4DldMA7rtXD3tBYSLY4mJB9/eIGLW7AMCyp1BLmZdk5CV26PHzVOG
 DAp2fYxEdshFGZo2UYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_06,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080074
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 10/8/2026 11:33 AM, Yonggang Luo wrote:
> On Fri, Oct 9, 2026 at 2:27 AM Pierrick Bouvier
> <pierrick.bouvier@oss.qualcomm.com> wrote:
>>
>> On 10/8/2026 10:04 AM, Yonggang Luo wrote:
>>> On Fri, Oct 9, 2026 at 12:01 AM Pierrick Bouvier
>>> <pierrick.bouvier@oss.qualcomm.com> wrote:
>>>>
>>>> On 10/8/2026 2:56 AM, Yonggang Luo wrote:
>>>>>>> How about letting machines (and machines only first), have a new field
>>>>>>> 'targets', being a uint32_t mask with an array of EMU_TARGET?
>>>>>>> machine->targets = EMU_TARGET_X | EMU_TARGET_Y;
>>>>>
>>>>> To be explicit state what, I give you a pseudo code to compute
>>>>> machine->targets from TypeInfo::is_available(TargetInfo*)
>>>>> let targets=0
>>>>> foreach ti of TargetInfo list:
>>>>>    if (machine::TypeImpl::is_avaible(ti))
>>>>>          targets |= 1 << ti->target_arch
>>>>>    fi
>>>>> endif
>>>>> So they basically have equivalent effect, and is_available will handle
>>>>> other code-needed condition properly such as
>>>>> CPU/AccelClass. not restrict to targets, we can also attach the
>>>>> KConfig into TargetInfo, so is_available(TargetInfo*)
>>>>> also works for Kconfig. that's why I insist this way, it's solved all
>>>>> the issues around.
>>>>>
>>>>> so  machine->targets = EMU_TARGET_X | EMU_TARGET_Y; is a good idea,
>>>>> and it can be implemented with TypeInfo::is_available(TargetInfo*)
>>>>> without much burden. and targets can be saved into a (machine or
>>>>> TypeImpl) for fast access when needed, we can compute it
>>>>> when the program starts.
>>>>>
>>>>
>>>> In what we described, there is no need to keep any kind of callback,
>>>> targets field is sufficient to filter any type declaratively.
>>>>
>>>> For the KConfig related types, I would really be keen to leave that
>>>> available for now, and add a proper error message later.
>>>
>>> Thanks, much clearer now, I was working for full KConfig related types support
>>> because I am trying to keep qemu-system-$arch to be a symlink to qemu-system
>>> which will still work without breaking anything. If we do not keep this then
>>> I machine::targets or TypeInfo::targets would be the best solution, I think
>>> TypeInfo::targets is better, and copy it into TypeImpl::targets. and give a API
>>> to retrieve it, for example:
>>> uint64_t *object_class_get_targets(ObjectClass *klass);
>>>
>>
>> We can exclude the goal to replace existing binaries with a symlink for now.
>>
>> Please do not add this to TypeInfo, but to MachineClass instead, as
>> explained in previous email.
> 
> I didn't see any simple way to do this, and don't know how, I am sorry.
> MachineClass init procedure is scattered, how would that be? I am
> afraid I am not
> able to get this done. If you can give some prepare work would be appreciated
>

You can take a look at "git grep mc->desc". That's where you want to set
targets. Also see MachineClass::desc, to see where to declare the field.

There might be some machine classes that lack a class_init function, and
thus will require to introduce it. If you find any occurrence that is
not easy to solve, let me know, I'll help on it.

>> If you want to reduce upcoming frustration, I would really recommend you
>> stick to this, and to a single machine to start. So we can validate the
>> series, review it, and then you can iterate.
>>  > Add "targets" struct members as TypeInfo::targets and
>> TypeImpl::targets, and
>>> copy from TypeInfo into TypeImpl for later access with
>>> object_class_get_targets
>>> Then we can use it for filtering machines and cpus without burden.
>>>
>>> How to dealt with
>>> https://lore.kernel.org/qemu-devel/20261007-rv-dedup-v2-6-8a2f0f296a7f@rev.ng/
>>>
>>> It's using is_available.
>>>
>>
>> .targets field can be conditioned by ifdef for config vs user, since
>> what we have everything needed in build system allows to duplicate
>> objects between user and system.
>>
>> #ifdef CONFIG_USER_ONLY
>>  .targets = ...
>> #else
>>  .targets = ...
>> #endif
>>
>> If that's not enough, it means the type has to be duplicated in some
>> ways to resolve ambiguity (especially for 32 vs 64 bits variants).
>>
>>> Maybe all using the way like
>>> Subject: [PATCH v2 07/18] target/riscv: Runtime register MAX and BARE CPUs
>>> https://lore.kernel.org/qemu-devel/20261007-rv-dedup-v2-7-8a2f0f296a7f@rev.ng/
>>
>> I would invite you to focus on a *single* machine first. See how to
>> declare it, and how to query which target it supports. Then we can see
>> what works/doesn't work, and (in a future series) we can do the same
>> thing for cpus.
>>
>> You'll see that this iterative approach works much better than sending
>> huge series. You have my word I'll be reactive and present to help
>> continue this effort.
>>
>> Regards,
>> Pierrick
> 
> 
> 



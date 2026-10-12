Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A4FCA9EBD
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 02:13:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xG5XO-0005la-SI; Sun, 11 Oct 2026 22:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xG5XM-0005l4-Hf
 for qemu-arm@nongnu.org; Sun, 11 Oct 2026 22:13:12 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xG5XK-0004SL-7d
 for qemu-arm@nongnu.org; Sun, 11 Oct 2026 22:13:12 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69C1lJFk1436915
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 02:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Q6/+JgKm8jY0VKquYWA7r+k5EnTN0P7KXKaFlGhrKAg=; b=Shy2tZ70W0IY6mN7
 1K3EtDQD6wELSTsS+FUj0K+eRiVGf9qUFBbPI9X2P4NxSc5S2ckg5U/QOIRLikQy
 e/KJbXuJHaVyETX5pV2eUGwM2Y33zqx4Y+6ZwMjRQXx5I7Au71gRb4WkL+UVL4iA
 ur6ARyyD3fEE4RUzBc83Q2XlyfPBfDCQkbLWhXHUNvd/crXckikwqj3zldCzAjkW
 iALkRl4ob7FPd58coSW9ng+l7v1YYDvcXm2mkN6EKmeIb1BRewyoCz9KGsKRU4iX
 6nUEj/wjrTO5UzKEe/Y4CzXMjfxTHYgPDNScdz/eNtUSielpEzkKm4blCuZPMS+c
 fklhzA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cxxmfcu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 02:13:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3ab2395f104so1036103a91.2
 for <qemu-arm@nongnu.org>; Sun, 11 Oct 2026 19:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791771186; x=1792375986; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Q6/+JgKm8jY0VKquYWA7r+k5EnTN0P7KXKaFlGhrKAg=;
 b=gczGH0BVis0MLY53xrlZ2/dboX1W/QiKnMLkxAHEChNVIa1DFgcn6OPeFmANrXUb+c
 jVvOP6BDDaDoNUeeQ2+ObKQtT5rL7D2Inyg1TGa3ugC3yOdV33yvzPA07zR9rV/CDFvi
 326i1V4wLkt5Gpcy9Rdl4wNO6F2tDJJ3Iu83+RDRsE9ENdKXhM5i8w3JmJgDcP85t4Tb
 L3jcibk33XW9TP8LwK5WuQ+oVrr5DRYyWu72ePRctz4zWIyIdd1ZmZ2K8x7UqxtWDtNb
 25bSYOYuNiNhJyUhmLTrR1lsHxMiRPyA2H42o7xS/Ci2YcJXBZNcFQWjv0ygOdqdZd48
 a2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791771186; x=1792375986;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Q6/+JgKm8jY0VKquYWA7r+k5EnTN0P7KXKaFlGhrKAg=;
 b=cO1LmBdVATIjtP9NNzcYSFgYmlgbaxg/h4hazPZ9+52jPNoNP1bldaxILE2sCrxHHh
 f0Lhutdy5pyK5qo9yassvD7wOF40uF7nndw0NRV+U9IuxT8d6IKXTgz+ilUDAU9OmN+S
 eWuCG8/ku/8zU6i4bKGsMne7ipZKLjFVvg2n9z2dp3oePech1jyQ5zBQQ+h9zTaG7l5U
 Is0zKXuTQMXrkBH6cHQ6b/BogbRDTfSr0i7kZmYoRCB6CIbwSs3IAaX+xTAoTo20SRUP
 OYoJa+SIQ2lIvR39158NSaM2tpikGhICPBFTA9NHuMwguSRuPORUtSMty7qy2DaxeUi3
 Hvzw==
X-Forwarded-Encrypted: i=1;
 AKwUvByrrLcd/0dumZHLkNNjIk2DmK6tXK7b6OkveR2/KdTubf8Y/lMtr1hj1rz3jpFFM1o4seVIeVNkUQ==@nongnu.org
X-Gm-Message-State: AFq9FYI/RVbJpd0JnX/LBNWJti/r4GLwu8chtxn4DIRg5jzTBsJVBUzY
 b3/nOflxeYxUz7UgJUwt7crA2taga7cZxC3qyB6/NwQFwvAqAXv6YD+8ICx+KWKtTd+Ydc263wt
 6Dn8ytu4UVQ53Qp1via7VWl32bRKMPhB0uen1Z0vZPcYevjxICUsYPdM=
X-Gm-Gg: AYBFou1kHxnbcHt8caA1Fysk/G8kLmfupuVmT/XIbh7Ozbsexk2jX3j1uulVf/oJNuf
 sewmc8fML1z3wpK78BUqF7LhSEsyNVZjAixApg6fS7D+hYG9Jfgfp18fnzRTmlz1YUI3dflMShm
 A6EzLQxe3yU3UBlXjw50pGsYvszMwexf31x+PB+/N34g6GPARy0z0q4q4tAVkpICLsRwEwZWWhh
 Q+CWtSWcoQqKtAyR7HCFW5jK4KIYD8Hw9v7xb6MtLq343hK5brNpPgczX7wGX0FbF2rL4cWPjKj
 Zq7mb8s8tGKN/5Ylc6l8/7NoZ7aYBWStOSxVPgVK3p7cwkeVu93VZjQHrXt3Tl6xEgES4nQ3LKQ
 bzYvL6IMTtE9SM5ykOB3vXM9GG9AcBHO77BMHBsI32vCozvccnB1qaKyO
X-Received: by 2002:a17:90b:562c:b0:3a4:b3ac:904c with SMTP id
 98e67ed59e1d1-3ab3ac775bdmr6697267a91.51.1791771186090; 
 Sun, 11 Oct 2026 19:13:06 -0700 (PDT)
X-Received: by 2002:a17:90b:562c:b0:3a4:b3ac:904c with SMTP id
 98e67ed59e1d1-3ab3ac775bdmr6697252a91.51.1791771185499; 
 Sun, 11 Oct 2026 19:13:05 -0700 (PDT)
Received: from [192.168.1.169] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ab38fc9e52sm14130427a91.13.2026.10.11.19.13.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Oct 2026 19:13:04 -0700 (PDT)
Message-ID: <8cb24445-b659-4bd4-9497-888ce152e82d@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 19:13:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] qom: pass TargetInfo to the is_available callback
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
 <2390b3d7-6918-41e3-8532-c19de4cdd1ff@oss.qualcomm.com>
 <asdlbOZBSYIaCMIh@redhat.com>
 <CAE2XoE91XxoJRFpQ_1jhmX6LdxMyN16CF7RXxM62C5Ctkc1tig@mail.gmail.com>
 <42fd67c0-c20d-4bc4-bede-79073e4be4a1@oss.qualcomm.com>
 <CAE2XoE-gN5-vmE8r00Ds_Z=E1WePSFi_MJXjmy9ZuXEU_=o31g@mail.gmail.com>
 <3034c146-0697-4db7-acd4-8076b317a09e@oss.qualcomm.com>
 <CAE2XoE-gCTrpEeCROz9JMpPnTQXQ+AnBTR4RwdQhYizkExjK9w@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAE2XoE-gCTrpEeCROz9JMpPnTQXQ+AnBTR4RwdQhYizkExjK9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tIzXG0mYmO9aqz2FVUASPgW-GUcpY6Hp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAwOCBTYWx0ZWRfX7o/dXoAmzmgT
 TtxG8uSTreRQnX/AL15pODfBNiAJ8x35AgOeTG/nRq50KYt26RHxYBE9CzNaZ42ASpSZ1B1+Wj3
 vkQ8HmKcHWpAWNLzIzt+8OKaXkDzw1Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAwOCBTYWx0ZWRfX25EZ9vdoHXqf
 lnMCmynP1rauDpq8U3f5tNaN03LoTHLrITe84/qbWUEg2RTCTWMajKxtN8ZEdFrsoK5vVHREIM5
 Widq14AJHz/yAlqTQS/a8fSwuLoD56DsIL/8+DYls+YC2rams1pWNF5GCJITqkXHa3M/NOwkhQF
 ytND+NT/mNDBNxUbyWdUspnzSCOyg1cfhufghS0+pjgkohLjcurGIstZB7ZSdIBE/jJgdcyVu+V
 I6zYAHGgeZEJ/g9LmzOziGkO7/N/y6IsEp0fWMwjXY3ES6mzfi7D1AgkstLzMdSspvDQiWRLhc1
 vpgeb2nAP+EC/jdiT/Qe6MZfEg7SiRLxC0kaptCBapTmTnyQnowNrYfUQANzxF7+/PAttaQ5gUH
 JF8OES6CJKEFbVhv1Qw74vGhwnFcx5arNASZ7W/e9AiijDAkGSIZpJs+ZP+P5kamMnk0+m2KgZe
 wx26bzw7tMC8NIOqx/g==
X-Authority-Analysis: v=2.4 cv=AsJ7T+9P c=1 sm=1 tr=0 ts=6acc4233 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=B-3GWC4AWTgxg7b-HyEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: tIzXG0mYmO9aqz2FVUASPgW-GUcpY6Hp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120008
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

On 10/11/26 1:22 PM, Yonggang Luo wrote:
> On Fri, Oct 9, 2026 at 2:34 AM Pierrick Bouvier
> <pierrick.bouvier@oss.qualcomm.com> wrote:
>>
>> On 10/8/2026 10:13 AM, Yonggang Luo wrote:
>>> On Fri, Oct 9, 2026 at 12:06 AM Pierrick Bouvier
>>> <pierrick.bouvier@oss.qualcomm.com> wrote:
>>>>
>>>> On 10/8/2026 2:46 AM, Yonggang Luo wrote:
>>>>> On Thu, Oct 8, 2026 at 5:42 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>>>>
>>>>>> On Wed, Oct 07, 2026 at 01:25:46PM -0700, Pierrick Bouvier wrote:
>>>>>>> On 10/7/2026 4:47 AM, Yonggang Luo wrote:
>>>>>>>> This allows a combined binary to register machine types from all its targets.
>>>>>>>> Consequently, QMP `query-machines` can return machine entries from every
>>>>>>>> target, even when `none` is selected. For example, a client can query the
>>>>>>>> combined machine list with:
>>>>>>>>
>>>>>>>> ```json
>>>>>>>> { "execute": "query-machines" }
>>>>>>>> ```
>>>>>>>>
>>>>>>>> The returned list includes the registered machine classes from all linked
>>>>>>>> targets. This is separate from selecting a machine: with `-target none`,
>>>>>>>> `-M virt` reports the targets that provide `virt` instead of choosing one
>>>>>>>> arbitrarily:
>>>>>>>>
>>>>>>>> ```text
>>>>>>>> qemu-system -target none -M virt
>>>>>>>> unsupported machine type: "virt" for target "none"
>>>>>>>> Available for targets:
>>>>>>>>    aarch64
>>>>>>>>    arm
>>>>>>>> ```
>>>>>>>>
>>>>>>>
>>>>>>>  From the long conversation on a previous thread, I thought we reached
>>>>>>> the conclusion that if we didn't expose any ambiguous name, then -target
>>>>>>> option is unnecessary, or maybe I got lost on track of this thread.
>>>>>>>
>>>>>>> https://lore.kernel.org/qemu-devel/ar_coT44h5-zJPVV@redhat.com/
>>>>>>>
>>>>>>> I'm not sure which semantic we want to have with -target none. If there
>>>>>>> is no ambiguous name registered, we just don't need it at all. It's a
>>>>>>> win-win IMHO.
>>>>>>
>>>>>> Yes, if we expose unique names for every machine, then -target is then
>>>>>> redundant.
>>>>>
>>>>> so how to diff riscv32-virt and risv64-virt? oh so for this machine we
>>>>> needs two name?
>>>>> "virt" needs register twice for it? or register only a single time,
>>>>> but we prefix the target_name()
>>>>> automatically? for example machine::name === "virt", but we can use
>>>>> "riscv32-virt" "risv64-virt" to reach it?
>>>>>
>>>>
>>>> Yes, ideally we should have different variant of virt for 32/64 bit.
>>>> Same goes for cpu max types.
>>>>
>>>> QOM type is always registered unambiguously ("$arch-virt"). Then, for
>>>> the "alias" name, which is virt, in case multiple matches are found,
>>>> command line can return an error with list of unambiguous names to call it.
>>>>
>>>> $ qemu-system -M virt
>>>> Multiple virt machines are available. Please choose one of them:
>>>> - aarch64-virt
>>>> - riscv64-virt
>>>>
>>>> There is no "parsing" of the argument, it's just the real QOM type. Then
>>>> we can find which target it implements from mc->targets.
>>>> And then, we can automatically choose which cpus should be available
>>>> based on that, thanks to cpu->targets.
>>>>
>>>> For existing binaries, nothing change.
>>>
>>> Good, I think we found a clean way now, is_available should be
>>> removed, and TypeInfo::targets and TypeImpl::targets should be added.
>>
>> It goes into MachineClass only for now.
>>
>>> I think
>>> for "virt" we can add a shared hw/machine-virt.c instead, and forwarding to
>>> the $arch specific virt. so that we only have a single "virt" registered.
>>> And it's
>>> targets is
>>> QEMU_ARCH_I386 |
>>> QEMU_ARCH_ARM |
>>> QEMU_ARCH_RISCV |
>>> QEMU_ARCH_LOONGARCH |
>>> QEMU_ARCH_M68K |
>>> QEMU_ARCH_OR1K |
>>> QEMU_ARCH_XTENSA |
>>> QEMU_ARCH_HEXAGON
>>>
>>> So that we won't have a list of conflict QOM names for "virt" machines.
>>> As now we indeed have only a single "virt" machine that redirects to
>>> different targets.
>>>
>>
>> The idea looks appealing, but I don't think it solves the problem to
>> have multiple virt variants available at the same time.
>>
>> The "alias" idea you introduced before is good, we just need to add a
>> check if an alias is really unique, else return an error, as explained
>> previously.
>>
>> If "-M aarch64-virt" works for both the new and existing binary, and -M
>> virt only for existing binaries (and ambiguous for new one), I think
>> that's a safe approach.
>>
>>>
>>> For other types also conflict can be handled in the same way, such as
>>> "-cpu host" "-cpu max"
>>> maybe others, but I think they all have the same way to deal with.
>>>
>>>
>>> That's why  TypeInfo::targets and TypeImpl::targets better than sole
>>> Machine::targets
>>>
>>
>> One step at a time.
>> Let's keep focused on declaring targets for a single machine first.
>> Then we can iterate to solve the "virt" problem.
>> Then convert all the existing machines and add a check in machine-target.c
>> Then, and only then, we can see what happens with cpus.
> 
> I tried this idea, but I faced a fatal error, because the
> target_info() is not available until
> the machine selected(the target arch will be select just along with
> the machine selected), so basically
> all calls to target_info() would raise an error(null pointer), how to
> deal with it?
>

I see. Indeed, since we can't set a target before registering all types, 
it implies that all the types class_init can't use target_* functions.


- register_accel_target_type
- cpu_max_v8_register_type


>>
>> Regards,
>> Pierrick
> 
> 
> 



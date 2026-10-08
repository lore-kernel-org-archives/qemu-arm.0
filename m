Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14F7CA6011
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Oct 2026 18:34:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEswe-0003iL-Dr; Thu, 08 Oct 2026 14:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEswZ-0003hQ-9r
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 14:34:15 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEswW-00041c-US
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 14:34:15 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 698HVQp03542609
 for <qemu-arm@nongnu.org>; Thu, 8 Oct 2026 18:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 I6RQDVToS6uGgYxhYq5AKIb8KaX7tucdYOEL6FCsKA4=; b=dIoLKXrJ5pBgnYhL
 UCCq+Sq0N4ET5725740KZe1jnSr1F0Rj1MFbGZLspy5EW4b5JuvpJxLjjHz2wfW9
 McqSMp39gazLaN1nX3LthkGqny2jMm4XC8Tp1fpbEWET9lrmtaiu6dpIihn3mqH6
 /S1FFNxTWjJVz+jAGThn5TwLqAzTKixDSeybgXOtwhS8SYDXDA0Gw9V+mfpPMijy
 Ig105gtvySGMyACRqrorDhcHQYFbJ9X5gq9HfubwnaqnL+RCGtNU+LXJniQSHG8Z
 MDJgCuZYxWiarDNrGZX6kKCi/+XOuDIi77/0z4vwH5S7M2WKXFmKOqvG9oulK71q
 uW3inQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj1cje-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2026 18:34:10 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-cd0cf3b1c70so1825784a12.3
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2026 11:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791484450; x=1792089250; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=I6RQDVToS6uGgYxhYq5AKIb8KaX7tucdYOEL6FCsKA4=;
 b=chiwQVDEwQfWtHW62kRKRqFgJAfP2Qx6f8CmFmu485tnOxF9dB/2rKqwPMMTsg6K02
 wXBFFx8E7kVspN0KdgVGb8Wknn1DkqxA9ieJ8clORk+jc5U7gmz62Zp01KLuGLT4Uvfa
 B/8O82BOm+UkrJWXFAiuLDch/NPC1iKizkXUsQAYpgmRKwz6RVJcLGtpNyDo4dng+6TN
 KgUVTj38vvDWBiS2D6837gmwVUWq22+SsHXkjDO/1YZ8/3YKhz81nqgzP77qE+1LGMmf
 wPA6wtMoJZ3YtmwnVjJFAbWHvNusfEpZXF6XUWYPlzHQwKgZk1kSTNIjeP+mD2nElmsz
 ls9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791484450; x=1792089250;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=I6RQDVToS6uGgYxhYq5AKIb8KaX7tucdYOEL6FCsKA4=;
 b=kWeCcuU4ODVovKKb+7HQ8Dm1gb2FvAq9XHs88ke3MRvsOUlXiDVCA9cxIQXyFAWehR
 LijWS/24H4GahwzE6DW7nefejE5RjSiN1L7ZjbjXHe2Fh9a/DDiu2Sx86he1DnD5M00c
 QAUsB4Jsyo3nKQ1bjVAf2mOm/TZXUn2lXZNQ/MXLClALxxeZXCm46X9fdTdL1coC9jDO
 aMRlD3FGcKX+LXk3Z9GqmbZFAuenhQmfjxRkUFoOsRIh73+mFQ/n71XgWVSneu4wHq2A
 nD9VzCUh94foQsJ0LLhuYLGuR5S2SAfAMiIE7ZxZN5QM/Zg4Wf+ZCIpK4CCVXLnbg79I
 prag==
X-Forwarded-Encrypted: i=1;
 AKwUvBzefFhz63QfnMwuGcHy+1dD8n4ukreGNORji4wNYYZo/KuCAqzBj87ABEVqGAqBn1SlvewOgKz7Ng==@nongnu.org
X-Gm-Message-State: AFuF++nHO4skqQElbIVT09wL32eIjFb9CFqWAhqC/AAjFWBFX/mMMF0k
 Ia7Y8dMrtJrHXOhZJMvnin8tpKW5skkU42wyoZUObMhszFoIyag+wkXfvjcKQoyKef6fqHcDKbB
 WN91oY+Tqtt2LrEQu7GeT/vQER4MAwiVORQdOIXA1a404Q/jbm5CLGzE=
X-Gm-Gg: AYBFou1A3Yk24xL4Xnfb6A5OZVy/0N6PhthGYOVJq4o3bcaDcyrdHz9WcEE4gCKD9i9
 t5+iC8mOoQk50MSyjqQ8JrZUov/uS8pIQWjNSz4lU7xR0LV47bvXrEmvwtKRyZvO5wxMd1Orvg4
 qNw36FP8GbExeI6byOMpX+sZ//C2Zi/Uz2aeNPq11vSNxFuyth6eI+CgVI1dITd8icbMpduWWn8
 WqpBFzA0866mw9pUROlYPZgyGz+88UZegwOsRdB4q0YgHUQGklrKUfnFTNOfHlyKi17G0p9GA62
 uGuD1yYYxzAX9kPmdSeLZibtdShd67+DdIwH1ZiEO4oDFd+4QA1leIWktdZWex0lXiA1IrWdgj/
 g6KC+eMvfRHu3J1OuwmxJmA9gz9jgS+EQpBWT5WMGqzqU3rQ0j3vfZJnLdfae6wIfac5yZg==
X-Received: by 2002:a05:6a21:489:b0:3dd:a195:fa12 with SMTP id
 adf61e73a8af0-3e1340ec207mr5317422637.55.1791484449787; 
 Thu, 08 Oct 2026 11:34:09 -0700 (PDT)
X-Received: by 2002:a05:6a21:489:b0:3dd:a195:fa12 with SMTP id
 adf61e73a8af0-3e1340ec207mr5317400637.55.1791484449240; 
 Thu, 08 Oct 2026 11:34:09 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cd3a5082926sm223288a12.2.2026.10.08.11.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 11:34:08 -0700 (PDT)
Message-ID: <3034c146-0697-4db7-acd4-8076b317a09e@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:34:07 -0700
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
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAE2XoE-gN5-vmE8r00Ds_Z=E1WePSFi_MJXjmy9ZuXEU_=o31g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA3MyBTYWx0ZWRfX45iig69A9X1e
 If3jJF5/AJqryPWrXSUS61AXKluQEfOrOamqbaPntgfyVXFj6YdR4IdltFFDEZR8KUnw0b6dGfL
 yn6g3BNPlPdhy4g5bl1cBT4m3HoM13EtM8lD4cS/aNreUHo3VWnhpvZgX0M9WIbBVLr+Jaye2sn
 jN7pf0vMnpM1cTI5vWPWKq2sjF4ePqcNYWNjMcg2eEK0S4eUMPp5nvaWvmFncVc7/VNyOa+fglT
 gtpnkwUPNISkOOUhnxDlfj0RgLSK0n//N2pKvEUfzidfFnI+f8X1rS5P/hypffWwTUFcm8O0Y6g
 0uUfU0e0v/6mYt4fNXXGUFphOPXjKTMV21R0JahIIvQnFRWRg1Mz5o2hx9CIImXJS4y21c6RQKn
 jCrVioTemUBREQbEuhSnKu0/kwJVfGv6XnPt7dl2MvO2WZX2PFxEf0PyQmwEfPYuodCLb1978pR
 NG9K6mzoDyFlJ3fNcoA==
X-Proofpoint-GUID: alsSFfLcPwjwkolEm7AS0aA1TcMIkhji
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac7e222 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=YVV9U6z2R0o8oJsJggoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: alsSFfLcPwjwkolEm7AS0aA1TcMIkhji
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA3MyBTYWx0ZWRfXzVpeyNH0vfFH
 /ScgTg4o4+zfX7x6bjGDkdDy41WMo2i6tOphCjIwRpJ3ok3zGMKc6SA5Gwl8w8ybNw0hIKyMLpu
 fG+tqA+ScprQ9AdO3gCHO/GTfVqzg5g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_06,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080073
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

On 10/8/2026 10:13 AM, Yonggang Luo wrote:
> On Fri, Oct 9, 2026 at 12:06 AM Pierrick Bouvier
> <pierrick.bouvier@oss.qualcomm.com> wrote:
>>
>> On 10/8/2026 2:46 AM, Yonggang Luo wrote:
>>> On Thu, Oct 8, 2026 at 5:42 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>>
>>>> On Wed, Oct 07, 2026 at 01:25:46PM -0700, Pierrick Bouvier wrote:
>>>>> On 10/7/2026 4:47 AM, Yonggang Luo wrote:
>>>>>> This allows a combined binary to register machine types from all its targets.
>>>>>> Consequently, QMP `query-machines` can return machine entries from every
>>>>>> target, even when `none` is selected. For example, a client can query the
>>>>>> combined machine list with:
>>>>>>
>>>>>> ```json
>>>>>> { "execute": "query-machines" }
>>>>>> ```
>>>>>>
>>>>>> The returned list includes the registered machine classes from all linked
>>>>>> targets. This is separate from selecting a machine: with `-target none`,
>>>>>> `-M virt` reports the targets that provide `virt` instead of choosing one
>>>>>> arbitrarily:
>>>>>>
>>>>>> ```text
>>>>>> qemu-system -target none -M virt
>>>>>> unsupported machine type: "virt" for target "none"
>>>>>> Available for targets:
>>>>>>   aarch64
>>>>>>   arm
>>>>>> ```
>>>>>>
>>>>>
>>>>> From the long conversation on a previous thread, I thought we reached
>>>>> the conclusion that if we didn't expose any ambiguous name, then -target
>>>>> option is unnecessary, or maybe I got lost on track of this thread.
>>>>>
>>>>> https://lore.kernel.org/qemu-devel/ar_coT44h5-zJPVV@redhat.com/
>>>>>
>>>>> I'm not sure which semantic we want to have with -target none. If there
>>>>> is no ambiguous name registered, we just don't need it at all. It's a
>>>>> win-win IMHO.
>>>>
>>>> Yes, if we expose unique names for every machine, then -target is then
>>>> redundant.
>>>
>>> so how to diff riscv32-virt and risv64-virt? oh so for this machine we
>>> needs two name?
>>> "virt" needs register twice for it? or register only a single time,
>>> but we prefix the target_name()
>>> automatically? for example machine::name === "virt", but we can use
>>> "riscv32-virt" "risv64-virt" to reach it?
>>>
>>
>> Yes, ideally we should have different variant of virt for 32/64 bit.
>> Same goes for cpu max types.
>>
>> QOM type is always registered unambiguously ("$arch-virt"). Then, for
>> the "alias" name, which is virt, in case multiple matches are found,
>> command line can return an error with list of unambiguous names to call it.
>>
>> $ qemu-system -M virt
>> Multiple virt machines are available. Please choose one of them:
>> - aarch64-virt
>> - riscv64-virt
>>
>> There is no "parsing" of the argument, it's just the real QOM type. Then
>> we can find which target it implements from mc->targets.
>> And then, we can automatically choose which cpus should be available
>> based on that, thanks to cpu->targets.
>>
>> For existing binaries, nothing change.
> 
> Good, I think we found a clean way now, is_available should be
> removed, and TypeInfo::targets and TypeImpl::targets should be added.

It goes into MachineClass only for now.

> I think
> for "virt" we can add a shared hw/machine-virt.c instead, and forwarding to
> the $arch specific virt. so that we only have a single "virt" registered.
> And it's
> targets is
> QEMU_ARCH_I386 |
> QEMU_ARCH_ARM |
> QEMU_ARCH_RISCV |
> QEMU_ARCH_LOONGARCH |
> QEMU_ARCH_M68K |
> QEMU_ARCH_OR1K |
> QEMU_ARCH_XTENSA |
> QEMU_ARCH_HEXAGON
> 
> So that we won't have a list of conflict QOM names for "virt" machines.
> As now we indeed have only a single "virt" machine that redirects to
> different targets.
>

The idea looks appealing, but I don't think it solves the problem to
have multiple virt variants available at the same time.

The "alias" idea you introduced before is good, we just need to add a
check if an alias is really unique, else return an error, as explained
previously.

If "-M aarch64-virt" works for both the new and existing binary, and -M
virt only for existing binaries (and ambiguous for new one), I think
that's a safe approach.

> 
> For other types also conflict can be handled in the same way, such as
> "-cpu host" "-cpu max"
> maybe others, but I think they all have the same way to deal with.
> 
> 
> That's why  TypeInfo::targets and TypeImpl::targets better than sole
> Machine::targets
>

One step at a time.
Let's keep focused on declaring targets for a single machine first.
Then we can iterate to solve the "virt" problem.
Then convert all the existing machines and add a check in machine-target.c
Then, and only then, we can see what happens with cpus.

Regards,
Pierrick


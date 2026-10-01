Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE8BCA5FCE
	for <qemu-arm@archiver.kernel.org>; Thu,  1 Oct 2026 18:56:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCLxL-0001Zo-63; Thu, 01 Oct 2026 14:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCLxJ-0001ZM-AZ
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 14:56:33 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCLxG-0000Mh-8p
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 14:56:32 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 691FswtE3512994
 for <qemu-arm@nongnu.org>; Thu, 1 Oct 2026 18:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xA0SSlzfAekLpMiBSGJQhPdptD6jswNKhKq/fw8IuVg=; b=nniolruSDAzxweGw
 oVap6Zk11lTOLovPMiiO2lnp6HJ70f/F7bj6jbA2EGB26eS2a+d8uhj3KLXtsbe5
 cS5m2MkftzeiSMChpTSmzVbQ1cybLIFW+bxoS99ZIpGnI98w+2XvFz1yjzlQzJp5
 /snE7SIwNVBnpbGxLJyOCxL8i4qztO2R/9s29UYbJ0eK0y8OW9BTXhZOrFJppnFC
 mJ3XNJ7HpC7+Ydp7X841No/3uK0phdBEVBPX5GkwrKbrbPcGtMuOEnkbItgRhKj3
 SbTUVYh4HvehrN7TNKrt3FxjieAWdxUm0b4hpky1BBUy+wPxmd7J92VytSkbXZIh
 /ctUFQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1quk9pn6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 18:56:18 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-30f1b904861so8970031eec.0
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 11:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790880978; x=1791485778; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=xA0SSlzfAekLpMiBSGJQhPdptD6jswNKhKq/fw8IuVg=;
 b=YxPTeeYBWoCaGr5h3H2+y5T8wF9gc/GusBBsjzF7oiCQ/j2BCDEoiXuK/3nbPu8noS
 HmR29U2BhMGPy5WwhWEKduk6C6whtKjxecoRpUBG9Sy5UegHUKUGjq3Zv0oeI2ZDt4B5
 OAoa/O3qxzjzzFOy1MxrW/8fO4+gzQjtIWDiYOXHwkHCOUy0s+vi3LfSElVVB4woMecW
 YgdCA59oAfIl5MtFBimLRGMyE3meSoZxAWEk2Q6/aA6YK5l5gS2Q7izM2BHIWahPtE89
 nwrIyo3SsVxjWxLD3zjD49f3nk+zqfbv2AlY/miSeMuA+RGkGznmx/YEfegu52VmE3o4
 1IfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790880978; x=1791485778;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xA0SSlzfAekLpMiBSGJQhPdptD6jswNKhKq/fw8IuVg=;
 b=UH/gcveZN0WMprTLqArusVtPtiCrBuqOU9Gbm6nMTfoyVvH75dYzzIXJDer/HDcUyc
 TsPNQYz9n/iIUtbREu+j1+IQUEE1RL4xUed6QlS8D3W/0B9s1jdp1YGcwyS2AcCjsk00
 rFHoEGK/UH+6nk3tTKezffwIJrnB7ITXlUJcQ0riQYEh5i/ihx7NWehdytRkW8u4ZY+t
 zuxeBtJLXXS/LecKTAFCs19jQntX12Wdax2c6MePV3pza5PiqgawGqtADTTFgezjlF9X
 T6j7wF4sIMzMyEvX+DKmNdnFEYtSW1Gywl5VpHdC8PKE78dg3JJgqGljqtqMSfvLrmq1
 Pepg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxCCxN8ciS8V7frjCspG2XltznBNLXBjqkrkHuUIx7u7alQsiGW4Ackkfh7jCv7+bk7DsgwvPsvPA==@nongnu.org
X-Gm-Message-State: AFuF++nRWWKkXxFow1zHF6JK5Cn8GMNT17f6T3x63wP8IHUtzuajGs1q
 jR0HDVwH7MM95feag8ThmOgCfv4lGvUQNd2WGDY1ggm+YWkrZ/EKhgVfux/kaBbOasCUzQdGKTp
 CwDEwsGO6HQ0inVyy9d6qBW8RM3tMUvsmGuqbJ+cVFTp71bC/RDlmNS4=
X-Gm-Gg: AYBFou2SAF5QQVT8sPI5saTKiJxUff2K9s5MYqDzScm2m5+m0m5UX/YjtGZfaqWm+BE
 TPmD6fRUorSmYwte5KJE4HVKsa7LFMD7xBA1tEBMrqI6X6eil0zODPejZMzir+vpvsUgRxoymDF
 +OgIWndXf4vLR4butOHwqBqBNNddH9MatBnRsgKE24+VxqKBWnYR7mZN/Y0dlVSnSXCKCulyKRE
 xtYrpjv+oDwlobJH7Rrjm758Zz+wKil8yScuXxknm7HBs3D+e7VEs5uQCxakFD+mSKqr6tLiWmu
 Y3MvLfsHzs0JmC6XXO+j7rLug5olnUWlZuLSF0xijwPlCuDXLrSAjD1OjfM2xrB0WFAp9jl0Wto
 TDTQ+uPV3MDfvwU7o/8rCkoy4ZeKy0T+TL4CwwI48bhDIOq7/2jEeKu8px0RibeyoXKWyvA==
X-Received: by 2002:a05:701b:4544:10b0:148:bbae:ad2b with SMTP id
 a92af1059eb24-14f5b026a8bmr62487c88.11.1790880977309; 
 Thu, 01 Oct 2026 11:56:17 -0700 (PDT)
X-Received: by 2002:a05:701b:4544:10b0:148:bbae:ad2b with SMTP id
 a92af1059eb24-14f5b026a8bmr62433c88.11.1790880976640; 
 Thu, 01 Oct 2026 11:56:16 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14f45fee0afsm485377c88.5.2026.10.01.11.56.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 11:56:16 -0700 (PDT)
Message-ID: <557262df-b8e7-49b5-a245-ae46b8885b30@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 11:56:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/10] machine: allow -M name to differ from QOM type
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: luoyonggang@gmail.com, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org, Chao Liu <chao.liu@processmission.com>,
 Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Stafford Horne <shorne@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Song Gao <17746591750@163.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <82250296-78bc-4345-9e57-1fcac485d18a@oss.qualcomm.com>
 <CAE2XoE_+nhj58M9_yx6wf532qCSVcERpTw7F4AU7PXN7prhpzg@mail.gmail.com>
 <74853ef8-7315-466a-99ac-41c8182f9b13@oss.qualcomm.com>
 <ar4TQtKqfXX5Ul9O@redhat.com>
 <CAE2XoE8q3LYJ-JCTbRBk4iPdUQdRE8zzmOgiZ=HEXDL78iw8UQ@mail.gmail.com>
 <26b0d44d-0322-4ceb-a47b-747fc52c61b7@oss.qualcomm.com>
 <CAE2XoE8VyCpPCqRVFArBn_dDsyMw8vrSJxWMhKq17btZvO2n6A@mail.gmail.com>
 <b02db9e2-b348-4011-a98d-122e9d9f17e5@oss.qualcomm.com>
 <ar6a_uDw9OeLng6c@redhat.com>
 <6bf4dad5-4fa2-4df1-b6b8-d594dbd3842c@oss.qualcomm.com>
 <ar6lw3jAcnVej6vK@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ar6lw3jAcnVej6vK@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA3NSBTYWx0ZWRfX4Krkfh0pgjiS
 eGby5pIse4/8xxAUTnIQ1L7ioakXnqRLdrleasp/xHYKYgk9fu1piR+nZyvbicZu64HnQXsBIRV
 6VmiFNSN56HDwbxARtyMi+FT49k1yQs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA3NSBTYWx0ZWRfX0bPaLtEf1ioF
 aw6xgqc1bzmnCa71I0bdJwurtvjkAYeogyicTQOcWZRVVoC7AndRxbcGQTf3ffu+aXLDCRFJpnm
 Z6jDqRODnUndSqrMR54qbmzPtUaQc+CTUaEke3pZMYjKzmS0+4ejzrS1a8x9FKyu/MliGAJfwv8
 9nH5VS+SvUyafmT5ZvBMyvO2dr2Uss2DR3BtYd2TwbG2pVS3arofDUJUAObSM07/bBnUz+TETlQ
 zylAb2fjNXiYfwz7F2lKhpPvCMg0tlYbEy8f5xmlBHsS2ugCFchNjbJfFSwlACKdIoDqIzJ+WKp
 N0bCT/4km25kGMu+jhSuMvixe+u6WkLuOs1PHA5pLV5tZL7uQbUQBU3Z7NLGXaWyn+8cVqo/1Jn
 DoUQ4O9/gKI63Io10/VbM5w7QIOppNrks2MCCAzLudixLIP1OxDdrNxC6N70S/kpZbM5qrEjII7
 WlOuR2xx+y/NXML+0Yw==
X-Proofpoint-GUID: Gin03Z63WkuDVMpCGouGnRq9vA49dLmO
X-Authority-Analysis: v=2.4 cv=TdADJhQh c=1 sm=1 tr=0 ts=6abeacd2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=T7V-FT_ZZS74wq254kgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: Gin03Z63WkuDVMpCGouGnRq9vA49dLmO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010075
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

On 10/1/2026 11:26 AM, Daniel P. Berrangé wrote:
> On Thu, Oct 01, 2026 at 11:08:17AM -0700, Pierrick Bouvier wrote:
>> On 10/1/2026 10:40 AM, Daniel P. Berrangé wrote:
>>> Even with the current per-target binaries there are countless
>>> devices linked in which are incompatible / not usable with
>>> certain machine types. A new multi-target binary with a union
>>> of all devices will just be a bigger example of a scenario that
>>> already has to be dealt with for today's binaries.
>>>
>>> So if we have that assumption that we don't need to do device
>>> filtering, at that point, a --target option doesn't have as
>>> big of a role to play. The machine type code knows what target(s)
>>> it wants (1 or 2 targets depending on if there are 32 + 64 bit
>>> varaints. The CPU model the user requests (if the CPU is not
>>> hardcoded by the machine), determines 32 bit vs 64 bit.
>>>
>>
>> How can we deduce this information (bitness or target for existing
>> machines/cpus)?
> 
> It would require that we introduce a new field in MachineClass
> that returned that information about what target a machine is
> associated with.
> 
> I note the SysEmuTarget covers both 32-bit and 64-bit variants.
> 
> It might be better use QEMU_ARCH which correlates directly to
> the TCG targets, rather than the traditional binary target
> names ?
> 
> Likely the CPU class would also want to declare its list of
> supported targets.
>

QEMU_ARCH only represents base architectures, and not variant, so
SysEmuTarget is the right choice.

So, we would need a list of SysEmuTarget for every cpu/machine that is
target specific, since one could be available for variants of base arch?

@Yonggang: can you try to provide a RFC based on this, to see what it
could look like? No need to cover all machines/cpus, just select one of
machine+cpu, ideally with multiple SysEmuTarget (like virt and max cpu
for aarch64), and let's iterate from this.

@Daniel: how do we deal with machines available for all targets like
null? We would need a way to ensure all machines/cpus are tagged
correctly, in an independent way from "available for all", without
having to repeat all existing SysEmuTarget.

>> Also, how to deal with devices that are only available for some targets,
>> but not others, depending on various Kconfig knobs?
> 
> IMHO just leave devices to raise an error when passed to '-device'
> if not compatible with the requested machine.
> 
> eg this example from x86 world:
> 
>   $ qemu-system-x86_64 -M microvm -device xen-disk
>   qemu-system-x86_64: -device xen-disk: No 'xen-bus' bus found for device 'xen-disk'
> 
>   $ qemu-system-x86_64 -M isapc -device virtio-net-pci
>   qemu-system-x86_64: -device virtio-net-pci: No 'PCI' bus found for device 'virtio-net-pci'
> 
> Hopefully most devices have sane error reporting when they
> find a dependancy they have is not satisfied by the machine,
> but if some end up asserting with crashes that's not a
> blocker. Those asserts can be turned into pretty error
> messages at our leisure by whomever cares about improving
> error diagnosis.
>

Fine for me. I am a bit skeptical this will be possible to catch all
issues, but let's try!

>>> A --target option (or similar -machine name,target=xxx) could
>>> be used to dis-ambiguate between 'virt' machines if keeping
>>> their user facing machine names as-is, or it could be used as
>>> a way to be more explicit about the 32-bit vs 64-bit choice
>>> and sanity checked against the CPU model choice.
>>>
>>
>> We could also not register them as virt if more than one target is
>> detected, so people have to call explicitly aarch64-virt.
>> Would that be a possible way to move forward?
> 
> Yes, we could diverge in the naming of the machines for the
> existing binary, vs the new multi-binary, and that could well
> be the sanest & simplest option in fact.
>

So, for existing binary: -M virt works as before.

For new multi binary:
$ qemu-system -M virt:
Multiple machines were found, select one among:
- aarch64-virt
- riscv64-virt

Does it matches what you would expect?

Also, for compatibility with existing binaries, should we accept -M
$arch-virt also? I feel like it does not hurt and would make thing
simpler to switch between existing and new binary.

> With regards,
> Daniel

Regards,
Pierrick


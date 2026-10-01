Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372E1CA5FCF
	for <qemu-arm@archiver.kernel.org>; Thu,  1 Oct 2026 18:08:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCLCv-0003fY-Ui; Thu, 01 Oct 2026 14:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCLCs-0003ek-Bu
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 14:08:35 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCLCo-0003cd-Hx
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 14:08:34 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 691Ft6ge3110578
 for <qemu-arm@nongnu.org>; Thu, 1 Oct 2026 18:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5K7m1L8mKqvo30Z/n9TpcPqcxooEdCbyy3woEyMg3Sw=; b=K9tltFe2bXo213wL
 ttjBpMUi25orNoaE94+ih9jgDe3ILpt/82+VZRqEc+t4UzLE75PELtoq7r+WKy03
 mFWgndC7nwiGAaSGlfrlvpSFqtvfXQ2fh/puGjwdoZNQ8JCKL8V6qk2EYIbDqEbK
 6gzoNZ5v88ZsYDQaXS6BKK8JO1xga1M0VKljInaGaSuHn+YUoOKIWbAOEaHO4T9h
 +L8WWuK8BrCfQMTOVr5UslVGksuchRec3H9iqKHIg5F/1czTOPjrjQ02xKhKwzvM
 XH8uCwvlMqsZzOziQePHggKH8mp6rhu5aovhEXIDhWUDZ1QSkbQvqNmr6oJQ4tpR
 ry64Xw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1jcfu2jx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 18:08:24 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id
 a92af1059eb24-14373747468so6469075c88.1
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 11:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790878103; x=1791482903; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5K7m1L8mKqvo30Z/n9TpcPqcxooEdCbyy3woEyMg3Sw=;
 b=duvqu0mjUuH9PnVWjWpRzvSf5nd2KQfuQC0TTE5mHpOILKIWpwgl4LZ/rflKk0SYbL
 8vtDuBcS4DHXVqed2/UKjvCMBlrpoG+qnVdUrb6P+wrQBrNBihWtLQXTm94Dl+2iX9h+
 rW1ajpt1KeTf/AG7iDTllNhehtrQsvzC5I35rjPzlLd2Ia4dq1Po6+XTx2r60idyCKTo
 Fsz9Eqqv8dtyUtW7pbk2inr99bRVsK8i+SwIb1DdfDK5UoCybJ9frMpLyRyDwIZyxEjr
 pn5HjzqZXW3q/OL1i42vvAjil350Oq8Up4eIGz4Jr34oJanrhG/cmQQR5+UdmORPzSLN
 fNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790878103; x=1791482903;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5K7m1L8mKqvo30Z/n9TpcPqcxooEdCbyy3woEyMg3Sw=;
 b=lJmltZJ0Aa3VKfXsi62Ia/tsFZePDzJvKzCxi1ZHnc/yYyNN8lg1ERF7x5Xz5soxjP
 +i3efdfYm3iMU4zLxue3iHgamV10G8y4t2YtcpG53Jlb3Ale9d3q394p2HUF/Yarh6wz
 /Z0IghtGWv5kV17wbt3AnQyXF3yhnN3JfaE01sURJcPJroauNJBvgb+ds82o8u6RsDTT
 YfGkO6b4xY9ZuM2popmZZXoOpfdhSFW8v5Z/0gaM7tX5aPOFJ4LGGOndOuETK6O4QqyP
 1LLF2pB8muD0t15kJTsihSguCZlL4/nNMPC4Py0qUm9ToIy7Z4PcvGl90yDyXsj1bfDD
 iQZg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzU9BzA8QdsJvKC7YCUY68vksvzKJ3RyuQ+XjO8CbA/1NclCK3CDhG9Xh8e+VXNSlMvDOu5V4u8Sg==@nongnu.org
X-Gm-Message-State: AFuF++nHoc8ehyTilnZQElYqKUNVZ/t77nIHnd4Hler/O7TVbetY4jed
 mtFUIQx6pNmN/RRNsA8Ekmd/XZChCuJuA6N+60z+Ex2PKWG1xShcnD+06lpKGcAy3ilcYPfP01E
 ZuBpZz76SlO9j7WL6wDCpshNI63CQh27y7ZhUPl/0y2pXg3jO7XQ23Xc=
X-Gm-Gg: AYBFou37tW8dFF6EruinRN05fMFD7Vm58Zy9jpHabIauE8/yzRIs/b7sqShFvvbI2pl
 MpWEkJKMY5sOfrhqBZODaBUa9L2l0KW9Ze5zsa37S6YyZ/+7vQgcAHRR1H5m4TVAN6pFCt5ROy4
 qikNoATvu2I9PTBDIK+hv0RqLBWNkOjQnDWlKYZX9sk8IjTPOCN6cextujDdnDyk3WrUh3ZahkN
 eVkSfkvVJHsC7+LfM+0LvYzEfgnOA1gnVGUJhFt/RdKWDBH7/K02b1WNLP/OpsuSghDEww/vkfu
 tbG89HW7xFlCGNgkw/HDljM8gvMoWk9He+Penmt9fn5VDaWrPV6NJK92w55ijOoT4QMOfIGrL34
 PLBOhsA2ivF5lwIjf0q5utdQ7GFfQZ2Ny6B699pcWFNSpv+/xXoIhb4F6uvFY47SWhAIDQw==
X-Received: by 2002:a05:701b:454d:20b0:143:54c6:6a5 with SMTP id
 a92af1059eb24-14d35193f6cmr5172406c88.37.1790878102933; 
 Thu, 01 Oct 2026 11:08:22 -0700 (PDT)
X-Received: by 2002:a05:701b:454d:20b0:143:54c6:6a5 with SMTP id
 a92af1059eb24-14d35193f6cmr5172243c88.37.1790878099813; 
 Thu, 01 Oct 2026 11:08:19 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14f43eba13bsm302559c88.2.2026.10.01.11.08.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 11:08:19 -0700 (PDT)
Message-ID: <6bf4dad5-4fa2-4df1-b6b8-d594dbd3842c@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 11:08:17 -0700
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
References: <20260926081551.29-1-luoyonggang@gmail.com>
 <20260926081551.29-2-luoyonggang@gmail.com>
 <82250296-78bc-4345-9e57-1fcac485d18a@oss.qualcomm.com>
 <CAE2XoE_+nhj58M9_yx6wf532qCSVcERpTw7F4AU7PXN7prhpzg@mail.gmail.com>
 <74853ef8-7315-466a-99ac-41c8182f9b13@oss.qualcomm.com>
 <ar4TQtKqfXX5Ul9O@redhat.com>
 <CAE2XoE8q3LYJ-JCTbRBk4iPdUQdRE8zzmOgiZ=HEXDL78iw8UQ@mail.gmail.com>
 <26b0d44d-0322-4ceb-a47b-747fc52c61b7@oss.qualcomm.com>
 <CAE2XoE8VyCpPCqRVFArBn_dDsyMw8vrSJxWMhKq17btZvO2n6A@mail.gmail.com>
 <b02db9e2-b348-4011-a98d-122e9d9f17e5@oss.qualcomm.com>
 <ar6a_uDw9OeLng6c@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ar6a_uDw9OeLng6c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA3MiBTYWx0ZWRfXyYwyr7Q+zqFA
 uAn7qy3bEZbRhOoAmkEFFMKiZyN5Z4P1y0Od/ZTdGoaUevMaVMFG7bYdKfroQUU67E1Sa12XThc
 TF1HH4ymK487PcaByZHZUmoQ0Ejbh/Y=
X-Proofpoint-GUID: HVX5y8Z3ydpWRVadXCwsMUHhJfm4Q2Kd
X-Authority-Analysis: v=2.4 cv=b4YncdGx c=1 sm=1 tr=0 ts=6abea198 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=p0WdMEafAAAA:8 a=voM4FWlXAAAA:8 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8
 a=pGLkceISAAAA:8 a=2UyaynILr8k7rYdUywsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: HVX5y8Z3ydpWRVadXCwsMUHhJfm4Q2Kd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA3MiBTYWx0ZWRfX0RaZcAeUDH1W
 xjp/Gg609Nq62kPAz6DrVflQzTwUeJjK8ewnOq+FGzHbOwTRapdK63z4auShdaj9OylL5cxJSAM
 hK1AD8KoRR0OV61keGEr3fncKD9foUILqutXwL1P0juPhQkeQVOTNQRs2ncV58oLEJtt6y8aOmQ
 63vpolON/cctEkoE3D0FZuH/BPpzRbf2wAiaY5GHAqvEcPGJL48qjpiuu//5x8puRBlisI36BwD
 GZkLkrbJuCyImso3m7oH6wSHv8p7Xs2CxWYRRhHLedF9AANE8cGaXKiPiQa6oMmEhe/tVGoaA7b
 oat+dzwq6IhjagvaCCfxXEG9oTXe5X+hMXS8kVItCc2TB7qA8wAHGCze1a6S17HruFfvyZXFLps
 T+kqH4CsJEizrMNvah4WnHEYdn4ULuU2sI8nlRJqVEsjdDAFeIXDNoGZSnFXz7EIIf8vsbYCw+r
 2Fh96nV3IFe9io4LL4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010072
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 10/1/2026 10:40 AM, Daniel P. Berrangé wrote:
> On Thu, Oct 01, 2026 at 09:19:48AM -0700, Pierrick Bouvier wrote:
>> On 10/1/2026 9:14 AM, Yonggang Luo wrote:
>>> On Thu, Oct 1, 2026 at 4:44 PM Philippe Mathieu-Daudé
>>> <philmd@oss.qualcomm.com> wrote:
>>>>
>>>> On 1/10/26 10:13, Yonggang Luo wrote:
>>>>> On Thu, Oct 1, 2026 at 4:01 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>>>>
>>>>>> On Wed, Sep 30, 2026 at 09:23:50PM -0700, Pierrick Bouvier wrote:
>>>>>>> On 9/30/26 6:55 PM, Yonggang Luo wrote:
>>>>>>>> On Thu, Oct 1, 2026 at 2:19 AM Pierrick Bouvier
>>>>>>>> <pierrick.bouvier@oss.qualcomm.com> wrote:
>>>>>>>>>
>>>>>>>>> On 9/26/26 1:15 AM, Yonggang Luo wrote:
>>>>>>>>>> - Add machine_class_set_name() so boards can keep a stable -M name
>>>>>>>>>>      when the QOM type is uniquified. machine_class_base_init still
>>>>>>>>>>      defaults the name to the QOM type without -machine.
>>>>>>>>>> - Document that MachineClass::name is the -M name, not the QOM type.
>>>>>>>>>> - Sort -M help by MachineClass::name so order matches the printed names
>>>>>>>>>>      when QOM types are prefixed (arm-virt-11.1-machine vs virt-11.1).
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>>>>>>>>>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>>>>>>>>>> ---
>>>>>>>>>>     hw/core/machine.c        |  6 ++++++
>>>>>>>>>>     include/hw/core/boards.h | 12 +++++++++++-
>>>>>>>>>>     system/vl.c              |  8 +++-----
>>>>>>>>>>     3 files changed, 20 insertions(+), 6 deletions(-)
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> First, I'm not opposed to this series, and if anyone wants to pull this,
>>>>>>>>> I'm ok with that decision. It's just unclear for me what will be
>>>>>>>>> direction after this step.
>>>>>>>>>
>>>>>>>>> If I understand correctly, the goal here is to allow to register
>>>>>>>>> multiple "virt" machines, while still having distinct QOM types behind
>>>>>>>>> the hood, which does no affect behavior of current binaries who have
>>>>>>>>> only a single "virt" type at most.
>>>>>>>>>
>>>>>>>>> That said, if we project in the future where we have a binary with
>>>>>>>>> multiple of those "virt" machines, how will the current series help? The
>>>>>>>>> situation we'll have is distinct QOM types, that all answer to the name
>>>>>>>>> "virt", so we have no way to select them individually.
>>>>>>>>>
>>>>>>>>> Slightly worse, find_machine() will just pick the first machine name
>>>>>>>>> virt, which is a non-deterministic order at the moment.
>>>>>>>>> https://gitlab.com/qemu-project/qemu/-/blob/master/system/vl.c?ref_type=heads#L846
>>>>>>>>
>>>>>>>> That will handle it properly. For single-target binary qemu-system-$arch.exe,
>>>>>>>> this won't be an issue, as there is no conflict as they won't be compiled in.
>>>>>>>> For multi-target binary qemu-system.exe, we will choose the target through
>>>>>>>> -M $arch:$machine, and when no $arch is specified, the default to arch
>>>>>>>> to be "none",
>>>>>>>> so still won't be non-deterministic.
>>>>>>>>
>>>>>>>
>>>>>>>> "when no $arch is specified, the default to arch to be "none",so still >
>>>>>>> won't be non-deterministic.
>>>>>>>
>>>>>>> That's my point, the current abstraction will create something ambiguous by
>>>>>>> design. When people will specify -M virt, without $arch:, a random machine
>>>>>>> will be selected. At least, maybe this series should ensure there is only
>>>>>>> one virt alias, or make it forbidden and uses unambiguous names only.
>>>>>>
>>>>>> Yes, if there are multiple choices, we should not pick an arbitrary one
>>>>>> non-deterministically, we must require the user to narrow the choice
>>>>>> explicitly in some manner.
>>>>>>
>>>>>>> "$arch:" is just a workaround to not add -target option, except that it
>>>>>>> comes with additional problems, creating inconsistent command lines.
>>>>>>> I already expressed my skepticism about the "machine prefix" based approach,
>>>>>>> being more in favor to strongly filter types per target with an unambiguous
>>>>>>> -target option. I'll accept the community's choice on this, but just wanted
>>>>>>> to see this explained before someone hits the pull button on this series, so
>>>>>>> they know what will come down the road.
>>>>>>
>>>>>> Historically, QEMU do alot of things like this where we invented magic
>>>>>> syntax that needed custom parsing of the command line. Over time we
>>>>>> came to the conclusion this ad-hoc parsing was a bad idea, and we
>>>>>> should always explicitly model things, even if it is more verbose.
>>>>>>
>>>>>> Thus I would not want to see "$target:$machine" as something that is
>>>>>> parsed into two pieces.
>>>>>>
>>>>>> IOW, "aarch64-virt" would be OK as a unique name which treated as an
>>>>>> opaque string, but "aarch64:virt" as something split into "aarch64"
>>>>>> (target) and "virt" (machine) would be a bad idea.
>>>>>>
>>>>>> An acceptable way of modelling the latter would be to use
>>>>>>
>>>>>>    '-machine name=virt,target=aarch64'
>>>>
>>>> Why mix target information parsing at machine level when the
>>>> machine already know it is target specific? People wanting to
>>>> use the ARM virt machine don't want to know (and don't care)
>>>> about the M68k virt machine.
>>>>
>>>>>
>>>>>>
>>>>>> or
>>>>>>
>>>>>>    -machine virt -target aarch64
>>>>>
>>>>>
>>>>> That's made me confused, as different people propose different ways to
>>>>> handle it.
>>>>> Can we just choose one first?
>>>>> '-machine name=virt,target=aarch64' is introducing new options, so is
>>>>> '-machine virt -target aarch64'
>>>>> I can not argue which is better, my suggestion may land one first. Both
>>>>> "-machine virt -target aarch64" and "-machine $arch:$name" I have
>>>>> already implemented. And currently I chose
>>>>> "-machine $arch:$name" according to
>>>>> https://patchwork.ozlabs.org/project/qemu-devel/cover/20260828225901.367438-1-pierrick.bouvier@oss.qualcomm.com/#3749257
>>>>
>>>> You still did not explained what you are trying to achieve
>>>> with all your contributions, so my view is surely biased by
>>>> what we envisioned 3 years ago when we started to pave our
>>>> way for heterogenous emulation.
>>>>
>>>> My options so far for a single binary:
>>>>
>>>> - infer from argv[]
>>> This can be easy to implement and can be defer till the qemu-system-$arch
>>> is symbolic link to qemu-system.
>>>
>>>> - enforce with CLI -target
>>>
>>> I want to post my personal options, I'll prefer the -target options as
>>> it's far easier to implement than "-machine $arch:$machine".
>>> -machine $arch:$machine is very complicated to implement correct.
>>>
>>>> - not expose any machine
>>>
>>> I think not exposing any machine in the command line is a good option,
>>> as it's easier to
>>> implement and clean for the user. But I think this series is still needed.
>>> As we want the means to inspect all machines and devices for all
>>> targets(that need all of them
>>> to be registered into the QOM type hash table).
>>
>> It's not strictly needed to expose all types. -target can be parsed
>> first, and influence what is visible from help (including -M help) also.
>>
>> Also, if we go down the -target option, we should decide if we expose
>> all types or not, which means if we implement filtering or not. If we
>> expose all the types, I'm not sure what -target is supposed to choose.
>>
>> Daniel, what do you think about this one?
> 
> *If* we take the starting assumption that the new multi-target
> binary does not need to be a perfect replica of the existing
> binaries, then filtering devices is creating extra work for
> ourselves, to solve a problem that isn't especially important.
>

Yes sure, just brainstorming here, to help Yonggang moving forward with
a clear direction.

> Even with the current per-target binaries there are countless
> devices linked in which are incompatible / not usable with
> certain machine types. A new multi-target binary with a union
> of all devices will just be a bigger example of a scenario that
> already has to be dealt with for today's binaries.
> 
> So if we have that assumption that we don't need to do device
> filtering, at that point, a --target option doesn't have as
> big of a role to play. The machine type code knows what target(s)
> it wants (1 or 2 targets depending on if there are 32 + 64 bit
> varaints. The CPU model the user requests (if the CPU is not
> hardcoded by the machine), determines 32 bit vs 64 bit.
>

How can we deduce this information (bitness or target for existing
machines/cpus)?
Also, how to deal with devices that are only available for some targets,
but not others, depending on various Kconfig knobs?

> A --target option (or similar -machine name,target=xxx) could
> be used to dis-ambiguate between 'virt' machines if keeping
> their user facing machine names as-is, or it could be used as
> a way to be more explicit about the 32-bit vs 64-bit choice
> and sanity checked against the CPU model choice.
>

We could also not register them as virt if more than one target is
detected, so people have to call explicitly aarch64-virt.
Would that be a possible way to move forward?

> So overall "device filtering" or not is the key question to
> decide IMHO.
>

Fine for me. Just want to see how things will be before spending the
effort to review many patches when outcome is uncertain.

> With regards,
> Daniel



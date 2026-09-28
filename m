Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCD0CA5FA5
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 11:29:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB9YA-0005bm-4z; Mon, 28 Sep 2026 07:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB9Y7-0005bM-2X
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 07:29:35 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xB9Y5-0001gF-D9
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 07:29:34 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68SBATRm1839820
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 11:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pcls9M/RCzy+dy0SUVG2YEjqVeTGh254G4S8Py8gGec=; b=jlhFArqLwsLAEYsN
 s+r+yj0woskk839hHrPFxHO+Qbiy2QMkskMPM1vI9juVV+IIXnPITqMfOZD19ROi
 ApoJZVo9i5X+UcqQqdz8W0rcq1EwriJFSVHN5ug3j7VBO8B4nFFrrqHl6Ou7xH2s
 q27y/yw6VSDuJfQfFtblta2AQR77f/kWNq4GkGNuyUwhyD/k+GedXwHK2nBHkWY/
 m1rm0V3aAliNLBQCr0FHPa8yywAuz79AhoE0+4nbreEB0HjJvRHOyMRpS+9sWWYH
 wyCMNEUvjC54WpFzcoGN7T4THjDaMIMgAWWin96lZr/i1l3S6BgD2egQP3Gy8oXP
 E3Pf6g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynb6gfvv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 11:29:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93c63d960aeso269202885a.1
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 04:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790594970; x=1791199770; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=pcls9M/RCzy+dy0SUVG2YEjqVeTGh254G4S8Py8gGec=;
 b=OMWC2Fl9/Z4f+xlmz7gGFdW9g2dUFpH8stlKudf0Mh7Jf6neewu7TCfvEYwXyJff5v
 wrefCfd/5y+S7Iuqsq2tbzUUiPAvwxAoIjjkFKZ8arJg/Qfqq+IZhVRsjmDipH0YcLLY
 NWcApWirZ0q1RwdYB3lKmPq8eA3vIbfOo7j10ZYi6huWJeMGDGP26Lr9OCYn217F7QOq
 ttb4vcy4vm0oSBOX81IvWfFX1PBpo8m6l8pUCLmIDmopUyVMsJqpY71LLiOctKaaBlRu
 +EJZ5jFIRsJhTiSf7epeN029rosvXOeNyPD7hFZX1Yl2astAtFl+uj+Tkun5l4uH9Rwo
 fuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790594970; x=1791199770;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pcls9M/RCzy+dy0SUVG2YEjqVeTGh254G4S8Py8gGec=;
 b=UYby7lEKta9IlwmE6jSQ+Zu40jxp1ji+E0TYHoWQsO5+PvDKNcGX03vHcY9agHYuRw
 aJzNz3hGSVKK7BfYl9RtQkvFBMEpmLS637Xo6Aa4VIyr6bvg4fNjEILB3AQq5wsCtmCZ
 CmxtD8L8TMUImkZgIYTl+xpPvq/CpEC4lCKLWXzqxTzngT6UqxWy7wdXKnO8osCiwJDA
 Ebj1UhssPFyyctyqwLqHkfWwgNQlOE65Ut5yTwBrITP9w1CYgnUGe78e/14nVdP/NsWo
 rluavr/dx3n4NHm4F4wlXMvgwPCJ6QoIFEpbMq0odd1sfn+jH7oHdpGA/kKaxu3Fjz3G
 qc3Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBxmhCLiO2D8n7v63XfgnozOr10Q7/dPfBIAyuTzy4GW/wlIrPmIMSRF1AY14SmPecObAlOE5veUew==@nongnu.org
X-Gm-Message-State: AFuF++kZZ6WLJimcWRz5G8gdwYaGx6ff13TEQKGMn5d28OJ38XbMnjxX
 L+eJX8C3G1RDi46aXeixLMsexrn9RfYuBoaRbrxhqJQYzAJOOjsnlsDj+FTZu1hjnLMIKvTlf72
 +2GTFomvcZOk0DagMYScGd7+h+3j3N7p0524oolN8tbvOizOkAOVsyXw=
X-Gm-Gg: AYBFou0StQTiZi6NRcqeSwmN04NSY+3hpdbdBy+kUtaZV2jCSiwGA1BRjh1/jHk+HLW
 gJA/MInqWmJhQEx3BffCNRSuxj7dcq1Txm6aUgeP7sgjh+gca5vf5TmaAmpSDgPVjwdPahmsvl5
 3CwBoKmENeOc3BBukfPhGxaACTyEvSUED0buT1amANYINFk4vb+pzEo+zxRnWh9RXS8e0rBXsA2
 GXosBwQODZvrloTygih8/Jo9bU7wQITdaGre5oQGEtKeVtX+btF4VGEwxL2okBgcOQUbEFKFd3F
 WYAdWgWzf6BGGG5xLEC6BB+X0Kx9WF5qw4V05Wik/BsbGQOxAbCjtTLa5i9Ut9rgJGF/ByCDOae
 jVqUutfNshUc8Z4D2cerDcGxpyZzrbvgpRg==
X-Received: by 2002:a05:620a:170e:b0:939:5ae7:2dad with SMTP id
 af79cd13be357-93c43c9fcddmr2067538285a.38.1790594969634; 
 Mon, 28 Sep 2026 04:29:29 -0700 (PDT)
X-Received: by 2002:a05:620a:170e:b0:939:5ae7:2dad with SMTP id
 af79cd13be357-93c43c9fcddmr2067529985a.38.1790594968934; 
 Mon, 28 Sep 2026 04:29:28 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ff141948esm5976215e9.1.2026.09.28.04.29.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 04:29:28 -0700 (PDT)
Message-ID: <4da49cb4-6044-418e-b003-81c4ec6d6ed6@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 13:29:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 46/55] qapi: add query-targets
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
 <20260926070057.1234-47-luoyonggang@gmail.com> <aro93NuZBXYGbD33@redhat.com>
 <87e7c5ae-c78c-4a47-b9ba-9851ce5757d9@oss.qualcomm.com>
 <CAE2XoE9qsZZ+AnfGQ797SQj5yXP8SDOZyxYoKP=oh57UPFqq0Q@mail.gmail.com>
 <arpH_2anGV-JU12e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <arpH_2anGV-JU12e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0NSBTYWx0ZWRfX4scVXXNDbedy
 XXltJzfjRgaVvrmn2CCrOpWpnU6xmKNRqnQ8/zUpIUICvJQ6RJ+TlH1LUmNuB6Y0I5Af+rtZj20
 rfcDt5hsAjSaO+PIGZDEW5Il2dyZbfXkZZtBgOEm70hPqvOdh3ce/2G3DDkZqTeSxjlCa2xJ0fH
 udOneJwah3e74N9+6AAYUDIB9bHKiqw5tg4LjIJcJ4KH9Wo5kCAbdnnNTe84CBI3tgy5LpPgTGO
 gMYgatUVDgba+k5vURA2sRK4sjAJ4QSKHXl2O1yilo9CwVH3b351ER5JpjhZa0eZ0Xwfoj6rDO5
 Z+8p8WuLlXVvbim0xYgkPao57r2UDbAYql/W6/7zjvmM++Lr991GmqmrmtTQOcBpCtz3EAQGNwZ
 1lfI90MHDe3P8lTsVKUdyy/eontNLUmC9IaHXxgI7pYaSv5YqQAc0nghYwlMbYk+mzsdaPcBHyL
 RrJgYxPItEkNpizTRpQ==
X-Authority-Analysis: v=2.4 cv=K+e3jCWI c=1 sm=1 tr=0 ts=6aba4f9a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=GQHC_H0yiGy-f9nngS8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0NSBTYWx0ZWRfX2sUeWzWXmlUb
 N4DhTuz5yh02nxA72oEobl9MNV+q17SbFfYRsUYXYYEoqgQohqadH2hUzHguFVhtTMnIdaufPC/
 Jx+Vm8UfPaX3XkIMEiIKPqvGlV3CPKk=
X-Proofpoint-ORIG-GUID: 2O0erLuKBf-X4Ow0BrzbMZ7L8oNfDKav
X-Proofpoint-GUID: 2O0erLuKBf-X4Ow0BrzbMZ7L8oNfDKav
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280045
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 28/9/26 12:57, Daniel P. BerrangÃ© wrote:
> On Mon, Sep 28, 2026 at 06:51:41PM +0800, Yonggang Luo wrote:
>> On Mon, Sep 28, 2026 at 6:39 PM Philippe Mathieu-Daudé <
>> philmd@oss.qualcomm.com> wrote:
>>>
>>> On 28/9/26 12:13, Daniel P. BerrangÃ© wrote:
>>>> On Sat, Sep 26, 2026 at 03:00:45PM +0800, Yonggang Luo wrote:
>>>>> query-targets lists each linked target, including none, with its
>>>>> arch, endianness, and the machines that target accepts.
>>>>>
>>>>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>>>>> ---
>>>>>    hw/core/machine-qmp-cmds.c | 30 ++++++++++++++++++++++++++++++
>>>>>    qapi/machine.json          | 35 +++++++++++++++++++++++++++++++++++
>>>>>    2 files changed, 65 insertions(+)
>>>>
>>>>
>>>>> diff --git a/qapi/machine.json b/qapi/machine.json
>>>>> index 6aaa2af709a..d8cdea6203e 100644
>>>>> --- a/qapi/machine.json
>>>>> +++ b/qapi/machine.json
>>>>> @@ -307,6 +307,41 @@
>>>>>    ##
>>>>>    { 'command': 'query-target', 'returns': 'QemuTargetInfo' }
>>>>>
>>>>> +##
>>>>> +# @TargetMachines:
>>>>> +#
>>>>> +# One registered system target and the machines that can run on it.
>>>>> +#
>>>>> +# @arch: the target architecture
>>>>> +#
>>>>> +# @endianness: the target endianness
>>>>> +#
>>>>> +# @machines: machine type names, not aliases
>>>>> +#
>>>>> +# Since: 11.2
>>>>> +##
>>>>> +{ 'struct': 'TargetMachines',
>>>>> +  'data': { 'arch': 'SysEmuTarget',
>>>>> +            'endianness': 'EndianMode',
>>>>> +            'machines': ['str'] } }
>>>>
>>>> We already have  'QemuTargetInfo' struct which is used
>>>> with 'query-target', that should also be used with the
>>>> new 'query-targets' command.
>>>>
>>>> We need to add the 'endianness' field to QemuTargetInfo.
>>>
>>> Why do we want to expose endianness, and what endianness to
>>> expose? Endianness is a runtime bit state of CPUs. Sometime
>>> this bit is hardwired but that is an implementation detail.
>>
>> For some targets it's, but for some targets it's not. for example
>>
>> mips-softmmu.mak
>> mipsel-softmmu.mak
>> mips64el-softmmu.mak
>> mips64-softmmu.mak
>>
>>
>> mips64el-softmmu.mak
>> mips64-softmmu.mak
>> only differ the endianless
> 
> "EndianMode" is a tri-state including 'unspecified' as a value,
> so we can cope with both scenarios - the targets where endianness
> is runtime switchable in the CPU can use 'unspecified' as the
> EndianMode. That behaviour should be documented in the QAPI
> docs for QemuTargetInfo

OK but still I don't understand the usefulness of exposing that
at the machine level, since this is a CPU property.

Machine != QEMU binary.

Are you trying to expose binary properties to management layer?
Can you explain the use case?


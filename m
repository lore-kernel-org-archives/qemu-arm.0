Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB089C531CB
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Jul 2026 08:52:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmpAD-0005KM-S1; Thu, 23 Jul 2026 04:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmpAC-0005Iz-JL
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 04:52:20 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmpAA-0001Jg-0n
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 04:52:20 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66N7jbJp2892904
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 08:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Hu/aZOi9BI5kkvtg15H7kqXzkXwyR2zgUIlsUBHiPis=; b=MwUyIwik9PprztzJ
 lNuAUkM5yS5FwGdLJjBeMNRVBYPmhMyjs4i5x/KsBaZpu3p0QfyD9xma1CJeuWYh
 mlkzRpceAsVVvX7XeeTFdqV2U10Iw1o+l3Xgjndgbmcm1FKFe+DwR7AamiWbMja0
 W7eA7zvo6ub0e1hj0GkaoZyPW/J/UX0DFuAQ0mfUu9XZ/U8T/h2+dhN0E6RPzMnb
 W51VdRO40TehGcns5+DLvvR7B8qS6G+UHihoIbhFsPZzi9E/bsAwRcuuSOOpnlzJ
 ZF7WorNl3iTiOmnR/DdrCqp+jwoHABL6iywSxsD/cVN9Ig8WVABuvm7WfB9YZxiy
 DvIeSw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuq886m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 08:52:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-522de3c645dso11561601cf.3
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 01:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784796735; x=1785401535; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Hu/aZOi9BI5kkvtg15H7kqXzkXwyR2zgUIlsUBHiPis=;
 b=awj5IMjlrcoV0+6xK5404f9RigebSWJYpU7jmOQAD1yw2vJJHpA1J4wUO6bOhCQASa
 P9IaJVyBBNsLEB6gIlN7NNNhWpVcX80HRLlmyrYHX74p6839ZQiZdfm3jIUUXAW6qIFM
 FpDqjw/p3rNVcRSygHgEJA3YMCIaZvefUvTJUoI8FTGRrI3T0v/ImJTi2PYGgS7xe+VS
 n9fw/eZoEkCK4RVP4Wv5p8NiWNQ9tRjp8QKNMFTCz6K5Du1eJES/6g9TsDgVbthVzc72
 fFtuJL9DdbnTJFerVdtdl4NSNBWfzx2AApRcFkxGK/8WtJhSKqqir5mwoLrG6GFtOJuj
 FuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784796735; x=1785401535;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Hu/aZOi9BI5kkvtg15H7kqXzkXwyR2zgUIlsUBHiPis=;
 b=dLwAy3XhN3teSmcyTM9AHm4tb01BgUFlTh3VT628jspnAESjaAu3ztumGft/rebCIv
 h6H0QaQqFwVXkaChlwn3X3IvB8tlzgjEBQOVTxsha6V9uTlaj4HNGLUIVeisESrIVxqO
 0C86xyu3Z/ov1BIGiRE7H2AxsofbuPuVPvb0Go3R/ebOJA0SlXy3Qxad2U8surnUMnka
 aGyidONfVXhDT/sMEIMle8Fw/VHQFnOD84ITUZYft8g1YwqwkOYiaf1Y5spfH0r0cLju
 6Um+yKb7cHXwr4FmIhsqnpUkJlSATg5jNdSNJAOh+I1Z5bhEROZxK2VrGYSXmxLxJoRo
 dIVw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrcrOZatiFXyywepPjV+iPHhcdp4NRCB8TrVYMlPiV5yJDt0YW4wUnjKwCHmj80TZNHDkQbozFJmQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx5ODijZe+Y9VJYbYvkXOT7jyCsE581qi0BpHi/CKPza+Bmh/zV
 iLDKD8CcJlEpy7JFhQdqhrYdLkkAABZ6JYYqtzglfvZHlyvZTS+Ix+rpdAbdOPof2M9dOPKuyiV
 ctBmBXFbgbPnHQeOPNNNZNgKeADhz8F8Q74wIoFxLLyOKL3dm7f9d1KM=
X-Gm-Gg: AR+sD11TutgP5GRGMlvwNsL00maagsTsX0gTLUOCnl8+LdpDLHmsjX0EDhSPOyT7ajj
 Qh4W3lRh7ZducbRTEItpgLJe6vJqp5I8DwfOps7rolK198r/+nd37kQPxnvQwenEdglcLDhxdHs
 FFr5nMqRZRrr13LX+xet1DpzNdUefTs8SzSPnm/zfK1Uk7/8XnbKgD0uANcnYguLjW1AnvLDBY8
 e4kWMPxYFDY525YzA+L2Ol4ScUjooqC6+YX7VqzqCVU92zwUg6NQa/JHNgDRFxYigh43D5wSXAI
 FfSK8z5GlH3IMeILzie9N7pzqP9gzS0ceNIe9Ys4OyrTh3yNN/PhbrCJn7ATErKmqeRUTQe/zcf
 jr8Ps/lyGLLeclSIYjJNQHC/nkRl8bfPGwWlp2A276onguzlQ6qw=
X-Received: by 2002:a05:622a:400f:b0:51a:8dc5:bf89 with SMTP id
 d75a77b69052e-5283ddd1617mr20707931cf.5.1784796734577; 
 Thu, 23 Jul 2026 01:52:14 -0700 (PDT)
X-Received: by 2002:a05:622a:400f:b0:51a:8dc5:bf89 with SMTP id
 d75a77b69052e-5283ddd1617mr20707701cf.5.1784796734121; 
 Thu, 23 Jul 2026 01:52:14 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f8635c8d7sm12132822f8f.21.2026.07.23.01.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 01:52:13 -0700 (PDT)
Message-ID: <71d88d00-5b41-49d2-b649-8a6ea47abc4d@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 10:52:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex@shazbot.org,
 richard.henderson@linaro.org, berrange@redhat.com, philmd@mailo.com,
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com,
 phrdina@redhat.com, jugraham@redhat.com, liugang24219@sangfor.com.cn,
 dinghui@sangfor.com.cn, shan.gavin@gmail.com,
 qemu-s390x <qemu-s390x@nongnu.org>
References: <73f79841-8cc7-4ca6-8f6b-fb97b53a6fe8@redhat.com>
 <20260717091756-mutt-send-email-mst@kernel.org>
 <CAFEAcA-O6Z4JrVV0DL_tta6khRyUta_Zz5mJt6OszaW1mu0o6Q@mail.gmail.com>
 <20260717095407-mutt-send-email-mst@kernel.org>
 <9c2ad22a-e768-4a07-85a2-01ce1fc14368@oss.qualcomm.com>
 <59882c5b-545d-4768-8bf4-723fed97a801@redhat.com> <al-eCtxGjG4HHEbl@x1.local>
 <6210e178-a93f-4411-810a-41edb1fb656e@redhat.com>
 <20260722015422-mutt-send-email-mst@kernel.org> <amDyvgR09OJssENX@x1.local>
 <20260723015708-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260723015708-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA4NyBTYWx0ZWRfX8rErMrJmsPGC
 8FhThTIVHu/o6aVxbGjk3/D+f7Y7xnv5jqC9LssuBodbRMIrwQamx4piVztzEhNRUNgzh4vN7bA
 4nl0F45K/XyzE5XMHFCkD7INOF/eOdc=
X-Proofpoint-ORIG-GUID: Gazi8INUlDRGIThqH1DLjHF1Zz_5kD-1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA4NyBTYWx0ZWRfX2QTt4RliNVw0
 Nwvug8KO1+NGTZZU4vEv63+KA/ciTefLjpPyhfmZbD/3ruiO2KGw2geh2X1qbPe8QmMgewVMsd0
 lPlbB9yk0qtpfmKmo0bxEz1XXYGs0XWNjZJZ0MGtCiEwVnZ3LPX/nTq6FobmtUzUReGYfLPVs/p
 JrkStQYPYEk+49pNWi6I8W2lN2MSl4qVL+rr+5ZCp6e2JyoNbHOKGTpXYa06mcNE6zcCO16sQw+
 2vmJY2ynZZ0xrknij3IzMJ3ajNNa1GPpVatcSq3XTjWPAw4pD1egLEj/taRWHqy/3lZDBrH37Hv
 JkAoiLLSJJsg68PWyzZ8tBb5M91TmExbbdE6+eaUrmplHTDM2HadLAIWzn568WiWayRkfAlKfcq
 ogOQCk+BOpfL0N+TveNl8msREqbK53/oPVwK2p1SU9jg/MVknJ/GDb3wXqdGnxq45TkKIrtvE0W
 DW/4qPIJQnZpM25Netw==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a61d63f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=10m2BY13AAAA:8 a=RnTTQWfqUW9Lig1g_WwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=Mg8V0k9pfHlfFIAitp3a:22
X-Proofpoint-GUID: Gazi8INUlDRGIThqH1DLjHF1Zz_5kD-1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230087
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 23/7/26 08:04, Michael S. Tsirkin wrote:
> On Wed, Jul 22, 2026 at 12:41:34PM -0400, Peter Xu wrote:
>> On Wed, Jul 22, 2026 at 01:58:18AM -0400, Michael S. Tsirkin wrote:
>>> On Wed, Jul 22, 2026 at 10:53:27AM +1000, Gavin Shan wrote:
>>>> On 7/22/26 2:27 AM, Peter Xu wrote:
>>>>> On Tue, Jul 21, 2026 at 03:37:53PM +1000, Gavin Shan wrote:
>>>>>> If Peter is fine with two variants for x86 and non-x86 architectures.
>>>>>> I can post (v4) for further review. That will be something like below
>>>>>> and let me know if there are any other improvements are needed.
>>>>>
>>>>> I have a generic question on the "unaligned access for x86": I think the
>>>>> question is about the one Michael raised here on unaligned access may break
>>>>> x86 here:
>>>>>
>>>>>     https://lore.kernel.org/qemu-devel/20260617022330-mutt-send-email-mst@kernel.org/
>>>>>
>>>>>     3. (theoretical concern) also on x86, unaligned accesses are
>>>>>     possible on guest and host, so converting an unaligned access to a
>>>>>     series of aligned ones can in theory break devices.
>>>>>
>>>>> Is that a real problem we need to consider, or can we start with unified
>>>>> approach and leave it for later?
>>>>>
>>>>
>>>> I'm leaving this question to Michael.
>>>
>>> Knowing what I know about hardware designers, it's something someone
>>> somewhere does)
>>> It can be made a separate patch, just to show - it should be all of
>>> ~10LOC.
>>
>> It's only about removal of anything that might be controversial for now,
>> thanks.  I also wonder if anything would break, then it's more solid proof
>> that per-arch change is required.
> 
> Repeating:
> 	I think there is exactly 1 kinda reasonable case. A 2 byte read/write at
> 	offset 0x1 within a dword. This maps nicely to even classical PCI byte
> 	enable mechanism and so yes it works if your CPU can initiate these
> 	things, and it's atomic.

Isn't this out of the CPU arch, dealt with at the bus level?

It looks we try to be clever with modern PCI code by optimizing this
access -- not saying we can change that, I know it is too late after
20+ years -- relying on hw behavior that was done that way to support
legacy hw, in particular broken I/O accesses.

For Alpha / HPPA / MIPS there were ASIC in the PCI I/O path to handle
these odd unaligned accesses inherited from x86 world.

> It's easy to find more examples of such hardware if one looks. For example,
> LEDCTL on e1000e:
> 
> 20260625101817-mutt-send-email-mst@kernel.org
> 
> 
> A claim that no software uses this hardware capability is the strong
> claim that needs proof, not the other way around.
> 
> 
> What to do on non-x86? reading a dword might work, or reading
> byte by byte might work. Both can cause issues, just different ones,
> but given we did byte by byte previously i guess let's keep
> doing that.
> 
> 
>>>
>>>>> PS: I apologize if I missed important piece of info along the way; I didn't
>>>>> follow closely on the discussion on this topic in the past few weeks.
>>>>>
>>>>> One thing to mention is, what we change should only need to affect
>>>>> ram_device, AFAIU.. so most memcpy()/memmove() shouldn't be changed for any
>>>>> arch when it's pure RAM.
>>>>>
>>>>
>>>> It depends. This patch intends to fix issue [1] in the lower layer by using
>>>> the newly added accessors (qemu_ram_{copy, move}) on all directly accessible
>>>> regions including the regular (pure) RAM region. Otherwise, the newly added
>>>> accessors should be limited to ram_device regions only as you said.
>>>>
>>>> [1] https://lore.kernel.org/qemu-devel/20260527091711.3901-1-liugang24219@sangfor.com.cn/
>>>>
>>>> Thanks,
>>>> Gavin
>>>
>>> using memcpy()/memmove() to emulate guest's atomics is generally
>>> kinda broken.
>>> but yes there are architectures where doing it to device ram is
>>> more broken than doing it to regular ram.
>>
>> If we keep memcpy()/memmove() for len>8 (aligned or not), I am thinking no
>> perf issue will happen, then looks like we can indeed change this even for
>> pure RAM operations, which we can't identify in case of e1000e driver use
>> case.
>>
>> Then does it mean we should not use __builtin_memcpy()/memmove()?  Even if
>> we know constants 1/2/4/8 would work there, why not we go ahead and use
>> qatomics, which is even more future proof?  I also stumbled on top of
>> commit 77b1757090 ("include/qemu/bswap.h: Use __builtin_memcpy() in
>> accessor functions"), which seems to say the same thing "for the long
>> term".
>>
>> For "should we still do unaligned access if the guest did it, so as to keep
>> the original behavior of a bare metal" question, are we on the same page
>> that we should just break it into aligned accesses for all archs?  I think
>> it means, we will not be able to emulate guest faults correctly as what
>> will happen on bare metal, but we're missing the fault injection logics
>> anyway, so whenever it's implemented we _could_ switch it back to unaligned
>> accesses.  Before that, breaking unaligned seems like a better way to go to
>> (1) satisfy all legit users, and (2) don't make QEMU crash by guest
>> operations.
>>
>> Last, one silly question: why do we need any helper named with *memcpy*, if
>> memmove is always superior (to consider range overlap)?  Can we stick with
>> memmove all over the places?
>>
>> Thanks,
>>
>> -- 
>> Peter Xu
> 
> 



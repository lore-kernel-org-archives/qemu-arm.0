Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD20C44539
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Jul 2026 12:05:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmVhK-0005oL-A8; Wed, 22 Jul 2026 08:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmVhJ-0005o1-96
 for qemu-arm@nongnu.org; Wed, 22 Jul 2026 08:05:13 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmVhG-0004EF-G1
 for qemu-arm@nongnu.org; Wed, 22 Jul 2026 08:05:12 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66M8xPvG412647
 for <qemu-arm@nongnu.org>; Wed, 22 Jul 2026 12:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MIh3UBQYWL19RZyqhz08ZsJ4E9jqzs/swBnd6zZJtj4=; b=FRDmK0JuFBeWzpIN
 9JPxh4fq11hXW9b/5q3aH+1Ju5O6oru7S/XIhj9I4sfbKVwqk/J/TLTk7GE+Ahfj
 wNxC3N7UYnHuf00zVH6Yrc4CZcL9+pH1BPvcCox0iSrJJOhnWjmsQwNUBTrEae2T
 Sx14ur0LgKatRFEBWuALnCaiysigXBkTY/F4PkAOIF80m1aVqL8FZH0dBW4wP581
 V9KC1lWyGl59U/LME8CIzQZ7vcw+fK7NP5T3YsrcsWiK1249dzNc3wzcFGTSe4VJ
 JcZSpegRGr9ixVMDBPYjf1ClIod4f8IDoB61uvdXDkbVokwPaG45VxqeOla32LN5
 42Yjmg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjpxdhqx9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 22 Jul 2026 12:05:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c1eb52e1fso136200581cf.0
 for <qemu-arm@nongnu.org>; Wed, 22 Jul 2026 05:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784721908; x=1785326708; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=MIh3UBQYWL19RZyqhz08ZsJ4E9jqzs/swBnd6zZJtj4=;
 b=OhRTBWg/Peh83AFjNdTybRZK3HQoAWDxs9/R4wrAmEGgEgVzOZCtGiHBsOApiupU6T
 Duf7MizEohK6kht5Q3xGZnuHbtAjqMz8t0svuRuhHm4ZoAQaqzMI0+vo0GKqwALf2XvH
 incUYQeR4I2ZvIWY9Zq6uAfXZtQnimkcg679CFXqXvZ4nVyR1Nhl+BTmlXeVwqmQxsMz
 AlBoSCLyWEm6KMnBbjALhXORJgUgQGJZAD7cjWkG8vnDeg9BIFElHBKWQX8sLmdJlNFL
 9RN66yeDu/TA+7Gmv37mu9dASheq7AlSVQWvG4TmJ+LGzt4SIG3IVkr3OOzufTka1nnS
 +C/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784721908; x=1785326708;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MIh3UBQYWL19RZyqhz08ZsJ4E9jqzs/swBnd6zZJtj4=;
 b=k7KrV2YFYXq7kVTKeZknvx0PYZt8WkGYiUaovd6r2YnrJCB93k06vXTjwdE2v9xytg
 fjuJ/rviP29uybZkkBxFOmlEQh3yOYc44q3GWnacsotbzbBZA8O8NkuiJzKKU3iUv6gQ
 MNUmlDv0ycjte/QMGpbOIndxCfTcbYnkiAX81MCA52nikWD7LIwaaFfld89cCElpMinZ
 ZSnmLmfG+NtpmpNUebxfmbo8Sml0HeHqnpS0/U+M7+/SdQEBsMs6hXOepb7ZoNU3w7Wj
 0GwtyO1X0ZJVB2zxNZR80LMWHbRc46ungCssdRSYtUUVL5tpCz77VRKrpXmY7aEkM0fv
 fwZA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrzM0sgoqGSK9C3nmu4qmQYuA3rxyw9zNyTdMpwNrI32TRVRnp9Ntym8JNWL2njjRHFTFOWtCSqEg==@nongnu.org
X-Gm-Message-State: AOJu0YykFevNO/WNRXYIaNC6f/XT5FrYVhUYRaDHyOorkDRmwz4DfRp1
 HBceXd4ElrvnWoOgLQyZ3pwv/AQrFfmeChWdm3AWzi27jPvXFyuIlQHaBDSmPzkNcMJQKaNNJuX
 VMvD3aNYbjcat0fbE1UidO0VY5Oo3GyxS0WMA0qthQPkQrHUkUh/rY68=
X-Gm-Gg: AR+sD1280tmsO/ux0dSd0Giy1ZSXD8hoYTwelTQc/7iTTyD+J+izmomcZPpFY0oS7/g
 5FxBhBA2BIUZ1KG/SRLlKd0A3/EQoNBY3//muZan5PAf5l1W3izfOTXjudWacKo/CcC5SbORQ/+
 LVJaL6KEr76krOzdcK/ZMmzd6h4ptGBIfZsY+vNpiFJAWsu9wrsyrizc0GcPzWwbZQdRpvn/vo9
 1GgR24tMeoyXrhH7E11Aa05bUcoJaHqrF126/0FBR8f2EkbNtCgXo3meiLUwC47Nc5EuWTMrtm7
 ub5PnMQrJS2PePDv6SCzkqy8nfP09HdV8dayO5lGo3nwllGZ9HcrrPxIkt62vWYjLPkr2rfLUec
 fxpJjMPM6YmQvE26zfViHzqb8NZ3vmNtgs6ByyriBuuyNUFZOU2c=
X-Received: by 2002:a05:622a:1b8c:b0:51c:85e:a05a with SMTP id
 d75a77b69052e-5213cdcce05mr210069371cf.66.1784721908118; 
 Wed, 22 Jul 2026 05:05:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8c:b0:51c:85e:a05a with SMTP id
 d75a77b69052e-5213cdcce05mr210068651cf.66.1784721907488; 
 Wed, 22 Jul 2026 05:05:07 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956b030a64sm45166165e9.3.2026.07.22.05.05.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2026 05:05:06 -0700 (PDT)
Message-ID: <a79f2ad8-d1ad-4536-85d1-0a01ad2f9513@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 14:05:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-11.2 v3 15/15] hw/qdev: Prevent devices from being
 realized more than once
Content-Language: en-US
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@kernel.org>, Igor Mammedov <imammedo@redhat.com>,
 FangSheng Huang <FangSheng.Huang@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, Aditya Gupta <adityag@linux.ibm.com>,
 Glenn Miles <milesg@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org,
 Alex Williamson <alex@shazbot.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Hendrik Brueckner <brueckner@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org,
 Luc Michel <luc@lmichel.fr>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20260721-qdev-v3-0-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
 <20260721-qdev-v3-15-d2e226fa002e@rsg.ci.i.u-tokyo.ac.jp>
 <356ebc59-d2cb-4c47-867e-8fc693b3a593@oss.qualcomm.com>
 <a5597a0e-c18c-4649-bfd1-20d77897ff88@rsg.ci.i.u-tokyo.ac.jp>
 <8d979f89-374a-4b86-93c8-9d7dcc311ca6@oss.qualcomm.com>
 <3a1e6538-2669-4e73-9855-e4b7f33604e7@rsg.ci.i.u-tokyo.ac.jp>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <3a1e6538-2669-4e73-9855-e4b7f33604e7@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDExNyBTYWx0ZWRfXynAqhVcF7Hkh
 Kq1gegNwcWJEmeYT1BGYcPVdPZ37pkEbFXjLzOk76qUQuwRdcqgclIdc6dj02/RS2olaFGw2NSY
 5rwlTgnrF83CTpK1C0DDcRqaDKgCt0aziTPt3Ze0+F8Bm/oxHb03R2WAnJGtEtZEWZwEHFn93sZ
 vMOp7DPSFYT6AB0r/waEG7TzNlLNosYnoAzHzJ0ICK4RiyphfPlK8ApvNJPVHl/Jeixbj3R8jrO
 MI5qLOtzL1HHIqbtR0PDS3oIk5JIWJhDl3R9+HY2P+KPH6dDNBKRqrhybAgwK3ZpYixwcpzIBh2
 KnkpA54OJvlROn1Yhw2fUPTkV09Tsb6/SAOe7tfUaiBMmDfR71Ek8h46/wqSYmSQkfYbAjtGn32
 CdO3s732SxBo9Q19xabOfSupFBvda5RJ300kJLB/Z7Pj+9/LlECvG3inQxyMkLshoI/AFeeEuDk
 5DMsCaQTCNgjiER21nA==
X-Proofpoint-GUID: KIJ4srAWZgtHhNFTH-oooPNHjGW9aIm2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDExNyBTYWx0ZWRfX4F6c7F0K73Un
 S58xxCWhIoqcqtVDPlw4XjVZiKH8dQwsMg8HWowaK93tqrk1xFylq3NK+bCzgy9UgeQNcA3SUxC
 l+Ra0DoyIOvn7KDYurt7xkgsIUYDr0Q=
X-Authority-Analysis: v=2.4 cv=b7iCJNGx c=1 sm=1 tr=0 ts=6a60b1f4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=6uDJ01nHLsmlGKCrIc0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: KIJ4srAWZgtHhNFTH-oooPNHjGW9aIm2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220117
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

On 22/7/26 13:08, Akihiko Odaki wrote:
> On 2026/07/22 18:57, Philippe Mathieu-Daudé wrote:
>> On 22/7/26 07:12, Akihiko Odaki wrote:
>>> On 2026/07/22 5:11, Philippe Mathieu-Daudé wrote:
>>>> Hi Akihiko,
>>>>
>>>> On 21/7/26 10:17, Akihiko Odaki wrote:
>>>>> qdev currently permits reentrant realization of the same device. It 
>>>>> also
>>>>> permits another realization attempt after a device has been unrealized
>>>>> or a previous attempt has failed. Either path can invoke
>>>>> DeviceClass::realize() more than once. Supporting repeated realization
>>>>> adds complexity to device implementations. It is untested and likely
>>>>> broken.
>>>>>
>>>>> Replace the bool DeviceState::realized field with the enum-valued
>>>>> DeviceState::phase field. The enum has four values:
>>>>>
>>>>> - initialized
>>>>> - realizing
>>>>> - realized
>>>>> - retired
>>>>
>>>> Excellent.
>>>>
>>>> I have been working on something similar.
>>>>
>>>> I'd start the first patch only including:
>>>>
>>>> DEVICE_PHASE_UNREALIZED (false)
>>>> DEVICE_PHASE_REALIZED (true)
>>>>
>>>> Then gradually rename DEVICE_PHASE_REALIZED -> DEVICE_PHASE_CREATED
>>>> and add the DEVICE_PHASE_REALIZING and DEVICE_PHASE_RETIRED phases,
>>>> so we can discuss them during the review process.
>>>
>>> A gradual conversion makes sense. I kept the "realized" phase as-is 
>>> because it maps exactly to the current external behavior. This patch 
>>> splits the internal "unrealized" state into three distinct phases, 
>>> but the external concept of being "realized" remains unchanged. This 
>>> allows us to avoid a tree-wide refactoring, which is also why 
>>> qdev_is_realized() is preserved.
>>>
>>>>
>>>>> Realization can start only in the initialized phase. It moves the 
>>>>> device
>>>>> to the realizing phase before invoking callbacks, preventing another
>>>>> realization attempt. Successful realization moves it to the realized
>>>>> phase; failure after realization has started moves it to the retired
>>>>> phase. Unrealization also moves a realized device to the retired 
>>>>> phase.
>>>>
>>>> So what is the difference between 'initialized' and 'retired'?
>>>
>>> The first statement in this paragraph differentiates 'initialized' 
>>> from everything else: realization can start only in the initialized 
>>> phase. A 'retired' device cannot be realized. This property avoids 
>>> re- entrancy.
>>
>> But we do use unrealize -> realize again, in hotplug path.
>>
>> So we need to be able to move from 'retired' to 'realizing'
>> again, thus my wonder what is the difference between 'realizing'
>> and 'initialized'.
>>
>> I.e. this test should pass:
>>
>> static void test_qdev_realize_hotplug(void)
>> {
>>      Object *mt = object_new(TYPE_MY_DEV);
>>
>>      /* plug */
>>      g_assert_false(qdev_realize(DEVICE(mt), NULL, NULL));
>>
>>      /* unplug */
>>      qdev_unrealize(DEVICE(mt));
>>
>>      /* re-plug */
>>      g_assert_false(qdev_realize(DEVICE(mt), NULL, NULL));
>>      qdev_unrealize(DEVICE(mt));
>>      object_unparent(mt);
>>      object_unref(mt);
>> }
>>
>> Maybe your 'retired' could be renamed as transient 'unrealizing',
>> similar to 'realizing' phase, then we could transition to the
>> 'unrealized' initial phase?
> 
> I could not find an in-tree hotplug path that unrealizes and then
> realizes the same DeviceState.
> 
> In the normal device_del path, the unplug handler unrealizes the device, 
> and completed unplug then unparents it. A later device_add calls 
> qdev_new(), so it realizes a new DeviceState. Reusing an ID or slot does 
> not reuse the object.

Igor, could you provide your advices here?

> The virtio-net failover path does retain and replug the same object, but 
> it deliberately keeps the device realized. The partial-unplug path skips 
> the unplug handler, and replug invokes the pre_plug and plug callbacks 
> directly instead of qdev_realize().
> 
> More generally, I believe same-instance unrealize -> realize is unsafe. 
> Realize callbacks may create QOM children whose lifetime is tied to the 
> DeviceState rather than its realized state [1]. For example, 
> memory_region_init() initializes an embedded QOM object and adds it as a 
> child of the device. Unrealizing the device does not generally finalize 
> that MemoryRegion, so a second realization may try to initialize the 
> same object again.

I totally concur here.

> 
> So introducing an unrealizing -> unrealized transition would require 
> every realize/unrealize pair to restore the state of a fresh instance. 
> That contract is not tested, and is the complexity this series is meant 
> to remove.
> 
> [1] https://lore.kernel.org/qemu-devel/64bc4a38-f1d2-45ff-8f4c- 
> c941d6a41e18@rsg.ci.i.u-tokyo.ac.jp/
> 
> Regards,
> Akihiko Odaki
> 
>>
>>>
>>>>
>>>>> The QOM realized property is an internal lifecycle property, not for
>>>>> end users. Replace it with the enum-valued phase property.
>>>>>
>>>>> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
>>>>> ---
>>>>>   qapi/common.json          |  19 ++++++++
>>>>>   include/hw/core/qdev.h    |  12 ++---
>>>>>   hw/core/qdev-clock.c      |   4 +-
>>>>>   hw/core/qdev-properties.c |   4 +-
>>>>>   hw/core/qdev.c            |  98 +++++++++++++++++++++++++ 
>>>>> +--------------
>>>>>   hw/scsi/scsi-bus.c        |   4 +-
>>>>>   qom/qom-qmp-cmds.c        |   2 +-
>>>>>   system/qdev-monitor.c     |   5 ++-
>>>>>   tests/unit/test-qdev.c    | 112 +++++++++++++++++++++++++++++++++ 
>>>>> + + + +++++++++-
>>>>>   9 files changed, 212 insertions(+), 48 deletions(-)
>>>>>
>>>>> diff --git a/qapi/common.json b/qapi/common.json
>>>>> index af7e3d618a7c..88a308cbd172 100644
>>>>> --- a/qapi/common.json
>>>>> +++ b/qapi/common.json
>>>>> @@ -7,6 +7,25 @@
>>>>>   # *****************
>>>>>   ##
>>>>> +##
>>>>> +# @DevicePhase:
>>>>> +#
>>>>> +# An enumeration of the device phases
>>>>> +#
>>>>> +# @initialized: the initial phase
>>>>> +#
>>>>> +# @realizing: the phase during realization
>>>>> +#
>>>>> +# @realized: the phase after realization
>>>>> +#
>>>>> +# @retired: the terminal phase entered when unrealization begins or
>>>>> +#           realization fails after starting
>>>>> +#
>>>>> +# Since: 11.1
>>>>> +##
>>>>> +{ 'enum': 'DevicePhase',
>>>>> +  'data': [ 'initialized', 'realizing', 'realized', 'retired' ] }
>>>>> +
>>>>
>>>>
>>>>> @@ -477,10 +477,10 @@ bool qdev_unplug_blocked(DeviceState *dev, 
>>>>> Error **errp)
>>>>>       return false;
>>>>>   }
>>>>> -static bool device_get_realized(Object *obj, Error **errp)
>>>>> +static int device_get_phase(Object *obj, Error **errp)
>>>>
>>>> DevicePhase
>>>
>>> device_get_phase() must return int to match the getter type required by
>>> object_class_property_add_enum():
>>>
>>>      int (*get)(Object *, Error **)
>>>
>>> Using DevicePhase there would not match the callback type.
>>
>> Ah right.
>>
>>>
>>>>
>>>>>   {
>>>>>       DeviceState *dev = DEVICE(obj);
>>>>> -    return dev->realized;
>>>>> +    return dev->phase;
>>>>>   }
> 
> 



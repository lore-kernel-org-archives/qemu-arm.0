Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C22C44539
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Jul 2026 09:58:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmTiD-0001vq-Mg; Wed, 22 Jul 2026 05:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmTi0-0001th-IB
 for qemu-arm@nongnu.org; Wed, 22 Jul 2026 05:57:50 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wmThx-0002KP-7w
 for qemu-arm@nongnu.org; Wed, 22 Jul 2026 05:57:47 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66M8xCWl401256
 for <qemu-arm@nongnu.org>; Wed, 22 Jul 2026 09:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YrNrx8IXRArj6evka/CvXtr7MNaKWGLRoL5YwM3PfjQ=; b=iVnUnVIGZ+TloSZR
 n3dYXra+AbqmWrm39XaSshFXkrITOh87ojCjXo/pr+Fe4+AUPMh2So0yRLETC7by
 Xpi5aQtibAFW+pJUdeBZNJYmWfzbKiw+5/4RTL/F7IMUfHFMHQsFXqEdhzpfrJgG
 9nf1HX+oAokp/31gWMAFJl7bdFCZyanyyKWjclvH7K2QNB0Riz0IztyqU9wZ1udo
 Q6eG61GxKFl8CB76H5LDFRpOokbAYd5VOjcyTcikkLVAMKXjyRfE1DKRdMrCApFb
 0gXVZKIQGJfigwZC+5uz55dGlSq7ggL33Zqraez79zyMa1Z01hgSp9tBANcIulkh
 0Z/IpQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjt798e2b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 22 Jul 2026 09:57:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e63df032bso1083691485a.0
 for <qemu-arm@nongnu.org>; Wed, 22 Jul 2026 02:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784714261; x=1785319061; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=YrNrx8IXRArj6evka/CvXtr7MNaKWGLRoL5YwM3PfjQ=;
 b=W1F5Ga464enTghLw+K9oemiMcsL9Nyh4+kHXy4D78SXPlwq+kGIZi5GcOje9lAeXQq
 MkmdHVeCK+2A+BTPOwe8mL34oVpuMYYhAevjkA4UdQ2n94Jt0LSg3U84KWa5/nH9vbRh
 6SSFN2UZEguz7V8O4fN/5TbyRqPHD2mFgdqBjenL2DhKXTx28HmmMEIzfaztCcic8bjF
 QAybQ9o/VGXqb3Ypqb7HlDqyYpVI1h5kmZfxEqO+HatUgS5NB6nKz1i2qp5zEgJvp2RN
 mK5p9On7XaosTiqAuTh+FlzPLi1YUVmkQqh51YgBfO//8z4NBYRFu5Svs7Fo51RRkJWo
 CsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784714261; x=1785319061;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YrNrx8IXRArj6evka/CvXtr7MNaKWGLRoL5YwM3PfjQ=;
 b=aF9mQIS7lPbDXJTvkHVHjmM1Lc3x1s+hmeFxlrckzcaajdlxk+x9mABQKTGL+LM53h
 Bb/hrjuk4f9Xy99UAwb7j7QyjhlilOopdDmDhhlukQt0s9q+sKXiKrMsdAJiAXM7HlvP
 7IQbRxf0SE49eGWZSc7FSF9vflEt/PX9H/f7GyyY9Oayp1vSahQcR9me7BHI6Z0CfCYa
 dTiyd2Jj7WeID+nTLH7pjAjP+T0uo6irLKzKGTfNZG12VhxLEBfqDgqNPCDNpudDzEiE
 udk1WZuCLwm+NCH9EGjt1zIHcqbDnddVGOH9H1OQki9T8FUvJJwulB6Mk8NoU8uT7Yp8
 XzeQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoyRfRpcu4gNS15snne+5+9xkXUZKT6uaYUS/0MMcm1mo9so71db/iRA+xi4LOfblElxCxXA9RDZw==@nongnu.org
X-Gm-Message-State: AOJu0YwxL9YULQTBLEn/pi8nj389hJOrYA8xKLhGmkqSTCfBXQ8A0YbD
 F7fFcfFQcMQ210kvGNrCoA61dG6blpgwO6/cQjoLP3dqcMhVXLV/937VXNIfY7pMxKQM76rsiH/
 IskPiQUJJVGDlAzhAsU9ggAyPUDa3ztSPVFj30WB3ByW+VejChfrnO6U=
X-Gm-Gg: AR+sD12ZaT6eutjUTaoswVZxOP3PDsAcLq0oJdVuzuuSK+GL0qIMTwn/OmYV+rwiAW4
 KopApnor3QKOB3YeDTsYLufxdx530F7+oUx3Blb4nQlqcZtPezSqIfS0ZlXbIzUpc4J8x5YP3Hj
 DyfuHDpkukuMAgxaMnV6G0xErPkDGQZb4QCHKfjEiO455/k9m94opMYHpPwZmJBOQRyh14q/Fls
 X2gDzhwAM+AjV0W1NG9IOi8O4t4COpzxMyUEzYlFYVeP1jBvIm4UlsghYGpXCM1Nmh5nP3iBIk4
 cVb9UJwxpNXnqeFzS6mRBMOkLgF3YyCK8L0InKvHzlJTmBy5caskzCdvonrRPAosiwGbrW2DUnB
 00eCZ9Ztmtgfjp+vM9PaqKJwMj+Cdd+82zRRROfptoicEyxVaUPo=
X-Received: by 2002:a05:622a:aad3:20b0:528:ce0:e9f8 with SMTP id
 d75a77b69052e-5280ce0ebc0mr10707781cf.3.1784714260621; 
 Wed, 22 Jul 2026 02:57:40 -0700 (PDT)
X-Received: by 2002:a05:622a:aad3:20b0:528:ce0:e9f8 with SMTP id
 d75a77b69052e-5280ce0ebc0mr10707571cf.3.1784714260119; 
 Wed, 22 Jul 2026 02:57:40 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85bb5127sm5064638f8f.10.2026.07.22.02.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2026 02:57:39 -0700 (PDT)
Message-ID: <8d979f89-374a-4b86-93c8-9d7dcc311ca6@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 11:57:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-11.2 v3 15/15] hw/qdev: Prevent devices from being
 realized more than once
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a5597a0e-c18c-4649-bfd1-20d77897ff88@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Sr6gLvO0 c=1 sm=1 tr=0 ts=6a609415 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=lYN5X0wpDFwZmuDoHbIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: zwUplg8uiY5mGcpUFYzfeY9YRrYW0hsN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA5NSBTYWx0ZWRfXxzSixT5igX/z
 II3a8qcmaFjtP1WqDy+j32d2Zugjb4SCRCn47wpOXqqGDmV1225HRf55xm3jGfyR1J0Ruu0N1Ma
 ksqcqCxs+6+pjXXqvEhqEjj8khmbZCGrdLkvNRppgwUSGwIWECRYj7zbFyUpzDjhEiuUrRL2CSj
 9hsJF5/WaIlE5F6s1cFBXxfI1FBrgCyRidMkq7Z60SC4fpp/wTTGFyx4Xi74sDi14QbwO3n+igr
 Jy1vupNxthb56J9xSKm5l0253/w70mB4gyvaGKYjtGRRzUZLlE5MxQQysSNMHdYYSvUfO2ZXuJu
 JfXXcxfHVCSF1m2NVHIAuvrYlqVfFr0Vd4suxsqYcMpTGYbVd/ICmLDWqpUjhHfxZcz2PBmt4fG
 ZIQWZc2H4T/UBOejHofu3J2Hf4DOZ6kghVAJNg8adYBF9gIUYHTKVJA8jsuczUAnRB4VPpyqtxh
 m7UmYDQ2yjdEgpzfwFg==
X-Proofpoint-GUID: zwUplg8uiY5mGcpUFYzfeY9YRrYW0hsN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA5NSBTYWx0ZWRfX42MxHGqLZFDJ
 RZpHoB7BjOf5c8U4JS1/iZI8DgXzl7IIQov0hB/1OxtE6Atmc4E1A78GDfFxY4SHjMqeXZpjDEx
 W8rV6ZNJ2nzg/hlDzHva6fQGeRWNoz8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220095
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 22/7/26 07:12, Akihiko Odaki wrote:
> On 2026/07/22 5:11, Philippe Mathieu-Daudé wrote:
>> Hi Akihiko,
>>
>> On 21/7/26 10:17, Akihiko Odaki wrote:
>>> qdev currently permits reentrant realization of the same device. It also
>>> permits another realization attempt after a device has been unrealized
>>> or a previous attempt has failed. Either path can invoke
>>> DeviceClass::realize() more than once. Supporting repeated realization
>>> adds complexity to device implementations. It is untested and likely
>>> broken.
>>>
>>> Replace the bool DeviceState::realized field with the enum-valued
>>> DeviceState::phase field. The enum has four values:
>>>
>>> - initialized
>>> - realizing
>>> - realized
>>> - retired
>>
>> Excellent.
>>
>> I have been working on something similar.
>>
>> I'd start the first patch only including:
>>
>> DEVICE_PHASE_UNREALIZED (false)
>> DEVICE_PHASE_REALIZED (true)
>>
>> Then gradually rename DEVICE_PHASE_REALIZED -> DEVICE_PHASE_CREATED
>> and add the DEVICE_PHASE_REALIZING and DEVICE_PHASE_RETIRED phases,
>> so we can discuss them during the review process.
> 
> A gradual conversion makes sense. I kept the "realized" phase as-is 
> because it maps exactly to the current external behavior. This patch 
> splits the internal "unrealized" state into three distinct phases, but 
> the external concept of being "realized" remains unchanged. This allows 
> us to avoid a tree-wide refactoring, which is also why 
> qdev_is_realized() is preserved.
> 
>>
>>> Realization can start only in the initialized phase. It moves the device
>>> to the realizing phase before invoking callbacks, preventing another
>>> realization attempt. Successful realization moves it to the realized
>>> phase; failure after realization has started moves it to the retired
>>> phase. Unrealization also moves a realized device to the retired phase.
>>
>> So what is the difference between 'initialized' and 'retired'?
> 
> The first statement in this paragraph differentiates 'initialized' from 
> everything else: realization can start only in the initialized phase. A 
> 'retired' device cannot be realized. This property avoids re-entrancy.

But we do use unrealize -> realize again, in hotplug path.

So we need to be able to move from 'retired' to 'realizing'
again, thus my wonder what is the difference between 'realizing'
and 'initialized'.

I.e. this test should pass:

static void test_qdev_realize_hotplug(void)
{
     Object *mt = object_new(TYPE_MY_DEV);

     /* plug */
     g_assert_false(qdev_realize(DEVICE(mt), NULL, NULL));

     /* unplug */
     qdev_unrealize(DEVICE(mt));

     /* re-plug */
     g_assert_false(qdev_realize(DEVICE(mt), NULL, NULL));
     qdev_unrealize(DEVICE(mt));
     object_unparent(mt);
     object_unref(mt);
}

Maybe your 'retired' could be renamed as transient 'unrealizing',
similar to 'realizing' phase, then we could transition to the
'unrealized' initial phase?

> 
>>
>>> The QOM realized property is an internal lifecycle property, not for
>>> end users. Replace it with the enum-valued phase property.
>>>
>>> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
>>> ---
>>>   qapi/common.json          |  19 ++++++++
>>>   include/hw/core/qdev.h    |  12 ++---
>>>   hw/core/qdev-clock.c      |   4 +-
>>>   hw/core/qdev-properties.c |   4 +-
>>>   hw/core/qdev.c            |  98 +++++++++++++++++++++++++ 
>>> +--------------
>>>   hw/scsi/scsi-bus.c        |   4 +-
>>>   qom/qom-qmp-cmds.c        |   2 +-
>>>   system/qdev-monitor.c     |   5 ++-
>>>   tests/unit/test-qdev.c    | 112 +++++++++++++++++++++++++++++++++++ 
>>> + +++++++++-
>>>   9 files changed, 212 insertions(+), 48 deletions(-)
>>>
>>> diff --git a/qapi/common.json b/qapi/common.json
>>> index af7e3d618a7c..88a308cbd172 100644
>>> --- a/qapi/common.json
>>> +++ b/qapi/common.json
>>> @@ -7,6 +7,25 @@
>>>   # *****************
>>>   ##
>>> +##
>>> +# @DevicePhase:
>>> +#
>>> +# An enumeration of the device phases
>>> +#
>>> +# @initialized: the initial phase
>>> +#
>>> +# @realizing: the phase during realization
>>> +#
>>> +# @realized: the phase after realization
>>> +#
>>> +# @retired: the terminal phase entered when unrealization begins or
>>> +#           realization fails after starting
>>> +#
>>> +# Since: 11.1
>>> +##
>>> +{ 'enum': 'DevicePhase',
>>> +  'data': [ 'initialized', 'realizing', 'realized', 'retired' ] }
>>> +
>>
>>
>>> @@ -477,10 +477,10 @@ bool qdev_unplug_blocked(DeviceState *dev, 
>>> Error **errp)
>>>       return false;
>>>   }
>>> -static bool device_get_realized(Object *obj, Error **errp)
>>> +static int device_get_phase(Object *obj, Error **errp)
>>
>> DevicePhase
> 
> device_get_phase() must return int to match the getter type required by
> object_class_property_add_enum():
> 
>      int (*get)(Object *, Error **)
> 
> Using DevicePhase there would not match the callback type.

Ah right.

> 
>>
>>>   {
>>>       DeviceState *dev = DEVICE(obj);
>>> -    return dev->realized;
>>> +    return dev->phase;
>>>   }


Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E52CA6009
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 22:31:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEaAY-0000pC-9f; Wed, 07 Oct 2026 18:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEaAW-0000or-Dn
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 18:31:24 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEaAU-00054I-9q
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 18:31:24 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 697Lu46B626354
 for <qemu-arm@nongnu.org>; Wed, 7 Oct 2026 22:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zHzuVP4G6vQWrt8lzNM2zSoGPyqDLFeHMWfNH3jIOSQ=; b=MC9ERxsSreH6sc0s
 0h3gRiligyoHm4z478DDlahgxGWlxW/LHNU5tF14BMv9N9FkrvIMNVk8pcOGgFHq
 k8YlktyyyxDRb95C9cIdttf9yt5Je1/NvLw75BHFHIYN8B3clzBJAjurnz+u8m3d
 jCiGwb4nhWf6ka4Yt6zst7rrso92YvO0orGVSAzHV2b/xp1KumCfEQzQNS9Kw/Tc
 COtaDclstMCORvBHF71f12VViYPTjPCnc02sfkKiHcz3Xsnldno9AqJnmGYeiaUR
 c3cukLAkiK+rUnGrmz+neAKdnYzEXR8DoxbfU7X0bQyX8mxz4RfO7QLfDHR30P3j
 PedW6Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3g826-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 22:31:20 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-3510d0baf63so9267502eec.1
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 15:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791412279; x=1792017079; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zHzuVP4G6vQWrt8lzNM2zSoGPyqDLFeHMWfNH3jIOSQ=;
 b=a1N0p6N/ikYpt01+bh/WQCQqoRX6gtQETnLPMp2+MUbL8tlbFqpxXmHY6Ml0k1w1NL
 Nozfv6FgWbGq3zyeG/X9t59s+0h+yW4CO2cqNfuXn66/XpLiSxNviStrHOT27aYdiFew
 s1h6VQFchgoaXaZYitGpX7Od5Z8Yr4FIySR8mJ8yPfW7jGH1GA5n5X7gKTFzy9UnmucT
 a4CjqKc6KGjeXwp5Y5DyNPM/ZYxPqatfnd3LHJQCjE09hgxUY/u7LULiWP7ZwVv84iYN
 m9Pg9Q4GewKCTuaGmirDDnV+hyK+EFiBQlGYmjaZEC9aFHrsx8aOQHXRItSXc8/OhxMW
 qpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791412279; x=1792017079;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zHzuVP4G6vQWrt8lzNM2zSoGPyqDLFeHMWfNH3jIOSQ=;
 b=HMUIQnN/xTB2zHjAGHtCB67+kdHI8H93Z7kFQvD6fGqndapLnonT1J0vlstyzM47Iu
 i85jX5EPvFmirM76mJH5J+15PqZkVHgmSQkct+kumlTt/naLKJ9d1joXTdaHs/QFteiG
 hw9pvQc8uHE6F6JReWAKmgw1pShBSgHRNLZW1vY4blBoi0aKyK1SnLXGnUzIR0saUxJF
 caK/SoDvNh0NyxmuM6y6TlHEFdUjp98mvtYWxpIxgHOsw8mNacn5TSMaWd2r9sREx3LQ
 To3ahjHZSg+VdIm8O0wdSGRSqXF0LhZUQZUfA92+cFVx+6gF1Sk6++COfiFJGnixgKtY
 6Fdg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxXbfPsQ/VhmDDtifzOCcu8J9zDbYHu5NJwIA6d/uMapwuycw2n+kfeUw7lGpBGXytfeg0juIDDSg==@nongnu.org
X-Gm-Message-State: AFuF++m6z4QDHOp5i7cttWpCp/cXTnEf2becLvZznnZ16+hiVXkNYpJo
 jS7lyLB3Du/fkq61LPWcZj5w9fYp7tjtx1rzaoU8629uGrKRgOcmUXxeuXcLOzf3ZI0hs76D5fo
 iC6w8kEYD1XcgcYtPaCDGIYoMPrxWEhu7mBn4bZBiORdMSMMLMRCDD7E=
X-Gm-Gg: AYBFou2VMFYkAU7SVkKHver/oBFtf4KWn4itktFC7282w33dH7kG2/7qy3K2kDZ1NGn
 45qirNh90tf5meYyt8+5Q5a6JJwQwXzmeM2ECvWjps+vRcUHUBYmAyf04JwAHBkV3znnqgCJOXr
 vqgaCTE6KgoTJpmHlPwAkmEieV4tx1r9/7m7cogRliSJuYwezxWp5ffgNlHYjz+fo3C0OLt/eiP
 k7n1Q26A0YUzgV+bPStpoksHVZl2ReXGWeq6dzI5BUG+ECS9V4UqQZd+AsY5BS8pjn/831/+j0j
 SFDhbU+eE/7DgdsiOAmMaI9rdGMBR9bZsHJMUuGAcf/LDIaMk7+sHI+tUQPEJKhRWWtEN1zDUdH
 G56GR1QyRf2bxMJo9V0HObdqiZEZ9Cy7A2JqhYSx3o3UZUnLFsS07Xct6pMCsSc6FMWgcdg==
X-Received: by 2002:a05:701b:2302:b0:144:f4b9:9be4 with SMTP id
 a92af1059eb24-162055138dbmr3863473c88.15.1791412279210; 
 Wed, 07 Oct 2026 15:31:19 -0700 (PDT)
X-Received: by 2002:a05:701b:2302:b0:144:f4b9:9be4 with SMTP id
 a92af1059eb24-162055138dbmr3863405c88.15.1791412278433; 
 Wed, 07 Oct 2026 15:31:18 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-163e3c5bed6sm3927485c88.7.2026.10.07.15.31.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 15:31:16 -0700 (PDT)
Message-ID: <919a1a75-78b9-42a9-93ed-9edf6757f707@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 15:31:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] target-info: replace QOM registration with a
 constructor list
To: luoyonggang@gmail.com
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
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
 <20261007115253.328-5-luoyonggang@gmail.com>
 <37275f1f-aee9-444b-aaed-3e0bf34b63cd@oss.qualcomm.com>
 <CAE2XoE_GmDbA5SSUb3k_9HwE+bxnBjK+kBj-RE5BonEBC=GpMw@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAE2XoE_GmDbA5SSUb3k_9HwE+bxnBjK+kBj-RE5BonEBC=GpMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA4OSBTYWx0ZWRfX+zLIUdZqU76e
 xIuC7DAmAIe38RuQlC4Opyc2vdyl5xQcoxmTl3YAdDb9r8LBpHWuuJumUVmswYBjhK3Ctkfwakr
 97iRM3v3KoQTHnd6c51hRqmgUBdb9Ec=
X-Proofpoint-ORIG-GUID: IHWZA3FqOhg8xBTTD9PrBIeFxQY8V2M4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA4OSBTYWx0ZWRfX4EFsS0cvZsIa
 Vt7wt0oDdoXtG0iVFXoo6qGt3Y0qrU2ZgfX7veOdbX+HzY5gUffmrcGDQnrkJUoQ3i5Xr9mu71h
 pRz1xmSbwpFc+4l2473lwGH9i4zTMySUWQ2C/JXFweNolVtmWTfU0O7pYRalS8VrHjXT1gMvqRY
 bLrkYsHYfYfsB4sTPUrrDyShK8olfoPFVpkWt0i5nZEF93jaybrtwfbkbw1h6E5vYfRuu9woAK9
 HI2hlRfn/40QLfO2LZ62kffWC2CUeLCDcev9pwhe/rGpWueHRZCSonzsmzTx15hNM2n4TsQIBqU
 xdrZJryk2qGC6MhyvAiRDZ1x0mJQQBNf0itzksLVXGhxmtC1rWf+HMw4/2kal8mmZLR5bpOODky
 WAlcRhP13ZuANEpsQi3Q2mAax1bkNiUrFQiMAMm+luW2TGAQL/eE98Pq09rytkzjgIiOsFifo4P
 zUMmIM28IAaqkEnaEKQ==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac6c838 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=nRLft1YshIEh5o0YeFEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: IHWZA3FqOhg8xBTTD9PrBIeFxQY8V2M4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_07,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610070089
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

On 10/7/2026 1:50 PM, Yonggang Luo wrote:
> On Thu, Oct 8, 2026 at 4:29 AM Pierrick Bouvier
> <pierrick.bouvier@oss.qualcomm.com> wrote:
>>
>> On 10/7/2026 4:48 AM, Yonggang Luo wrote:
>>> Register target definitions through constructors instead of
>>> MODULE_INIT_TARGET_INFO, making target_info_list() and target_info()
>>> available on entry to main(), without explicit initialization or a
>>> call to module_call_init(MODULE_INIT_QOM).
>>>
>>> Keep the target list sorted by target_arch and default to its first
>>> entry. Provide an unknown TargetInfo fallback for target-independent
>>> tools such as qemu-img and unit tests that link no target-info-def.c
>>> objects.
>>>
>>> Remove the obsolete QOM target-info registration infrastructure and
>>> update the multi-target test to inspect target information before
>>> initializing QOM.
>>>
>>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>>> ---
>>>  include/qemu/module.h           |  1 -
>>>  include/qemu/target-info-def.h  | 56 +++++++++++++++++++++++++++---
>>>  include/qemu/target-info-init.h | 53 ----------------------------
>>>  include/qemu/target-info-qom.h  | 31 -----------------
>>>  include/qemu/target-info.h      |  9 +++++
>>>  meson.build                     |  6 ++--
>>>  system/vl.c                     |  4 ---
>>>  target-info-def.c               |  1 -
>>>  target-info-qom.c               | 60 --------------------------------
>>>  target-info.c                   | 61 ++++++++++++++++++++++++++++++++-
>>>  tests/qtest/fuzz/fuzz.c         |  3 --
>>>  tests/unit/test-multi-target.c  | 12 +++----
>>>  12 files changed, 129 insertions(+), 168 deletions(-)
>>>  delete mode 100644 include/qemu/target-info-init.h
>>>  delete mode 100644 include/qemu/target-info-qom.h
>>>  delete mode 100644 target-info-qom.c
>>>
>>
>> This approach (custom list based) was considered before implementing
>> things with QOM Types. The rationale I followed was that if everything
>> is in QOM, we might better follow that for consistency sake.
>> Yes, the compromise if that we need an extra init step, but it was not a
>> problem to add it.
> I have issue to add the init step for unit-tests, and hard to write the -target
> parse procedure and get it right. Not means this won't work. but for
> me, too much
> coupled.
>

We already have such a test upstream:
https://gitlab.com/qemu-project/qemu/-/blob/master/tests/unit/test-multi-target.c#L35

The init sequence is quite straightforward:

```
/* initialize target types, and only them */
module_call_init(MODULE_INIT_TARGET_INFO);

/* we can get the list if we want, for -target or any other purpose */
g_autoptr(GSList) targets = object_class_get_list(TYPE_TARGET_INFO, false);

/* set the global target info from any element in this list */
TargetInfo* ti = ...;
target_info_qom_set_target_info(ti);

/* register rest of QOM types */
module_call_init(MODULE_INIT_QOM);
```

It works fine to implement -target (if we would like to do it), since I
implemented it myself. That was also my initial motivation by the way.

Also, I appreciate that target-info is NULL by default, it crashes
loudly when it has not been set, and make it easy to find who depends on it.

> If we treat target_info as a QOM, but QOM needs target_info to set
> up(is_avaible). That makes
> the init sequence too much of a burden.
>

See sequence above, the solution is to initialize TARGET_INFO first,
before the rest of QOM. You end up with the same result than with a
statically initialized list.

> 
> is_available is depends on target_arch
> And before this patch, target_arch depends on QOM, pulls user/softmmu because
> target_info_init. By moving target-info to be a custom list based, we
> can decouple
> target-info from qom/softmmu/user. and target-info will always
> available once "main(argv, argc)" is entered. We also have the
> advantage of doing all sorts
> of tests against it.
>

Which kind of tests are you trying to add?

For now, the exact list of places where we need to do this initialize
target dance are:
- system/vl.c:    module_call_init(MODULE_INIT_TARGET_INFO);
- tests/qtest/fuzz/fuzz.c:    module_call_init(MODULE_INIT_TARGET_INFO);
- tests/unit/test-multi-target.c:
module_call_init(MODULE_INIT_TARGET_INFO);

If we want more tests, I'm totally ok to move this init code to
target-info.c, and replace call sites if needed.

> 
> Tools such as qemu-img and unit tests may link target-info.c without any
> target-info-def.c objects. Their target list remains empty, so use this
> fallback.
>

Why should this tool get access to target list? qemu-img deals with disk
images, and is unrelated to targets.

> 
> static TypeImpl *type_register_internal(const TypeInfo *info)
> {
>     TypeImpl *ti;
> 
>     if (!type_name_is_valid(info->name)) {
>         fprintf(stderr, "Registering '%s' with illegal type name\n",
> info->name);
>         abort();
>     }
> 
>     if (info->is_available && !info->is_available()) {
>         return NULL;
>     }
> 
>     ti = type_new(info);
> 
>     type_table_add(ti);
>     return ti;
> }
> 
>>
>> Is there another good value this list approach brings compared to what
>> exists?
>>
>> Regards,
>> Pierrick
> 
> 
> 



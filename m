Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B0CCA600C
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 23:25:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEazr-00081m-AX; Wed, 07 Oct 2026 19:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEazp-0007zM-UQ
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 19:24:26 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEazn-0001PP-P7
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 19:24:25 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 697Ltc9c625692
 for <qemu-arm@nongnu.org>; Wed, 7 Oct 2026 23:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iRTams5u3ThywoYayASBAHP286WCAaUpAMhGuQ+aWdE=; b=liTw01HtP9iyXauA
 V6PZscA1i5NMkwbFWajhW3aD1l/H/O6YZ9K8lo+TzvH5uDOLEyUMhLaWhYzVuXSo
 ovWVH9l1m+ppnpPoyow15vpNasv5Fi6TMLTuEEkYnrpu/8jB89BBxfHUiqR9W8n5
 duBZePQr2dFsO+M9nlPsbByVSx3DZt+TwhEizXSISKazK36Ym5eyFBztKd6XQAbY
 8UOKbT2QWT2Abl7MkdkJzN/GyaT1LunR5yQXVKcOmDDHaVnZnoN1X4trPxDgYVaZ
 XTiWVnUirAglLFcV8F7U+zWGReHa9ZYA8UNH7KaccznbpOzhhscuFIKcMWx345o+
 KuSZoA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3gc6r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 23:24:12 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-351788121cfso711445eec.0
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 16:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791415451; x=1792020251; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=iRTams5u3ThywoYayASBAHP286WCAaUpAMhGuQ+aWdE=;
 b=H4R4+WOBAhsMXOuGZE4SK6fPRtzX5bYRAgiwHJY5v0UBIBfaJal0NAYa6IA8UespeQ
 uLdtgRanqCjIJyIMp9oJgCYDvmv2aO4qWrVDewoWO9ZajB/PQtYz47HJ8F6aZ1lnyn4d
 L5Bcw7OvQOf5IA8Qj2iTZQqnFD3wBUp1sXBtKDkVokD/5TnncK5oAGLzHUKwLrcwPo0G
 N+ueELHes5BGDhdcse/FCtRMMp01UM/B/Ubzi8kHda2B/r+72vwsIGgn5oBjkIEKSWVM
 m+MDCVBZo79llI47AvWDDLMtKBIN3d+pCr5/UvZq0um6vugz2CvrPzcOUk2xsXNskb4M
 DROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791415451; x=1792020251;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iRTams5u3ThywoYayASBAHP286WCAaUpAMhGuQ+aWdE=;
 b=vgJZOde31f6zHVwBBFmQjcXe/zBqS4tzbssWZnGtvfP2IZgFUGTrnEB7D61SeoWVtH
 xBzuJ9noWnx1z2biUUsakHoZhBbFsOi8E8f0AEcyG0szhM5C1HxuWosqZQmOM8X7mQMi
 j1j2IcIccwWYHFkwkJSODfGZKPtu0JZvCSmoo3pzd3dDqalz3iriU1VyeH3jlk0spG4o
 nwyY9Xo/Gmj/i+pogQ3a5ny6RaDdL0O2i1ISECkUk19xPNPnzj+yC/17JQWWTAWynpbn
 q+B/OIhVpyiV3MjCdaG4vfqG13bzaZvl+YYAfM8dw0+5bbMUsbbAPHXuFNSuWUHHYPDS
 L5Iw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwfWwY4NSPzXhzDXEs7pMXTJQb2sAksbGaZnRhyh/nL5UIcP/qGEygIfNN+lSCFDtwxhhnRXGIv3g==@nongnu.org
X-Gm-Message-State: AFuF++lrZNjMKF/JwZ5NrCWmoyJdRqTJiGU4DtMdeFVCG1J0kJkc707U
 cB9VPnnBLAhX0BDLQpdB2eOS6lchjqrVbMdkygXd1B+eav+wzguSniZFybjJdieC87wgJKcIPVJ
 c6UrBFf9QOIazY1lMJ6rkUXu21GrCTGi6ege3H+6Xk3e9rcFMKkwkV7g=
X-Gm-Gg: AYBFou2HHxSrcBgyMCqKfMiPlU3tt0G2uCt2YAcUs02F230ZQvPvqPDKHu3sz+7Kw6+
 KJfWryrCNY7+dMDDX5SvWr88oHSTCCwg04wR6WedkAnbpwfMFOHU/nkAxdB8Z9ECIYh9cwv27y0
 rtnCJPWg2FZyCytqVNC2vvahcaE3uL0EaxA9+G83gmorGUhCGP6XuGiVIurIniCelDINYYpTsD8
 9oSKC8/4Nvmi2KtYzPIoJBFSKBfzyCPqmbzbqb3/dYncppIHGQwhZ0Yo3Oc3wEYFov8ecaiTK09
 CBDthyo5XIz7adjHtou5DMy+ILum/SJ62WaLQDFr4OQrxLnD3cVbnQoJmtff7cfcPcPLvCaL4rr
 /lrHoRozATiZldSLoAagR4mIjDDjWoZfXAtJ2Ukk4nC6At6cayu39pQPs9PjBdPjM0tYOXA==
X-Received: by 2002:a05:7301:7d06:b0:341:d191:b838 with SMTP id
 5a478bee46e88-3515de82736mr3943174eec.31.1791415451180; 
 Wed, 07 Oct 2026 16:24:11 -0700 (PDT)
X-Received: by 2002:a05:7301:7d06:b0:341:d191:b838 with SMTP id
 5a478bee46e88-3515de82736mr3943095eec.31.1791415450282; 
 Wed, 07 Oct 2026 16:24:10 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3515af7ab9fsm9845032eec.18.2026.10.07.16.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 16:24:09 -0700 (PDT)
Message-ID: <578afeb7-d302-402e-bedf-43b29ef00d5b@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 16:24:07 -0700
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
 <919a1a75-78b9-42a9-93ed-9edf6757f707@oss.qualcomm.com>
 <CAE2XoE8G7Pyu-UaoW0BRxHqEX2aef_ak29mAkwwssSS5Rf_y5A@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAE2XoE8G7Pyu-UaoW0BRxHqEX2aef_ak29mAkwwssSS5Rf_y5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA5MyBTYWx0ZWRfXxlYCVZPvABeQ
 9HMEIZ9Kgvmh4+9iZUeaS+HI0uZdE7YhPHbwpkjrV5wV+jBVEdDAtw0CvSaZkpQacyCP5U4ZXeL
 f5T5qHM19T+A0FX9koNNt1B60lALAlc=
X-Proofpoint-ORIG-GUID: Xsmnyw9Ncfbcy8eKVh_UI0Uf5ezNP3pj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA5MyBTYWx0ZWRfX2cT+8LCw5waK
 kIl6LWe/B+vnFcMzB9k2i63maUxJ8VH+ffCw9nUnomDggC1RyFyMPbILB4USb6qMO2fxUD6w9pz
 uiU4wB1miCrb6pOmQxZN0dSjaoN/RpDeJLuVzGYzFZbBxdgIAenPva2Ht/YHbFCRuWRtAh0Qv6d
 labxXTa/d6vWdcOMFtAP/LOf5RTzwvdcX1gRXLX7zd1UhYC/uzawOm4ygmtD/231J6sy/wL4S/8
 7woZDdFvx1QnPrcbJvH+aOKCyGWuA8OBoqrdZC1y0y6U/JO4t3qNqRnbJ/pP7s1Tu9n/koNHW5/
 u1AyyTf/6VEnoiaEydvwx5j/N8qAOIZZfTSjko6GcSfYozKRd6TcghQO18n3LhWLMqX5D4JM8CF
 CsEjnVyqNWaE9lKlfvLaO6eLyCUUoFPXzY2C9oLhzFvE4Q2O5Ueh1ioc1TbIVrYPshlaiDcYRkA
 ECK5L6X/QLMfIlJc55A==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac6d49c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Rl23PAiG-ByDcM_D8rwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: Xsmnyw9Ncfbcy8eKVh_UI0Uf5ezNP3pj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_07,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610070093
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

On 10/7/2026 3:54 PM, Yonggang Luo wrote:
> On Thu, Oct 8, 2026 at 6:31 AM Pierrick Bouvier
> <pierrick.bouvier@oss.qualcomm.com> wrote:
>>
>> On 10/7/2026 1:50 PM, Yonggang Luo wrote:
>>> On Thu, Oct 8, 2026 at 4:29 AM Pierrick Bouvier
>>> <pierrick.bouvier@oss.qualcomm.com> wrote:
>>>>
>>>> On 10/7/2026 4:48 AM, Yonggang Luo wrote:
>>>>> Register target definitions through constructors instead of
>>>>> MODULE_INIT_TARGET_INFO, making target_info_list() and target_info()
>>>>> available on entry to main(), without explicit initialization or a
>>>>> call to module_call_init(MODULE_INIT_QOM).
>>>>>
>>>>> Keep the target list sorted by target_arch and default to its first
>>>>> entry. Provide an unknown TargetInfo fallback for target-independent
>>>>> tools such as qemu-img and unit tests that link no target-info-def.c
>>>>> objects.
>>>>>
>>>>> Remove the obsolete QOM target-info registration infrastructure and
>>>>> update the multi-target test to inspect target information before
>>>>> initializing QOM.
>>>>>
>>>>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>>>>> ---
>>>>>  include/qemu/module.h           |  1 -
>>>>>  include/qemu/target-info-def.h  | 56 +++++++++++++++++++++++++++---
>>>>>  include/qemu/target-info-init.h | 53 ----------------------------
>>>>>  include/qemu/target-info-qom.h  | 31 -----------------
>>>>>  include/qemu/target-info.h      |  9 +++++
>>>>>  meson.build                     |  6 ++--
>>>>>  system/vl.c                     |  4 ---
>>>>>  target-info-def.c               |  1 -
>>>>>  target-info-qom.c               | 60 --------------------------------
>>>>>  target-info.c                   | 61 ++++++++++++++++++++++++++++++++-
>>>>>  tests/qtest/fuzz/fuzz.c         |  3 --
>>>>>  tests/unit/test-multi-target.c  | 12 +++----
>>>>>  12 files changed, 129 insertions(+), 168 deletions(-)
>>>>>  delete mode 100644 include/qemu/target-info-init.h
>>>>>  delete mode 100644 include/qemu/target-info-qom.h
>>>>>  delete mode 100644 target-info-qom.c
>>>>>
>>>>
>>>> This approach (custom list based) was considered before implementing
>>>> things with QOM Types. The rationale I followed was that if everything
>>>> is in QOM, we might better follow that for consistency sake.
>>>> Yes, the compromise if that we need an extra init step, but it was not a
>>>> problem to add it.
>>> I have issue to add the init step for unit-tests, and hard to write the -target
>>> parse procedure and get it right. Not means this won't work. but for
>>> me, too much
>>> coupled.
>>>
>>
>> We already have such a test upstream:
>> https://gitlab.com/qemu-project/qemu/-/blob/master/tests/unit/test-multi-target.c#L35
>>
>> The init sequence is quite straightforward:
>>
>> ```
>> /* initialize target types, and only them */
>> module_call_init(MODULE_INIT_TARGET_INFO);
>>
>> /* we can get the list if we want, for -target or any other purpose */
>> g_autoptr(GSList) targets = object_class_get_list(TYPE_TARGET_INFO, false);
>>
>> /* set the global target info from any element in this list */
>> TargetInfo* ti = ...;
>> target_info_qom_set_target_info(ti);
>>
>> /* register rest of QOM types */
>> module_call_init(MODULE_INIT_QOM);
>> ```
>>
>> It works fine to implement -target (if we would like to do it), since I
>> implemented it myself. That was also my initial motivation by the way.
>>
>> Also, I appreciate that target-info is NULL by default, it crashes
>> loudly when it has not been set, and make it easy to find who depends on it.
>>
>>> If we treat target_info as a QOM, but QOM needs target_info to set
>>> up(is_avaible). That makes
>>> the init sequence too much of a burden.
>>>
>>
>> See sequence above, the solution is to initialize TARGET_INFO first,
>> before the rest of QOM. You end up with the same result than with a
>> statically initialized list.
>>
>>>
>>> is_available is depends on target_arch
>>> And before this patch, target_arch depends on QOM, pulls user/softmmu because
>>> target_info_init. By moving target-info to be a custom list based, we
>>> can decouple
>>> target-info from qom/softmmu/user. and target-info will always
>>> available once "main(argv, argc)" is entered. We also have the
>>> advantage of doing all sorts
>>> of tests against it.
>>>
>>
>> Which kind of tests are you trying to add?
>>
>> For now, the exact list of places where we need to do this initialize
>> target dance are:
>> - system/vl.c:    module_call_init(MODULE_INIT_TARGET_INFO);
>> - tests/qtest/fuzz/fuzz.c:    module_call_init(MODULE_INIT_TARGET_INFO);
>> - tests/unit/test-multi-target.c:
>> module_call_init(MODULE_INIT_TARGET_INFO);
>>
>> If we want more tests, I'm totally ok to move this init code to
>> target-info.c, and replace call sites if needed.
>>
>>>
>>> Tools such as qemu-img and unit tests may link target-info.c without any
>>> target-info-def.c objects. Their target list remains empty, so use this
>>> fallback.
>>>
>>
>> Why should this tool get access to target list? qemu-img deals with disk
>> images, and is unrelated to targets.
>>
>>>
>>> static TypeImpl *type_register_internal(const TypeInfo *info)
>>> {
>>>     TypeImpl *ti;
>>>
>>>     if (!type_name_is_valid(info->name)) {
>>>         fprintf(stderr, "Registering '%s' with illegal type name\n",
>>> info->name);
>>>         abort();
>>>     }
>>>
>>>     if (info->is_available && !info->is_available()) {
>>>         return NULL;
>>>     }
>>>
>>>     ti = type_new(info);
>>>
>>>     type_table_add(ti);
>>>     return ti;
>>> }
>>>
>>>>
>>>> Is there another good value this list approach brings compared to what
>>>> exists?
> 
> Sorry, I have to wait for your work to be done first.
> I have too many patches depending on this, and it seems hard to
> convince you. Let's just keep it as is.
> Maybe you can work them out in an easier way.
>

I quit the effort of upstreaming a qemu-system binary some time ago,
because it was not easy to get a consensus on what the new binary should
be, and I'm happy you took the relay there. I try my best to help on the
issues you bring, some of them being interesting problems that we need
to solve.

Thanks to your work and persistence, it seems like conversation is
starting to converge towards something: qemu-system with all
devices/machines/cpus available.

It's not what I had in my mind originally, but I'm happy to see progress
on this, and open to accept this alternative!

> My work is here.
> https://gitlab.com/lygstate-qemu/qemu/-/tree/combined-binary-multi-targets?ref_type=heads
> I am afraid of posting 300 pathces into threads to flood it(and
> disturbing yours). So I'll wait for your work first. and resolving
> conflicts later, that's really time-consuming.
>

It's indeed not possible to send 300 patches and expect this to work,
whether it's on this mailing list, or any software forge also.
It's also not possible to send a link, and expect anyone to take a look
at the 373 commits sitting it on top of master. My name is not Claude.
Instead, humans have to progress step by step, based on feedback. Yes it
takes time and it can be frustrating. And yes, I've been there (and
frustrated) also, I feel sorry for you.

At the moment, if we want to make it move on, we need to focus on one
single thing:
"How to document/specify which targets a machine support".

> I did many explanations before. seems my explanation is too bad and
> not to give a clean picture for you, let's delay these first.
>

If I can suggest something politely here, IMHO, alternating between
genuinely human written messages, and AI content sent as it is on email
or commit messages is not helping on the receiver side.

I would prefer anytime to deal with imperfect english (mine is imperfect
too, I'm not a native speaker neither), compared to read what
Claude/GPT/Deepseek generated that was pasted as it is.
I understand it's a good tool for helping on the language side, and
that's ok to fix grammar and sentence structure.
But asking "Please generate a summary from those email threads and
explain what the current series is doing", and paste this is doomed to fail.

It also has a very detrimental side effect: it makes me start to wonder
where the code is coming from also. Especially when seeing boilerplates
with lengthy comments written in perfect english. My 2 cents is, use AI
if you want/need, but make sure the result has this *human* touch.

> I only sent these 8 patches for easier review. because too many
> patches won't be accepted either.
>

This series is useful, thanks to your answer on last patch, I finally
see where you're headed. I'll answer there to keep this moving forward.

Regards,
Pierrick


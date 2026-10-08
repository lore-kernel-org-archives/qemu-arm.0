Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39126CA600D
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Oct 2026 18:27:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEspd-0002Md-Il; Thu, 08 Oct 2026 14:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEspb-0002Lw-Pl
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 14:27:03 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xEspZ-0003L3-Nk
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 14:27:03 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 698HVMSu3411243
 for <qemu-arm@nongnu.org>; Thu, 8 Oct 2026 18:26:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yrQYsMDatO2yTJ1PEcjAhEcOsccrnU/Elxpswf8CQoQ=; b=JvZb458l8Y5VssTl
 bX76s/GXDCz+7+etk/SB0QGBASs2nJThcG6XrGTW71NFjWtxQ5uxsBuDdoBg1hUy
 pSSQj/Yx3E1T5EApfe2DQEt2cm53c6Kn6oTiFIHDRhhdBcr6bU7MOX19AN30VKV1
 KpIcWj1r6tXUxK1IbGppQHKqeWk4bBUJlmMmP05KQJynJL9D/nIZSgeQ3XMZ7u2C
 V2VjTVu0FigMZMc6Koe/WUS2P8WFu+p+bjHb7raHl1UHQenZLRgdMBhXcfiybxo6
 FUI1y5Kp5QDoafcfOeX03ft0I9BVEcJNHeLo1wUIcmhOfluFAiNR8W8Fx64SjL1z
 qNnS2A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6b9khbgn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2026 18:26:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-cc4216aee8fso5821457a12.1
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2026 11:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791484019; x=1792088819; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=yrQYsMDatO2yTJ1PEcjAhEcOsccrnU/Elxpswf8CQoQ=;
 b=W6IV+9LPoCzZ3r75KhC9uwzQBmDP673SieUu3xe8N19rLUr93ZQs0mYLdttrGyYCbj
 Lm1ivNVNNMbEheRV0KAGURxFCPzcZWedEkxC3amvHUo+HByOK9OCPK/ei0EmY06E2E+x
 hMRUfqyQKbY2QEulAUNpCfG35hzdd+eEzNIw8i9WrIiMG/acfsX7JuTVv6znDL3+AaKo
 m0Ac5NGn/DaeeC4PvRXc6nOdsJty1dUjjykvAPMf4QGgbPQeNi7l0Pu4q1vux0LykvRV
 haStXtd2An3McNiB9VXT8i8M7dWpjqf5zM2Cr+9XdTZ4QHJJEbjVkzUBIRboYh/JJWBB
 TEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791484019; x=1792088819;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yrQYsMDatO2yTJ1PEcjAhEcOsccrnU/Elxpswf8CQoQ=;
 b=YVeLqc9kghBr9F0F0S9wGP8yP2ZR/tqchREq1H/MBXCmpmtVs4C0OLmZgRq1/WMu3n
 fP1tYgW9VbZuLVmFN258gZptuLRo0Pgz7uSDmk0j06DjJ3vIEUaLOMm/9IN4G31s3Nup
 6ieOLf1UYfYB3rIjoM9tk6BI9hLEdYphdRRuGMbdK9HC+2KhsNL5btyD02bcsSnzBLch
 W7I+hOyPQI1EY6nkqOOHd6+AOy8Acyu8Xa4aFIXZ2eYGGn4Dnysqxl1ByUnKY0rqO/Pp
 S2iu9QWliG8QMf1vbUdQr7Vu8ih+PgnEsOmR6szpyBH1xkXxmzvqfKZ+vAQl/ECXvJNy
 kZIQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxSTiahbNYr3ZkwYOF0t4B0/SSuF0rlWt9VUgGq3xmZZ67TAbMqu1strTl/2DLvDR9K66u3HnnllQ==@nongnu.org
X-Gm-Message-State: AFq9FYIGPjxioTt4NpvJgzayxg1f2zOAu5jnlDu5a1b6nvp8UcPxz2X+
 9ii+btTU3zHe/Zz7F9e/Q0VwW2IXMAB80iZipubyoCDI4l6Dpn5ahLFfbiVjTvA8dyIqlTTaApx
 17Z+5T3f82gEC6UiQysXtsnc7tz0GmoRuCaO/8XPOAxh/VRCLRLcnawc=
X-Gm-Gg: AYBFou2n29T4f0wjKIsAC0ThNh/Hp+8k0VBhL58QbBvR42D+H2sjA7b9TDJ+MIVJ0Av
 Se2i+Xw70hDMfQFJgb5M0FLnRT6O62BSbFRmulufb2bdjaGvfeHVh+j+aBp7MiOx0VljjUXbPGo
 l4s5kB6Uf5SmFq8nmOY85K6rDV6PuRxc96F+9sbMXLka6bvJ3x9k+qOLRxbpmAvuxGdvbxYrkiB
 IbJFFCqsLUf3xuEYttGmXaWt0r+LsBCLGLhdmo2LRJDQ3QZ8h/98GX7iFce7Sqr+ZN6ZFqn3Az1
 OqBinpq1u9IqLiNRMHW/Y1QET2JcvriQydhviBc2Me2BHVl2e+erc3ws9zKOYeH77NB98G4f1p5
 W2OJPfsWtRHxWhrFbzeAVLFJo02zoG4I7VMYYDuLCd/2VAqiMV+cmbf5JVBidDjcrQPrXVg==
X-Received: by 2002:a17:90b:3809:b0:3ab:1e1c:837f with SMTP id
 98e67ed59e1d1-3ab1e1c84bamr1158382a91.47.1791484018458; 
 Thu, 08 Oct 2026 11:26:58 -0700 (PDT)
X-Received: by 2002:a17:90b:3809:b0:3ab:1e1c:837f with SMTP id
 98e67ed59e1d1-3ab1e1c84bamr1158354a91.47.1791484017810; 
 Thu, 08 Oct 2026 11:26:57 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cd3a78491d4sm194412a12.24.2026.10.08.11.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 11:26:56 -0700 (PDT)
Message-ID: <8c3e6104-f59c-42d9-949a-1f0c7c8dd567@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:26:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] qom: pass TargetInfo to is_available for later use
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
 <20261007115253.328-9-luoyonggang@gmail.com>
 <7fc0d377-a994-41f4-aa98-7ed56db11447@oss.qualcomm.com>
 <CAE2XoE8K+3e8h6H9NrPk1WWMmJfG807bN_Kh5qje-5pKWUUg5w@mail.gmail.com>
 <b2d89a92-0197-4873-b4ea-75bb21c0d0ae@oss.qualcomm.com>
 <asdkF80SJzF2W3sD@redhat.com>
 <CAE2XoE-Vc+CaE-3FerW3eXtTgspwxZJ6ZT0CZyg3ZYpoJ8xYXw@mail.gmail.com>
 <98644e74-9219-42f0-bcf7-8cd7f02353af@oss.qualcomm.com>
 <CAE2XoE8qSVczu5R1HTwOV+PhPo7_wWzB=KSqhJroqbgcP5GDRQ@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAE2XoE8qSVczu5R1HTwOV+PhPo7_wWzB=KSqhJroqbgcP5GDRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RDznh6b2bs5nbrYbgD8pUriHCX-KSh1g
X-Authority-Analysis: v=2.4 cv=U98Hnuru c=1 sm=1 tr=0 ts=6ac7e073 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2f3RJI41k0KcyEjw8P4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA3MyBTYWx0ZWRfXwS3c1rK71b43
 MmqTHXyqWpBi+wOpMHn6iexBBkVe1Lr5ucyFuFSJl2E+uxymwaP1ztXIYVDwypg1QsKAPtSShhT
 xU+nUvD5rUeOnertiLA/W7C4h0KbTGA=
X-Proofpoint-GUID: RDznh6b2bs5nbrYbgD8pUriHCX-KSh1g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA3MyBTYWx0ZWRfXxKpq4kBVosI7
 cbprEdTnrKfmSSPIaD75HWmFGMphHYojh4XFPDgFLiVPd0k3QxTWE/IhTLMwnekSO01Yr4RddGr
 rzSHu9J0Z5yOO9EMR6H4omKvDLjCIwpQzoddZOK3do33AAqxQbV6OOlQx1QlvqVTgEZLMOs50Vp
 YSgrCyOe+ruEaai6S3jjCNvVW372cyxZNttbrYK/UP/wDQVCLF6/CVGI/nPlMy7RMjJ65ts/aNt
 qIyfLJsYdf3hliWkROMSvZNbdf1C5qEkEWOXOmDlt1Gq6/ZRgrCTBF/blctC6EUcuyRZ5oysxW1
 kzgYPKItaNIuOjo0w4CHBhP5GIlpvGi5wIjW01HtMimDKzlFvZe56BwMWrnS9W/Jf2yA0dRnlyX
 /0hLTsdtwGSmdF/tu/CH411bV2aqa4heIGiDu/tIko6B/Ua8oAR6EWAV6f38fWDQBo04g/ciR05
 uJSI1xoqKZSX6Z8pQWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_06,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080073
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

On 10/8/2026 10:04 AM, Yonggang Luo wrote:
> On Fri, Oct 9, 2026 at 12:01 AM Pierrick Bouvier
> <pierrick.bouvier@oss.qualcomm.com> wrote:
>>
>> On 10/8/2026 2:56 AM, Yonggang Luo wrote:
>>>>> How about letting machines (and machines only first), have a new field
>>>>> 'targets', being a uint32_t mask with an array of EMU_TARGET?
>>>>> machine->targets = EMU_TARGET_X | EMU_TARGET_Y;
>>>
>>> To be explicit state what, I give you a pseudo code to compute
>>> machine->targets from TypeInfo::is_available(TargetInfo*)
>>> let targets=0
>>> foreach ti of TargetInfo list:
>>>    if (machine::TypeImpl::is_avaible(ti))
>>>          targets |= 1 << ti->target_arch
>>>    fi
>>> endif
>>> So they basically have equivalent effect, and is_available will handle
>>> other code-needed condition properly such as
>>> CPU/AccelClass. not restrict to targets, we can also attach the
>>> KConfig into TargetInfo, so is_available(TargetInfo*)
>>> also works for Kconfig. that's why I insist this way, it's solved all
>>> the issues around.
>>>
>>> so  machine->targets = EMU_TARGET_X | EMU_TARGET_Y; is a good idea,
>>> and it can be implemented with TypeInfo::is_available(TargetInfo*)
>>> without much burden. and targets can be saved into a (machine or
>>> TypeImpl) for fast access when needed, we can compute it
>>> when the program starts.
>>>
>>
>> In what we described, there is no need to keep any kind of callback,
>> targets field is sufficient to filter any type declaratively.
>>
>> For the KConfig related types, I would really be keen to leave that
>> available for now, and add a proper error message later.
> 
> Thanks, much clearer now, I was working for full KConfig related types support
> because I am trying to keep qemu-system-$arch to be a symlink to qemu-system
> which will still work without breaking anything. If we do not keep this then
> I machine::targets or TypeInfo::targets would be the best solution, I think
> TypeInfo::targets is better, and copy it into TypeImpl::targets. and give a API
> to retrieve it, for example:
> uint64_t *object_class_get_targets(ObjectClass *klass);
>

We can exclude the goal to replace existing binaries with a symlink for now.

Please do not add this to TypeInfo, but to MachineClass instead, as
explained in previous email.
If you want to reduce upcoming frustration, I would really recommend you
stick to this, and to a single machine to start. So we can validate the
series, review it, and then you can iterate.
 > Add "targets" struct members as TypeInfo::targets and
TypeImpl::targets, and
> copy from TypeInfo into TypeImpl for later access with
> object_class_get_targets
> Then we can use it for filtering machines and cpus without burden.
> 
> How to dealt with
> https://lore.kernel.org/qemu-devel/20261007-rv-dedup-v2-6-8a2f0f296a7f@rev.ng/
> 
> It's using is_available.
>

.targets field can be conditioned by ifdef for config vs user, since
what we have everything needed in build system allows to duplicate
objects between user and system.

#ifdef CONFIG_USER_ONLY
 .targets = ...
#else
 .targets = ...
#endif

If that's not enough, it means the type has to be duplicated in some
ways to resolve ambiguity (especially for 32 vs 64 bits variants).

> Maybe all using the way like
> Subject: [PATCH v2 07/18] target/riscv: Runtime register MAX and BARE CPUs
> https://lore.kernel.org/qemu-devel/20261007-rv-dedup-v2-7-8a2f0f296a7f@rev.ng/

I would invite you to focus on a *single* machine first. See how to
declare it, and how to query which target it supports. Then we can see
what works/doesn't work, and (in a future series) we can do the same
thing for cpus.

You'll see that this iterative approach works much better than sending
huge series. You have my word I'll be reactive and present to help
continue this effort.

Regards,
Pierrick


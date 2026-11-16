Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABF4606A322
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Nov 2026 17:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=grJ1Kd89;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OGiWP71s
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xT09z-0000QD-8E; Mon, 16 Nov 2026 12:06:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xT09R-00009l-5K
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 12:05:56 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xT09P-0006p7-6G
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 12:05:52 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AGGIK37451054
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 17:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hYnf9lSF1gayS2PNL00yCJYJM2vBoLLdirnw30zCLSk=; b=grJ1Kd89LBSyyUGP
 NiUXjk/gPXysw/J3FbLERUbh7az2S7xPIZfC7+2/vktuGF08PJ2wZ/EENKNb+te7
 EzHT3i1UaDxRhPlX+xlEV7WTGKDLqFWzDH1CLgszckjUfSxnYYo1UOdyH0AHguzy
 GG85vhTVk4UQ/Vln4dFICaoJHi3dwO5t3Kn2XPSowm6xx2Ptx/zp6Rb23RL2aCpt
 uRtE4T4J/2GDKUB1pY75Q65WROsKdishT7zfB0yfxn6cECMj5e6cTYU/BnNZFOop
 ypmyhrnYFHr1oPfn5AL97sZD43Vbths3RSUnS6EUVRH/CDxusKzwmIbhaRLuFwUs
 yD83Ew==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y0t8b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 17:05:48 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-5e93fab204bso4270956e0c.3
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 09:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794848747; x=1795453547; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hYnf9lSF1gayS2PNL00yCJYJM2vBoLLdirnw30zCLSk=;
 b=OGiWP71suTH5DWb6YWnM6HI7kBUYOvKs4Po5pz6kmkGBbUvuIcZFxQczG+5wLoX2Gb
 41mWJ8NO+MjTvJ/P9uUBl/5F/pIxmDmxgwY91Cr/OOvPOSzWvKsLSODBjkbG2oi/68/+
 M9Ws5Q50RpMr4MSISMpYYdG0wyOeAhjoN1CWUH/E/pwqj7uplkgf43YiyNhZMGZDq8bG
 eTQqGAjQ7HpC4SeYuGzdpOhF/QDTGmK6BbRcQpCiFHHQ/xRxoUucBxavbaORwD4UbKdy
 dhQ1VVITzoE520uHc9ETLW4/76C9gKE4+Cm6Wzp90DIoLhQJMOSBLCMPw0Q4YJme1exq
 FsVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794848747; x=1795453547;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hYnf9lSF1gayS2PNL00yCJYJM2vBoLLdirnw30zCLSk=;
 b=sT23MxDhlMjU/1PrK5qvZT02R+u/uKDgLXeclpc10vvjm+fjXgRi0d6mRTjXbiYkCx
 xoRFgx61H/qSklfHevotk4frog77I70mAWktsdmeB4rbpPv8x01oikZesR9YWvROaMYe
 Xx9yoFZDJztZ1iJj1xuy71D/qVJnwCD4I9z1JnludNQrAXf+vGpB+VW60aCUK/hHHoDl
 ioOqxXeU93knATrQi9Kx6Nrk1own28HICymAWsbhCok80UpPnDJLiTrZb0vbhSKuU1XO
 4gP8xCeF0X7jWdg/TVAuvJ6yZ9sHJZMOcdWx4c4PmZnJJJVn7wJylJX60lBmZB7LKKYD
 g7hg==
X-Forwarded-Encrypted: i=1;
 AL+hErGtkTxOHq5exKGGPaKaaR8T2Nbqi7ie4e2nY9kh2d637dxsF8kX+T+0zKCmMwZK/YmEShihtsJhZg==@nongnu.org
X-Gm-Message-State: APuU4Z/9dMaXdKk6TkoiPEtpzIy0piOsiQo7AIYCVFFfMN9wabC/DABQ
 KpVeiaKiaHYSFIO5SNgzTT8VXQmRxhaBWRFtRTC6f5QcdiR2DHKag9N+BKPw1Gjje1+AgnmVXBZ
 H2BXenirMlI2bSYTftJaWnuSL/7B9OVtPGtUnhX5r/TXbwmuCE4FoDdI=
X-Gm-Gg: AYBFou2wJL2RnD/yJUEoblwGjyITINRVpuDQ84DL/MRnzelGnjPemDxm79VsvCOMyMS
 2mbHSeZf4tQiTXoXOEuk9Ivm4tpb0DpIYnTScIQmCbnyPItLXvBDU4pwAAwsJi67lph0X+JNRkj
 in4oOzaMlupqjJFeU/apQ/UN2doRH3yiLvcqKtOu62ermFU4oJd0bfci2JSnCCAkkjgLa2/mQvm
 gG5M1jNCSWN2V9pMnnJueMjddQXxc7mELU71L0B3WEHiOGJOIJnZ5Pu74TaSizA47UPai/ODlyW
 ImvyMAjfIUmoWO3izSsnCN0+QrJqQh8cIRUHl7PL+2OstIVwYTcfG4lhvqQLgmqHmyHsEthdHGh
 FFopJJV0XzjAKww/8insrzfUun8MkWIc2xL8W4/eGJiLKh6uLArk3aiDfQMXzsX9OEE46Q+pKOx
 Oo+w6l1vQ=
X-Received: by 2002:a05:6122:e202:b0:5ec:5f1b:f725 with SMTP id
 71dfb90a1353d-5ee34b172b6mr4367995e0c.23.1794848747191; 
 Mon, 16 Nov 2026 09:05:47 -0800 (PST)
X-Received: by 2002:a05:6122:e202:b0:5ec:5f1b:f725 with SMTP id
 71dfb90a1353d-5ee34b172b6mr4367939e0c.23.1794848746630; 
 Mon, 16 Nov 2026 09:05:46 -0800 (PST)
Received: from [192.168.69.234] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c60021375sm21758336f8f.29.2026.11.16.09.05.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 09:05:45 -0800 (PST)
Message-ID: <b0633aca-736d-479e-b6fd-743f5ef23035@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:05:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-12.0 v2 00/12] linux-user/aarch64: Support both
 endianness at runtime
To: Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 devel@lists.libvirt.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org
References: <20261112180859.85380-1-philmd@oss.qualcomm.com>
 <9b64d3d9-736d-4878-80d7-4caa75eee778@linaro.org>
 <CAFEAcA8La+8TqFY0yCxRsXY2Ad9MA5Uu-sVEbysExZPkUXVawg@mail.gmail.com>
 <ccfcea11-ada8-4753-a71f-f59ed1bcb067@oss.qualcomm.com>
 <CAFEAcA9FE_dTUo5s2g7DMw9-ZhbjBUOfF0RJxdT7gMwm-rYuGQ@mail.gmail.com>
 <558f35d3-5a10-4652-8af4-4a88f382ca3d@oss.qualcomm.com>
 <CAFEAcA_gBzv7URWJNjXwjUbKOJuRQ=bd1NS9enpU_AW_tCZzvg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAFEAcA_gBzv7URWJNjXwjUbKOJuRQ=bd1NS9enpU_AW_tCZzvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wiOFod673qn2m9XvJg_iev0sfbGoCFjD
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afb37ec cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=CTncK0jjUzDGpt7IrtMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: wiOFod673qn2m9XvJg_iev0sfbGoCFjD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2OCBTYWx0ZWRfXzIG+CL2lspEG
 4yj20pjiFzBu6Eu4Ip+cQWJrP8CPvIC0qiXEyOt5zPakLPD6Qg61zSxQeJ1oAtvxga1hcaERduw
 N1X5G0pxg9DqQhh/6P9TBspHG1W1qLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2OCBTYWx0ZWRfX5BhtxD8fC03C
 hZoiaa2YF5iN4BVBLTx9S/NO5aVCnqYC00MEChECwLZzb8MIDxW4Dv8uT9I6beUCXdROp0VmGqf
 /FGjk5isFGY9XBPNiSBQoQui0fTySI7ttc3RGjWcR3e+ocqa2Rd782JB3UaHX82Qjk8X5y8gsJ1
 NByM5L4tJ6vkJFM737NvjIcZkV4J5XfTcViYDwNlHLVy//0YqMBiNaodLbZw9/yGI5Fv9dTs6UR
 OgI+QIDuCfKBpszsZtt6YtqFXaQgRGH49up0Wq6sRSpW0vkzUJ2L9gcxElAfeldLH2OQs0Efi+R
 Y4FBR5IgtixhfqIyeJpwxN8tqEz2xC6qjl60HG+Krphi6AnwN+EscWJ19J9Tt5lIDIVyyn3Ftdu
 LP43l91B7oB3UKiRWOMWN80LsCD35CLNYlBqECAy9YMUheLT46nUswhQ0UNef8B9O8Ev3HVQRc7
 tLY2FO9SZHcP6NjokQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160068
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16/11/26 17:53, Peter Maydell wrote:
> On Mon, 16 Nov 2026 at 16:31, Pierrick Bouvier
> <pierrick.bouvier@oss.qualcomm.com> wrote:
>>
>> On 11/16/2026 2:00 AM, Peter Maydell wrote:
>>> On Mon, 16 Nov 2026 at 08:53, Philippe Mathieu-Daudé
>>> <philmd@oss.qualcomm.com> wrote:
>>>>
>>>> On 13/11/26 19:55, Peter Maydell wrote:
>>>>> As a more general question, is this something we would want
>>>>> for architectures where both endiannesses are relevant (e.g.
>>>>> mips, ppc64)? At the moment we consistently for all targets
>>>>> handle big vs little endian as "it's a separate target with
>>>>> its own executable". That's convenient because you can at
>>>>> compile time hardwire in things like variations in struct
>>>>> layout between the two. We could switch to doing that kind
>>>>> of thing at runtime, but what is the benefit we're aiming
>>>>> for by doing that?
>>>>
>>>> I did the other conversions (Microblaze, Xtensa, PPC, MIPS, SH4)
>>>> and wanted to test the water first where this would get more attention,
>>>> with the series involving less changes.
>>>>
>>>> My motivation is MIPS where we currently have 6 binaries and I'd like
>>>> to add binaries to cover more ABIs without having a combinatory
>>>> explosion and have 18 linux-user MIPS binaries. With this approach I
>>>> reduced the current MIPS set to 3 binaries and add 2 more, ending with
>>>> 5 covering more ABIs instead of currently 6.
>>>>
>>>> In order to get there I need the few core changes introduced in this
>>>> series, which affect all user binaries. I have the idea ARM users are
>>>> the first ones interested by no performance change thus is where
>>>> I started the benchmark to prove this approach have no impact in emulation.
>>>>
>>>> The TargetInfo structure change (one initializer LTO-protected and
>>>> all accessors via read-only exposed structure) is also what Richard
>>>> was very keen to have (page size support planned) instead of the
>>>> current approach.
>>>>
>>>> I'm thus returning the question as: why would we not want to do this?
>>>
>>> Mostly because what we have today works, and the idea of "the
>>> target ABI is known at compile-time" is quite deeply embedded in the
>>> way the linux-user code is written (both in terms of ifdefs and
>>> also C types being defined appropriately for one specific ABI).

While we could go one step further and manage distincts ABIs at
runtime, I don't see the point so far, and that might have some
performance impact (although I'm not that sure). While endianness
is part of the kernel ABI, the changes are less invasive because
we already did them on system path.

>> The last part is what we had for system mode, and precisely what we have
>> been able to eliminate while working on the single-binary.
> 
> Yes, but it's taken a lot of work to get to that point. For
> system mode we had some clear reasons why that work was
> necessary and worthwhile. For user-mode it's less clear to me.

On that point, I already did the work -- and test / benchmark --
so it isn't an issue ;) The expected review part isn't huge neither.

> Keeping the zoo of MIPS ABIs under control seems the most
> promising reason.
> 
> For aarch64 in particular I would prefer to deprecate-and-drop
> big-endian support (probably starting with the deprecation for
> 12.0, rather than pushing it into 11.2), since the kernel just
> did that in 7.4.
Tangent to this, it makes sense to deprecate quickly enough on
QEMU side when a host-related project we use deprecates / removes
it; when this is guest related I don't see the urge, in particular
when the maintenance is almost zero cost. For the particular
aarch64_be I agree what we lacks is coverage testing; but for
other features I'd prefer we keep them as long as there is interest
within QEMU users, independent of external projects change like
the Linux kernel.


Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62255606A329
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Nov 2026 23:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IhDWpvOP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h9/g7kTg
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xT5kK-0004Cv-8Q; Mon, 16 Nov 2026 18:04:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xT5kI-00045A-3a
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 18:04:18 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xT5kG-0003q9-D8
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 18:04:17 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AGJfgx52135312
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 23:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +LYiEriCXViip2zjDX16EmH8eshRK2C/3AH4eAk5pC4=; b=IhDWpvOPAJbkBYLc
 m89ngNGOyeQB5CtRQoXv9hua9h964Gqlfycb9Glbsa4U8akb8n4Td0W3rY2OK+Fw
 38JJbwdUbevROxpHJC+YRZ9bsM6WzCzdr80t4Fb+va/JpShZN5g4VjTkNRELjWlA
 AUNgFVLFa39MwijQVeaUj97o3exsVxVZsYdC8zvqgDAxTtUehFTZvuEBK6UDPs96
 o0AxI5i8O7M1H7KT3bGP+45RztFJHFQkzWqGtmTukeAodZBGUUo6V73vqsx8lIXd
 lIGxLnxephBDXzR8MgMBhU2DC25dAKnoZmG4+XwL8eP5GO+M796E2AvDu6LK3112
 P0YmjQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0003jvcd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 23:04:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-36f26e6abe9so4723342eec.0
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 15:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794870254; x=1795475054; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+LYiEriCXViip2zjDX16EmH8eshRK2C/3AH4eAk5pC4=;
 b=h9/g7kTgZMQ/8wJkM0xWVNwjvyox3sNLAL2V5f7sqePY4mzTlCqgMxtJzfCot/JoAh
 +k2/NMLiVqGXgzVhqjvkJK3MfmP0DHaXK2VuxMEbKVITlfvXXWrpHjEXjsccTDBuPIsy
 FLwj8ihmOAM3JM2Mfdr16T0s//bv0ITvkUBNeiYy2eNSBQ2tMDVe5T0yur4FVPNJs2XP
 kEt1aL7GjrOqupX+51cvao7r2z6myIdac7zUJlcweyW9BN3s5A/ct+8pJVpBYRKo1qrY
 XNdIikaLRkoEro9PirO59g+yVs+45nFrZb71KZrwQ6xGh4j3Qe9LGhYDvn3Xh2UMifrp
 rJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794870254; x=1795475054;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+LYiEriCXViip2zjDX16EmH8eshRK2C/3AH4eAk5pC4=;
 b=jLxAYEj5t3GgGANhF8pK5hR378JM3UAwCfgIw7ehfGm69c3iyaiGLE5t/Mr5fgDDAk
 x3AwCKCF6pYBHu1L2Vf+t1KYqFEgX/3TTrGepeZ24wiORxiCvFa4W+eOoMQ+s5HHdw76
 2Tx3ctqKKEr3E/tp+cnLI3WGvZAPj531L0tNeMmlU2E4rEOIHuLaz/OE9enmfo37mGw2
 n0JiLWURVrRA1DAA5obbeQBKcWXsFZUMvgC8KOF+x1gtj0F6qSLF8+u1YYsFsQiWlRiT
 Hc4f99s7SwJLVDoj+NlToKgdP2dvNhMTntMmPL+zOsitPubEVH1uOjkRp2aZSl9qAU3V
 x4gg==
X-Forwarded-Encrypted: i=1;
 AL+hErFdisV7r7ti3x7FoVGhyJfGb8Pb6L8fE1pZon5PTxu/wEt7RPux4sepFtZzFWc2mBMzq1gH5oHF/A==@nongnu.org
X-Gm-Message-State: APuU4Z+TlN/qJeVdKh9TE6dkba/xx3aF7sRFxUdnDVD+HkzacauxzTQm
 zvshfSFKr1tAUTJZR76VatQcG5PomS635oe3+Fs7aOE7/ua1dwsPFuz3h5wbATJOyOJF13i/BQr
 mZOlOEiZbrqNwb4ViPvZeIpz3rAkq0g5eLUkAgXTYmbAjGzP/49yqetE=
X-Gm-Gg: AYBFou1rGseUoSAYMSucaCpKcOZwQiEAn4a0g3P/nMZg5A6tXLBlvODInsxnHK5nOBJ
 2FuN1hWEpwFWsuiMAEj3SSlTrA3GmxwqYehEQ0GvQEZ0/XiZHIE/agyHwZ1tHKh25hlaJHUAI7Q
 G7Mzb4DXV1EzN7CvwZPLZB+u5IEE61tx4Cxg2ZtBGfr26NbI5LyeoSD7gVSvMqwFbkjfTcXzo2a
 +GsKhSSMWvHL+okxH8nHKW5g1vwiyJT+N1QfG+jIClNBcYCcxGoxa9tplg48M7BYmalFIjP1tG1
 LU7cB8qrjUDreRTtNEVk13RjrPC7WkN9a5myCkuCt8yv4QZ4tGp4xF7/VfbpTS3u9yotkWPYfBa
 WJo3PbXsr/rJzdnnh7yZTOXmMiCqrgpQf/IWnabx0GqY3Wuzdm7oNA+vlxgBPAmP6GD3dzfpSkr
 wc0d7CZRBcqzXp597RdFGX7Yw12SGGEsVglRL4lz/pnNg=
X-Received: by 2002:a05:701b:4642:b0:1b2:42e3:e5f0 with SMTP id
 a92af1059eb24-1b5030eb063mr9936677c88.12.1794870253691; 
 Mon, 16 Nov 2026 15:04:13 -0800 (PST)
X-Received: by 2002:a05:701b:4642:b0:1b2:42e3:e5f0 with SMTP id
 a92af1059eb24-1b5030eb063mr9936652c88.12.1794870253065; 
 Mon, 16 Nov 2026 15:04:13 -0800 (PST)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b524049e0asm15896701c88.4.2026.11.16.15.04.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 15:04:12 -0800 (PST)
Message-ID: <3547315f-ca86-488e-a114-7dd892998f8b@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:04:10 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-12.0 v2 00/12] linux-user/aarch64: Support both
 endianness at runtime
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
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
 <b0633aca-736d-479e-b6fd-743f5ef23035@oss.qualcomm.com>
 <f8113426-968f-4e96-bf1f-f80f2de6642a@linaro.org>
 <b9ac4b40-6457-4de4-b362-fef53be58cd5@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b9ac4b40-6457-4de4-b362-fef53be58cd5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vcTX6RaaYFDcHsvqoGEPMZCnIj6KXDiG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA5MSBTYWx0ZWRfXyZ0eGty8c87l
 ql0V3hsm7bxLDE7K/Kxgzy8vwAUq2H7Is9JY+0T7BExu+1h3daxblzkzwkL8RSwYZO7bzgcALrp
 erVvldiCJ4/OSKPTfZpUGji4fIP5SnQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA5MSBTYWx0ZWRfX2W7zqRJoQZL0
 BLzO/bmjC1r9EG3mURHZsEEBBPvdbrRxWUqinp8zhqktml1ykTB/ktLKZgaLu/VPqtNY/6yO9Lk
 3D6DddZOCG3XQECgGTgVXIvVBYoeZPMb+J/YZsry3IMrrfQUauW9K3SWB6Wzof3fHc+/e62iVf2
 MjWDIKKSeV6sLJYyKubDWij5OLRv3IZaL66V746rCvGvEnkAc1HERaAsAmMhGWRLYTWfP0F+fcQ
 10jpQfwwD+XK57siJJMTXdgvDeLBobv5SZcU/b+xCndzsVm1v8msADuTP1ZKK7u4zjRt7JNaQIl
 IvMutYcNhydLJM/75BoO80Z6llWXGm7SGsTGXA6gKP8z1BPQh/sHUAlkXZJsWRg/AHBGK+oglYd
 QanFKbrZe14YN7IsYReSBQw/JGkuHQH/gMp6jAtglt/VN+XaDa2YXwwD+z6nwCpH/t3TkpMvKwF
 +QPOrWBpthZYPwCkQ6g==
X-Authority-Analysis: v=2.4 cv=Z4N5j3RA c=1 sm=1 tr=0 ts=6afb8bee cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=sEcWKaIgVgPjtOG_hF4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: vcTX6RaaYFDcHsvqoGEPMZCnIj6KXDiG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160091
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

On 11/16/2026 3:00 PM, Philippe Mathieu-Daudé wrote:
> On 16/11/26 23:28, Richard Henderson wrote:
>> On 11/16/26 09:05, Philippe Mathieu-Daudé wrote:
>>> Tangent to this, it makes sense to deprecate quickly enough on
>>> QEMU side when a host-related project we use deprecates / removes
>>> it; when this is guest related I don't see the urge, in particular
>>> when the maintenance is almost zero cost. For the particular
>>> aarch64_be I agree what we lacks is coverage testing; but for
>>> other features I'd prefer we keep them as long as there is interest
>>> within QEMU users, independent of external projects change like
>>> the Linux kernel.
>>
>> There have been a couple of attempts at aarch64_be, but *never* any
>> upstream traction.  qemu-linux-user is about emulating Linux -- you
>> can't divorce these two.
>>
>> In my opinion, those that want to work on aarch64_be can work in
>> system mode, where the endian switching bits work as required by the
>> architecture.
> 
> OK I'm happy dropping Aarch64_be. Patches 7-10 are still common to all
> targets and worth review comments :)

Beyond aarch64, what about qemu-arm and qemu-armeb?
If we all agree to try to unify that, I would be happy to help review
the series.

Regards,
Pierrick


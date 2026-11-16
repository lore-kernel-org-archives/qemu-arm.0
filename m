Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37624606A31C
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Nov 2026 08:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C61dx809;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P4v6UCe/
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xSsSx-0004iS-Sj; Mon, 16 Nov 2026 03:53:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xSsSv-0004fS-Ts
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 03:53:30 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xSsSu-0007XY-8x
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 03:53:29 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AG7f0983192460
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 08:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EBAblflXqVxM4gyT+sTs9PxFbLJEHnJewxOdLYnsQ54=; b=C61dx8096hpSw6FV
 efc8iDk939T+qtmYf/SPQ2piyNUpgzqMna9AfyVQRKegGj8Lwq/63wwoMcV+dWDX
 DzYZDDxwZdktXd3v41OlZUNVblFRIdF4N1uY5VKdNiIv3gE86qSsO/w/K+0HfXHm
 +PPgDr+DgXKDaoJlXrVwxbpsGZ3tMmUqI2ZI+FMKtN5eyiH6qz5tiqhx8Yi1gX4d
 tVh4357m+dkLumgQW0ULiJvchVk2gXZQezdPsoLRGdGfyHCm7rWT6QbXlVdGVpMy
 Z0WTigawC2w0LIxELblC1q97P1wqvosEO4yWAKeKNBcGbUEhx/TW8BEaMKru4NEn
 Gt9hSA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj45p4a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 08:53:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f20addba1so617175985a.1
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 00:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794819206; x=1795424006; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=EBAblflXqVxM4gyT+sTs9PxFbLJEHnJewxOdLYnsQ54=;
 b=P4v6UCe/38V6fpkgqXAKMx76t6Tp78jIpeuLtAVSpJWRczks766dLrqWPvsw9LhMm6
 Vcaz4E1c8tNiwZOm/RrKsJ8RCtnjx5BnCVvMzAmTF/MlGhOOGbxzY7TalilynjRDqctB
 TYs/GTRC7xzPTqj1H3nUTitr1t4neP4bQYIsR4VuZYsD+4Szil+KPpmxTd+s6d8X8QJN
 oDlMDIHgRbYCcGM+P5WFpbw/PtzVx/M0xN+XHTDQgDPoppfL2xn6WQRXhIL+eAOK+e3E
 qEMcouyeEgGk3lJI4wTYZmhCYVPWTDBeKsp/qckk3UzpAR6mAv3p5F+5RjxIA8PsrNF+
 NR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794819206; x=1795424006;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EBAblflXqVxM4gyT+sTs9PxFbLJEHnJewxOdLYnsQ54=;
 b=mWcZ3aHB+ZWJCLKJi1yBh2b5zPOvbBR0PLKlG0p9MMv95rYj3DTNXE81k9QcV1iinS
 3vqRSGa4ymRL/59zmHeI+YAm0BAop3S3oWD4Gd8UG/RrK0GE6gzk5f9vkVEvp0vVvZFG
 cgjl2yPeXFxFSMwhyDKYwweEaXvVCdIzXDjMNEIDQJ+cZbRNaJwA/Odl4wAzUwSa1NkM
 HaGI6xRMLmm6cQ4iUp3tBkjyKVOsFpLH88onGnOYNFab0UlV3XezIsco9s4KafBzlRRm
 L50+iJfs6Cxo4V9UHYHoiUQualbrjadSGSlPXq9K8ARqHl1IMtzkMt6fL/HO8mgyL9UH
 DIBw==
X-Forwarded-Encrypted: i=1;
 AL+hErEVPA7wKpPPVrMDGxsN5Q/51r4/e2XVqIqfz0oOQbcA8ZfyGtyjWe/Suwf+1gRaHkPPKlf7cVdgzQ==@nongnu.org
X-Gm-Message-State: APuU4Z9jznRhJa3kFsnnN/dpge9Tv+hjzxJx70+0mU6uyWzMhVfFctqu
 xRPIEquGMtey400gH3kG6xqS0Nosj6J2L7psGeZ/ov/l+ch4nQo+6jejAeXs7DXbW0JHcdChfk9
 ml6cLcvBcCmL2dWIh3RrK+Am6rJXhpHtWQFTLEZ9gKjcOqLatXD2WZcM=
X-Gm-Gg: AYBFou1OlOg2qoDscTDkkv7Ik7MTq4L8ElMkY0kus5m9IaXQvAx6TqEZxnv1ji4cEay
 T3SXtooDlSQR1gkJV5ja1Gf7GcSqyWVDUiaT1WXAgh1c9XZ9gxUjt8emXkUwH73dj5iH5eFwLfs
 oRVfOGJeGHK/YqM17SLxbVeF+0o9pqPCUqd020pVcZaTrC6Y1BWvpFNwewIQ4RD/zXTJNBc9Itb
 +JTqNSFphaCyzKj4MNwE3vKBawdV/Ml8fW7G6vunSjVJF8AKhurFNhQiBtblxV7m+Q0OT5AmhRn
 YjjzgKhrihFTJLUH1nTNom9HpHwkO78d6YrOCnyFzIHa0sJV8gx/wOJJxg0huxk3SpgJh+kxJ6b
 DwbhfG3NmPhxpS6vMljtGWO6pLXwHma8ro28bdRDzJk5r5eOpXNohBWwX5mNGGBtY9RlvWgp5wK
 6yWkPMv38=
X-Received: by 2002:a05:620a:4514:b0:949:7502:69f with SMTP id
 af79cd13be357-949750208d7mr535711385a.78.1794819206544; 
 Mon, 16 Nov 2026 00:53:26 -0800 (PST)
X-Received: by 2002:a05:620a:4514:b0:949:7502:69f with SMTP id
 af79cd13be357-949750208d7mr535679485a.78.1794819196826; 
 Mon, 16 Nov 2026 00:53:16 -0800 (PST)
Received: from [192.168.69.234] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f5972a7sm19895896f8f.21.2026.11.16.00.53.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 00:53:16 -0800 (PST)
Message-ID: <ccfcea11-ada8-4753-a71f-f59ed1bcb067@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 09:53:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-12.0 v2 00/12] linux-user/aarch64: Support both
 endianness at runtime
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 devel@lists.libvirt.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org
References: <20261112180859.85380-1-philmd@oss.qualcomm.com>
 <9b64d3d9-736d-4878-80d7-4caa75eee778@linaro.org>
 <CAFEAcA8La+8TqFY0yCxRsXY2Ad9MA5Uu-sVEbysExZPkUXVawg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CAFEAcA8La+8TqFY0yCxRsXY2Ad9MA5Uu-sVEbysExZPkUXVawg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNSBTYWx0ZWRfX2FYLYdR7ljOh
 j8MjNS6BNBB+HDxhYEluj2ZgO2lgRtQIS4+ERo5gjSjk6q79hfWfTQQooRdQpT60R90kSTxFyY9
 puMALctlPJbCYTWoTS/G++IP5LuxTI1WP7Wk8v/kcBc53tAJTScah/GGGJrRG05ozCqsw8KBOQe
 BDZIrULYL3kDWfxVAg/jx3pLaboU8qLNg9DRLMT4Kb493/vlFTVrAeHaeXuStyjLXNR8K/31tT2
 1zZUSsZd8/99swN+GFT2lB2Db3XvgX24Z0qEpl2N0WTvwVAhXzSaZh19gbF1ukYCnQHsGX4gHAH
 xs8Nagv4j38VCZwXcbbGChK17akI52LJguiE/L3OIw6Kq3LGIaQ0Jk/3FW52e5uMKWM5uo+dUxD
 rFjq5FvmRa1wMBVGwrFM4ZPA92QgRnL9SLbvNiMQT6X/WE7d3J4IroiYDrgWPBWuhr5ZSwDLi+y
 5zmwHnjbWqXNztOwLLw==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6afac487 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=hA93whgwREZ5Va0HPSoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: UralGqbASiCOyTsElMe0q5DucSSylHUK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNSBTYWx0ZWRfX/BYwtGWlS0Jn
 OMa7YspFrvI6uEIN/r30muHEeNM/266fabYtbIn2aAiu/+PfhGLXkPH+GtbjzGkAs2eyYMS9mrL
 nqKxBnKZ0b7xh4yumap2LShEflMRKec=
X-Proofpoint-ORIG-GUID: UralGqbASiCOyTsElMe0q5DucSSylHUK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160035
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

On 13/11/26 19:55, Peter Maydell wrote:
> On Fri, 13 Nov 2026 at 18:39, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 11/12/26 11:08, Philippe Mathieu-Daudé wrote:
>>> Since v1:
>>> - add ./configure error msg
>>> - cover ARM32
>>>
>>> This series lets qemu-aarch64 run both little- and big-endian
>>> ELF binaries, retaining qemu-aarch64_be as a compatibility alias.
>>
>> Why would we want to do this?  qemu-aarch64_be exists, but is
>> essentially unused.  It's certainly not supported by upstream Linux.
> 
> I know the kernel just dropped big-endian kernel support
> recently, but did that also extend to userspace ?
> 
> (We should check with the kernel and gcc folks about
> whether/when it makes sense to deprecate qemu-aarch64_be.)
> 
>> Having runtime selection of endianness seems silly within that context.
> 
> As a more general question, is this something we would want
> for architectures where both endiannesses are relevant (e.g.
> mips, ppc64)? At the moment we consistently for all targets
> handle big vs little endian as "it's a separate target with
> its own executable". That's convenient because you can at
> compile time hardwire in things like variations in struct
> layout between the two. We could switch to doing that kind
> of thing at runtime, but what is the benefit we're aiming
> for by doing that?

I did the other conversions (Microblaze, Xtensa, PPC, MIPS, SH4)
and wanted to test the water first where this would get more attention,
with the series involving less changes.

My motivation is MIPS where we currently have 6 binaries and I'd like
to add binaries to cover more ABIs without having a combinatory
explosion and have 18 linux-user MIPS binaries. With this approach I
reduced the current MIPS set to 3 binaries and add 2 more, ending with
5 covering more ABIs instead of currently 6.

In order to get there I need the few core changes introduced in this
series, which affect all user binaries. I have the idea ARM users are
the first ones interested by no performance change thus is where
I started the benchmark to prove this approach have no impact in emulation.

The TargetInfo structure change (one initializer LTO-protected and
all accessors via read-only exposed structure) is also what Richard
was very keen to have (page size support planned) instead of the
current approach.

I'm thus returning the question as: why would we not want to do this?

Regards,

Phil.


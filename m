Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74221C5DF7E
	for <qemu-arm@archiver.kernel.org>; Tue, 18 Aug 2026 13:08:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wwJXf-0006c3-2G; Tue, 18 Aug 2026 09:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wwJXd-0006bM-Uy
 for qemu-arm@nongnu.org; Tue, 18 Aug 2026 09:07:45 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wwJXb-0004Cj-77
 for qemu-arm@nongnu.org; Tue, 18 Aug 2026 09:07:45 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67IBgIEk1196529
 for <qemu-arm@nongnu.org>; Tue, 18 Aug 2026 13:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OgOEJl8eizJEofXwS5JCE1z8JiDMTg4lwZsWuuP6CPs=; b=STgY3bJUZrtEymNY
 kULfTXP9APDUiG5dbN+Rhtj7fr93q20/q0nRlienxZuLlRZPWcnmFpIAkD6zAwhN
 mGyI1IH39JCmcZcOWJ89MtMhfXUJMuYWxGPxTBIkrv5cI0GoJU9J4+xdlEcP15MG
 p+/kXH+uyDZZZTXNhfgCSrdvYmt1tLBdeyhfb4fvedNSvs/tiQ6VAD4ihTKdE4LD
 SoOKkHUoE8gzKjP26D1BpkEhw57XKBkNiymEG3oqF5FrcRw1iXZ0pRICZuxs731t
 XMbrbG8YyFkPF4a4EkQVFWD4D0z9jZ8CQLcWn6YfBhXF/vxSBaF/iFUe5tEncGhs
 aghuUg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4prn0a3g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 18 Aug 2026 13:07:40 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-97bf904c086so641583241.1
 for <qemu-arm@nongnu.org>; Tue, 18 Aug 2026 06:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787058459; x=1787663259; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=OgOEJl8eizJEofXwS5JCE1z8JiDMTg4lwZsWuuP6CPs=;
 b=dcm9BPq3tRF0B5B17/ro4VX9E1dq5aDnquCjsYSNX6y2KY6GJvpFwa+K67qXydu/17
 n8DwImbXNZtLFAr/LcF3Re8i9vQ2HeK8OwCzBh13oUzcWcaCLUdixPoerx0q7IqF4qP0
 pF2t6UuI0FJ/EIv79bxg1Tf52KlEwamAKq0MHKH5Wn0zG722tjdq/jfUmkk2uCSFL8Q2
 YqLTri/Or59qisNcCXfFf8FXTpPuiHDjGYuTfg1Ii59caqt4tsN4q+EpqkoB5rIOxPdH
 UEgceojxwQq3kD7JyPkdFO3GmhMnPMcxPfZP8NbmC76Gx5LUe++M+CEZgPFgb+XSaoAY
 F8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787058459; x=1787663259;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OgOEJl8eizJEofXwS5JCE1z8JiDMTg4lwZsWuuP6CPs=;
 b=XJi+2YFxrFz9vrg8QORiPULQ/5YcesfDOWPb1Wyqv5c8nw3dVVjrcC1AnPjarhTUJO
 pmDH+KNIKtVLxOi+29nVy61XRM2Hpk/lsa7OwyTPgV0GQHRwPJPROwpo5sJvHZ82bBux
 Kb7H2+5hLXCoguUfAnUcNQ+a6gw88uclN84vouI2bEjJXbEdl0nMsye0YiIIVgKtASm7
 Wf4YmdeeLyfl9U/mOgJWmDU93cSWLGKoR6tgQFt+W63Ulpy4hoyNxs6eSSg9IZMq3iuo
 BgU2/XK6hXhvZE31LYBxLEqUHqty6G+nkZgPAgrFHstgdTeJ1yMSLaW/atFp3SQ5pMhD
 hlcw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrfPHBJ5ZXnLtFS9ICp/YKBsnir0gjYI0+eznzGL1SvUHMxstVCtI2NZFYwN+l1LEDhBOuFjIbTug==@nongnu.org
X-Gm-Message-State: AOJu0YxaCdxJ/cDZZyAYB7OAQnA9//cbYlzISueBF8gT6mN41wTKLpHK
 5caO2oBF7i67t7xC4NxtyZ0jEMjBxJEQLijaGZGor0O4Ebw4l+03Rs6vaL4lKaUeqhvhQP/Q8k0
 TSc5xDplNobjIk6e+342cWRVYNUT248o3c4mki9wwWzn5bgv60iMY39AzyaPrC7kR9A==
X-Gm-Gg: AR+sD12YAVLQcP9fv9FqG+5rhlJRdXMPj9yJjvVtAn4dJ+pr3lb/SpItT8JexbNjP77
 8e3TpE5LiQn2x8HL9YwWyXr2zq/DY+utt7e0dgYsVX4HV8hKm/3hsyDNSwKJLYq92f26lNRvSOJ
 qne5n5YwWerY4iJGBKZE//to28BzwRlZfGrOKVVsYlmVrO1rMaOQiqVxKSnvGfO6xzuE3Ev/ab9
 bgg8lHslOqcUhEBKP8vwvfVTGKvBMaAQcbCSiKI+aJ8/rnYis7Cm7GDD8NNGU6IG9UZ5/+hE7Iq
 YZSKX+8lJ08dhlVzwqZTAgs/j/uPw0gpKwTaXLXLRi21vmVCpTVNzKooydPOU0HGhYVeBX2uB9D
 vZ3vfzC8MBHVOri4NEa24UX3KrhErXrhZP0A=
X-Received: by 2002:a05:6102:3fa8:b0:76d:154:7f42 with SMTP id
 ada2fe7eead31-76f2b2fa5dfmr5922212137.5.1787058459580; 
 Tue, 18 Aug 2026 06:07:39 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa8:b0:76d:154:7f42 with SMTP id
 ada2fe7eead31-76f2b2fa5dfmr5922177137.5.1787058459089; 
 Tue, 18 Aug 2026 06:07:39 -0700 (PDT)
Received: from [192.168.69.231] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49987b203cfsm296961215e9.3.2026.08.18.06.07.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 06:07:38 -0700 (PDT)
Message-ID: <b268acef-e255-4c13-8db8-09f2974e7218@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 15:07:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] accel/kvm: Consistently return CPU halt state from
 process_async_events
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, Alexander Graf
 <agraf@csgraf.de>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Magnus Kulke <magnuskulke@linux.microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
 <20260813181640.6537-12-philmd@oss.qualcomm.com>
 <55cc8357-daeb-4315-9f3a-8be7a59c355b@redhat.com>
 <3ec603ff-65bb-440b-8ed8-72ae4e6c5a41@oss.qualcomm.com>
 <CABgObfaDAhrpnVqQaKgG6uxPQe1YDu77YOsUEx9nqrN=3M2cGw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CABgObfaDAhrpnVqQaKgG6uxPQe1YDu77YOsUEx9nqrN=3M2cGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5NyBTYWx0ZWRfX6pM5VWEJ65xm
 b7yGuIOWjb8t2EUtKuJI9AI8id82HJvux32DO2TLczbfURDiCyLxJSkWk+BgU5sVXxJ9hq4AUnJ
 ZN65TV6ydqkiz9g6M5X/Iq0HV0iW+bw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5NyBTYWx0ZWRfXwIXwNDL8shmU
 UJoZOgeMIPVUoPeacp2Xvq5nTFcca9OIVvlcnvF7O/fOgpnqAVEYQ4ZztFhmFQg1QeARnlmPWsh
 FqbdRD0L7QrtbZPZ/pvS3NpHO8bdFLYbj1BxA46VwgWjSojBV64XVTYZSq1dmE++SeFL708pwBo
 3YZiqukeUPCFPho+bTo2hu3dS8iSQA10tmGWpf132BTSyYIaqYKvaw/Jay4NTQdoeVSvwMiuJf5
 bCPwxefPMgscDMwUhLplkrEEtkVTd2pH1yBv+adH20r01D5T/aE+ZdrlFJt+0H5//2ZA+AAtOlI
 WTFnfKdhMEXlOmcta1LZpRERQzRBN8YV5ctZxs9CzWEWZpGYsSQSx5CHI593SlecMBtAcVGvMmy
 1eW0D76LPK7AcDhatQ63sLTy7W0Zd8S+C00VP6SjtZoMj909TCj5MxpCvdegX/WD8GCLrctAaL0
 LuP9ANoV8UO1+AqoKXg==
X-Proofpoint-ORIG-GUID: n4TtXVmwkBdjL3Rqk7GWQlDIZoY3UklY
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=6a84591c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=KFLP8JxMXue_9hLRhRUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: n4TtXVmwkBdjL3Rqk7GWQlDIZoY3UklY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180097
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 18/8/26 12:30, Paolo Bonzini wrote:
> On Tue, Aug 18, 2026 at 11:24 AM Philippe Mathieu-Daudé
> <philmd@oss.qualcomm.com> wrote:
>>> Your patch is correct because, even if cpu_thread_is_idle() sees cpu-
>>>   >halted == false, the flag could become true during
>>> process_queued_cpu_work() because it releases the BQL.
>>>
>>> However, I think the better fix is to remove the return code, and check
>>> cpu->halted in kvm_cpu_exec().
>>
>> Looking at it, even better would be to move *process_async_events()
>> from inner loop to outer loop for all accelerators. For HW accels it
>> seems quite trivial; for TCG I need to figure if it is safe to call
>> icount_prepare_for_run() with the BQL taken, due to the replay_mutex
>> uses -- here the win is cpu_handle_halt() ends restricted to system
>> and we can remove the odd EXCP_HLT handling in user emulation.
> 
> Makes sense, but probably it would be a series of its own. :)

Good, right.

(FYI the motivation behind these cleanups and documentation is to
get hybrid-acceleration, so a consistent vcpu_thread_routine between
accelerators:
https://lore.kernel.org/qemu-devel/20250620172751.94231-10-philmd@linaro.org/)


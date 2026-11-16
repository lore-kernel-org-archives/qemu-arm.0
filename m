Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD762606A322
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Nov 2026 21:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l4pBNdA6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JNBcP5Rk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xT4Pd-00017X-9C; Mon, 16 Nov 2026 16:38:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xT4PZ-00014L-Go
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 16:38:51 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xT4PW-0005if-UG
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 16:38:49 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AGJfFQd3504918
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 21:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TRcK94MSgV4h08vJgaqISlYG4TNoJWnA7+QKeK8QBS8=; b=l4pBNdA6WtOShDbe
 3N1X0dVR3uonoMYe7zQdFU0lIAohEiz4cHYlyfMnHeZrDeUMEeURFetYM8iagD+c
 3xQSQYM0ob/t6CUrskZ6Q7vglhuWK7yCRWRZ6nLV4SVqAUslD123HAHfrqRcctbQ
 nypXjsyCNPDZqwWi8KKmfwIqtb/Ifl5UmSmX89r2YKZ8BpxI3F+SItssmraZJUKd
 4Uz8kSfB4hG5NERwJINUchrei+T9ktEQg/GxD8JtFb2r6bTerNAn89Whlzmm4fDs
 6DCXRYQnrwF8Xm4AWzENSA/c8S0BaPbxngHDyTlJTncFJ8m9W0rfB63kiideMy76
 +GfEOA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j038m9t5b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 21:38:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-934963b2bc0so774548885a.3
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 13:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794865124; x=1795469924; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=TRcK94MSgV4h08vJgaqISlYG4TNoJWnA7+QKeK8QBS8=;
 b=JNBcP5RkcIqvQqCnpVoJJp5rAUbjaEqXJ+veOaWfCjeB5YaX8oSr1VBB9XcsA+9V/6
 MCjXZPRB62vmz0Wf5epbbSXk5rD/ExdOTbvYDcRh8eIjLc6GFbZvC+toC0Oue538MqOD
 8pAPGn+ZcuNPZApvog7sN7bh0hTHp9LVBsYy3k5KUPnbCtF9PJgFtjWa6XBNycPLeDqK
 HEbzZjSsOxQdWXh7TD+r0YE63erEpnMqQixV0sTLR3+QE+SL6nnJ+0q0JjMyXTRYP+IK
 ScY4+1VgEsS23NxDynTEC4xh2Hswb8UUEo9HRtD1Vka98bUmA2hRRJtr3fAksoH8LldE
 JCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794865124; x=1795469924;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TRcK94MSgV4h08vJgaqISlYG4TNoJWnA7+QKeK8QBS8=;
 b=1qKKr5yk8JAaX6OslM2bj0AancKcq5ekLlvtBRa/TxagwYTzTdL5O7dknvEx1AHbv/
 9nwm1aexN2LKEUZRIv3AL9T6Ow0GVnmRX8/LuS9Vihsn94U8Ts7zyqtXDmzqxrxv0g0x
 nzwO4WP1mldKpoQA4VYIo8ZC2U1VZPKitv2cfp5bittXH4q/dUQYkUntrVpNaUj9yB4L
 GIG0aQlIXTMY6qbMjc1hd5Em3ywERroTR9cqOXf72z1C+J+t60tmw/omcI0a00QBXLWK
 IymsF2MVxz0C/Bqkr2J6BTY+MdaGjximTdEAG+D75cwlONTvqS39IGLabjjd/ecd9xbO
 aOcA==
X-Forwarded-Encrypted: i=1;
 AL+hErEhW4SWt2+YSRtgriw0OuPf5PffdxyDgCOdQ9ouPRQ+AQrVo8dkxIUk3Vl+mIbr2R9b8vFS/9F0DQ==@nongnu.org
X-Gm-Message-State: APuU4Z/nl2qxWefSo1OnT070mhy21CBZnW7CqkVGn/5DKj63JMDHiNp7
 mkLa5o+IU1JQl8pVH+SOtekAVq15yzTm5TRDNTfEu/+BuZtIODKq+WVu1kiuVuZS0+xL8M0bBNC
 uehw7ez5Fwu/AMFAcEy2j/B7WjSXNCnBMrBoJDl8oQgyY8adzVPBkuLo=
X-Gm-Gg: AYBFou0fnWpEfw6LEUByfr9kejBDBH9R3iiQ86mYGgJx4noR6RY9IFBanTjk4iEpbdy
 sn1KSyfU7GOa6wbgWImBm82WbUj7AWlRym9ygSxkLR2eGJ5I/8b55Zux7D+TbjuAqiFw/xj9U4b
 fdOTtSdmMOuALvbcYz0tzqh7pKBa7mBfXaVDJVXTQrHif98q+QOU6ESzFzQhDE5Ea6C969iuMJ0
 tShA4CuFGrLEc5DDshvoM+24XCoRfYr0dhZs0E+2Ci2ii9Vqt0bvdQSTUiFQeF5Ax557HVLACoq
 sI+ElQmm5Us5Wj8NIU8vaWR5zXaV4xzqV+YljdEjTJwu4qA9ivQUO6ZOU9ntGO81GssWvv7PP0O
 +aY2fzPUHC3/wD+0vd/RI1xpWlbjUThsCdfcLFUTHzHRm6AIqjwcHEVfzj1qPWDlAcw5YCKTXB2
 wZNM4V66o=
X-Received: by 2002:a05:620a:a78f:b0:949:6775:4713 with SMTP id
 af79cd13be357-94967754e97mr819396485a.2.1794865123756; 
 Mon, 16 Nov 2026 13:38:43 -0800 (PST)
X-Received: by 2002:a05:620a:a78f:b0:949:6775:4713 with SMTP id
 af79cd13be357-94967754e97mr819393785a.2.1794865123167; 
 Mon, 16 Nov 2026 13:38:43 -0800 (PST)
Received: from [192.168.69.234] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c8d286480sm43358161f8f.7.2026.11.16.13.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 13:38:42 -0800 (PST)
Message-ID: <97118f0f-40d1-4a44-8080-d6df1bbb60e5@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 22:38:40 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] tcg/riscv64: Fix logical vector immediate matching
 and emission
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, qemu-arm@nongnu.org, qemu-stable@nongnu.org
References: <20261028143330.6518-1-philmd@oss.qualcomm.com>
 <20261028143330.6518-6-philmd@oss.qualcomm.com>
 <auOReLXT3EK7ITyf@aurel32.net>
 <8beb743f-41f0-4275-8baa-38e34e872f08@oss.qualcomm.com>
In-Reply-To: <8beb743f-41f0-4275-8baa-38e34e872f08@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4NiBTYWx0ZWRfXzwSblJpcP1kv
 er78KRgtImHi0GmtXEWXBNoDXJEjF19mhGRwz4wfG+DK843qaisfhc3bojcdxjkHloU0JPR5mih
 Fu2ckqvm2fBDKX7t96TZfZNOn32VOAjpEX2v1vDWfhmX+U7zZ4Mbbix7Zm682YTn5dpdebUApua
 6C5XXAMk8f8BKFs3fw0DIYeRYX50QfV7HvOQ+NZ+ANwF6ZzDVYNjfqAdOSaGiXLVx+f1s/XSzeT
 FWmjhY3Z1/PvmA5r2d2cTYj36Th1ChJ+XpaTY8XGe+H7YGbig8GJV3J1x/6hrmXkBLrM9efFR5d
 NU7UCSjcLzuZHejnd/y9EVUgnA//l+7wjGWNGnkEfoPkgnmcFyY6VE+wA//9duKQHJBufysLxYR
 gERsVshe3+Iwt/g8dFUmcguK9fY5pn+acsImJhLGJURM4r8RKo7Larpkm55sWxmVR11Q+cq7Rm2
 2+nECw9u/Shc1ADERmw==
X-Authority-Analysis: v=2.4 cv=TckDJhQh c=1 sm=1 tr=0 ts=6afb77e4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=hXZgYZo4AAAA:8 a=U_ULVM1sZVwQ37B4evIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=37BJPeUnzxYkbV1yBC-1:22
X-Proofpoint-ORIG-GUID: gtEYMvxuxHsvWX5hD_ihLRIClsRkPNHQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4NiBTYWx0ZWRfX6CqU8QOG/A/+
 1s0SbtbiPC15jnuOu2rZIY8P36j0rbJr6I844vhc0A8QGNzXdAPSd6fckenZTXYx5QTyggG0xpR
 /UUfZfgdehy3LRpe8UMNpfdsCIWTDJc=
X-Proofpoint-GUID: gtEYMvxuxHsvWX5hD_ihLRIClsRkPNHQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160086
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 30/10/26 09:08, Philippe Mathieu-DaudÃ© wrote:
> On 29/10/26 19:33, Aurelien Jarno wrote:
>> On 2026-10-28 15:33, Philippe Mathieu-Daudé wrote:
>>> and/or/xor_vec always have VECE 0, yet their constant was matched
>>> as a byte element and applied at the stale SEW of the previous op:
>>> "bic v4.8h, #0xf0" became "vand.vi ..., 15".
>>>
>>> Add the 'N' constraint: use the smallest element size at which the
>>> constant replicates, if that element fits simm5, and switch SEW to
>>> it. A wider element can't fit when the smallest doesn't: its upper
>>> half repeats the smaller element, which would then be 0 or -1.


>> I am still wondering why not propagating VECE for logical ops at the TCG
>> level, instead of recomputing it at the TCG target level. But this is
>> how TCG is currently designed,
> 
> AND/OR/XOR are bitwise, so VECE doesn't matter to the generic layer.
> Indeed propagating it would be a separate tcg-op change.

Reworded in order to clarify:

   and/or/xor_vec are bitwise, so the generic layer doesn't track a
   meaningful VECE for them (it is always 0). The backend nevertheless
   matched the constant as a byte element, and emitted the .vi form at
   whatever SEW the previous op left behind:
   "bic v4.8h, #0xf0" became "vand.vi ..., 15".

   Add the 'N' constraint: find the smallest element size at which the
   constant replicates; the constant matches if that element fits simm5.
   The emitter then sets SEW to that size. A wider element can't fit
   when the smallest doesn't: its upper half repeats the smaller
   element, which would then be 0 or -1.

> 
>> so:
>>
>> Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
>>
> 
> Thanks!
> 
> 



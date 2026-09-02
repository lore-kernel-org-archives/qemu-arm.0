Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E48C624D4
	for <qemu-arm@archiver.kernel.org>; Wed,  2 Sep 2026 19:53:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1r0v-0006U2-2w; Wed, 02 Sep 2026 15:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x1r0k-0006Q2-Sq
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 15:52:43 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x1r0h-0007Ue-HJ
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 15:52:42 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 682Hr6Ms1650757
 for <qemu-arm@nongnu.org>; Wed, 2 Sep 2026 19:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 o9lf+tLTFMt2mBgZsTQ5i9dk7TIdp2RTwx0PI03Puvk=; b=Tapz965ySgCllyjw
 Eop52McWbL92n080PJ+VPQu6Jpdht5AErQYqlBH/oOBfiRWWSuWqAdjVDdl0+Rqp
 x9d2cuxSX3S4/zYg3De0x9Qr0OCeu0G4TYgmTCzFmofEuhx/gpCzDD7qQYrTZw6B
 O2AtEBNDPuksr348lgVSKD+Z7J4x6X6Rdpt9QsGCa9kn7QQHrMnW5gAWPsLle0iI
 cS+2PIzHMX9Ub4aB1jCSZS/3BzqB1TsKcaAMPHvwTmOWdDSN30HWzhU7MOL/Zyxx
 vNas4EITLiAW5oCNtyLoKkLyuWLSYsAvuGuIkIfzqBLyrNIOqH2AWVeZYpTxOHDM
 dAymAA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4sp11-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2026 19:52:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-cc1c1cc5206so1787800a12.3
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2026 12:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788378754; x=1788983554; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=o9lf+tLTFMt2mBgZsTQ5i9dk7TIdp2RTwx0PI03Puvk=;
 b=h0YeQI5ekvSlhKROsDPgIfZul+bvrC2Un4uYm2siDeffe83h1e27jzFx/rgIXGLSGh
 jEzM+srulAwKL/EG+5oMxR6QfnOwh1AMf8jNtBhOZViF6BOfatT0IDzY4I0hiAplC4Vr
 SqhIsfsSA+QJH0XDb2FLZP+8t7KAeIYfhwg/GXm5OScuwOxRvNi1XBTqIZ2Ih68APXt8
 3RBqpqbDWm3gBznKfsiYdM827C4ZQuaVnd8CjVvc8jsYtn+uKFrFJ5DnWtm0bR03SPD7
 2zRuQ3ToCnAxnXbw8NHwCzoDk2HbC8q0lWwdhzD9u3awgOhO3I77+BmcdyBfZFsNC7TJ
 8GbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788378754; x=1788983554;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=o9lf+tLTFMt2mBgZsTQ5i9dk7TIdp2RTwx0PI03Puvk=;
 b=sitaEqUwW93rXvFQ24aw3hHfDpkaV+bcMqsta02IFIUCT4iV3PQXfk8hRsQ4i1i1UI
 SS6fYKw5VWtBURkqrqfdugmF9ZoLZV3qVK89oM+H3MW0P2PpD6Cqw0I/pKgELT67DfAL
 qCOAhxKGOf21wR4baiQK2NAdRVeeGU2BfMia6VudRFGT40R0Y1yDtXECBq9qHDwgws5p
 7vExGkYTkraUou13iH4+epCZ2j3z169iX3vqoxrqz/Nom0maKA7JveU7Bt5zjbC72hcr
 CjSwtz/gcCJjGdFm3ortRJglE3h49waaTxZTHh/G2m3bN282t+l8kjFY3U/7E7Rdkdjg
 ueqw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzb5fnD7kZ1v4OKiIcYdxayBoxPyeK2brTUraytHCEMAiADHQ05Egtn1QI+vOXl5O3OWF/Pzn82wQ==@nongnu.org
X-Gm-Message-State: AFuF++lucjYK/RJOoxGQnZ4+ano9pPfyKkkO2jVLPmvvbgYBSyfYe/UP
 xaTaYiOjV8SQORgpqjREymRkW8ynpbc0uxqSSlyiysgkb4fu6Bl0TDux1xWzkzR7Tla599Wpacd
 tKtVaaA6bfbQMs88zO1770NzWm/I2OF+I0Qn/228HoyV8BqqDmNpwmTo=
X-Gm-Gg: AYBFou3U6a6VbbznGHiia8bwzv8U6Dv443g0TBOvILqF9KD/pwT2O6iIuZ74vzVucyC
 n47arGtnyF34KVciiGyeOsk90Y3h89b8HI6ur+sTRey09F4yMsw90ftrLI/e0YFjY2akkw6vSxP
 6JeuuGAPKljF97rsjI+ZbM65gDLap8nAPpOjSSg2hFIbKHKBqcMX7LOAPVMGNJm7Iw3kMTtbnx/
 pzkvG09Z+YN17YCeUlI231qABGqTZm54BOe7B6EPYlcPQsvu1aFenI+wIUu6GfqWbuOlkkRZJHE
 9wC0PoyV1KLODcKbhb1MaAYVeSdooVTSQnDUyKFt4jdSEkoUnWj4U5Hzu9KNgRjnwkca65VZQhT
 5kRV2RL1y3X8sng5H7JMZzIatpdLgOeGijiDjEFp4lh7dPfvNwbxx8t3XyMaDOaEQe2Lj
X-Received: by 2002:a05:6a20:728c:b0:3d9:3626:1326 with SMTP id
 adf61e73a8af0-3d9ac3312dcmr11068113637.2.1788378753673; 
 Wed, 02 Sep 2026 12:52:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:728c:b0:3d9:3626:1326 with SMTP id
 adf61e73a8af0-3d9ac3312dcmr11068042637.2.1788378753256; 
 Wed, 02 Sep 2026 12:52:33 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33256416966sm307194eec.23.2026.09.02.12.52.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 12:52:32 -0700 (PDT)
Message-ID: <cc7bbe77-6257-49e1-a8b6-eb2c3f24f241@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:52:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/11] target/arm: Call arm*_cpu_do_interrupt directly
 instead of via TCGCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-2-philmd@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260902152044.31291-2-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NiBTYWx0ZWRfX8Ynw+pg5qxWd
 IDWKKZk+UJ31mOfM1Dtbjlk/FuTSaLICddTBSLsK+y6B8RRxKDvS7pUxOXB9TZYE9uX75NeceOm
 3zxdT8az0zJAJXiakiR6H+aYA/aW8R57GtcrD5k+m9LrM8dojGGf43o/rdwk6XmpHYsZIAQ3s+U
 Ut81q1nzEYShbSCF9egZ5sXFLdswwfYPiebRUjUJP0gaPFVg7ZPgkl5UCwChkQ2IqdM7yNAbXVU
 v9eA+iXr2W5hC2pXCDJUfq4vAO7Y032t6QEHlp8fmHB+rqIRtnzXPcdoMhgYV2qK7HYQh+Ns/sR
 2twp/kxSd4QZHfX7zpOTTKvXBfgQz0usm7CzdUiOSvLFI4PV+MB3i/ytd58DI7kRrOlONSBKmeo
 yfdeqR9TlL5cqGzME0vOBci89LaJ5fUPfcMe/CV3D8gWKa3xThfwZ1Y2sDkmU6Bc2EoJDl4nqdX
 tMORQKzROeAWRsbW9tQ==
X-Proofpoint-ORIG-GUID: xJJFyC3Pz5UY5jkrJF_e1TxVRz1rOHft
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a987e82 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=uK_-vC1rlBskaMxWXFYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xJJFyC3Pz5UY5jkrJF_e1TxVRz1rOHft
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NiBTYWx0ZWRfX1oo7Ez79RB0H
 gkgUXJmmk3htCFZr5D5ZGZwq+YkVsF/xQPolEPTZEPtk/uGjhFBGDIMc+B8TnQEP1F4hiW4x1uw
 PLmAOYJeuZDsuK/LKfvDu0C/vVCrmVQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020176
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

On 9/2/2026 8:20 AM, Philippe Mathieu-Daudé wrote:
> The TCGCPUOps.do_interrupt handler is a target-specific
> callback installed for use by target-agnostic TCG core methods.
> Target-specific code should not dispatch through this indirection;
> call the ARM implementation directly instead.
> 
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>  target/arm/cpu-irq.c     | 2 +-
>  target/arm/tcg/cpu-v7m.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>


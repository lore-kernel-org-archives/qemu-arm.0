Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7274CC5DF67
	for <qemu-arm@archiver.kernel.org>; Tue, 18 Aug 2026 05:44:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wwCbs-0004m6-Pp; Tue, 18 Aug 2026 01:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wwCbr-0004lV-F2
 for qemu-arm@nongnu.org; Tue, 18 Aug 2026 01:43:39 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wwCbq-0002rG-0Q
 for qemu-arm@nongnu.org; Tue, 18 Aug 2026 01:43:39 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67I3FucF3833539
 for <qemu-arm@nongnu.org>; Tue, 18 Aug 2026 05:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TttcRSLZk+O3OIsj9rr4FBxM32n0SMvVk+0cYAoJbNk=; b=YfWxjHURQ7mXZRyl
 vdTS/kSqjVzl0BXZKitHOzHJVcSGeKYxniZMuF4W3SfVhLNKieyfiXiTM5f1D/WS
 PGsb2Id5M9RyIZnehJ4+9NLmaY3BWfZdcDIVnOh2zC1y4g40SCMr/YRIoHt/ceTM
 thMl6lYWY6/sTFazOzJQcdKhb3AM9Ab3y6KyMgDrgzMVapchh91bNqbHNj9Svjwf
 GvGgHr8e2qtPo06mhFo+631OHheO4af/8DHVc5osktQqk5Q6leGaDIQcSE/zLjAM
 hfqK0ynBV8mcCQhkM+wEltaga6vqpARv0BliVswVK6LRVGhfQDTmtOxJcXSXLLha
 l6DNcg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fba8jxc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 18 Aug 2026 05:43:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92efd2ca21aso726112985a.0
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 22:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787031815; x=1787636615; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=TttcRSLZk+O3OIsj9rr4FBxM32n0SMvVk+0cYAoJbNk=;
 b=auxVYlaBVaFnFWHjcG1DcG1x2GhEsn7RTqXtXSp1IHlizEBEdsW2VAB+Tps2ZNiqGV
 8g6v7iOR6Ar3xiiICzWKon5o8uz0dSkVV4sVXk6LAFouIUsUBRGlklypaiPB+ODLeYCu
 MBpZQ79Qp17LWvhWbIOPxkquPbDZaAB6H4oVvc61gLfgCN9bsjLwhS7bAu+lCYnMRhVl
 NENm8LdhHQSiYEn0gqUtC2PIhQ7DYD1QU4WLQD/rSCLyeD9d7ZhneF2hNX5pp52ddiwr
 o5mCwiAg4SaaxRnty9d2rQeUeqPANrJfQLZVHd/IwR4yNPXrAa6kV2khQmGQJzfbzXkx
 uIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787031815; x=1787636615;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TttcRSLZk+O3OIsj9rr4FBxM32n0SMvVk+0cYAoJbNk=;
 b=CCgp8z6Z6+WU+hzrUCXWq1zHM0TQStz6vGTnmIVJRMazo4SehkUd6Rf8Z6IQ40Y6Kr
 0XSqZxihnjmNffZmMTjBlL3HUHen057IKtzTpeUEmm/ZKlCC2GF6mLjiw6Wws8JjrGU1
 1jjUhwSSRQ09v8Ym7C0NG01F4muMAEUp2C30lQ3nCbTzP0zX0KcakDZs/qbA3GKZTPIO
 KtpRa2ASOvSYEIytMDj8WBDPADmVpXAk3zne4FBNhmx3N1hFIy/T9GEmPVnwxZfy2K7r
 NOhAl9kEcs3RC5CtkcbB9VumO37eN5BQR/1PfQqxRpT1kYMuN3+s01D0w4+U/6M2dOKx
 oglw==
X-Gm-Message-State: AOJu0YycWGdMWmU9gmIFjqfqx0tQ7dfbpzNIXkE8d3HN81J58AnImjwG
 3oPOlYJIrDImtavWB8AtIkMbePoxlDmqvCKd2TNcaQGzBoG5TtV/LqmsfBUl3aUMa+8G4LFSFso
 MvDC2iQc0nRmEPAXXgy0tQV+d6URxxcbGE52wMveG3rhhYl6w2C5+0cg=
X-Gm-Gg: AR+sD11j1EEi1MbOm0aScYWbJiXuTglcPPimSkXuw+TZwCMT5wuPOkQIqxoVwPUJNXu
 T+OA3+Tql6GD01OgUqiJaWsWYXEJTYlJGjAF0JJoh5JuZsRMUNtAxP1ItDkVFxzAwkrbIqFUIcl
 8eu7QhlywRfOKFqYu+mNdPk2zwDTQEV+cgnsm2CYd5gzVVr/+YJ3U87Z/7svxFKMJGTCkKoGTqK
 Rd6a0mw/T+aL1LHWx5fQOFt3bqIKU1y8CwYuiSVIqAgzhLhtjCVPxBg0iW+9fpXI0xPkEgNT3+2
 1RYc8I6RY6GLIbsrQOmuQxFlnAXiwNDiB1EELv4MUyId/k5J0riqj0hBFoTjSvE8K1KW0baUS/X
 U1gLnDsLvkW27FDJae/eSQpAcuYd/dGGSDBo=
X-Received: by 2002:a05:620a:2b85:b0:936:e80c:e0ba with SMTP id
 af79cd13be357-936e80ce8dcmr2276556185a.0.1787031814966; 
 Mon, 17 Aug 2026 22:43:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2b85:b0:936:e80c:e0ba with SMTP id
 af79cd13be357-936e80ce8dcmr2276554485a.0.1787031814582; 
 Mon, 17 Aug 2026 22:43:34 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5b783d1sm9394214f8f.25.2026.08.17.22.43.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 22:43:33 -0700 (PDT)
Message-ID: <c25aa359-4519-483e-aa7e-2ba69daa18c2@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 07:43:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 16/18] target/riscv: Recognize watchpoints with
 first/last
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260815203730.1468365-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA0MSBTYWx0ZWRfXxtPZlVhzGQAR
 iCk1LL/hdAfbUjTE1z2OM04pErfZ+LDJuRVPBlNs3JMe4z98sKzMuXdrTj7tsyRH5NdUQ1UYZKU
 pD60sOJWXfU62dVfeNkIAtzfR2iE4Ms=
X-Authority-Analysis: v=2.4 cv=VsITxe2n c=1 sm=1 tr=0 ts=6a83f107 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=hMiBfUBk8g7yshXQi1QA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: -xU7d-dMWZVxjqbEWyKLle1wurVVRIzl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA0MSBTYWx0ZWRfXy5Sa0uanJSgA
 VN/1NPOqPRsXyi5iIkqrvS4wd5Zooljrl0fUIg9sjuJT1wnN1VVdGKcYpVfhiw+//6FbFQN4zPU
 8M1I3355E1rX47jY5NzIhvCZlg+eWfvmP95i/q1snx79qTu9YL9wOtSpuoQyFlYJ+unjPnriS0Y
 y6B/EYmC8CeX353YFX6yHrB/EV3Ym5ym8XFFWGKGWMsbaMaAvEvGdXkZBVmef5qmkLM5pB1T64J
 HQWxVybaWcE+GYtfRfsjgZ9I/3sBWdqj+2Wc4lNYCkZTzkHC2xJXqdloNIunEIW5OBCRiL74DPQ
 dr2J7F6fZZ7tV+ceCEdvrGmJd3ByNx2femlV3KW4Z6nMBLBrI/2bvM5qR2K/NCGtieIc+i9XJQD
 bkx7V9flTtiP/Nke1FShoiIFO9BG8mrd4JgBipVdGfDNM79RXy/fisQ5effk/TRQFZSZZ8LPYNg
 4HmDRUlWxz3fOdYDCxw==
X-Proofpoint-GUID: -xU7d-dMWZVxjqbEWyKLle1wurVVRIzl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180041
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

On 15/8/26 22:37, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/tcg/cpu_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
> index 11f2654da1..3318e82ea7 100644
> --- a/target/riscv/tcg/cpu_helper.c
> +++ b/target/riscv/tcg/cpu_helper.c
> @@ -1784,8 +1784,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, vaddr first, vaddr last,
>            * Otherwise we'll throw a debug exception and execution
>            * will continue elsewhere.
>            */
> -        cpu_check_watchpoint(cs, address, size, MEMTXATTRS_UNSPECIFIED,
> -                             wp_access, retaddr);
> +        cpu_check_watchpoint(cs, first, last - first + 1,
> +                             MEMTXATTRS_UNSPECIFIED, wp_access, retaddr);

Maybe squash in "accel/tcg: Replace size with first/last in 
TCGCPUOps.tlb_fill" or re-order just after?
I'm confused by this single WP change in midle of PMP API ones.
Anyway,
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>



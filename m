Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D8BC43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 21:52:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiJ8C-0007PZ-Kl; Fri, 10 Jul 2026 17:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ8B-0007Ou-Gt
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 17:51:35 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ86-0005zD-0L
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 17:51:35 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AK3tPs1895217
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 21:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8dxD6J5yAko3ZvjDWBXsFnyOA9q9eVwjuqPJaW0yfCA=; b=bdldFDm2OQhaTOA5
 olw0vS+9oafpGNXYm6crTN2rawua+bNBsRGDjHa8wdm3C0JFLlBRGrBitGgV1gpG
 Fcmj3+T2XNsgaYsWU0s/ErgktWA5piedGxrccV/bOyehcM0O8mb7+grXWdpIXyI6
 x1ihtBLQVgK0j2wjLoJTpKqaNdy/U+dbyZI7hFIdyiFtOF1M4gjqF7nd29/iaw+l
 QVQF+PgnWImJUY/iYHZWB3rcOdjnSaJ+iw4/j8fQcInK0merYLu3qpVuvMOdvvaV
 WIWfLR4WV1w6NZ3MkgVjM8YhBRGwqwNQxSFUpzXgaQx3aYZIYUGrjevWoggVaQir
 cqljjQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb3xvs3c9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 21:51:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c1c7f135bso24843701cf.0
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 14:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783720288; x=1784325088; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8dxD6J5yAko3ZvjDWBXsFnyOA9q9eVwjuqPJaW0yfCA=;
 b=eDijiQgIXbtlv8f9FxXU7LQDDDgPhesSzvzFFLTtcKWEiFOqng30hI1dv+F/3rynud
 x7VLXYS7jKSnN6oLKWo+s7/mLb6hXIg2wJeq6WNA48jXygc0EzwAkEl0BbYzBb+/McvG
 QJB17Anl+YmiyCFSgcJZXsVzrAcD0mJL0rX5LmF5G+dpLm1eQby+5cmIeH0IlJnEp4c7
 ADwNeAKJnqy9A48de4ghkeCSGrlUqlyJvEuCoZUqNWoMvVCEN0qdX0+XTJ+ZUzPxLzYg
 2022568HnsaoFJki/TbfK0NLn6jq+h26OiidCuBWDaT1Z4GIDWaPg/bXimO51wZWtb14
 WfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783720288; x=1784325088;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8dxD6J5yAko3ZvjDWBXsFnyOA9q9eVwjuqPJaW0yfCA=;
 b=BrDAYUI9PIyEmhDOvuKDcyLOxk2OdkcbhX7W3Rnaq1xzkCiHbfMNpk8x6JfOZoAvju
 2LRYoqogqJiZ1Le6Hc0drUrgzTCOh7ccJQF2eUXD6dwT0lw1JMHtM0RU2tAUIEcgtmXn
 jOujz8euC9rVqkilLqPJPymwVix1bo/fPQKxn6j6vEV3pIMtXdmR58iSBODYvjPaekjt
 J+C7ZdiTiKmwUMzPbD1GZPLni/4j1so8aQuoSFBD1JC4XFkHFK6Y2uNjKZnsOtQAp/Uv
 4yJiCg32vn26d34NRFsBQiObOIjkxfqmRJ+9u6G024Ne+sXGcUZse/18zb5meVb4+8cT
 /RWA==
X-Gm-Message-State: AOJu0YyxHfTaQZSS7gYY9pEIf1UfIvhgDne2E1qZ011H+g+CO30y05je
 TCw3PDm9oL2q6X+1YwfT0z8hpZ0F4P6/KRySej3ilwO0d6/i8bh/ULAXaO1LKrXnBlBbSbdRjAi
 55LHkDtJmisiGsFfyNRwhvlYjjsaxYUhZKSakaiIYcPHUjRszbMX/hC8=
X-Gm-Gg: AfdE7cmRfpg7H//P69YXzKF+qT63GG/IdLinN0xjV2QLfC31ee/maPSfHBSlxa6MBQ5
 MdVmy3aAv8TH2yqHXoZRNF4r88g8LdsrA1RNklqqoWGdqKV9Tqiz7GNRw+Bvin7OSkuv2ARhsKv
 mTj+BFhR3eC6zWwjfayjvDbE2+hYeDxFPqCQM6T0K6IwAIH3Fia6jYuXvCaQnF1P9yUe6CLDnq1
 ea2qrwHHbWskGrVrQmZZRizfwMuffZn+naySJYlC8MaRR0vM9QwBcTk+MqTx2SLiVloxs2grdr6
 3jR3TyIHxmQppgsxlDJCyr2lM1teJzZsv0tc2ix8WuW72P71PDKa7JpZN/uTlggG01EaziFB97C
 o732yHbSwQOjbuNuPnfzSefHEz1s857NnCHOpwdmJEpoqaWEfWZE8NrBWDPbw1w==
X-Received: by 2002:ac8:5808:0:b0:51c:7b12:120d with SMTP id
 d75a77b69052e-51cbf3402b7mr7598211cf.75.1783720287672; 
 Fri, 10 Jul 2026 14:51:27 -0700 (PDT)
X-Received: by 2002:ac8:5808:0:b0:51c:7b12:120d with SMTP id
 d75a77b69052e-51cbf3402b7mr7597991cf.75.1783720287271; 
 Fri, 10 Jul 2026 14:51:27 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6df6d9sm181387215e9.7.2026.07.10.14.51.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 14:51:26 -0700 (PDT)
Message-ID: <02dbbb88-2b9e-4604-a36c-14bcb00e8746@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 23:51:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/51] target/arm: Make check_watchpoint_in_range static
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IdG1MuBOPhgnaui8-ySVQZv_33W8_Q0O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIxOSBTYWx0ZWRfX6iabxTw51Dgb
 FKg0ahX7eb8rRbr66KRht2/wrClcftledbeDorPV8KZdNfxfyJeoloDyDFRal7ClkXlFj8F+yhX
 6GRhOJvAVPzeem8D3b6QbxJF+IVqKVHcMxet5/K+SEomhmLkgt8vEwKH9dG3CGQ+Ccl+MfYnMkA
 jsPzntkqZolr6sGfOU5wR4ahMqIx05z3Dg/ryDUZW73n/xXM23eB6y8KNIF4ujY9q0vsbWKkv+3
 dI8iB6TCzVQJMDHMmFg6pU/RW3V1IGxU+7/HpQpyhc9dUkdHoHznqHBoV0TiFtaYpmlGLlzGTK+
 vpUPxe2e4aKayxDRH7cOweBRpXgH6lFrE9AbY26Y01nKjT7/W0XhEYvJJNub2DGy2DfUuQvxPF4
 SUDXT4n+zYLtS+QwVSVbdcEJhjkh0SACHWvAGCbcau+MAzWjhHsVcvcXJjjjesPybr9c7vvPn1o
 FBP2+PAjB2HKtzZq48A==
X-Proofpoint-GUID: IdG1MuBOPhgnaui8-ySVQZv_33W8_Q0O
X-Authority-Analysis: v=2.4 cv=HInz0Itv c=1 sm=1 tr=0 ts=6a516960 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lg_xICGfZuE_qk3iapQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIxOSBTYWx0ZWRfX2niwRBLCaeVR
 WfK9rwk8/uzc49ToRY3zJFNF4VKwoF0jqmxUpBX9/nSsRemI8+W5XNZgO8nH41JHRoHngs2Q1vj
 NBZ9/5Y+FmrKB42ugAVXYiKpBEkd4q4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100219
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

On 10/7/26 22:53, Richard Henderson wrote:
> This function is not used outside hyp_gdbstub.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h   | 1 -
>   target/arm/hyp_gdbstub.c | 2 +-
>   2 files changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


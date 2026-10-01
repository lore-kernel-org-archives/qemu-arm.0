Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F18CA5FCB
	for <qemu-arm@archiver.kernel.org>; Thu,  1 Oct 2026 13:42:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCH2c-0000mW-94; Thu, 01 Oct 2026 09:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xCH1v-0000hT-CA
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 09:41:13 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xCH1s-0007YS-7F
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 09:40:57 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 691CV2Ri1289186
 for <qemu-arm@nongnu.org>; Thu, 1 Oct 2026 13:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 I1ry2hqtlM6+ycp+jQDXy0kAQRh2IWE47tSm+AaQiBY=; b=Vwv2ikBdD7MQvrj0
 XgfLdUG+NJvpEn/wfoG5MF52zwghDTNs+aE/ZqQL0WjWY6VupI05zCzkeCv7pA9+
 U56IO+vI76+iwcc2NEmQy3/fW2LYT92OYuLOKmHO7SvS/rNlhJlrTFy5/Zs+Rzm4
 BybLpmNR7qyoSeL+V+8FUKRBhroWKUtmoeSOW1D0UzRSIZWfJK7cfXsm1cIVH1zM
 2AKP5MZVZtdXt/2SFzH/CKL9pqwO259jQLAZU0NnDGD/AAyhgNtRDPLEC5SADVGe
 Qi7vMA+r3cZlv3T2DXH7ymPHhl5QdiHUMnBUalugOrXHGBwwvk4nFLydJs5vcOPq
 QWL7Dg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pjc887-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 13:40:54 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-7bdb408a368so352711137.2
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 06:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790862053; x=1791466853; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=I1ry2hqtlM6+ycp+jQDXy0kAQRh2IWE47tSm+AaQiBY=;
 b=UnTVBC/1tlM+tKyQVzpi2jBrhxT8cvkARiJYjVBCQUMt4VRhatMFd8o1artWluH5oJ
 RrBA4Bwcv5kPqfnq2ztDNeUGN72aOaXb3EKQ+QnqHchgZF9jldota0ytKkacmNZ233ml
 k2ghgeT0hZ3mSd6nVK08KBETHromSOcLXgYiC/CCE64pCRThDA5yreEFRvL7i84Tsk2X
 96A7eOgEOBPo9n4krSpbMqBlKa5pMKQOQQH9iAZnxi1yvT4hbbxB3dVZW8ud2daWpvQd
 LsPGMWbTZdsgu6TSQrxvkgK4L8zqO2PmnvBaKas2CaEvYYA45NbuFf7b6ysxOFbl+vKG
 u9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790862053; x=1791466853;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=I1ry2hqtlM6+ycp+jQDXy0kAQRh2IWE47tSm+AaQiBY=;
 b=JIPjt3vEfXueSGCgJoIytPeeKhpiZ6vk+WpBwvMJlG1rzjcsZumXbBD4rkQixhUikr
 79E+KH5rMUq216QThYFdXi/u9rDUG69oI3XFl4i5fDjcxY7OdnDfs0Zl1T+mpnJsH+zU
 OLru/wa2C5M/AdXNT3mfaxUVj988rRvOIlFu1wp6EgWJvnj21dinT6YV0o4jG4FPrg9M
 M5jm9EQMydokaIR94GBLzpSuM01kShtFnZydCRSRuSBfI+yB8r/kunL3RHZfL5XMic3a
 UreVDeK5H36MEKsiHu8yedZYtZuu24NCgXylnuVbHDiYv49+Eaj5Lui9ltgH8a0bsc5f
 nVfA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxR4Agf2bmyIWa5chfIy5Qe6Zi8QnqHButKzKDx/Bsq0Gzaw3gGKmPSccmfbowe2FAvhhL2ZhEWMA==@nongnu.org
X-Gm-Message-State: AFq9FYK2fJ5R2aO5itiDyNaUmc7Jyrj1G2qfTPSz2Mbj/v4bRvN55Nmj
 MLfxeuhq60WWTFw3w91RqpM45ij3J3bZAIQ4AEzaTBgisTigBp5v7FtBhmQvmNeX8tPsgpPEfLc
 vOWLqhmt9Ip2ct7+Bx0QdHhJ+dvrQywQZYe5FiBdr6e9WyS3vVq73ffg=
X-Gm-Gg: AYBFou23qLhXnBH4dAont3Fvv3trBzA9t0M+hwgR+rPse5ETR+jH2UyugQ5Qb7C4B0A
 0bt10UlrTHSQS5lmPC1HUD0qpv2qFSv7fgU7YDvM8Q8hyjgDshQUO7W0eYdwZd441V74fteIBZA
 J4xXjv//Z3RBwAzxabi1L3fNDjVgJqWC7GfBs/4vQJS14MDiZvGLYctHSaEwjrUwJ2bguyk0dQJ
 1V6wFe+NT28k9sOyPA5slwVrmX/C+jkC34Pf+BWDtsaIkuGmklI9izJlTpmOlrmuqj41lrr91Fj
 nn5gw/waMWbAyblJ81EbePItEfj3+s+NaievFcuvmHBZ/R1+tVaqxxzipzrk+tIlADyeMzWU2Qt
 W53Df7Rw=
X-Received: by 2002:a05:6102:3fa3:b0:7a7:198a:c2bf with SMTP id
 ada2fe7eead31-7be735975ffmr1079571137.29.1790862053266; 
 Thu, 01 Oct 2026 06:40:53 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa3:b0:7a7:198a:c2bf with SMTP id
 ada2fe7eead31-7be735975ffmr1079560137.29.1790862052780; 
 Thu, 01 Oct 2026 06:40:52 -0700 (PDT)
Received: from [10.111.137.66] ([212.136.9.21])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b0692b1c9sm6125022f8f.27.2026.10.01.06.40.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 06:40:51 -0700 (PDT)
Message-ID: <75d53637-5cb8-4a03-bcd8-97acd646b527@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 15:40:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/11] target/hexagon: Move to do_interrupt() (BQL
 acquired internally)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-9-philmd@oss.qualcomm.com>
 <ee1807fd-eb2d-4fcb-b7e5-e44e64829b5a@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ee1807fd-eb2d-4fcb-b7e5-e44e64829b5a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abe62e6 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=neIvRC4PW-D10HVD7IUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: abjMT0xh1hsJtKFStAt8jFIZzabZcYFc
X-Proofpoint-ORIG-GUID: abjMT0xh1hsJtKFStAt8jFIZzabZcYFc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MyBTYWx0ZWRfX0rS816lfXOCl
 ZBm9bvja/DcxO1TG/5QQ3PJ3xLdTTputwXKiIVGOrqLUdat6WhDfIDX2sZTMzU1MmVOViHnuGA6
 JOom3hV1XTsVjJ47p6/J0PC/+cFpZ4E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MyBTYWx0ZWRfX734NysU5qAlG
 cBvlVQHSox0+8cdNNZuG0eTv3OjMf2JH1P/8hzeS7AIgFmdummcXJBigRmp9ALYv/5JvUrm6CeR
 8Hv0uGMy9gSfYI6qbOwsksQ+QrTTc5JTXYHf+PRk4AWhgASNV7KUd1eyNqLt/hwcdZU3OyTS0Zh
 0BuX4QQLGszselsaDkE60sbl/uAWoQ3qeZ9O11YtX8ACK1jeNVRYPGGOsTwzKv4Kz5Sczwc8yuw
 kCNkXMiDiEpegVc26uk9GTyvyyud1ymvVAbFEOOkU5rF7H663qaQ49R8YM0PVTQJI6sIhTYjt5/
 fT2yOvs8UDAvudUfOwGWRBQiBIHgCaVMHnrkZEXj0iXJ8dbwW3zp9J7bOYi87JXznTMJ0/WAh8R
 N3meFx240GxohRaN7/JqPf0UasA9nT4SeKArL/bppK6EPkVPDYaeKyf3QqI40/eO3HBsPVe2eKo
 E/x1K/R4gS+KigvzAPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010053
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 2026-09-13 5:55, Richard Henderson wrote:
> On 9/2/26 05:20, Philippe Mathieu-Daudé wrote:
>> hexagon_cpu_do_interrupt() already acquires the BQL internally,
>> so register it as do_interrupt() instead of do_interrupt_locked().
>> This reflects the actual locking model used by the target.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>> ---
>>   target/hexagon/cpu.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
>> index b5dcbfc99db..7067e5b70f7 100644
>> --- a/target/hexagon/cpu.c
>> +++ b/target/hexagon/cpu.c
>> @@ -769,7 +769,7 @@ static const TCGCPUOps hexagon_tcg_ops = {
>>       .tlb_fill = hexagon_tlb_fill,
>>       .do_unaligned_access = hexagon_cpu_do_unaligned_access,
>>       .cpu_exec_halt = hexagon_cpu_has_work,
>> -    .do_interrupt_locked = hexagon_cpu_do_interrupt,
>> +    .do_interrupt = hexagon_cpu_do_interrupt,
>>   #endif /* !CONFIG_USER_ONLY */
>>   };
> 
> Eh.  Except all that hexagon does is acquire the lock at the beginning 
> of the function and keep it for the entire duration.  I think hexagon 
> should stay using _locked and *not* do internal locking.

I'm rewording to clarify:

```
   target/hexagon: Use do_interrupt() for internal BQL locking

   hexagon_cpu_do_interrupt() acquires the BQL with BQL_LOCK_GUARD() and
   holds it throughout exception delivery. Register it as do_interrupt()
   to match this locking contract and allow removal of
   do_interrupt_locked().
```


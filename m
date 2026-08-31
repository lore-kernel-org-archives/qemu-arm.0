Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987B7C61DF0
	for <qemu-arm@archiver.kernel.org>; Mon, 31 Aug 2026 04:49:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x0txh-0002I6-Vx; Mon, 31 Aug 2026 00:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0txg-0002HW-F5
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 00:49:36 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0txe-0005RX-WE
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 00:49:36 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67V1c2YN1622192
 for <qemu-arm@nongnu.org>; Mon, 31 Aug 2026 04:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ESvSh7rDyTTWzOEca4Kn03efiH+rrH6oJKWJjOZVvuE=; b=WLOcPKM5cc5QhbcJ
 AEpw1aJP658ByDQ8PO1G5R2pajPRPbAvAxki5OJXf5hJkwo9djy7drTlj67mcaEA
 jlVJ3WheEa6SzQPL+2OS9WixrOxiI+Bur0yYa/w6X/uDKiXW2jZfajOgR1bBQ3qF
 v8gCaeoFyTEk3kHhJZHTsbMwhB+VNypIA5Z8NsT6iwqZqfJzS3cgqoJiO0EjT617
 bVOmkt73YPzbi8qAhlZSWAkyL4kKS3E6AxOAZpiE+2Bav5u6jzurM9wwGQPRzgUr
 ZK5zxDcD6EAB2YfrIUD9dDyZu0ewF6kiGWQBwP5BuQeZtoCNcoq+OTQ+wMyllsjr
 A8MOHg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbr6dvfsq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 31 Aug 2026 04:49:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-930edb4362dso402352885a.3
 for <qemu-arm@nongnu.org>; Sun, 30 Aug 2026 21:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788151772; x=1788756572; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ESvSh7rDyTTWzOEca4Kn03efiH+rrH6oJKWJjOZVvuE=;
 b=gi6D1J1edKeD+C2VF+v+O8DSimHy2DcqyUFcP000FvwN8AOdKYPITdawPED3nAcFWO
 g3BFtKQ7EGnY2VTD9JtcmwFwIPxiPDJOb+z1zwENxaCIFnf49zdErj8vNuWV52GVeby4
 vwb+7hIkTDw+QP8V+3BHpdeXWYKC0S5TKJBogl2L1dI0lAV934gUzX2WGuKUD1+rc10b
 nC3ceZ+siXfYrgSO9sl4vW2Affy5RMpIKSbCKaaMB5hIEZzmTnw8cgNk2790fyE9wlor
 LmrwD9hzL/iIU8iwwq5fWZe0FdKTXRR/h+FjOuw3p5CWx1RNYX0b5Nsj1ROaNlaW0tbo
 lpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788151772; x=1788756572;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ESvSh7rDyTTWzOEca4Kn03efiH+rrH6oJKWJjOZVvuE=;
 b=QftzEf0sEnmJLb7Hswf0nMDxE8sDfxUzj45ncx/kEAk139oZLefd7dFvD9Tax1uhCU
 4Bh7Xk0r6y2lLo419mJQfZ0x/MUkjqdpOjzxTjvoUvKjh2dYO1wp1gWRKufcFqo/7sfl
 nfJmfuLdMg139GO9lMwf6YZFaaCC2uTgfQQBLi1qAa/8PBQ8uWnaJyCCWyxSm35fkFPV
 SU2rMLelPb65z5DC0BQyCPnSfuPsyetIVaPkt9jtBcLjG4KzAXesmVNcm0z8DxocjTFZ
 rw35iVS4z/f8YLpLtWEZ9Jf8ZWYwoej+6374FckfvcbvsAIA3Hozk9aHkGsVouXOi+uO
 bsgA==
X-Gm-Message-State: AFuF++lPpkitG0ILxaBJVmR3qNk2QsRP4EAkhXXhFpI8QhLeQdTcM6ts
 7zJxQMiLb/KTVXlR1ZpDI1zQbjzp2ZSdpkg6c4Ma43pmme05rbb6wJ+77D3VMVBUlgc5MxsfSBr
 s8qr6KJofWlnrWW+CkHQROP6MDx97K82OgpqbIKTCH32bB/3iRd9pncI=
X-Gm-Gg: AR+sD103n+t5ZrJd9Q/qzIldF8fNDgoELTcdpXj5qs2wNbzuYQCcmlekuePrb2at/Vn
 2u2t41JEHtPx6bn97B+4jgTEjFI2HPJf3YKdlIJXf9CtOZz2DiF5X/0ugY5yBmQBVU2crfJERGh
 N7iCsaOCejLEc6ZPYPFW1MmqWZhtsz94F9SHb3fu1kFv+HXtkznZXwH+4Gfb68HPV+lAQ7w9HET
 403m0MpSk9q3hZaxt3nwd637v6yI1niv9AQn/6mqsCwaGjVS4cSJkflXzcuTvUFUOIhBjq79E8w
 re3fgWzHSlIy/Gxuh5N0QoJsB3PMc/UYYYPiZO/ELF5mRog8+CGj64I8hbNvabuMO1Pr613BfOg
 En0PrhjGItnS9WGJip7bzXVUEYq2Q7EED6g==
X-Received: by 2002:a05:620a:4156:b0:930:e48f:47c1 with SMTP id
 af79cd13be357-939138df434mr2563822585a.35.1788151772396; 
 Sun, 30 Aug 2026 21:49:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4156:b0:930:e48f:47c1 with SMTP id
 af79cd13be357-939138df434mr2563820385a.35.1788151771941; 
 Sun, 30 Aug 2026 21:49:31 -0700 (PDT)
Received: from [192.168.69.226] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b9500c7cfsm276402735e9.11.2026.08.30.21.49.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2026 21:49:31 -0700 (PDT)
Message-ID: <fbf2a06c-24cc-4984-9794-aa87c8e23905@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 06:49:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] target/arm: Widen cpsr_{read, write}_for_spsr_elx
 to uint64_t
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260828222639.1432046-1-richard.henderson@linaro.org>
 <20260828222639.1432046-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260828222639.1432046-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAzOSBTYWx0ZWRfX0B+52Uj/7LxD
 SLfUjhueHeM7gniVkgjKCarMLqZG5t/PlGAGgk0IqcqtHcdGsMQcfXBYmTA9asYJTVrEiJx2IXU
 +/IJYR7gMAzxTnpzGf7d3TnEsVthJyh7j9L6Geh+StAQC+FeQ3mlBDw6oiNBMXf80/BZhiti+49
 nlVWkmXp0e/ZMijY1nHPRkcSNKCwQxzUzUu3stbNNCgH8G3ZafVkv6vTFQA5/mGwHiKHXbnLmaL
 /JSEudr+TCTqt3YLOYBlWP7SQQz3p+2sGEa1RWmmOM7TxmOPSFG3hnr2Hfr75im4+7I7vk3DC/M
 cI8jUyk6kxoi6i3wUfS/bBQzAM/tOZ+3D1eqSuGkAuZHI8x/Zeo5d3FwMhd2QdX0lqMAixJajLX
 QUkBeVvXwjfi0BihGfr+RufHZHGikqNgJl/pNXB215xb77U9i6uZBseXNCrgXSKnmiPwPUHT+DX
 gKlQ6boXpcJnLDyW7LQ==
X-Proofpoint-GUID: XgHfZwO0103a1y3Ap4SGu-hRMTFyJRVY
X-Authority-Analysis: v=2.4 cv=Zakt8MVA c=1 sm=1 tr=0 ts=6a9507dd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAzOSBTYWx0ZWRfX4SkLyXI7juuV
 PZateplq6cobKaQO4cgPnkRT9A2mQbBATxyzpRVcRwr8PnAHthETBMoCnr3feZVAHRrQPEXHDFg
 57tRpupk1K3aXIqa29TyZIFy2R0M6mA=
X-Proofpoint-ORIG-GUID: XgHfZwO0103a1y3Ap4SGu-hRMTFyJRVY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310039
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

On 29/8/26 00:26, Richard Henderson wrote:
> We will shortly need to handle bit 36: PSTATE.UINJ.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h | 4 ++--
>   target/arm/helper.c    | 6 +++---
>   2 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


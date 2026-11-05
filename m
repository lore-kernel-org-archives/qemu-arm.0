Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCBF606D531
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 19:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bCZ/im4/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EvjE2Y3+
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xP3NJ-0004x3-3f; Thu, 05 Nov 2026 14:43:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xP3NE-0004rG-PT
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 14:43:49 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xP3NC-0000Zq-6Q
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 14:43:48 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A5HeQdw4075337
 for <qemu-arm@nongnu.org>; Thu, 5 Nov 2026 19:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UfGDMgg0aBgK+FBPFViJLaI3BUcvW4oHoEBLdvTQESk=; b=bCZ/im4/RICm5xPN
 C71s555UCxGJdLdT75urNb1t/FHRstcNPjXG1KZKg8TaRG8sbcsIU8gyPUkOmg8P
 ZaMIrjBwL1afKAYkHKnaM02no31HZY8kfhtY6Mp5blFxZ3SAZm3N3KM75MHQO6fE
 D7/VEPul33+rU//Ml5BwpS+Wu3xTa1auwKKDV1+ro3ThqxZ12PZt9nx+b/PKzayC
 XIdMqDQWQF8oO+k01409tqbMxr3gwor6jE1fYvN8XLX/lqSpx6OkVvo70kfhwMfh
 0I3qKW1TzXgd9LGdHkdWHwYWreDaMlzFBnDkgzcM/5FOPrn2tfH8cVoJMbcIVW+5
 OheRYg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdt9nd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 19:43:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-351788121cfso4247091eec.0
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 11:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793907823; x=1794512623; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=UfGDMgg0aBgK+FBPFViJLaI3BUcvW4oHoEBLdvTQESk=;
 b=EvjE2Y3+W/vUL0aEQl3+dpApgtym6HMyeXw3VyPpi7o2Uiy5KelKmzDeXwLLzja7Lh
 2Sj+GwK8+OABif9ZhyJPDNjMO74mLX2FwCEwEZnFymFNg2SrwKgtncau1vUwiEsIH7Nm
 0wz5aVRUNqY3HKfZzmoqWWMqAXXyRu4zjd8JIIpaxHQJ3mZJGoKP8N9Zf6/r/mS7uj/b
 ryuKkPs6uev1rMNoxsEdO9RxqyGkcxgnoThD6xdGBoWO6q4cH3sHiAo2So8X+ViSqz5x
 zFV/6abBL0bR4SvmzE0z8cYGHwswXJZ2aJBC10/XJzyOSVAKHlPlkBYB58YOVhLFbBz5
 FNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793907823; x=1794512623;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UfGDMgg0aBgK+FBPFViJLaI3BUcvW4oHoEBLdvTQESk=;
 b=UCXrXuL/djr6Ag4wZfoXPKqD/H5ioXhtHZ4sV73Mb5PYSDM7zJnD4cCbLbUfcGTaVB
 Sqx7pmYM0q3zXT0nrwJoi2hu97RGy14GuuhbbjDPzy0Pns5M3fun8MTfVO8rzXrN3maU
 qmKaqKeilbOfBul91Bv26KfDDujVdbiRTFncoua/WrNzQFeaARKueh8XaLXEimnUljYf
 HZ1naW3p4CT/1/aQ8MUcPIMu6ye0qce0LOtbZgEQwfPKjDWLqieR3UK7XLF0z/ad3efC
 ArS12SzvryenF4zOhqqtTj+pxQxfIBk3x3OzCW9BUKm/7RxfCibjZ+KRnKpfQT84EK12
 p4OQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwd6MoxWnDyZXaRjFlaTHgZS8Qeq3ciqLFMrq4WQFqBqTKkdwpWSnECXqHB7Cmu96phkbanLkQyyg==@nongnu.org
X-Gm-Message-State: APuU4Z8ko+Tk0HDpld71k4qm8gjdPBuhCQtrCdTKsEqRg2vsc9QhtOlq
 DJegwSfdc1pp/X6LoUW0XagaTv1HRNFszlZiDUc8AWrB8NV8ASG0lumk4ykK8ebAp3DLJ+SIjpk
 NPdNjxLbfKghNPiycABQcWzbObhobGMd5bU3of4Uk6bpV1Pl7FZX8izg=
X-Gm-Gg: AYBFou2F5Ly2mWw0VrMtZQlB8N7PtKzh2i1ch++EHwfGyWEysv0fJ/WjY4A2jCWYJya
 FkODqBoXi6GUItMh8OE6BBY/WKvI8ZOd+O4UJE9kAn4H529GX3AXvOYBRgbu0k20IFjkSAwlbEh
 tFpnOp1AeFH+0Ped0Nkaop3ttWZj/7ABcd4Q+M0KYGaVVJO++GKvn0hw9rkpCHVeRjoy4P4qND3
 qXKjTg2KqQYxI69uRMe4P9g1YIvPot9iGwyUmoR5HCg1GDWH5YTxOXrpPBTvnIrZ0abyX8scSIb
 C0oR6GeCUUbGML5w93vF/rmI+VSLxfkos0ZJigh6Xi2WhwlRRf/m+jY95H59OPiC1DXP/L6QY5r
 i+62GMsp2hoeszjilF/mcoaxVr0yfzBNj0tpCbbSDv6gzPXIEv/sfMXzLfdRXex8Sc9F6S2VpfB
 iGPuIWrE5Vfksgs7rj0DvQNkpiigWHPJ+W6f2hi1CxWA==
X-Received: by 2002:a05:7301:5158:b0:369:fbc1:89c2 with SMTP id
 5a478bee46e88-36f76023a5fmr191835eec.8.1793907823026; 
 Thu, 05 Nov 2026 11:43:43 -0800 (PST)
X-Received: by 2002:a05:7301:5158:b0:369:fbc1:89c2 with SMTP id
 5a478bee46e88-36f76023a5fmr191799eec.8.1793907822539; 
 Thu, 05 Nov 2026 11:43:42 -0800 (PST)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36f722ed274sm329297eec.18.2026.11.05.11.43.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 11:43:42 -0800 (PST)
Message-ID: <e4f157f5-486a-4871-9ec6-baa680137250@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 11:43:40 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] Revert "target/riscv/tcg: restrict
 tcg-accel-riscv-cpu to riscv targets"
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>,
 Peter Maydell <peter.maydell@linaro.org>, Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Glenn Miles <milesg@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Philippe Mathieu-Daude
 <philmd@mailo.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>,
 qemu-ppc@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>
References: <20261105183310.1614-1-luoyonggang@gmail.com>
 <20261105183310.1614-4-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261105183310.1614-4-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aecdc6f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6iAvmC-XfobcVWHkfosA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: qXq1SBQBYdDbwAmM_pZ3B2vDNUGWDb9q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX7yiwhHwNYUlT
 4oB5UJzm7BVg9ZmIShkZzjc/Rxj0LhqCm+WbYeF0UIq2i1HohoyuNF3xxd90yNhZxLzRwk2Ynjy
 ns+/Hg9JEoMGvmYoludhyrWjpPPKzSc=
X-Proofpoint-GUID: qXq1SBQBYdDbwAmM_pZ3B2vDNUGWDb9q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfXxS39xmekeGCx
 PV/lz/rcR9P0rJvWMv8kWlc9NJORLGd9k5cgkESWXfXCvT7MnbnC22wCpp9V/HRHw7l0fOu1LtQ
 ACZzpPXT7RXfq+IBA1owsfxocwm2rX1bpnDF0OfbbdZjcOwaHJ6alQkdwIjLhmRVRvKL4tOb4dg
 fz9ZVkcjtbr56MdpG7Nn5/S+M6e/wbRsO3AcRvg7+OGMdubKAsOzXbpF9U8Lit6MKLPE0CPpZRU
 birxzC/99gByqDEgRbYHl4p6ZjW32XPNDlIG14e5d8YaJECkwIhq90gu4NlRflrsiunIRtDSEWC
 yphfodXpHC/xKAbZ6CxK7KeRwcpXpvywnWXVF2y562Vr20RPCqXveO159THI3kHhkkpvzuIPbFm
 j2psyuYpWrK5x4isa6zV0dHzmD9cX+0Hay1NVkvSdx5mlgdynb0sGkdbKCuUrgkcpDUcHMBmaUp
 UhCSUK3+o+K8OY46kZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050078
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/2026 10:33 AM, Yonggang Luo wrote:
> This is redundant now as all accel-$cpu_type parent is already registered.
> 
> This reverts commit ec65e16fd2ba012d57b1bbfcfcd04c31c4111924.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  target/riscv/tcg/tcg-cpu.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>


Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECF5606A31A
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Oct 2026 18:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GaFTzCbc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CLTzL5O+
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLlsu-0000q9-JC; Tue, 27 Oct 2026 14:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xLlsW-0000UM-E9
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 14:26:36 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xLlsU-00051I-O6
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 14:26:32 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69RIHqVt2960468
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 18:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rqvwCdeTzalXFMsGrT6m3x8p0RbZtnSwh+wuiUwhRpU=; b=GaFTzCbcWdxFOmss
 X1hmR8YF6qkazqrBr89HLjt0dkNHrMsLmj3744a08FVuScFjDSrh90yi+m6ZeHCY
 0UU8XuK/tqDgKN3RSD51unGb7rW3rJME5p/5c9VYMUezsjXivQeV6CVILayDkRcq
 JLjRk9jyADcT2aDITWoEnGmWdrylCSBBaK0tddTBmypy5aWG+2SsEgLOKgWKl0Lb
 k7urQDtU6nDl3DhBQFdEpiDoVSYkUYp63o5VwexRSFmejyX3p9EUSdEMxhmVurEb
 BmDEPz4ceTwm795g/6NeGg2NqqIpv20jutiW1SkgQhCA4mSk+hSOSAthzCu+7L6b
 Dn8PDg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy670mxd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 18:26:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-91c7a1a32a5so5136246d6.3
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 11:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793125579; x=1793730379; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=rqvwCdeTzalXFMsGrT6m3x8p0RbZtnSwh+wuiUwhRpU=;
 b=CLTzL5O+aqjZ24BoUbfJhN9JxaiqM1HplfAya/gbuqQ2HH6b5dzfg+6YujSNLO6Bsq
 qqtR5+YI0sqBgHETdhX7mTNDJ2wZLnefHlp85tJyKHSYqqJFY1cl7B7W7ITKx94MOn1C
 RNh2DkhjJYNIb/5Gu8wObeQImyMgXNOF0OmIC6Vv8MLtgU44zL6/bzQmZ2izWuC52gJK
 +/HqzGcQJZeDTcRlUGilGJED9o7z7eSXaeREpjAX1pAh83Hg1FdQlG3dRLFhs/ePXN4/
 bOXOY1A+DFpVslv5wyGDu0Rf1xfKLh049vBCHrJacFaG0gpboXsL1BpWzmFNr3ZO6Rx5
 OcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793125579; x=1793730379;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rqvwCdeTzalXFMsGrT6m3x8p0RbZtnSwh+wuiUwhRpU=;
 b=wgigdbOUWNqtM/byO9tUZNP8pStUxCqmPAYjg28PVaef1BEnx04+vWfxMUYM6ft3Kv
 F9FRmxAjOIrFvCjhZDRMl0jjPT3DaDByrmR8C/pdITfEpuBNcxU58DtR12JWwuu2mFaQ
 9FImKmfosurqJQv8dqHs8nKRjdP00OEckwMQRrPyZwZSkunhk3yVlE2NhO3aONiZIVAS
 dLBPMg8bBBUfAIOJNnXDNNijqB4kjSn4c1JO1loT/UFrF72zMXtWT+RoslPHcvNZHVfH
 jlq6uKXE8tsTWXPPw8qHWkDbeJFAiP1Ir79aklS5uxS1hKbYlgU1SmChyKbMEOxo+xLG
 Rbdw==
X-Forwarded-Encrypted: i=1;
 AKwUvBx5CJTrgdeE8+G+a940sgs9vHRr4fZYLTAViuhtGncLhn8X7B2Lvcqb1eZzOJUfPL8pcNhte1w5Wg==@nongnu.org
X-Gm-Message-State: AFq9FYJo8A6jyJICRN9AY42t0puwzRUsz6JeN2l3BMlfmWUC866S3wxX
 HVRss2I3vdumgOCjifFaG6+nRFXHS8/g78xE7g4vQ6sAXG2ybsEMxlTZcuSp9YaSbcKEZ5ZU3aa
 bZJAC7QMF/NDvJK1KnlsJuWg7D3voGDT/IZMI9E0ALa25GLhgXlzsCRE=
X-Gm-Gg: AYBFou1OWY+18vqSIKm3VSSz4TETVv6Dgf1pVUhvWbwFQOfHj1T8ev5R/6w8xMq73sk
 5tYWNXOC8RiTYrrawjkLQRF8BusOS8LKL9R9GWbBNg2NvRIDjPOWWMcmB7FVMoH4P2UJxR5CDkI
 pZqMJErFbZ0po+v0IfT8GvHILqLdFy8Al1PSwgTE9vbMfy83GCwAU476eUhdqX+Ysa4Jzov7jGl
 t+npsVRsigDe1LqH06QYekZRNr+f7ipwzs/l6YZBJ9QDwufCkpEi7tNClV5g82b+AGPG78hkLNz
 eysV1RozY2OLUYBWZM/VCeLmXJWP9xE+aoQeVi1MZgy24OibRpBlzrEfxiAPUgcHonVEdnLW49I
 Uvudsw6s/AnZg4lTtIOuIlZ+ButWh4HD4sviOFMVkKoI4V8lhfg==
X-Received: by 2002:a05:620a:4689:b0:93f:2e08:6420 with SMTP id
 af79cd13be357-940ef930089mr1680121385a.38.1793125579119; 
 Tue, 27 Oct 2026 11:26:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4689:b0:93f:2e08:6420 with SMTP id
 af79cd13be357-940ef930089mr1680116985a.38.1793125578678; 
 Tue, 27 Oct 2026 11:26:18 -0700 (PDT)
Received: from [192.168.69.229] (82-67-153-177.subs.proxad.net.
 [82.67.153.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a94c021080sm519415e9.2.2026.10.27.11.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 11:26:17 -0700 (PDT)
Message-ID: <a7e54c98-bad8-4d2c-9e78-75297e772670@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 19:26:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] accel/nitro: mark 'nitro' accelerator as secure
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Chao Liu
 <chao.liu@processmission.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Amit Machhiwal <amachhiw@linux.ibm.com>,
 xen-devel@lists.xenproject.org, Sergio Lopez <slp@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Bibo Mao <maobibo@loongson.cn>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Xianglai Li <lixianglai@loongson.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-s390x@nongnu.org,
 kvm@vger.kernel.org, Alexander Graf <graf@amazon.com>,
 Song Gao <17746591750@163.com>, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>
References: <20261027181400.1752951-1-berrange@redhat.com>
 <20261027181400.1752951-12-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261027181400.1752951-12-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: q76sgZk1cE5jrswfj1WkG_F2BpPiPR9D
X-Authority-Analysis: v=2.4 cv=QvfLTlyd c=1 sm=1 tr=0 ts=6ae0eccb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=nhBbSb_fY9f1tbuIA-YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfXx6/7LhLxpOY1
 yETc+35+rWwh+eoPz8SkmHdWELObWMz90jR18oL4zxtU4eTj4F4DYV+of+LxHIqZ4RVVmD2hExa
 DHhEZvwhXopP5wvOgodww/9CHBrTuJQ=
X-Proofpoint-GUID: q76sgZk1cE5jrswfj1WkG_F2BpPiPR9D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfX5uVCfL0gyRN2
 sh//wVwkrRpDL/Ee5hG2qvt7LrOSoSHwH9lntWJfaC4hz92el0MfIoOwz+JNOKwisMbZtWAdo9Q
 UjjiOd9640RZHVnz9x5rFVf/M0JvoxNaSeTLtWpW+wrz5J+AblW5YIbgK+tVWBfpaz5CjfHMxAW
 b+N9RODrolfJOvbgqNfJBOhGkj7PGK0Raz4C34q/0NyNHYM9NNbkgrtp2vSs2Jn4Z1eWzebOCmv
 Lplxs1UTEyvgoskPqFRqOdttsvjDaJFLsMvsish3GIQFN1uabUkeUKlnvD9zXm6VfrN7V+f4ww1
 rrwvmeERq0mva5SmJ8M8nLxKm+D8Uh1smYuFpKXe5lcgjFKXzy553W/j96bxi5yCmpMUoKQskz9
 X8rLzbJq461MMyhTTNj5qQVogCDXj5J+zaK92pk/LQKX2FIayHzt/WOC1uAXhIXMuJKAVACEwqR
 whAowUPOcqrm7NWvOOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270072
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
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

On 27/10/26 19:14, Daniel P. BerrangÃ© wrote:
> The 'nitro' accelerator is used with a real AWS deployment and
> thus is considered to be secure.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   accel/nitro/nitro-accel.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16B1606A31A
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Oct 2026 18:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mhWx35R6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IldkXJX9
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLltY-0001CK-Ep; Tue, 27 Oct 2026 14:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xLlsn-0000dI-3y
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 14:26:51 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xLlsj-00053C-QE
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 14:26:47 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69RIHQwk2639176
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 18:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5gtNOSL9DkqGrvLv5HiCmciZ411PQzVsYtj0F/yuWWM=; b=mhWx35R6EzRfQjVN
 1xH7p7SD7YTepkSQKvJRjnJdAwgY3XESWxBjR4e7n6msb3JPozQgoQDg0IxUxvi9
 hh1y0NovGCLazoZMOvJYn2VAHMfRpp6z5/xUwqSWFKtr/SwyQiyWAJkZ36GJbrcZ
 tjsFwvJyI61eqNejUo0z1ji7yPaKzlLipLt9pj3r4nEbWVn/Fzz09FJXK9JSFAbZ
 ZzwCiBOs6tcDrhMUPVudgOC8nrmUw8KJgoNXP6ql2E1i1/5zSNRRCklwLpyCRxdA
 XYxo2Z62g5QP2nNWOWLa+A6cCrxb3JWGzPLY6TIq1iZnyMlyQiHezOf0cPJEU92M
 nJptmg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5tt5s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 18:26:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91b529a8610so4633326d6.0
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 11:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793125593; x=1793730393; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5gtNOSL9DkqGrvLv5HiCmciZ411PQzVsYtj0F/yuWWM=;
 b=IldkXJX9GJUPJRDL0E3iTHzlryQjr0M6sN6gmNbVRAxpEg6NLhHKlCo4atW2yo9me3
 CCCOq3jGW/LrRzoWSCta1AAa7V6cPmgT7z8UPzEoeiAE5AfihZDlvMci8VEYdo5AlbXX
 Q2B6CUxofzDLyydUWWzn8ge8U8TOlxOITB0Kc/si2EtcK6LYVsAlbI7EnGQ2o45oOZF+
 YKNq5kHOElfRG141nz/G+xi0L48LdchGx/eZBwco7FLKUHFZb8340saWsaAaX2fkNNAE
 e3l3TxbbjDvBbhIknGeDOA4JfKmQZJuAyS7IRnsJf4yrbc6cLAZHyYk7SDc9Mt79NF+i
 w9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793125593; x=1793730393;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5gtNOSL9DkqGrvLv5HiCmciZ411PQzVsYtj0F/yuWWM=;
 b=a92lMLMV3fE6Aum7UU9xR4VC4uN//HGDFzDTUSIOzuUSmSzFjp14a/OknoZJ9LlYX8
 04yyOBcknXv5yvLzEweWzSIHXrkwLgOpxg4Uv3RG/1AZYxccFRC+LAclGo799UuQaBrn
 jiKut4HoNsonB0xVFYT6HMx+oQjCKKuumJUO3Tl8VGcuWi4jO7RGvjBB4aF1fTuchasB
 0zJE7VJEkWP9Re872XSohtasXBUpdpfTFDzVD+2QwBdS/Z+aai14OwYQNf3lEtMcq5IZ
 BX+jxxH7BgHoraTX/cIAsolVv7gYipCX+gm9E2gT/vau/Jc4U5MGXi0DXeBCg5ESYnQL
 AbFg==
X-Forwarded-Encrypted: i=1;
 AKwUvByy9ptEhrSmdNMoVI7HN9NwU2xNasvlcXyoDL7FuzoMfDTfIEkzd6EMpwipPpI2F9qU09bxuRLvig==@nongnu.org
X-Gm-Message-State: AFq9FYI6/ATkXbCk/RNztuK+VMcLOWUqDXO13wmtHK+cd5UcfbcyhkZn
 dOUbPe/+MKjuPi8keIzc7huVYqdsngWKIP7Z5RRE4uoxJDiAmx0u2tHgrnEgCxQ1ZvRPrQvNf2x
 hKP0IMWTnUjPbsrONluy/bqpDkrIAzg1HWktciVt8oA8lbuXxamI4Tmg=
X-Gm-Gg: AYBFou0jv/wDn/h5uEc3anfHKGjJ6OkAAEEHDPLaXuKrzNdr/5qRAo7EbWl4AyJgfsK
 Y/WCfhC31SD56S4xQCBSG799S70OomOIjaAS2Pf/Hg+F7FOtqprh14t+Lg2Ah2mGPL/NxJW2S21
 hyKhlZ6cgpdGMMQzqQsB3JBBxqWsu4h2gcJURF7Ei7fnL7huoHHZdz6Vq5Ot0A0JGBktDVn74jU
 cMuy05O/39FHBdOAwgu2aWMi0VGCrbgIHuQGgQgFQvjAjPwEV7Qgk3cfMsKvRF/e6jeN3es6j30
 ATzu6lCgYykLG6kRbTQK2yYHqWM9dX3c5ElM8qOk7oooV3oxOwolCmBl3rngtZurT0qBtMu692a
 JvNl7IaqRsfP4Zg5GPmhizFytH1srylAiJZqiD9RPU5TLf7zywA==
X-Received: by 2002:a05:620a:2b4e:b0:93f:24c5:f561 with SMTP id
 af79cd13be357-940ef9457cbmr1583431385a.33.1793125592750; 
 Tue, 27 Oct 2026 11:26:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4e:b0:93f:24c5:f561 with SMTP id
 af79cd13be357-940ef9457cbmr1583427885a.33.1793125592323; 
 Tue, 27 Oct 2026 11:26:32 -0700 (PDT)
Received: from [192.168.69.229] (82-67-153-177.subs.proxad.net.
 [82.67.153.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a94e6b8656sm23975e9.10.2026.10.27.11.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 11:26:31 -0700 (PDT)
Message-ID: <5ca7722a-cd6d-47eb-b8ec-4c93ef4d4699@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 19:26:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] accel/kvm: mark kvm accelerator as secure
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
 Cornelia Huck <cohuck@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20261027181400.1752951-1-berrange@redhat.com>
 <20261027181400.1752951-10-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261027181400.1752951-10-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfX5ZO6B537Zx8B
 LmF3xhPUV7DtmXuNltRKZByR74ok+poEFU29mOaeTwrT86U4qpvOWWbZAZ6BwACBkCggxfJ5o6+
 MQIwrG3bpj3U2asWykP5nt0vlYW1d9Y=
X-Proofpoint-ORIG-GUID: OCsTA2iZ-qwRbZtlVyG8nThMvVHhtqv1
X-Proofpoint-GUID: OCsTA2iZ-qwRbZtlVyG8nThMvVHhtqv1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfX4mvvw+HkBHMK
 VLYuRHlzOxSY+Tcx74OvC3nUXWbKvIJvfDxslceribgfnEmpfSkiUJGwW4ur1PnBWy6bly7egus
 i3wTqcRTWCC7Jqe1tYkIFddvUmEjB6xb+6FK/OlMOKfk7espa4iemdyOk5+u8UbZA/oxnNPqvc5
 Mzd102bnd3s0gapHZy6ZeJSQ8INNx3ocEEW85/Rd1QcIZUNx5zH4F/MP6mmjFglo7jF3cajpRAz
 IQp4f11JL7T26qgMpaIBPA32Y1XGBQVqzXQ3JRCxZDwLwCqigftcLgz2bg0ohk/p5C1cjrN92H+
 QDGlRGp5+HgqfXrAYzluLL+ZjYo72C0gKkL9HNqzwNprtZ3OZxMBonC91iE7r0boNltLvAFre9J
 UxsC0DREapJzhyYuWc11wG+iXNor5X0HrmwRujwwQL8dR8Gg43umy5ZhInJZqx4xT66VmeZF+8M
 zOtL/vMiGiZCKhYMX4g==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae0ecd9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=R0rOnUjNbK5cqpqgS9oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270073
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

On 27/10/26 19:13, Daniel P. BerrangÃ© wrote:
> KVM is servicing virtualization use cases which must provide security
> and actively maintained.
> 
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   accel/kvm/kvm-all.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


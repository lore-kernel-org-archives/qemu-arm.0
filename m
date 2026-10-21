Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D06606A319
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 16:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JeNFsb1I;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NBjKnU/9
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJZ5B-0000Xn-K7; Wed, 21 Oct 2026 12:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xJZ4w-0000LR-8j
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 12:22:16 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xJZ4u-0005CL-8s
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 12:22:13 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LGG6hh1095451
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 16:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OlmhvxrzpcEkzmZclPYkH5MqTlejvbrYD4DFnBjBNCg=; b=JeNFsb1Io/XihqV2
 YkE3QNPRuYnjGVkV3MOoFFsMnYFWVr/EDZd/ILsqtD9XTnXp3NHe2EXKuNNxtSjZ
 UyxK8yIVJmVBJTPrnqT3nEHIpdw1eHS9SGcYxLIPT0yT1DyyH10qyShbXJ2Nexfk
 6CiOWfwkJ+/wZtAKRBSXZFw/P2wQWx/pDoc6dcdok2uLb2ueMzDt+5aj4oa2vXNi
 7GSUYvXTyZCu5NQeLILeobEWO3HteWtsNMhooKv6UdJ0h+CUBSzfQ0wVdjccvp34
 NuPHxRn9jx2hHLjM66J33ADmMoc2pFhFqCQr+ugxM54D2bToS5c8gw5A8gYXCTJm
 CYgLMQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r40kk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 16:22:11 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-3510d0baf63so2109973eec.1
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 09:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792599728; x=1793204528; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=OlmhvxrzpcEkzmZclPYkH5MqTlejvbrYD4DFnBjBNCg=;
 b=NBjKnU/9aa1N23Sjq8jYujSf1+gTNoF8IyaL+8HvBaCokzgJeSzWX2VwKTlZ4gR1mC
 7Xp/WaiZf7V/OL0Ktf+iDzoj63ZWJ/Hh3h+4HCYXX76HTw2hek9HtFAMIpNxX3aN9boX
 ql5phNQrIstIRRlNrqKN4bbiPSbaewqcwAL7UL2Kb5dpU2eDU2O9oXofN4GADrf3yuVb
 zrhfCYgii+HyX5lAfByltscdYOAwx/x5zjVBbhxuxln6pCjH1U5eFhrOLDI6c/7B1U6n
 N/wWFgLq/OIN+3cVys7FDcn9CTslxg02bMGprhuDA2dvlVeaRcj6XXLM1MWHHAcIYoa3
 9mPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792599728; x=1793204528;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OlmhvxrzpcEkzmZclPYkH5MqTlejvbrYD4DFnBjBNCg=;
 b=IsylLWxcjTT5COfeRsLCS+cZzdWTcXD1sEO2U4sZOru+NKQVmYrOr3LjA/MeQ75oUW
 ZxZ0Qsk5RR9a4iz40CBodwIGY9FBvojatEybhPRjg+z/YzsVS+r0rdRkDEB92es3nPG4
 njygshaHyyTqdnap5wCHbiPBhu8kde+GKdy+Q71oBUoE7C9yT7TD7VVopxyIGIDA3dv8
 xl530tXT4Yed4cVyLn94B8vrf7sGEuOXvwic3Xoi8B951qLBWbBFs3pn/QrhGV5nHf21
 lVzaFHbDVxmB19PhiKxL6LPL8ncgTLs8z6uzaQZJx5wX2GxJmDdbQzo0xZOI7EPqc3c+
 ftBA==
X-Forwarded-Encrypted: i=1;
 AKwUvBymaONVPdKgN0YwnxinA89O8NgvAwVZT6aa6ImUNdxVoxOc54UUciMCk4PPIGOy1rKC6dUBBN/nyA==@nongnu.org
X-Gm-Message-State: AFq9FYKLLZP6GMukzoJVjTUyESQ14+TMxgExknip2CzqKfmurolv3ojO
 EXIVRYOuyWRoDtSsH/N4cfeld0apsOhDgfk2VLJ6KVaQLrBNGbZv7juWN560Ont6xKQa3sC0Yan
 h+OtO4dHvfowF+DMpMXEYOvtxh8X+NtyJhtl018qHl8ojtniy4PXo1T4=
X-Gm-Gg: AYBFou0iN6oAe0gi2xpR0rhDtIqM2xj5g0EU6qo4t4dFpnlHuQbLO7WWVr8Nil3/aTf
 oEicbQAkOpX+GOcmZcTrWBBL8090JUUFPsZCCerwt1+EU11byrmiIsJ5hHMkx/mEqtRHy/8scY6
 5GYKwwh5XRkjqMeRgW4JIlwLBJXkX/vIsVEcXeBYGqqZUiVu2vh/UkFP4z7OouAtAEan9T3Pmqu
 ZJYcPcCiXmO6W+7Ih9a4vY+v78y9ehD/xM5ctaYtEKPxLEptuGc3RXccRx5WxVM/1H2knvDIily
 wvmFXvBo2WAn8e4AP183QeXxmXjiYp9UvY96PKm+xw4Q5gtE2fftwJKKDbeR/Y8VyTXLdGPozIY
 a9AIQSu/E+zwy4I4ba/MOsjbIcbfbLtrEtbhucNK2y8FPpjeQ7BJiXGyoz16plCpNOl/J+w==
X-Received: by 2002:a05:7300:e70c:b0:351:1bdb:e3b7 with SMTP id
 5a478bee46e88-3674cb37bb2mr3728486eec.15.1792599728445; 
 Wed, 21 Oct 2026 09:22:08 -0700 (PDT)
X-Received: by 2002:a05:7300:e70c:b0:351:1bdb:e3b7 with SMTP id
 5a478bee46e88-3674cb37bb2mr3728444eec.15.1792599727808; 
 Wed, 21 Oct 2026 09:22:07 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-367412b24e3sm7543414eec.19.2026.10.21.09.22.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 09:22:07 -0700 (PDT)
Message-ID: <befaf3fc-1c32-4a5a-906a-d13cf2abcf25@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:22:05 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/33] target/ppc: Dump EBB exceptions names
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
 <20261021031407.24862-20-philmd@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261021031407.24862-20-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8e6b3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=69wJf7TsAAAA:8 a=EUspDBNiAAAA:8 a=4GMrmK1NxY-Qm3nL4oIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-ORIG-GUID: W-Y_p8VjqqTzcXJPsNPIwTJmHgRD3Bbn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfX+Itmp3F8oGxg
 FxqI4RjqoJzxKurrw8h/npcpPLr548dpoQ386yThbjtin++VXD39uHQi0DflgPkrAXFjkrZmcaE
 XKL5gMsQqgvrwOVedquMK/30fdtEwo3ppLUO8lXssGfCX7EvopScHMv+pYe+KnigG8AmvQ5vygE
 YxNC4MwQAypbAsinh5pwwuCXeM8C34Ogpx9jJ7UiIzfTYMwMu+7ss7fpB4+9YZJxOsclfy3z5Pg
 Oalj0TBuasnOMXv003tI0khF1ctsOg323OU2QnTZOPAEM28yrwTjen3vP/Ko1yX/WWANXu/wiN+
 yJdYE/YcKFEgnvKN1Y9x5/G4Lz/sFkKhS5DKQ5WxYUjY3Me8leJKFCyVnXoktmSB1C1C1LAWb0C
 ctZdQmWSC+skzQ9X2MPfPETxUqMNzXrVnxEAhBPlWvGtQLxaKIQQSNm1jUTD3+IUPfRgN13XJ1b
 e3AqrTE/5mNCGzp7+Lg==
X-Proofpoint-GUID: W-Y_p8VjqqTzcXJPsNPIwTJmHgRD3Bbn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NSBTYWx0ZWRfXywx2WuW/9Hxj
 JuXNtqnaixfAOpd4iD9Pt8MyTPNFcwK3B23kAP/9Hbkp3r6FbWs4lCpSeWcGquojQ8JyeDBtiba
 DKDKw3NFtAWzxBdy5fHWyt+4Yn96g1s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210065
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/20/2026 8:13 PM, Philippe Mathieu-Daudé wrote:
> POWERPC_EXCP_PERFM_EBB and POWERPC_EXCP_EXTERNAL_EBB are
> raised on POWER8+ and logged by powerpc_excp() with '-d int',
> reaching g_assert_not_reached().
> 
> Cc: qemu-stable@nongnu.org
> Fixes: cb76bbc43fd ("target/ppc: add PPC_INTERRUPT_EBB and EBB exceptions")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>  target/ppc/excp_helper.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>


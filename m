Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438E5C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 21:53:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiJ9V-0001BI-GS; Fri, 10 Jul 2026 17:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ9U-00018P-BB
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 17:52:56 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ9S-0006Iz-QB
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 17:52:56 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AK3MVp1623064
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 21:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zX/ccb5htWrlRrb+eLS7rdEZ4xEiJqyH++YKHuqmqJU=; b=hFiXrz3bcAGvnQEO
 vioOWSDebk3pbYmN6tjEOy+T469L8735ei1NG5V6BhCJvh/FucLKEexwf3yGeo2Y
 BZI35FqgHRlDxOMmF1X1hBRk0NGHqBqE1zpVttJsvpbelTbyLu7Lii9FMAQr+6CM
 UJ8I2Q6t+1APr0I8k40CMyhKYHiuabNhBuPovslHYFocQuUWalpU99sJrR2AsbGn
 zTzHTbhwSJ1L7bbEivbhTpC5WvG7r7+OxnVbKS9qCenomSwG0k9GeP1PeKwk3M5F
 gp09o7LqRiBoIqeGs7H/AcsReGbmD2gaUJJbN1qt9jkXCDhUcqG7SXJW3h0r9WAe
 PJHuXA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb4rm8vh3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 21:52:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-91931144870so138566985a.1
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 14:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783720372; x=1784325172; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zX/ccb5htWrlRrb+eLS7rdEZ4xEiJqyH++YKHuqmqJU=;
 b=S37DKAfqQixrTRGd4YNc+Aztdq/nedYzis4gi9gSnQUHSn+gPSq3jUN/nCdzFANyhS
 pCmKpLcnxWGJB6VjbzvJM21e1C+6RJ9GnDOlx6MIjrx6zKnJwTHv+RA3HjrwpGldNARS
 n0Fu3E+tUkE2BfmtXMBgQswkB9EJvZWnHPl7fu+JJRSoxgnOZR7HVL92XQPtIy/aO5Vc
 IGorhwc+sGJmcI9TioKVAgHAUX7Wg2e6FYH4XN75aJoiC3nMzyx3CSEL80axghEn3Wjb
 AnD8HMh/KX3iWdtBpdV+Wng0ZYji2lszO8lzBGHPpeLletgUlg1Tgove/eRDXJ7bSAN7
 Y61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783720372; x=1784325172;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zX/ccb5htWrlRrb+eLS7rdEZ4xEiJqyH++YKHuqmqJU=;
 b=TEqlhJYtbBNl3p+ypkNJ24tq40KIf4OBiiXaIoZcPsacWog9DJi9oNCmeJpkODUrBG
 Zt5SzCNOobVnscP+iKQXPzE7/ZWko37VKWKbSsjXsRNtA5IkUMnejcHkvLxnACXa1Skn
 +jK8rKKdegxqq9fcePNshq92BDfzFPlteZGHJI/7hI+ZKbTo0YiimPOD1dtAXdxxfjXK
 610xddv/bkcN5MUTDvVkw9NMOVsA7S2XHKfWi+djUbEdfM9OqQS+ynoZKf9O1zjCVRwC
 yCXvlC8cH4LN2PI9YO7T1342L9gjGHovirq61OViiL9jsnGMWRfy2Q+FvIGt6AZSfUZs
 vYFg==
X-Gm-Message-State: AOJu0YyVX7jk0CaIAgVNENclFgGM/ixkKeT4Cwwpvc9XUXAwfA3U4vc8
 jEPNNE0Xgkx12MEddTU5SCi7IgBDlEYdDaCHHpb2XcWhOgTmKQ3+cy1Wlau7w4qlIdM8k4nNEzc
 0Z8PHKzGrMsiZ2Q7tBHkMcMrToCB90Fkdwv8ZlbtUMrro3ZLMvcij28c=
X-Gm-Gg: AfdE7cnwBUeuX1eGIFdAoLCDACsieY4dIaBdwhbysPVTo4VlcKDibzGEbWkmaCbJ705
 3qb6SF6ccRReRoqWh9Dx+auqmGpYv78hh7I+NZdLXsOvDXioy/L4Rh+VZLmkUt/4T08XL2CHXyI
 llFKsk7YZNFsDcddb9c4TTyfsm49a4yYtnCyFl3o/M6VENGGs4JWgLNRaGYNgqcIAornRdlxmQk
 6+uHzjmfoDkQ+N+FbJY/SbF/1MFEHMOKIT3tgLnTxqndW1Jhe8h1gBVVITxz4yuleeojMeUSaf1
 6bT2FgKibokmVC7BU8lvXZQHFWt1lLbIECdqCSiO0Gwqdj5LsrIVv58n8RIuDMc3BzIr+LB1/YH
 BVUg+nUw8DilSDfnA52pcdlCuUZawkKjDRgD4GGpVByHxq0T82c1kDYMvAz6ZHw==
X-Received: by 2002:ac8:7f8c:0:b0:51c:135a:5b49 with SMTP id
 d75a77b69052e-51cbf0468ccmr8562081cf.4.1783720372067; 
 Fri, 10 Jul 2026 14:52:52 -0700 (PDT)
X-Received: by 2002:ac8:7f8c:0:b0:51c:135a:5b49 with SMTP id
 d75a77b69052e-51cbf0468ccmr8560311cf.4.1783720366798; 
 Fri, 10 Jul 2026 14:52:46 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6ccaf1sm293795655e9.2.2026.07.10.14.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 14:52:45 -0700 (PDT)
Message-ID: <29a22377-5e83-41eb-a327-97c4c84002b9@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 23:52:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/51] gdbstub: Report actual watchpoint trigger address
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-18-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -6l-9G02Wn_xmZLjzqWrqMPaZd_rTDDz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIxOSBTYWx0ZWRfX+RuUOgKC0cyF
 ySWd6T0SV/oRtCFkLG4uO/fQSjufrDvXEezlJiTvGSS0FWuNlFDd1Srjrt540WW73GEfyO8QnYk
 0lW3EyaJnTPrkl2Yq4o4J/+YqAggdYa3mvhvUxaYLFhIn2xFuJaH/XZllALwNu85t7opo9PriAA
 ZGoEyl57+8Kp5Xr3JBTJkAQs4d6+ImdsreauBA9oLbVZNVqG2WwOjDzFyVAAo+9C+4+XOpqdyQ5
 /wBlujRCMjP6C51CD8qYx5xFQUNG+MG5TNc6Lok6p7KeiSjLXP92f9DrF0NNUWDoVnYPLNOyM03
 VNKtuBeYMb4P1op998RWX/aLfciURurn51c/F14LePatm4rO2EypQjjKdd7x7MRYBAP94ljmnER
 3RDWLlNNIVkUDKEc4eAJv7NvE/WJO/PgdIosAQCWc3xqcKZoBQ86NCKKF1HRJAbuYtLJ0V6g9t/
 hxO3x65QrAbiAQ76rpw==
X-Authority-Analysis: v=2.4 cv=JIYLdcKb c=1 sm=1 tr=0 ts=6a5169b5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ge5hdUQLQkj_eIuYbJEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: -6l-9G02Wn_xmZLjzqWrqMPaZd_rTDDz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIxOSBTYWx0ZWRfX42jxbUFO9RuT
 QGwA1lXYXrpa/mNWhapuKpJReysmS+SpNA5O0ypSJi5DsONQpNGTR/2+zUHmQKY6ozxp1joIov8
 RAEGVORguGJNSJG+A5kB1i468a4lboA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100219
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
> While gdb doesn't care either way, it seems more correct to
> report the address of the watchpoint hit, rather than the
> beginning of the watchpoint region.
> 
> Adjust all virtualization hosts which construct a dummy
> CPUWatchpoint structure.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   gdbstub/system.c       | 4 ++--
>   target/arm/hvf/hvf.c   | 1 +
>   target/arm/kvm.c       | 1 +
>   target/i386/kvm/kvm.c  | 4 ++--
>   target/ppc/kvm.c       | 4 ++--
>   target/s390x/kvm/kvm.c | 2 +-
>   6 files changed, 9 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


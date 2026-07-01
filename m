Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10108C43458
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Jul 2026 06:34:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weoWY-00040l-UW; Wed, 01 Jul 2026 02:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weoWS-0003zD-Hw
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 02:34:13 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weoWR-0002FR-2d
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 02:34:12 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6615lWqs066035
 for <qemu-arm@nongnu.org>; Wed, 1 Jul 2026 06:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 d0pnVWhEsVq7YT/Qga9RXWsjPnzzjQIBkMTUUnigOOw=; b=Vp7ebSsisCuihsCT
 F97oMhSplnxQndpDjUg5kbyCbCWDDsaAKLG5lY4OoWw+DQ0xFcGpB4FgAdShA/I1
 IfeMjYoF2cEcOuEaCvnvCvL9tTRMrf6XKvEfDd7exzQbaC+BAtwzuL8fPPb8ZEKl
 Paljf9B1YS5AkvrsS95AG4W5Lz7oYrGqfSou4sxBND0VNFShm3aIQ8TKQOA20FOX
 yJQUGd6BJ1g2JMdWads6oVPoSRijVKxjjALF/o9+Cbtbl4vEWqnqGGKRt8caScLF
 TQPYvg9Vwc22wvoxdiRydg4W0yRO5IRV7/gn7o7uKorMv/m5xg8PrXiHgjUhAHKT
 bLBxRQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jtqjm8p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 01 Jul 2026 06:34:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-9203d077d77so58668385a.2
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 23:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782887649; x=1783492449; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=d0pnVWhEsVq7YT/Qga9RXWsjPnzzjQIBkMTUUnigOOw=;
 b=HhmZRD8Y/+0M6CZvldoRSwytPFbfmsjCH+BLZNAFpjsgoPpPwTx9YiWp9IqPC5G9KJ
 0A9QaUWPxAgBfo9m8DPb10mvxZUGW5iYKpYphC8g0m7WQnnAvB++U9yve3f6XCfE27Nl
 zVkmSppHIrHBU6ejwtfKDbipaxecTSvR9leD3sUowaZ3wZkmTKxZjBvAo0nBDBxBFLYN
 vEpgDIghPuMTaxroKRJE+D8fMMNoQc7t80Hj2bl174aF39VpQq58nRsenHH867i20gkW
 kbyMHVKJraFc7zVgNCif1h3By7OX1NycsfbNItjn1Ij2fsOpjm01so98XkjUuwn0bCgb
 vPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782887649; x=1783492449;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=d0pnVWhEsVq7YT/Qga9RXWsjPnzzjQIBkMTUUnigOOw=;
 b=pLW73FL9Sq2cSc6iDXtvibtZbIpGX4u05Pp0LhOMxeCJUr7VkQ7PyyBCGezt3SSfva
 X9Ra0nd767lMwKI7RKU4RH5Rz+kdU1MztIzBGHOTf9E2+U9H46pza7wdpsUUi8Qltpfn
 UoPPlJYM7q7LfOXpzQgQidJeMaEBf3wnbQ7B3s5Wp4iwF0dJ3+xZC3TkGI787h4xcasd
 B1OfVp3Lpuu5BttiQbDYzAQLEO7WQsgr0cqQuWYSZopNwwQD7XVLC6xOVwt9dnvYrZf5
 d07jzUNM7DSzXFcMAt0B3dHl0rplzg3I0dzn7N1dlDoimmML72WZf+xzuvZetZc12Kyn
 RnNA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/J9YPMbXdDFzDdUXEIbtaNTBbbsAPaHO4SckTspyATQJOIRC6sa9eIGJXhs+m/4CwdRGddWbYlsQ==@nongnu.org
X-Gm-Message-State: AOJu0YyoqO07+9Ra0NMlGayLazNx5au4EIqlocFeMRn38xhwhcke+v+4
 4ZwaHmb6oShKSVXXUiNieb83JrVaMwJqUzSESIJCsTX8EYJA/tKiwZOhaE7TNRVXH1H11IJyrBH
 UXoZjhpaMiDUbiUSisH/ZSD/ElqNU10MopBirruosAQkx86iagJgQ7sMCw+rbVvA=
X-Gm-Gg: AfdE7ckwpl0twJEjXrSepbu0BJBmdRwKhwRjP/TK9kcEbIqtHtgjqybdbM+C0rB49tW
 KKxjh0I2DEeKg+9Z+n2SArycdVM3qdugiZzDmMdcAka/5mvbB5C0gEojSaioHM3i98ecwdSFSZX
 TOVgtTFm8L4Udpkrs5sxNWQaBMtnZbZI8KZ9yAkUDaPmb1bb27EY7HfRwNVHFQPGsjZ+vvmk4l8
 jEUfgLcxaLUESnlQMMye2KYjgXo4iu9DmAGQcowRGKwEopLA4Clevph5IXcfEcRtK7onZrqlatA
 YgW80dOlAbDJFevsv4e9DOLAqVIEHY/nV3B/CSHFb4FqBqcF90MQZIguymxpxdPusZ29VwkfsQG
 9LII5FyBWs7U1NCWMneIE1jUIfaazCVPYBOR3OXIrGYs2ya5SlwadhuDVUNtw2w==
X-Received: by 2002:a05:620a:410c:b0:92b:6805:917f with SMTP id
 af79cd13be357-92e785438d6mr48673885a.71.1782887648848; 
 Tue, 30 Jun 2026 23:34:08 -0700 (PDT)
X-Received: by 2002:a05:620a:410c:b0:92b:6805:917f with SMTP id
 af79cd13be357-92e785438d6mr48671985a.71.1782887648408; 
 Tue, 30 Jun 2026 23:34:08 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493bfc32992sm39108355e9.11.2026.06.30.23.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 23:34:07 -0700 (PDT)
Message-ID: <16e61e6c-79d7-4764-b418-2a0f1bd482ce@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 08:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] accel/tcg: Constify CPUWatchpoint for
 debug_check_watchpoint
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
 <20260701030443.1382447-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260701030443.1382447-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kNKSxeXVm38MsWgS6fAdE2tlAK36DGNe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA2NiBTYWx0ZWRfX7FEqCwcppBYE
 RDKXA6i6A31GQq+bnJFhZBN0yFFaMmzG6ucMcWf6+nuC8SnJd3Eoj55A7FAnOSr2kQSZArXhDoA
 /PT1wWTZo9WKceySLYy8zYGjopTh8H8783H+R4n9VrCec2H7DeBvLG3ZslyPQAne+b5gRIL1iQ+
 j0IHaG2DeokRQDaxN1JfSO5lq3tttAUqDRMQS7QrF0kQgEybIVeFXwal+UkkwLy9oGVLxd7R1yU
 D0aecZ5ZNI3OwNa7a/jrJ5RkTBDef6AOcYaf7SR/KSeWpxn/bkemMJE6likNp1aHKwo8aXZacxi
 2PIHjvyc0lCMfgCSXDqeJ7x0L8rP6T7ng/6Co0tl3ikjlUHq121C3e3HVSuC8mj2aPjEXHRkp2t
 ML0w4DiHHCKClJf+4zTJOnOas9IF1xkEcuem1dEMkENCQmxQRg3BgEJ4ZQhbGIsmM7V3TdpAlLn
 B6w4rJcnf6pmTiaMvgA==
X-Proofpoint-GUID: kNKSxeXVm38MsWgS6fAdE2tlAK36DGNe
X-Authority-Analysis: v=2.4 cv=LIZWhpW9 c=1 sm=1 tr=0 ts=6a44b4e1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA2NiBTYWx0ZWRfX0bku+wxuoJ1b
 Qm6M9F89JbnyHeHSbA3gsKKZcHzTzNjKxLk26Zc6N83BULtnLAlKy0+uk0wqSsPuuOuHat3jw5q
 5HixeJ7RQas6qWegyuo7/hL5uIbaJ44=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010066
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

On 1/7/26 05:04, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/accel/tcg/cpu-ops.h  | 2 +-
>   target/arm/internals.h       | 2 +-
>   target/ppc/internal.h        | 2 +-
>   target/riscv/debug.h         | 2 +-
>   target/arm/tcg/debug.c       | 2 +-
>   target/ppc/tcg-excp_helper.c | 2 +-
>   target/riscv/debug.c         | 2 +-
>   7 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


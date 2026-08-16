Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A58C5DF66
	for <qemu-arm@archiver.kernel.org>; Sun, 16 Aug 2026 09:06:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvWoS-0004Rz-7E; Sun, 16 Aug 2026 05:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvWoP-0004RU-TB
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 05:05:50 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvWoO-0000L1-DI
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 05:05:49 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67G7jh8N2800218
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 09:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 77LeBJ+22Eapc1K3oRR7nbu1P891lTBRsoTsMkhlZuo=; b=nD+Xb4YVYQ87bNhP
 bHyvpRpc+pO/XFixO9eAR7KgY3ui91WXODpSiLpNVOIUNGjs8ghic/W18oFgkq3w
 6HuQ701PSs6UHGOQQIQoFEWpX8lpXMxEv9WNkjToylk5ihonI4bH5Rd8IhRO4tF7
 uBYmzvNWgFtdlceyY5oaGj9/DLiv+KxXhNfIrNEjQb/So6E5LmgH4atyBYaN933Y
 jbXBPLS+rX+j/ubXmktPAl+zcptkRlOFLzdJt41fKOONGh4UMvq9WLWbsxyq6BG8
 SBxjBqEV6Ym90woJk0YysvxE6z+vxXZVaylBVFwpkOOCsTMHr9LMlT25udJKdutr
 OyG7Fw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghf34ev-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 09:05:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-52ce3c7cb2eso43740771cf.3
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 02:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786871146; x=1787475946; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=77LeBJ+22Eapc1K3oRR7nbu1P891lTBRsoTsMkhlZuo=;
 b=H3ITiXrZdijM6Eghr5rpz7jXwpE2KVNPy8VJ2ZqS9p4dg3os6xEZG98lMcv0dMhz5r
 Dg8u/+G+V1Zgl819y3Pm8EKL5GdXniu2o5aWcVN+OjOdKhY3lCgo35IV+1TTlp/zYe+p
 IsDMihEkwzd1DXEhos5uw9Z0SKghemNamCQqdEGMZRiEWH0CK+rGjrtszJm+iELjrYvq
 0wcqgw2MAqc7wbb6Asd/plRedzoa1mMPUXJDaPY6hq3dVI//uA/5Llidv/hqpwclsqso
 C5+9UOnKySZmApPFqhHy/njHnKPAt/OaKZz/OpXrf8ya0rdeQ/nOdn20/vhUNzeJsugn
 bgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786871146; x=1787475946;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=77LeBJ+22Eapc1K3oRR7nbu1P891lTBRsoTsMkhlZuo=;
 b=Bz7xDAB35TTnpRaww+tNw5ENaRAN2OuU6i09XZqwxj+j2xwBl6NSRjRWWCq4MuaLTd
 exsiOcJV8COUzAdDAOggYSeUSpabAiMqhQcAX1NojAUJ3OzA54ugwzL59bHZkKQWalE8
 SV81EtYioEOZv3zhKsBQcvLxaalBzTpHBtKtRVQhvfhiLV6RLstIEdzGIcN3y8nhgzkf
 rdwVBvLPiup8gEWWoAnF4ijJCCCcCpC12SPlrKKLWNO28fyJ/Zd8mk+H5nRvfJELoRZH
 OnbmqquFhAoHxOcDBwisakDN66X9oz356Z1zwq4t+/HLvHW6N3BIzBlwycc8y7pp9qPu
 cKKA==
X-Gm-Message-State: AOJu0YwZzAZX8V0k5L1nSnDkqat2mEogtYOfRjX7lqU0WlUhQhwqF0jB
 RycbarSv3uBmmPT2R5pbG+xaRIo2RxXwjkdjeahjAqqwC4+jTkpguvhE5/mATh/9S2xfHe35vqT
 FuhrjtuAb+SZ/XtpEX6WDSwSWs6n/whLefRekAP7174KvWvijWiiM8z0=
X-Gm-Gg: AR+sD11FoFAsAapDAuoVTRxfMOzShSY75unZcrmqjJEZ7SKKo8Hk8EMlnfNJMZyt1bi
 KWboqR6039iRTZc0VGqZHSYPEp1mQisKgK+RSKnJl7j3WwDTcirBcw4CMIFQzKGgJxXjekVZpdb
 65peXvkLTOgyn6xCENGB7+lnj0DcZPcJN0CSOxstomi7R+th6Dor+LxqaTn1AuejbCDXL72y4w6
 PngAwfQaAen4a4Nbvfcitn6ULdb4IXiKXQe9zFia3NkXKWtydDmt8x5c2dqNXl89BHc2dBQBmUS
 qe74EYa+dmChWKwzx278LMsvVStNmeMNkLHwO2HiLa3Sde5/jKcxBSMEJ6D5jZkvMp2LeHYUIZd
 C/o5wGGYYXnMExfguePESuVouO+D0dHCX+0s=
X-Received: by 2002:a05:622a:40c8:b0:527:7842:72cc with SMTP id
 d75a77b69052e-52d854e5526mr203053591cf.39.1786871146680; 
 Sun, 16 Aug 2026 02:05:46 -0700 (PDT)
X-Received: by 2002:a05:622a:40c8:b0:527:7842:72cc with SMTP id
 d75a77b69052e-52d854e5526mr203053341cf.39.1786871146355; 
 Sun, 16 Aug 2026 02:05:46 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2b1f90sm21758169f8f.18.2026.08.16.02.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 02:05:45 -0700 (PDT)
Message-ID: <701c7946-1396-447b-8fff-2e17fdf5bfcc@oss.qualcomm.com>
Date: Sun, 16 Aug 2026 11:05:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/18] accel/tcg: Drop fault_size from user-only
 probe_access_internal
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260815203730.1468365-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QsVuG1yd c=1 sm=1 tr=0 ts=6a817d6b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=F4whdlzREtsA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HKHXfU3RXsnfhBO0fisDvMbu0PBzEDEV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDA2NiBTYWx0ZWRfXwpxKpYMgSJIe
 RKmFTQclGZ10jCse92I1EyhRoC1UorPG9qs1bAOIiyCB4hHFtzYxQj3PS3nWUN+UEef8eavfahJ
 27gSiHzDs6tiOzqjsN6hdeNldW9tHNOa3KGTj9EKGPu7+yBNnkAkxlVBURn2RImk6VfsUmRleit
 Ugzk9U7ni/4Z5T3744ED+pWjEsWZ6GhE5WIMr0/UHEir5TKIXVmJ2pbJOye4Po3Pvp6SurZOa7T
 I/vM7osKTC2FGAN4nNBEyqxGKWQT6XRiQXBh16nL7CrilCoKgKj+sC9osmYPQf31Zn5K+tUCe/8
 mET5wMtxqWTiZ1ZWE/ioorYOIka2k9NL1MC6fishZmuGW5aJcRkNKws/A7cYQnCShz4vIytHJ8u
 fn8Qf5XIKPoiet45GS9wwvSndDcl5vDV/OWv1x1kNlu0bKyp1t3D6lkWwSeOanDssHJViwLBkde
 lf3v+iQK2CbUOipvchA==
X-Proofpoint-ORIG-GUID: HKHXfU3RXsnfhBO0fisDvMbu0PBzEDEV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDA2NiBTYWx0ZWRfX5rgHxGju6lFQ
 vDW6zPvvZRFxUzVhsvMAliYDoaNKpLGKMTTgfFGy6G9jwyWibN2ffChBRr1TZW/ySeBDA/1w6JI
 T2kslGpU9qt1XJ8iQuqRR0tHPpD1y5U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160066
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 15/8/26 22:37, Richard Henderson wrote:
> This argument is unused.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/user-exec.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


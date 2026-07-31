Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C260C55167
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 06:10:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpgSJ-0004vW-RE; Fri, 31 Jul 2026 02:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wpgSH-0004tp-OR
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 02:10:49 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wpgSF-0004dh-RS
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 02:10:48 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66V4v4QM3259591
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 06:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3VQ5v4Cl5+KDDSQSkvxb4ZSRbn5yJJyBI5nrrIbtRvg=; b=GZJrBg00hwDU4BMg
 YuEbbyODqgYNverZ6L/l2S5F9tKIrS58BhcVEDFUEwKZFZGXKOooIubL4KCHR6nY
 2Ebi59XuUR5thXdeuX8hldTiLBKTUrFlxwQYr+Gjw4f2v4doqU19va57bnsZIVkC
 AL3uYhotKaGwx8jt9m/VDMTPm9FVfJT7FBx2yCgSIldwXLIKD9I2fNy8jUb4HGzz
 7TH9ZWAZnUltZba57SSii75mSqi18hX5A4MdUC5wwxo/Aa+s/OKSTd0MR1lqZ+LH
 KmqFFDC/rkhu4LIqQmSviP6MC+C640awTbbL2+zn6kOKksHNbyLlBSUgSlHMgANo
 v9f0cQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frn0b08kf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 06:10:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51a8b0a08d2so4813131cf.0
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 23:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785478246; x=1786083046; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3VQ5v4Cl5+KDDSQSkvxb4ZSRbn5yJJyBI5nrrIbtRvg=;
 b=Zqjy79EKmyA+LrdceGhCMaVkTJhJUHKk02kYkUlUetAPjryIccx0cpyjwfT5KZGRyM
 Tjey3X2uy+rCB9JZ1ryTyTWURIMX/cOfip4qLopgI9Y+kb3ZvlCyvOzMk+LLkJFGVVxO
 WHmAetF5MuhusWGYoayNjjoMy817xe+mxGYvpJtWwJF+mH381kLgolxpP3kYnkV0WyIS
 BISwwlpmG7h3qT/qezVt/qggXJ2RJx/4Pz+H+oziqj8hY/r4D9AKV3rB9szEtztepRD9
 9aqe8/efMeQlXSISGE/b58u0EvDtqP3tJRHAjGnXqzMZKBu7KXOQyiKECp7yF1HkckM4
 5Z7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785478246; x=1786083046;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3VQ5v4Cl5+KDDSQSkvxb4ZSRbn5yJJyBI5nrrIbtRvg=;
 b=FmOishCiSNhaA4HKLpCfhE+1RvFrG36iFzV+52iokMtv0LabVrjrXzIJUQ0hULcEci
 to1CM4gFfI85+eFiDiEe8KJez5jZyJRv9E2oEpOACYivZvGJUuguXJVN0HCi8DbcVeZm
 KSYNPIsCyAen31bWANTl5grqvvSgKuT02UCcmxsonXOK3jFyiS24db7gA//im+WK1EPv
 D6LZarLQs9qJmjqfo3zqNWchrohcSo6/e8MjCR0tNsoc63g+8oW0/FbUh4kv/NnOYs6A
 cNVnzyeNGHxWt6BDJ262xN2Gl6hatN+k8wwhr1sitgo1x+9AAYDINpnslffoLpcblryh
 u+Yg==
X-Forwarded-Encrypted: i=1;
 AHgh+RolKAE0fEuRDZxSzNP8+D+jF9OwzMN8e1fOW4UUYWei6H4v+xL57LoHHE7zimRFtuD+EpHfqOPvjw==@nongnu.org
X-Gm-Message-State: AOJu0YzShOH4WqCgwGWjA+cTtm8hwgfRcO2SE6HoK7HRFb2BgGW1cVZv
 6cB44o6zjuQUul6PmmzVXySpymND59KomVtxEwd9EnaREuX/dnqnZsbozy/ghGGEs56nlpADeVh
 A9S+mxXx27DzGZQqVqfHS1IXrWC+eNWjj0tmTG9gkV5FpUOuqCemHmU3e3FSOHwA=
X-Gm-Gg: AR+sD10FtSlf99p2jM1f4cpa5sgy+zYZoax/YL41hj0nrohXolSM8B24kFicJZ1mu++
 EOd/qq+doOZVrnXkPnEggXOxw5neYSQLlvm23GmIb0W8VsYOe2jgQ9Qy/4wLFOGiWSYH7ln4vCT
 XozNIYtJzPmMKy4zsBBSUTVtxFtCxhmkQMLRFKqasbxGLYU1LpIlnUOaQUCCALtX/sJPEmbJyxb
 Mv31EWXP8iTTFjwxZEKRtkkqcKgzKHCuEDdCdMGSXiSBrrDx1/tjtP++MIlBw1PciPMkvi/9dXT
 uVRS1JSOBvH/jj2ai9OyV5tBnmcOeu9UCNgGmFKOlb0ddmXlaUeu1BVdRXwsTaeXKzsMbYkV15o
 qDRm+TzJnhTm+UzRXhituc47KSeHyS/ccd3jfDJv+5J4fNnX197A=
X-Received: by 2002:a05:622a:c3:b0:517:6b31:8058 with SMTP id
 d75a77b69052e-52b4b074af5mr7476451cf.40.1785478245817; 
 Thu, 30 Jul 2026 23:10:45 -0700 (PDT)
X-Received: by 2002:a05:622a:c3:b0:517:6b31:8058 with SMTP id
 d75a77b69052e-52b4b074af5mr7476151cf.40.1785478245397; 
 Thu, 30 Jul 2026 23:10:45 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd41e2961sm979666f8f.13.2026.07.30.23.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 23:10:44 -0700 (PDT)
Message-ID: <3bc2fed6-dcae-4735-849c-1bdc06c127fd@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 08:10:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] target/loongarch: Use generic tcg_gen_revbit*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, qemu-arm@nongnu.org, git@xen0n.name, 17746591750@163.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, philmd@mailo.com
References: <20260731000503.170446-1-richard.henderson@linaro.org>
 <20260731000503.170446-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260731000503.170446-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfX34hRdPWx5Hwi
 aT6xCWJnODxwvEPotht9Be2+/nvzGTDGv3812H/+Ru+EDFznvfBmztGUNrUUcUDTMqHgmmVThw8
 kLnFtTfreYthQDbh6/ckf2GK6mcnaAE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfX/L7JzQw9Ecv2
 jz+bXaUaR8+w1Sh3TRftXveo8B4rrl6QZXFjUj/aOrFt58HPV3+0FxHWPwtilPRG0q8cakeaQUO
 xo4cPLlWllNDWKx5LBARoawj0qdvQ9RHeHBpEpuXWekz1rWLE0K7i8g9MZS+hT8LbhK9rsAPA6J
 9s2LHyLDE3j6G9x/U1L0gAkndZu8NFv3riO2B6vL7Ea8MQUrZOx53136Xp05Ob1hIScBS14xXuE
 fkiAD+iBvJh0a+zu1Le2waRyhxGlRPAjvWddATSOMHVC8JoTewZdpLwzh54nbuWdxvPvcEbYCPi
 9IfWt9gS/BUcC3BFiftwcQT+9LJij0BPFT4cz82V1TU93N2D3Vqc1GSOTYMkF6OTpsZ8yz84rgE
 /sCreZheepgkJSO8ZixZewrAnJB2W9sDAKvWA8j/ygQ3uqjZnaULbFc+KtO0nn5XZZJyuAGf7w9
 tsqJWMiawYN3E5L7ibg==
X-Proofpoint-GUID: rm3gWhdm7dZ-kzeSBiDtyixTAZ5IuVox
X-Proofpoint-ORIG-GUID: rm3gWhdm7dZ-kzeSBiDtyixTAZ5IuVox
X-Authority-Analysis: v=2.4 cv=Tv3WQjXh c=1 sm=1 tr=0 ts=6a6c3c66 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZHt8mgqs0VnmK-j-M60A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310040
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 31/7/26 02:04, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/loongarch/tcg/helper.h                   |  2 --
>   target/loongarch/tcg/op_helper.c                | 10 ----------
>   target/loongarch/tcg/insn_trans/trans_bit.c.inc |  9 +++++++--
>   3 files changed, 7 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


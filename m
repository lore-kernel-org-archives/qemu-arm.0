Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16101C5B572
	for <qemu-arm@archiver.kernel.org>; Sun, 16 Aug 2026 09:19:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvX1J-0007Az-Jw; Sun, 16 Aug 2026 05:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvX1A-00077L-1X
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 05:19:05 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvX18-0002NV-JP
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 05:18:59 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67G72NPr2630384
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 09:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TxJbK1Jx5j1SAJ/XVnxEVC6s/YuoULEmD2jLDkXYyxg=; b=FN+clObHHz71CuOi
 hDOo7HPRP09ySlOlOhh7SCbTCxEqhmSVrNvp1ndk8Z/IBWhpsdw2RkzYmVlTe7Ud
 SD01KG1G6qAIoAtLI3GjMFKEdgFAao4BHKNNpgB9yVmHpVsSF2y9t9hBKKowyBic
 Dh5t+u9HjL2s6kaETdelWaypG4xNPdFd9ts4ynZU/A3nK9lWXjpnQKaG4bCm4teg
 EKNceO4zpGSXYhXQEVmNEZGoR1rehjX8K+MOiexSFEdqVraJ1SQdB9PL+2j+pQrD
 f/rsDxWOLxwEAV0yi+Vz/myLySGdJVL/BlblvuGyNf5KQRyXSHCfHiX0gOuPu+Av
 Gd045A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghk35mm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 09:18:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c21c01cf3so46539761cf.2
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 02:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786871937; x=1787476737; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=TxJbK1Jx5j1SAJ/XVnxEVC6s/YuoULEmD2jLDkXYyxg=;
 b=Kqus/8/vo39rUrhSLm2vWbtHp4fIE/WqKP6gNpFXJnxQLFlsVeb/gBf+bswgHhcTkE
 kaNZDiMUUzrW08UZdnY3rd8aogX5qIv5RQ7AcIoweHA7SgHQKIcEylhg5wagxFOq+CEM
 TIKR8apcT+ynOS1FCAGQ274KMaTVfYyM0UPcpmVPj0BecqCXqIYVYEoK0YEN6ypdPOzh
 V0VUzQ5mETQestlimdD2LBb9Yx5AVhy8p4KWunpAAEGxUv199EvHzpKpR1qPeEeXPJZ3
 qapmOiMqRMHtSfItd6YVizHsNchKpE1UCXtVuwzfAiTcY5hkRzMvmvA5bKwGe+mBoPen
 tzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786871937; x=1787476737;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TxJbK1Jx5j1SAJ/XVnxEVC6s/YuoULEmD2jLDkXYyxg=;
 b=oMWX72GnlIUGwdVk1Je2947jSCMOqyVe2+ilZkuLHsrSgA8QRFiXWP9ry388v7OLn+
 qHGlNStQxpxpINfJ7K0PEMpqBw+jq1aSdPrTiklq7StidX41vIBmYwOBwLx+kBKuSrAS
 9adkAngE8St2C8id49ThxshIr8d4XX3yRm7kdS4CfMtlYM3G5TEoPLD0rG4Z8ZycOmo5
 mh526a7uSdYEyZEjv4vlc3e2lkeFbQ+rZ3+81vyxVmpEjfEWeJ9mvUs7Lyw6d7V5JezM
 ExH7oerrabxZGKSNLwpWqcwIZYzYPY1k1wBdkIqitlvsQKrjjflF+27RU/pyamHJbjD6
 CrcQ==
X-Gm-Message-State: AOJu0Ywg7StqiVGnXMGaFJo6Ym6Dqdt7bNxSyXiys+EUiJK2mJIY/K0J
 InVHQ1vouMHA/0fvs3qUjXAXQBY/ahW58r3t3mc+XMgJcb6Vg0YOl0LIhhwbdar6eqN/KekMASg
 nhaG9EZAsX8W1UyEUNuCZ5ecyWs7W3ZKDj3kS8/Ag0Zmj/ck9caobv3pwiKpNlE8=
X-Gm-Gg: AR+sD12djr5BQ3FtotfTO845JONBvelixbSr5c846xfUyQIt2mdzwpCfviQqa8we3q3
 aBTBswduInbPN1BV1jVMuNie9Tl+wg7wXawFzcNoT65NisI1UeF9Wm7my+0EGxcbsIs3g6cY5Ve
 1VZK4PYR9yxANal/Zm7lifPwnDf8ePwmOmzm28ELaYhpKewtgrVY2ifagbXvN+dW6H3eURk9m0n
 0WcUnTSZ/d0SNsHDVsquVS3Qp4+P4jT170AM/zk7wxeULg9eycZtuwH7Rpk5oPZjqoWIGqgreBs
 +RPLA6oqBUmrsdpC5shJpW2mfhUOHVvt5bJzxNYf6H6fK2OkHttBWyeozzajNiOu7GOpFHQ+1NQ
 nBNUUzOA96GE5qsloGDwebWEkTOpKR8L957k=
X-Received: by 2002:a05:622a:14b:b0:52b:4e1f:941d with SMTP id
 d75a77b69052e-52d8530dbc7mr187279441cf.6.1786871937039; 
 Sun, 16 Aug 2026 02:18:57 -0700 (PDT)
X-Received: by 2002:a05:622a:14b:b0:52b:4e1f:941d with SMTP id
 d75a77b69052e-52d8530dbc7mr187279191cf.6.1786871936690; 
 Sun, 16 Aug 2026 02:18:56 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49996100082sm45762395e9.2.2026.08.16.02.18.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 02:18:56 -0700 (PDT)
Message-ID: <942483b0-8009-4e23-b192-f36a10b40e1a@oss.qualcomm.com>
Date: Sun, 16 Aug 2026 11:18:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/18] accel/tcg: Allow phost to be NULL in
 probe_access_flags
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260815203730.1468365-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDA2OSBTYWx0ZWRfXxXsfP8xT00Tm
 KE71kx1z1kvTBKSr10XvLGeqc9fanngCJEX0Ee6p5loNIrRY9LirznAv7eGdR+Ou8RswDSr2FOF
 3rAZA7lMJhrGgKnWZhGdIs/kIv7Pahg=
X-Proofpoint-GUID: INtN-YKsDRDEsLhHhVsqmkj6AmUMBYEc
X-Authority-Analysis: v=2.4 cv=f+14wuyM c=1 sm=1 tr=0 ts=6a818081 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDA2OSBTYWx0ZWRfX8L8aV2KzqvAK
 3NEWVrZ1wmoyYxyc2fTE75Q6YKL7daurclBaLcziD2r9tlkpHtUCgDKLYnF+0IYUn6K/cnvg/ZS
 yYTiUF1AsqSfZw6ChuThVNcBL8FWgr1oPTAukJRaAhmHcJERmOw51kgqDJx1wBq+LKf6ZMTHMZ6
 /ZF65RdxjdEPzB6qNSZtGr9kh7KCSM+LxZN/pBakmIc847TmQMnQsgwNyPWuO/JOmFAW+FlcWt5
 k6z7IDF+h94yIg1CjQMip5LTXd7Xm0F0c4FEkV42sVfbLkyIhYrZ2mnhcmgdmVQ+unnBwi/JZrx
 4U8F+CyiV0kukWCikg5Ac3qVUga7DHxcsiqjklB1q+j0uxrV1XBDmkRr0ilFp/cOf2nqcNBhOx0
 MepNJOl4SnBmaopnZ+WFUvUmwnbEZYIM+AEFjvGkUbuFleMeo2q81KgFTAUvJMfIbWhlqqcWt9E
 AKLBnXv6tezfe8O4tPw==
X-Proofpoint-ORIG-GUID: INtN-YKsDRDEsLhHhVsqmkj6AmUMBYEc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160069
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

On 15/8/26 22:37, Richard Henderson wrote:
> Do not require the caller to create a dummy variable.
> The one instance so far is riscv check_zicbom_access.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/accel/tcg/probe.h    | 3 ++-
>   accel/tcg/cputlb.c           | 4 +++-
>   accel/tcg/user-exec.c        | 5 ++++-
>   target/riscv/tcg/op_helper.c | 3 +--
>   4 files changed, 10 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


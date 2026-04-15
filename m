Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD4BF433E2
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Apr 2026 04:16:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDE9U-0008H8-MO; Thu, 16 Apr 2026 00:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wD54n-0003Ml-VR
 for qemu-arm@nongnu.org; Wed, 15 Apr 2026 14:35:03 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wD54l-0005Wn-Ed
 for qemu-arm@nongnu.org; Wed, 15 Apr 2026 14:35:01 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63FELZdg2972580
 for <qemu-arm@nongnu.org>; Wed, 15 Apr 2026 18:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LRpSIe9kabTlcoSlutMpDT8sQNqdMc5VVou5iKFdtMs=; b=ZcopRCZNqVDaIEn2
 h+BXr49BxxEMytc78bZX3EMGGChlncJQN3HLiduo5JorW1nzWUymdf6kzGzh1vuY
 kDkJ8e/fbu2EknbXe1PBTkPR5W7Y+NMTZXrGpoalSU8umL/RtC1XrHXFmhQaN6CM
 92TA2whKWesEsOKLkO/kml3xoRRw7YCzxJrpEpS/PYrmNWhczM7rpHsrw0gnnCp3
 A8oy00CjQkIooh/e9jwB1OYS4FNNpgRLeFNuvWfmW0J0vMx+wOpxErxfVZ9HEmHa
 51gDVEvZBSr0mRoo02d7SxmbkjJtUi9wQWbjEtlCVz/QMtCWGPWDbTPXircSS5Nr
 VOP+tA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj74ga75x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 15 Apr 2026 18:34:57 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-2d3a617ad90so24215620eec.0
 for <qemu-arm@nongnu.org>; Wed, 15 Apr 2026 11:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1776278097; x=1776882897; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LRpSIe9kabTlcoSlutMpDT8sQNqdMc5VVou5iKFdtMs=;
 b=aDUbSX//RJ7hc+6/akrbraStI9QPNYdD9jXIpqwlVskpOo9+MH39UivQHPj20Oeqxb
 0KV0KON9w34qjuBlzKkjygnVYlCc/l4u2szDUrN8TfMwGirOGrl20Eoj5BiLWXvTmiqQ
 pW/OknkJNVX0W5gcaWQTA8wjNWGFap2bEaFpOxkoiGn/QpMeSSM6S3vRAN8iBFp85Q3f
 kHY3ZedPk4VpKgdDCXvP5/2e4rN8XW2FRjxMiHTYeVMt97M06VALNb8kB8iXqaKHmQL1
 KeCBa6Gb1ZKSHn8Cj2G6nuAjlfbrAD6KnFC2iu350MAzCQ/2gEcVZt6l6n0Q+DN+0ec2
 Y1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776278097; x=1776882897;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LRpSIe9kabTlcoSlutMpDT8sQNqdMc5VVou5iKFdtMs=;
 b=Q7SuiZ8KTFn1HnN9uVVhR+NKGAYHezNyIpUGi8X+Clb9WsdxQtjVwPbxWD43AG3j71
 g3JIFgaxgaY0cIdM9umOGLkn6kBSz0p18igKd+Xr8tYZ4snRscGqcORPXxJSS/LE/3+l
 Gt4EY/lo/LrgLWPjT+NOmUmcE/J8qHVqn3DWsXo+C50uH92cIi0qlr6NyAI0fGvTSS+q
 dlutpJY5dxSXUFPXom1ETVDEuaalVuPsLSXt/JVeEB72c8doqL6DrUuccFVER6LtdXGA
 ig2RaX6ter95vfkDZ5Qr6gMyC6b64FXiA7Fy7+lBZ6B4Mo2SPBAjwj3/Kq1DTAN6Xtr5
 Wcwg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8hX/VwPmBCVw+a1GP9Iz9Qbd84mmTMsMoh6xnciICGV2B5SP67pE5aseIBRfrStzYfJRoRHUvYNA==@nongnu.org
X-Gm-Message-State: AOJu0YygtTqTW2pS3nyJXSCLISAHsKnL92oLdH0alWmZL73YSw0u/T8N
 wb3diEg7nFlHUyFFqwCI5zX5prL4Y4muwzMcsrADaL5ywO5ruaRS4GmK6O5ud8HgdnpOSSAtHVO
 w2zk94/ZrOVVurlegI2twIf0Lx1Xd1LhvUaQ/U6NZXaacIDe1oafEBVU=
X-Gm-Gg: AeBDies7P1gCbuX3xBHvqtUGZ659XNyoqIJy/DL3LQZNdMnMNP2e8Bht0C3cDyqoJfy
 /Ws8XRdA2ZJvd3+VFemVkjAmzzAdbPRU3/9Qp1V+M8mOfyWzefdwn7GnjoDjsmrWHIeccQwAB5e
 RrSHAT9ow6QDVeWaVz6cA1VlNNWeK8iTm74PK+2nuWFZLYRbPksJ8HqqTedeWeTG9tV799ZwOeF
 lVI/NgakIATO/0TjbtmEBWMiI9RZ1saPzX6dEb89e0lkkEv6o0zV8BQ8h6cVjmB8imNpIFnxrbu
 m7W0CFFK+x/mAbzhMwCsLHnlBFT0NNmNiWx+pG0wQZZ7CHdKv7AxtYFZEYpCFJifL4R4pyJyLiS
 LDAcHjmIlDPvyj1PPGT9FIialu1Wh44l6A0PfNbo9iJ1myBZNeDpqrldiOXt81zTxKjX8bWxbQY
 7yfoWWQqqgNQ==
X-Received: by 2002:a05:7301:4705:b0:2d8:7302:d3b with SMTP id
 5a478bee46e88-2d873021818mr5550231eec.18.1776278097045; 
 Wed, 15 Apr 2026 11:34:57 -0700 (PDT)
X-Received: by 2002:a05:7301:4705:b0:2d8:7302:d3b with SMTP id
 5a478bee46e88-2d873021818mr5550217eec.18.1776278096502; 
 Wed, 15 Apr 2026 11:34:56 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2de8c606222sm4764341eec.8.2026.04.15.11.34.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2026 11:34:56 -0700 (PDT)
Message-ID: <3b561653-5cd3-4195-925a-f726e21df113@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:34:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] hw/arm/smmuv3: Have smmuv3_accel_init() take an
 Error* parameter
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Nathan Chen <nathanc@nvidia.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 Eric Auger <eric.auger@redhat.com>
References: <20260410200031.18572-1-philmd@linaro.org>
 <20260410200031.18572-2-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260410200031.18572-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDE3MyBTYWx0ZWRfX3uJn78E0v+mB
 Yvg/UcmTgqJTB1Dc9bCvUiSo8TsBnNPJrsX9qARAJVpH3gD+uQbtJ+aLlksxcxqOCdllR6UpvNx
 1EzFXSCn4uBrX4O1hTz2O8fOJi9oCx4WA4X0IDrPqhjVBa4gd+xlhLouqRBN9eNn/Uur2E3TdCJ
 rbRiiPb50CXMKr5zja7SNExp0q04cDAtWoOYrjpTX3fkrL2efquHzVpXQwYvkMLSCDPkPuX3UtE
 LhV4e1E8er0IEflzsDJlhQfQp3mrf4Vjb+UhzolbRkroZ6yBATIo9DYT3282G5QhwDQxG/Q/tQZ
 gsSiQ6741TE5wErT9BZhsBclGmV6PBoIiARCx98+7rsDkuTd0uwM0bSGOstssEi1rnJnn34JpUn
 txgbVesnIWEGujVc/YMqZMTNtXE9M042Rkj79jDkZKEXDoRzukkQz6m753ehXVHQM0KwB0pzF8L
 MJ4+ddPfdE3tJQjPMag==
X-Proofpoint-ORIG-GUID: 2BXkTcpoJVSmpgJexvFbvdxlIMAqM8KO
X-Authority-Analysis: v=2.4 cv=ZIfnX37b c=1 sm=1 tr=0 ts=69dfda52 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Ikd4Dj_1AAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=urBhWk9uDEoXAR6DJqoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 2BXkTcpoJVSmpgJexvFbvdxlIMAqM8KO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1011 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150173
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 16 Apr 2026 00:16:26 -0400
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

On 4/10/2026 1:00 PM, Philippe Mathieu-Daudé wrote:
> By giving smmuv3_accel_init() the ability to populate an error,
> we can fail early in smmu_realize() when CONFIG_ARM_SMMUV3_ACCEL
> is not available, simplifying smmu_validate_property().
> 
> Suggested-by: Shameer Kolothum Thodi <skolothumtho@nvidia.com>
> Co-developed-by: Shameer Kolothum Thodi <skolothumtho@nvidia.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/smmuv3-accel.h |  7 +++++--
>   hw/arm/smmuv3-accel.c |  3 ++-
>   hw/arm/smmuv3.c       | 11 +++--------
>   3 files changed, 10 insertions(+), 11 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>


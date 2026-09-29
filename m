Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E93CA5FA5
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Sep 2026 12:18:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBWmr-0000yN-2J; Tue, 29 Sep 2026 08:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWmp-0000xs-St
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:18:19 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWmo-00031D-1U
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:18:19 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68TCEL9s3206261
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LvKM/QyFtp1Ft8C+tGxPBpb190hTI/twWC24joPLB5c=; b=b9WX6/W6nvq03j66
 RetUVuUKXyhxPz/sf+fod0NCJ8vUdyZ4vYNgLZZIRSVpC9FBZ2gQwWwJbZGSj0Uc
 lkneJCkyJFpuG6OXU9A41e8pXbjiapKgnphYBael8jP5+xY76w5TVoDbgYDBLrsb
 gis4eTJXzCzTOlKoxbTkqfNAX8Lw+en49zh+9kohMHjghDnLybUZF05wRVYTtA9n
 NCxeI9lArjSSQtKX+fq+uVZ1i7NWJeEHcsSAXdGytvp8cqV0CNfjyKo47miceWBl
 yijgLO11b7zYvWy9en5PuVCad1iBackTjSD2ymIWWrfwxuFb0vGNTWW2S6dAym96
 oWjHEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mnam6u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:18:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93a0b66ecd9so643271385a.2
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 05:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790684295; x=1791289095; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=LvKM/QyFtp1Ft8C+tGxPBpb190hTI/twWC24joPLB5c=;
 b=FQ3gN3U1pB6U/NlmfSKrzAk3Caccjfmd5DGAOcHDaKIglfTn1NuzRGBaNahnydj6Ho
 +vr2pmzHC8Dph8NWuCBl+5/2TX9fPhPDMypzDQuixp5rS0tzFSsa7Hofk+g+EBww9wF1
 y82RAAbKbSccrnGdd7yb41Qd1QYyE9obGjoIdoz9894lCMuXg9gamPkGmA9m/2xhSx7P
 xwiUTd3ESfhr64r3O03U0kotr7F7CJTTspaesW35SxVsUzBNIfPQaUaskwc+nUN4CZEb
 /6/1jPbkZYPilmBgS9Sm/D0mC9ec69aiFvLzAGftkf78Zlv7rF9aG+kMITubeBe5u/kp
 h16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790684295; x=1791289095;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LvKM/QyFtp1Ft8C+tGxPBpb190hTI/twWC24joPLB5c=;
 b=MoDEvLyZhIv0bdh2Uw8vnYsMYXgQQHWJPs1gu3arxmwgYMExbFA6kzphBBWOTbT47z
 kvRW1/HpknQmvUVVRUPq7TLm2fBf57pqWgBiawxs4T6gvRk8bKv8TYnhjk+T0gknxh1T
 vA+ssstNECmHCCkEAs6YmHv69++fBORODEae2wa60OWR2muL9XrB5Y2LPYTs+Y8nzfF2
 bwSdMl9ZhI5/CTMOydHq87DyHvvr+nBrC22CbVuuFHEoS4ViWvkpWUHsv9+EkSKw/7Xz
 FqAfeWVxrpiwBttmlvAZnxdpRRUk/xjp5GdmATNDDOg+2Z8VN+nS6gq8rdk8WX3lgunW
 I40Q==
X-Forwarded-Encrypted: i=1;
 AKwUvByXX0UPjz40t5xbwabOF7yHkBMkuzL7SGQvpGxHHhTO9SIbPpd5ExTGOp2mLYgtuK09VkSFVjaGqA==@nongnu.org
X-Gm-Message-State: AFuF++km1a7PLb+I0En6nE4uy+5aNGXymGTKN88SOCFL+6BXbaL0qvaI
 76fVBAgMrG5fQ+eHMBjAFyopthq9TZVyzYuZyZ9IPLJqZHSEZ/vZVtQS6YchKJwnRx+1jfZtn0o
 5SeFqoBvKEcTN8dj9qJX4ySdbpnEXZfvtAHScmsnAwm6CqA70kw8PuNA=
X-Gm-Gg: AYBFou1UCBP4JQw7jLmJvwRHzKgKUcn5V7e5ZlwA1gldLoAY/zY3v/MJ2VLALvZksyQ
 /e3iMrbJHBPcYh8jHQQKO2aJ7EmoFhiYV92pOP4OIYS/rbjOEKIvP5reKdNoRWVHIH/B/RZyks2
 FQ6GdZ4eDbrQAtjQQXo2fRAqvfsb99mJ9UiG+OpafcmXLbTbgYIciUyY9FR0rhGeVVsQP2FLji2
 te/1Hi4TS2y6pRn8gC+U/Zf8g2PShcm6pW2ZTyKpQYLJCtcMvy2S9yHv73OeW3nSIB7HvMlxJZL
 5go138zi/ZPYCFEyF5bgCwJ5wbbeuENnpQKLbyeOJvDt2D0YOQMoKHCWV1Qz5tKsj+3sjh6Esc4
 yPqeoCi1G03vEOT9jv2m/v+akn70O7tr9fw==
X-Received: by 2002:a05:620a:44d1:b0:93c:5d68:113 with SMTP id
 af79cd13be357-93c5d6838bbmr1919606785a.14.1790684295486; 
 Tue, 29 Sep 2026 05:18:15 -0700 (PDT)
X-Received: by 2002:a05:620a:44d1:b0:93c:5d68:113 with SMTP id
 af79cd13be357-93c5d6838bbmr1919601085a.14.1790684294991; 
 Tue, 29 Sep 2026 05:18:14 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00d0f66cfsm85998035e9.14.2026.09.29.05.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 05:18:14 -0700 (PDT)
Message-ID: <573edec1-1554-46c1-bdcc-cf70da590f15@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:18:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/42] hw/timer/imx_gpt: Wire clock control module via
 link property
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
References: <20260921214710.29422-1-shentey@gmail.com>
 <20260921214710.29422-17-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260921214710.29422-17-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X9fHu2Te c=1 sm=1 tr=0 ts=6abbac88 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=3vsBvid6nmlQ9tsTqnQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: L9pbMU_flP79O17qpj2k8tuveKC5zJD-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OCBTYWx0ZWRfXwnht1lhwCuYS
 lAcmNou35u+nB9VwJJxhtSdpLlTnajcswXExxZsQDE1yFR9XrgMX5xca92INXz+lGYWD/yzEoDb
 g5H47RSjiQ+q3+cR62RgMzcp5TohxdU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OCBTYWx0ZWRfXwjiDqbopcSBE
 wUphYLw73bUHG7fQkYdppHXOVqQoLABIiwKa1/4RnWNO2dSWzRvpMAtsh36clzRrOlgBKS3VeUw
 8tj3bs8goSi1jFPSgbUT3TLX94i2T2wYqckIsQCTC23yo/hNbjT6kTtezDqzb3DwpvHeWFk3qM1
 Y/mNTcjR5emfsMmYTEhUwCAtkV+2fIN1PBHKv9g4P3IKKAvX7mJ2omaMGHz+JLKyiPEJ+A52zUf
 D+Ta7ulhTy7Hk6Vqe0B5DnzCgXxu6CgaurRnM2PTm3Vwd16zSZu74SgLvUKpCT3HgO9et0thRlX
 eYWshBkkGk4ibtCp2oyg9HpREfXqOuUSvD3WhoWE440ky/RLwnZFNlYzHbzkBjt2v/boZRoipk0
 PbKWwZNILRZaVYJdzOmH1SoaxYxzAPjHflCalfwLBtP7ZSeQCigEKN3d0Ds/WbCHi5AjCuW77Uo
 buRHO3OetaORfN2ZxYg==
X-Proofpoint-ORIG-GUID: L9pbMU_flP79O17qpj2k8tuveKC5zJD-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290048
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

On 21/9/26 23:46, Bernhard Beschow wrote:
> When wiring struct IMXGPTState to the clock control module, it is
> currently necessary to reach into its private data. Moreover, when
> forgetting to wire the clock control module, QEMU will crash after the
> guest has already started. Fix both by letting struct IMXGPTState
> expose a link property which is checked at realize time.
> 
> Inspired-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/arm/fsl-imx25.c  |  3 ++-
>   hw/arm/fsl-imx31.c  |  3 ++-
>   hw/arm/fsl-imx6.c   |  3 ++-
>   hw/arm/fsl-imx6ul.c |  3 ++-
>   hw/arm/fsl-imx7.c   |  3 ++-
>   hw/arm/fsl-imx8mm.c |  3 ++-
>   hw/arm/fsl-imx8mp.c |  3 ++-
>   hw/timer/imx_gpt.c  | 14 ++++++++++++++
>   8 files changed, 28 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


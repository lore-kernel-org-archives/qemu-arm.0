Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B741CA5FA1
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Sep 2026 12:18:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBWmR-0000qi-L3; Tue, 29 Sep 2026 08:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWmE-0000pV-7h
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:17:46 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWmC-0002yU-LR
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:17:41 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68TCEm184066657
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2Y0hBR+Lqn5a4iWwY/zG55AFG6reGos3uYivL2CCnro=; b=mFv8usVLnE95xbY8
 JJrN8QO1pYS2/DqsdLIz5m4RZN4rrwLpctTVhvMNscfN0HVl4CsXt0kIRKq/rhSR
 A1UamtqdRsMCYozcW4wu5hpCB8T0XmsGsaeHIgA928wXO6lzPqpdydfq3q6bFHEh
 aVXTyOR87CZcKhtOQA2ALcaZJUc6TXLHiitqxMYEemNNMSiFx3kYROhTi0Cm0Gmj
 x6+gQYeUcpuQyfPbOKNXl0OhrgORkSrkduAA9wKwDwJiAW2XcCkuzRpnXfQUegTh
 1TzfGYh9fm+4fMULF6TvPsdgGs1cblhcPcdsTObfLM+tMk3Z0rKQpZmivM8sUtiC
 njBvqA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwnbxm9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:17:38 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-7a77961b860so709874137.3
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 05:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790684258; x=1791289058; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2Y0hBR+Lqn5a4iWwY/zG55AFG6reGos3uYivL2CCnro=;
 b=DhxNeAVInOT9VwQt6or0WcB8VOQ8ceniAlZocpYxsSW7M+B/n3fbIQfYbBvbVKi0eS
 W2da3i/uHwvxVNDoF0pNynqKXgcjQUE8Vv4bTtZq+/vbDs0ak8oQ39O93XcbXJUn/JyF
 +WXlatlqarYNfjK7S21+qF9HCGAJyUeYlxjs35V+fr2hjS836eo1A++k28i9FeKjT5Ms
 O7t+znIpW6+BE3YckoC8i/t8WNOE58z22CB61ehIauHQjje/yQYO75KUfKWwuw0+PMaq
 7SEdbdJOiOpSgQpcRM5WvDaDKvQXsNmgqhgotrhSsMKmVQLNJfx4dntAHzjkjHpdV6BJ
 B5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790684258; x=1791289058;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2Y0hBR+Lqn5a4iWwY/zG55AFG6reGos3uYivL2CCnro=;
 b=uk1odmPKLgPJkQNjrA+swq1S+mQfLDobBryENAR3gOYxbiZtbzdiRJ7i9IKLsBw1Ck
 VG+iGYsvy5wjrx5h5P266FIkKNKCvYuR3Z6tKSmhxk0xvx/orUBxSOYYehQifnSAvFEe
 y+UsH2NLMJYlcmzY+ARAAco+bt2dPkHVx4dE/2a9oXFtROOBwQE/QKMr4Lb9DV+09a/Y
 YoHcX79h3iZtAbrcG5aziMsoXLgbdx/GHCNRFLjGw5oT4OMyT9lFdBrGq4v5IA6vkDFw
 CSDJ7cO7b4z/AD7quGAtPb0/j77vpdneYKzvwXyDdg6xk7lEbj97sLgI9CaZGEFL6nep
 DerQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBykvmpyBvZw4l6jkAxDbDlHZCcV7lV3rE7IfYFZSB72f9zJU3lTVm4VE10be9P2zSRw6j2glYihOQ==@nongnu.org
X-Gm-Message-State: AFq9FYI/OmKlPZPnrvMLVoUAhNWMZCByI4p0JTEUImDMZC1hP/OBvGOP
 KuGPNc5q9wKpkVZbs4hxvdnj2hzOeKlc4vQgC1pWkCzTD9/McaqSjIQXEjzlK5WtEIDwewYyzLL
 vMdOMh7w+dPo5ZaDT+dx+UEYyKmwOHmTQJ0po83mv0NeJDSO6cj10mSg=
X-Gm-Gg: AYBFou0LRslN44zPH5zEt4jyHP+/eA8CxwHj0Msw1BHORWWHGqaAaCo8ZUf6ACwFjKV
 pwGTtSjkeCaN/XLNdSWaaraZ8nOIWEetVsub+1oyLuKmWZC6MMJDib0Gs5LbYlyOgcI2banmMui
 Bxr8Y0mKz0VXu66VgwEB1WqihcL4/CU4lIUZbbU6Q4N6nVjPQ5nViSpDZ9tfztfYY0bOZJWHDMG
 PJdWWaZXsf5GJPtwt/2Zc435/9CrlHJ4Y81VxETz3lC/jn3pjX1XJKvzLX/OvXzJINQleY4fSyu
 PKXeCqf916H4GdpSrS3DNpRDvohNA1t3GrGm0jdM04/JuXuLq3kySPcPBSu0eqp7cBOAHYuZgPv
 qPQE58y+YVRHzSMmP7aOTfIrun7i3xvQIcA==
X-Received: by 2002:a05:6102:fa0:b0:7b3:3b4e:f0 with SMTP id
 ada2fe7eead31-7b33b4e2a24mr2502327137.4.1790684257571; 
 Tue, 29 Sep 2026 05:17:37 -0700 (PDT)
X-Received: by 2002:a05:6102:fa0:b0:7b3:3b4e:f0 with SMTP id
 ada2fe7eead31-7b33b4e2a24mr2502322137.4.1790684257014; 
 Tue, 29 Sep 2026 05:17:37 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48af5078a0asm4070937f8f.23.2026.09.29.05.17.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 05:17:36 -0700 (PDT)
Message-ID: <5df641c3-2d7e-482a-9243-6169945e1a84@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:17:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/42] hw/arm/fsl-imx25: Derive from TYPE_SYS_BUS_DEVICE
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
 <20260921214710.29422-12-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260921214710.29422-12-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bZ3kJWzyHgexjS0gCafrHPCvApb3INH6
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abbac62 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=CMsNXiuhlSFg7qIHwAwA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OCBTYWx0ZWRfX/MIDHlkM9aTt
 59/+z/lAe7/Zr+c+culgK+DLzGwO8Drj/lEM0lTmaba5inSObAi30AaqHzDs7abLolICfDK1gDQ
 XTV5qitTWAIoomY2kwg2NPGGVF87LnB+cOrsDXdssHT6RPWlgawqDGDApdE79n/9p7jl7yUpKLB
 gfCsqhc1LvIRsRWYzBM6/xTqwA/qbb6zmg44+g3D1IaEKFocl5vOKAWCgeNoF1FbsOtGW7Lrm9f
 ayj0ZgTovjs5DZ5VUXT0osUx3UsIjm2hCtyUxvIBzE8cHSr708TzegRSkEerRh+uc6LtMyi3WUO
 j3OWxG6ozIQGYrYCH+8djxOAIysIldtnzOLBYcOPba6CkHG+MYUQ/5fddUAGtZFUER4+F9xx31O
 ryzwq4OByvurgdF8t7Dak+RmzVctbBX0GHqaVQK5uV7eBfjlJRHj4J/3pbF1i2GjHxsmMR1Ksmn
 k0q4BPAQzulBcNha7rA==
X-Proofpoint-GUID: bZ3kJWzyHgexjS0gCafrHPCvApb3INH6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OCBTYWx0ZWRfX9jfUuyJ6WcDr
 Op6o85bYSHHS2w43OpaYRsC0C8mQRSziPf86v8sTH0jps9RxzPT97V8/73bphMtM3SOwDzjvj27
 Ih/ryODauWqYyNz3ztPhtIgZx4LFU2w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
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
> Deriving from TYPE_SYS_BUS_DEVICE fixes the SoC object to be reset upon
> machine reset.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/arm/fsl-imx25.h | 5 ++---
>   hw/arm/fsl-imx25.c         | 7 +------
>   hw/arm/imx25_pdk.c         | 2 +-
>   3 files changed, 4 insertions(+), 10 deletions(-)


> diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
> index 7f65f4ca4b..efb22359c5 100644
> --- a/hw/arm/fsl-imx25.c
> +++ b/hw/arm/fsl-imx25.c
> @@ -317,16 +317,11 @@ static void fsl_imx25_class_init(ObjectClass *oc, const void *data)
>       device_class_set_props(dc, fsl_imx25_properties);
>       dc->realize = fsl_imx25_realize;
>       dc->desc = "i.MX25 SOC";
> -    /*
> -     * Reason: uses serial_hds in realize and the imx25 board does not
> -     * support multiple CPUs
> -     */
> -    dc->user_creatable = false;

Distinct logical change? Group in the same patch, same for
sysbus conversion?

>   }


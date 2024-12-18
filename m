Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp967437njk;
        Wed, 18 Dec 2024 06:37:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUueK3hLhaxS8NamSQS8idge2DjeHseAyv348SVroSBeTQD94N4CEjA/wupa2dHTeYOPqWUBL3UTAjZkg==@linaro.org
X-Google-Smtp-Source: AGHT+IHUBukTk6fMPTRf3HFifYEcm9l7l50GSi1Q1UhcvjohB1XPIRUtpuWgdW6xS9vaUNwKwbI9
X-Received: by 2002:a05:6214:c68:b0:6d8:9f61:de6c with SMTP id 6a1803df08f44-6dd09a93a6dmr49200536d6.18.1734532630022;
        Wed, 18 Dec 2024 06:37:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734532630; cv=none;
        d=google.com; s=arc-20240605;
        b=jKxy9hc8MzkhU8ki4ads5Q5hAiqj4zsZqEA6UgeQb3ho+FE4RobkuGm3H4c64zGq7O
         77xZF9Y1kERCprz/13fShiUDDt9+XzX6NUUGPpFB0/VaITV7yEF+wiMnCYZtM9NqKnEl
         cp9SX2cK2m2IlccdSgZ8H3BmD/XnNkaA8gA3SLjE3jTkcv5k/YIBJDE37jmI6IHCwSsG
         Kya59FvWtcDyeAPmcqwGO1MxrCHMR/FJwhffeQQwzJk/BTveJVc7rv3f6F7VjGGHP8Lm
         IvzuPk4q1+c9jH+mhW3fvDaujqZfbKxwJg5h22Ei0FTQ/GgoZ6nTBdkKccNenUWPwZ4D
         G/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=KbE10CchUz7Lpn5Fh7tQMUMA0Oa6DpMtjQjc9TgNgsQ=;
        fh=KtfJh59AKhaO7bOljx5WO+v26Qj19BE04y23jsC6e3I=;
        b=A0/4Q/BQ9LuZgC5NNUa0I/9icxyKqhPbsLKfGAtBFjzXvCOYKZz6s8yERz80b72oED
         uByBNdk9gvfNXT41jwxcrENBA6y37xppiE+RVLPwJzL0wI3PrET9zSyw/2eiXSGKudIh
         mETAszgzAvJpSHRtD96eKIcRiFa9XFLIWd6vMJNinrBiU1+KhMhO1qddRGiv+RAVtoDY
         hlR0Hgrp/X+Em/9b4UyOoIksrRg3Hf4nV5md1OYufv84vaIBq6SIEaoYSFc5aHxW+Egc
         Gkz/ZmoigBI69/VpoOytdKY/VIpfXME0FRfyJiWgmXBxsIZRZNu9cZ/r+vSPc72pcyDi
         ToAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=LacW7+9C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=qualcomm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dccd1bb27bsi124357996d6.31.2024.12.18.06.37.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Dec 2024 06:37:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=LacW7+9C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=qualcomm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tNvAG-0004Ts-Jz; Wed, 18 Dec 2024 09:36:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif.lindholm@oss.qualcomm.com>)
 id 1tNvAE-0004Tc-TH
 for qemu-arm@nongnu.org; Wed, 18 Dec 2024 09:36:38 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif.lindholm@oss.qualcomm.com>)
 id 1tNvAD-0005CT-5W
 for qemu-arm@nongnu.org; Wed, 18 Dec 2024 09:36:38 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI7VFFD025340
 for <qemu-arm@nongnu.org>; Wed, 18 Dec 2024 14:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=KbE10CchUz7Lpn5Fh7tQMUMA
 0Oa6DpMtjQjc9TgNgsQ=; b=LacW7+9C/hHZ77cbEB/vGqAZ8kKIVkCcpyuaNToT
 fHxTO/breTujQnxTTnNsRnu+6maE3jWlEZanDf61RGfjXf8Ap6lqz44b/i1SXx6w
 oYIDGdAWFBTO4TUL+ey89fR3RmYj4ChGBU01PdCIOWGOgapH7Vaa4JCp7aUjETxS
 GTy0BfZGtT05LBu5p5UYcOQmcUnjBArifEGzjZ3LekmbV3BPrT7o1uWXfTmPJ39e
 VoOTpRB+ixFayJRIFVJVem/lM5GRW1Zt7o/egmdU/GXc4zlPR7J4E5I4s5Blzp8O
 yq4NsK3T+Q3y35iiTL2l/k9MYMhnXji6LQJUasCv0c/r7A==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kt2w93c8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 18 Dec 2024 14:36:34 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-6ef85037f3bso10261087b3.1
 for <qemu-arm@nongnu.org>; Wed, 18 Dec 2024 06:36:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734532594; x=1735137394;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KbE10CchUz7Lpn5Fh7tQMUMA0Oa6DpMtjQjc9TgNgsQ=;
 b=cIFAx0nEMenJTKwMpg+1n0Xfruwn52jvGbukh5h8DnqPIT40rkdyXe0ckufxRbZG79
 CpDnj+k5ZW8YG1wGjjE5Km+iXSI4np5jD2cU7F7zC4PJHWymg0NAczoHBe3cOuIroI6h
 m3AexiWu+Un1xfGgtVEbZv/AYIyImMiUL2OjHobo9l1uvpg1QFstgqggvv64Om5+wsVn
 +Dy/2vsHG1LLUZOFPkyN0xZF/ARE50BR3yQ9wgzZ3eUaVMCBL2UyHa7FEyaiV5oBmLqo
 KRz/GiaxdzJIcPJNlugL4yuMor1HK8TApXnNOe4bfuUdzvzBi7wePaCXANkDMvvUriEv
 e+ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy15TnEwczyRBl8XqQw+U0CXyT9FtytIgcF0YxfTdPZLE+7H3jImtBq1eN7M9UGZVNlmDVWwyNdw==@nongnu.org
X-Gm-Message-State: AOJu0YxyxivFHPCF43jnRKc/GAUjtCNCeN2W1vMtf2mc9Vzgs/xNxncA
 NveFqt/dGwdzYvJopuQoqdpBsOc18KDK8OmNONiojbFozx6mYNusZFR6TcGV/tZA8VhyOR+9Yt9
 5aCJW7co40IjrogSq2L4qm6CUKggw8MwUjrpqrLmKZZKeIW4glT8CLuy5hbCQ6fQlPupybqFnA4
 hoL+Jmhvg+01lwclWJV7BqemUazg==
X-Gm-Gg: ASbGncthhE5EbFf7zODMZq393AXvUpWmTHjrUiYaFl6P+w2PY8C1o4/L7Wj2WNQGnGe
 df5gsmMn3nU8Edih0XIwyJo4wieb5aKmqrFOPYMPYjumDsl1QItR3WepFHREQdz4FIRyU0A==
X-Received: by 2002:a05:690c:4984:b0:6ea:6666:c0c2 with SMTP id
 00721157ae682-6f2bb9a3898mr68117917b3.4.1734532594165; 
 Wed, 18 Dec 2024 06:36:34 -0800 (PST)
X-Received: by 2002:a05:690c:4984:b0:6ea:6666:c0c2 with SMTP id
 00721157ae682-6f2bb9a3898mr68117687b3.4.1734532593827; Wed, 18 Dec 2024
 06:36:33 -0800 (PST)
MIME-Version: 1.0
References: <20241218123055.11220-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20241218123055.11220-1-marcin.juszkiewicz@linaro.org>
From: Leif Lindholm <leif.lindholm@oss.qualcomm.com>
Date: Wed, 18 Dec 2024 14:36:22 +0000
Message-ID: <CAD=n3R0cxu_jf7ErQ7Cjwx1pr+tU=8F-THKAaH8KVHubb2VAHg@mail.gmail.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: remove myself from sbsa-ref
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: iI3s4d2e2ZoXIZ-bYyDtzsXWhz0VXhA6
X-Proofpoint-ORIG-GUID: iI3s4d2e2ZoXIZ-bYyDtzsXWhz0VXhA6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 mlxlogscore=758 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180114
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=leif.lindholm@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: c8u7vycN15IO

On Wed, 18 Dec 2024 at 12:31, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> I am ending my time with Linaro and do not have plans to continue
> working on SBSA Reference Platform anymore.

Thank you very much for all your contributions to this platform over the years.

> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Reviewed-by: Leif Lindholm <leif.lindholm@oss.qualcomm.com>

> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 822f34344b..776e0b997d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -918,7 +918,6 @@ SBSA-REF
>  M: Radoslaw Biernacki <rad@semihalf.com>
>  M: Peter Maydell <peter.maydell@linaro.org>
>  R: Leif Lindholm <leif.lindholm@oss.qualcomm.com>
> -R: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>  L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/sbsa-ref.c
> --
> 2.47.1
>

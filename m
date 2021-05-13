Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp676917lfg;
        Thu, 13 May 2021 10:06:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAv4f1cAQZq8IdvxzgqXzREFwpW2rmMIw+G9ebVQYWU6vhmYr+hxf6nnsKWAEavNKAF8PH
X-Received: by 2002:a5d:5407:: with SMTP id g7mr4950912wrv.207.1620925609278;
        Thu, 13 May 2021 10:06:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620925609; cv=none;
        d=google.com; s=arc-20160816;
        b=lMQzD95/mN8j4xRGZBZQuiMSrA5RUEfhdopqm6bZR3auhxTaz8Z7nOqaqxxwnSmH/0
         Ht44XyTlUJ+CnGS37K4KVR6k1FtGllHf9SH0//sytfTm5R7yWGPI2CBTZhs5B8HvlKjg
         NzzPIph0+HnBGv+NMcmVp1A90/pP1cclkI4LjFMB86yecm2UPN6mPhoJzscZNuwuZzH6
         Pdxa/+u+If6oX/N1oZ7am2jJTtcIMRKexG21NdTOK5gYVw6JN2xnNR6HM0+mWXTwX9G+
         5srx/kWfwgqLgdPRxqaPPaH0JVwDWHiFebgu1/oFHg6SdpGnFJKFHgiT1ZMOyx2YL/xf
         f4VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cByo+HAv+WnrF+1RuvCCRT4GjZe5G2crOGDi1tsqJ34=;
        b=oAapf1gQv/KLNlUITQA1wpZtA5n0WP83r3cQaqiORkY3gUyaOPEHh5FwWFUE5o5QC7
         JW9zdFuJ9+KcDMOFZcYpKVU8VFsgviI9vGONmlAMgOpWdug00l5WlWE19zA640lnPqPW
         /9gPmy7ta98Kas0il/4H31IPcdjKETfc/RkqzQgz0IEBdKISxraJG1YepvYKXSknizd2
         0iQqJJmrT12VN9Z4dtjwS9c582kiurnQ3McxusczjwVigWEt1FSr4GEPbIV8BHVy0Jq2
         wH4+GnaXfu3K8BjOU+HE7u+NbdarqrbfYV3u2ADC1Px+7I56xIvlMQiNl6OzLo2YjzEq
         23Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EKZEavwv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j5si3716795ejd.355.2021.05.13.10.06.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 10:06:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EKZEavwv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhEnQ-00066w-5m
	for alex.bennee@linaro.org; Thu, 13 May 2021 13:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhEee-0005gx-DX
 for qemu-arm@nongnu.org; Thu, 13 May 2021 12:57:44 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:36664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhEeb-0002qb-KF
 for qemu-arm@nongnu.org; Thu, 13 May 2021 12:57:44 -0400
Received: by mail-ed1-x536.google.com with SMTP id df21so4511718edb.3
 for <qemu-arm@nongnu.org>; Thu, 13 May 2021 09:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cByo+HAv+WnrF+1RuvCCRT4GjZe5G2crOGDi1tsqJ34=;
 b=EKZEavwvLkHLzh0Byv26Q4Q43c82PJfLGBvot6WVfPn6qDc4LnUPQxf3T6GtNgXb0L
 HbzAsOQuE0wqFu5zujPE37OhcPGECmk6flTwwCpgM5ftlGqUEYykFhuFDee2nGi5Ll09
 AMKZ8poJ1aHCmMYjDXlgOFErSnUZ5sba2s9vbUexfO/kkMYsutY2CN9IkGIbVc5H1qv/
 hoEWctKI8/rpwWrAbQUcFGdC2T/ADi55yg63Oz+Dfah5M5DKgaQiZjmfi3Q/JmsAN7yz
 O2eUj1oyrvekT+O+vDuVUa0VNK1IkwJA3s7+ek1Fol3LVSO3Fu3Q6oi/I462Z6fxy83d
 ASwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cByo+HAv+WnrF+1RuvCCRT4GjZe5G2crOGDi1tsqJ34=;
 b=iInLgD6lGMFmwN4Fyh/Ml6KGUGgdA3UY5JVdASqZvvj2TSWxc5D/6hlpqPgKlpHubf
 2NZn9KMSXc8JYBBAhR5Z14hQGqDox2wHu1YcJSb+jaG3wkH2Rf5LyL2bPilYKHZeRMfy
 VlkoKn3aZGmQzhfuN/0zqGaExWfLb9obxCTb5b9rLoY5IPWR1e1KqPjS3XrIG5R9jGGx
 aGuJ742CQ/7MR1WsmvjYnhvClYjK762wc6nCL3G2ydb+zSAp9V5ElZvmEOqBdJDpU16H
 w02pAZBv1nNFSk5XjgDZ3kfUXy6fDnO1KOoL+FVfwNDxzTFOzRq6YXvgJSdVVLA2Nr2Y
 Qy6A==
X-Gm-Message-State: AOAM532NkmwugAfXTOTDvb2XYpFo/Rt/FnKweAPOQwLGSREDFb9h124E
 aA/6h7EOzZ+LG3qrN9ZHe64J7RR37cPUsAX9ZEwQIA==
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr50935956edt.36.1620925059853; 
 Thu, 13 May 2021 09:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-73-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-73-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 17:57:28 +0100
Message-ID: <CAFEAcA8FVHHYsH+nEVmJLYYvOGk-dsStvPKD0Yu_Qp-eDJQVRw@mail.gmail.com>
Subject: Re: [PATCH v6 72/82] target/arm: Implement SVE2 bitwise shift
 immediate
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UlpvH9rJ0S1g

On Fri, 30 Apr 2021 at 22:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> Implements SQSHL/UQSHL, SRSHR/URSHR, and SQSHLU
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Message-Id: <20200430194159.24064-1-steplong@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 33 +++++++++++++++++++++
>  target/arm/sve.decode      |  5 ++++
>  target/arm/sve_helper.c    | 35 ++++++++++++++++++++++
>  target/arm/translate-sve.c | 60 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 133 insertions(+)
>


> +/* SVE2 bitwise shift by immediate */
> +DO_ZPZI(sve2_sqshl_zpzi_b, int8_t, H1, do_sqshl_b)
> +DO_ZPZI(sve2_sqshl_zpzi_h, int16_t, H1_2, do_sqshl_h)
> +DO_ZPZI(sve2_sqshl_zpzi_s, int32_t, H1_4, do_sqshl_s)
> +DO_ZPZI_D(sve2_sqshl_zpzi_d, int64_t, do_sqshl_d)

What is the rule for when a set of operations on (8, 16, 32, 64) bit
values should use (H1, H2, H4, ""), and when it should
use (H1, H1_2, H1_4, "") ?

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

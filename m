Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1847511lfc;
        Fri, 28 Aug 2020 16:02:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+UXVyM5NfMvyUPFEbC6o86EJKxGUVeJ42wvkdMI/jV+q4O6VfbOVfOsEfkRxL1Um3VoDj
X-Received: by 2002:ab0:1052:: with SMTP id g18mr717129uab.62.1598655757267;
        Fri, 28 Aug 2020 16:02:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598655757; cv=none;
        d=google.com; s=arc-20160816;
        b=YokbBKRcL8q9gAWdEaglaB5aXJ+nTSQGC9XjvI/7FyYTOz+ao6aZi6woCg4m8kvwXc
         W+9Rc9Q/nXW7Rv/d30sRziHDx0/RIWiFOfl0GV06vIahdDK0d8WGbnNKktT+3xtX5mzY
         QUvXpRYpMB/iRavHkdZCvmj9eOr52VdnZxtsKYGfIr5qO1hr7S4xIsM0W4Irtmjd0tn1
         3enHLCboVpQ/pu/8wQdoGZt4IZe7aaWprbMgw4VHtRrsy+dFENIh5TrmZAiM4IOalqYH
         kXpO0fhs+tE2TQwCMBM9xZl3PptDAxZ5Idjwaoz/8lKnIb5X4WcYA44pndlxxH7kPcmG
         nxMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=WHPbtsXjB8fAKSE91w0G2VmJKRHKkzNuc2WxO+7mGwA=;
        b=qCfrvjLTBam+F9YX47rMulTRfFHRuOUk/d5rnWxsJTdkSqrQAzFBiDoHGoX16//0PI
         VbFD2iILK0H0PwQjXYJ0V+Yfh70eW0nhdOp4XYbuiDF/11vH1j92POAA3kVRAV/ktDI+
         qZMktT9YImDwaLbV4lP9iDzs7CIE2O6eG/Ai+3hSm4vEvqwRk7YEDho6v7XpdRVV4/+4
         juDktAgLlxrT7mRzS7sHOGWRoJYDZXL2fSfSz7vGjYD29rZbC9k+WH2V6bsqL17FUxMI
         n+lsWRtvy6A5BzR3xmqPoSG9JU0Icce2XzbWS7vVi6nSW2EN42EZtqemQiyTU/7qz4bx
         qZQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ajhzkvjm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j22si152051vsf.333.2020.08.28.16.02.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 16:02:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ajhzkvjm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBnOG-0004de-Ji
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 19:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnO9-0004cc-Ej
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 19:02:29 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:45216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnO7-0003yE-UO
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 19:02:29 -0400
Received: by mail-pg1-x543.google.com with SMTP id 67so1114440pgd.12
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 16:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=WHPbtsXjB8fAKSE91w0G2VmJKRHKkzNuc2WxO+7mGwA=;
 b=AjhzkvjmXdkW9COPv05gLujnnVgxJdx3Xykesx9ZGRicliduNJoPlvIZzqAUQ2lqeh
 MciPTII0JFXzKk2gAbq70xkfiUrYA44jJpOpJkyxq9yP+TxdQta72kKStTzjIA2Z+3fy
 demkDUkHJdgt83MbCVVUyuLQRjHiNWAufvqrizA14C5k1+UjoudZQqPpIl1zFkxQsaHn
 rqt1pkhgNt+aHmuvVpjkk3r7JcxQ3XHu821SSBknsueJp7+jkr2dv4E1ImU9if5eXu4Y
 HomFUrzRygtMG+SXjZF8m+idBcG+wP09p/aGE5RI+/ihzY/CA4A9aISpLZkXClzOdyet
 MC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WHPbtsXjB8fAKSE91w0G2VmJKRHKkzNuc2WxO+7mGwA=;
 b=O78s0zMWCajltQO27Y2e+UXEKTYpqhnq+HKQ7aZPC26zK6iLpX8inFYUAv69tOZD9D
 B+Klfa8mcp9ZqksqUMHrOlHt7YeHfC3VF6lGs3nwbklhYB8V2L/8h+E1zOyLHorqSNMy
 eWFfkksmOxahUTH09lIf0ga4VoNTC3r2TH+cEOPXslUdliAS9kJXWDNzBlUW7wccAkm3
 rHKWuvM8gChrCf0THhee+vLWPCYxx3DrHgM825Y6gC/GhOxB72zpAH9It/38pFWVpSQU
 tmKvnTWHfk1SqHUH4jDuzGyJ6yA7enM39OUaNbHApMFJOQa87rOBA3Ww5z4HG1R8q1f7
 U8HA==
X-Gm-Message-State: AOAM5303nMrwAx5SQS5qtZgvOUcs11+S5d9LnFk0yi340GR6u44+0vPC
 9BIuD09ci/Uoc6jxgfurksM+cg==
X-Received: by 2002:a63:1a0c:: with SMTP id a12mr742428pga.24.1598655746414;
 Fri, 28 Aug 2020 16:02:26 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id n22sm333824pjq.25.2020.08.28.16.02.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 16:02:25 -0700 (PDT)
Subject: Re: [PATCH v2 33/45] target/arm: Implement fp16 for Neon VRECPS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-34-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <25897cee-58e9-a114-b6ce-7705901a724c@linaro.org>
Date: Fri, 28 Aug 2020 16:02:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-34-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JjxO64NWG7Bu

On 8/28/20 11:33 AM, Peter Maydell wrote:
> Convert the Neon VRECPS insn to using a gvec helper, and
> use this to implement the fp16 case.
> 
> The phrasing of the new float32_recps_nf() is slightly different from
> the old recps_f32() so that it parallels the f16 version; for f16 we
> can't assume that flush-to-zero is always enabled.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h             |  4 +++-
>  target/arm/vec_helper.c         | 31 +++++++++++++++++++++++++++++++
>  target/arm/vfp_helper.c         | 13 -------------
>  target/arm/translate-neon.c.inc | 21 +--------------------
>  4 files changed, 35 insertions(+), 34 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


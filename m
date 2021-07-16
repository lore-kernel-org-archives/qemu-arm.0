Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp1455802lfc;
        Fri, 16 Jul 2021 09:35:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyirNGfxPm6ihiJUo66nbEZOLB/W29M/RlEF9XIkrQnmOY9P286SCkJgWbaVvyZFXZ2nY80
X-Received: by 2002:ab0:65ce:: with SMTP id n14mr14643771uaq.78.1626453340479;
        Fri, 16 Jul 2021 09:35:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626453340; cv=none;
        d=google.com; s=arc-20160816;
        b=jnsn46wfe6In85UufQPk1oV6KopwBjXycSGHsfzhlPRDyGqZwurgGLNor6X3pM1r+u
         EpjXbO73vEAy83hobzI02jJc/1XF6145RpEVMaY6uaUd6SbD1wSlfZvnJKeqpRwXzxUv
         9Enw7fEmHmH1Nj91/VexN/pkcCNuIJ8dVX6Q0I9YVYB4FUQR5/iGVFgfMMFCLf4Ix4I4
         +3uHncyqq2u4LZzbJ7rSdg+pGumSLN5TOjP+ALBW1W2dc7F7Ij9QWmXT3g68ScONy+zf
         B4s4d+c9Rv2vtQVZwjc205GVVegc+qtTew3r8UT0+nn+5MX+uuWPP9+ySf3tfVYNLA4q
         +BYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=lkNxYiClYpExWrI+5z0GCVb5lYeWc3NCbIKm6TYm4Fo=;
        b=DId0RHmjEnuxDplxx/NezOM6Q+fVCRSLhVcTRsE2DZa93sMdfOvYpC445fR9aFm0ib
         g8DXFs7GeGKe6R2dtGtS6MJfhOQaEeLrxESed2HV/Vsa4lFdFh67vg9cB9N3Q8qdsIl7
         eWXzAoFY0D5UqPEDp0kdilwRtXKlWm7FdmOKHj9vHuUNhaHOLHJrQSKXJrqrVY5RlpLl
         z4snE/LE4rjDR93qnnG9MmRyuvFSVGFHrpzh+CN9DthfGUv7QBKMLKcI+hFOJu0xClb0
         nlNZoiJvKv3moAQKjG9Dln677i+NKcAynRwtpSl9+JuE6talg59Gez/BrCpvXgV2U+jQ
         EbAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dn1TzQ+g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17si2342029vsk.419.2021.07.16.09.35.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Jul 2021 09:35:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dn1TzQ+g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m4QoN-00067k-PY
	for alex.bennee@linaro.org; Fri, 16 Jul 2021 12:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Qo0-00065c-Bt
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 12:35:16 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:33311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Qnx-00008n-Kg
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 12:35:16 -0400
Received: by mail-pl1-x629.google.com with SMTP id d1so5590786plg.0
 for <qemu-arm@nongnu.org>; Fri, 16 Jul 2021 09:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=lkNxYiClYpExWrI+5z0GCVb5lYeWc3NCbIKm6TYm4Fo=;
 b=Dn1TzQ+g3d5OeaOvIDJ+cWccZ52c0JXItCQZdDdPgVdStiZ10F9gkSSXrOqOhR+A/B
 3p+wIKzgsQEUuZDc0/FZpwQ5wf3A/8K97ymiOJqDD94qDhjlaeFYur7lKGUheqF6Qvvh
 DTG1omaT0auOuCFo7bO+YmVIv1/tDshMnfBRQTEkMgybtU/+jq7L4dqyuvaRxRo3e4Uj
 aO6j9bdpQnTsYZf35sjFP08f8tx2dthEHOw5yG8xn2rQehbY+KfVqa5pZts1HN7b42lR
 xlu7EyJGMMrRO5KAaORvoZblHgiYpUIPU+pudFxSOkydqlOhfWuC4fC3GkHqAskRgr6+
 ZLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lkNxYiClYpExWrI+5z0GCVb5lYeWc3NCbIKm6TYm4Fo=;
 b=kYmywDANw6hUxDAhYfmhn7CxgUnygpuockOmVg2DiX8181JRMpKVB6nYHnn7B/Y2f0
 o9YRQalva08gEUxbzvjVR51sv9hzqrReCxcHlP6rwXNM/NosYtOZ8zEJxKak+0SowBuP
 W8rBSxBxervO9uYIYeyEeQpTcrOX7rcd4xUFVONRiud7dYGGGl8I32PCnbERz/WlDukf
 twRWPCjsF6AVpEB2rTVG5yz2/0ysZplsDcCYXOGWiEpPbCDjaW+EU6eJgXbIHXiGnvbA
 fMo5JoKbUvGLgbdfgDBXKGCWn6BYVPe+9xa+NygsaGwrMMxYBKkHX36upPJz4cNFvYop
 gaLQ==
X-Gm-Message-State: AOAM531w8f5fr6g7dUkI3/OLVcrPu6YTkkBwtzvoOvPMMrw99cgn8ttJ
 QGf3WEHcEnqVdRKjvZEY/s7M8g==
X-Received: by 2002:a17:90a:4404:: with SMTP id
 s4mr16609137pjg.218.1626453310523; 
 Fri, 16 Jul 2021 09:35:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 5sm11732943pgv.25.2021.07.16.09.35.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 09:35:10 -0700 (PDT)
Subject: Re: [PATCH for-6.2 07/34] target/arm: Fix calculation of LTP mask
 when LR is 0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5bbb8d53-7772-d941-ba45-1f920a5ccaf5@linaro.org>
Date: Fri, 16 Jul 2021 09:35:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: mRePyX1fLJnE

On 7/13/21 6:36 AM, Peter Maydell wrote:
> In mve_element_mask(), we calculate a mask for tail predication which
> should have a number of 1 bits based on the value of LR.  However,
> our MAKE_64BIT_MASK() macro has undefined behaviour when passed a
> zero length.  Special case this to give the all-zeroes mask we
> require.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/mve_helper.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp151558lfq;
        Fri, 8 Apr 2022 16:17:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2YUMLxdV5C8mkP/p9BVpHwISJpZPTfVvEtIHuNmgoH81T2OmWpj/bpDcmxkjFIn76SgMO
X-Received: by 2002:a37:6004:0:b0:69b:dd65:3f36 with SMTP id u4-20020a376004000000b0069bdd653f36mr3343273qkb.487.1649459833631;
        Fri, 08 Apr 2022 16:17:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649459833; cv=none;
        d=google.com; s=arc-20160816;
        b=xQOki2JDB7NJaqeMG4n6vIBkvUyVKNlk810972rK0Pw0waHGy3QbRzX4zR/zBIiOpq
         kLLsP92a1jQ+/FanySBaUaYDVfyWtVg0o5CuqFI84kHonsgkgGLyL/8m4SPwfA3CJUuO
         4a1Cb0WrFHJxwdSQ77T/LeAJkzCiR+akhbZ/I7E0PymStHOHLuUUytUxiZnJkISbEHgn
         NB5i0nwKiU8CKtiOIUCDsGQwe2+obs/B4MDt4Pf4yQF6uzMaBlJKWLQWUJPBaWGRzbg0
         4BVCWUIrNwJ0AGbF3ZzyOQVb+mbVCAdjOBMuOPTDn3ArwmDmr3YrjtIOtJih7ewjNE5u
         osTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=oxym++O7pLgHe70ojKGc/3kTRF5N8tWM4yRaRCkKOwY=;
        b=MjgFW2ef8lgS2NjYi8f8tqF44p6/+Bs1CT8H2jBv++RxPbSQFTs9XTRC5Lqx5hktWF
         1HYtJPENJWYrNrUgbvH7OKLOtRumgOWq5mLqoWj7mXtzHwjFaOWEiZ6kw42fQPt694XG
         P2fYSCfvzc26BsyfgKt95UCwkR5g8Rpihh+w0DMYRIhw4htbtQSGw8e7Imkzqz2RsdXs
         D5cVZcpesC5AJ+qEYEAI4q+cAKPKrOtiFb/Fvq3IYyCsM/WycRc4ew4DSwCv30qo6rV/
         8PQ3h5EGFyxuNzkdWu8YVYcwj5V6EDSj96ejMB8brJOsgXTrbhyAYHIYeqE6CDjs8xA1
         J35w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i3CsCz05;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12-20020a0562141bcc00b00443d26271c8si1188448qvc.263.2022.04.08.16.17.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 16:17:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i3CsCz05;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncxqr-0001QO-5r
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 19:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncxqT-0001Ps-2a
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 19:16:50 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:33492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncxqR-0003nE-8a
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 19:16:48 -0400
Received: by mail-pf1-x431.google.com with SMTP id y8so4517333pfw.0
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 16:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oxym++O7pLgHe70ojKGc/3kTRF5N8tWM4yRaRCkKOwY=;
 b=i3CsCz05VJNFTO5YVgKn2sxTUVc0Sk2FdFk3hQZ/nfjULFJYDXXDwRoWJWcllkCuKM
 yhZ/Mo/i7hl/vUtv7hhMztTxusD52w4UMO5/635FJeUHTN420OST3AHPpSek71PZ9PU9
 yeTUkHFz2lkm7EUxvDeHNH+vMlzqOjTdzXQEPtmvZC11IbVEd2htEuhEk7TLYgKFg4VH
 fSQPItSe68Z8AycoVV1hNkhrOi5JbFvnGRBFZcXgxQAPLNVOu5dRsOAYxGhFsbes1p1I
 LLDHDchBJ0ogIOoO2abXiR+xUXbiyltx4babb06PXPzKNKRxRFw+2IOVbbIZRhzCiA5h
 3GAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oxym++O7pLgHe70ojKGc/3kTRF5N8tWM4yRaRCkKOwY=;
 b=miv9l7Iy4sFRQJWdcS0r0N6Js4niAMXpE5lm0vlghoAp7e8Ky5n10DW+Xrz0J2iuEN
 X++X9b9KTfptnajB9dAKpQzpZfcGdOyQyKVrafox7PvZlMLpMf4MVdgua+gFBuBlSPoQ
 BnAdl2i+YR9rx43G48sq/uok9+EWnkJVZFhY0ZNUQ7cdPylgV3gX2vjf1HC0FIBu49+M
 N9Wo5PcTeFgT/HPzXy7DEy9+rHxmWkceIM7Xhmr2mxEeem6SLkUMmb2x3zbBnbbr4iBU
 hseaqFnAqCUsT3/A3GeEmBB1iZY0KidKmI9sMvAgNbepDr6RcLy3LxR9+T1esCAb7ZhH
 uffg==
X-Gm-Message-State: AOAM533YM8XvoiMqXwh3OsjViri6LsGvcgPwHGAFcLqkUUiYJt0ihb1d
 AEDEXoU+pDmztxiSlpq7mtJfjQ==
X-Received: by 2002:a63:ea0e:0:b0:37d:f227:ec57 with SMTP id
 c14-20020a63ea0e000000b0037df227ec57mr17033230pgi.441.1649459805513; 
 Fri, 08 Apr 2022 16:16:45 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a62be0f000000b005059cc9cc34sm126842pff.92.2022.04.08.16.16.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 16:16:45 -0700 (PDT)
Message-ID: <dba26a09-5fb0-8fa0-6d93-2800ceb35be1@linaro.org>
Date: Fri, 8 Apr 2022 16:16:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 01/41] hw/intc/arm_gicv3_its: Add missing blank line
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GJXCLyTlFOOX

On 4/8/22 07:15, Peter Maydell wrote:
> In commit b6f96009acc we split do_process_its_cmd() from
> process_its_cmd(), but forgot the usual blank line between function
> definitions.  Add it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

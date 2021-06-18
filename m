Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1650836lff;
        Fri, 18 Jun 2021 08:11:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqqfuSlojRzvyIQxVYSYf1VmHotzUHbORTfe3Qs6bbRykLhH16Xmaams9nEjErntWDbkgb
X-Received: by 2002:a17:906:2608:: with SMTP id h8mr11327596ejc.380.1624029078455;
        Fri, 18 Jun 2021 08:11:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624029078; cv=none;
        d=google.com; s=arc-20160816;
        b=jQG4IfhBnK8NxhdBfebQeXjg6cHHoVpiYFLGR1IGvpaVQTa9UK8as1kg8PhHGI4onE
         oIluksX9pPqQHEBCn+ty3GXs7Vw/TymsEyRgEy+w3maFGS5BB1KO27Q8UgjzDK8IMsla
         +V0Vb3asAImQtvA9kXH2Uu/KE6rB3pIyU4QarGfH6pTVMpCimcTzkgrj8o5+u0HSzgyW
         HuiU5dMmW6OKJKuEKUjxe7DZLGl5xhUup3cWzXdePpklznlLP1K5uFkKJPNwbQgMSgA4
         N8GOtOo5p5gtFC5/I+lCUjji9jbf9YfHZcLR5g915xTS95/7D+RVcLoGfT3DOx01C0LZ
         Ykjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=781V4HYiK+sAWxI2lA4puFTkpvvsAvIR9/CvTGB/X8s=;
        b=Ng5UFK0cmPNdztReDnvHXn68MjYliWEVhxuZE7PgBvMA8iuLA2uaey45BMMfOgJH8E
         uet65pr9MpglnPdBVT5GciOTmSFin8SVEH1vdcS7xmRnucs1/QwrtjLu0bxqmNUSQiF+
         Ndwj5MO5bY6O9iYErVfbty06rUe6sfwyvgXJQaCP/B7+TVvRCCJCxr+8s93ski7sL8fN
         fLburMwvLwn770uSJEcNKwiTm/rYSuel8+Ow1QKV4tVchalxEqMOFQmE3Z/2YfLiDoUp
         2OhBhQ8dqeHSKC/okytTdkWl7jHk02Yqh7ji3NKKRUW7ZNJUrXpaKqjTr/9blicyxDfu
         yuDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="W/n8xj49";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13si8990671edt.90.2021.06.18.08.11.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Jun 2021 08:11:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="W/n8xj49";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1luG9N-0003bw-JP
	for alex.bennee@linaro.org; Fri, 18 Jun 2021 11:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luG98-0003bQ-A2
 for qemu-arm@nongnu.org; Fri, 18 Jun 2021 11:11:02 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luG95-0005SX-Ko
 for qemu-arm@nongnu.org; Fri, 18 Jun 2021 11:11:02 -0400
Received: by mail-pg1-x52b.google.com with SMTP id m2so8043581pgk.7
 for <qemu-arm@nongnu.org>; Fri, 18 Jun 2021 08:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=781V4HYiK+sAWxI2lA4puFTkpvvsAvIR9/CvTGB/X8s=;
 b=W/n8xj49kDXyoz0M72d1gC44x1cwIvMsHOQXKJea5eHa10Uawat456jnyPxDYVBCU6
 Vv3RegsZlI3HGUoQcUMcHEm/LJSZJzfbNHlXhZlhi5lw8cnaxul8N0Dz5fkMt8S3NYPd
 z3pJsqYdVCa3WRRK6EgjHHAjTWMgaVm3jMyJVUm1tl9PbP7mbnW66H8Mao0vw7s3JjrH
 zjbGvO5x3ax0dQ+49caeF/kQm6ptobxoFg/o//89nSau65KFpce+pAJVheJ0oFZSKzxy
 ofM9c//DshVtwNnrYel5sBJwQ510CQVmS+fr7Va9aLcalzd0pbzXr9776n08tIvVJPFQ
 Zu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=781V4HYiK+sAWxI2lA4puFTkpvvsAvIR9/CvTGB/X8s=;
 b=ccyHbEoxguJUCobRFtBC3dc9B3yTYVqAZ1K/Vcx+tPwR/YRYWn9eyKrWKqlFXItzAL
 b5r8ION6Vb9MV01B/kPXXXSFzElGRDVLjm/b6GNNs167kFuGHlTrlCsPA56tIXVLCCY5
 0CpsI2Ux/dSoedt0wtRBENZu9B3rY6QzA1NxvHp4R9X6/8oOSR3Fs9FYzaA6YfUcDAOm
 DcxYYvP8sFqezLJhl5rNtHGXecg9HPt4ohFOnluf2FdTtTBDLOCqaqFUu3hGTfYAWdfe
 gclHRMukQdfqkcIwK6BDNd4Od2/zTNwqjyEwYz1H7UUQpIl88c2tec3p5YleL4X7f+0C
 Vwng==
X-Gm-Message-State: AOAM531oZjfGuHehxcvGJ8x+RnCNJcyOq/auosadvdHHg6doNulKyDMR
 G86k9HC1IzAknUBMn3RyQzjhTw==
X-Received: by 2002:aa7:8641:0:b029:2f4:7263:5524 with SMTP id
 a1-20020aa786410000b02902f472635524mr5621269pfo.70.1624029057883; 
 Fri, 18 Jun 2021 08:10:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id r14sm4002215pgu.18.2021.06.18.08.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 08:10:57 -0700 (PDT)
Subject: Re: [PATCH 2/7] target/arm: Handle FPU being disabled in FPCXT_NS
 accesses
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210618141019.10671-1-peter.maydell@linaro.org>
 <20210618141019.10671-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b265ef2d-e963-e742-ce2a-d8df717c91d4@linaro.org>
Date: Fri, 18 Jun 2021 08:10:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210618141019.10671-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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
X-TUID: ol2XMfj47P+S

On 6/18/21 7:10 AM, Peter Maydell wrote:
> If the guest makes an FPCXT_NS access when the FPU is disabled,
> one of two things happens:
>   * if there is no active FP context, then the insn behaves the
>     same way as if the FPU was enabled: writes ignored, reads
>     same value as FPDSCR_NS
>   * if there is an active FP context, then we take a NOCP
>     exception
> 
> Add code to the sysreg read/write functions which emits
> code to take the NOCP exception in the latter case.
> 
> At the moment this will never be used, because the NOCP checks in
> m-nocp.decode happen first, and so the trans functions are never
> called when the FPU is disabled.  The code will be needed when we
> move the sysreg access insns to before the NOCP patterns in the
> following commit.
> 
> Cc:qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

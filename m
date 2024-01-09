Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp520164ejs;
        Tue, 9 Jan 2024 09:12:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKJntIYOwXP5kZE6J/eLegU7MQczG34BnD7GSj8pYgwfKGr/d8R9XEzwSmvtlHrIu6I3b0
X-Received: by 2002:ac8:4e8a:0:b0:429:af09:efd9 with SMTP id 10-20020ac84e8a000000b00429af09efd9mr439790qtp.14.1704820355289;
        Tue, 09 Jan 2024 09:12:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704820355; cv=none;
        d=google.com; s=arc-20160816;
        b=Qn8GIhYseayTTEYoaF8s/c8tRoP7j6iijUNkWXOCVvZMzsLKA+wXnLUNs5Hjw9YcUC
         /nFPAOup3rDfbnVjSZTDR0XOfyA4qGiGa4F52woyJniaoa/VfPUGFqhtNsWpt4/589n5
         O8602BOpgTy9C2n2uZvOL79v5JxLk+Fv9E5XRmhQd3xXafAlZgKtuf41PvNpzgGKEgxS
         Li20+g7O8gBgmraQuYuWbZSz855lxjccRWCAIRHWOeJVCloJ/qu62+oA4YDKp1NJJlgR
         +uLQEmG4UVy1oWUrn6yR+Crq0XQghGncUsKlauigTvc5dErTTex6RF30v0eLPGzWcUt2
         LTIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=FcH7a3HEDNtcNeDNTDcVX+QEyrxq/bzy9SsOX2YvokI=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=Xe44gjTB/bvSu55iylpnpK44LjMlyIFKhC7PU6soYkte7RpHtsBQd1O3tv6zbx7sXG
         9shIlfZAbAwx72Ul8yejBRBSNxoTIBBEcXavYd+uqAslUYh+bxLX+ag7eBnLrHUMg9kB
         PV8dzk4d+Oq712v5LgB0Qv08Dg3nSsQUUpuNvWUspibnOnOFLhwvZUHvEvKAMkiCicSx
         lozxu5oJFU+wXZ7YWDim6kzppsVaz0RdglIi5IZttZ6VyzB9jPO9N58/00bFenX4gnt8
         oMb5hy/UcZpxXvS9wBKB0NH81m8WUyTpsjYJLvQnhlCZNOTIbHqXBbokcamr4qts32rS
         r3XA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=De+L3vqP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ci22-20020a05622a261600b004239a83db71si2618584qtb.634.2024.01.09.09.12.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jan 2024 09:12:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=De+L3vqP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rNFe9-0007P8-0G; Tue, 09 Jan 2024 12:12:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rNFe7-0007Ob-NC
 for qemu-arm@nongnu.org; Tue, 09 Jan 2024 12:12:11 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rNFe3-0001j5-VA
 for qemu-arm@nongnu.org; Tue, 09 Jan 2024 12:12:10 -0500
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3bbce1202ebso3070644b6e.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jan 2024 09:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704820326; x=1705425126; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FcH7a3HEDNtcNeDNTDcVX+QEyrxq/bzy9SsOX2YvokI=;
 b=De+L3vqPEoKXMWTejdkjnYFKfE8g4T/CqNgwUMDc1yAAo3EQvs1mxqcw5goYCQhh7S
 KMaeXMLvr4IZB/jmKgQzcXtJQZ1m23vMJPY3J3W9UG0qN1B8MExazoY4l1o3Le7uguEx
 0Gr/CmZEHfd9zB7feVZ7fAfBhuOvko2xlEmlv4BSrKb+LPtuBhIRIk6cnWOAkh59wlNL
 F/9+kjWnM9zQunD0tynfe6acIZ6H+MAMBV/AN3Uz71XaL7QWVUbI9w1NEu2V0asj8RRJ
 g7rTEL9N80OzAQ9gGaOxy/TtchfrVi1yXSQMQvLIXnhkBPxvdmd4bQ5SQs6y8F9bV2wr
 bNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704820326; x=1705425126;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FcH7a3HEDNtcNeDNTDcVX+QEyrxq/bzy9SsOX2YvokI=;
 b=ljFItHZYW+vZELccoQSDv2LxpcInwGsaikLwc5HgpD2rIw5umwcEpT563xe2ZI8aKf
 T4F40R1RwkzL0lX4XWISOGeX2YkWvdZt5TkGAJUf4/xQbeDKF5nq15Bq8cY0r5IzvPIm
 1aEfF2KDR9lAk2t+bf2nBOko9+J9dXudLIFPdMZXpIzWAvybKgMsDYhoQeJaAH9Inhjt
 rST0dKxMmoY5G70Va1MZI5XethcfApec3cX/BP0U6R1K8hvRJgjZ0vQ2WaBr0VTgtp/r
 3WhBMdJiVmYixaWGYZHqh0wKkQZ0AkMKq1vYBUh+3icZMrGjAgrRhnj5tKiP7hipJQ1r
 NMlw==
X-Gm-Message-State: AOJu0YwxecQTvJ/hjcave7P0zOB3nLil/v4oBYYP5S9hM+bdJhGK1UOn
 jSZ/rJ3rM0vPbMJFahkG+yznr56Y6uz3MQ==
X-Received: by 2002:a05:6870:920d:b0:205:c7cd:6e67 with SMTP id
 e13-20020a056870920d00b00205c7cd6e67mr7629715oaf.46.1704820326360; 
 Tue, 09 Jan 2024 09:12:06 -0800 (PST)
Received: from [192.168.47.227] ([172.58.111.136])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a05683011d800b006dbfdf808dbsm430018otq.0.2024.01.09.09.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 09:12:06 -0800 (PST)
Message-ID: <c89b73e4-b966-48d9-867a-75acd74812bc@linaro.org>
Date: Wed, 10 Jan 2024 04:11:55 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: arm_pamax() no longer needs to do feature
 propagation
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240109143804.1118307-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240109143804.1118307-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 7WCRcNz+VDH0

On 1/10/24 01:38, Peter Maydell wrote:
> In arm_pamax(), we need to cope with the virt board calling this
> function on a CPU object which has been inited but not realize.
> We used to do propagation of feature-flag implications (such as
> "V7VE implies LPAE") at realize, so we have some code in arm_pamax()
> which manually checks for both V7VE and LPAE feature flags.
> 
> In commit b8f7959f28c4f36 we moved the feature propagation for
> almost all features from realize to post-init. That means that
> now when the virt board calls arm_pamax(), the feature propagation
> has been done. So we can drop the manual propagation handling
> and check only for the feature we actually care about, which
> is ARM_FEATURE_LPAE.
> 
> Retain the comment that the virt board is calling this function
> with a not completely realized CPU object, because that is a
> potential beartrap for later changes which is worth calling out.
> 
> (Note that b8f7959f28c4f36 actually fixed a bug in the arm_pamax()
> handling: arm_pamax() was missing a check for ARM_FEATURE_V8, so it
> incorrectly thought that the qemu-system-arm 'max' CPU did not have
> LPAE and turned off 'highmem' support in the virt board.  Following
> b8f7959f28c4f36 qemu-system-arm 'max' is treated the same as
> 'cortex-a15' and other v7 LPAE CPUs, because the generic feature
> propagation code does correctly propagate V8 -> V7VE -> LPAE.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/ptw.c | 14 ++++++--------
>   1 file changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

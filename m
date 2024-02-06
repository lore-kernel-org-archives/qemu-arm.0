Received: by 2002:a05:7022:108d:b0:73:d412:d72c with SMTP id ep13csp716792dlb;
        Tue, 6 Feb 2024 14:21:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVcPYdPkB4iENOe5DaEVdP/h/FsFOxBENC8+SMmfexLJSDaik/KaPtgraTCvrofSZIId9s62IQVuLLtl/6x6mOdq5AIDore
X-Google-Smtp-Source: AGHT+IEa4/Qc6VL/38SsmbNVeV7PQx7WF+ILdmNBrU70WzM3XiO3qSP3t+j1iSBdAS+pjLDJmZE0
X-Received: by 2002:a05:622a:20f:b0:42a:ad8a:1e23 with SMTP id b15-20020a05622a020f00b0042aad8a1e23mr4178249qtx.62.1707258106904;
        Tue, 06 Feb 2024 14:21:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707258106; cv=none;
        d=google.com; s=arc-20160816;
        b=Z6tGgVXvtPbU6+ET/poTiH2YIE8LUylVsmIWn6mwHYUYVIk41argN1UUiBeqkgKYZb
         u7ZEiRnMMb9D5yPe3UHAhi7GSNSKkADF9T8VlrWD9CiqCRe/F1kPT6OePYyRkdSYfLxL
         L/fjQYgxpDPj1JcPd3tKYubo2hjSyB2eij3Op7ZhG4IrXZHpTnuXkEohjHAuULoAgYzm
         s+KVSRWqjE6QaCOQaZwoNGtatGNNfp3TdnYR0MLOBQYKuuWV5qGhU/dtY3ewEEryDkI7
         4h6WRLHCUzOKxHW73D+AOxADyMjOdtWAT+Fjk++QqNbodX3jGISN44baWeo8WB+bpb5t
         gIyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=tz3YkQkdu+Ipsvb/V1NtvBWEUdROxzeJq2B3ecyGZiE=;
        fh=3KXPo4FBo6RW55R1kPH3LDmh7Qw6XmC7YqP8sFHCLkM=;
        b=pLqGlg0uf+DlJsGMXFRZ5lJWqKIVGmD04oasGUZZNobPISGBvrKqBk/ewtOWrILwKU
         OyBLGoxhhbG6P+81n0Jj3Nes715615xewXRY0EO0a+FNFPMqoRyEUansEyRbz2sbrfEv
         1LXyvTE+EhxP3QZKl6AhJdg8g8cFW3m41p5mofptvig+pomLQJdYiY2SeVT9dar6pR3h
         9IXuOYJHa6yQqubGV2pNAMHFtKgrrPpwPjdwtwT4OMsRUh/HHPXb+SqNqM34/PDLaWU7
         3yxG1kG+BRtDs0qOJk9NlDmtQZOWc0xNKuKjSTh4aLu2v9Doe+TzwbmAezWpogQNAj/O
         hDrw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ojhXJzC7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCW9DsbPCnowpqR6k5OIeVe5+99xTOu1jzl/iVte7Ri+Y45v367u3hevBMGC/iVoIg9hyMyZRCwjyKGkVIa2KqqpANwYVdyf
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n15-20020a05622a040f00b0042c3696b979si2261026qtx.358.2024.02.06.14.21.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 14:21:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ojhXJzC7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXToq-0000R0-DZ; Tue, 06 Feb 2024 17:21:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXTon-0000QO-51
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 17:21:29 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXTol-0004mI-EM
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 17:21:28 -0500
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6daf694b439so25278b3a.1
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 14:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707258085; x=1707862885; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tz3YkQkdu+Ipsvb/V1NtvBWEUdROxzeJq2B3ecyGZiE=;
 b=ojhXJzC7fQMczVtE3mptsIHRar9OZkbOUafDJtVGRcjwEs3A6+sGQnNsqrTmpWd+7e
 pTS6fhotQTloic+uVycVXqVJG+zEbeL/eW8BAK3waspp+tkdSiEMNMCcOc6OHH3VeXTy
 S6HRm8q3PDsov8lS+aQiPMluKnlqK1ALNZcmleLuPf7yNhBlHqXylaoNq8y5dgydzGhU
 scJUXwuFKm/b+0glnEV9SuoiecU8vN3PPrbkPGeuiZWX6wPTiHgNy8NMs8Fgc0fez9/w
 g0RPajxmr950fvVej1+oLGV38YT4F6bt3puThU+ueUxavAI7d36LteKzAGWosCMkmisj
 Lh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707258085; x=1707862885;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tz3YkQkdu+Ipsvb/V1NtvBWEUdROxzeJq2B3ecyGZiE=;
 b=ELADiwBDoVN5TN98sX58gnHXVlR1jEEwDy5TWKVYepk6lvJ6OgQ/O2YNkaMe8hcE78
 Pz3MBXm0kh30dir68ZycrL1BT8pok6lP8uiu/thGr/Clm9CHd9GIhaLp1biIHZYzQXYn
 7YPthastRr5k5hI/87H5/xFNXUG4gpcozWn2/lukpXqRE+rPebr6EnCkToc0sQLMnvSL
 ZuWcNiDx6nKHTA80oG3Y6FDCAsWMx3tLI+JlREOlE5Vpq48Y4l2l+5XpndxA+ViqhZRr
 L967+sXkjZj+UdpTcFfHYCQlPHwi+Ulg1ysBQzIVnCTb0DGXRwIesXRTL2YkFcOz97fy
 X4gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6hy0AXjHcZbnjXZGrkJV7u1uGTaBxY0MeiozKVtsxjnNX4M54yWd2YvMftLVqEoIA6719bPvNSfEe2Fcd8IuPfEEM
X-Gm-Message-State: AOJu0YwxxRC9qeGCiqArt1XQNvHmMh9XrYUB+Jt4ofoIrqWDIKiBtvLE
 g+9hhod8dgDY1BVOSS2gD1Owy9Has1h6DRdOJqY0xD4jyyrVeXL7Azx0Rybyle8=
X-Received: by 2002:aa7:84d9:0:b0:6e0:5254:c9f1 with SMTP id
 x25-20020aa784d9000000b006e05254c9f1mr873702pfn.18.1707258085519; 
 Tue, 06 Feb 2024 14:21:25 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCU/pEGfbQZsq7sZXVIyt+E5jy+yIh6zWgCPT1+KCRTt1qJFWW0JQXgiqllKTqzaA81SZyJSRYCCzg/y63uHew22WugyHNToI3kaf/UAUQys+LfDSdIgG66hT0k=
Received: from [192.168.0.100] ([43.252.112.200])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a635016000000b005ce998b9391sm2672528pgb.67.2024.02.06.14.21.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 14:21:25 -0800 (PST)
Message-ID: <0b1126e3-3446-447a-9cbd-a646cfdf4049@linaro.org>
Date: Wed, 7 Feb 2024 08:21:20 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] target/arm: Add Cortex-R52 IMPDEF sysregs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240206132931.38376-1-peter.maydell@linaro.org>
 <20240206132931.38376-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240206132931.38376-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GNlB8z01VihA

On 2/6/24 23:29, Peter Maydell wrote:
> Add the Cortex-R52 IMPDEF sysregs, by defining them here and
> also by enabling the AUXCR feature which defines the ACTLR
> and HACTLR registers. As is our usual practice, we make these
> simple reads-as-zero stubs for now.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/cpu32.c | 108 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 108 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp211723lfb;
        Tue, 1 Dec 2020 06:33:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxopn7obfKIGmNiBl3EBT5u612OT9j10J5GQNxEBqK0T56rk5LESFYukrMKYxYdfWjQTo1R
X-Received: by 2002:a25:ca85:: with SMTP id a127mr3241513ybg.432.1606833230480;
        Tue, 01 Dec 2020 06:33:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606833230; cv=none;
        d=google.com; s=arc-20160816;
        b=pJK4We05pe3oGrlTqjkofqKnAqw4oiKBe81uL6qq/UrWBQPocyEofcfTGZlA8bOXxg
         RaaCUePqHYLPUV2a5Fn6xEWHTZn8LYBMweO+3l81AK7X6UsaDbu4qUL24uGkWiZPKU3Y
         iqW1h+raGBVafLuJCV7n3olrf1aDUsaV/U7kK6rg4olGcC+pNFlPDIt5Obztb5q70DAH
         jp6fiKG0Ej+uSASLzUzeKfJGIVQUbDAF1suRimj9JTd0raqVz4gR6r3IiIczcB/+Dt4N
         857FlhTq1Hwmm6rz2+VI+oq3P6TTl8ky+gKyZDqAM/vJMYFycm4LWfezOvEMOorO3AE/
         /Udg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Oeb2wEf1cCqoJ6KVFmcxGhhuFV6B7TW6ZoHG88Vh1h4=;
        b=rRIOgDzoMZ27RxqIGffSUQNK7P37Pg0rgG1PFZ9FaMSWYffPA3QKum3rwWc07Cw/rs
         Vy+hpBQNRvMrpVwn80Q+d3cq8GcA+NWIIeT8nJTHahibtCn8wyGCcO9eqbJIMEd4vpH9
         n+f5Tdv2SqMYCY3byMAl1q6ECJ02+2+9VMZ6WVw587I/skUR+rKCkEQi0tjxnSxqbBkE
         rWiH65wA5La77XdRlnGEQmEamF67X6MOgG9B3nNaAikreAUauO0w/6yBG+4W9UBMXvJR
         IjhwO6CnU+K0LUVwdOn/ctBvMlNpOBGS3SxO+DvXwXBWhFvFERbQrXs9nWSXvbS4Q9R4
         FzKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jfW+l/NN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9si1901936ybp.362.2020.12.01.06.33.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 06:33:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jfW+l/NN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk6iz-0000qN-SV
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 09:33:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6ir-0000q2-KO
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 09:33:41 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:38118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk6ip-0004DD-5R
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 09:33:41 -0500
Received: by mail-oi1-x243.google.com with SMTP id o25so1933268oie.5
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 06:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Oeb2wEf1cCqoJ6KVFmcxGhhuFV6B7TW6ZoHG88Vh1h4=;
 b=jfW+l/NNKTlNKA018j1BCq//P/aMEszrk3ts4iXnpbc6J+jOCPY5k+VDYi5Q2rD4b5
 zjuqzpP2Xd19g7rF2mTd7g/0+n/FV3Z3WW7cGL5H7za/pzCCPZKY4GFASEQg1aL9NOTZ
 uddP8gjKhhVkYkjmoEZHWRoaVwDgBLgda/bzfohz8GL4aopAF+cD7Qey/x0XdVh/CBne
 hLOVkNarznhvVGNCb0asfWQG+AqnY+CNWk5ljTlp2uXxtOKiHF9s5kQUqJqGFPQqW2cv
 NpFgj/YQAtrGj03BD7jPPv9rCebYlRRaBq7MVTNtHoy2TatH/bHP6cjeQ8pPCYNt6WIr
 fFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Oeb2wEf1cCqoJ6KVFmcxGhhuFV6B7TW6ZoHG88Vh1h4=;
 b=WpTU9/orwkXEc6xPsEIH0jlmNkjDi4WI/8g1M5fgzhyeMBGMADSiQmVWdAuep7WREv
 Nbl81RNFTeSBtnl5xN1BlhbbIKRgrgm3X2KaIiHgRagHh5zHHvdxoDJHZcSNLOqO8FP4
 AvABeZVW8hSfFl/anQnRxqNGY7rfABkVZaVtbk1I+XeDwd6drq0+Ei3RXxVQZz6ozP1/
 0EQCLTDeYbix/Sjrcm1/11dsBZjPob7TMFT5iUL4MlGXQO4cohqkUs2SVqjAQkNohK2v
 hN1gKhd8wQRaC0Sy/wHGnTdZmFuyad0E1/RLyekfM1IiRHamR1ktXmGYbtUuyfq3qN4Z
 YbMw==
X-Gm-Message-State: AOAM532RCptJwn81mFjXuWQVgYk/UJwY0wSCjOZOjA4hZkaD9tjmNBpo
 5xM6dqX9dWsqlj+9DrdHWtxtow==
X-Received: by 2002:aca:bc84:: with SMTP id m126mr1782360oif.169.1606833217940; 
 Tue, 01 Dec 2020 06:33:37 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id j18sm401616otn.23.2020.12.01.06.33.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 06:33:36 -0800 (PST)
Subject: Re: [PATCH v2 16/28] target/arm: For v8.1M, always clear R0-R3, R12, 
 APSR, EPSR on exception entry
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <33ee05d8-7c54-e137-eb47-c9a7fccc4e2d@linaro.org>
Date: Tue, 1 Dec 2020 08:33:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: H/Ph72wpGnIc

On 11/19/20 3:56 PM, Peter Maydell wrote:
> In v8.0M, on exception entry the registers R0-R3, R12, APSR and EPSR
> are zeroed for an exception taken to Non-secure state; for an
> exception taken to Secure state they become UNKNOWN, and we chose to
> leave them at their previous values.
> 
> In v8.1M the behaviour is specified more tightly and these registers
> are always zeroed regardless of the security state that the exception
> targets (see rule R_KPZV).  Implement this.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/m_helper.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


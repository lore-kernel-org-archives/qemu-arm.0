Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2006578ejb;
        Sat, 3 Jun 2023 16:14:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4IgK0MgSBRmQTXYE2p+vsuemaGzPKBHFD+HUUAu6y4vrl4xwGNMrFCyJddApe0DIbvQZfX
X-Received: by 2002:a05:622a:50e:b0:3dc:fa58:97fd with SMTP id l14-20020a05622a050e00b003dcfa5897fdmr2659833qtx.25.1685834079003;
        Sat, 03 Jun 2023 16:14:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685834078; cv=none;
        d=google.com; s=arc-20160816;
        b=xT7FLLLicHOFalx0LJ7RJLKbCETj17bMqQaOlhRn9J/MzXDrrp05sqU4ipD7/W42Mr
         YwOzEU+bv8SvQsHyRAsNgQloUthpZ/Jf6UbQ4IC7UC6i7P9qGFLgwM87wrAXPjLjP4dF
         xka1Vviu2aUpVLvNzjgrbTWjUmcWEtvANPfeLnrh3HBWMAqj6oYf/T7BMi7rcZ/4Dgw+
         kwvMFrzpvAMaupUGK/j7rCeGacu/e+MPSiaCo9/iaV44VAnnXbjFeO7E5Nnrtq0y7ebp
         hlJoKQrdJ1XPbKDc1awtv/jMPh8fJEIoUYgaM92bNJSyL6LMHqJf68mKq5A3p4ENbpJn
         J7DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=2sPuJmHWUCHXEUBfCR4AWvKsVc0ayOO1XNPtTFToBUk=;
        b=LlubG9PzbOx0elQoCwEOuEIR6t9TErKmFCNC7nvSXA3boERpI/P4sE0+4/A/xGMJCN
         XvEV027dUB660Okm21wh/xhbCn/+9ejnxWmCJgjioAbWIoTqGwlsRzaVMf6k0tMgIIMH
         cXD9lSxIiJGbJDI06hJqLkSbN7P1502p1XDPotvXr6vbXdRllHCFmJH5PwLbg+4mvknU
         T2a1jBomWPBOYR4Dxfa/NLLOzi/87LmQ/+2C5HF5cIdHyq3X1R30lwQRo1C0LmYYNy+u
         hNhjtf7aow+RSKMBuWAlL2qz2NlJD64N4sk2vtTt9j5BxdwpZhHIjqVlESFJHqNyYLBI
         XqwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zNiVpZSV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13-20020ac85c0d000000b003eb143c58aasi2835765qti.600.2023.06.03.16.14.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Jun 2023 16:14:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zNiVpZSV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5aS3-0000RI-VF; Sat, 03 Jun 2023 19:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5aS2-0000Qw-J9
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 19:14:26 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5aS1-0006lR-0E
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 19:14:26 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6af6de9fb74so3109374a34.2
 for <qemu-arm@nongnu.org>; Sat, 03 Jun 2023 16:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685834063; x=1688426063;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2sPuJmHWUCHXEUBfCR4AWvKsVc0ayOO1XNPtTFToBUk=;
 b=zNiVpZSVgTbLu+SFup9EV0jPxGwAdSshIoWznB0s/Pp70Ses5fbzGwXB1qtFxFx6oo
 vh/e6IgDhQ4hd9PFhFi140jdK2EIem1jKrm0U5oiDWWuTcERPJRKf871C+2aEuGd37Dk
 Yqn/CE9zgwGpgyGNudyyTJUWSbL8e0YazO6xdNI7lgFrkxYpDGDMMYgtpwMJSexGnixN
 zcWLBROFdjw7AQfI2rrykGYTVpVz/z2lX4dgqBAc0dbEKGQazdYNESz36PGKNSdcfH6V
 TQSz4CNIqQNphKLzMYkumJUS2ZTxTnf5OSG56s7m2TPTfg5cEzyLyFAQJo+gesKHDKg/
 Etyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685834063; x=1688426063;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2sPuJmHWUCHXEUBfCR4AWvKsVc0ayOO1XNPtTFToBUk=;
 b=U4S4DTUe5yrmzVhRTIsBnzzCPszvA8614Wy4ZrQcPfsKB2fis8VN1gvC0+3BoIO1In
 8uerq0ON7We0GXoZUXYbuRflBtYW7c9m83/NUqg0nu8UEYpzruxU/nNqYB81ZSckqfdq
 r0YpzVjUD3NbX9NOVs+oL2GNhqdcBveAYzd4fSnEi7XxZdvxVpECdYmPGmBbIPnTpJQY
 Nq9JXZDSmwmbfTdu/N6IR8W1bQI5eQTKkEdnLVww7lHEAhlCxJnssLhEFNLLmzLgxbSq
 B/+G6yAvZw3k0eCWJpCPsbdEM+TsJCTNsSMywHblsRDm/rVrw8woHVkG+ppwFL9i0ywV
 ZYmg==
X-Gm-Message-State: AC+VfDxvFUgv3LHKtobXNf9vqEqVCMZ3/FaD7v7EHhUcrMletDQKJ+WC
 DTmm5N7Zv2C4ssRVj4HtV9e1+A==
X-Received: by 2002:a9d:7e96:0:b0:6af:8f03:c22e with SMTP id
 m22-20020a9d7e96000000b006af8f03c22emr6546545otp.16.1685834063619; 
 Sat, 03 Jun 2023 16:14:23 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:9a37:84b6:b3f0:f301?
 ([2602:ae:1598:4c01:9a37:84b6:b3f0:f301])
 by smtp.gmail.com with ESMTPSA id
 z5-20020aa791c5000000b0063b5776b073sm2863601pfa.117.2023.06.03.16.14.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 16:14:23 -0700 (PDT)
Message-ID: <551cfa44-849f-eb06-b415-688c02dd72ae@linaro.org>
Date: Sat, 3 Jun 2023 16:14:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 12/20] target/arm: Convert ld/st reg+imm9 insns to
 decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230602155223.2040685-1-peter.maydell@linaro.org>
 <20230602155223.2040685-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230602155223.2040685-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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
X-TUID: EqEZJUIVEEjB

On 6/2/23 08:52, Peter Maydell wrote:
> Convert the load and store instructions which use a 9-bit
> immediate offset to decodetree.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      |  69 ++++++++++++
>   target/arm/tcg/translate-a64.c | 198 +++++++++++++--------------------
>   2 files changed, 148 insertions(+), 119 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

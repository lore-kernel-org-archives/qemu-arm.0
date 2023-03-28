Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2821816ejb;
        Tue, 28 Mar 2023 10:27:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350aDw2xSHZKJwUA2+KEWkgv6V2MPzsISygPPqg0FoznvlI/3gdV+64WXF5swcKCzX7HSu/kJ
X-Received: by 2002:ac8:5f89:0:b0:3e4:e9c9:df70 with SMTP id j9-20020ac85f89000000b003e4e9c9df70mr11417402qta.10.1680024471908;
        Tue, 28 Mar 2023 10:27:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680024471; cv=none;
        d=google.com; s=arc-20160816;
        b=PRm064s8p0EnE67joEqTsiZv1pJ3gB/zSwHpud2MhbBHHtMgcRdEgUO6WEYCV4UoTp
         ktUjqZyXqNla9ubzgg9J5oiJ26CfCr101cyOVrEUPE4S0YkUZS17IDe8Hse8NA8ibufv
         UwebYMFo87KK0EJc9Gy3mnf3XEPEKWmz3bAb4Reb1lMt0yQ+VpkZX5L1SEUrcmeoHWHN
         nxhcB5oSk5yrLcAUI2uOMqkatCRzP3hFwSBLuGhUzAPt3NM9DyykJyTKlvetYqvXD1e/
         C/sdOPtSKpYg3CB1KEG3z0z5u0RHZvRwwSPP3GxWbJLucbjLzsvfV8R9ezCRcYpn8QqU
         hb9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=/V8UQ6rpVuBY2evzplYKKubAXeIqFu+J7hBXz/Wmh7Q=;
        b=jvVZLkrL9ACARoL2VH6nB0jxjp2S43BRHUvA/58hJBWlfdkGpKLOZVoo2bUBNVp1be
         Jp2dk38KEO9IxvbzhS7zG/I82Mdo6hvFt4Iz8FCNW80QGgNDAf7pKt4KmcNr/U9XpNfi
         zNFNhHrJNVDTXRIh5RtIhsNpTIy2gqhnvwL+bMTbYnFAze0VfrmkdgdpSa0x+HmeCtNF
         Z3rAIep0wXK8ZOcHi5B8laX/nqCahKEDR2RHU6fhnDwIsqA+uH05MnKciFQASynZG9su
         ROt28YXiZSaLnir7L8yLbYju8djQbxIHJQCMg+9tAAahMWz1AbYegUS49jWHUL2/+/dv
         CccQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Da2r5nor;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5-20020ac85805000000b003e4e2eaa3adsi5175639qtg.65.2023.03.28.10.27.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Mar 2023 10:27:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Da2r5nor;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1phD6k-0003De-07; Tue, 28 Mar 2023 13:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phD6f-0003Cr-B8
 for qemu-arm@nongnu.org; Tue, 28 Mar 2023 13:27:38 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phD6d-0001aC-No
 for qemu-arm@nongnu.org; Tue, 28 Mar 2023 13:27:36 -0400
Received: by mail-pl1-x62f.google.com with SMTP id k2so12382285pll.8
 for <qemu-arm@nongnu.org>; Tue, 28 Mar 2023 10:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680024454;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/V8UQ6rpVuBY2evzplYKKubAXeIqFu+J7hBXz/Wmh7Q=;
 b=Da2r5nor8QtbjO7wl6dYrW/vgBDzkrKDiPHDlcTfNbYtmP5HR8LA7StUvbFWA0cOWz
 O6p9DIabMgDjuwd1ZG9pYYUmAaYuPZwuhr+mzahxnHUbSi9a+h4tzW6vEp3+JaWMvwz4
 qcbqtCIH+4Jw1YRErLJEDfnrOK2b4GvTkIvjDb/Dr4YYU85/nBZG6cQjYk4BzdXmASg4
 idkL9YL5BFxdPnyla8VIW5uM2JscnajCjq2p0vk1YA2fZ8odBiQ08g2PGgqyTlTmxIma
 A8hfZtrqxk5UozjEHEDCnzxvx35SQp5eS2DMmZ+b8ejyvKrduxubVI9n0uszz4KHwloy
 1teg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680024454;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/V8UQ6rpVuBY2evzplYKKubAXeIqFu+J7hBXz/Wmh7Q=;
 b=IPn9vBmCUNFvUOV5phEM0aLNnXLzogoUN/LIbqpMKJV8UYqQSuU0yrxnyFUKI5IqYz
 xNdDowl9sRUv6oUoKi8PfBcyyFDyJuQNY0xTdFeCnKs6vQDA7947DtqhtWa4r4FHx0wz
 HxT3w08MHmPWynj23w0AUsElf/RfGbaP8ZG1mc0QndNrDDucPPaOGUIlrjDCHmGMGifJ
 /5TJNjKCJsIjHtLhI2n/tGFAEU7O05kh0VAYfuw4elECKlkYIZMx0/jSZSE7YfYR09xY
 G4NU/t24eHHGarJLA8XWWgf8/y/bGdaAGOLehdF2OYfC0jSO+wB1W7VjqloWQ67WWPM9
 kVng==
X-Gm-Message-State: AAQBX9es4XMx6eH6s3pTrvWBDnE21qN/WoTIAAAZUbNLb10ubc3SHzAB
 Gb2CbdZQ1anytrXiFdaKDxILrA==
X-Received: by 2002:a17:902:d4ca:b0:19d:20a:a219 with SMTP id
 o10-20020a170902d4ca00b0019d020aa219mr20196211plg.66.1680024454210; 
 Tue, 28 Mar 2023 10:27:34 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 jb9-20020a170903258900b001a20791250esm10163891plb.22.2023.03.28.10.27.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 10:27:33 -0700 (PDT)
Message-ID: <e9e8fb66-3fe8-2519-95df-6ba6c52d53df@linaro.org>
Date: Tue, 28 Mar 2023 10:27:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.0] target/arm: Fix generated code for cpreg reads
 when HSTR is active
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230328162814.2190220-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328162814.2190220-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 1N4/jKrUj7/j

On 3/28/23 09:28, Peter Maydell wrote:
> +            /*
> +             * gen_exception_insn() will set is_jmp to DISAS_NORETURN,
> +             * but since we're conditionally branching over it, we want
> +             * to retain the existing value.
> +             */
> +            old_is_jmp = s->base.is_jmp;
>               gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
> +            s->base.is_jmp = old_is_jmp;

A third solution is to simply set is_jmp = DISAS_NEXT here.


r~

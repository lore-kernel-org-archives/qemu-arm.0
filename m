Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp1125200eju;
        Fri, 5 Apr 2024 10:08:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrddU4ndbw0gcoJi37QpGYop26dOcKyGZoeAAWayoflttXzBOIuQqPm6BAoJv5/mWuEUAGMAdQpSpHKl0OUyOu2t6XCsje
X-Google-Smtp-Source: AGHT+IEnXJzC3bQHtzsR5SnXt78XcQLR+rpUgQQ0gu+Oajg9So6M5pNhyAVjcH2qpxYyV6oRLdCc
X-Received: by 2002:a05:6870:700b:b0:22e:4d91:68f3 with SMTP id u11-20020a056870700b00b0022e4d9168f3mr2163277oae.59.1712336913923;
        Fri, 05 Apr 2024 10:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712336913; cv=none;
        d=google.com; s=arc-20160816;
        b=wuRit+qtg2GwdeMgveoUcmgpsa3xAOWUhWfB4UIlGuGC1QYeu7D/N8wLjlEt/k2/3e
         NKKcbWRAsOh/EjcYlSUGyHf5uUMNIrxUPLW7tnD6pJvtYOcKqgIA3eZ1zZ+VjcYxV2CB
         6vP0cM6UO8wu0bMDysw+Xdt0tV41dhA0AuyXMZFfqDpeYuzKCL/0efkEp9uxx3McXEtV
         2FdK7JSjZJZBV5B4H4Gm7PTC/rafFkyHeGAxSbh2voONRd+1lwjqrGcpB+VNKnaQIq50
         vjl7BxYqjrM98FZQBfR5P0RbASrXNyEagRhqG6oB2/xypNFN0VePYN2REci/gnD1GaX9
         CVoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=hKIr47iz1buAmMPGzvABuUjvKOA4+I6PgN03YYyEOL4=;
        fh=r7UXyN8d/JsfB837m8+1Dyy/3xuui+Qr7cu7R0ec8vo=;
        b=jywsZHH2eCIt8+Zd5Km/J3CEglJhgOUKrAh/0Xn9wKRt5Pc68C7i1/+WwID9dwFZNM
         7SymPzYn3Fa9Sq5xYTf66ZOtZlVmtxjNXFxJfyyofuFldSQFqDHQ1thk7BV1mhKowuZn
         g80bQlEe3BOFz/+W/UbJaO+mmVgduKr/aaIh+OkEhuKBLiP0dlgr+Or8S2XvKPWiiGph
         4KJbfiHCaxUwIH456SeGm0PrsAbEBGmxPWyEHZ+mMKvhQMAWQMKZqR5F/9GZ7ELS3aPe
         yUZMgSE7IGAN1NoUPfQxsrjv48U/9JiVzW+EuMie1nfXVEuI/NPY+JFbICUNBruvQbxL
         5B1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ewo5oPNS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19-20020a05622a179300b00430eb668d66si2182889qtk.161.2024.04.05.10.08.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Apr 2024 10:08:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ewo5oPNS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rsn2w-0006OK-Nd; Fri, 05 Apr 2024 13:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rsn2v-0006Mt-Gd
 for qemu-arm@nongnu.org; Fri, 05 Apr 2024 13:08:09 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rsn2s-0006T8-Iq
 for qemu-arm@nongnu.org; Fri, 05 Apr 2024 13:08:09 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6ecee5c08e6so2114062b3a.3
 for <qemu-arm@nongnu.org>; Fri, 05 Apr 2024 10:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712336885; x=1712941685; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hKIr47iz1buAmMPGzvABuUjvKOA4+I6PgN03YYyEOL4=;
 b=ewo5oPNSIcN+D15IMHTmyNxhBlmFLVdeOdu/GjGZ152u+4aApu5RS2nhpdYYmCQklc
 MEnNIOg8vP+5egeh1LMzJUQMi1A6tFWd1UYag37J9dWCPv0dvciQm3LW9MQq0KZfjzHf
 cPvWfPwMVJkseHBkTRMbpoP2GN1W4/8uIeLu5gSiwhvYHeSe2dtoJZhZ6ibS8azXaG6B
 0nULfVrySW7w0qIQUDSVT3CI0zmtw2kftPDohT/i5AbrxEFQPRIUhLrr19oyC6t4aYhe
 4NbLI8/K1ePsaGJCDc1oVI+Yyl94ljYiQcSmNEV0hbIVeASptU/d/N6BW0/5zm2hF/8T
 Y+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712336885; x=1712941685;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hKIr47iz1buAmMPGzvABuUjvKOA4+I6PgN03YYyEOL4=;
 b=r+PYfijNDzp3tzvvmjdOYD5dG9tQNqti/yVfwmUN/JRojAMAwKYPy5EHpOSVHo1uUa
 WDLJ9akLBRvbA9mjKvW2Bziq41mNkyHeHME6x+vUrhtiwEIZTmkVSNeZhJpZyiRrKqgq
 hHkKwpPdT2X53nUDUA1dWm6ySrLy8Mx+vNlAdO5geAjHl0tbgxk4oVD0ELz7X1TnuPM+
 plK/fU1S+bc40acPMGKqjdchkndvaTFsdk0qJjxEX34rgJd7hgeXvIEYuM68cHAnxhjf
 g/tIr+zLgIXc5pUToa9j0V+cwp6VwUyD0Gw/Hxbg4ll+P1/cdnIG4dTaQKywDzmnh1Sq
 wWdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpB4xkvdBAoUVbKbVLYXb6LenCPvlweeW012yWX1cMdhBxTMDMhkSv1UnbMbrMpYBnUQuITeNfEnFLvcFTP4gQvYJS
X-Gm-Message-State: AOJu0Yz38ERKOfh9NHQiJlqXA/o+Vp695rUPRvnbAPtvOuS8ahtHkAOw
 pOBTR9LDcpN9I9yxjnpBQc4S1G6Y5h6k5SHu08Dv3dFQ5x/eoS5qsHsATZJZtdY=
X-Received: by 2002:a05:6a00:991:b0:6ea:d7b6:f4b4 with SMTP id
 u17-20020a056a00099100b006ead7b6f4b4mr2368374pfg.21.1712336885060; 
 Fri, 05 Apr 2024 10:08:05 -0700 (PDT)
Received: from [172.20.1.19] (098-147-007-212.res.spectrum.com. [98.147.7.212])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a62e808000000b006ecfd0bf326sm1790938pfi.99.2024.04.05.10.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 10:08:04 -0700 (PDT)
Message-ID: <e648b60f-6b1b-464a-aceb-441f1a79b54d@linaro.org>
Date: Fri, 5 Apr 2024 07:08:00 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] tcg/cputlb: Remove non-synced variants of global
 TLB flushes
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
References: <20240405125340.380828-1-npiggin@gmail.com>
 <20240405125340.380828-3-npiggin@gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240405125340.380828-3-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 61zG0kGF7k0K

On 4/5/24 02:53, Nicholas Piggin wrote:
> These are no longer used.
> 
>    tlb_flush_all_cpus: removed by previous commit.
>    tlb_flush_page_all_cpus: removed by previous commit.
> 
>    tlb_flush_page_bits_by_mmuidx_all_cpus: never used.
>    tlb_flush_page_by_mmuidx_all_cpus: never used.
>    tlb_flush_page_bits_by_mmuidx_all_cpus: never used, thus:
>      tlb_flush_range_by_mmuidx_all_cpus: never used.
>      tlb_flush_by_mmuidx_all_cpus: never used.
> 
> Reviewed-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Signed-off-by: Nicholas Piggin<npiggin@gmail.com>
> ---
>   docs/devel/multi-thread-tcg.rst |  13 ++--
>   include/exec/exec-all.h         |  97 +++++-------------------------
>   accel/tcg/cputlb.c              | 103 --------------------------------
>   3 files changed, 19 insertions(+), 194 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

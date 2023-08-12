Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp2115793ejc;
        Sat, 12 Aug 2023 10:22:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7HIKM6SQ6VL1teT24dPsNvT2bkZ6A7r8siihguHRwB1myJpI0tKC2nK2lAIuzncGVnOMQ
X-Received: by 2002:a05:620a:2456:b0:76c:b53b:8702 with SMTP id h22-20020a05620a245600b0076cb53b8702mr6741083qkn.26.1691860949524;
        Sat, 12 Aug 2023 10:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691860949; cv=none;
        d=google.com; s=arc-20160816;
        b=H1AqRT/eKRTjUFWoqGVgiVxjNpg8z0jNckeJ2yXSqWd77xrQ7JFNX31F9VUhqZOahd
         JQrgKrj772Sjz4lkwknsoC0/Xjob6EYRUaOStgMGqm8faI683JvEZQOkK7p0s0spgMXD
         Ya7DSptNQSiSzIaihyICtmWKlpOkvgv7mG2V2tSvdw5Vmx/77/WoyILI0QYdrV7sMgfJ
         +FkqLqhZN8WcCQ/Ansivqjp9umLeCwaYi6+416bQNLMRkDOl9cPqDTMb4VkjCHcPfqfD
         CaAoNLhqKl5zJy227C32K69Ys4GlcdlogIwQkO9R+Jt+HJZE25rfeOWyo3e/yvf5JB+R
         ikWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=qgGV57KQZlsGuw7nOMq3rUWdVKpJCr3aEv1Ya80Jna4=;
        fh=pz/p72iGql6ovcXEpiDH8oiesPwj6tq7LagOATxEJV4=;
        b=tS35oOontjFAsE2C4+re1pkLjgBk6ao4UPISkl1dSHhzuPAOoIzCnlbhNuluMg03oN
         t90wyHfLDR5CZls8X/YT6rC0/1BqbRz1iLO0stqWMrgAP0Cp60eZNy55A+vuIYrMG/cO
         gSOsn5ia00sU9zQGo3tFBRnGTHSPwrN2ckopDiVm0DEFz3CXGuCGtApNLVosdLozmZig
         I6NaBFkYDERATeSZdXLIT6AOesfocmOlVPlmFUJww6R0gQOR/NGN+tAsds7oA90+iYkY
         gBSqJC0EcoAJT2rNfYiQtjbqU2rl7Facq1br+67704rPoLjegI02ewm+imIZ/5eTKLN+
         9E5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=og5s3Spl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs37-20020a05620a472500b0076cb0e6c5f0si3667720qkb.151.2023.08.12.10.22.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 12 Aug 2023 10:22:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=og5s3Spl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUsJ3-0002at-20; Sat, 12 Aug 2023 13:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUsJ2-0002ae-0w
 for qemu-arm@nongnu.org; Sat, 12 Aug 2023 13:21:40 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUsJ0-0005s6-Ih
 for qemu-arm@nongnu.org; Sat, 12 Aug 2023 13:21:39 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-68783b2e40bso2135305b3a.3
 for <qemu-arm@nongnu.org>; Sat, 12 Aug 2023 10:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691860897; x=1692465697;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qgGV57KQZlsGuw7nOMq3rUWdVKpJCr3aEv1Ya80Jna4=;
 b=og5s3SpllX6zV8B7cxgLlmiVR8Hp7F5rw+jKBo720yUPawYj17boLjt95XFLW7ivxD
 VfSxABq5TyKrMZSfKTuvMAW+8MZeeH6s6GcAjJdvmBITj5b1C5nkBRk3NzhxrwgrkYFV
 z+YheJKmRY3RvVRKW9KLd6tikdY3Xv6UKRps7TSNuRsPQu6eyIMpJsFwlUQHSLnTGUtQ
 gs7/iUthPWiHj6mjoJLHDkJe0y+InlOREvCpunn9Bc7o9rbSJcFkg+il558QY4tdE+py
 HRMNJ/cqtRl49a4YOX/9TaCyuX57DAE+J5N4/LLS1M8jjt8nAxwFwv01LGbMCxRzKgBW
 JPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691860897; x=1692465697;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qgGV57KQZlsGuw7nOMq3rUWdVKpJCr3aEv1Ya80Jna4=;
 b=M3QXwKNgyTYW6GUJdTKR0bjqBt225u2xr8X0SOJ6IBjhT05MZs6UoI6Ewsz+n1upjZ
 c9/mficr/2JHZKMnARYHXDPPnmV7KkUcxvkoUCZNeVayx7zrWwvFlFQtk30KXw1bDOhw
 6PqlDJ052hgAgco87rqXfj/eKeLmPdISoIr/XspWZ4nhQvPTSOPpsj6uDs3lHPZT4zp5
 hY/etzX0bghMmN9+jIjILMzu3GXyLDZSgDedgLjSczvvNzTn+AbK2PhaDpK51reIEqpu
 7B/S/9zzaCJgdxVHnsTVQdxO8T00DERhsYBh2wx+C/iGkTdn1g3UpynEeWl1U2loQitc
 1vUQ==
X-Gm-Message-State: AOJu0YxF8jhtaiQIgeL3GKGvIprRTLySv36NcfiPkLX2opRqA7n4eCil
 vtnw4WXPSvtwXGY4qZxXmtlQ9g==
X-Received: by 2002:a17:902:d352:b0:1b8:a812:7bc2 with SMTP id
 l18-20020a170902d35200b001b8a8127bc2mr4457207plk.8.1691860896715; 
 Sat, 12 Aug 2023 10:21:36 -0700 (PDT)
Received: from ?IPV6:2602:47:d483:7301:a229:715e:62f0:756f?
 ([2602:47:d483:7301:a229:715e:62f0:756f])
 by smtp.gmail.com with ESMTPSA id
 jh3-20020a170903328300b001b866472e8dsm6145738plb.241.2023.08.12.10.21.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Aug 2023 10:21:36 -0700 (PDT)
Message-ID: <3264dbe3-0c33-742c-5c5c-beedb57f5e84@linaro.org>
Date: Sat, 12 Aug 2023 10:21:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 20/24] tcg/i386: Add cf parameter to tcg_out_cmp
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-21-richard.henderson@linaro.org>
 <CAFEAcA-N-QWQXcHgMNnXTr+Bmf7fhdSKYQwS-kkWGdR+UHvT-Q@mail.gmail.com>
 <CAFEAcA9xsPHOeorJvjfO7mrpX_TfYHMNcMHi3dyt41+CktyXsg@mail.gmail.com>
 <6a116d10-5e01-30f8-fbd6-30c062fcccc5@linaro.org>
Content-Language: en-US
In-Reply-To: <6a116d10-5e01-30f8-fbd6-30c062fcccc5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.972,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: 5SYdmhyyuReS

On 8/11/23 08:06, Richard Henderson wrote:
> Basically, test sets SZ flags, where cmp sets SZCO.  I want to add an optimizaton using C, 
> so "cmp 0,x" should not be silently replaced by "test x,x".

This patch can be dropped entirely.

TEST clears C (which cmp vs 0 would also do).  I was mis-remembering INC/DEC which leave C 
unchanged and thus uninitialized wrt the current operation.


r~


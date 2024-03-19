Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1557856ejb;
        Tue, 19 Mar 2024 14:01:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX9lJCm0cpuTOTa/ftNnGV/Q05xlElNJRXxS70jkSQ+ig9CrVR1RBL4iyt6FZHqTYTi0Q5c17L3Dh/RyMGZLetZyWMew5Nx
X-Google-Smtp-Source: AGHT+IEsagwOPbnQFyM9Nuv1GdbZpv+gEnbIvIYPK6OwS/5X4ndYn6lx0Qt/1lWJMYVdz2EFaSJs
X-Received: by 2002:ac8:5cc5:0:b0:42e:b078:ed96 with SMTP id s5-20020ac85cc5000000b0042eb078ed96mr17452934qta.56.1710882117022;
        Tue, 19 Mar 2024 14:01:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710882117; cv=none;
        d=google.com; s=arc-20160816;
        b=HKQAaHzkdhmvSci8wTIM9wi9Uhzuxjhb7fJhom9zx5AI1rdyoZFHjLsiLNrURAQJ73
         Bzj0ywc/JLl+yHfI0z3m5TTQ1o80URJM4nA7usB1w5AdX7Ch5lmW0EYEfAmHZQ3pXHOe
         uNwvoSfFMvI1ecsvJsIrU/B96fMmX0gdqp8VZyesZ/rleZyJ18huALin9Y1WnEN6a7Ex
         dzeTjB19AmJPUsgFrRDdolBhYSdHE5iehIVQvFIJOvXKcTYM33hSys5EIwU0yhASez5q
         hu4F+WBbiz2ft5OAQrjYaFw86XCBDzS8Dv3De/WK4C2ZrVeFHsAZmfT4fe/l+H9Li8E+
         oYlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=riE02hczxK9zG6YmAaBUA1+i/O6/nJveV7qJthCUwf0=;
        fh=4AELsLsEIvhTX5WT34kbDI5mgY0Fvtqdef3yEsZCcaE=;
        b=GUykCxdd3sdGTGdw2PmZ6u+tYiHqWw3Ru34bWRqHj++ZLA33n+RCOW8lOJ99HILu1S
         iUU5r+l/pdZu91JdD2vTjsPZxfvIJabqvPCpxWL9zsyWSrRwrc0wFIz/AnHAmZpbwmZV
         tcpJjUbiCxgWl3bGiBoVIXJ1v9Vgg5wAfphLO0jzLEW3t5tHO8pfSmP3Z0ktK8yK4pYo
         nXtVwXMItWenwZ9ti0Gyz7i3CvbHup3kNFZ4Y/NMd0+zJZ23gW7wQ/obFm6txFnBG9pY
         RI+L5IfPBGIDVT23d+GrLUm6/unEh90/7xa2FYlFIdR9dde30pS4raBQ7MxflPesV/cs
         VQvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nYWsxcKb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b11-20020a05622a020b00b00430cad99fa6si5678954qtx.773.2024.03.19.14.01.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 14:01:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nYWsxcKb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rmgam-0003x4-8C; Tue, 19 Mar 2024 17:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rmgaj-0003kP-Bh
 for qemu-devel@nongnu.org; Tue, 19 Mar 2024 17:01:49 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rmgah-0005qt-7n
 for qemu-devel@nongnu.org; Tue, 19 Mar 2024 17:01:49 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-5cddc5455aeso4229949a12.1
 for <qemu-devel@nongnu.org>; Tue, 19 Mar 2024 14:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710882106; x=1711486906; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=riE02hczxK9zG6YmAaBUA1+i/O6/nJveV7qJthCUwf0=;
 b=nYWsxcKbWXERQw8FEyuBc8J668K6ZiFJnsWzCGGOu6jd6EYzgujFPuLxf1VnnpZLH/
 wDOQb33SQrh4g0/tP/AaPSlwIAaOACXpkwfOOZJT8cXw2z/hYW31ByEl8oCDD7T4kq9N
 OKqMSXRbABFEqtUJaDHlqcSvGhPSu6b7p+ZiYZjxevEavjiUcVHggsvn2/ICb0Mt92bR
 uukzxAR+TRLoqy9hu3CuqeD/DI0NGIFvPOrohE0tOojwoQaqDALsMMXIYJfei7kNwecn
 yD46SO1I3AT4dm0Uvi4HMUH9Q4W4vyjYlbmnoHFrgwNNgphKN/zteDx9XYLSjS4LQyK+
 Rsrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710882106; x=1711486906;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=riE02hczxK9zG6YmAaBUA1+i/O6/nJveV7qJthCUwf0=;
 b=Vvk9O7D0kEDCd8zYz8dTd02KKW/qLbpOrLiwPEuiQ7sPl+sq7JWfZHefSSKvMAkQNP
 5LXoR/sO7CQrjuqd8CmMZzQsm2uvEuAwLqJyUJuyWOMJShaLnTNPY3tk3e8NX5g95JGN
 N4u+2yT24LqmhQDdJv588IcrvKD5cq4Qy57fBVKWR7OpJF45LZQZPtP6NkbfSuHJTtUF
 BtxXqx5Qs9Yg2k5F+DZjA4L2kCED+qe/auxyQyl1Wyea7IO5smhXYia6L1rCOhPSLB3/
 bO8eXPUcCuxSPRuCvOTT2WKrEhxggZl4cle0p/aPmtK/IuP8LsZr4cjXp0ePHGWIj98q
 EZfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWabCs7fabmF4IFQlyBeq34ehNFgt9Il2n7uFJ+sSCenuLSVo026VZ8tB1q+K7G+JIIe2J+z65qhEipQfnmLQMSjonsXqg=
X-Gm-Message-State: AOJu0Yw3+j4llIA671yJNiGwAiDFxJ9yCmAnMSszzdXAK5fsnFC2L/zP
 eiD+0/VibPCZgPsICHpB5cA+dAh6hgygC0l0tzrdOeNRm4n0MmhmcZWmVNTb2Mc=
X-Received: by 2002:a17:90a:fd89:b0:29d:faf3:16a with SMTP id
 cx9-20020a17090afd8900b0029dfaf3016amr10169692pjb.25.1710882105281; 
 Tue, 19 Mar 2024 14:01:45 -0700 (PDT)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 f1-20020a17090ace0100b0029bde896fb1sm10087874pju.55.2024.03.19.14.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 14:01:44 -0700 (PDT)
Message-ID: <13e1a475-6d57-4be1-991d-9cff1e6875d9@linaro.org>
Date: Tue, 19 Mar 2024 11:01:41 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1 10/27] target/i386: Convert to
 TCGCPUOps::get_cpu_state()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20240319154258.71206-1-philmd@linaro.org>
 <20240319154258.71206-11-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240319154258.71206-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: otXZGRGRJ/q+

On 3/19/24 05:42, Philippe Mathieu-Daudé wrote:
> +static inline void x86_get_cpu_state(CPUX86State *env, vaddr *pc,

Remove inline.


r~

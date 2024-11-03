Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1479636njc;
        Sun, 3 Nov 2024 01:54:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWviMZz2UNz5CUC9JHxnboJ9qiucnjJDXcYRRsMB/z4o7/4ep2P19Md3Twd/qUM6lw/wMlK+6UPevZaDA==@linaro.org
X-Google-Smtp-Source: AGHT+IF66qI0TEldMYl65aiDcT05k8jFP9Xxu9kgl1KnIpw9+2h/o3Mo7FHfrjM0xXG802EuspML
X-Received: by 2002:a05:6214:5783:b0:6d3:46a8:8f02 with SMTP id 6a1803df08f44-6d351a930abmr194752616d6.5.1730627694783;
        Sun, 03 Nov 2024 01:54:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730627694; cv=none;
        d=google.com; s=arc-20240605;
        b=VHs92yvJKroiYmZJJ7qodEAhnqWlW8S8uiEyRuE7SS1dXZdDpoH39zxtpx38LMhgcE
         Wmavgl4qwMkEUy2z4XKOIOKtZiudHOUd+JUgXzxOz+6qFvUzv16JIfnWNhgs5DkFEbzK
         F/ApzSKshtfobT1Eoyxqi9I1t1g/0M1OVLGm3pTVaIMnr5C+jJ8sHEbR61nDN/JFinx3
         GLcPF6bgdulWC+IhQV0fJ8tmZYba5Hsh+FnTpLz4zssit7+f2knpJQFS+yJc6KLzelJK
         K+mFE4pTCa50bfs+jjfS7KTZURs+i+gW9dZ3L3ym4dmUT+DCBNzsYGaY+d6nlCa+I2yq
         EKSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=eK1ACBQdcVq11/sNE0g5q33esKHBWkQCzFbqxdrPPHs=;
        fh=kbjaWpJ4/vy0WJ78xoUaTLmZ1Fx8TSu9AVR4kgneNI8=;
        b=Nk65Hy6Xt051II+3fTvAV3dyZw4Aa8nBWhIrp5N2sVPzFdxZNtwner+O54BscZIrxV
         5CDcXMs8WiYkHPZZKEZ3vsAlBRTxGSZQQkdjEaNZLrdS4AmACb0uUND+jAQtQgCwkCfl
         zI65c2f3ORAV+hDs1PKUysoU9MdpiagC66e2yCoMBaX8JEC04/AJLBXTs9RMCedIwQNP
         QfmTN1YvqoD+0MieabB+WOOMosPkWE5MZPBDZtrJbhODnhlVhgU6vAC8lyByyqnEp0cu
         rJ5TYLyJC2WJNJuxhnzjIjkZWFEBbgAwQhl5Maa6Jjf6a51gpTYaA3lC5IdHVUoxEUpJ
         X45g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OChaQh0G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d35416a859si82223176d6.279.2024.11.03.01.54.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Nov 2024 01:54:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OChaQh0G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7XJp-0002bo-Ff; Sun, 03 Nov 2024 04:54:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t7XJo-0002bV-1L
 for qemu-arm@nongnu.org; Sun, 03 Nov 2024 04:54:48 -0500
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t7XJm-0001i0-7r
 for qemu-arm@nongnu.org; Sun, 03 Nov 2024 04:54:47 -0500
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2fb388e64b0so31046991fa.0
 for <qemu-arm@nongnu.org>; Sun, 03 Nov 2024 01:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730627684; x=1731232484; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eK1ACBQdcVq11/sNE0g5q33esKHBWkQCzFbqxdrPPHs=;
 b=OChaQh0Gy/9vb/kvttofSoEa5a/rYUj+gqmPF+46E7PNkx8H27tnvKMNPbFBmqvFQ9
 STypYkR8MZPTivZ6Hr1yvZXHne/ZUO6Z4FsWrLU4DYR2mA0k9k4PaNeAB0FcpwvGylgO
 1VJ5FYaMpJ6XV2J1aOaqI+5n9zxTjHalNLP3eH8BP2fgv26M8vfvxwA+2esAJSKu8OjO
 4GBIwfYzXRctgD4LYcPoi9O0sWRfROAKaxIRp7fikBXvUKM3eZUXmWlYDib4eTUiGnEt
 0puzY6a1z0awNXOLgvTZP9oIAh17ZWW3DJEKC4y0eVv4hUA2QE79TQ2lFXxYnBkk4ua8
 PCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730627684; x=1731232484;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eK1ACBQdcVq11/sNE0g5q33esKHBWkQCzFbqxdrPPHs=;
 b=gc6l8Otu7RLPD8y+EKZZuZm+1xuP+hOD1WYTqF+TOoE+Ps/Z+QPkXzwHex5B9Fz/0N
 5c5FpPGu0hNuYYtV8I30rL+jPZ006mHzCBjMzhjZqlrULX8Iemt7mTFi3D2om4Nb5kN8
 Z5PchYVkkDXu1bVmshawblwqxhwa9LEpVRuivVqX7K1CiURFi7UPlqlaNgkCUMlbj8wa
 CLA+rYPjeIAs7t5bVuD8EE9VU/+ZEZBMDiC2o2XTK/vYuDPXve19yyZfVfgUA0G9IhAy
 iYBrpDNLfwwN/0O7mqbNwcJ+RnXVp6ZDKJ8+DFBOlHtOa6Wj6UxsqKAvzVBrYEm1CPEX
 ciMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2tMIg/eTmUurpwfvpL7DD4D7W2tUEhNqMEW1MGJiVceyqgpHh/O4eCjMyjzHxH3GN+9Gs53Be+Q==@nongnu.org
X-Gm-Message-State: AOJu0YxExANu8VczTO6oKutAO4xXJKhUWp5S069L+Pj9zNBP5UCowest
 IJqChTY1pIWooAep0B6gp78tgUiQXj8l+lXbX1544mtXCdCr7+plSX8DzI5Uwko=
X-Received: by 2002:a2e:a98e:0:b0:2fa:d4c1:3b6b with SMTP id
 38308e7fff4ca-2fd059d2d1fmr88755631fa.33.1730627683986; 
 Sun, 03 Nov 2024 01:54:43 -0800 (PST)
Received: from [192.168.21.227] ([91.209.212.64])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fdef8a62c0sm12501271fa.75.2024.11.03.01.54.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Nov 2024 01:54:42 -0800 (PST)
Message-ID: <cc3fe99c-11c9-4130-8559-e95b00688b2a@linaro.org>
Date: Sun, 3 Nov 2024 09:54:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Fix SVE SDOT/UDOT/USDOT (4-way, indexed)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20241101185544.2130972-1-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241101185544.2130972-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: El98Hiq5hS69

On 11/1/24 18:55, Peter Maydell wrote:
> Our implementation of the indexed version of SVE SDOT/UDOT/USDOT got
> the calculation of the inner loop terminator wrong.  Although we
> correctly account for the element size when we calculate the
> terminator for the first iteration:
>     intptr_t segend = MIN(16 / sizeof(TYPED), opr_sz_n);
> we don't do that when we move it forward after the first inner loop
> completes.  The intention is that we process the vector in 128-bit
> segments, which for a 64-bit element size should mean (1, 2), (3, 4),
> (5, 6), etc.  This bug meant that we would iterate (1, 2), (3, 4, 5,
> 6), (7, 8, 9, 10) etc and apply the wrong indexed element to some of
> the operations, and also index off the end of the vector.
> 
> You don't see this bug if the vector length is small enough that we
> don't need to iterate the outer loop, i.e.  if it is only 128 bits,
> or if it is the 64-bit special case from AA32/AA64 AdvSIMD.  If the
> vector length is 256 bits then we calculate the right results for the
> elements in the vector but do index off the end of the vector. Vector
> lengths greater than 256 bits see wrong answers. The instructions
> that produce 32-bit results behave correctly.
> 
> Fix the recalculation of 'segend' for subsequent iterations, and
> restore a version of the comment that was lost in the refactor of
> commit 7020ffd656a5 that explains why we only need to clamp segend to
> opr_sz_n for the first iteration, not the later ones.
> 
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2595
> Fixes: 7020ffd656a5 ("target/arm: Macroize helper_gvec_{s,u}dot_idx_{b,h}")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/vec_helper.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)

D'oh.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

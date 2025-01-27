Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2595298njk;
        Mon, 27 Jan 2025 09:28:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU0iUaFyKTCd7oyzscRMNFoU5zn4yXbm1dob2CpnKnf1ECU5kjReA+IvIdnx7WfobF9iXaMpLUop0+GKw==@linaro.org
X-Google-Smtp-Source: AGHT+IGp4ijPqDsmBQtwEvY0pjd2eo81GrLeN2BR2qq5DiZ8DlPEFKV/glm8i0SdpmhUlUXXCLUZ
X-Received: by 2002:a05:620a:2449:b0:7b6:c92e:2e83 with SMTP id af79cd13be357-7be631f49dcmr5896944985a.17.1737998895022;
        Mon, 27 Jan 2025 09:28:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737998894; cv=none;
        d=google.com; s=arc-20240605;
        b=AbrCMr66aJxZE0isS8379uGkHBwRAIK491Ney+RSnLoecXMETjITFVow2PTKJ1OgUp
         DrgeXAqhKWgj9lY9I+5VuP3K0dNbU660iJ2lwCb8pDq9Fglt7wxHK0S1OaUvxFM1hPkb
         U9793rVZ7Xh4bNFl+xhi3+JAVq5t0dvEvoQ+fqO+lpnev7Eb3wSc1npraMK0dhitRmDd
         7eWsbgSGzSmFwoWuwedWf2AdHIPo95fUpS4Dmh4ORX05ESkJ/rD8ixYe/EYNxzTD3NaP
         ijE5CHYdYZNseRkC1pMB1SVpbBMQGGJPOOJ39g1KjRzNsLHd4wqbg1ZtzuF/9mtSkQzg
         WxiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=vst1GWoYUOEqSaQQbfKIzhAHzh0PNZBIbP+qOUJbMGU=;
        fh=2cS70A5YH36qGivjX+zAWcNfAuGjkTLpyCcnQgK3DaU=;
        b=eQ5y6Ed/pzWB3TEtsXHVe7ilCsPTVYYnImhTIJo6kIR9LKYa3ob0Fu0N4dI4jpuV6W
         qd46khdhfw+ooxHqCyvfUwR+GzPJpCaM+TMOhaciEgseZZ0Ra7WL2+MrkqtGNh7PDn8P
         HNfvN5x1yTv2ugQdTqJ/1RWKi+o1jyjfxXI3dYb5nLD2B0PUy7M7Wb1YoGeP+v3h2soM
         n3Xg7hU7kVOrIjxMdnlNE9dI6G+O2r3FJB+5ag0SgoWf0LDSEGgNQkHuMLNkjnISh+pC
         3RAmjXJDxG7iqchGhMFKfWFZj8biH3Y+KLVI++UeH3vxRJI4qKDyOsEd7YnScq7ZIdv4
         UY+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m9VSG+0J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9ae945e4si1011078185a.161.2025.01.27.09.28.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 09:28:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m9VSG+0J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcStj-0003QA-NG; Mon, 27 Jan 2025 12:27:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcSti-0003PW-4t
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 12:27:42 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcStg-00049N-G9
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 12:27:41 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-436345cc17bso33714065e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 09:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737998858; x=1738603658; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vst1GWoYUOEqSaQQbfKIzhAHzh0PNZBIbP+qOUJbMGU=;
 b=m9VSG+0Ju+A+peN/twqoRFsminAYmzb8gydkIac5OwslnZtytf0fxFMY8WgY7/gE2K
 /57It8OID+UHILs0wE88vpmund1NxC0r0v7pLQJ82RS8J50Ws6uQGq2aUZgozvm/aMi/
 5dSeqwriG9T4r+Qw8ZqtILnUnzk468JdQHX+VhZWqLRfx3lfBHW5VlIw65d9dBWSuLDG
 1KuzZDh4KaIEjETLxmRa8E1dt/VwPd43cp21Xqk+rE+zt+8tLUtbz4uUDcIC9hCDlk1O
 e55/yMS9iyvaCmbe3fhYTgjydPD9gAQNEGzO1LUsUgCdeYbv4s/NLL9wqi7BWdJiV+6V
 C3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737998858; x=1738603658;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vst1GWoYUOEqSaQQbfKIzhAHzh0PNZBIbP+qOUJbMGU=;
 b=vyHcNyUQfjhwgRuSMvQevT8StYFyYxh3G8zOPp3qhqpsrP7REjt4kl+4bhYe5W4FpK
 R7EoZlmk3cAtS0T+gj+1eXN56nDYY45ZENm8eahtjC9QrN5iaj0ngQxPKWvmNMKbXBLD
 Z7B1hwO3MopaBBqbT5qQQPwlCH/drIvnltmlNOeGRVp/qBaG+VlfDosWBguGCiIxLNdM
 aE5OBjc2RWaFAJ71W8UAXYaZYUn0eAE9p+anOFrLy3yie2czbFSovzh3P859aEEhzXU/
 90s+9xBiMFbReO7tglVDKRJ3I3+CeKjJSY9QM77ZAkFLa3XAq3qpc66sdvesPS7d3l7R
 7vWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1z3es30aO+C5B0RTCE9m6d/Qb5SsOP2rS96+++upJygOtdy8IYaXik6SRn4Et9Cnchb904kVYnw==@nongnu.org
X-Gm-Message-State: AOJu0Yy6YBMHUQ3KbuTKnsOTHbT81a/Nn9vp7I1wodxqICvdnLKnmffh
 uEgl2ejSYKMnDIQLIvSgkTA2dxGi4e+OKbMqdHvz5q9KdE2H/s+df3+eDzKIMOs=
X-Gm-Gg: ASbGncuJU6DKcCMdzql2v3PKLXFn2qxaOwfBU+izxKqPM4lFgtphPYxwK/O+2y7ZHqx
 OzVOU7XzBMFYfxSre0kuSm3tN0dVat+NklTht1m+yDTme5QFiOMOArECpKfePZse6hrR0cGLGdT
 cSDZWvDr0TW9ONPPGZ/3E5FGP53O1C29TUspLxU2CQ/G6ZrHgFknf5hc6Ea4Lp7HqrX6GqlfJl/
 WJHUpG1W7Ajh/1Qnrc2RlE6pd1JiHt6uQRxIP+RiWK8gUHe16SQLIEZJA5FmMfxD4CMiO4vBv+d
 nU+QtaYLBG59F7kZagSzkjyRBNI356LZ2voueELIJM33Gl0e
X-Received: by 2002:a5d:6c68:0:b0:385:ef39:6cd5 with SMTP id
 ffacd0b85a97d-38bf5656ddfmr37640768f8f.1.1737998858565; 
 Mon, 27 Jan 2025 09:27:38 -0800 (PST)
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bb0d4sm11915942f8f.69.2025.01.27.09.27.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 09:27:37 -0800 (PST)
Message-ID: <44f75f64-4480-4cd2-a907-cf0638568e55@linaro.org>
Date: Mon, 27 Jan 2025 18:27:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] target/arm: Deprecate iwMMXt emulation and associated
 CPUs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250127112715.2936555-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250127112715.2936555-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: KiCqHNGOMBAZ

On 27/1/25 12:27, Peter Maydell wrote:
> This patchset marks all the CPUs that support iwMMXt as deprecated,
> because I don't believe anybody is using them, and we have no way to
> test the thousands of lines of code we have that's only there for
> iwMMXt emulation.  (See for instance the recent thread where a patch
> was submitted to fix an issue detected by a static analyzer: we
> didn't take it, largely because we had no way to know if the
> behaviour change the patch would produce was correct or not.)
> 
> The pxa2xx CPUs are now only useful with user-mode emulation, because
> we dropped all the machine types that used them in 9.2.  (Technically
> you could alse use "-cpu pxa270" with a board model like versatilepb
> which doesn't sanity-check the CPU type, but that has never been a
> supported config.)
> 
> To use them (or iwMMXt emulation) with QEMU user-mode you would need
> to explicitly select them with the -cpu option or the QEMU_CPU
> environment variable, because the '-cpu max' default CPU does not
> include iwMMXt emulation.  A google search finds no examples of
> anybody doing this in the last decade.
> 
> I asked some of the Linaro GCC folks if they were using QEMU to test
> their iwMMXt codegen, or knew anybody doing that upstream, and the
> answer was "no". In fact, GCC is in the process of dropping support
> for iwMMXt entirely.
>                      
> We have one test case in check-tcg which purports to be checking
> iwMMXt. In fact it is doing no such thing: it runs the test without
> selecting an iwMMXt CPU, which means the iwMMXt insns are interpreted
> as FPA11 insns by the linux-user emulate_arm_fpa11() code. So the test
> prints garbage and then succeeds anyway. Modern distro toolchains

Uh...

> can't generate a binary that will run with -cpu pxa270 (because their
> crt startup code uses Thumb insns); rather than putting in a lot of
> effort trying to salvage the test case to really test a feature we've
> deprecated, I opted to just remove the test.
> 
> -- PMM
> 
> Peter Maydell (2):
>    target/arm: deprecate the pxa2xx CPUs and iwMMXt emulation
>    tests/tcg/arm: Remove test-arm-iwmmxt test

Series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


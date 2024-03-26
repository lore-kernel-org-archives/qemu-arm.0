Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp19808ejv;
        Tue, 26 Mar 2024 12:08:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW1pcgg/cZLg63kJSOY4bEv7SuiVnzq9BZFFzbhXyfTG6Ih/OQUCsatwoMNgc55YFHTh4+1HGVKFeOVRuyvCai5Mduzqk2k
X-Google-Smtp-Source: AGHT+IHJYDPiCbaWvpN6wH21pZ3+OrhKPcLrv+thVC0lMTSt0tE+A9WyfmAImjwEKRxOHixGxQy8
X-Received: by 2002:a05:620a:15b2:b0:78a:5fd9:46d7 with SMTP id f18-20020a05620a15b200b0078a5fd946d7mr697949qkk.67.1711480103893;
        Tue, 26 Mar 2024 12:08:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711480103; cv=none;
        d=google.com; s=arc-20160816;
        b=Eu0m5I/FUZODLUMaFHzidLWY6uKJSe+Fm+QJ1l0PJ3luiOXkMmW8tLIlIMPp90POBY
         7gGb8TwNbCcL+VpJ6AVzW+LPbywndHNH/uhwhqkM3uUA9YY81EKicWxVZ1z0Vx3W63lp
         XnXGAkEJIH8ElENRiGZOiBvvnBwQf5y5Y/q3EtAKjbJwsKehf0dhhZp8aIXKTYUjGI/9
         dnqaSm+YrxLUbAr7/xtzdsJoHMGN9iP44n9qdbgFm4MZOTlU9tAbUc8oTHEMcVDYIv8T
         /fe0jEFlwS3DSd5nw8eN2j5BpVOIsvHFXiTmASO9vIsyl2Cb8srxxtJ5H8vCUJtw0LS5
         Bzug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=fHefUxRivmpnUzJBpMin1dHCtvPbntsj8Tn0rnbDfUM=;
        fh=sqEfxWNk+XuN9Cp4Nym58PCMSd4AwVDj6AJOE1rzjDM=;
        b=Fm+o4n4hh1I8qZ0ayIXL7sYEU8bt2CBPnYcWwmHZI8V7G/RLzWQ7WWVQoEvsx70S6o
         Kn90qzVOkz66KWPpeQfp4gMkU52bcnnmJWHqIfyVAoZli4U34oBQB8xom/BBEGdQxDjh
         bFzlty9fOmYfzdJzcRa5+5A1+qyPKHRxcPN/lK/h0GNXJoFmGuF/tMdrEepc/dYGy+yN
         aPCgEymqoNe6C12/HQGbL8NJwChMb2UvanxVev/FMHL9yNgm/NhhGzGpyQRAMAtJqcpj
         AucLFaOFQS7d9iLoNnO2CpbH5xPKnvHSDP7Dou1NMXsW/QLgR23p1GewHj0k3ZlZNd0Y
         EIBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=brPAwTf6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c23-20020a05620a11b700b0078a03e924c1si8502112qkk.149.2024.03.26.12.08.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2024 12:08:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=brPAwTf6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rpC9E-000699-Bi; Tue, 26 Mar 2024 15:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rpC99-000659-Mk
 for qemu-arm@nongnu.org; Tue, 26 Mar 2024 15:07:43 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rpC97-0000T5-4l
 for qemu-arm@nongnu.org; Tue, 26 Mar 2024 15:07:43 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6e6a9fafacdso4531349b3a.2
 for <qemu-arm@nongnu.org>; Tue, 26 Mar 2024 12:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711480059; x=1712084859; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fHefUxRivmpnUzJBpMin1dHCtvPbntsj8Tn0rnbDfUM=;
 b=brPAwTf6teqNApALWQfUjh9LwoLfH4he0Z6y6VSSZ//lEr1A6oRRselnwa0ZaOxHqz
 0c8U3j0SFz/23wRuXy/fPXmhoLN5vt/Fm2WUv/V9t5iTANhmy3lTPCfN527M1GQk62xS
 rdvp387C2FrRrlpV23KIdFUyKjx+CyZ86BIYyGP4ff7TX77+ztv0nkV/yM4kjONXlEte
 BSlT8xjhEPFbEaDl4+XwXz4L44aTdCDI+ee0OeTdO5ZKcMCWqCn43McTj8he7xFU74W1
 187WGPOrYOEcQ4oAJNJp8O7UIDfKuutq/1FRsOm0hPjv6KDkjLHFipA9WKVqVYMocWMT
 T9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711480059; x=1712084859;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fHefUxRivmpnUzJBpMin1dHCtvPbntsj8Tn0rnbDfUM=;
 b=EgLua9agdiR1ZqSLs06VSYigSJxRKTUIy1ZHtSrOENAVTVDKni9OGim5cPCP1t3ROg
 novLvdLTQnZrFMOyXyC8F3ZDpHTkg0wUizRtcNx3Z1Jb1g3I2LNOUKycliXWEUInF+u0
 iRilGqLFOiyfs9p6adyaRttYsSKSqg8BejvHMZn/oinlJDCEXKE/Qa9bHvsuSNTBBAJB
 L3cQFganzl2CBOqhxcbszem/R9VX9hL7MIquhvlB+RNUJrSRAsGDSKAROtmtGoVJUvEo
 UruGtSq4rc0DX/UHJGDzHKd724TxPA2FkrEOqaEiM+NSwFifP0vbciFNvVcXXr8+I4ST
 rZvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzISAG4RJMQ2Dk2NdFCQurYkNTT0M1K+6QJsbKwXhabU/7L7GhNcURC8j6DjwBBuBU1NvLWBIUaosNyacwXzbL/WSw
X-Gm-Message-State: AOJu0Yz6VsTMuZv8hz88eY9/ALc9Ec1bcrg4QL0vy6Bo1uudrR4OaW1M
 otks4eAKYOAiC7LOiXhG97OZpkbNXFZW1zqkClKG3l8tBFPFOs6Qj7aQT8z/61E=
X-Received: by 2002:a17:902:f542:b0:1e0:511a:ebab with SMTP id
 h2-20020a170902f54200b001e0511aebabmr700444plf.43.1711480059526; 
 Tue, 26 Mar 2024 12:07:39 -0700 (PDT)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 p2-20020a170902780200b001deeac592absm7329747pll.180.2024.03.26.12.07.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 12:07:38 -0700 (PDT)
Message-ID: <c05943e5-24de-4059-b9da-5488d4013b0d@linaro.org>
Date: Tue, 26 Mar 2024 09:07:35 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 4/5] target/arm: Enable feature ARM_FEATURE_EL2 if EL2 is
 supported
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, miguel.luis@oracle.com,
 peter.maydell@linaro.org, maz@kernel.org, gkulkarni@amperecomputing.com,
 gankulkarni@os.amperecomputing.com
References: <20240326182345.326758-1-eric.auger@redhat.com>
 <20240326182345.326758-5-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240326182345.326758-5-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
X-TUID: 7VUb2rCZ5U8u

On 3/26/24 08:22, Eric Auger wrote:
> From: Haibo Xu<haibo.xu@linaro.org>
> 
> KVM_CAP_ARM_EL2 must be supported by the cpu to enable ARM_FEATURE_EL2.
> In case the host does support NV, expose the feature.
> 
> Signed-off-by: Haibo Xu<haibo.xu@linaro.org>
> Signed-off-by: Miguel Luis<miguel.luis@oracle.com>
> Signed-off-by: Eric Auger<eric.auger@redhat.com>
> 
> ---
> v2 -> v3:
> - check pmu->has_el2 on kvm_arch_init_vcpu() when setting
>    KVM_ARM_VCPU_HAS_EL2 feature (Peter)
> 
> v1 -> v2:
> - remove isar_feature_aa64_aa32_el2 modif in target/arm/cpu.h
>    [Richard] and use el2_supported in kvm_arch_init_vcpu
> ---
>   target/arm/kvm.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

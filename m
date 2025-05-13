Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp402167njb;
        Tue, 13 May 2025 02:58:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX3lvPwJ/99K9k9p//dzhS0LbK8pKb5jiC7dwEu6Yj4igWa0vvQc0jEC3lNwjuwgR87/ft+6/JisQOXmA==@linaro.org
X-Received: by 2002:a5d:64eb:0:b0:3a2:1fd:afd9 with SMTP id ffacd0b85a97d-3a201fdb33amr7944738f8f.58.1747130328458;
        Tue, 13 May 2025 02:58:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747130328; cv=none;
        d=google.com; s=arc-20240605;
        b=AodFkKv2Y87HdnDEGi31L/RZqtD7HsYzNhgrT+vzgc6JQghNSTmbkIonjevAt40C+i
         FzDwCEn+Lw/2v3GcVxjIObDVKOveRVcoX1nI6XSZwJCUxsTJy0U2P0EGYZlMsaZQ7iIl
         4bLPUEdRtDrTXGAgpjTnuZcT2EVzllSpaGPqWYgQLipljme9UzLcsieoW+2VpliWZBri
         BklpHuN+Ai2pGpPXHRPfjQZxDNem/kNdEA4wscukiNP62nfCdok3AX1wNAQwzSaxuc/f
         gwXkHVBEiQazVf8AkXSipAlCXbupQ456I0TYt6AlXGJr0+M1JrtMVRSYgsNhXki3xIq0
         O3Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=hWwzifUQhEG9S2dfaswiId+/tUog3ILaSkr5hNhPhRk=;
        fh=5SW14LpRB+VhZ0TgzwPsVTHkb0Bp+g+dQV7fRtGurAE=;
        b=XevztDM3GQF6aOBIm19XyIEBaUYK1l9DDLz1XFH56lo5LfXw0jN8CLjssuymNOPZHP
         xBRrS2dg8lhsCXpBPBSz0jQuckq748dwm0OhDfJUT1wRZE/CYb21gfN+v8miPVo25rh8
         zWqGe6hjifgLndUU+XsdlTQYpb84YNTdbPs6aJ73pfMQD5Te+e8R+Fs8fgr6uZ4XLAOb
         Z8fd9fbyScJOIE5XeG0gT9JehyR1Vu6cz2u3I60/lUCPFyZNQX4akX5gH/6eY126Gmrr
         xbOJAMRBHI1ulBYXn080pS8g0Cko9MNS5sv/raoEmP8L9VIhR+8e7p+jJTTDvRrVK70q
         bpYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XHopk9lG;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-442d68837b4sor30179155e9.6.2025.05.13.02.58.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 May 2025 02:58:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XHopk9lG;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747130328; x=1747735128; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWwzifUQhEG9S2dfaswiId+/tUog3ILaSkr5hNhPhRk=;
        b=XHopk9lGJ4KjrPNVLEeDBrXDOp5eYkSTefxZXcpB/ezG6Gske/OQ0juAEIaZb8TzjP
         vTSdxejD0SORAjf1LTpEShR7uj6TP9iYhJYWmWhl//7ku62X4TOGcULzoxT7cRTBvw9Q
         69EEetEvHVeThlMxME3NMhYs/UoUE1PiuLY7jJkm7kjjhIn+1FEqdF3yvL1TiFn4DEJH
         SIgs1goxvEAxHzctxj/RanhvefrqwlHSHWad8BU+hu+KR3yMRVmdNA8ID6Da2kXXgr5B
         6t+zQDYW/h5hFBCAq6bMH8e6nU8HGMCkG0/Lf8z+QUYNlhILz6tcLdeOEhXGTz7Q8oLC
         83zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747130328; x=1747735128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWwzifUQhEG9S2dfaswiId+/tUog3ILaSkr5hNhPhRk=;
        b=N1lu7H8sHMUHEmDW1a7UOavam17zjn2Y1STqeVaaJLWKT0Fn2aHAbCXmibPKfnA4Xc
         cZwPBBN4tHBd7GsZzXIq3oP0gMdOKxpmVSuiO/lcLyBHnb7At+H8TGUwBcM0Oi+mYkr9
         iCgsLHT1KNobC6adM0WV10bKK5MR4N9hHsNKfjRqzH3v7o+W942zk60s6sKyJFY4SFYP
         1BH+dXjQHxJkJ1w4Vakkm9EPQoQ1oi/zbhhFViU04QT0I3RvuC+hMuCi6GqGxGuFDWbs
         J7f/HkTOoZqusUwLv4JlWrAH4FBQMQflyhKcceTUvs8o8O5TfzPHNaWxgfkvv7DlI9Oz
         AJaA==
X-Forwarded-Encrypted: i=1; AJvYcCUz7XFEmjTLyjtmUQVzfbn4gWFVbnmV1JvABu8cwi97wQtbgAb7p8DGRKgYaVL7nqAsfJ0QNDvUv9UbyQ==@linaro.org
X-Gm-Message-State: AOJu0Yz23khnyZlEcXeS/lf3d2NixqtSMZhO9jAmPBvkkIkjo2EOZi9s
	axYDNSeQEFuOPmBum/CFPt0jdqQUSTW05SJx88+u9tSzo21RY2b2YfO8Gszs06sXHw==
X-Gm-Gg: ASbGncsmSWAO3ldbGGMyOLagj1V9YLbqoN/ypGEjoSwbbXKBpPzwfANb8mfMquEjj35
	/nwGGotPvmfuBFTxpngH7TdRcx3vKN8Uuo3NM/585truYHQniuGc2DWlcIAg9ssJ4UFCC/4vjtL
	LLJ3uqYE/+IrR+EQUByH+jZuYaBjSSFT+xP3IQdHao4LGq4K/zjx1Q9Vlp0ZMaJXI/EEba5hOjh
	nKqm61fxS4jYj/jeybfh1gNvuwU+LOIzIjJFsEdIAGw0a+sbO0QBIiIfn93TgbzWztDLRc9kZD7
	CwPQgJNTSnyxlPywxAo/ubJq1FTQB29lc6qq7bRZ+DL0oGhR0DQb5jaRKmtOA0qKZqqhaof6VY2
	oWYRKlRpMgCnI
X-Google-Smtp-Source: AGHT+IHcU+q59/zdO9DEwOlbB2zFdxDyUb6T9cpL38qnSxJsCqK48oFjYOiXwo545smirO9ocba2jw==
X-Received: by 2002:a05:6000:40df:b0:3a0:8383:ef19 with SMTP id ffacd0b85a97d-3a1f64ac258mr12823489f8f.51.1747130327914;
        Tue, 13 May 2025 02:58:47 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.61.1.197] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ee95asm15731410f8f.11.2025.05.13.02.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 02:58:47 -0700 (PDT)
Message-ID: <05211729-41d1-4509-9312-8f60ca2a2cce@linaro.org>
Date: Tue, 13 May 2025 10:58:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/48] target/arm: move kvm stubs and remove CONFIG_KVM
 from kvm_arm.h
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, alex.bennee@linaro.org, anjo@rev.ng,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
 <20250512180502.2395029-5-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250512180502.2395029-5-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: i8cezw3l/z5+

On 12/5/25 20:04, Pierrick Bouvier wrote:
> Add a forward decl for struct kvm_vcpu_init to avoid pulling all kvm
> headers.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/kvm_arm.h  | 83 +------------------------------------------
>   target/arm/kvm-stub.c | 77 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 78 insertions(+), 82 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

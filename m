Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp3181548ejd;
        Sat, 20 Apr 2024 10:04:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/FSrFnmjS22hwPZnV8DRAsR4YSSVO3Q9YCLRrGdM9oFo+GBABMj9OPHwyW5Js6KsUALFd835B4C/4b4hN9biN8IvnHDjz
X-Google-Smtp-Source: AGHT+IGGc4x98W2w8Mqo58nM3HZa36FjTVG262tok9esvXiUAJwZQNchPfuNXATxyQ7UUiMLlh/i
X-Received: by 2002:a05:6808:356:b0:3c7:5539:5633 with SMTP id j22-20020a056808035600b003c755395633mr683325oie.36.1713632684236;
        Sat, 20 Apr 2024 10:04:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713632684; cv=none;
        d=google.com; s=arc-20160816;
        b=qxJoqzg5U99U0IE6oIsw8PpAoDPf8+814WCCHommf1q+K/BiTJLfovoSiuurTQy6Tq
         jZKZPf+V9xF3ideT5zfhSqotYys0mcJi+Fs5R1RjTaXA12FYsXZ71ALDrz7Qd4mXMSKS
         /DrpU2O5gomA6umcMvRbw1q4PNtnP0j4XlUp/GWOG+itbhsPeE3FTwq7tW8k2rHZdE9b
         2dZxHORoOO+8ietMN0hbk3tAH7wcyHGiWNQZ0/IpKskzalkxej+JGkf+WpK7nJjcLRyF
         Yyaf/XAvEo5SY14NQZ61WUwMTIE5dE9WZ+MZW0/K8xvzo677HSRuuLsTDseJMndjYfoy
         VAUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=CSGt2ooL1w4W2QhlCyeVTHpcwzkIpREoZK+rqZrZ1Og=;
        fh=0X+DLTsf0SSb7BERJ+m3kSjBCj1fslAW0JDCs2rA0+0=;
        b=ROOq7mYt3lnZtTqPAcp3L4DRTmG94rXBRp5NQTdZT2FxEXzfVo5MXdGxvf56b8Z/Kp
         +9qGJsE1myjjQ2nJDDa589IVDUZkiY5uJDnJda7LvCD3R0YVXMcEyjSoEljRhAqsU4mG
         jFQb/fwtqI6ErsHQ2dJrC7A2OUiZMZQrSgVl+fP8ceQLY3yUbisTinfEy1OHk8YlNC5o
         dz5nHckckTmTV1yqHlOLUyhHjUFmYqocZiXK4vwa41ccp22/jYI+oi3zvUtvnuoQHn14
         ckMRWD2Yykte8e6NHXs35nsNWNBVU/dZaCeNpiSrg8cRShWB0fdiHZ6/SxqnegYKfuMz
         OkPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AiDc03Nz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t26-20020a9f389a000000b007e5229734b9si1021591uaf.92.2024.04.20.10.04.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Apr 2024 10:04:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AiDc03Nz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ryE8F-0001sO-N4; Sat, 20 Apr 2024 13:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ryE8E-0001s7-D2
 for qemu-arm@nongnu.org; Sat, 20 Apr 2024 13:04:06 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ryE8C-0007zo-Os
 for qemu-arm@nongnu.org; Sat, 20 Apr 2024 13:04:06 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6f074520c8cso3032702b3a.0
 for <qemu-arm@nongnu.org>; Sat, 20 Apr 2024 10:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713632643; x=1714237443; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CSGt2ooL1w4W2QhlCyeVTHpcwzkIpREoZK+rqZrZ1Og=;
 b=AiDc03NzZQzpxqFXMZ1cC5FYUJEhYLBXpEtVf/iNLvlpxDJAj+5S7HJ/uC33as2Gjx
 9nJhgc5fIFegZRGWLlMqD3WGcpVB9a6Izu8IE2dxC3Z8i7TmtvQ+jU3pWUe7WVDnMOEB
 MqYW+P2MRm+unpzLc14hdevGWotNJlT09z4cIHUmf5JjVqVGuVo9+j/OT4hO+pPCmYVD
 1nj31X3nD2SJOiUUYd+Y0R1SyLeybxBNKINXt0HqXS/ofNf/7htUuDySojzB9P6k5E1k
 9uYbTlMdbFIw3cRTWwKe9myBfP5IQKXunLTyx6Lh4e0hAUfr36qz0jTzL1HMT9yU1lf3
 NdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713632643; x=1714237443;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CSGt2ooL1w4W2QhlCyeVTHpcwzkIpREoZK+rqZrZ1Og=;
 b=SQPqaB49Z8I7i+UFDo4byBU7UZ5j24avpYjj84cpj38u05daB8rkqUm2huYtA9VxeZ
 XfhfqzJFm9DICQjtYhiTSfYEXrHpFSYDGUqrmD/bIy8aE7JRO7g4edS7RueXJLnL5IPs
 fXR8X0WoEollrgSHMNUZXn85bZCKBFfoykM2B3niH3flIqSqGfGQ3X0BipiH5IYPE8vW
 EbDO8BD7uJePmym4ZBKgZZW1BXFM9e7/3Tg8cn6Pvli2RSSg7PlLmG43B9cf0gK9sumZ
 lKYDHU/4CUSDqkR/4FCcYdy1N4/cgjdv8Yt1CuPep6ECehwYGsTFNyYwj1OgbehqgN1Q
 DcJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDSJik2Y7Iztflfiq1/kfxZ+N3dTf9w/ROnlLsfgc/Sy6Q1kgeIuyJTu6b80BTaU30ZIut4F28Fb8/xFO7e9kubuGH
X-Gm-Message-State: AOJu0Yz50Rqm3IlAeI5PdCkukUbuTvsk7AZ8IUZWAb81/EBffT4XiFXz
 zLfGGdGrss0y3Cr6DPAiMLKfK7ghnL4GjE8emoMkw+UJ1zCLTyR7WQUjYNKcq+s=
X-Received: by 2002:a05:6a20:f3a8:b0:1ad:6fb:780d with SMTP id
 qr40-20020a056a20f3a800b001ad06fb780dmr182789pzb.51.1713632643120; 
 Sat, 20 Apr 2024 10:04:03 -0700 (PDT)
Received: from [192.168.91.227] ([156.19.246.23])
 by smtp.gmail.com with ESMTPSA id
 bt19-20020a17090af01300b002a2b06cbe46sm4938930pjb.22.2024.04.20.10.04.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Apr 2024 10:04:02 -0700 (PDT)
Message-ID: <55569871-49f0-405c-ab19-45cec6b63c63@linaro.org>
Date: Sat, 20 Apr 2024 10:04:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] target/arm: Default to 1GHz cntfrq for 'max' and new
 CPUs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240419184608.2675213-1-peter.maydell@linaro.org>
 <20240419184608.2675213-4-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240419184608.2675213-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
X-TUID: RQOnsKj+L/Qs

On 4/19/24 11:46, Peter Maydell wrote:
> In previous versions of the Arm architecture, the frequency of the
> generic timers as reported in CNTFRQ_EL0 could be any IMPDEF value,
> and for QEMU we picked 62.5MHz, giving a timer tick period of 16ns.
> In Armv8.6, the architecture standardized this frequency to 1GHz.
> 
> Because there is no ID register feature field that indicates whether
> a CPU is v8.6 or that it ought to have this counter frequency, we
> implement this by changing our default CNTFRQ value for all CPUs,
> with exceptions for backwards compatibility:
> 
>   * CPU types which we already implement will retain the old
>     default value. None of these are v8.6 CPUs, so this is
>     architecturally OK.
>   * CPUs used in versioned machine types with a version of 9.0
>     or earlier will retain the old default value.
> 
> The upshot is that the only CPU type that changes is 'max'; but any
> new type we add in future (whether v8.6 or not) will also get the new
> 1GHz default.
> 
> It remains the case that the machine model can override the default
> value via the 'cntfrq' QOM property (regardless of the CPU type).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h       | 11 +++++++++++
>   target/arm/internals.h | 12 ++++++++++--
>   hw/core/machine.c      |  4 +++-
>   target/arm/cpu.c       | 28 ++++++++++++++++++++++------
>   target/arm/cpu64.c     |  2 ++
>   target/arm/tcg/cpu32.c |  4 ++++
>   target/arm/tcg/cpu64.c | 18 ++++++++++++++++++
>   7 files changed, 70 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

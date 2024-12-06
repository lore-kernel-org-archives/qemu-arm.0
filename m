Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp699134njb;
        Fri, 6 Dec 2024 00:42:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWcTERqmiOxuU21Wb2vizlIQgcwPphpx3QibL2zu18nh65AZTfP9gptnNJO/AWetwcbHHXOP0OQXydKeA==@linaro.org
X-Google-Smtp-Source: AGHT+IHhcYfLsAYT7JTmvPlGRO+fq1R66UEtaI5pg6gt/eTghzMi0iDVmtDUJZX0qk7pw50GWkbs
X-Received: by 2002:a05:622a:229e:b0:466:9f89:3d6b with SMTP id d75a77b69052e-46734ce0f28mr46878801cf.24.1733474524914;
        Fri, 06 Dec 2024 00:42:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733474524; cv=none;
        d=google.com; s=arc-20240605;
        b=ThWjE15GtwQ5U8iFHMgpkkHWnG3HcHMHJTIYzdNFQl+uutoZspmz9OUidz2HPCRUiW
         hGMfz5wCV3p8M6+2NZ7vKRVmMGhixjAIR91Yu7Az5Vky31MChvSuxJ55EM80uy/sFkjE
         mJKZQJQka77dHyhGui9ZkrW45pz5iBA12Y1942RqWMQmHt0RNp/f2mQ47v5FM3CZtGLn
         Sea04c0Dc4iU4z9adwD/QMyjgVZaB3Zo3eEjnWbPYEi8kZlt9io+MPdqGZwRg/8Kvm0S
         ITqNtPpZRRNdFPBiBNKFs2Gbk0GYaUgpKvtvToKRI5TgrJT4jBNeFFlbyB5OAS0UEU7a
         /yHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YXeNV430RbCqMtLJfxr0i4T2gHs2Bp72iIkuGaTtL7w=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=Mh9dfoZ8799EL4QLowUECk8+PQByrR03XRdSwR15+p8IE5E9cR8S08ZdjQ0G6O6oMQ
         g8p1w0i6Ndq92vGMif+aW+xbX/f/C6XtII91IEG4gmrhAmoyJTddk1wgxhu2pmkf2vRN
         MM41vr/N0FkAWJ5Yf3/n8ZVUhAkLkXaclHtXEgcsajn/E83ceW5+BVKNpuBIf1yv/G1v
         nAiN8VLPMxf7TNqsLc4vRO4TyIs9A7irs6tvGEe64+LrKvS82YMdfAOPQqvXJs5IT33D
         j9eAicVDDpKQ5sOu+UTq0nW482iYwweNOOPGPpBkZMxS5TU9h6zuqua+UrEBgbiHXmRw
         7dhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qap6bjK4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467296b5017si45536291cf.63.2024.12.06.00.42.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 00:42:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qap6bjK4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJTuT-0007wI-29; Fri, 06 Dec 2024 03:42:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJTuQ-0007vH-Ju
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 03:41:58 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJTuO-0001U0-Vk
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 03:41:58 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-385e3621518so1352574f8f.1
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 00:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733474515; x=1734079315; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YXeNV430RbCqMtLJfxr0i4T2gHs2Bp72iIkuGaTtL7w=;
 b=qap6bjK4SXBB4MjZCdnN2apLzkgvTW4eJJLgZQpso0nYnMVY0Lz0BaNg/uUbVoZP2u
 oYglRqovronjT+fltlWu8KWXl74V17Jgkz9tdfnT/Fgbrz/2BST3ba51v8VE7aqrvNAr
 fuoK2BJw9hF8D9WKMZ/pkD/9bX8ip992WC7siIRFztw6LFWqNMQhSXBola8LRDS+DDHc
 IptvS7unx1WWWuUilY8Dyr8bR7nZT3uEDs4Ss2v/PKcq0a5yCq99taUcKAhvjZhPR8R1
 GfHN+jzizgIFgONWEdvLO89KY7hLQbC2rY+jUFEay96sUUoxHmEga0Xa9V1SXCI6ustj
 ZkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733474515; x=1734079315;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YXeNV430RbCqMtLJfxr0i4T2gHs2Bp72iIkuGaTtL7w=;
 b=iA63033xjvpneVaDCM0XkGQiVVe4LRGJsGsqO9JQXXoznzOSBgALldp84a6LcqQp7m
 dVO/f3e25K+Dxh/zsA0cEfOkOOryOhQr8WjKMGNGYlppm62Sh9H7v78UbLVBUNXnPTxu
 8I+OUt4uwf5jgJDBYTj9bnlcg62FDa8yMqRbsIe8WCTsNpOv0eU3mPgi2p7P8mGyUo0v
 cm7h6GSkCF7KImapsg5WlNSpHGHK5nkE9p8ihDoSHBLVO0TktWpIvfYpKvtH5ofVM0N2
 3oIOpxlszfS7/9ZUZrUjj0Yewp43JUlN1q5CkdV6dRBS+UAYqxX6Ib6jCpYeKg7ePsHx
 Ujzw==
X-Gm-Message-State: AOJu0Ywje/0EGRt9ViOdSJD2jtFRDOZXuy0S/9LSalP+1QjNVc7s4n7T
 tr/nyNLBkXXnM+ir6JlAoBQota5EInR0QwFsjvhjqrQGXgx+VUB0pkX2w/0xCZQ=
X-Gm-Gg: ASbGnctb/eSH2JiDujqdVi2ddRMX3hAHi0vEXdG3Q4bX8zz3KnQ+nItqnAkQ1hKY5zm
 1dBiP/41obgHAwZtJN3REC4G5JVcMtD6CgN7IOQLFzSFNSzENykDsp9ji6gykIHPZ+UbJItCQ+b
 4yUKn5GzEThxs16fc89XkH5dcWSnTc1d+NsJLn2WYaivtwkygx1OglwKOogjSxwgykaRhHIH5EL
 1GbxxNwOSRVbKjdwqpBljyO0C2uClZelmziU949FcVOxnVTcUXbg4hADqGZSovSS9nuxC8mrdOG
 R3ju9eEcy60S6t9o1Q==
X-Received: by 2002:a05:6000:1a86:b0:385:fc70:826 with SMTP id
 ffacd0b85a97d-3862b3e3118mr1248864f8f.52.1733474515430; 
 Fri, 06 Dec 2024 00:41:55 -0800 (PST)
Received: from [192.168.69.223] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d5280120sm85734735e9.20.2024.12.06.00.41.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 00:41:54 -0800 (PST)
Message-ID: <8c910be5-3d59-4632-9818-bcc2c860fa5d@linaro.org>
Date: Fri, 6 Dec 2024 09:41:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/arm: Use float_status in helper_vfp_fcvt{ds,sd}
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20241206031952.78776-1-richard.henderson@linaro.org>
 <20241206031952.78776-3-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241206031952.78776-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: v7p9CZsVffW9

On 6/12/24 04:19, Richard Henderson wrote:
> Pass float_status not env to match other functions.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.h            |  4 ++--
>   target/arm/tcg/translate-a64.c | 15 ++++++++++-----
>   target/arm/tcg/translate-vfp.c |  4 ++--
>   target/arm/vfp_helper.c        |  8 ++++----
>   4 files changed, 18 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


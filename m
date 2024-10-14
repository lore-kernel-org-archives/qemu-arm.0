Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp1964655njb;
        Mon, 14 Oct 2024 09:31:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWf4oehPNNUtXodHsHfKvUSgsYdukKOuz47V5rZE4kUtwUu2W8DUmqb/clLDVnvc+7b/87Eu3hrNyFPrg==@linaro.org
X-Google-Smtp-Source: AGHT+IGQNshcNKXRxcierY3MvgIpW/wTLIUKFu63pIeVxfvUb8bEvP2Xc2G4VpTzGh5awjN+qpen
X-Received: by 2002:a05:6870:7196:b0:279:531c:d431 with SMTP id 586e51a60fabf-2886dd710f4mr8554423fac.11.1728923500249;
        Mon, 14 Oct 2024 09:31:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728923500; cv=none;
        d=google.com; s=arc-20240605;
        b=jTGoNmz4X3VGcStmMf97d+xNgx5XzEI7HXGVX4RnJj5flbL+/ll9YI/PJcv7Vt71BI
         8IKwBro+AuICMa+1GZq+ksA6CkVTvAmCU9CEGlcpqIIO7nGJ5XY6yJqHYqHH3ru6G/Sd
         4+afX/ewEBQ957+56v9pfktgvjLq4rUCitKfnDLMFewOxNn3Cgg8O7OWvMePOrGo2d0f
         GTezb/TibrvWv9+zaBLd5c/1UJQ/kS421ZqT6cdV6Zlwhb+/Ug+GNJGFw70X5wKT5h+3
         kC934BPLx1uQT6rN/NKetSiwNmBHB7Z7S58NYaYKEgKi32jQyuTXUpbQDIjdBj7pqjEQ
         4GQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EbTI3hTjAx35WA9WKfuyIahDCVeIv4+2l9l4P0VQY4Y=;
        fh=uEwF/5PHnm/OsM34oYXieTAMlW2XIVzhvGvNb2RdT44=;
        b=aVLIBgvGIzPv6enh3Nc2iD8cYTfYW8CzawmpYatnhDxLy07zEoLKywLbUItJxeQpMY
         VSFZjSYdIXGfZL82rytfKdm4dlUaYqaL7oY97x4zYEFQzTpEoQH04KSZDdLQvzlGTz5w
         dyRQRFfcAsQqvxAyI+xYt/Ic6GHBUQTBhthVBoKjTwbQavBMCu0WNXeq8cDVfnSMvKYh
         ByMfapzt5UiTJATN1yQ0eqEHnKLDF+sigNIejO9FrEsXWpnSh5WJVhI26oQc1lo+urLo
         UBsuMQFodzt0CK/jaDbjYVd4c3/ulZxB+Q8c2XC8Ri88PVx7PUN0r3pl5LUSVlJwgUQc
         LStw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aIouyy19;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b1149a693fsi1089270485a.486.2024.10.14.09.31.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2024 09:31:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aIouyy19;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t0Nyk-0002WG-HZ; Mon, 14 Oct 2024 12:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t0Nyi-0002Ut-Nz
 for qemu-devel@nongnu.org; Mon, 14 Oct 2024 12:31:28 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t0Nyf-0000nz-9R
 for qemu-devel@nongnu.org; Mon, 14 Oct 2024 12:31:28 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-71e57d89ffaso1151623b3a.1
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2024 09:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728923483; x=1729528283; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EbTI3hTjAx35WA9WKfuyIahDCVeIv4+2l9l4P0VQY4Y=;
 b=aIouyy19CzR48SqVVyiL6BZ1RjLsucmxpoJrV5y9OfO5Mp1IeCJWWHCqePAhmhQpjZ
 XZ62Wr8/7GZoOsTtTA9lFBK2zM8THWq8DlWSzWZk3nTivrZ3wRftmDgbQtL2C1wJHifR
 YK8rcSfJgCIuf6kamtRC/AUFLV36vMHE6h/u5dwZAfW8RWwDwcIF6WHBnv0oy9j9qLr1
 ngTeRF+4mVWUApeSJz2oGjkbpj+JzDHJBqV3sHcIK9KwCsIWvFtrtCrxWl+JVwB5mMHE
 60nTLGCvxB3JvyE3oweCnBEX/XV+XEdbLtCiQUNT4Y4Z/uT8f/S+T/KlwjkHCvDE69Wz
 eDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728923483; x=1729528283;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EbTI3hTjAx35WA9WKfuyIahDCVeIv4+2l9l4P0VQY4Y=;
 b=GxpsdbRVQGWy8ISrkSo84Bx5AyAErEqF9/q1eB+SXdFbmLjNdWSidzz3mjMLe5X/3a
 6eCEAgFTRCr9DR4p/9oHSGMhpF+Sf8t0MhbefpBVbyHKHV16Rxq5GvT6NeGZ5PBpy0ZJ
 Fje51VZFvZLHzOHtEbBS8p54DKyC7tQtYfVS5Umw7fCnRqTF6HZ15VrGsE+kvjUoGRop
 vapdS4Sb5mB54LxyQjIN+PRZoF1Z7xIuSPK2lB6tRZavUq6CE0QqApQL8V8PWoBdi6FX
 zCyGuphbcFjqdb6LAhfqHCDzEeaV4JM3wbLmB2pIFUVxblbFw70ut5nACkUhMNOJrI3X
 k3JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0331u/dNEMD8x7aq7Kx2k8V0Wr2tr3SLlFjhDnTJxCJb9aQRNpWT11NOVY96do30VoZ77EwQpG57f@nongnu.org
X-Gm-Message-State: AOJu0YxxgkVMrz5Frg+cvuKGdawHZc7xHmvH9rDB50zFregVo78tWqwx
 sFf4j+gK+EpmvIUi8wK79vYE4DN5qVv53/2e/ONLsoTGhdMiBujuGq5dNqEXmSg=
X-Received: by 2002:a05:6a00:10cf:b0:71e:7294:bbc4 with SMTP id
 d2e1a72fcca58-71e7294be2amr1191687b3a.13.1728923483284; 
 Mon, 14 Oct 2024 09:31:23 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7ea448f94e0sm7086743a12.31.2024.10.14.09.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 09:31:22 -0700 (PDT)
Message-ID: <9fe7d2b6-86a1-4805-8f69-e5d8b45cee35@linaro.org>
Date: Mon, 14 Oct 2024 09:31:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/4] arm/tcg/cpu64: add FEAT_XS feat in max cpu
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20241014-arm-feat-xs-v1-0-42bb714d6b11@linaro.org>
 <20241014-arm-feat-xs-v1-3-42bb714d6b11@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241014-arm-feat-xs-v1-3-42bb714d6b11@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Ak9/JIwo4zfw

On 10/14/24 03:48, Manos Pitsidianakis wrote:
> Add FEAT_XS feature report value in max cpu's ID_AA64ISAR1 sys register.
> 
> Signed-off-by: Manos Pitsidianakis<manos.pitsidianakis@linaro.org>
> ---
>   target/arm/tcg/cpu64.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

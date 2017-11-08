Received: by 10.223.150.237 with SMTP id u100csp1471473wrb;
        Wed, 8 Nov 2017 08:23:41 -0800 (PST)
X-Received: by 10.80.165.145 with SMTP id a17mr1425598edc.83.1510158221418;
        Wed, 08 Nov 2017 08:23:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510158221; cv=none;
        d=google.com; s=arc-20160816;
        b=uryxqtkxy1ywu5iBITzlTjI6brPviAaJQWkLQYcY+xR2qkNkIM0nHgQrcZBgscTh85
         X18d/k4Jk/qf9f1H7fH8RtrFohs2ugTBHsEC3xzAlA5PJY6Zm3uIGoZMc0WVpTJ543go
         +kutpZQ9cOFID008CZGjdz+GWyH7t9bFIncQLBUogDmutZFQN7wDOGPN4TELy6UmwY9X
         Qwde4bk+WcjzBxv+iVSJQFVjyOFveK+pdAXfF4/CuJ9Nn1BVon8bVZGW811wZaj5Cxzs
         mjmmYbPIsR8onMgfX49/2Hpk23awHqjW16JKmlEp8BjKjtQi5Cqx7Sv8e8bORy0tkK4h
         dr6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=ClARoh9hJejkbIUFI0rJPi0ioVjud/dKy/f27y9zGoM=;
        b=F1s7gufFdFVPsu5kvvFHd+N4+kdsiOH/CXS5+rbX+8PeHfwAAb1isf1RjGCYO179tC
         bfKsLnaaH29xbkCiqSSyUzm+hHRM/4ciNc6KORU0utiJPIVZKjqV53b1O0yn2QNnC2bm
         FEloOmOu5EupUD/S1m+k7bX+Q+WGb2Vrcya/h9hcPVGUkKwXI4P74UH1p/1bH53PENxk
         ivIvWe/VnUfR+r/JcaVMnnFZamlAtHC5jxA400ZYa4ylqWqIYiGTL6k70gvzib0qKgzg
         qxIvfrKvPlhekQa20sfFAeOYrwcJgDz7EQnJEtjw4Y0tBXiuvUUqsYIMm7swiGXu34D8
         xbNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=DxE5H23P;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x28sor2902903eda.19.2017.11.08.08.23.41
        (Google Transport Security);
        Wed, 08 Nov 2017 08:23:41 -0800 (PST)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=DxE5H23P;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=rth7680@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ClARoh9hJejkbIUFI0rJPi0ioVjud/dKy/f27y9zGoM=;
        b=DxE5H23Psan7ycES+zA54YKenYXcvcR7ve/WcktSv0I8Sf24TnPi0Hx9FbZQGknsoo
         y3I9ofT5jESYrordxwp6TdV3UtKlPYzbtfOYmP0nBtn3R/eCp0Aqsu4e8/PrNMxWOqea
         VB6OT+sr6WJ1SmoEYamkCT8/wSTzIITvBgQRpFUWuD1kEn7tQHLaIIsvWeEjn4Rfrkoc
         X8q0iJPzx1Guo4Hwyll17rrEVpBs3TBFpXTbjJ6S7C34S8nRk2enJ551sZp7i+mIoyb1
         VGvemKul9DGIKqKTmkjE7XXnhkW6qlPWWwko6trzx2+OZnc7N4zW3TE0LCqTEcphpn8B
         jaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ClARoh9hJejkbIUFI0rJPi0ioVjud/dKy/f27y9zGoM=;
        b=sRZP314f96tRCKkOdDy83KldWFXD10cwJLSVnaoO5nsF39CqnUxMyq6wuyswCdybHB
         6V33MlOnuUP5H3ZpSfpDu9qKDZybBzoo7kTLS0LrcnGmnz1TlJ8J4FPmgBjTb9YWcktJ
         +NoYio7dtFtHqqYKj6fgIZEz836xARLz4jdYihZOQhjCECzHBVNUf7SOoSqB9tpcPVCb
         x3YcrWKQ86qQ54vTE8Xabnxeyomv66dyMssi0ffXkoyxxHU4lYjpVC9p59eoXj8IgbpD
         PZOHYKm8T8lZFYkczjQ2/PM0qWDhWxhNqMqzpp5ciczPAMc6E0UTRAnABO9EEbJg3BC+
         mc2w==
X-Gm-Message-State: AJaThX5o+ONVwgnpkYXtpmHeWU0yq14OmVxbVVgDNNyTsntJNX6Rtf6A
	U7Syvj2rKhdFugcih5tfU2Q=
X-Google-Smtp-Source: ABhQp+RTq494YQYBfn6NroMJVc9eqx+PC8kIDZcNCM0qJ2FGrTzQvddMHIunLCvNLFV+/w9iiLgPkQ==
X-Received: by 10.80.217.15 with SMTP id t15mr1366321edj.217.1510158220835;
        Wed, 08 Nov 2017 08:23:40 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from cloudburst.twiddle.net (93-45-2-58.ip99.fastwebnet.it. [93.45.2.58])
        by smtp.googlemail.com with ESMTPSA id t10sm4130979edb.92.2017.11.08.08.23.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Nov 2017 08:23:39 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v2 1/2] accel/tcg/translate-all: expand cpu_restore_state
 addr check
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <20171108153245.20740-1-alex.bennee@linaro.org>
 <20171108153245.20740-2-alex.bennee@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <42f49754-f402-694e-fbe4-acad66761863@twiddle.net>
Date: Wed, 8 Nov 2017 17:23:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171108153245.20740-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: doDuezs3KP0d

On 11/08/2017 04:32 PM, Alex Bennée wrote:
> We are still seeing signals during translation time when we walk over
> a page protection boundary. This expands the check to ensure the host
> PC is inside the code generation buffer. The original suggestion was
> to check versus tcg_ctx.code_gen_ptr but as we now segment the
> translation buffer we have to settle for just a general check for
> being inside.
> 
> I've also fixed up the declaration to make it clear it can deal with
> invalid addresses. A later patch will fix up the call sites.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <rth@twiddle.net>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

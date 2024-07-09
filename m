Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3372538njb;
        Tue, 9 Jul 2024 08:45:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVdUI58Zl0JYprN9t+I2cg3oog7WnqOiYc3aO52EgfjelXWCYw42P03+6t60DHTMIzIfVrR500COpcgipznuaHsTqTz9vXK
X-Google-Smtp-Source: AGHT+IEicRnq/lRK4LxYF5axyuVomoWG2wX0bvQWkGZOpmJGC2V/UESd5DIXsksikQ9iVZ6n7w57
X-Received: by 2002:a05:622a:88:b0:447:f0d5:ee4b with SMTP id d75a77b69052e-447faa8acb7mr33739411cf.67.1720539944209;
        Tue, 09 Jul 2024 08:45:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720539944; cv=none;
        d=google.com; s=arc-20160816;
        b=xWkdoSZS82mZtoo0WGsox3byNDTEY1xxODg8eaKZx0cRgUY+Rg8/XNodRhXKGhKUfa
         xQ5tfjE7nbrgqydty5HEzrSI4jI1ysKFn+9tPUuOQQWY0FofsEuSP4p/VfvOsPlfbJaW
         HvCw8p2ZcBAp8relI/rR0nAWbMCqwGlU7o7VjZTggaFFG/t3VRckVm5cb0T7154//qUz
         lBPqVq/KJt2c9zlXb9D5AITPKa/lrTglNPy8tVeRPAIKL7xY+mgJNbc+7loGFM8CzPX6
         hxARIPZw5d3Hb7S5/MMxU9eeWW3t3hAuKMHG3hEaMuIsWSj+D2L9C3daGbdOnPZfdowj
         8pSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=oI+T/vBKoAR3CTDqjgpnadHsDq6uZq3RzgUG7UJeC60=;
        fh=jXhsUEi5qZs1Ex+p6qeLRe0GdBshFisB+w+2ETfBgmA=;
        b=LeXMy+0VqwxLazj1bavJMlZQ5KTwlEKxwjRIkUzs7loP1oBylorAaM7Yu28H08vjal
         wPi+KNDzz3IOpvUhBHX+GJ/YjHKyR0tcH243h8swfr1kPn0TZep4iP9VO7LfKIs7MSW+
         7Phsca1Jvzut5JVnqIi9eIXeP+sl29HQtTfdPkBMxHzg9Gg3kevmPk6ShTGOXMM2DFdO
         pbnVRFGXSTJ1I2bU65mI2qCSBKOnQp4GbvF55S2S608mhAkvlJfNDygHGZYDJoHdS281
         hco8miBhC7Mlp/9NWJ8Px1NXnracgZEO0sy5EfNlA3DvCou6KrmBV4ctdWHiehz4bTn9
         Rnlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BV5QEEL7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9afecb7si28712711cf.45.2024.07.09.08.45.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 08:45:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BV5QEEL7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sRD29-0006by-UP; Tue, 09 Jul 2024 11:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRD26-0006U3-Ll
 for qemu-devel@nongnu.org; Tue, 09 Jul 2024 11:45:34 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRD24-0002Ja-Rx
 for qemu-devel@nongnu.org; Tue, 09 Jul 2024 11:45:34 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-70b48dfd6a2so520557b3a.1
 for <qemu-devel@nongnu.org>; Tue, 09 Jul 2024 08:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720539930; x=1721144730; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oI+T/vBKoAR3CTDqjgpnadHsDq6uZq3RzgUG7UJeC60=;
 b=BV5QEEL7GXav9BmIlPB7iftCtCSpgWjaPlao7++Ytlkyn2I01qPMC1OAKrjwjsYi9O
 0sDGe8Okxr9vMLpuNYDQ+rVgMVoyRLYfOYn42pJ8f++LvtDsI5LnoUSuhnv6RyYvcDyz
 IPO1qbCWOOMmOBFNP3zKWoFjE/IGYm1/qk1UAEjnrDGCFCoGW5npuJ2FoPIlRSNRfUaP
 YWt5Our42aPXCUXVwFJLm0H80+Mb6kiH6jjY+7hdf/LWqUZwIqkbGpeVFiiIQmDrwzxy
 kWMuDgkojUajPt3tHuvOwjNQcCJ08UrlXJxqR84pzknuEuWzUDzpNn/UuunSzXSAPxwq
 c1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720539930; x=1721144730;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oI+T/vBKoAR3CTDqjgpnadHsDq6uZq3RzgUG7UJeC60=;
 b=VTno4pRIAUsf3H8MlLFMYx9DzaenUknFZFqSjFWnjcdzqQgHAZdqtptEBch3ic8GjJ
 nRNCELP7p+rh2N6FH4NzRpaxKATkkJ7OiRA8k742xzedmKOEQpLX2zFWD/ksRWyNCCT2
 XhZVEdKEIIzPD2ei4PMRMvdxeWRzpYmUiZ1z1hHajC3JLUv35SZ0JOmCwkA2iaQaA8BF
 4otlxbOcssLlSJ5WY4H1e0ETrmIVYtNrwoZHOh4rmnohZGe3Luu1d6sOmHVFEdluAADv
 2EoGKGYOdhyrkt5JANJhDEEcHsE85Yi1PemgJs1FS53EETv9CO1MI6O4N6WNDu5SjO0Q
 rLhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbp1Oe7XmX2pSQo+qbXcrnihs9oMBSByeI90JGzxDnSnohB/4L+0pmQG8tzK32EAGA7Lg4esnYNzPvlN4q8qsmwzQJBEE=
X-Gm-Message-State: AOJu0YxJ4dqroxy1zxC4ewh9Bt6LW+zLeDRYPSyFRhGniL/QVSNAE9Ns
 nEuxIWPeBOa/R5uT1kCfsGgvMZWssxHercmSNipvvmtXCGBykAALsxGIGY25wDIm0vlMy60SkaR
 +Xtw=
X-Received: by 2002:a05:6a00:2d22:b0:706:6bdc:4de5 with SMTP id
 d2e1a72fcca58-70b434f63bemr3530403b3a.7.1720539930011; 
 Tue, 09 Jul 2024 08:45:30 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b439b1789sm2038990b3a.175.2024.07.09.08.45.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 08:45:29 -0700 (PDT)
Message-ID: <98e73d45-4217-4e75-8440-13a4ceb9042f@linaro.org>
Date: Tue, 9 Jul 2024 08:45:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/arm: Fix handling of LDAPR/STLR with negative
 offset
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240709134504.3500007-1-peter.maydell@linaro.org>
 <20240709134504.3500007-2-peter.maydell@linaro.org>
 <448e03c7-9bf8-48f5-b172-36bb06ec1139@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <448e03c7-9bf8-48f5-b172-36bb06ec1139@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: V7OK2+aPmVnn

On 7/9/24 07:11, Philippe Mathieu-Daudé wrote:
> BTW I noted some instr formats use 'uimm*' for unsigned immediate.
> Maybe we could recommend/enforce that, having 'imm*' always signed.

With Arm, especially with load/store, some insns have unsigned fields and some have signed 
fields, but for implementation purposes we need to use the same argument set.  Therefore 
we cannot mix names like this.

This naming convention works better with more regular encodings such as riscv or loongarch.


r~


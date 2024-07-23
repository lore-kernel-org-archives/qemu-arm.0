Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2328873njc;
        Mon, 22 Jul 2024 23:39:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWVIzwnvqCuXiWBlnMOcZarNcc3oNtUqwa6egLf5d+YE6jKAbpPoUBdU+XZQkd9bAgfey3/bPbt/8BPWfqnAGixjFYz8Qrq
X-Google-Smtp-Source: AGHT+IEXv/b73DN08xibG4X3YL9BgTkLJDNKj3SUc5pswt9/7qmQ0ELwbUYXYJ5DWE6R+SmTE216
X-Received: by 2002:a05:620a:2849:b0:79e:ff18:a510 with SMTP id af79cd13be357-7a1c2eba293mr196680585a.2.1721716755932;
        Mon, 22 Jul 2024 23:39:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721716755; cv=none;
        d=google.com; s=arc-20160816;
        b=otxy2j5AonOUidvs8b8Z2814yTy3aTowpyXmsUNwLj/DeNR4O/CbpfOdcw5krge4Pc
         USLrGmFeG1fh/ur+f4sj81ZFmb5zxbi+soTQAvx5uGBEK+wcxFEhVF0X3dAAxxl42vY1
         Iucx0LxqcIyHM4B+oVo4fFnlvXyXdkGK809dc9lDgO+GT8l1J/LnggbGJUMsxAwpvKBE
         4olHJXvoitaJJSryvOzXpDulp3N94d4eg1EbD/dQqo5gwwodOx8bVleGKYGrm3UNZPjw
         w6UaHZQmjmCkzZP57pI/HMt+g52JJT8d5MOJ/l7catkcAjP6RCrue2XnUEoSYr/wc/Hl
         sISg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fVB4kCLoW/coLOXsuSe+RffepDW8tckHbauy3298bUs=;
        fh=OElLILLYzOE3yfT2LS4JlCemBYGjpoOwBE8aELvnQh0=;
        b=X9AIRwJ7RWHhUYVa/2Y6zLYzRxUTyRbO2ftjD3tOLfNigy/eaOB37lXpVvQxbIldQI
         Ak1eSxaBg+keQOvNLmUxgWiTuwxCzNu+G9RB9MibqwtHorNDE52tFbSyeGYrHE95iX77
         FfTa7mjnkz02qLnOj4IeeB7hFgXInWuKlA+XKbDx88UaKl3mkh0/Y+V1buXtUOvdGkj0
         eRClaTHfWwIpAy4rtPBHbYJpWQkk85CZLvFlQAXwWt9R+roRpI5oORLnN3xfU3MLD4RZ
         u8OeaZtB9tSI912WM2TDhCpc93TtI7Chmzr960+/gBOnP0dCbyOyUfzHN9Tk8lNevmvz
         +BjA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XeiootWA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1990943c9si943527085a.658.2024.07.22.23.39.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 23:39:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XeiootWA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sW9AZ-0000Or-Di; Tue, 23 Jul 2024 02:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sW9AX-0000Mx-94
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 02:38:41 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sW9AV-0004yf-DQ
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 02:38:41 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-427d2cc1c4eso36101555e9.1
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 23:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721716717; x=1722321517; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fVB4kCLoW/coLOXsuSe+RffepDW8tckHbauy3298bUs=;
 b=XeiootWAnHJdCn1/KEWscBy1hE8dCe4omB7wj1DL6tU5HPavWhh/g584kA9c/22SFw
 MpGE8Zn7UXEd707xeMlJ6lZr1vGcqJ5HT819YcmKQCiOYB8cNBBRX4JNoEcp0vtrj4/f
 Q+0gv+yk5DqwrosTjaHCEHCfQEpjXNu4Ng5FIBMSplE7qRUHUtaohgxXDEun25thMehx
 4GJ8HFpSZW36VGQh+GP5GmyXQOJlCioYOaIOcXf9yDBXoO49dbJnytND4ePWRa4xzYgT
 FYih4Oj/sjBXT6BgwPDPFV6TksD5gXBwNgROoKb9SHp0tCy7NU2qZ+44HNVpJ1rmV9/l
 J+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721716717; x=1722321517;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fVB4kCLoW/coLOXsuSe+RffepDW8tckHbauy3298bUs=;
 b=LA3zV2TniJnIrK/Ax0E89j5pW/7G+tk5Kd0lPRjGfXX0zV3TydO8buN/VD3jxN+UPk
 HlODnG/N7crG8X63PalPE/xL2MC+7yyfGjGPHllmQxec2JIXm1SDo0DRuPfa/RG/mK2Q
 e6BMR9wBVtfc43e7eTjf3mSTcst1EFc3/7n3OyCy9eacaLAjPoKd9a4u5rhtqEVHMSrq
 tl5amjhGs7vb37jFAV29o8bn0Wz3ru6fDPWuUKtZvhDjCTr3VESoyMjvIWBhkV7dhUFe
 1OSIMXdD1/EUAj+L0YNHfatwBTn5nk7sZXV1kx9hgc00tkKO4AoO0Cdx4Ig8uc1XhlOz
 JHWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhsX0R6HkomLItUJ8tqpC4m4QiaqOq5YKXXBg7ZIZ2/JuuemLCSRD2ChGHreAgVa8A6XCjxetX1K1hq7Y++vkkNiQw
X-Gm-Message-State: AOJu0Yye8Hi+sOXJh9j+buc9hJY+oDaROUTGUxx/zhf3M2/xRaZ+ne3k
 tNgNJlEuAd8VU5/ULvu6kp78NEvyPuy106+wPc0pkjcinol9CPjI//KUtbdaxPL0E7xKFfD0+zo
 F
X-Received: by 2002:a05:600c:3ba4:b0:426:5dd0:a1ee with SMTP id
 5b1f17b1804b1-427ecfce9c9mr13570805e9.2.1721716717293; 
 Mon, 22 Jul 2024 23:38:37 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.208.14])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a8e47csm183870225e9.29.2024.07.22.23.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 23:38:36 -0700 (PDT)
Message-ID: <2bfad60f-6484-4716-95be-7b847bcdb6e6@linaro.org>
Date: Tue, 23 Jul 2024 08:38:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] bsd-user: Add aarch64 build to tree
To: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Cc: qemu-devel@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20240722214313.89503-1-imp@bsdimp.com>
 <20240722214313.89503-15-imp@bsdimp.com>
 <f3c9d0c0-1cfd-46c8-8524-cffbe5180d3f@linaro.org>
 <CANCZdfpPrjt8G5WWRPdMNWyb=hskk7ZCVS3HEAcway=XO=K3ng@mail.gmail.com>
 <f2f6c27e-7625-471f-b888-0f3a870bb0c4@linaro.org>
 <0b7514dc-f9ed-4c48-be37-5a5de7b26229@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <0b7514dc-f9ed-4c48-be37-5a5de7b26229@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: uTXZgcz3GU0g

On 23/7/24 03:17, Richard Henderson wrote:
> On 7/23/24 08:11, Philippe Mathieu-Daudé wrote:
>> On 23/7/24 00:06, Warner Losh wrote:
>>>
>>>
>>> On Mon, Jul 22, 2024 at 3:54 PM Philippe Mathieu-Daudé 
>>> <philmd@linaro.org <mailto:philmd@linaro.org>> wrote:
>>>
>>>     Hi Warner,
>>>
>>>     On 22/7/24 23:43, Warner Losh wrote:
>>>      > Add the aarch64 bsd-user fragments needed to build the new
>>>     aarch64 code.
>>>      >
>>>      > Signed-off-by: Warner Losh <imp@bsdimp.com 
>>> <mailto:imp@bsdimp.com>>
>>>      > ---
>>>      >   configs/targets/aarch64-bsd-user.mak | 3 +++
>>>      >   1 file changed, 3 insertions(+)
>>>      >   create mode 100644 configs/targets/aarch64-bsd-user.mak
>>>
>>>     Can we build aarch64 on Cirrus-CI? (not clear on
>>>     https://cirrus-ci.org/guide/FreeBSD/
>>>     <https://cirrus-ci.org/guide/FreeBSD/>). If so, could you add
>>>     a follow-up patch to build that on our CI, patching
>>>     .gitlab-ci.d/cirrus.yml?
>>>
>>>
>>> We can build aarch64 host for bsd-user for sure. I'll see if we can 
>>> do it in cirrus CI.
>>> If so, I'll try to add it to cirrus.yml.
>>>
>>> This patch series adds aarch64 guest...
>>
>> Yes, we want to use a aarch64 FreeBSD host to build your FreeBSD
>> aarch64 bsd-user guest and test it. Am I wrong?
>>
> 
> This is adding guest support, so your suggestion is orthogonal.

Ah, got it I guess, this series adds support for aarch64 user-mode
emulation on any FreeBSD kernels, so IIUC we can test it on the current
FreeBSD x86 job we have. Currently the x64-freebsd-13-build job uses:

   CONFIGURE_ARGS: 
--target-list-exclude=arm-softmmu,i386-softmmu,microblaze-softmmu,mips64el-softmmu,mipsel-softmmu,mips-softmmu,ppc-softmmu,sh4eb-softmmu,xtensa-softmmu
   TEST_TARGETS: check

So the aarch64-bsd-user target should be selected automatically,
is that correct?

(got it, my request to test aarch64 FreeBSD *host* is orthogonal).

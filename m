Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1602838wrq;
        Wed, 13 Jun 2018 22:50:28 -0700 (PDT)
X-Received: by 2002:a65:4cc3:: with SMTP id n3-v6mr1056020pgt.98.1528955427966;
        Wed, 13 Jun 2018 22:50:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528955427; cv=none;
        d=google.com; s=arc-20160816;
        b=gx+kajH/DSmqntMJTZY+szodW+45WwgEmzLWxcrJAnjuOLsigpgDGt4edSZYRQERMG
         j88R36ydWZ82FK3h/azW0p+UJM7kB8PdAPLZyjI+svvPEjSKA7HGXhofZZJ/+YEret6A
         h/lB2OrCo+lRtQ8Yu12xD6NIohfYnXot7tv68JCKygajHPq6bolBGWBkiH+EETlhrdac
         t5lTlz+URIbx+6HYiibAgx9kn7nOKNNS738+V9w745aQDZdl3bWZl3i+EGE9Q/Omyy+l
         lL2jaZ0EG4WqjJFEA5vP1ojr2g4o8r20cQCLXCJWvAtnkXY5d33xWotTYt/ae+nF5kJi
         TVkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=tCDqnLhMVrw/j4L3Ej1GfGt30QMeyV9iuvaUY7OtROY=;
        b=TFEGdgp2fsG8W6dIdav89eQXqbuwQhDqN55Apn2m6LKSjUojicNDceUsDV9I7cAqNY
         xLpNuyZMiw/sg4pRb1Il2d4GJpj+PGfzzNk/Dev0KKKmo0gXymMp9iYW2ihlYcNSG9sj
         NhmmGrsH9L/j8cDS+G+XGwtNC81fTGqpfNQ0/ssZQkCKVY0eNAAuBu/S8lk3xOPN/WDH
         NpkhKjNSJ+i5lyUIEgSwnaD4iikZ/Q4mVagAtQJtj7/gAa1EU40Z4q76iWzNgUhBw0+k
         vOhApm/Ez4Cz0DVgsIspMVURG3UGGoWPs68c452kyd+zSCPiueD4NhvOBCPbwmcxLd0L
         v4NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ktp50mO0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t61-v6sor1513713plb.125.2018.06.13.22.50.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Jun 2018 22:50:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ktp50mO0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tCDqnLhMVrw/j4L3Ej1GfGt30QMeyV9iuvaUY7OtROY=;
        b=Ktp50mO0pT7XxfXrzHep6RPxXp6suLIpuIUD0+4MNoCyZUmSw09sIhmYH+XUJskt8S
         +huXGSgce3qlLww06o0CDwRocT6VKs6wPlFGrhQquVjeE/C+M2l4jQk391BcaiPX1Q0F
         4Yt1Yw2n3JewpEZ2PkZgOMjok8XF8FTX5VK7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tCDqnLhMVrw/j4L3Ej1GfGt30QMeyV9iuvaUY7OtROY=;
        b=boB53Yv67v8ZR/QNx1C0TaNbCeaP4pkjziEyYCbu6CV8c1hKy77tmSg0r0uEzRfepg
         2PZpWvV2qv9z/BcUAt9UhSiReiZOpc4/Z9Sil/7upwWC5Y1cNwNQBZeDTLAEqKunDV/I
         MrAc+TrDc7QFaZ5sZIVdP6G3r1Qa8s/c5u3BIsOF7gT1RsXDcrN1ytOt2RYnlsy+5Tsu
         11yjFpn/XJN2vkiPuYQPx7ar2bNyqb6AR0d82ikyCXXZKvnnKc5xVk+awz0FR1S92QJT
         dl175rneZDhKLqUnSRSSbpdUcowWcwYDgLY4sbxIZ9Onz8KECDD8UvodwABI0xjQ+I1V
         sJxw==
X-Gm-Message-State: APt69E3cvmo/944R5qjlFiRQVHvTUbNxlVn49WWCXZSTUK9jkzfkkf9s
	KLlrBaob1kSQpY9726dPcpe2ZGoAd4ssfw==
X-Google-Smtp-Source: ADUXVKI2JYT/b5kwn8u97vQAWO1jW6JC7ycMbPwSs2AWGWwG5Awj17ViFdgu8Ynoev71XfTHz6rFqg==
X-Received: by 2002:a17:902:26:: with SMTP id 35-v6mr1389768pla.276.1528955427535;
        Wed, 13 Jun 2018 22:50:27 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (rrcs-173-198-77-219.west.biz.rr.com. [173.198.77.219])
        by smtp.gmail.com with ESMTPSA id a27-v6sm7001081pfc.18.2018.06.13.22.50.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Jun 2018 22:50:26 -0700 (PDT)
Subject: Re: [RISU PATCH v3 06/22] Makefile: include risu_reginfo_$(ARCH) in
 HDRS
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180613125601.14371-1-alex.bennee@linaro.org>
 <20180613125601.14371-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d293c78c-c068-ba50-f4ee-c0a9d4b1d0be@linaro.org>
Date: Wed, 13 Jun 2018 19:50:23 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180613125601.14371-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: w1CR3IlYXETL

On 06/13/2018 02:55 AM, Alex Bennée wrote:
> Otherwise changes to reginfo don't cause the whole thing to be
> re-built causing much confusion when bisecting.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

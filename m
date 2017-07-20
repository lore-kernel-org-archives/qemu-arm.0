Received: by 10.25.44.15 with SMTP id s15csp2545800lfs;
        Thu, 20 Jul 2017 12:40:29 -0700 (PDT)
X-Received: by 10.55.128.130 with SMTP id b124mr6816774qkd.109.1500579629052;
        Thu, 20 Jul 2017 12:40:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500579629; cv=none;
        d=google.com; s=arc-20160816;
        b=uZ+ewcPFC4lAgOLZOoLySSSCZ3a0bVCI5Ib/Kyk75BG3vJj596E0QxhOIMrvyHekeQ
         Eo1zCd6s04lhEzpWNzYe1qy/4+aTEicAnlHR/uCqjmwTyZjwXDywEl0aRdiBLsvlcXVe
         3hE8q6VZYa4viepzO3IgF6HpCoJJixp15jOrxNgyxZ2tw6pUMls/shMDKhHCpPY4C8wn
         xcAfNMtUpl9EBKSdInlsUd3fYbqhqaZTBwi2+0HZSpBV09kHv0A/rRZylGIFjcGQdICH
         DiiAh2/urvI7l0ktsWbatPLDQCuxog/kqH1cBbP0RujbLcAGTNA4UPVOcXxc3asctsuE
         qbsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=9GjJBYdRMTZ9HBbxenP/0CpQW5PZJkILYDyt3LyY9SA=;
        b=aqzgkPx2vEXLIdqrP3Hy9nzyPaY094y9C0JhBooU2s1CwQ4Kjt0VMEJ+FXWJcnw9zL
         9wMWQ79QME4sqNeOksotned54XOkn1GbS6Ju+yzoLFNQ6WoE6/S6gT+4OwUP5ZC0WoXq
         Qv6FAxksQr7JYKnzAfVAv8FViOOUwjf/F5PgRJ/E2JbcBmkNgct+GRW+JZPEUKM5/mZ4
         Egqmho2CCYGX0BdcoHLy1LB7P+0WhN6EC10V5eO6x9WCBtujWibnN+Ct0BahadYZcXVp
         7kfoNzBJst5hsIhZ1CqdJ9MEYzW77p8TT5RDK5Mvlc0XaOiTNPgrTFBTmOd0gE36JHPi
         qQRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=X+9pwoc1;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::232 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x232.google.com (mail-qk0-x232.google.com. [2607:f8b0:400d:c09::232])
        by mx.google.com with ESMTPS id k65si2486253qte.76.2017.07.20.12.40.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2017 12:40:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::232 as permitted sender) client-ip=2607:f8b0:400d:c09::232;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=X+9pwoc1;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::232 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x232.google.com with SMTP id d145so4974384qkc.2;
        Thu, 20 Jul 2017 12:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9GjJBYdRMTZ9HBbxenP/0CpQW5PZJkILYDyt3LyY9SA=;
        b=X+9pwoc1nsIgFEm4T4zrRdvV4i8HA+chBTf+b+uXvE+Orhd5Bwl8MYRcyLv3VqpD95
         IjhxBBGsnPpcCBIvpNnXk/smNzHsDvtFYcT/jM52bdD29up+HV0bfZ5g7CtnheVai0tT
         kEM9L540tW7LM84l/F7tsdH4pOpa5zDTEI0YbOwW+3d6mdtzQ8wRIrMloCrnp9O1H+x8
         ss3aSRQbDvGkrZgMwH6+YeoRL1EUrJUy14hLu5hWyJYd1bptCVpCMz7IRjTNErH+xXae
         66189xr5mVUSw3CKI2I4tTg5UYpoCJm6K1WZ4qvN+SLcASYD17clfV0OsK+twvnLyV4B
         AHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9GjJBYdRMTZ9HBbxenP/0CpQW5PZJkILYDyt3LyY9SA=;
        b=i30zfRgqWn8k3NYB4xGXql9aX608t0ItRZWlyBEWnSGd0hfaAlIqtTtzC1u/82pxTv
         lPaeqGlAjL9bpYeL0xNKeQcd61Xihq+z7Lw8sPlCINOVUoCox9ECjxa1nrmR8nXnvb52
         TYmkVktDR3/SQ+MSDzuioVPIQ13/4KR020sYKauIbmM8n5/5gIObtYd7Y5goxJZA2Lkb
         GmDtkM1PNt24R+IXNlds3elA28jkBX0WDRvgJApb97VAF3/iPFygzH3dlMAjBk4H4Npv
         eKCLFvdGgEY3ZY+YXkjcmAYTYEGzu3PYfKGeFjNYCtHAaUdeTKSMTsmJC5f+M7eabKUw
         Lsig==
X-Gm-Message-State: AIVw112/2beeWsVsO1TCe5AzajbOhMOVx/ZKO0AploPKoI5bPl4sbHPO
	olFxReUIuKGGcw==
X-Received: by 10.55.55.79 with SMTP id e76mr6575244qka.13.1500579628710;
        Thu, 20 Jul 2017 12:40:28 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (14-203-206-9.tpgi.com.au. [14.203.206.9])
        by smtp.googlemail.com with ESMTPSA id d14sm2237057qtc.58.2017.07.20.12.40.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2017 12:40:28 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [RFC PATCH for 2.11 14/23] target/arm/translate-a64.c: add
 ARMv8.2 fadd scalar half-precision
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20170720150426.12393-1-alex.bennee@linaro.org>
 <20170720150426.12393-15-alex.bennee@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <eb3454ed-4a7c-180b-a005-00557031cf60@twiddle.net>
Date: Thu, 20 Jul 2017 09:40:21 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170720150426.12393-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: C0epA2inhrSY

On 07/20/2017 05:04 AM, Alex Bennée wrote:
> This brings in the initial decode skeleton and the helpers for a
> scalar half-precision fadd using SoftFloat3c.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/advsimd_helper.c | 15 ++++++++++++
>   target/arm/translate-a64.c  | 60 +++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 75 insertions(+)

... and there it is.  Squash this with previous?  Anyway, do something so that 
they're bisectable.


r~

Received: by 2002:a05:7022:6591:b0:89:eff1:5568 with SMTP id bd17csp1247621dlb;
        Tue, 10 Sep 2024 07:37:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVp9yN5IWeodY8AXuthqzTgsrVC5Q4oiJnVwOPckldCTsggAmMYD4zp/dORd8Q5NU/9ve0YlboWhHa4Pg==@linaro.org
X-Google-Smtp-Source: AGHT+IEvgjxeiemx6RfxUy/1I/tTqroWgewvXAY5d1SlLHlIC+b1zlrlvrEkIGzn+jk0wcViRR7e
X-Received: by 2002:a05:6214:5b86:b0:6c1:7508:9372 with SMTP id 6a1803df08f44-6c5282fbb58mr228479726d6.9.1725979036649;
        Tue, 10 Sep 2024 07:37:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725979036; cv=none;
        d=google.com; s=arc-20240605;
        b=h5P8hFIJttJG8eamvwymw6QKp1F1uy0JcPq2pO6W/aXym+vyaUqu6lP4Os+BSp7v6Q
         1MevoNADFd7ircqIxZdGchBb41SdoXkAkrC0/dYzTQ1XHdIeIE3tbHR1Jy78z98hcSJ0
         XEs5WKi5SQSW0WFz+5ikN0r64Oa+a0mebavggTwXMSlbu46gbxd/MvDBa6G/4wCLcGYg
         k4ZmwHhEjj6oAI2XscF6vZpjJbQynVaBt/xmoRz761WxGUZrwM+UWWVa4ABoohJy9omc
         pVgXCzzVOjDkqSD4/3bJ6Mwa62E059eZ6LNx1Zhcizc+WLRuiykNqJeHp9/FmL7NZoY9
         KQ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=O9RlGtbBGyYYZ5pNAkXiiC9Pk+QpNb/DlIBkwLE1N54=;
        fh=LZZJWGXKBwt0PULw+uHMYUhkYp+lbYN9ex2rpzW+Bp0=;
        b=OeBAHs16XDLD5dhU1wU6ATVZV6osxddkuhmEkDOeqcriOdkseRkxVPlvzHoQ+YaNM9
         67o7u5Xf2mLFkTKPm2tRip9LmTSCLfyuvbFCxYCgcVpuUo2fR5ityz8+1sV0SYBe+SNk
         IUwA8KcazyDKXGAJAFV7CWS/qpd9MVGDPloMyrjRNY1zh+ie8H/lKhkrnDMRrrLTQ/+n
         4YaTVI2t2WOtkeRjRNvsZcD+1m4zLwCgicZnockhMPEQbkkQlbFG1Do/09xHMVm6JJMB
         fvqEdyfop/miTbc7Qo14goqcJQHoitobqyNY2cvL9mk8xZ425paKnkMpBVHNdFG1MGOC
         h0aw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iH51bhyF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c53476f38fsi83273746d6.266.2024.09.10.07.37.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2024 07:37:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iH51bhyF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1so1zS-0007HA-5M; Tue, 10 Sep 2024 10:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1so1zP-00078f-WA
 for qemu-devel@nongnu.org; Tue, 10 Sep 2024 10:37:08 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1so1zO-0001r2-7w
 for qemu-devel@nongnu.org; Tue, 10 Sep 2024 10:37:07 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c25f01879fso975376a12.1
 for <qemu-devel@nongnu.org>; Tue, 10 Sep 2024 07:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725979024; x=1726583824; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O9RlGtbBGyYYZ5pNAkXiiC9Pk+QpNb/DlIBkwLE1N54=;
 b=iH51bhyF2Yqt+qe0DE8lLX0uIaycyDdH+HL1tCB0+1y5sPq41n1eU8a7fekmwGctA6
 2X+DYf+pRJHSfVzb5xvF1AH2FtZvNv8VlCMvUJe3E10ErMRWP8c9cxETAlkzxepL0akV
 6IQRT0XFPLsR9E68vO8DY2yWPXl1RFkQ2mT2ouNksY/pYTMA+QZoz8iV06oeObimvmt3
 +HisBnUCFhw4KTEFyX5jOTXdCytCKIFFCBPRqJwAS2cEEU59hfiF23lVFoS9tufVAm0C
 EmULA4sZv0YSzZH8bfNOnSGqS2b1eILD3Msr40gU1AlqRe1sFlmcF4l1D4f8WkOMNvKF
 5+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725979024; x=1726583824;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O9RlGtbBGyYYZ5pNAkXiiC9Pk+QpNb/DlIBkwLE1N54=;
 b=R2+/Su0JHMNgh1dP2PaPJQoRESIsTBoAW+6vnuLLQCe5bVT9+m2QnPJMC0v7lKF7DZ
 3hRMlZxC2Lx65uQF2Vj0g/kkxQ6nJSyK9gXli0PYl2S7beVrbXkGpYhTAuMk7wSVPsVO
 fLNKgYpzHNqaMmeqPoqTl0Ko6gHTI6PBpMI+mZUYqkHQLO1ebNT4PGneooRNv8Koz+Q+
 rX73RvAe8u2Dg+dNj0r4uCg3xiRpJ+5JiiRsYmflnklHZUqZF2Zkqj1rXmQt47sBOVih
 lJW7bn7vlX1DtrN9ngeL1iXU7QqAwOdnjSFjbV574VSgFD72fYBG5196e5OZK525NNyt
 musg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWatO5UBhpBYtdU5C4NF7AY/KBXvOYR+OKt3FwJ6ErEOF0U1Xz7sCrSSkosDEgRoLkXKX6JPmWT4SUx@nongnu.org
X-Gm-Message-State: AOJu0YwDAFHj9wW+LksYZrAFVGxcf9Z8xfK1WElZlq8Y7rOIvqid2bOy
 E2Y8v/QzQ96OCBJ0uzUOE4IsTLqL2oXJaYkYUkid77PKRS9hS4Zi44QHO2Nf+Oc=
X-Received: by 2002:a05:6402:40d2:b0:5c2:7727:6109 with SMTP id
 4fb4d7f45d1cf-5c3dc7c6f21mr10841461a12.30.1725979024338; 
 Tue, 10 Sep 2024 07:37:04 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.217.32])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebce3448sm4389142a12.0.2024.09.10.07.37.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 07:37:03 -0700 (PDT)
Message-ID: <9b5a53e4-49aa-49b0-85b7-11482deea2d0@linaro.org>
Date: Tue, 10 Sep 2024 16:37:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/29] target/arm: Push tcg_rnd into
 handle_shri_with_rndacc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20240909162240.647173-1-richard.henderson@linaro.org>
 <20240909162240.647173-21-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240909162240.647173-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52e.google.com
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
X-TUID: QlgzEnm8fAWm

On 9/9/24 18:22, Richard Henderson wrote:
> We always pass the same value for round; compute it
> within common code.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 32 ++++++--------------------------
>   1 file changed, 6 insertions(+), 26 deletions(-)

Per 
https://lore.kernel.org/qemu-devel/c3b1870a-6939-4470-92be-c9a4ba0c98b4@linaro.org/:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


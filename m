Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp59446njc;
        Fri, 22 Nov 2024 21:43:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXVzDeKkD2ORmEvJ4M68vcm9qttDbsC0DRL3DWgO1KqXWQ7pPBwpcRqdj7PpmyG9+itb8OpMgbPV3KoRw==@linaro.org
X-Received: by 2002:a05:600c:458a:b0:431:93dd:8e77 with SMTP id 5b1f17b1804b1-433ce4ea027mr53240975e9.31.1732340611059;
        Fri, 22 Nov 2024 21:43:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732340611; cv=none;
        d=google.com; s=arc-20240605;
        b=gFnBuY7c/6IsBjB0w7+uYlRFX19dZ51M5mCGK2MBGRRxCeomLm6glDqGSoBtbqyTaR
         Hee+82WSpK3gkn+9dQHeSzrfp5zNlNyhm6RhdYZsMMnpdrsNob4fkYq3U2NJ4YFnGAZB
         sIBAxIaFK1pF9Fkp5QgSJ3DyyNhaGYn/OxPHliBhDw3tNiprUOFlrVfNCUGm7jBkWIz9
         n8RmWqEDOmaKojR3xfyjUUNa/XZoj+abB/Em1fEwl5XNCK0m8KjdX32FiN+ZGG7/GwkQ
         nFdpnNO3jnhwS/X3fnFElOVd+tAXe/IfcxH15j+LEel/dIKlRLYFQDCKf26XCQ1S/4bO
         elQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=r5SLiEGNtParUpdQqTXob+tTfQ1hQU6vL+CHZB9nKXE=;
        fh=ykmMMos8dLJo+cet3TQfpAUc0Mi2J08YPpsEXzo6DDk=;
        b=gTMzs2AJTPlkpIuLqTabbZOOiZWR3UizyJIxsxOAAH78Ayuy2v11670zonkP6+bs+v
         KbEYJFiAObg4aNYFJYB61LEi4Uu/aFvVUjzvCm9L0T2MdZv84CbirelccuAQr9C9yx1b
         GloNd7g9v5P4KbGOCfG/fQW7l//Ys2350pePMaBj/NQ18XnblZOJXSs9xmJml3iOGCYM
         nvYgCpyy59flWxofODYsrsrgZkaZ+S7AUsYZWYfhj4nKKYUlfBMeFJMGjcDNLJF10N6X
         inerLRc2A2l/+POoEHleuyIkbGTZTPArDKKfyHiwYdJa+P23UZ0hehuPGOfREQkwD8YL
         BG/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=moQJbhV4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-433cd7e5ec4sor15126185e9.6.2024.11.22.21.43.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 22 Nov 2024 21:43:31 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=moQJbhV4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732340610; x=1732945410; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r5SLiEGNtParUpdQqTXob+tTfQ1hQU6vL+CHZB9nKXE=;
        b=moQJbhV4oi9XDSwlAXGxOvRjazml9jjzQtus+bGmXWOyN4Zkst18krpYxC1HE55mnL
         cfzwEYcD5Q1h4mbThBrj5EkV5tWeK5dGO+29P4Aj6u3rxJawJZjN0iu7pOq2t3Dtye9G
         GVhuaamUFQpe72zOMQrSnTRL2uVsHMBv+i7xQWYxDhKhGTVce743nedeospq4/b7NyCX
         +FrZ48KgzJBXsNhCJdT9N5OoFK7bPxhsQfJDZi6tIjChMbtfYeu0JTLUMquDnBvP/733
         XTUpWM4ZeZN+3qUAZm8xtPnsjTgd24qee9yb5XsWwdSGQUD5EEVRmjwiwYLQ7LjSwizi
         oNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732340610; x=1732945410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r5SLiEGNtParUpdQqTXob+tTfQ1hQU6vL+CHZB9nKXE=;
        b=h1zU8g5xf4C1e9c/juBWY7n9AFiE6Kjai0lYdl49KRPH1PvfDPO5YPKN0YAych3hdB
         MWaR0sCmJjbjvzMrlBVkFCF++Fq0OpKtKsbJYSmxSzqdmARC7DZ0V9jXZmwRrioAYxQ9
         DIiv/dBYrcgVTAcL9Afoymxs/8ai4iCsnGe1+gSzE0pEFsDyWppuIRA/iyqt7gvrmw47
         CZYAHQmlbv0g4RngPmrNY+Ztb9O1H1f9vr7jHDd/LRUrym6PAEo/7DyzDq5CMZTD3MOA
         x5vfiHxJ1lt/l/GY+p6stP9mDDs+RomAUxaayjLEp5lPeILEqgvuAh008jXjgkLjoCXr
         DwVg==
X-Forwarded-Encrypted: i=1; AJvYcCU/O15gcmF6CArlLbGTFqf/7B2axlI5a3fVoqAJ7rNmxlF9/GG1BC0QhK+wzf+RXK1V6xVrC07ZBFtOWQ==@linaro.org
X-Gm-Message-State: AOJu0YxFxLvoRc4jHxURMDuBSth0pslD02rFBML8SKgOj6bUSrRAht6G
	tmS06TrXQjl/5r3QlT0orBrdmYbdWEMD6hoPCgTIupnNdeYGIqG4/8muxsJqAvCNAw==
X-Gm-Gg: ASbGnctDZGTdUK53I/x0y7rFF3bGf0r8Z0+MPOVDdewl0zuztYiSc4FZku+yVYn3wBr
	ocO6JQU8l+NmPGIVGDed9Enc7U9GU5QLm+gsOgyKgycA4WxiL15/lr5tweKClLOVJCDVuQBD3X9
	cHGz70tTyetQXAjy54PXVIN7IgaCijdE1/UtY8AH6jIPwlKOf6FKKVT7omQBWwqUOjBJTXYkZpD
	fOiG/f2V7X/ieUuIR3haAIyYKsitc+TaPSj+fWtqYNRUI3nz9vop2ufjfkoZg1w
X-Google-Smtp-Source: AGHT+IE8Wg57mjIzY0mhnkATiRJGWpn9diflj9MO7BV2LI99tFAQLzLi1Jjalvzf31SupX8Ga0LjDg==
X-Received: by 2002:a05:6000:18a2:b0:382:496e:8784 with SMTP id ffacd0b85a97d-38260b6eb06mr4893319f8f.26.1732340610512;
        Fri, 22 Nov 2024 21:43:30 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.146] ([176.187.206.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fafe158sm4230401f8f.27.2024.11.22.21.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 21:43:29 -0800 (PST)
Message-ID: <2088d990-eeff-4305-9629-be87e60f1e9d@linaro.org>
Date: Sat, 23 Nov 2024 06:43:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] docs/system/arm/fby35: update link to product page
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, alex.bennee@linaro.org,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>
References: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
 <20241122225049.1617774-8-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241122225049.1617774-8-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: rAQF5bb1L0Oj

On 22/11/24 23:50, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   docs/system/arm/fby35.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


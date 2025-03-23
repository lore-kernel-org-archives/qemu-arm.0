Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1563393njc;
        Sun, 23 Mar 2025 12:49:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWJLM/ncVEnLIifSleuIUx4hHF958Y68I3+QuvLOx4e11I3+Rt45OdeuIFEBO1KyrwLR2KrDbInFnofzQ==@linaro.org
X-Received: by 2002:a17:902:f642:b0:211:e812:3948 with SMTP id d9443c01a7336-22780ba2e00mr165109395ad.0.1742759358617;
        Sun, 23 Mar 2025 12:49:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742759358; cv=none;
        d=google.com; s=arc-20240605;
        b=VPtxsmvCyKWblYZ4lP4OUGaHHkiY23gUNnXOWcdlBseQyREl3bkIsGPpx1idNj6Nez
         vCl6XFGG67+Ff+vZwc4VPcOtMcKgOpGbQNDOkCFklBnhmbMQNhQrMJ3NC9ISNNWgezL1
         qTXNPAE4Fek/5LbsaQkJwULWOYiR8mOwomNXwNr0KFqf1Q2ijm04lL4V0ye9iiDOUb+n
         sR85piRMBvJAp3PBCB2EbKIez024W+FX/1WjN1EUBCB0REUxo36Rms0Z+D4+2TxKQ6m/
         YpveFsWcWGFp6YbLQ7/2I7xIT4e011cs2D3HEtPRxOtAyfvW/o5AeqKowodWYl1KGOnG
         a+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0VrTG+OEh2A1X0Mji4obFRoKHQRdQUnTcQeHWGV/Qrg=;
        fh=sRNg5XW5DEam836SlsUdPfG/9wPbtI0OL7Q+MpCgjpE=;
        b=jF/HE+8Fz6jwUbeZMlaaAohvvBt6FyZ5l2SL/nTscGhNIR4KBoxA0Nj9ejF4HerWFH
         kTiHGhQMBKXeGtyD/Gf/vHsYz5FPbpa8DYeszsLJJh9U45CWXi3X64mjJtwvP4ubKWGx
         9DANgJITXzbriG0OXHGhyc5qp2jdoyPHC9Xk9eVMRBDTRj8UAzo44AuneONIey7Zq0J7
         qpaPo/5rFDLP3j/TmgJmdZL1RR3PMLDDcC/j9Hma0peCzDmXrNp4FwWRLmog35ZEiVgn
         cpXgGb/dgFpQpDLYxMGNXV/EsRvwu5oTmkX7GhctB88S/H3FM83uqHjT9zQXlOm3nA92
         LPqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQcSI6sX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780efbcebsor32822235ad.4.2025.03.23.12.49.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 23 Mar 2025 12:49:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQcSI6sX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742759358; x=1743364158; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0VrTG+OEh2A1X0Mji4obFRoKHQRdQUnTcQeHWGV/Qrg=;
        b=TQcSI6sX/dYyjCYBX482FUZdhFETzdA9t14aZoJTPBEmxWD/1liCw/mixIJJe/rZq0
         hlRPLhIXs03o3HdPpnUo9tsyOeEMyC/2dEHm9QmJtZR1CA7oZdv63oAvEes0F6QrBQz5
         Jw0uTPTy2B/3xVAbM6yxGpgeLDlm9taLb50y3A5XuB5c4cwMvjVAMbECM5592B+S4Ygr
         fKq0bBRxG32MLTP9EmjCrEiFZQWY5GH2Fqws+1fjESVBK9OB/eulEIgdYTIrPJwqOsJW
         Kw5UG41b3sNcBxH8jnfMTMLOtJOpm1OO9TxbgVqeoHMXlf0OLLO0/2mDZgqDGCobdBox
         YFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742759358; x=1743364158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0VrTG+OEh2A1X0Mji4obFRoKHQRdQUnTcQeHWGV/Qrg=;
        b=YrEoqfZ+D7LfOjjof5/e8jd6FeRSatz6RWxwpjNR36eLBfX+lx7dO3TSpRzDXLJhi/
         6PH45Hjv+DS+jo+Mcmlp4VbDWo1QhYXBVYCoHrbo7NJl+2qEqBwDcD9DH8FZOgDp5EJH
         5bPks6fpaScH+UFt6T3f9nptjintJD57yHH0HY6ZyaJBek15NQGhjHVl8si/YdQEu2zW
         S38ikXPRstWfjF8zxgrU5Q76NWSjA94co8VI6TliM/eEJSYQaht7mn6qsQhvIBz4lOQ0
         LAFQ8O4cirDibh8kY/S5+kYW/IWgqVL8uO6UQonTve4IhIhKXqdb8774eKOhj2TJJjmU
         0DGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU48dhCcTqQoF37aFZe21+DO/oJJ1k+aVDs37PV9KJEsnAcaJVhG4jlAO4NJZNn/6+37Odw3xCZZPZ6IQ==@linaro.org
X-Gm-Message-State: AOJu0Yy6Rlvanv7kWIOu2MlxxK87xAXhWKnZQbxk/LoyRAUp+0GRL6nt
	T/eJff+HmRCY1h9IZ4rNwIoxuIlPL5Deb+jIYW1ofF7A/qA6NYMkYhsWVZpyV7ll1Q==
X-Gm-Gg: ASbGnct6fn5usNeio9nY9TW2PagWiXw5PpdU7nbdlRfSdyWH9tcNilt2w2UihNRDFnt
	dgL71jqThczCg1xz5DO0HnV818beLOI9Bbd1wegNNpYPCwpC515rCj26mD0YkjX07/3S2lUZxyv
	761Q9xhaW2jNq0iHKW8B6KTdvSz5mUdY2hU0Zr69Z6EyuBc9Rxxmk/zFy6ejQ+rEtPyYA+eCFWt
	fZk4dyfomFniCiAGG4TCSQ6ttl5HD3dRxZBx/dQPW59xBmqFCk1BJIZD+JEcrROmgPGr/FMI5XM
	BQahVugI14kIUTgMZ/mf8ZXqKJYApnZLXSLA6cl6BP66qEyXiX6gESn5yxY78jW4tdyF+UW9lQP
	7o7rJUGeVYNBCIx9DTv8=
X-Google-Smtp-Source: AGHT+IE3dab26w2GkKbxpQ0GrlEU+Vtg4WGY5dK8T0jv2xahW5pgggFyno21qL5No28YGoiYLVYaCA==
X-Received: by 2002:a17:902:d482:b0:224:160d:3f54 with SMTP id d9443c01a7336-227a5222ab0mr53827665ad.31.1742759358106;
        Sun, 23 Mar 2025 12:49:18 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811f44bbsm55022875ad.232.2025.03.23.12.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 12:49:17 -0700 (PDT)
Message-ID: <eed04dc1-ecee-453f-8f86-83cf72feaaf8@linaro.org>
Date: Sun, 23 Mar 2025 12:49:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 27/30] hw/arm/digic_boards: prepare compilation unit to
 be common
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-28-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-28-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: F7z7wUIArhfj

On 3/20/25 15:29, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   hw/arm/digic_boards.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
> index 2492fafeb85..466b8b84c0e 100644
> --- a/hw/arm/digic_boards.c
> +++ b/hw/arm/digic_boards.c
> @@ -80,7 +80,7 @@ static void digic4_board_init(MachineState *machine, DigicBoard *board)
>   static void digic_load_rom(DigicState *s, hwaddr addr,
>                              hwaddr max_size, const char *filename)
>   {
> -    target_long rom_size;
> +    ssize_t rom_size;
>   
>       if (qtest_enabled()) {
>           /* qtest runs no code so don't attempt a ROM load which

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

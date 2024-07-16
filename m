Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp292733njk;
        Tue, 16 Jul 2024 09:33:32 -0700 (PDT)
X-Received: by 2002:a17:902:d50f:b0:1fb:82f5:6641 with SMTP id d9443c01a7336-1fc3cb38ae9mr25803225ad.23.1721147612436;
        Tue, 16 Jul 2024 09:33:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721147612; cv=none;
        d=google.com; s=arc-20160816;
        b=W9aWZDBKmEoy6W7p5Osc5AtlFEYlsiRcBJPHN1IoYc7DcAJjDRMmOZtn/0qAnpMz+e
         eleXGaaTX/vstKlbOmUTInn+IdK9BRcPTP3j4apsEd8GMvtXjqXMXfFtbJq2D8GFJ5lT
         rVUnDtb7NjzzY0Yd9OPdkR/G0iDddn4KIdKu2DegOxxkd8fGQRf4iEFMypCgLlzpUD+U
         t1edOtDrj1ENLJ+zIhnWy6BpoVnYDOG6EHPGDXiTeUG5OHic02mP3saPqrOZNqeNE7nV
         Mawv9U+FujRbgilqYKnOzZVKDQdCvxEsUQVQIF2t2+8ML+E5aTXIJI5YkxSw2KlTr/XO
         /hKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=eOCvtxuPXKdYoz3fnUC4P2Hs6TFctPbMipLplPpaSLQ=;
        fh=hTv6v/+2DUmtc6nEPkZj4jA/rDabcmZH8rGbaIRcLD0=;
        b=GJt43b8yWGEuBEujek6c+cPsk3FNOMjt+TlVX2CC5FH69aiX7VkHGKDkwuca5nzp9Z
         74bE0JYv7Fem7xGmngJ7xIE72AUFq+Rx0gb3jYH7dsOkKRtI4Bbfggb3EfdbGQ/EMTwz
         2NjKUXiIsHFT2XB7Mmg6/UmkpjQ+McXeqUsGD7d6nLkIhuuO2E3fyGK8Vwe+WGJQReX3
         B+R59+Ux7i6vfgXNkbhhyMTtqSAz7cnmuKb+R62eDKVfOBrsuuXD20rntmEfRXp8Najs
         J9ExYHLIzHqJs26hzFwg42SzzMZdcZpoLd5nko0QCCagxBIC0Xf/F5pm4gUPGoZ3UFvT
         CvjA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cu3Ciyhu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-1fc0bc71c53sor28105435ad.13.2024.07.16.09.33.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Jul 2024 09:33:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cu3Ciyhu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721147612; x=1721752412; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eOCvtxuPXKdYoz3fnUC4P2Hs6TFctPbMipLplPpaSLQ=;
        b=Cu3CiyhuHxx5Pqmj5sk1UCGIogRwgRa6zoxnWO6xpgStDLpl8UgFzytHfbuqXwY1/I
         LT+xVsGZ7OigLCCtjMwG9qCogn+n4rmsaeH98Ug6NGx/z40k9tYJc2Mad8mUcm3l6olk
         T6Nxgdm5+iPiimtoaLbsJCnWR4nCKwLpdEcvuRR55kVWsB/8Z86c1EidLlxMzJi9IcXE
         K84KO/Mf7YEHKixdI2thcFXMatjdlUVE7j3doyME5JQu6PEzQ0UJC/r11mg8wewe/nxV
         j0hW+ylbDaWflH9zaqKjzhEimOkiUh48yV/tYDFhzi8cSIzApvDLLsrg2VjpGsN1qi7r
         rENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721147612; x=1721752412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eOCvtxuPXKdYoz3fnUC4P2Hs6TFctPbMipLplPpaSLQ=;
        b=AzNyrC11N2xclpDDhYCbLHv4QbK6a3ISXheLjcmpIhdug0g330RSBH9Gsgv1xJueyL
         AlcRZkZC4Q8xF3XjAqHuvzVL1174SpARpsHVd8oOzOFRsf9vTSwxYOg9sH13Osid9wjX
         cSTZZ/GnCT5ryjPnEmnL+rtQwY2LL0OA/FpezplaOYJMEP6RSWe4Vazd3zd/lWEzCLm/
         MTz810Vvjwa8O3ZrLCqaA55EJNHrky1QKO795CpYknDjatyrZTwF2W4re4zww0iTSFmz
         Z8Ai6nohnHuexIWGoc/HI7QfqOuIz+tXYrr8xGqqx/0wx2gu752hQieB7CbaFOZzBtDb
         utmw==
X-Gm-Message-State: AOJu0Yw13JYUH3KoemUp6WahiFgXeb6jSVNFLej/qe7WqeZ1iqLoHzsm
	GYSAGApQHFOCSagwZ65VzILsP3sZw2y3rmh/S7ibpyFgN6AGXP6x5G5XCxtlcjN1yDcLpgDDafK
	oME2e/O7j
X-Google-Smtp-Source: AGHT+IF+0qh8p2s3SUeCIwwOsDAb0LZM/jwQexX/uhOvSO+ZeQSMq8VE5gUQh5jnGQd1wkMz7ifLEw==
X-Received: by 2002:a17:903:1c5:b0:1fb:7c7f:6458 with SMTP id d9443c01a7336-1fc3cb5bcc4mr26876785ad.32.1721147611654;
        Tue, 16 Jul 2024 09:33:31 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.113] ([203.56.128.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bbc68absm60085245ad.118.2024.07.16.09.33.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 09:33:31 -0700 (PDT)
Message-ID: <b9b178fc-04f5-49a6-992a-f6920408b41f@linaro.org>
Date: Wed, 17 Jul 2024 02:33:23 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] gdbstub: Re-factor gdb command extensions
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
 Gustavo Bueno Romero <gustavo.romero@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20240716114229.329355-1-alex.bennee@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240716114229.329355-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 9EVp1AEUTgKQ

On 7/16/24 21:42, Alex Bennée wrote:
>   void gdb_extend_qsupported_features(char *qsupported_features)
>   {
> -    /*
> -     * We don't support different sets of CPU gdb features on different CPUs yet
> -     * so assert the feature strings are the same on all CPUs, or is set only
> -     * once (1 CPU).
> -     */
> -    g_assert(extended_qsupported_features == NULL ||
> -             g_strcmp0(extended_qsupported_features, qsupported_features) == 0);
> -
> -    extended_qsupported_features = qsupported_features;
> +    if (!extended_qsupported_features) {
> +        extended_qsupported_features = g_strdup(qsupported_features);
> +    } else if (!g_strrstr(extended_qsupported_features, qsupported_features)) {

Did you really need the last instance of the substring?

I'll note that g_strrstr is quite simplistic, whereas strstr has a much more scalable 
algorithm.


> +        char *old = extended_qsupported_features;
> +        extended_qsupported_features = g_strdup_printf("%s%s", old, qsupported_features);

Right tool for the right job, please: g_strconcat().

That said, did you *really* want to concatenate now, and have to search through the 
middle, as opposed to storing N strings separately?  You could defer the concat until the 
actual negotiation with gdb.  That would reduce strstr above to a loop over strcmp.

> +    for (int i = 0; i < extensions->len; i++) {
> +        gpointer entry = g_ptr_array_index(extensions, i);
> +        if (!g_ptr_array_find(table, entry, NULL)) {
> +            g_ptr_array_add(table, entry);

Are you expecting the same GdbCmdParseEntry object to be registered multiple times?  Can 
we fix that at a higher level?


r~

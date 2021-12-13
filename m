Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4083696lfk;
        Mon, 13 Dec 2021 05:00:25 -0800 (PST)
X-Received: by 2002:a5d:6d8a:: with SMTP id l10mr11186426wrs.157.1639400425620;
        Mon, 13 Dec 2021 05:00:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639400425; cv=none;
        d=google.com; s=arc-20160816;
        b=rTbh0+E+UA/63CJYZoXw8hldP9BomyJf64RYkAL2DgJrP86cpbOEKJuQV7L5hj1cpC
         TxEAcK1DIAeX8qtnNacv66kd3kPS20UJg5gSp/tJj4222MXsM689RssT3cujRP6oygTa
         G+LJw8FZUQ6knQg1lDio1hLksRlLVlVGiQ0yLslV7Kz7xR+Bn+JnDdxfF5kEbX3GtFbi
         +FhH5sY3//H32NAt2B+f8R8RntkhXsibRHfVHjYJ22yyVVxfuOqmOhkMfORZL8JWIfhE
         Ui0606bdasXbdjP8h+re2dwio9764WC5uaDXSb6s59+TFdZptb3qEd68kqGdZu9CVK1D
         6/kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=QRsEWIMBpAFPuvFlO4/xubTig9kMptMut+zvRDO+d3g=;
        b=xohdk1723t47W+cAOh6ocR4Rgc++t32XGN4aTj758NNOcXJL6WBD2R3Z0cyoDHpd0H
         pHrIbLsQN4egF1IZRCi0qtd7E1lawqfZ5q46GdyduadvnUqSQzdek6SK9A3rBWHVAkIg
         vSnoUj9LHTyiC19SAHI0XC84I3D25g3lyMZXrjUK7E7f+5WGl4Bhklf4U3X8ZvlBbh1p
         j9orN4Bz1vJqU7oG1RASoq3/1hL7PKjCNxBK47uJ13tm/t/VdWCiw2xWTdG/cjCiF2zG
         uQvnVA0RuYifW7jRiHr04moXh4DT1OlMfjrsdvuNz4ehWy10zT6jD3injX83J+XBUtMh
         saXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=dPsHmAuD;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p41sor3134138wms.10.2021.12.13.05.00.25
        (Google Transport Security);
        Mon, 13 Dec 2021 05:00:25 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=dPsHmAuD;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QRsEWIMBpAFPuvFlO4/xubTig9kMptMut+zvRDO+d3g=;
        b=dPsHmAuD9DRC6sTK8PkkPu4C+mqEn3bioQOFxFhj67TqvWnVCmKLQ6/Cv6NKozAgYB
         5XQcOrsBuVuIw3dXbzvQlnsmC4pc3j3KKZJdNnR9j1PpUPR9l0g4pxaBZdUkraSf8P7e
         WQwQ4ScpyD9GSXvukUCkbpaZM+fp92X/SvEvOLZM9TeCsJyJQClfx6s2mGUaX86M0KTY
         iTvDQJmDubUSX62AIkF4tzs+feqnnAu6J/YyBwgw8aLoJdEEzODoZJ8GMUj5ARmezro7
         Y1ZYoVbFq7IicLPHo3NG4bEsMgFiNjOeAaFbWYr8o4ZGboKtmKXIVMIcP6nHJgnx9liB
         4JxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QRsEWIMBpAFPuvFlO4/xubTig9kMptMut+zvRDO+d3g=;
        b=BeCXL7h+o7KGMXWseW0c9q3kU1dPdodxQjUU/6WkrSqZNLywUvlsTR4X/qpNYHRAYY
         fUUk9ou7bwJUVS0KaXKdB5L0YyQdP1544hQvT9dkJLp36K6792PiQ/fymIgAnAdDm3yF
         nGfFwAPw60GHGqnui7ZLTvZxMPk4DGaFp9b9o6vxK2fcz/YiAhipGrnwN4eZXkI1dpjT
         YTOAwT/a3LQMwdHJF4nab6pUvM5RxcKAUsGle5nTg9zojS1rE/rlZYC4ae8VChhtXDsv
         KMDDytPQIwhHHM8u+HMXh0CNk1Gs/OZQvvpjt0HckErmyOsf/2UQGgRR6kOvYp1nW++w
         GRHQ==
X-Gm-Message-State: AOAM531vPKm4GwIL9WURcSXYRgenTd+Pqv3hHjidlyH6CKqiVNYjQxhG
	XuWpGrp0Pe/hQqlGBPnZ+DyWCb0NTQGchA==
X-Google-Smtp-Source: ABdhPJw1R887o8jn1uzVwq3ZfC5H410sDmC2uN42POTO3T6EJw0ql2BRrBxOVpiKDBPR88DoAtSLsQ==
X-Received: by 2002:a1c:8015:: with SMTP id b21mr36851410wmd.161.1639400425028;
        Mon, 13 Dec 2021 05:00:25 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net. [188.86.27.180])
        by smtp.gmail.com with ESMTPSA id p5sm11630787wrd.13.2021.12.13.05.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 05:00:24 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <1e18eba2-258d-4b4f-3ab4-99180c2a1659@amsat.org>
Date: Mon, 13 Dec 2021 14:00:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 16/26] hw/intc/arm_gicv3_its: Fix event ID bounds checks
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-17-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211211191135.1764649-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OSkAkOpdEMoO

On 12/11/21 20:11, Peter Maydell wrote:
> In process_its_cmd() and process_mapti() we must check the
> event ID against a limit defined by the size field in the DTE,
> which specifies the number of ID bits minus one. Convert
> this code to our num_foo convention, fixing the off-by-one error.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

> @@ -299,10 +299,10 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
>                        dte_valid ? "valid" : "invalid",
>                        ite_valid ? "valid" : "invalid",
>                        cte_valid ? "valid" : "invalid");
> -    } else if (eventid > max_eventid) {
> +    } else if (eventid >= num_eventids) {
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "%s: invalid command attributes: eventid %d > %d\n",

">=" in format.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> -                      __func__, eventid, max_eventid);
> +                      __func__, eventid, num_eventids);

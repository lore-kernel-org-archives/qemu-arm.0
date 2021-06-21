Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp2343675lfg;
        Mon, 21 Jun 2021 12:00:25 -0700 (PDT)
X-Received: by 2002:adf:fd12:: with SMTP id e18mr27258102wrr.242.1624302025868;
        Mon, 21 Jun 2021 12:00:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624302025; cv=none;
        d=google.com; s=arc-20160816;
        b=PezcFs5APh5/ek3BQL4bCD1blCaYGFUkHb+nYWzEQL0ukTwEqP6Xbc87NXRalr2uij
         ySw3U8/HKRYg0PKH3aBXMlP4HpsvhseTtfPjZ8cF8BKfRfGrDgo4qXdsIYh6om2X7w70
         ij8iUVTmKqRRA8PPi2UZPGT3R2t3PR3PTVvLWZgYkW+Ae6rLNDRjQEmSmNs9J8e8+4MC
         Fe9dRmEyD7uEKhcjqPirXlIuhoAEZksYm0uJPEuDZMGjjevip0FxwKrl6ZnZEtfltX2B
         /nZTyTkjkPDYgO8dbfMYDrUHmoMor1ywqt8ZprcuWEl33OjEf51hNkOZGw2ERSaTLRVJ
         JKwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=mp/7C6gJIlopFlSsUOSBSkCJRTI2SFidp+JXyaaIBpg=;
        b=rgScOgh3lpCHfq6FO2i0T913Y1SMfq0VtJ1RskM2w+aEJOwE5OLCCIGLnXfNWp2lsp
         a/5qtJwWmoPDy+nJji9sGbQKRnR8T96TuoVKYHM+JAAVwZiB89ZJ/GETAm7gx0tLHLrW
         I5MkFBJ1yM6sFiCBVK2fwWJqQehKY0idpUqA/49B5W09Z/t4S8IZ5vRta0psw0cM6Zxx
         r5Cb7Qc5wpP+YoASqCjFYg8P+5ixmG8CDI5CNLt/frUS6ULO6gR9xuqaoXb8HOUbeLKn
         tJ4OK/vcjGOMsM51VHte1nOutQRuhk9uyqaEFLBX6e73z8SLD31g6L3VjT/liqcN1607
         WfNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=BHDr5Svs;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c11sor9208787wmr.19.2021.06.21.12.00.25
        (Google Transport Security);
        Mon, 21 Jun 2021 12:00:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=BHDr5Svs;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mp/7C6gJIlopFlSsUOSBSkCJRTI2SFidp+JXyaaIBpg=;
        b=BHDr5SvsnP2u5I06nhbe0xclw2OOR45sxetBq0z0Kj9OYcjYMykBrzp6LJjufRb90I
         M8N/xXZWcbghRgQyNENvHg/W11ekR8kGVJG/chnlXy7Ng60YLo8aZoRI9jRmToKjXEIq
         VkBqIGx7uqt79HHWmBKpVk22vfWzeFhU5yj3+/Q4VsD0JArflWwfRUaWorH5Onq9Uz/S
         muL38LNmXPIkgzESligbUDauUSlcM7YboQFdEBcW+ooU6ZYXPKlET5ra+wEB/GxacOFS
         mXyEDjaOquQX8TMTDk1oZ+Qmla1qox2TaIZo41UUJe01vYzJo4vpktNXoxbpsSUNt3EI
         UkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mp/7C6gJIlopFlSsUOSBSkCJRTI2SFidp+JXyaaIBpg=;
        b=ADn1ZMVnIL438Rrsf0Nfrrs7+UX91o01LdjPR7P0Qbf9x/XIUTt+0XIuOVdWNIhZzQ
         abZnnAqZdVguMaQDJym/thnflzTdQ1CeUODNakAXg0iexIhzXnPBiovOKBrvxnHF9omH
         azwURTfRay9BSoaqsNQE+hct78Fya6o5lib4aApTx3t9ap8FhoHSouRaZIwfsagsNK8r
         U7u34+/71KdbtBkwbCLIaOBcpoJKTWhZqOKsGdAEzt6FSV980p/tfc1T6iojOOE7OOeb
         giG0EMeDlSlG2zXPyedABvuJdISg1+TCVegMZHE30YQFJjp7V2XxaytA2caKMhpK0Khg
         /xvQ==
X-Gm-Message-State: AOAM531pmTEUQ5xkLE1p2cDABAIu08/3WBv3aLnwMlY0HEdL9Jq9PfOm
	ecfzyN/CrBaXfo+nTj+FUcs=
X-Google-Smtp-Source: ABdhPJwdNPsGg3SKZXcHdV7lbAykCfDR7E0ZxVzxFGzeAZkvXtdDJIDZEbvGGRQS2TIcmFA/aYDmhA==
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr29069758wmb.142.1624302025642;
        Mon, 21 Jun 2021 12:00:25 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
        by smtp.gmail.com with ESMTPSA id b9sm2358223wrt.55.2021.06.21.12.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 12:00:24 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v1 2/5] hw/arm: add dependency on OR_IRQ for XLNX_VERSAL
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, thuth@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, pbonzini@redhat.com
References: <20210621152120.4465-1-alex.bennee@linaro.org>
 <20210621152120.4465-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d6012d09-a9c9-d7f2-9640-80f368a48ec0@amsat.org>
Date: Mon, 21 Jun 2021 21:00:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210621152120.4465-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: /9n9vOh3pzMT

On 6/21/21 5:21 PM, Alex Bennée wrote:
> We need this functionality due to:
> 
>     /* XRAM IRQs get ORed into a single line.  */
>     object_initialize_child(OBJECT(s), "xram-irq-orgate",
>                             &s->lpd.xram.irq_orgate, TYPE_OR_IRQ);
> 

Fixes: a55b441b2ca ("hw/arm: versal: Add support for the XRAMs")

> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

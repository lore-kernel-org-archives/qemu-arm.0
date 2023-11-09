Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp820570ejq;
        Thu, 9 Nov 2023 15:24:22 -0800 (PST)
X-Received: by 2002:a05:6808:1a0a:b0:3b5:66af:f8d6 with SMTP id bk10-20020a0568081a0a00b003b566aff8d6mr4056823oib.47.1699572262549;
        Thu, 09 Nov 2023 15:24:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699572262; cv=none;
        d=google.com; s=arc-20160816;
        b=V4Xj+JT0W+bny4QyQQYCwWlHxE+1cMgin35lom+Sw1ANJ5qXaWbeZGWj4TUjcw84aX
         NJYfu5mdMMSO7FFStPI/x5f3BaiY9v0wdO4MXRyQU0J8E4s8opy0dSA4mY7vf1/M5hOW
         O5VGmn/0gXR8YAj8ynz1NUj3NhIoGWQsR8ja9xsmZmcagVhdpNpiuzAagk+oAVUD4+WK
         4KqL60c54aOSsmXlQ9uE3urB3wUrlVWzHmlmCX+kl2LAOtv+pEr627jG5lhGsyzN1V28
         oh29R1vezRyULuLuqstBQsiuPybjXqEu8CP3lS7hHy1SotNTczlQuuIWlrLn37nmFMoK
         OfSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=z0J/6DHP2X8a1wCtKJDIFetqab1BTX7su+f2YOz1nrc=;
        fh=2//BTKMtB/wRCpJ0oPiyq6NWRc4prSmDqz8j41Iy9Yc=;
        b=S43mIQ4ru9klAhSEgJ8jrfPGIy0yc1t1amDA35yMWIJtmoRNrYldi0p4KpBnPPGyKs
         D9utpwZG87QzKpEO2HW33CsL4J9gZqhXZocpz2UpwcaLJJA7ycHyQF55pd28W3JyQbsg
         xg9ef5wF9TrutFSxNarIXoctjbp8Q78+8Rn7NiNkZComd66Jzl6DiXSW8MnCW2EInutJ
         GKPU6LlLX33WDqq0qz1Ge1RFuqZyy2cQNbdg2QH8uE1CEcg+CKhke9nPNL3Fpcw4uSdi
         wwKl7Pbf4hfoRah18om1N6qMP8mbxDNgXbOdrBJgWo12N+TNWgEJOZWxRw/1DvivEhD2
         /oFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ToPk8YDI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bi8-20020a056a00310800b006c041f1f70dsor7046365pfb.12.2023.11.09.15.24.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Nov 2023 15:24:22 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ToPk8YDI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699572262; x=1700177062; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z0J/6DHP2X8a1wCtKJDIFetqab1BTX7su+f2YOz1nrc=;
        b=ToPk8YDIr+l+7f9XTRP3oInuKSQIO0px6kldE0x6aJZY50Uj0Uue7UtLCin8FlkVjW
         rQ99bXrDQFxvd8GHMxXOcgE4ul2fjhl+jWX411GKrInw9D5Y3/CYfv1vNZqDeGX2bzJr
         Q18RtKssKVxwuTGaO2m/ijGTpOjWSKssAVBatwl8JhmjvabsyobA55YNeTS0TGRUkOeN
         QYplbdOSagGrQhpLMr2FzHtz6/64H1gUC/6Abq/WFNj2a95jzIXnn51zQc4CrBwt6gQd
         ng1c4ZVF9TILvR0NlWW/1qbEfTizvH4Re7CmQPJ/XBrmOJjviIYWd1We0MV7pZAWbVp5
         dIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699572262; x=1700177062;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z0J/6DHP2X8a1wCtKJDIFetqab1BTX7su+f2YOz1nrc=;
        b=rXF4j/knACTVEKcFWsXTmknQ/urEePFwM+2QOMmVLI5hoHC6+mHOFdf9U+vbti3FFs
         ytopF9f6rfwGJsOzKDmoaSEovWbKrjrL00OCAqalDKzAMVps9z25ew0GMq3DGej1Nn5O
         qC7nZVaxXoOd11cRrAScsVicTSmrU+l+1+MZI8IM/rNeGJzO8EeW2+1gCkKWYzohdSTH
         3t1eS91irhszv2HOdFAg6/6obiR0Wg6FT7zquOocXoiqdWQL/qQe0zuTlqQjCZpcPpyG
         cHek3LQWGEy8rx+fYLzAniBgX6GNdbD/qtfFbqNEq7eUS4wu+VzZL9VsE0LdqsDD8KoU
         EOIQ==
X-Gm-Message-State: AOJu0YyJcKKQE4qv5LsiEB39Hf9Yhsgt+pJ0Fcwb7Llk4WPLoQh8UM1P
	WYPfI1MfjRMTlJ+9WReTN/qbGiot
X-Google-Smtp-Source: AGHT+IE7G4uZmkjJPFeELy9K52AKxjbJ6slSAa4SrJTsTOeystgUWLk79O/YZ9Yt4/rN7ApQoEvQQQ==
X-Received: by 2002:a05:6a00:1a8b:b0:68e:46d2:e331 with SMTP id e11-20020a056a001a8b00b0068e46d2e331mr6115120pfv.23.1699572261936;
        Thu, 09 Nov 2023 15:24:21 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2607:fb91:1ee6:29b:6626:64c4:1b48:c565? ([2607:fb91:1ee6:29b:6626:64c4:1b48:c565])
        by smtp.gmail.com with ESMTPSA id t8-20020a056a00138800b0068be4ce33easm11584419pfg.96.2023.11.09.15.24.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 15:24:21 -0800 (PST)
Message-ID: <45ef60fe-dcb6-461d-97e1-d19e5174075d@linaro.org>
Date: Thu, 9 Nov 2023 15:24:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-8.2 v4 09/10] hw/char/pl011: Add transmit FIFO to
 PL011State
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org,
 Juan Quintela <quintela@redhat.com>
References: <20231109192814.95977-1-philmd@linaro.org>
 <20231109192814.95977-10-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231109192814.95977-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: qUy+VTFb2fP3

On 11/9/23 11:28, Philippe Mathieu-Daudé wrote:
> @@ -436,6 +438,24 @@ static const VMStateDescription vmstate_pl011_clock = {
>       }
>   };
>   
> +static bool pl011_xmit_fifo_state_needed(void *opaque)
> +{
> +    PL011State* s = opaque;
> +
> +    return !fifo8_is_empty(&s->xmit_fifo);
> +}
> +
> +static const VMStateDescription vmstate_pl011_xmit_fifo = {
> +    .name = "pl011/xmit_fifo",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = pl011_xmit_fifo_state_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_FIFO8(xmit_fifo, PL011State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>   static int pl011_post_load(void *opaque, int version_id)
>   {
>       PL011State* s = opaque;
> @@ -487,7 +507,11 @@ static const VMStateDescription vmstate_pl011 = {
>       .subsections = (const VMStateDescription * []) {
>           &vmstate_pl011_clock,
>           NULL
> -    }
> +    },
> +    .subsections = (const VMStateDescription * []) {
> +        &vmstate_pl011_xmit_fifo,
> +        NULL
> +    },
>   };

It just occurred to me that you may need a vmstate_pl011 pre_load() to empty the FIFO, 
which will then be filled if and only if the saved vmstate_pl011_xmit_fifo subsection is 
present.

Juan, have I got this correct about how migration would or should handle a missing subsection?


r~

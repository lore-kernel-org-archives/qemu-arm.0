Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp48830lff;
        Wed, 11 Dec 2019 18:29:11 -0800 (PST)
X-Received: by 2002:a63:5062:: with SMTP id q34mr7838398pgl.378.1576117751689;
        Wed, 11 Dec 2019 18:29:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576117751; cv=none;
        d=google.com; s=arc-20160816;
        b=sGfBJkPHZEtI7n4dgJ6h+1XYAy8KEUxkeSkbmqGTMM4Ou7sdrJpAzsbK7MyrNs++9h
         AX3FSZ+EFXWAQDTPPfVd7I4lBW6SKxm+weK4aJ925LLOe0GDeI9Rhe0I8e5yyxbUn+eJ
         jLhxAJsEc8TXDDljAzQb0eMAjuVWKACxP93g0OzyGzbf81QbVCfzYKLO4nhZOKddOdXe
         e9jxRqh1oGsQm09+b9oMMYHb90n88hp3gCWxbrBvIhH+0ffYtA9U7aaRt7g+W8bgPj1N
         a3Pn7PSNQIJwdpAcla8TH50TG0NVJ/LCX+hUpDJfb4nPTwOus1hN53UaVoRnO2h5uuUO
         J1ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=dnSs02hUKWgYOXF+wicFs/wEm5XHaRR03CSW1fVdNiY=;
        b=J+ASewxcaq4goCNISJNe5jBm7ULTwCz0JUaDDn6gBlMbocz7XmMrzKFHKtgHraw3YG
         66VH9c7snpSfpx8jTO3gsKJRvyLwkjicxEGsWuZktX2sMKcy5bW+DqXtiXXKrTZSXS4N
         +MU3nX1K4CFh9plNXbSu4YVQmOhJUPeb1O2zDAbyBWczutZvoOLNAs6oWl8GkGeMTDer
         dDDJrb9YZ/l17cfGElT2xnqi4AruXVcLxWFQYSAOLpzyWhRygYmH2j5YvMPq7ANFVGUD
         +hqfkmMn33iGfFecNrkTmapceRvIyA/WjJ6yipo0JiIiI5xrLxtqeFntzXGIihMSDDin
         dcSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LuxnKsYV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x9sor4564531plv.66.2019.12.11.18.29.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Dec 2019 18:29:11 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LuxnKsYV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dnSs02hUKWgYOXF+wicFs/wEm5XHaRR03CSW1fVdNiY=;
        b=LuxnKsYV2P5jw3pWhC4NqH4SbsEWMDd423hp+nxFYkWo4Nej8Twbhm5a8L3IU+Y/ux
         0dZCuIl7GmeLYBWt/NHe8hjC2YYt/ibogZfwz8+QSxVSuTj92NAfX62Et4lHAax/v1oN
         wrWO72GBJmzc1ZuQ/iT67LVSCE8gY82aDeqG9/UH0J3sdwjYusRmt8fZ1C6AqVeklo3c
         obxAx7E/vwtsmizQc7PitJDbDkJgjpQ6UDhUvC+z+eFSQ9NJPzE/GPVfJ3XjxlLuJMKR
         Tzdw7EO8DVtVCMp6pwkhI7qMDypNEZnqPCCt/0x+IJIO2szSvqQE8XtjlSZy1ZxxCJk1
         zddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dnSs02hUKWgYOXF+wicFs/wEm5XHaRR03CSW1fVdNiY=;
        b=bdqcOkcoHzmX1SWxyJy1lYrKdqcfkRcfpzuqTnYz8JD3Qmne+r6pHhe5piWcdb2+tP
         +H1Q5V4p0XguQOHZaXVuItNy3d6mWSm+UcEegCsCvo2wXMbQNswlZBpYLHNqXAJMCrMg
         Z4B1C8Ax/m/ZgwhAL5wMu7zmqxAKnnaGpEk1SyXuqnsGsKNujQlqZSkH7GkyEDY2SHO7
         TJ4FKOlN9fTAP2WoW5ubVUPdOeMahfGMFdAS9RkT+NGslKqUs7ZEQttudb4NhS+kCtG2
         vk6aD9GdBBkrK9v/wo2fcGdAtJouWVxL9UNrdswuzPKpWxUjp2vAWFyGHdouL4gfk6AZ
         aMNg==
X-Gm-Message-State: APjAAAWxEgIaPx+NEFOvrZHEyhvP644ljVVxSwYhbwz1bVlgXsN+8OkF
	JX2fmfwItiJQMesgItzNgnz19VGf
X-Google-Smtp-Source: APXvYqwujqZ69gHWsNo4ORP98IGcjIhEFx7KOpNlkYeIETtq2doROUzqX2vhdew6XoMaU9NXa1BjoA==
X-Received: by 2002:a17:902:ac97:: with SMTP id h23mr7050556plr.237.1576117751180;
        Wed, 11 Dec 2019 18:29:11 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id z14sm2677828pfg.57.2019.12.11.18.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 18:29:10 -0800 (PST)
Subject: Re: [PATCH v3 14/20] target/arm: don't bother with id_aa64pfr0_read
 for USER_ONLY
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: alan.hayward@arm.com, luis.machado@linaro.org,
 damien.hedde@greensocs.com, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20191211170520.7747-1-alex.bennee@linaro.org>
 <20191211170520.7747-15-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c6de7384-0e22-c03c-1a02-ad288d3f7eec@linaro.org>
Date: Wed, 11 Dec 2019 18:29:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191211170520.7747-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: eLk0EJwna9+n

On 12/11/19 9:05 AM, Alex Bennée wrote:
> For system emulation we need to check the state of the GIC before we
> report the value. However this isn't relevant to exporting of the
> value to linux-user and indeed breaks the exported value as set by
> modify_arm_cp_regs.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - extend the ifdef and make type CONST with no accessfn
> ---
>  target/arm/helper.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

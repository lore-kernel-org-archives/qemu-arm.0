Received: by 10.223.183.22 with SMTP id l22csp2591997wre;
        Thu, 17 Aug 2017 13:05:16 -0700 (PDT)
X-Received: by 10.99.97.131 with SMTP id v125mr4231507pgb.339.1503000316711;
        Thu, 17 Aug 2017 13:05:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503000316; cv=none;
        d=google.com; s=arc-20160816;
        b=nNs6jCdK+g8WoBZWg3hoeR7gLq5cA4KwBmKN11awMNx4YXICs4FzybORT7W+9j/dXA
         XU0fA2LFMsN23FRTiqVl+DnOcX9S8xUSsgTWpwoqYt8vnB2grXkgMEwQf222FRVTK8/b
         zVZwD2A/oO7w5hJ0uC0LdB/r56tLjLuNI7fxgMHhaXTPQpHGn/X3ihekmSyZwjHME8BG
         hMrkWWrHRGiPKTIKxkRnbBwHuq+6+Z3qA0I+XHYaWsTPGPSBYlMtV19QwfBqn0ajv/xi
         FMbjfyjhgW42ayoqyM9ZuV1KirHAV4DUQIqV1uj14QqynWTnhlrkrk65NhX+OkozfKFV
         Yu1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=DPZSeqQv3K+AIxQ1eDE3tv8uAO+Lf5Y9wSOW9AqdbIM=;
        b=G41I4o7PIy/gIN4WhY2SqQo5LNuZ6Mi6lEvSaOgytsCkHcFXyA4r5HNhz1zxjoanVu
         tpi8vw/KyC/wSeVoZ6bfJCFax9tYMZvvZzbdVns44W5o0rywpf3EeaCxYQC8RX5+34zA
         wCzpU3Sx9aBg/qXWgJsvsP0q7af74mntwEuvTyR/hAJr47/bI83UfMnTrl5nExsrQLnB
         MsN5KqlVXczCGvp00vKUPoa0LjrZSzduEZ/OstmXd3FnxWCDr2PTaDlAi80JDSEClEoJ
         7yvYQtrqRjMu84mnL1zOnq3e/njrAbc6QQMr1tF9gUTgHzyMVWDt5J3R2RDxu4QIN2Ma
         Pl/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fcJqZzNM;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::235 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-pg0-x235.google.com (mail-pg0-x235.google.com. [2607:f8b0:400e:c05::235])
        by mx.google.com with ESMTPS id l14si1514198plk.441.2017.08.17.13.05.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 13:05:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::235 as permitted sender) client-ip=2607:f8b0:400e:c05::235;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fcJqZzNM;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::235 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-pg0-x235.google.com with SMTP id t80so21965600pgb.5
        for <alex.bennee@linaro.org>; Thu, 17 Aug 2017 13:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DPZSeqQv3K+AIxQ1eDE3tv8uAO+Lf5Y9wSOW9AqdbIM=;
        b=fcJqZzNMbd7+AmUmuCwbTcZh79dK1T5/9/Kmfq87FrrA5znocIG8ZV/znozfJ3dwGY
         oeRkhWf5uDg8s/PypdFOOGnxxXI8eHLAZ/5U8WpRl5K2mB1UkXOrSl3gDWSOpjSD+Gzq
         tjnJ7QvPLt8gHFzhERi0TSVinZQPMWTsOqE20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DPZSeqQv3K+AIxQ1eDE3tv8uAO+Lf5Y9wSOW9AqdbIM=;
        b=o+RahtU0gVCGlDLsp1yQQ2eotlr4NStR/OBQ7/auAb9UIxsoq4izW/QLcKfgZ1PQpF
         XiIecy1aHx5FyttndzAlKrOQ5XxzkHQTywdTdFXRzfUvA6dFU3heIICOTzuUut5fqp4f
         vLt4TwlMPczcDVGDRzk3pPcsMnhJ4ihFIng+2nfKC1I2eVCdOjQvwewV6TrayZYkyjhe
         fg4o0LlY0JAOVxmgPnAIKAGKfP/yLRak53owyBRvNPTCfgaSxmSTb+ZNFo/jPyh6gDxv
         scMZ5p5rCSlz9qecYF1opCsoCjegzg4RZAXmj2tAPjdAiARxPqE0Qclgr74ZUKhwpMl4
         DnDg==
X-Gm-Message-State: AHYfb5jXxaLtmP17XVpRLMeGtmvWpPbwdU9ZUcP25foelEpaYiRD+fS0
	VhsigrChGJiaGvpW3Gs1DihA
X-Received: by 10.101.70.137 with SMTP id h9mr6088734pgr.50.1503000316147;
        Thu, 17 Aug 2017 13:05:16 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net. [97.126.108.236])
        by smtp.gmail.com with ESMTPSA id s11sm6717399pgr.53.2017.08.17.13.05.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 13:05:14 -0700 (PDT)
Subject: Re: [Qemu-devel] [RFC PATCH 1/9] tcg/README: listify the TCG types.
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, rth@twiddle.net,
 cota@braap.org, batuzovk@ispras.ru
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20170817180404.29334-1-alex.bennee@linaro.org>
 <20170817180404.29334-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6a15c518-1091-cac7-77b6-b833efd745c6@linaro.org>
Date: Thu, 17 Aug 2017 13:05:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170817180404.29334-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: HHqiokAgxQby

On 08/17/2017 11:03 AM, Alex Bennée wrote:
> Although the other types are aliases lets make it clear what TCG types
> are available.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tcg/README | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

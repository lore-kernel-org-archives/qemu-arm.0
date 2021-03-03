Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5763349lfg;
        Wed, 3 Mar 2021 15:28:06 -0800 (PST)
X-Received: by 2002:a17:90a:a596:: with SMTP id b22mr1489070pjq.33.1614814085863;
        Wed, 03 Mar 2021 15:28:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614814085; cv=none;
        d=google.com; s=arc-20160816;
        b=I1rAdhii1rDuPX4yLC1rtB2/3+FEhp+EN2tExeV29A4pfNuxqR6zZqwVtFPXdjLMCL
         6qLmgVWQ7Xa8RXiCWT2XS19Z30UYyp/+yXzFg2FESA3MIAzUjRG1iTobLl5aPWCD9iUa
         0DvFLxWcxY9VL7DkcqQzEPYEM3iVeURlFEp2rG3xwCY9OU76lxl4jwNDD7jZaUnCva4x
         dHruaO9KckfKn2GtoQNhCJkSUfFmuUEJe0Pk38Br7OuqOZNvbhYNYrSZboznYTkyK1yr
         uF70J/jxRmQDUNPU2EpteYSVCBCgdJr6FGScyeoWDhnNdMQhwqQWhyCOoNWtzH8l4uno
         LNvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=uVQsEAmObcnjtmp/elOxHKbY995sbL0GGGA19ieph48=;
        b=JsZEva9C3P+qHw/oi+KCICxj2T2VwvxCIoUIl9wck2DqpY/Wj81+E7U7F+UiKu1WkZ
         WS6eYL1TSe0RY9QhHPFnGUgG1H8tcZhZjL591EQFsviJ6jYt7hESbBw1tJjMjuf5VmIO
         fcCPBRHXy+TVld20K78aErINnDB8pcZCEKfKASOqYD0kgWsz6pkurmekLQkyLQhw4KU6
         ViY3b0FbmyrLNbR3pArrCBrHNMozaR0TW1aEuOlMZX+TACEpZzrUvMDKgXA6HFic6CzU
         VONbZ6uGTJIzBeNdHrZtY0GzjdhBOVXeoy5KktJe/FP9LSKOHzJx0rcKBhy3Mo6KCcOP
         kIqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OQO2zApK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j1sor4300196pji.11.2021.03.03.15.28.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 03 Mar 2021 15:28:05 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OQO2zApK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uVQsEAmObcnjtmp/elOxHKbY995sbL0GGGA19ieph48=;
        b=OQO2zApKrUXufENG9E9GIgMy+3LbsE8QcZ007TPRH0ksvCRdrO3uxi4G9OITbeC4v+
         eDOte9XoBkvdvvpYJ8B86nW2cSL9JiBNQBMpCa2Wb6QP6B2ZvJSIh6JAfOapN9lIgfkm
         eFBqs/thWQcUg2943eN+OgfWYwdqfJy0moPHWTkQUCCKvsskWzlguOLSdziBuHpp7Mo4
         LmQ4ys1/lc+8NjaslkWame9maxqJKYwPLeoBNao3AIg4QuQbVe5Dj97HVGcslQNQ0Vi9
         hDD55UMfC4Xy2vxoPJ0jblXnPMAg5uuyLYITLpDHpiVrjXRzf9OssewSx1qJUpyFco9l
         bL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uVQsEAmObcnjtmp/elOxHKbY995sbL0GGGA19ieph48=;
        b=uWS0/9FQWemqLxBTDXYaOq44ESrS7lS3bXslQBz8kFDzh3MTUrufs7dn/sQeVflPR3
         2m8K/nYYr2Dzi02Whht/GZ/sN77EMB3inPFAuLgPFanmsq+jcdFNLw8VrCLGHCOX1ePx
         U0gsMzp2TJYU9hGVWROK1pWpX1GNmmfDlTLiA8dOuJX2FStq/wlc57Og1tA2P8SIyuYE
         1dQUBk+YoufyoJC9+zKcrC1PVvVNagzFcEeymdLePFQO6drQtTHkCsUg77kWPYNkRxRv
         W2BQaIJc0VlbpOM60a8oc+0zK3EATaJXMO1VwBnW+HpU3mID9CWlL7krWbZEzkCTkLDr
         R2NQ==
X-Gm-Message-State: AOAM531TjJhRet8gt/lC/Po4bn4BYhgTvtCtZGYj1/BiTa0Ip2f87CZT
	MWTBP/r/98SE8RFnh4JjaZL2Fhq9
X-Google-Smtp-Source: ABdhPJwoHJpUHm5Ov8uJbtv5BtY/rg8FhpNgAdAMkdlhPB2UDD1e8Ot9kBejxkh3lm9kFXK4Ma2aCw==
X-Received: by 2002:a17:90a:df8a:: with SMTP id p10mr1532223pjv.4.1614814085328;
        Wed, 03 Mar 2021 15:28:05 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
        by smtp.gmail.com with ESMTPSA id t4sm7514039pjs.12.2021.03.03.15.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Mar 2021 15:28:04 -0800 (PST)
Subject: Re: [PATCH v4 26/28] cpu: Remove watchpoint stubs for user emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-s390x@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Cornelia Huck <cohuck@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20210303214708.1727801-1-f4bug@amsat.org>
 <20210303214708.1727801-27-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6add5036-318c-e97f-6e7a-90da64a4996a@linaro.org>
Date: Wed, 3 Mar 2021 15:28:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210303214708.1727801-27-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: GDyK8FoT/RvV

On 3/3/21 1:47 PM, Philippe Mathieu-Daudé wrote:
> Since we remove all access to the watchpoint methods from user-mode
> code, we can now remove them, as they are not used anymore.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/core/cpu.h | 34 +---------------------------------
>   1 file changed, 1 insertion(+), 33 deletions(-)

I do not think this is a good tradeoff, removing one central ifdef and 
substituting lots of others, scattered throughout target/.


r~

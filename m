Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1087726ejb;
        Fri, 15 Sep 2023 02:16:02 -0700 (PDT)
X-Received: by 2002:a05:6512:3255:b0:500:78ee:4cd7 with SMTP id c21-20020a056512325500b0050078ee4cd7mr1006897lfr.23.1694769361998;
        Fri, 15 Sep 2023 02:16:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694769361; cv=none;
        d=google.com; s=arc-20160816;
        b=wBoEj7q9JHYThz7brimYgqu4vTi4N5l855G953RsDzqIcJ8EcAPhA+O7HfQHKSwJTM
         mvfcnYNda+8LYqDaWSz2s5oke/Wp4lJUlRysYsB19nfHIbEtn/xEk3ErJJA9DuPmtIew
         5KPSw2UFmReCdFENWFB5BXJeAFePuUb6YqB42Yo80T7PNo0KulLL9iRqwICpG8FLxkZT
         BDlmD5/NwZNUWVdx+DaxGY3dr2opCuMZfsXTiZJ7bqHAU0tA2gLWkTEvAVB4TJRjhch2
         iunYd5dtltvCzLLCEK6slJrXJQYSsKxcLqZ43KJghEwlbK6Nx6efdonX0I8RJVRd2cjp
         vUhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tobk7HZZ2nYrp4ct5icjk2NTeyFuWk3+o1WLYBkX2hg=;
        fh=QoMr2x0W8pE8zLFD5+Y3aak7+/y1Ih7Fxnr9+k0RKnY=;
        b=R8Ai6Ww3yAs3pXD7FaFQY6oRdMi4wUUbd8Nz/FLLLgjBt5Z2trQI6PkYUB0Xl6SbuO
         NGXqCj9HY/22cWpxNNIjG71e3eWVM4axZcMyKhgcX3RSFmPhqGX+05lu8GTIFn3HxIBQ
         RnjutCrJgeAwLCft+X9t16zkTxKnKnKWNc4yC6DNujLxsDRm1lu1S1CPNDVRgHwVVEPu
         4LCiweHAxen2/pdNF+OqZhkB8wYSBYc2qAD9KIgMG3z+bNvCubPqDSRUO5wvGH7ShjmW
         KjbvzIrAUdsvNnPbZVCsX52noN9iI72kubfX+VNXnUc9GTf5SbBEvprbBPQOoP1hJZuT
         BO+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=diMt3QZL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e27-20020a19675b000000b00502c8bc3cb0sor1167087lfj.28.2023.09.15.02.16.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Sep 2023 02:16:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=diMt3QZL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694769361; x=1695374161; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tobk7HZZ2nYrp4ct5icjk2NTeyFuWk3+o1WLYBkX2hg=;
        b=diMt3QZL4QKamFQSC2B5clQ4AlA+p/JUKQBltV6c7GoMU4H6auUFMd7FU2hQI15zDE
         WAK+rwGygYbLA5OA2wnahkcl+/gdqBIaHtyxP94MmMzalFFi4C66IvoUspfTKbg6zozd
         2Do7fN0zbF/8aldrPCBOREBguk3OaW0tlrvLrv5CTclbCKAHttz+hDd5gBlcHBtJUh/U
         kXSe82UhTnGKqOaA//QgERrzCqAMePF5PUrWDppU85403IkvFyYDMT2KBpXn3mAjY8U2
         S301mC3qBFZsVbGwRkbbEzfCOgTx8OnbiTIYl+kTTNZHplIj9NjpDltp5HuLvSPYzuhL
         sOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694769361; x=1695374161;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tobk7HZZ2nYrp4ct5icjk2NTeyFuWk3+o1WLYBkX2hg=;
        b=VlG0wZI1nu1WIUvAmo9DjVncQlyKYakPr7BMoVhbOfBCZ9ODwtwA+9hnlD512sfxp6
         8t6vJBn31C1JqYVlG4dUuOu9XiwyxDpVQ3Whce+kkUp5vhR2IN3QXCdnKiubpX5f1yU0
         V7PISL5PTFz/yTGqUlntN5KCAPnN61D/P8OgEbUKGxgAcyxzMTagbMsbFdu3LmteJ7qi
         qRo8Is2NT/2/fAZhgBjngoYnCkEfqz5VsLDgBpTBDCPVeca/dOHgB68C0xkDdH51kpMy
         uYOhPHhbfSVb4wtqDy5rMGDxccLuI6yLRgIlfDvnpD02lbf6bcZ5uVhAI0hqpoDlNA5V
         Iuyg==
X-Gm-Message-State: AOJu0Yzdl103M27sI4YKXTVAvZvyhhMfVHdtVT3xwG4WogmkKAUstszA
	zsuSsHvzBrSA0n2WoTjV1jgOUYtxlitWsNIOw9aLXQ==
X-Google-Smtp-Source: AGHT+IEjZXZdEw+lJzWMbLz6wDxyKQXhvBdiHgegnk4M/OtscX/4t77+pJMTJGHMcRhWL55+y7zRow==
X-Received: by 2002:a2e:b001:0:b0:2bc:ee89:6976 with SMTP id y1-20020a2eb001000000b002bcee896976mr1054643ljk.24.1694769361253;
        Fri, 15 Sep 2023 02:16:01 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (176-131-223-129.abo.bbox.fr. [176.131.223.129])
        by smtp.gmail.com with ESMTPSA id qx9-20020a170906fcc900b0099d0a8ccb5fsm2152978ejb.152.2023.09.15.02.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 02:16:00 -0700 (PDT)
Message-ID: <a7300e20-6979-e286-0d87-e5a14007b154@linaro.org>
Date: Fri, 15 Sep 2023 11:15:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 7/9] gitlab: make Cirrus CI jobs gating
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20230914155422.426639-1-alex.bennee@linaro.org>
 <20230914155422.426639-8-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230914155422.426639-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: D1U0LwTZkF9j

On 14/9/23 17:54, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> The Cirrus CI jobs have been non-gating for a while to let us build
> confidence in their reliability. Aside from periodic dependancy
> problems when FreeBSD Ports switches to be based on a new FreeBSD
> image version, the jobs have been reliable. It is thus worth making
> them gating to prevent build failures being missed during merges.
> 
> Signed-off-by: "Daniel P. Berrangé" <berrange@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20230912184130.3056054-5-berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/cirrus.yml | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

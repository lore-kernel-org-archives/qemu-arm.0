Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1223822ejc;
        Mon, 16 Jan 2023 00:39:12 -0800 (PST)
X-Received: by 2002:adf:fe8b:0:b0:2be:449:11b5 with SMTP id l11-20020adffe8b000000b002be044911b5mr2183190wrr.69.1673858352590;
        Mon, 16 Jan 2023 00:39:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673858352; cv=none;
        d=google.com; s=arc-20160816;
        b=Y9RfqT3LfwRcLQC3SXV8NddulKsAUyLgtWEm/g3uweOwKgRWXa1jmAqM2oX1H8dfF6
         2uLOrngL4N0YR/Bo0StFLh4l39fvyVQodVM3uM38lFBEVtIc5ZukznDXO/6M9Zfnm5W6
         YISwnLohJIEM+U6oY+oTeuf/kLPVTz0vLGpjxveZJAArgdTQtXtDl75/zNz8a2jHtS9i
         tv2mxQlf4wHuGZu7Ru+iNQne6P+sQjn8WoT4/l20PV2vDN6VXWOSdJl8rh8j7noOwDo1
         WrCeCMv7OOZYjOBDPwhhkoqNBX/BNF1akzMpy8fF2QjRcwP/EjutcAgejd7taeJ+NI/Y
         vIjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=41QeNXP1IEfbGMx9Lk5LRMYwiu2lUjMaZEfYeTNEoV8=;
        b=goUGTk8gah6eY55m0/6pZX5d4i3IFF0rh22CRiWnf8h5myMYMjCH9j5lbCPPzLkYmd
         TX03xTABGoQswDD8JeuTQk9DtCcOO7DRDEgpZC5FQSoEEwOtTy55uP4qpa1Tf93ePFRe
         m1ZFWc6DXLC6ggyvODVh5mnMTUu201THKQPbhzHYdrGgrhnl3xgLHjH+3In2wUQdcXHB
         qz4cQ4Uc9VS709HD9/LQubmAGxk+7AIBsXPeD1kaHfBloZyiuLaoqRZMHBMCo6Abjzkb
         6Onro+HKh7TczUWUOmpCnJHHglVSG13SmZTyMfqCzTrJR3W/ax9vwUVx9nsM1j5SqM9f
         MJaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TzSfxSKh;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l1-20020adfb101000000b002bbdc93f2ffsor9384498wra.63.2023.01.16.00.39.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Jan 2023 00:39:12 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TzSfxSKh;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=41QeNXP1IEfbGMx9Lk5LRMYwiu2lUjMaZEfYeTNEoV8=;
        b=TzSfxSKh6Ox/m8n8TtnhhBL+MhDIiidS+5DFQvcCmMoWqh+sy1l/+gkS/bk8LfNmGM
         EnSxzVH6n4tmvpz3orhGHF30xnk4+z/WOygz7Au58k8XQtUqIGu5k8mcdcJlTiQwB/M4
         k4Y4W2p/WLsn7dLNfFWVpXB1vX2Lem1qMHLSECMUJjMJ3nwZBzzGb64FN53RPI9bEHkE
         sNsjUKzHvNXxENbXJtVBJUyqgX2anu+T/Hgmd9lw2IpKmIXLIc5nU3HrjMCIDmiOtvLy
         vu4+2WhHEvH9I8UIwu9jrYomWsw3BavMtwcDtjeuSiwBCbbKq+92IJl81QhOBbQ+sxh1
         xJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=41QeNXP1IEfbGMx9Lk5LRMYwiu2lUjMaZEfYeTNEoV8=;
        b=5s8Lxh/Oi7TyJpXjydaTZPim3mLvi3UIZ5f1gBNbq6JI7CJVNtW5dLjDGImVxJa+Ww
         CDaHPqs374lCTlaUWOf1FcmWZHlOfym5ZSMpjSqhM3BUfR+Eik1Fs9nSL9Hp5T6JWfCJ
         HWIEI0rhLEjG4cWfVuUPK12f68cwBheqkG0P3j+iFMKPONkF0HWEq/c+iHEFwj1Ye20Y
         k8rklEuBxII+b49zhGw0JbnFihwu9DG2iUKDhH7oGRuQMbWi8f0ksbTQi91N6ZUVZ423
         F8LdXTieba325im8cLfJAXHMn3c6y9k1walijqhYBeeorlkmb3HgMVWL6uY1Y+Nm3b6k
         bDLQ==
X-Gm-Message-State: AFqh2krlcHy5XlnJvmNt7a7GwLKqWTZ6Fi+ueXkkSua/tuGhn4UuW9QL
	s8DkGrmkveaeZtRi9KftBiMN2WZtcJGdm3PwPi8=
X-Google-Smtp-Source: AMrXdXu3ydip1YRlkesu+6xMJa4FofWA9FkvUifRPSK+l0MGueCfJ3MhxqUT2GbXc4g+4Fuarg7KoQ==
X-Received: by 2002:adf:cd02:0:b0:2bd:bbf6:6adf with SMTP id w2-20020adfcd02000000b002bdbbf66adfmr15771147wrm.20.1673858352393;
        Mon, 16 Jan 2023 00:39:12 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id w10-20020a5d404a000000b00275970a85f4sm25559317wrp.74.2023.01.16.00.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 00:39:12 -0800 (PST)
Message-ID: <f542fb40-1c8d-a222-476b-28b2319cfcfa@linaro.org>
Date: Mon, 16 Jan 2023 09:39:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v3 22/28] tests/qtest: Restrict bcm2835-dma-test to
 CONFIG_RASPI
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-23-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230113140419.4013-23-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: x1HXa/1bLBbm

On 13/1/23 15:04, Fabiano Rosas wrote:
> We will soon enable the build without TCG, which does not support many
> machines, so only run the bcm2835-dma-test when the corresponding
> machine is present.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/meson.build | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


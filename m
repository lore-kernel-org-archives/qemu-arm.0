Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp441056njk;
        Tue, 16 Jul 2024 14:53:10 -0700 (PDT)
X-Received: by 2002:a05:6602:2b86:b0:805:3d47:19d6 with SMTP id ca18e2360f4ac-816c33ef19emr102223939f.6.1721166790131;
        Tue, 16 Jul 2024 14:53:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721166790; cv=none;
        d=google.com; s=arc-20160816;
        b=zP7IclX+2kosdYbWjMsisBlZdnAHaVTfwTdE8VhbG7paWwCyJaSR9Pgxj3+tnLBTnk
         tgFSEttrNmy6rqomoxYoucG8U72Z6aIz6g7KmHWIb5BJkIbF9gQgK/nhjo9hl4AaF9/O
         uhktWnWcDtAHK9Iaxm4IyMLRBagK94XbiCcR7hmXexABJPd4DA+DTXfqs3GGRDqIxj/s
         9STNzPUI5bBfikjTjM57QXzJ+cx2tY/6tCEVwZMsAddoe3hN5HYVaCAbhtFiI4lRwMJj
         QS8PEIIQS96r5x8CzMdmqUhCTwUmwQH/gfcwFs+WRSpXk3w4ZWvOFdl7PPAIiTemCbVX
         mpJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=g2FmxzMZcv/MEEdbkenuOaQhj+vVp0e+S9+LfJvTfVg=;
        fh=dXDin4roZwyPxP4fgS7tkRStUq/B0dnsz9/at8ouxuo=;
        b=mkNRzkUuiVHvskoIYNfsYQt8NhB9XbGOJWrXvkmOz2MJqWQOql9yXzng6TQKj3SxFs
         +shr3qUcnRibtQw/ecT3wCm/Nf07vDlmoXTmBF6C7c3hWSey1lRFPnSr67urDd52hmRn
         YL0a7JdHPtoJ+me6PMVhM1Ef9lgZNAMgLKFfHuWcLI9R8xkQ3k0ETHFnC4m4ugxFVYNq
         vSxKvTn9eTJLu4PMeXrxljpzIJT2DYpTvNOmd3150dCEcou7mTCXHTUgPpYPP2Fr9jvL
         fy396uE/+F2jCBOCWrEgJ1x4p4XGTHj7/MR9laOWOwYLrTpSpzMRTs8m3wAAk9UiSiBC
         GOZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nk1a1jwa;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-70b7ea7b938sor4553269b3a.0.2024.07.16.14.53.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Jul 2024 14:53:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nk1a1jwa;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721166789; x=1721771589; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g2FmxzMZcv/MEEdbkenuOaQhj+vVp0e+S9+LfJvTfVg=;
        b=Nk1a1jwaKng+1CoHoZUHQ1A4nsPvOAbPu7VHuzqEtRqQEq/3K+9l4MGW50vPP0qUnq
         obj2CuXR6WrDdlWW4gDAtGYrj1H352Gkc6U7eh2FiLIKfWV/zH0pswSQbdmVOjJHdmEu
         IVdtEAkY7zOuxorebm69/WKxHPQuWju7+0a8/NT+8PRHeKTpa+agZVdZQGfvoLyiNRGE
         MiZxxN3nz5x/o0kO/6rqoVTc0QWcNx9DLU44Ug63zsNQ7nV0p9bYzp0TRGkVafbeKrO/
         VbKqY6aQkWRCq+cGw3eiRSbCVJCraRf8gM9NfR4VhUql8qRsqd7YTsoIW1Y4xirRrhjS
         94EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721166789; x=1721771589;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2FmxzMZcv/MEEdbkenuOaQhj+vVp0e+S9+LfJvTfVg=;
        b=p8Bs8JP25IyhHb5nQn5GT3IONC2zhY4pje+8Hmq+4uq+ga3pKDA0mKdztR4zsVX8tz
         aaoI2wp+Can9Asf+Sa6dyMNFznxasuLutIKhnQOh8Bw48nTdXj6HBrfRJFEzIGTmIspr
         jdXS/ocztaci7cfgju4L+dWmOExoBnQMrlPzqD2oAHi4aqnSWbR6shwSOFGqzZkTIL6n
         bKMiXIlfwiewlePhfvY6PcjDCxrlWhWoWMx7qdePJej2d9FyChrizehRhdjmKE5KOZx2
         rgwuHziSB+PhKLNkNxl0dMBpoMW+gvSav+C8oqe2kfkimvy3p8IWUx1wehV4aBlaNPjl
         b5iw==
X-Gm-Message-State: AOJu0YzyizpVwhqps1KunZB9PF/K1ylA//M6pwtYUo7ud/6pw+V7PIUC
	3P1NlZvSHzd0AHcbtXV7GcEs0kCgd3WT3Xtfp3HzTs3W3fauTUuYRxVag1arZjbh3W2DNCTunDT
	uxENEuu53
X-Google-Smtp-Source: AGHT+IHOqGxByi8tMVBeOQFEu+eGjhs9FGSfoSnODzpQBKeGWSUx+aXqyKTLbDRKZDbN2EHjzmTuBg==
X-Received: by 2002:a05:6a21:9206:b0:1c2:8d2f:65f4 with SMTP id adf61e73a8af0-1c3f1272a98mr3575819637.44.1721166789421;
        Tue, 16 Jul 2024 14:53:09 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.113] ([203.56.128.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cacd2d05afsm8951057a91.9.2024.07.16.14.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 14:53:08 -0700 (PDT)
Message-ID: <afa432f7-ed06-4074-8849-796984be0bc5@linaro.org>
Date: Wed, 17 Jul 2024 07:53:01 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] gdbstub: Re-factor gdb command extensions
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Gustavo Bueno Romero <gustavo.romero@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20240716114229.329355-1-alex.bennee@linaro.org>
 <b9b178fc-04f5-49a6-992a-f6920408b41f@linaro.org>
 <87cyndgtui.fsf@draig.linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87cyndgtui.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: WDUYpKu9kJmZ

On 7/17/24 02:55, Alex Bennée wrote:
>> Are you expecting the same GdbCmdParseEntry object to be registered
>> multiple times?  Can we fix that at a higher level?
> 
> Its basically a hack to deal with the fact everything is tied to the
> CPUObject so we register everything multiple times. We could do a if
> (!registerd) register() dance but I guess I'm thinking forward to a
> hydrogenous future but I guess we'd need to do more work then anyway.

Any chance we could move it all to the CPUClass?


r~

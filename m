Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3673628ejc;
        Tue, 10 Jan 2023 19:48:05 -0800 (PST)
X-Received: by 2002:a17:902:8309:b0:189:469c:dc0 with SMTP id bd9-20020a170902830900b00189469c0dc0mr39031465plb.7.1673408885533;
        Tue, 10 Jan 2023 19:48:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673408885; cv=none;
        d=google.com; s=arc-20160816;
        b=Vbs9JVzHE30wiFwCyHH5AtjK1VXZ3ooitQFqq7fO0LbgrTZZllGSFBqXdetE6dp0MD
         e4uh/NH1cIB5M4dlYg5tHjrLNBSLdZ0t8CAlFd3YpUE22bc6M6xgLzCpX3spA4PPynpl
         SybNZssXXQHmACXfFuKoK4uW/yH+D7YXso24GzcG0kUsjdbEF+YANp6sMHYC1kNNES6n
         QIHZkyJjEufFmJXyDtZtFic+K/+qNS7jy31WZcZdw9wXKDvVxZM8I4R7/fWo+bJA7GYW
         JZFtHY92Pli0uX6B5Kua3tE6O+JaOy5V4/QvmX70ZSc8W3pQgESMEcU7pAAX2EPZPXCC
         pUOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=G4yTLA/5NOVEqxJd3Mfnp4LQoPRyaxnEyB1tQDqXyoQ=;
        b=mLU7IYXsIKO28cfT8KoC5KhxIuc7qCnQuV1ItxmhXtuPpmxJQ3D8V8AMa1K6p7CcIi
         KIJDJCvttADWSEXM+y8aNBCi99buGOxb0HoaJC/VTeRjDP0Yr0Fj7KfSmuCMT11aYRBF
         oUpko/3HVr5ESD6uyZc1qydCll8N6tNqaatKy/xOPrmRl5CKuNFlbh/XR+Nw3Y+qMWhH
         jTteO0B6CnJDMSPkqP+oGRxSl09ItkVr6+aQzSpmAiZFZY4WU1Y2pcUcZUt89G72n1JM
         /+ufYhS4M+lLKddZj6kjrJ0sZFM40JCaUztbm4eGA/g8AA0edXu3+yUq2/BeZU/bIfhO
         5/vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Em4kxJaP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e5-20020a170903240500b00193051d8ccasor6646300plo.143.2023.01.10.19.48.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Jan 2023 19:48:05 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Em4kxJaP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G4yTLA/5NOVEqxJd3Mfnp4LQoPRyaxnEyB1tQDqXyoQ=;
        b=Em4kxJaPV73uWPGDsfIT2BLvFHHUzcE4PIWqJQT7QLn7YEL0KP4J24WOVPKNAxBPSs
         8xnUifl0kZhWUoZQBwperrQvfhv8t0BDkuRFd0ogLgUw5oJU3LHcsvAFas1BsgHtQn11
         VYzWVrA5w5umhkC8UMiQbYu4U1HBzenRN3rbPNk/k1nT9CFIacXc16YietKCvEC0R6Yl
         zjZi73wQYjYIAIZVifVYJQ3t7N0uddUMj7lLQ8a52PUHiXTZUSaHBIwSLcgY3W4r9cf1
         uSuCYyMqvFUrORFJio6/PhbSwyr+kQMUagj4jSuuX3wU5OpOTpttGmb+jDnrT2G+SGPQ
         S26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G4yTLA/5NOVEqxJd3Mfnp4LQoPRyaxnEyB1tQDqXyoQ=;
        b=JYFu3jZcj4nEMUsaGVVcCwTcwxVrl3Jwnc4X3I0Shw7ndQEr/pVDMD2Sv9bYwYQmD+
         F8eq0gYCFleUDlYSCzyPj2laiP4uljyJsslADPH5UoxFZ7W1aBZYI4DpU0AchtXIJYQa
         41511SLG/SEsXbJ01S5uv5yKGPSTa4iyguu18+jIbdriWpBgCoerZWK4frhCiVyzHqCn
         R8jqX9viSutANc5FXtWh7G+bLgpbeG+X8VutWnWj+t3AVFIqeVVBdn+wetheR6pC9JBV
         UbO8tXkOJoJrL/FPRG5mQiWGk40zqC/ZhLjaSmAHvifbguzogT4As5QEJbAi70ezFiaK
         d3YQ==
X-Gm-Message-State: AFqh2kouv+n/KZRR6oghuLnINjUX4xKOpRKXcaf+r8oO4EUWP/85dqPh
	Bkugb9zAFQIIifN1YO9oJn2qBUCO
X-Google-Smtp-Source: AMrXdXs6RoeCZ4w7SzTN0RoBgcWZ/UkkJK2nBXJKnNKaXz8QzYXjtxC00Hj9xNQ2gSbHa3eqTponSQ==
X-Received: by 2002:a17:903:32ca:b0:192:7847:b047 with SMTP id i10-20020a17090332ca00b001927847b047mr68080977plr.54.1673408884723;
        Tue, 10 Jan 2023 19:48:04 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.115] (63-157-97-90.dia.static.qwest.net. [63.157.97.90])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001869b988d93sm2096898pli.187.2023.01.10.19.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 19:48:04 -0800 (PST)
Message-ID: <378c536b-b0e4-4b97-3015-cfdec23fc62e@linaro.org>
Date: Tue, 10 Jan 2023 19:48:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v2 07/19] target/arm: Move helper_set_pstate_* into
 cpregs.c
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-8-farosas@suse.de>
 <c1541118-b5fc-d39c-cfc9-e4fa2d83c801@linaro.org>
In-Reply-To: <c1541118-b5fc-d39c-cfc9-e4fa2d83c801@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ++tsZf5gNgrk

On 1/9/23 21:52, Richard Henderson wrote:
> On 1/9/23 14:42, Fabiano Rosas wrote:
>> We want to move sme_helper into the tcg directory, but the cpregs
>> accessor functions cannot go along, otherwise they would be separate
>> from the respective ARMCPRegInfo definition which needs to be compiled
>> with CONFIG_TCG=n as well.
> 
> Hmm.  I would have hoped these could stay tcg-only, somehow.
> I wonder if it warrants being an ARM_CP_SPECIAL_MASK value instead of svcr_write.

To answer my own question, ARM_CP_SPECIAL_MASK forces NO_RAW, which is not what we want 
for migration.

I'll think of something better here though.


r~

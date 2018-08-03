Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp436403wru;
        Fri, 3 Aug 2018 12:48:36 -0700 (PDT)
X-Received: by 2002:a17:902:24c7:: with SMTP id l7-v6mr4819618plg.170.1533325716326;
        Fri, 03 Aug 2018 12:48:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533325716; cv=none;
        d=google.com; s=arc-20160816;
        b=JaVHC/q8xTL/nFG1Ojvrt2sQqiQX1ujJI+/rScgPLerlYLasgIQsxlqEEutDtc19j/
         xPWzwuR5cD4/mUtg5aDFAGsmzbcAo9+rObrFwLRFwsRBwBBq4AAjnvSouUBXc01STigj
         Nn76yzkucPXXFqCqNbSt7tUpGzCTov9dATYZbzjvXpvaPbFHJzT+gXfBKuKbUX6T6CWg
         Zh6YWcF19XDXbqgyallaDeEVBsPKN4XuIe4pGAgbKNWhKQoemcZL/1fL7shP36BGoer3
         7BrMO4owJpmYx2bNUthZ4jKzRAtmjt3egKeS01m/3uD9KCsJf+1mykNUjOHRjfmaPnHR
         qltg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature:arc-authentication-results;
        bh=2hZB1sd1EJtJ6ioSRz9mjTzFK+KY0k6AN72MMSafFX0=;
        b=W5igW4bnaQGfMforB16/qZlr4kCf09JryYnRlJ7bSuT26FDA75e0A85hoEFE7Jlm/l
         MYUH3yeNt7AHP0TOqT7r1hYjXBEskgpiaCgkNGKjrBInhQ2GLYFbyWKsvFRU80UcIjmC
         sPB+VUXpBIWXdk9L3K6fY1aD++OyHhygMGTLqmJ1J4vAj9CodKe873eZsoRhC3MsXy/H
         C6VS9KQfpvu0yWolLdRYSuCsWvgPRdUyYHVN9FfHeigh4F2ruiA1f6tBNEeRA6NQya6E
         jP+vFwRIF0820u8Wb3ElvEfweBEzLD/hx6UKk59F2gJS4rQYaz1/t7sPCIFdB6igltUu
         wK5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=claFVwDl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q11-v6sor1775562pfj.33.2018.08.03.12.48.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Aug 2018 12:48:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=claFVwDl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2hZB1sd1EJtJ6ioSRz9mjTzFK+KY0k6AN72MMSafFX0=;
        b=claFVwDlS9djGMQLg6dtjf6zvrA7jwPXzwy4vQUdTgHkYPg6+aFi7Q7Af7ejENjzNz
         LbBPaPFN/pHn7hHqZiuE1aMQEtkIQe6xIav/SirGf1/FAH02mVcdXQ9OHbox3uzFW88o
         Dca9Avo0qmlLW63OihY40xJgDJhBcVOR1+whg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2hZB1sd1EJtJ6ioSRz9mjTzFK+KY0k6AN72MMSafFX0=;
        b=Owse8sR68fWJMXQkd/4SqFT6LtB6Hm1E5gIBtNgXe7byxLwqRy1qEF1FWVBk3EDBsu
         thagNlC6nKkBwGatJqavnWBGxRFxe3Nbnq6CzzMPnHaDLhjy1MDukLQURrevVemtQtM2
         aZtDgu7X+LS+BCBmmI3Nn00umPDA32uy7X/ZcW53apxLaEzbaAOhjWf4gJkH9SCujRHA
         mQPFS9eKakmi0pm2OCebnyGeWBqnvrKrQSyFk/jGahbQ4fN8cuuUf3wm9Q80NhHLJfMm
         dE9e2PDOkB8F8O1p4ws/rnWmH8mhUy7qpZs88NXyVotWVNLuNOfzy8d5kUKDk4wW6W6w
         58Hw==
X-Gm-Message-State: AOUpUlFDE3P9RdsscbKlTJRTp6/eSwk3mNofUM0rGCoKuxX2BzQbvNRU
	qNR3tiJ5ZAtR75H+6z7SFUyCsuYTwuhwbA==
X-Google-Smtp-Source: AAOMgpfNSC7NKEeuLJioxJ0kcY5Vi8MnLJKpbPNKgrw4SQyBq+xU5wysy5dOUj/E0eG7PEsWUETcRA==
X-Received: by 2002:a62:6cc7:: with SMTP id h190-v6mr6082577pfc.113.1533325715814;
        Fri, 03 Aug 2018 12:48:35 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net ([12.129.159.194])
        by smtp.gmail.com with ESMTPSA id q21-v6sm8976595pfl.156.2018.08.03.12.48.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Aug 2018 12:48:34 -0700 (PDT)
Subject: Re: SVE LD1SH typo
To: qemu-arm@nongnu.org, alex.bennee@linaro.org, laurent.desnogues@arm.com,
 richard.sandiford@arm.com
References: <87a7q38z37.fsf@arm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <679010bd-61bd-9167-be55-314fcf717c68@linaro.org>
Date: Fri, 3 Aug 2018 15:48:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <87a7q38z37.fsf@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: k5I/U7nj/cvD

On 08/03/2018 07:32 AM, Richard Sandiford wrote:
> Hi,
> 
> There's a typo in sve_ld1hss_r: it's loading int8_ts rather than int16_ts.
> (Sorry if it's already been reported.)

Thanks, I did see this myself while rewriting all of these last week.
I should make sure the minimal fix makes it into 3.0.1 though...


r~

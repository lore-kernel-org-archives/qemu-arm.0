Received: by 2002:adf:a557:0:0:0:0:0 with SMTP id j23csp4614851wrb;
        Wed, 10 Jul 2019 00:41:25 -0700 (PDT)
X-Received: by 2002:a05:6830:2059:: with SMTP id f25mr570524otp.58.1562744484905;
        Wed, 10 Jul 2019 00:41:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562744484; cv=none;
        d=google.com; s=arc-20160816;
        b=BzqIFZFoUAgbTPd/oqef7PORZwhb77paxE+ptUCtenFGPveEsstGSixxr/k0b/6Sbk
         bH/vdGyFf4LdZUqC/tGlEl3phfgTnMD579Y6Me9iBHVPW4LnHtLCjHA0H4BAMgP8nwVb
         eOZcD/6wiyIGdbpRKEPJcZlcqim8VnUlfh3vXso4TJNwfv7o+n7fhqfsDlsXm5r/REXo
         18iUl5LTRwve5Ff/SxgP36EWbvHEqkUaUhHpVdodfEXamMTwdGcyeXrxuG02V6l2w7u9
         RSToHcs0k5Hi/lGhCPoZjSNPGQp5ppaaQ6FnPRO/AG/R9sv02qRwAgmrEgfHrS20kwqn
         3P8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=TXE3kgF44lBVZ/z1dmAO9yFLLK6d84bW2ivIa5t1e0k=;
        b=rZZdJMOCP4iWd8FZJAzPZVOTkZgsYB5RDaFtWoY+FWnEAYRj241NiKWoi//Gjewran
         zJUpmEDHQGcJHHzY8Wr5Od3+A4MqSrAfNrNgOjaMlg2L902Gqmg6Dco0Qf3CLu3G0btV
         FMBoL4sxeDSLZnE4Zh4kc4yvfatIlHyXhYKmzXUwPrMkXo3qcvf7b/l7w7P7GAr3ShJ1
         lIKAxGMmjLBgzXoxRCQeNHmBz99hmrhuIdww/cCYmXf0v/i3cvdHGw3h3EFzSXnDcWnQ
         rhgPFTTmjD+fzcAh324eC9720Ksv6FHGhtpbLxz9rAium6FaBTrd/hYJRD1zXP7YjJ9d
         /cRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tj45pOOc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x200sor582935oia.6.2019.07.10.00.41.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Jul 2019 00:41:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tj45pOOc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TXE3kgF44lBVZ/z1dmAO9yFLLK6d84bW2ivIa5t1e0k=;
        b=Tj45pOOcOzaPkP2jDlt4UVz9SkhecD/8yYlQcYbold1vxGwXaJQOwFYFtbkkJGYzYG
         H8+5jO0pgeyY+NnBfw66OY7RjZWnSFcJQnhXwO9gPf1Ca8B6NfGmmmgD3WdBtSKIFUuP
         6zRLI5U10hweMBwN5Kj1eIOzX9QPAe3cAmxXTlEMtpF8iZlnFcWTD/oBNdR1HzlCmzZE
         2Hr1bQEEeCEa+VCnO472XLhmSPKgk24bGRVQKPIP53vPFi2GWp8Oh3xzU0VqBe76bOzm
         MUzqZTN8eOdik6gfEWVgZfwON2+fGoI5kQDG4tg3X6wQ+rg2D4nP/2zOR0zFh5t7EJ0M
         7G9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TXE3kgF44lBVZ/z1dmAO9yFLLK6d84bW2ivIa5t1e0k=;
        b=AlrmiRkqpPaQZqNPTZPg8nrUyojRaiY/SnWrLbIWkhawh0bNVDrutawex4gS7+vXsC
         amqUWUsD+ykXsApo0HgBpyuFafmXVMcHbT895eNNX1EmSLYrdtHAPA1vuK1ytjMm1gp+
         jHH2PE55H8rffiWenrSNQufewyskMrp3PrrMKYVOalq/212Cv2y/N6VVo3xdy4kzhuuU
         sz+DIbFp6Bks+mf+utYGe+3lL6aBhYmUuTONqJCQZCBjP00N88I22ErVG3dv1elIIIBB
         q87NdsDhZPQwB1t7xU4TztqJH2C5qYpHOeAqprJm31jtFL8ss1n47feuDHoJKlPAKKdo
         KAtg==
X-Gm-Message-State: APjAAAU1LcIbBHGt8YEGPH9dT/dD1hPdNeIUrx6FiPax0ykVShGhPrsx
	bX2eIZZslv2Xe1jIOYQ/KPTjK2EREa0p3khP
X-Google-Smtp-Source: APXvYqxnyARTB9v12iLs3p2Tp1xCfwcmhzAaUGVe3AqoaJASexYbxPkeQdwzFzZBdqxUDiGAqNq11A==
X-Received: by 2002:aca:e641:: with SMTP id d62mr447627oih.24.1562744484364;
        Wed, 10 Jul 2019 00:41:24 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.43.94] ([172.56.7.82])
        by smtp.gmail.com with ESMTPSA id k10sm583391otl.21.2019.07.10.00.41.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 00:41:23 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 3/5] tests/tcg: fix diff-out pass to
 properly report failure
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20190705160421.19015-1-alex.bennee@linaro.org>
 <20190705160421.19015-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b42c405b-1b20-28b4-07c0-24df9a183e16@linaro.org>
Date: Wed, 10 Jul 2019 09:41:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190705160421.19015-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: xqYp5Gb6U8Xy

On 7/5/19 6:04 PM, Alex Bennée wrote:
> +diff-out = $(call quiet-command, diff -q $1.out $2 || \
> +				 (diff -u $1.out $2 | head -n 10 && false), \

What about (set -o pipefail; diff ... | head) ?
I think we already rely on bash, right?


r~

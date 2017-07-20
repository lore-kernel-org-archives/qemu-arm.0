Received: by 10.25.44.15 with SMTP id s15csp2508276lfs;
        Thu, 20 Jul 2017 12:00:03 -0700 (PDT)
X-Received: by 10.237.55.105 with SMTP id i96mr5945592qtb.139.1500577203261;
        Thu, 20 Jul 2017 12:00:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500577203; cv=none;
        d=google.com; s=arc-20160816;
        b=VFS6tmUfftg4tJIwomIbTel3M5SX5uTjs8BL6zY3mQZ/a10Yjmqwl1lRv1UHAUEswO
         O0TnXQ9Z5ZrBR9HAKXqzYO5asHPp5KP0ENUWYJeXUrOUuxWRqYFAostSh9AnvzZOgTrh
         ODXOlJTJpQJlXI0MnbTjjsxO6askGvbjxIQupguJlchi+MaqNj8B+A2FDDiKNPNZtTKz
         qEqnkNGOagc1CQooPsrlU0F9ihY9+R77wX9eN1xfnd30+6i6mTi7xoQZJTLbUhxslkSg
         qvN4m2xBo8WmdmcBBs/gGXCHgx2VY6upHrFroFAgaGM69h/tHAt4dURqgUQ2XNVJ1SvK
         8RTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=h1OqAfp4yeU8babCzQG9IKwe4LcihLmon39e0X54Nmk=;
        b=FGyuW3OD0Q/I4dj8/KA9b82ucVrnrENeA7k6a8KCR/c5aglAlY95SvADOcaUmeqDs/
         90rfn+IoK/Q6dM7QU7OSShSUyM1HBXCqhmQ92ok/vVC4tnLYIlPZE1OlRizQQIV/tWvZ
         TNnvp/INlrqmg+mIpaV8YNOiAEzrugyqbS6WKJJcqknp4q2JL3+uBhBxIF+xvAs9H8TH
         KWmp8XgOUe3iqP1iEYn0Nc6Dd9jlWQprsgZDd0jKAD2isXhTe36y7fkHA/nH6R+XPfCT
         5hP4st2oPhUw2L0iHstqx2WxrjtlFmuvvNbaKLGCCIpXM1lPktFzvNMo0SI3AQZrrY2h
         1e5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=ZqbxmqS6;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com. [2607:f8b0:400d:c0d::242])
        by mx.google.com with ESMTPS id m8si2390306qtg.273.2017.07.20.12.00.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2017 12:00:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::242 as permitted sender) client-ip=2607:f8b0:400d:c0d::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=ZqbxmqS6;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qt0-x242.google.com with SMTP id l55so4540824qtl.3;
        Thu, 20 Jul 2017 12:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=h1OqAfp4yeU8babCzQG9IKwe4LcihLmon39e0X54Nmk=;
        b=ZqbxmqS60ihSb05OiCMoFlOlVch+u9zIlJ3KC90N1Jz4Lzd5CGxY3rWQg9ygHnAO3s
         EjLsPJ6qQ1X4X7ajiTtCOsyN5on5QU9D3oAhIoM29/NCMOd/xuzQWmQXxpuA0xtnDTSi
         0XimTELdR0HbHHMlUQmfbVw0kEviciVqUK2Hk8Cc7ld3EjNAZCxZ3rjrMxl0ti3/k41v
         T4OwmE/s3nhaY2SKWGkpKZALK1o/2JRaMrp5Ly/59sA0u+K0SEF3hg61ByPPzIINfYdQ
         2Fu61tOP2+/QFsCADt655mbitiFpy9Qs6leeDn98UzBdtmdDLByY4sGA/EHCBm7wRY/K
         dBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h1OqAfp4yeU8babCzQG9IKwe4LcihLmon39e0X54Nmk=;
        b=sRoSHX0NFCOgim/srKkTe7CsPMn+PQmbrdhWnT9oUusIRpFXNOiK59deQ4AtLV8shV
         SjmmDWhbYN3to29+/iEgjJZpwu51pldrBeeu0mn7dTpD3fGVi62JKfpPrZtVl2nZ1l5V
         tcgwxrr2ZksVFxJAWZVV1SPbtBEWSgJpHCWWkuJEN2QeCEMCSQYKfpkCwfQJKCftgqBk
         ZlBQ2asolUu5ES6dEvwD2qaea1//y+L4NfDsApm/5PuPMbLxd12OUOzDP994UviNvZqi
         5q6NGMMcfdYRmq02A9JP9xRdchFluMZVVPFsM1zlWk8aA2BVdqbvFP32M5nPfOcu9eF1
         MbJg==
X-Gm-Message-State: AIVw111EXWH22wlrHDextn93KXFARc+4TQf+milY6gk4J2kChR2539dQ
	gHplcZwLr+RwYA==
X-Received: by 10.237.32.41 with SMTP id 38mr6628444qta.68.1500577202761;
        Thu, 20 Jul 2017 12:00:02 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (14-203-206-9.tpgi.com.au. [14.203.206.9])
        by smtp.googlemail.com with ESMTPSA id n85sm2293008qkh.39.2017.07.20.11.59.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2017 12:00:02 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [RFC PATCH for 2.11 03/23] softfloat3c: dos2unix all files
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20170720150426.12393-1-alex.bennee@linaro.org>
 <20170720150426.12393-4-alex.bennee@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <d58f694c-cc8a-fb0f-f01c-ba1e2eebc6e1@twiddle.net>
Date: Thu, 20 Jul 2017 08:59:55 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170720150426.12393-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ltaUd0mBhDmQ

On 07/20/2017 05:04 AM, Alex Bennée wrote:
> This is a massive but mechanical patch, the result of:
> 
>    (cd fpu/softfloat3c; and find . | xargs dos2unix)
>    (cd include/fpu/softfloat3c; and dos2unix *)
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---

Really shouldn't this have been part of the import?


r~

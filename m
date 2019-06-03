Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1155716wrg;
        Mon, 3 Jun 2019 15:01:59 -0700 (PDT)
X-Received: by 2002:a9d:ec5:: with SMTP id 63mr2732275otj.333.1559599319618;
        Mon, 03 Jun 2019 15:01:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559599319; cv=none;
        d=google.com; s=arc-20160816;
        b=nXL6DQQbckU/m54nFzPWS8tK0629+BH51UZ+bdyLo3+RQIKFGf+/3PvTYAcGnjtvnA
         p+RKv9ZeI/gP0T3nRn+9CxoCiRi3ufO/TbA8R99q8wfUmbQVeItLvbECAP/oT5PsVyew
         DyNj7PRhKWQ4NgBUGwuIZfnX6ID1q+o4EOZ3okorYLJzpmbOH0mwyBYeGU/tvUEoCgVW
         rTrQxDJmH4WcatD6YI8R+th0TnWiPtnUH0507lSMQP5qNKimckBpP8MMxf6vX/3BN+p4
         T5MPFHFS4VbeEwukUTOeoQXqQTIuye+yFLFGYVktEcRMxStyYnlsEuMCf9AbWXgMXIoB
         8gAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=BD2K04R6ognMju0dvvODUd67OX7A0Y1WekCOyzlgEzs=;
        b=laRMhpe8luOt6cY+SEW7+SLEvn9khErg2t2QgGRzwIkAbWY8RUw6r+lUXEJjxZveNI
         nutT/MbNeMuP36ymZrjp8u2IzpSXhkfvyblmG/hb1zVf7K9qs4tE6VJD7B37ZWgAvXr1
         iW2K0WI2Mz8m0YxjTyzIAuhvSdjegEJn8J7ZMbxUdqBdPFt79K2WUb6yQ5KCHza2errg
         Q4gcOU+eMwRKxuETcm/rQhXtNVfJfsAK1HwCRKlQWJYlr2YoF4sleOnAU2tHqxbc2EKp
         FZA9OKd/kpE368OrHA8qsLO5fB33/mhbxhEK8NsUG06ij2KZ3AY8xbJtrMbyuMSggRGC
         mj/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ecK/Kbh4";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u109sor7226380otb.133.2019.06.03.15.01.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 03 Jun 2019 15:01:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ecK/Kbh4";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BD2K04R6ognMju0dvvODUd67OX7A0Y1WekCOyzlgEzs=;
        b=ecK/Kbh4j9mIB+dYWe6aDjjblUwMfn4hi8KCXkGsfC8rvgHYjtt7CSIXSnIDgrZfTc
         3jv4eEdP+L9vdJ0nAbQzaitHAcSPVY1rImczfZU3mo1gQzriUxegr0LCm8A1JvyVJUPE
         n6h01tZUAsbE8RIWj/8aUlzXhFY/Y6NZJMo/JcSdxNPcR1srjmEqXVuLkDjZSDGt9MYx
         mFAJ5QsAHipM7Vtmyty7SWnNdcpQ6V33Stz5MxL5l5avmWCbdlDWHwaDze//dhu1hsBC
         RfHkF31QUgfQ57AYvt8B5Av4tV32ShI9M9cPGseywz/VhGV9JPd2YSmI0mnqMVAFvWj9
         rM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BD2K04R6ognMju0dvvODUd67OX7A0Y1WekCOyzlgEzs=;
        b=m4JQ+TgWlklc4LdAH2RUnNwWaerjjuNy/oY0r7QNsUkpMev4Qdu1zeAe/miYK5RRUP
         cRqV/sESbutRUTqLnWQtW4ruP1W7NJrxJpQsbgjX1qprD8zlo48ye7U1/lMv8fQazx09
         zuRlmD/AA9yiOZQhCqI0FxyC1tD62km7QDgFu8uO68uGFWHhMm/1h4qFSpQa8akgAfEA
         J1oIeAWvBmj3Ibg5UHv2HI6LBqwMgCp3n6rqfimnteo/62w4Hnrrr0JspYLXBuJHHPWl
         ks9xYZSFm2e78b9JGhhiU4+0vHifwwiq91c/BmVAD7GAqUUSfK8mzOU//JqOA9enKZyJ
         wSDQ==
X-Gm-Message-State: APjAAAVIq1cKzsGRaLE4OwUx/pGCP6juFipbtyalXG89oZVSg81w8ZKm
	wvKOglfWPxdbpFoK35LpyDQ7Asv5
X-Google-Smtp-Source: APXvYqz8GXKGRHJdDVxcbbdHuUafjmgjP2uj6Ue8yfkmHxtruS5mm+oyIltg0JJt9nY8Z/L7YJkQnw==
X-Received: by 2002:a05:6830:1d5:: with SMTP id r21mr2940595ota.155.1559599319215;
        Mon, 03 Jun 2019 15:01:59 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.3.43] (200-56-192-86-cable.cybercable.net.mx. [200.56.192.86])
        by smtp.gmail.com with ESMTPSA id j189sm5582841oia.2.2019.06.03.15.01.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 15:01:58 -0700 (PDT)
Subject: Re: [Qemu-devel] [RFC PATCH] cputlb: use uint64_t for interim values
 for unaligned load
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: 1830872@bugs.launchpad.net, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, randrianasulu@gmail.com,
 Richard Henderson <rth@twiddle.net>
References: <20190603150120.29255-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e27d836b-883e-4cfd-69be-8977cc71d809@linaro.org>
Date: Mon, 3 Jun 2019 17:01:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190603150120.29255-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: itneECvOGL35

On 6/3/19 10:01 AM, Alex Bennée wrote:
> When running on 32 bit TCG backends a wide unaligned load ends up
> truncating data before returning to the guest. We specifically have
> the return type as uint64_t to avoid any premature truncation so we
> should use the same for the interim types.
> 
> Hopefully fixes #1830872
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  accel/tcg/cputlb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

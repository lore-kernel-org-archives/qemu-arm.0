Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2508132ejc;
        Tue, 17 Jan 2023 08:12:46 -0800 (PST)
X-Received: by 2002:adf:ff92:0:b0:2bd:c097:8485 with SMTP id j18-20020adfff92000000b002bdc0978485mr3355030wrr.26.1673971965895;
        Tue, 17 Jan 2023 08:12:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673971965; cv=none;
        d=google.com; s=arc-20160816;
        b=iAAvsvt8FBzG3gkzl46xhGKvKUgXbd6Z/BU7d2kuLpK9SRxtd772zteYiDreTn0cnp
         fqt3o1kbiMygTXrr6b0/mYlsCb/UyldHTXsmC1DbtuMplC9Tn+Vtcrb2KN4ivHarPz21
         cYHB4T5EIiRpjKd6fI2Ork3cqm/FKR+tS3Ev65In9vUq/ugZHCjV35IRzREltDS2l+fW
         +lJ+uiPASlk4jklJ9sn4prt5pKUb7iAmPmOomv6+xCX56+J9XScqSgpZ5kaYh2qaYk1x
         91ip0464aQ/zuMxJMMZQjChJNL2VIQ0C53WvGPh0w1zshBcAHTgS/NgoBcI+Rd7EZc5c
         3tDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=x0WpP5FRTLl5e1gnkjl+ZBTHfCSRjtJNZqOplEFmejA=;
        b=BVLJBXEnoN4jPKFbv5gtWmSd3c/ifdsmquTYbJzYDAU+XrvdtdfYp2PTprgPzkk7c+
         QIWb+eeZp92pm682VZjLOPiPyrLtArVCPv7bPbTvuWKiXCy28fVaLjciR5+LDPx0bTmR
         X3MtjSj2a/GnVhV0EhawXNXXIA+tJDi89pk5l1pPRC8aLGHVccM0UQEkvrhV+9ouoO+0
         B5FLxXaqmFbb74wUA4Pl090VV7vC7fBwlknMR1X6RcTzaaUpJS/Gu7nSYxESs3AF6Ej5
         k+62C99PjwG9pdU1FuAr+tyu1jRew1878XosVTkdujVUk/2cycWm3z9vL1l58hZvPknK
         031w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=upG3CPDN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m4-20020adfc584000000b002a4ae431569sor12796380wrg.48.2023.01.17.08.12.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Jan 2023 08:12:45 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=upG3CPDN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x0WpP5FRTLl5e1gnkjl+ZBTHfCSRjtJNZqOplEFmejA=;
        b=upG3CPDN3MTSQnCesYLQlvgjH74u99HJSKHJnqwV06hCd9JGCEpLne63gPkhEVld7a
         pWtDtwVIwSauv68ADOZynl8Wm6HZTPmZwtFVHyLskYC3UtBaMrWE95YOPmgBoHFw18tt
         0laglJUU7FfBr38P0pWnOCr/FZ2gyoBCwBape47qfMaNacg1XUU6cf5S9Djc8C0v4L/O
         K2TY5TcqJ+Vyf1iuXRcND3gpoAOThpkIsFkh1vhNedKa7BPZ4GpFooKKMH6TZ1fMDf85
         vopo5aGvXwCnbFhTjHUKNKtOIIp9CW10tx0Erb93JQgKbeg8MWaLOC1X5bIFtwjx+TZ+
         ORjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x0WpP5FRTLl5e1gnkjl+ZBTHfCSRjtJNZqOplEFmejA=;
        b=r5kW6oH3E6/qj3fKIyvd9EJX9GdnUUpj3ogNNpVVG3umiMFqNbgQrnwWjLdviR82Ph
         kAsNfCQ2jAhFeYzH+PH0dXrJR7wCJm++EvB7fryUM9w+7G8xf4FCmnemOw82A0TNgvXl
         rlJZjJe7/i5uRuyxTqVxUkXb8L68+5vRM67Fq7ZPx5qtbmiDZvdoFI+RNjECv8M+ufRb
         BiUb73FccD4PjuVDvRlkoQGeYFAwlt7Ca9bNib85sxaThmxik6h7R8/ro2Qdm2d7FnZO
         trTtYoiFt2842HBTxDsh014aCU23iGbKFpfFMM9qP/N4yF2GU6tZ+gohjRg5J8KQk0VU
         71Iw==
X-Gm-Message-State: AFqh2krCvF3PNzJWmgsNCR05NH3YBcJ2NTSYcAjvGyhgUHcHO6pJV2t+
	crNcmpxt8+Gm1IXHPcwexRF2pN1j
X-Google-Smtp-Source: AMrXdXvdQlBjuURLYUiUE3/5D7xq/v+Px9wItKPmqvGQkb3/rrSvql/7cOJsrn6pZY9wvOO+VDhjYA==
X-Received: by 2002:a5d:620a:0:b0:2bb:6b92:d4cc with SMTP id y10-20020a5d620a000000b002bb6b92d4ccmr3150112wru.53.1673971965713;
        Tue, 17 Jan 2023 08:12:45 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id q18-20020adfdfd2000000b002bdc129c8f6sm17706990wrn.43.2023.01.17.08.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 08:12:45 -0800 (PST)
Message-ID: <b1322ca3-096d-505a-ca64-0767cbb9d519@linaro.org>
Date: Tue, 17 Jan 2023 17:12:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v3 05/28] target/arm: Move cpregs code out of cpu.h
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-6-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230113140419.4013-6-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: g4i0QMRKGyGr

On 13/1/23 15:03, Fabiano Rosas wrote:
> Since commit cf7c6d1004 ("target/arm: Split out cpregs.h") we now have
> a cpregs.h header which is more suitable for this code.
> 
> Code moved verbatim.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/cpregs.h | 98 +++++++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu.h    | 91 -----------------------------------------
>   2 files changed, 98 insertions(+), 91 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

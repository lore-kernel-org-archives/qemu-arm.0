Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3851514wrm;
        Mon, 7 Oct 2019 07:15:09 -0700 (PDT)
X-Received: by 2002:a0d:e255:: with SMTP id l82mr20808012ywe.269.1570457709559;
        Mon, 07 Oct 2019 07:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570457709; cv=none;
        d=google.com; s=arc-20160816;
        b=RnnCz5JayhivbpsyLjnNdjeE4vH6/zVmtyCnalyRd5wvk4KF2mNImiDowDDjqdW/GU
         EvSb4Ktg8YDM2gemo+1KnWT5wGiKnMBn8vRBDb79ywJnvNc0OEz5PW7e/H+H4k7v/zPp
         bt0weNEcMyvS2SIMxipjkvbYyRJcSXv3PfNYa00JZQyjTxOxFic7WXgg2DIPM3mU2Bfk
         VJq3769HfJvSoXeIdrLP7msgnZcLw6XQlpFWHQ2bn7fqG4SHJtya4MNfe3tFlKh7ot8v
         Rnx6lewsuzZ0ILR9bOtBlXHO41shOfgRL+U+w1VFLBeh8M6hIv5mgCYznglP0K9BqxOj
         G1Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=KRgBJxZK6iBuT/CcMbiDw89iBtp15koM2kwiNVbKbXI=;
        b=JcYaSvtzlYI1p+SXA4G9Fb/iPQVHPnsYbdG/JJrZ3FTfn9cq97tRtSImX7QISGoJjC
         jtgiuryjXCsaMwCNMtP6FgINTLhkc5+G3Gl90YqoTkDAPVTX1m+VPTJe2PeYJHbznTY3
         zgbevNDunoH6bkTAez2jhyySNEKgZHGkKAhZuSaVxdJB6n7VXj7zaeb9JdZU2jvBtEFj
         YeGV/Cwcwkf7DwENwyq+AmfD1LErktY5W5XrTvNSEwXnS8dsSQKW2EmSjfM/N/q/oZPT
         cIVpaA3DaY1UCLO5vdji1MV4CgVxT2A6MXR2LpmWdEMsfYgpPC/YCWf4RrTV0YbYq7ls
         40Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Blht6MNz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p9sor8258457ywb.101.2019.10.07.07.15.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 07 Oct 2019 07:15:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Blht6MNz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KRgBJxZK6iBuT/CcMbiDw89iBtp15koM2kwiNVbKbXI=;
        b=Blht6MNzjupd2wjA8M2Uzlk/eL2n8lqg6xeaAglWnCRkl/67mDvRUeFMi+EJliJAtX
         UVMFnvZ3jsTyNrWbgsCzmWlHbgjBGa2wALWQZ3nu+oXoMRi6s7QJ+MYPAkHfYKUF4wE+
         gSjazYV3FKMShG80BzyRPyKfj51R8SrgFAc9qMM1CAG1dKBNq7uU+DVqNxyhaeX8pDpw
         mT3i3bddrC9dSipRKwXPJU0JzrodMuxnTWnXGJrbdO06GV7ISow8SbPMuNgjBN1u/zw5
         oq0ckSdw9vFxF3KlgZ6pY/4XJpawz94zFrHUZXT3Ugl/0FS0XEXVvrw0IqfQ6etRSA/H
         xwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KRgBJxZK6iBuT/CcMbiDw89iBtp15koM2kwiNVbKbXI=;
        b=MIQYLhpfdR4CxKSxotuLA70JnGfs3M73iAln7tnTYZLM4mj1L/qwKufvivQb4/aD0H
         IKSK+RiwEh/hPfr4Ond8VFkujfwZO3CkMlvxWtKci2cfJ5jv3rVRJFFDJmO80LIusC4U
         Po18vN1s5i7xgUa2w3aIdD5Qk/xHnleODpAnBxMSa/1pE2xvvCkn3uU6V7ulcOUpLsBK
         E803mvLfE4w/+d7R9W7A1ytTPWqFgm6dloxB4lw85myTIX+Q+hWp5BP4wugiQdeASuKI
         SXkUXMsBEvbA5ichAd2Paw34hM6Q0PX+1swq5oGPxWnFNTjLuL+gLgkzNERD6VzhhZP9
         GfPw==
X-Gm-Message-State: APjAAAWTJukRDhnH1Pv/tpiD/CJpNSRJJZSZsyFjzE9DxmNLsejXouWG
	PvM8wsPpdbnCerCRXNh3kpHPKlPdlJ5dOQ==
X-Google-Smtp-Source: APXvYqwXWYxIrxHayNdUv/4cVr7d0Y/MFUcC3ITtz4dUddTzngC6czuB4SjZCyHCkgmdfGzi3Oy4aw==
X-Received: by 2002:a81:3c81:: with SMTP id j123mr19838806ywa.393.1570457708770;
        Mon, 07 Oct 2019 07:15:08 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
        by smtp.gmail.com with ESMTPSA id u69sm4108700ywu.93.2019.10.07.07.15.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 07:15:08 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 07/15] target/arm/arm-semi: Factor out
 implementation of SYS_CLOSE
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
 <20190916141544.17540-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9c71ae7c-fed1-d48c-2114-30177511246d@linaro.org>
Date: Mon, 7 Oct 2019 10:15:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916141544.17540-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: I5+6pEXR10Hv

On 9/16/19 7:15 AM, Peter Maydell wrote:
> Currently for the semihosting calls which take a file descriptor
> (SYS_CLOSE, SYS_WRITE, SYS_READ, SYS_ISTTY, SYS_SEEK, SYS_FLEN)
> we have effectively two implementations, one for real host files
> and one for when we indirect via the gdbstub. We want to add a
> third one to deal with the magic :semihosting-features file.
> 
> Instead of having a three-way if statement in each of these
> cases, factor out the implementation of the calls to separate
> functions which we dispatch to via function pointers selected
> via the GuestFDType for the guest fd.
> 
> In this commit, we set up the framework for the dispatch,
> and convert the SYS_CLOSE call to use it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/arm-semi.c | 44 ++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 37 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

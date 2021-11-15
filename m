Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5728579lfk;
        Mon, 15 Nov 2021 03:38:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPioZtecuz09ZU4OfBJcT0Ge9DVfjSx5GC/N3DamGzZwNRPqKqXttP9KowuRfmHSeD7JYU
X-Received: by 2002:a05:6000:1aca:: with SMTP id i10mr46258776wry.407.1636976323150;
        Mon, 15 Nov 2021 03:38:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636976323; cv=none;
        d=google.com; s=arc-20160816;
        b=nvmdSOOSWcQO6qgo9NZ3Krr8td2fkUPNOU3BA3PQGsAsO2kRdDCf+G+1+Wn36QMIDY
         hJjPIjjNE90A+dJ2wjcBYCQupkc4twqqq0/w1biABRmzzKrWn8qWSInSLSwcSiHlyfij
         sa/oZoy8qPLXlxF+/NmZnmPo/uKhalZkOFXJxNXFexcDI53QL686uNuCRo64KGjOfBcF
         mCh3oI2rKInAaKL9chqxE2XDlMGzBTbRGtetl7IK+USD1lQlmVkYuvkZbbszgRuKQoYR
         9vssYUZxYWIhwd/PNSji0g6n/8xDZaIAK9dc6TZ7Tj3cmsNdND+ZY5ZMaUWS8GdJpQFC
         QDEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=qoELmo14GgEUYghjhV24xekVd9qq25rnCzgb10egx9I=;
        b=s8muQdMR2VCptEall7xxOG/WdenwQUw6LimRHbndY+0Cws/ClXffnkHsPYdAR8ZohC
         g32eNuH/KhBUTvZFCr08gnKOA//BweClDknajDVkRVNORRXHDRU1qZd0YdR5avV8lclw
         br6UpY2LZmL+3/W0xizQeeEy95er6Hgt7thNaem/hz3bHhH1y7AGMRgjQ1pFHJNajUhy
         jK6AfxHyOiimGqmPucAO23A/DqD3sBs2/g/blFXU5mnk8BEypZIsPJ/yMv7S1XA8+h2k
         PR8iSjQ4AS65TafgSVSf/gmAC8cR6hqQNa3C0Qg3bp4CXlEkp6aumb/NHMnoZdLFMEmw
         u0Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Return-Path: <agraf@csgraf.de>
Received: from zulu616.server4you.de (mail.csgraf.de. [85.25.223.15])
        by mx.google.com with ESMTP id f11si14225294wrm.119.2021.11.15.03.38.42;
        Mon, 15 Nov 2021 03:38:43 -0800 (PST)
Received-SPF: pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) client-ip=85.25.223.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Received: from [10.95.147.162] (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
	by csgraf.de (Postfix) with ESMTPSA id F1DF36080381;
	Mon, 15 Nov 2021 12:38:41 +0100 (CET)
Message-ID: <67c00a6a-e50a-3ea6-ef1d-98494fdbd729@csgraf.de>
Date: Mon, 15 Nov 2021 12:38:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH] arm: Don't remove EL3 exposure for SMC conduit
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Andrei Warkentin <andrey.warkentin@gmail.com>
References: <CAFEAcA8vRNC8RTAAxgYzZsGdqGfzDSr3m0UXmeZoF115z=6N3Q@mail.gmail.com>
 <8639608F-1685-48B8-B965-255D30B213F8@csgraf.de>
 <CAFEAcA_SzCtyDJfnJLLT57Xuf-TdJHRLEW00E7tQkdresxokMg@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <CAFEAcA_SzCtyDJfnJLLT57Xuf-TdJHRLEW00E7tQkdresxokMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: lRKZiUenxUa2


On 15.11.21 11:46, Peter Maydell wrote:
> On Sun, 14 Nov 2021 at 17:41, Alexander Graf <agraf@csgraf.de> wrote:
>>
>>
>>> Am 14.11.2021 um 18:20 schrieb Peter Maydell <peter.maydell@linaro.org>:
>>> This is tricky, because we use the cpu->isar values to determine whether
>>> we should be emulating things. So this change means we now create an
>>> inconsistent CPU which in some ways claims to have EL3 (the ISAR ID
>>> bits say so) and in some ways does not (the ARM_FEATURE_EL3 flag is
>>> unset), and depending on which of the two "do we have EL3?" methods
>>> any bit of the TCG code is using will give different results...
>> Do you think it would be sufficient to go through all readers of the isar bits and guard them behind an ARM_FEATURE_EL3 check in addition? I'll be happy to do so then! :)
> That would be a big reverse-course on a design choice we made that
> the preference is to look at the ID registers and phase out the
> use of ARM_FEATURE bits where possible.


I'm open to alternatives. As it stands, we're lying to the guest because 
we tell it "SMC is not available" but ask it to call SMC for PSCI, which 
is bad too.


Alex


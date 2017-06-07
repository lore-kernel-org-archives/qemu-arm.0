Received: by 10.25.0.23 with SMTP id 23csp2194927lfa;
        Wed, 7 Jun 2017 10:24:05 -0700 (PDT)
X-Received: by 10.223.160.68 with SMTP id l4mr25089154wrl.130.1496856245625;
        Wed, 07 Jun 2017 10:24:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496856245; cv=none;
        d=google.com; s=arc-20160816;
        b=RDkwyTohiKVDpqijAnd4w/gXnBZG2PhcBrmffnv1SLjc9WidM8LdnWxHfBnyxNWrx5
         xSO4bz3P+Aqk+ZUIsaAGl5ARIF+kntOJKbmTqlrPA+KH85Ah9W9wLrtM9zQMhHMQFcn5
         7pk7SlHCSfBeQVWJP0wFyqq0ysEVhIyA+d5RAJPvshro/i97dinipJ8RIXljv2P9AXsc
         Ival08Ll5GaWtfMDieBRXe4Q61HcKvR8PG3uL+P+iGtCsVc8MaDBotyZ50ELMymYT09q
         BKTV50ADy5RMpnaB01z7xyVQ6fEV2JBbKH44kHbT0n5Te/Fkyn975b1h8JREVkLTjAka
         ZQ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=J2XLqapVhXqG75C32e05msW6TJckGRlQStvS/FY5b94=;
        b=RpODNpElaeEAPxzkO+6LpUsHO4RHi23HbqVVu9vlFmPOmYKZCX1PDhbT6BEgHZSzfd
         zHE9xk2mh3NhbPRvOgEzgZCbp+XQFQUXuuVDmBSZ51b9X7/EI9ucfO5k3pVxHyF96bh2
         ILenqs17YAR0yB8i7UQwWDRrG8wYfZgP+q++J9kX3DfulRCZDOwmwt6KUzsb+RAulEUg
         ZRK/304m8jPuCwPyCAhy31DwilOkDBb/afM+tQXta6e/pjSIgr9GtLV6M3EWVco30yMs
         cUzMHXbrizJnvMs0meOV4PyATjRfh+7Zp+WDhLqgWDaup9OcGUmUsQjZMTScmgHtv9YW
         arsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a80sor423293wmi.31.2017.06.07.10.24.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 Jun 2017 10:24:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=J2XLqapVhXqG75C32e05msW6TJckGRlQStvS/FY5b94=;
        b=c1RoQsS7oAIIcEZedUkQytKeoNxXvyRgnqFkXzupSIENU2pnHTPTcOIbybQz0BwZII
         Ju9A0nGKIfVAqVHmHHOQA/8TqyIxw5EGeH31QtyqgZtQsMy+yE6xP1NaTvNIU4EbJowL
         0nMpmns1Gjo6tcGvblQVAuqhb9L0d52t8q3hI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=J2XLqapVhXqG75C32e05msW6TJckGRlQStvS/FY5b94=;
        b=Uh1z/8d3W3+rqkzkVH9zB1lpk2WETCcUTZT4up9HhYljWVP5qqOMdGaRcxtRWzsab2
         p/VcVk58+HejEwLIdC9RpIQ8QnRVOMB9KBtgTR+bxH0u+Whi82AkeS+RAltnZdMbg4aA
         QK3YoCfG26lBgQtMJmDtNK6Jg261fqZB/oFf79JQcQZvWLBg/+fUb6cDHIV/o6VcXEIx
         KV8JN1b/WNvL3JUacrqPLVbaxRqR3YpnWnQ7pa6YOQG4i88Qu7W/tIMw6b60KzTb+g9z
         ORZ2Uy2IZg28WcWHkMGQHa7/8nQBDNmcxDaq5mMatZObGIggD9tvw/bVDnvT8yPc1fJZ
         Dw1A==
X-Gm-Message-State: AODbwcACxqrtz+6NC/5O/t5jjjvYHxF/NTonJYiOmjELJ21mLlodgtcS
	qWLC7N7aE9qpJ3/F9vRZfdZMUilo0MvMRq6Ayg==
X-Received: by 10.28.230.153 with SMTP id e25mr490140wmi.41.1496856244372;
 Wed, 07 Jun 2017 10:24:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.55 with HTTP; Wed, 7 Jun 2017 10:23:43 -0700 (PDT)
In-Reply-To: <87a85jdbd1.fsf@linaro.org>
References: <1496849369-30282-1-git-send-email-peter.maydell@linaro.org> <87a85jdbd1.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Jun 2017 18:23:43 +0100
Message-ID: <CAFEAcA-YQBLJJvAcN82N1BTVsC-rQP2kZ1ccvCv9z48x+XPKUA@mail.gmail.com>
Subject: Re: [PATCH] arm_gicv3: Fix ICC_BPR1 reset value when EL3 not implemented
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: IReawjP820Bp

On 7 June 2017 at 17:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> If EL3 is not implemented (ie only one security state) then the
>> one and only ICC_BPR1 register behaves like the Non-secure
>> ICC_BPR1 in an EL3-present configuration. In particular, its
>> reset value is GIC_MIN_BPR_NS, not GIC_MIN_BPR.
>>
>> Correct the erroneous reset value; this fixes a problem where
>> we might hit the assert added in commit a89ff39ee901.
>>
>> Reported-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Thanks; applied to master as a fix for an assertion failure
(still not sure why I don't see it).

-- PMM

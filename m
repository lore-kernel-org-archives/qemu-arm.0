Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4960730wre;
        Wed, 30 May 2018 09:58:29 -0700 (PDT)
X-Received: by 2002:adf:965a:: with SMTP id c26-v6mr2761974wra.197.1527699509811;
        Wed, 30 May 2018 09:58:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527699509; cv=none;
        d=google.com; s=arc-20160816;
        b=zFMuulUbQtnB1k8uomiipcP0sbPo8P73E4gbDGOvvvF04NWe55B9GAOapMriq2T6a6
         eZjjZ2N7tjVoYtY/VooDBPKlauLKgRBz87Io7I50iMpO/EElYNWMcCxlDDIbeSc+Z9Xd
         qCwdddL9hgezNooFlRhQI7c9/ki+UeaCfGHq56TTAnit0XppoAwDZT0wLLLssKYIyCsx
         44halx5MJC7LlNm/HL6F8+BwLeZ08TeiWh3p/qiP+6ayMie1vCZTcWm+8MN6oALnmioQ
         R+/R8eVK1k84i8rMJgH2KhEpgRsohFNxWqmGgnnUyveFcOsDqUoey+u4C0C4TQYaFoWv
         WJVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :arc-authentication-results;
        bh=BlgNXk7XCLAIHSxNqPC5WoWrFCFIruKK82O+22yYs2M=;
        b=nKFwVtDIqmDbhnFHlXJfaaXeCVkafVLbcnGtJfSlgpuJr8d4sZBbanV6Zu0NUwWZX/
         vj4HNz9DDMz/qxUU8uOrERnuL9HZZVN4zK+pmJFV5DgYqqMgkF2Lh24ARdTtwEB+MXer
         9+xnG2GWQy7LCyTT/RdJ71VM5aG4lOhwgTkQwV4v3D0KF1bs3FpvtngGbdXe5VcNfYqc
         MPBNbOCkxuXO2rWUO5R/EzwDQzB4NJk1bUYYO5pxF2nfrHf6RhO7iiU4YF/xeKm5Y8U/
         JqDS5XYMS9FOzOn1xyZPgp00UcMZN9sLWL5HgTKcTJrAgrAmF6Ed4K017o1MhFfRXyyW
         ibDA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m82-v6sor5904651wmh.23.2018.05.30.09.58.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 May 2018 09:58:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BlgNXk7XCLAIHSxNqPC5WoWrFCFIruKK82O+22yYs2M=;
        b=JTv9oEX4vGvLbw1Ko12ZnOpdIVEgDkmez4P2LAw8tlvEhewQjY6JbHJCDZSxmY1Lox
         mZ5mxZsh0iH6UNx7Yib7KggjNHCT2DYjRApY79E5BvOZ581ToS0aSkwlwmh0DLgCTVei
         ZPLS70OGY4n0KH7RJHo8eMvNdWYYcwBqt+XrfFqPUUQyDshvD4V5FLCK6xdKZyMevPLv
         D7vD0Mkd1VRN6hsHYre1CajAGZCHKUZMPGNlbsltLtJjd5wz0ErCB5VcnCwmTjDx1K1Q
         lzMRV3MNyuB0vrO1YMZo5L5XKvRMalntAWkTRCOp6o/PHwcXzzPxXcJhGE3IMpm2Yjs6
         QPfQ==
X-Gm-Message-State: ALKqPwcsKgCyfAQli0f3C6m+Oxr7DlAnsrQUr9MMk4QM7fOLmRKp0FHl
	3XSFXPzPSK2mjypxRxYVdjkKHg==
X-Google-Smtp-Source: ADUXVKLP7rn/5LDG8Xg+ziQ72uOqSq+SBLna1qCcaiw30kbpYt18HieFzPm76t9NHkJwO5xQbx+6Gg==
X-Received: by 2002:a1c:1047:: with SMTP id 68-v6mr2014711wmq.132.1527699509518;
        Wed, 30 May 2018 09:58:29 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from [192.168.10.165] (dynamic-adsl-78-12-189-60.clienti.tiscali.it. [78.12.189.60])
        by smtp.gmail.com with ESMTPSA id 69-v6sm24746976wmi.29.2018.05.30.09.58.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 May 2018 09:58:28 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH 00/27] iommu: support txattrs, support TCG
 execution, implement TZ MPC
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, patches@linaro.org
References: <20180521140402.23318-1-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <87a9fff7-0a53-6b52-eb2c-e721556cf87b@redhat.com>
Date: Wed, 30 May 2018 18:58:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180521140402.23318-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: CQRbPZAHhaqP

On 21/05/2018 16:03, Peter Maydell wrote:
> This patchset is a rather large one, but the first half is all
> fairly simple plumbing. It does four things:
>  * support IOMMUs that are aware of memory transaction attributes and
>    may generate different translations for different attributes
>  * support TCG execution out of memory which is behind an IOMMU
>  * implement the Arm TrustZone Memory Protection Controller
>    (which needs both the above features in the IOMMU core code)
>  * use the MPC in the mps2-an505 board

Go ahead and apply it through the ARM tree.  Thanks!

Paolo

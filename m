Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2126877lfc;
        Sun, 15 Mar 2020 13:19:48 -0700 (PDT)
X-Received: by 2002:a17:902:7043:: with SMTP id h3mr22898937plt.207.1584303588674;
        Sun, 15 Mar 2020 13:19:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584303588; cv=none;
        d=google.com; s=arc-20160816;
        b=px0rINu6RXku+3obgcZfCvqyKjh/i9t8YF31WoX5HijWQ9n2qeduq85o+olGSRveI/
         Q3iAGu57EeNdMMS4uzepWeRQKkw05H6RndjvV8/WUZ44jnw+nKIsu//nE7EMCaro53V+
         liBp0bTVFrwC1Mex/xTJYpD1juUT5A/hSwPkBT8kjYorWU6bUYer/ZTms8DQaCe0+8zO
         nV40639bbP14RsmqS/0OmGKstwdd8mLrv9s/fsNy+eVhITkBRXEZhzAm1wnLk9CAGjmc
         Dgg485OVLAD3SgpLlKG2ljRNxSeRq/MHPUf/fDlwVKt9WdzOCsozKjXrduHT6X0R2Ylm
         jpLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=rgAzwP1RNdbzF19h1Tajq+qOWbKSzm/2QF2DRk4/VSA=;
        b=G6ZMwC8dSYJ1M4eeYgl5xAJppHiwJdHc5f5p6ofhtemGZOLJ3LhIgngEld/woM1P76
         FWEc3W7mdi/qNxZkexjF5G10C61sD1Gz8xWaF4Tnd7Thq+6FvOWnDSEVcpQ6ff/KBBmz
         Z1e3gS1tGcgNP9ctYdc2LPmyWwGVwgI0+CtCAdYUnnmEDJkh9qdZmZF/C+Ngohe5k0yQ
         jPI/KCTvT6ErUGQhFbxA/heCeu2LOzX65nv2BvnLtrlAEPSqv0wbCR1aFn+vR3zQ6MYf
         R6WcEjfH8izhJii8mSX1Wj6Ha1dr0Sj1beFcVy40I1Ih6inzm8IoaDDm1388dHSqZcBM
         rgeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HM0vAKAC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v7sor18014214pfb.47.2020.03.15.13.19.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 15 Mar 2020 13:19:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HM0vAKAC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rgAzwP1RNdbzF19h1Tajq+qOWbKSzm/2QF2DRk4/VSA=;
        b=HM0vAKACykr+cRWDfm0nJRMCVT/PRe2cnmJKHIYjmgwjXKlFAL3QF/EIrkPE98mKrY
         oNSVVRBtizAqBwSG/1Ov1R3JxP/B9UP5FtPpQc64sDDBZ6Bbu0dcQOQVNuoeGVR819nR
         40R6TIpNaJu35M5EWJZrTGvgGmHzwEJrxHr/riKasCmJ5qN3FLl4VfOeaBzlqCGFoh0R
         S/gutPjWU9tLvTA6wXQdUtkfqlJQa53716Fo1ogQbfna/0ZGhgTL6+5hxjnbtXx8/fRr
         4RbOpykM/Di10FWpb+DVx8cDeyqXv5lKDwTafABSW0j0+qYPUuOOOK2PvnbA45H9gB1t
         BkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rgAzwP1RNdbzF19h1Tajq+qOWbKSzm/2QF2DRk4/VSA=;
        b=V6Y+fwrJG19tU18TufSkTqgac5bOnnnFZWWlaFP0aIAzjDErjcy8ysl9vZb7QbT+BM
         T2i1B7U12eWEsda8qg01YoDgs891vqbu2N88PJNAEaI/nyQoWu7Sd/G6QMMCkqgAYVv4
         86eHo+O+P97Elb64GEiEjmg/PVWJQF6dnSCXGeijJvNoIV6JmKiOBPPxBITZdse5ie2n
         ULBUahb4AS02egjjMRiSeU38UAyBEayNjbO1dPVBHXqkktBr2tG2jrHcSd2NNS6JLD49
         WC2VkJa5+9+KsOn1mA0WzshBeP21SN1hQ/KrdZpnUqjQCDk1S2hNrscCpFLpqObRJBSV
         ry+g==
X-Gm-Message-State: ANhLgQ1TvsVppoX3PRvshvQr9/2KpDZcfRnSeyyJjp9rYrP2n/yj2T8Y
	P3vt+V55v2YmtZ/cAfxDTdymMWj8
X-Google-Smtp-Source: ADFU+vs6JkeiTZmfEUpTqoxA9cFlC+QBG6k/LOz3q4+6Qo1BH6dI+qUP2CmFNpJGYeSEMpg1XHZQrA==
X-Received: by 2002:a63:7c1d:: with SMTP id x29mr22588491pgc.197.1584303588218;
        Sun, 15 Mar 2020 13:19:48 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id 8sm25288960pfp.67.2020.03.15.13.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2020 13:19:47 -0700 (PDT)
Subject: Re: [PATCH 08/14] exec: Assert CPU migration is not used on user-only
 build
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-9-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c61d62a5-ceca-745d-ed60-78719955912a@linaro.org>
Date: Sun, 15 Mar 2020 13:19:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-9-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: azoJIsm4FaMN

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  exec.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

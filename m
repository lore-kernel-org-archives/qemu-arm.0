Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1390842wrt;
        Thu, 13 Dec 2018 15:10:14 -0800 (PST)
X-Received: by 2002:a9d:1d29:: with SMTP id m38mr538839otm.264.1544742614233;
        Thu, 13 Dec 2018 15:10:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544742614; cv=none;
        d=google.com; s=arc-20160816;
        b=uO4JwIw4Eiwa1Otptn3AxCFG4qY+JLcE40g8JTGN6aYBTlXeqGHJdtT9BN2crrZeXE
         1dXS/BOnoeZWM+18UD4MeyE45I+KeQf4qEjqRMGhdFdTyASe0NhX7xrdP8jr3gCA+ev+
         GNlJLnGO95A3y8XJdpvL7XndzKrsMtCK8lc/YfcWpN3fDA3ZlWvOBUezB/OLqy0xUpp6
         vKmBBB6ydriSuSEKmUTNLZW8QrxVeepOlKdHLOA+Koe99TiAfU5rdd0DQ5jx75Nu4PMR
         K0AlKfIjLFh8immHXg8dbYUvm4LiyG4zkoD3e6OVMvPbW4haa2Mor8kNz5V/4jDXcBoh
         q1AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=7tpX34cSXtDT36Hp0d+pucZq1wxX4M8veV+/ZUJLGaE=;
        b=DtwE3BrFN9gyqcTj7Y9BJ+rP669KSjejcBaqS7kPInj+9usP6jqHnjCrYCYqQPhoEl
         uXGFlHa3aNBaks59y8ba4tpe2L+KLNZ2XrEl4fcMRgxg42arEUaDEiB7GgfHw80D87Vy
         jcDsQ7nkCSGRgJ43PJawzX8K+QKJqX7NH2FoVoxy3mdtqjR3zqTnrHEjSgSajYPAaZzW
         oCKfjcq9yIPdFryOiUMw5DYM6w3DxNvipkmDp2qtgRoZZkCFjdbLOwAh26Ey7fLJZGwc
         /wwGCv1ZLXhv5gVppU4QUIa0VJASqHHGJG8hfQ3Hs2wRaDUbJxgM6QO6u2z9huR492CN
         ZA/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HViTM7EU;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a74sor1753771oib.74.2018.12.13.15.10.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 13 Dec 2018 15:10:14 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HViTM7EU;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7tpX34cSXtDT36Hp0d+pucZq1wxX4M8veV+/ZUJLGaE=;
        b=HViTM7EU4R0lhdg3ZE8ZakI//g0NJErOlvtoqX3isp9pAHkxc9h8kPDzVMyKAwx5nq
         XnnDBEz0CqLQXMZ1CxNl26y6oaL06phV8KWZQvDuNTxl49kBm4BhwM7GNYd77dVUbvmQ
         qUmOX4PytA+mBftfuNwqgE3e5QurQt8Yh+GOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7tpX34cSXtDT36Hp0d+pucZq1wxX4M8veV+/ZUJLGaE=;
        b=EOjHq3nh9VUXij/Cx1d0Gepur2cq/f+McKPwGc/vpEnmp8qFYWQIHCGCh5b86ptV9U
         hg8wJp/pgjzTVwxELOwkuXqaTY+HY+nvf4vXiS5TDDxIRzmaMSUovBhaOKP90FCWggeP
         v3CAL+K7n992jqkat9inK+d4tLuNPxBWBlQs9jWm/uWykcHmbA3h0adURmeHTOTpgCIy
         oSRJuUFIpCn8S6GmTlYSeWvTw1aIoaduSJSpWVW/nhMpDlJRPHAvzrT64UpDLel16Hvu
         PoNCL96xA5IzqYndQOFTeFtkscqkdP4mohtXLm0wqrJ7DoyjQ7/NEnj05GzrdBaCYp4t
         q5ig==
X-Gm-Message-State: AA+aEWbEpbDBcv3CONEAM+ILAJO9HbSkbCBwjnROVBPrldpQaoJcrYzP
	r2abZAv2+i05xTaDErIWviDmTQlamwdKIw==
X-Google-Smtp-Source: AFSGD/W4/y6dqtDG8XXiL1RtKOIC1gh0d7ROR9JlGFstPz6En8ym4YCQ53L9/9K8ZNni8b2jvhwU0A==
X-Received: by 2002:aca:af53:: with SMTP id y80mr476294oie.170.1544742613731;
        Thu, 13 Dec 2018 15:10:13 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net ([187.217.227.243])
        by smtp.gmail.com with ESMTPSA id s66sm2627410oia.55.2018.12.13.15.10.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Dec 2018 15:10:13 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v1 2/2] target/arm: defer setting up of
 aarch64 gdb until arm_cpu_realize
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: mark.rutland@arm.com, Peter Maydell <peter.maydell@linaro.org>,
 Omair Javaid <omair.javaid@linaro.org>, ard.biesheuvel@linaro.org,
 qemu-arm@nongnu.org
References: <20181213115503.24188-1-alex.bennee@linaro.org>
 <20181213115503.24188-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <46dd9943-1d30-ed87-d68b-8f501b7ac8fd@linaro.org>
Date: Thu, 13 Dec 2018 17:10:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181213115503.24188-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 9lN/khC0/cFe

On 12/13/18 5:55 AM, Alex Bennée wrote:
> If we setup earlier we miss the parsing of the aarch64 state of the
> CPU. If the user has booted up with:
> 
>   qemu-system-aarch64 -cpu host,aarch64=off -enable-kvm
> 
> we end up presenting an aarch64 view of the world via the gdbstub and
> hilarity ensues.
> 
> Reported-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Omair Javaid <omair.javaid@linaro.org>
> ---
>  include/hw/arm/arm.h |  2 ++
>  target/arm/cpu.c     |  4 ++++
>  target/arm/cpu64.c   | 20 +++++++++++++++-----
>  3 files changed, 21 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

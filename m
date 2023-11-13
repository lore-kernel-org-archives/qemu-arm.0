Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1528361ejc;
        Mon, 13 Nov 2023 10:18:10 -0800 (PST)
X-Received: by 2002:a17:903:244a:b0:1cc:5b2a:2f33 with SMTP id l10-20020a170903244a00b001cc5b2a2f33mr405142pls.43.1699899490662;
        Mon, 13 Nov 2023 10:18:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699899490; cv=none;
        d=google.com; s=arc-20160816;
        b=DbZDUyAiYSEDkuUpRB2aMFb4/yHNszy3EoPTkHVw3+6vAkxLtTZ/93hVpha3HQ1ku4
         X0pC8LNi9N2CQxZm1QPZOEMw9+Wzi9E5MZTIelfPUDvaKYZuYmHWhwlaPPOJjKgCNSYX
         oyrTleEYngq+Jqltt1bSPE7LnxPI4qBQJIq4qXMbUYy9FTK/v6BAzCjnP4SeLSPyP9An
         dJt0Je4mVOGuqCHBgGsrJSqF4Y3IR37Ms3E5yP6bDEomjeinsbvEvKi6KR5tctrY15gA
         U8brbBCKOOgjEPYkTlaAyVByEpTJ27Wx5C5KCZ1N50XgOqRnUYpFlogcPj//ryeaI3ms
         7vrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=cUZHYtdDAzSjFTXLnaas09EEkDjSU/8RG04d1d7Vlz8=;
        fh=qTJptX6Yz3bMzLkwnCsSGl3LtT5PLyKYt6lpdUOfQog=;
        b=oCMCQtfUo0fYybIv3dyrchVUX9KR2L+Vqywe/eaiyZZ5fRLt7wPMVD2CO/wT49hXZ5
         1EQBMDHQ6XgVAcIfcQ4UCHBCp2GJE683AJ79h6GfhCB/CLp0FbtC4qeiEu2FFXK0JeNP
         sZ9OGQjNWEpIOR+9JNi/W9ra7gxEReomUS5sjtbiQ7GpV0EZkFJLt2Ca2+NxpFBeZ28O
         OncI1M9Ciw1nW8V8NFs+3VXGrCylaovJrZaZBZ1Q/4MKu312V0dQWEZuLydJiE6HBwM6
         L1XdpGBVcmPgUrNcy8WfescmtIbefBm5K3i4XuPnE/yagKi364KHgv6ULADRZFdqVl4V
         wqlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RXdRk2Vn;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g9-20020a170902c38900b001c5bae148e7sor175766plg.5.2023.11.13.10.18.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2023 10:18:10 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RXdRk2Vn;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699899490; x=1700504290; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cUZHYtdDAzSjFTXLnaas09EEkDjSU/8RG04d1d7Vlz8=;
        b=RXdRk2VnHLGn3VkYa3Bswh5v0Fg6Rvj/nEez1CWUaf3JLoBYImWX5hOvLLQCj0iMbX
         KNTB/0RaS9QkIKXftkaYzjGE8UBf4PSgmB5V6DVlmmPwv2sMkSP0OKWhr1LDpdYqBKsw
         hygq6EIDaxPMayrnsV6YhzZwHY8QcsQxRAvwrgjYuFjAoWqSjay+mvLqEU5zeNx0EgHH
         TAwNxfNzqaRFWXURZUG9EmHWXgx/WnNKcwwioO2tsUqAbOhRxr9RzyWuf0l267w4/yfY
         2hvWNngDelcd605Xh6AZluZ2ihILJ+LbVS52XMdZPBKtOVn3tCeUEhgxL0Hm2bP3ff+e
         VKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699899490; x=1700504290;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cUZHYtdDAzSjFTXLnaas09EEkDjSU/8RG04d1d7Vlz8=;
        b=CzpWW0/8aITwAmxnMWzu73KJ33k6Z4/72p0ISH4qpVT67nLfqZe6POplKBScsQIHS+
         Zkw4DjRuH8BTeounCrLkLj78vqWUo7j7FNG65JeVMk8LLE0mGOAhLJqt6rY3B/RW1HRw
         WZ7v3Fd0U/r9xVYl9vhNzsSDMFNisuygnc5rsGIWk4DTl6AvvOFzpftNraCunDJq1cOq
         1NMkyr2DtG8MV6m6yog8LgSZgAO7eJsT55z9j2DZ+5Al8Wb4Q/Q1MKPiZb0GT9xNXaPg
         DkGUJhbKd1Q+nLT154OLmaiJAHtI96C8PTLjZALQWu17c1t8dJMAdGfWNOBjQEBI2ebT
         9ARA==
X-Gm-Message-State: AOJu0Yz2PGRKPA+DAI7sMHZ7ITsV581vXRuSE7gF6twXL5JBZDFN1oHN
	tFffGvKJi2cC5RKlq+8mW33US+iR
X-Google-Smtp-Source: AGHT+IFJSWU0EbEsWYs25C8piGyK3+q/+cqma/6uQPpfrlrJMZSyxnmKER/5e0gBjmHmts16wFp5ww==
X-Received: by 2002:a17:90b:1a92:b0:280:bb7:9fa0 with SMTP id ng18-20020a17090b1a9200b002800bb79fa0mr5083402pjb.43.1699899490100;
        Mon, 13 Nov 2023 10:18:10 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.149.95])
        by smtp.gmail.com with ESMTPSA id ju10-20020a170903428a00b001c59f23a3fesm4142792plb.251.2023.11.13.10.18.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 10:18:09 -0800 (PST)
Message-ID: <ed177c44-6a59-493c-9010-1d534b0109bd@linaro.org>
Date: Mon, 13 Nov 2023 10:18:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 05/10] hw/xen: Use target-agnostic
 qemu_target_page_bits()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>
References: <20231113152114.47916-1-philmd@linaro.org>
 <20231113152114.47916-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231113152114.47916-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 5GpitwafVQQw

On 11/13/23 07:21, Philippe Mathieu-Daudé wrote:
> Instead of the target-specific TARGET_PAGE_BITS definition,
> use qemu_target_page_bits() which is target agnostic.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/xen/xen-hvm-common.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

Received: by 10.223.188.70 with SMTP id a6csp6086093wrh;
        Tue, 29 Aug 2017 08:03:43 -0700 (PDT)
X-Received: by 10.84.213.151 with SMTP id g23mr749166pli.285.1504019023214;
        Tue, 29 Aug 2017 08:03:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504019023; cv=none;
        d=google.com; s=arc-20160816;
        b=gzPnRiFRpUuCeAQB08awUwpxG1/lTWlKP1AiOvYlLWLi3/U2yt1agE1eTCdL1kohP+
         CXPZNaqa/OkEF0pZYI92A1WAtsGmChBpxOMgH4Iq228M/MEf3XS34QVvXeFWi0jO+uwc
         2tMSK2d0ZjWCUMeV8tiB5Am+HhbEnYnlxc4OQVjvk/dX5Ojt4yIBvqTy3EeIzWo1hdMn
         KEVAxZS2r8bDUbqLHENef1e6kXLWdJ3bmX7w3Zs2BYI0NugtOFM8Mr7GTKk2WpnizcTV
         WJp4emreR/MtqbMvtMBIGZquFC6Yu9bZFseXqhxANr2OU/5m2XGEN7dUpScwrY7hmGdX
         V4rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature:arc-authentication-results;
        bh=OtEDM/6KDcpI0YwzzJLiL5pla6GOa8b5egPWrLCFX4E=;
        b=mz6ax/2SYgNGqByQpr/cQ/McU9ksK6ChfWGbQRNeuKNEOcT9hSmUF0KPEvyen2lk1c
         /1fnG0u/irHhlCKAgZ4NZEr3rNtOqDTFClS7XIAU8aeSmgqwIzTYsrYBvRr7ZJszlqx1
         oDisSdCaB6Ni0lvjuIH342B9XKIafxYPAKW2HvG38r9qD3poQNcmSNKn3FklHs7SlPCo
         VhVB4nr8wd6ZLbiruaOgp3HBqg0Wk97vbnBiGUWxhOLC5n6n3K5uFu7pc9RV8nYOS2T9
         BXjbBHZsDM/zmegiMYJ2ARZqUefrp3nXBNIzJhr9C47b1hWnLew9i1df36EoBnHc29Ja
         bzjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ePMpQ46H;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o16sor1804827pfa.33.2017.08.29.08.03.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Aug 2017 08:03:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ePMpQ46H;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=OtEDM/6KDcpI0YwzzJLiL5pla6GOa8b5egPWrLCFX4E=;
        b=ePMpQ46Htn1RsDKT0XbzqcC/QNSAx/B6g1f+OCG2dVDLyiOjxMFsBGqzl7AsIrvmTa
         KiViLIz37O6gKXkMJkqkEQe52Lt2qaePZyiLhmWXhgqhzj8h8xywSwYELl8dgx0p4a69
         x/i8nro/I9JPgsiP3qsTUvSJWLNBh9ktmu6P0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OtEDM/6KDcpI0YwzzJLiL5pla6GOa8b5egPWrLCFX4E=;
        b=lj7D60xO9J5Prpr+fyypvBZU6a9oGhaD8cCLwiARA1qJt5G5zmDj+MIta0dlnT3u8z
         vVMaraeG0jCaTgx2BET+Tyr3bNwLEn/cJa7HPKe1Z0JMrNqQt6Pk2kVqEzqMn6ajsb3W
         7H1Ds/uRdkmSuAMWT9tQZXi8gSHsT6JG5uqbOLhGsNXRLsns/LUY4zk3EAEnExQCR7IA
         0lPtLsefGK3auoK90cAO5f06o0fKKY89lTzsms0J3OVzCqH/43+V7T2s7HNIbSfNqGGu
         4qobM6PaQNH9UAldgIzzeSZbNAq3Z9S0rtbE5BWBj0g/gwCw3bRX7+i045mc3A0zNOS5
         51Cw==
X-Gm-Message-State: AHYfb5gxjfoljXD2MzDonxM3SKYaA4d0QwjiSOW9RKfezFPnytGnEAM/
	mUvwzXP7ES/rpqdfmRA=
X-Received: by 10.98.196.152 with SMTP id h24mr627534pfk.43.1504019022685;
        Tue, 29 Aug 2017 08:03:42 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net. [97.126.108.236])
        by smtp.gmail.com with ESMTPSA id 23sm5187872pfh.183.2017.08.29.08.03.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Aug 2017 08:03:40 -0700 (PDT)
Subject: Re: [RFC v3 PATCH 5/5] tcg/softmmu: Increase size of TLB caches
To: Pranith Kumar <bobby.prani@gmail.com>, alex.bennee@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Claudio Fontana <claudio.fontana@huawei.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Alexander Graf <agraf@suse.de>,
 Stefan Weil <sw@weilnetz.de>, "open list:Overall" <qemu-devel@nongnu.org>,
 "open list:AArch64 target" <qemu-arm@nongnu.org>
References: <20170829063313.10237-1-bobby.prani@gmail.com>
 <20170829063313.10237-5-bobby.prani@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <125ae0ee-8104-5b52-6b4b-22622ba56191@linaro.org>
Date: Tue, 29 Aug 2017 08:03:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170829063313.10237-5-bobby.prani@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: /BKB4w5dE16E

On 08/28/2017 11:33 PM, Pranith Kumar wrote:
> +#if HOST_LONG_BITS == 32 && TARGET_LONG_BITS == 32
> +#define TCG_TARGET_TLB_MAX_INDEX_BITS 28
> +#else
> +#define TCG_TARGET_TLB_MAX_INDEX_BITS 27
> +#endif
> +

For the record, did it not work to actually write (32 - CPU_TLB_BITS)?  I'm not
fond of repeating the conditions that go into computing CPU_TLB_BITS.


r~

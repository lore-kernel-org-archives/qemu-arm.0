Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp704082wri;
        Wed, 6 Nov 2019 04:38:02 -0800 (PST)
X-Received: by 2002:a1c:f303:: with SMTP id q3mr2370841wmq.63.1573043882301;
        Wed, 06 Nov 2019 04:38:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573043882; cv=none;
        d=google.com; s=arc-20160816;
        b=J3TCZKyRjYzlqwHpT8KzNR7r+vqgCJEGXZ56KnN+N8iIotM6ip4f6vtrlpA8ra+X1J
         oNfHexFtHWcx2pmW0OW6NdE+0yuB3SkKRm2WFaEc/VqRgYdLg0fWeEuTzG2yP3a/9ipS
         ffwwSErXDE6rrtWUcq9cdzoZE+9PtaJTzdQ9i1PDUgsNXK8JFV/1orpOOVwNuh4F8qJI
         hsQ3D9M44P8YJMGFaWgESifG8alXhj2MbcH9zBpU8IsLXU4v5UqNHANE0JQdWZU2pyga
         /Mln+NcCLM/m7+UJhbO4nc+L1cBB1zN/Ny/oa+DaYyZbeTYecQ++2ZlkRipWXcXfCW5b
         7n1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=YOge0QqtcuIlddFRrjy7ps5JM5zsRKGYUfXqx3lLARs=;
        b=kK2bcQ6zc2vE062PKznATzHGwwH1X+Gy65luB3d1DesBJ7HjARtOnMqkTxyFGra2Hd
         QQBV4Hj0/0Tr8CctN2q6PEf+vUUfkP/SFZLjlMOsPvbfSO771+a1N8nw5yIAGfdzeXCv
         bA8+4gIzNB4TaQOIPa3rSOfRVpo8P35KamyOOqSqzYOAFupc0lddJvJBudabb7HRFF4k
         urercog9rvYfwKEILkBrcjTyjNxaXMTnVY6uHrQvcrsZzvMfqNR82elZS+tVJnZvYRAh
         rzTTWHE/8GDiNf9HkzwLQZF7zICYPljQgTJpXSLtHQb8gyLLYYYPgOpJ+p2RzR9L8Q3D
         XqaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sC4TXVpJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w8sor12466874wrc.35.2019.11.06.04.38.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 06 Nov 2019 04:38:02 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sC4TXVpJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YOge0QqtcuIlddFRrjy7ps5JM5zsRKGYUfXqx3lLARs=;
        b=sC4TXVpJ5b1BJBWCrlK4a+7PRDZyI4lap2vz/xRWxWuE7B8ntd98YEkuIijBY/fCYw
         tcfwKis3KfZuf+sWPCr7hXqoe5SPg5iK4+OHfDK7v1VXDfeSFpUl++dCS5GQXEQS5Dhl
         QbaQPGlsiWflYKgpO69mBk2BTM03h9cpnIIRxRQhC2UlSl8H//PkqlaXqb0R0R+3icGH
         X/1yNHwj1rK3yGuhLAnVQT+YFCoixP4W2AuyAjlC39cCvfN4IkQY2qocuaxxujdl/Gld
         yf5WCQ7W2bJ4FO66HdzrUYg0nI0XNQvX0x3XxlOkcMK+TgkxB8ObOBuP0mKMFgm2oKQd
         +/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YOge0QqtcuIlddFRrjy7ps5JM5zsRKGYUfXqx3lLARs=;
        b=uhKbX73qIBgKKd6EbmxsDk4TacW1gpVDdpbqdsX7SOv+ZJH+zY1Bt6KiGBZFo/kQTS
         2ovndZXutG7s0Ldd1kXTq96k9UsYIAa1anW5DZKn4SQ5eEbudsQfCR50ZARn7Uvpemgz
         IwixoHT48GvHuZXizoTgFFPTtL4E9N05DRcTJVIC62/5PKwJqJI/oVu2dWim2jWF1f78
         TyV163DtYsibuPhn6FYJH9SuJRGo2tXqDn/jJmD0SkPD2YCXuSPxv+NF3lt73q11WX7U
         k2ItIMltLEf7RgiuCJf6J0J7iFm/ST5LD3wbuGor+zjpg7vbJccrZ2jF0BqHLVA1ljZ2
         877Q==
X-Gm-Message-State: APjAAAVnM6o8wM2v0K7WFhBWxOz/pW129tz9vMYwuoMYIZ2iunOSlCKg
	HR9T9FZvGgziYMYNwy678It6+wmT/cIqJtnb
X-Google-Smtp-Source: APXvYqzKbuvTV/Ug12/b+y870UfB4QkxxsRZ5ndWseoBEkZ16fhfBKVgH5ViMCrXNGD4XrhHJA1Ndw==
X-Received: by 2002:a5d:5230:: with SMTP id i16mr2529051wra.317.1573043881912;
        Wed, 06 Nov 2019 04:38:01 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.8.102] (31.red-176-87-122.dynamicip.rima-tde.net. [176.87.122.31])
        by smtp.gmail.com with ESMTPSA id w22sm2545916wmc.16.2019.11.06.04.38.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Nov 2019 04:38:01 -0800 (PST)
Subject: Re: [PATCH v2 4/4] target/arm: Add support for DC CVAP & DC CVADP ins
To: Beata Michalska <beata.michalska@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 pbonzini@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 eric.auger@redhat.com, shameerali.kolothum.thodi@huawei.com
References: <20191105234100.22052-1-beata.michalska@linaro.org>
 <20191105234100.22052-5-beata.michalska@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c7f96f08-1ab2-e5ea-68d7-ec181017ab78@linaro.org>
Date: Wed, 6 Nov 2019 13:37:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191105234100.22052-5-beata.michalska@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: ulEzsYtzN/35

On 11/6/19 12:41 AM, Beata Michalska wrote:
> ARMv8.2 introduced support for Data Cache Clean instructions
> to PoP (point-of-persistence) - DC CVAP and PoDP (point-of-deep-persistence)
> - DV CVADP. Both specify conceptual points in a memory system where all writes
> that are to reach them are considered persistent.
> The support provided considers both to be actually the same so there is no
> distinction between the two. If none is available (there is no backing store
> for given memory) both will result in Data Cache Clean up to the point of
> coherency. Otherwise sync for the specified range shall be performed.
> 
> Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> ---
>  linux-user/elfload.c |  2 ++
>  target/arm/cpu.h     | 10 ++++++++++
>  target/arm/cpu64.c   |  1 +
>  target/arm/helper.c  | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 69 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

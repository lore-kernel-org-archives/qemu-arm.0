Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp2593819njb;
        Fri, 16 May 2025 07:47:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUAdb6uN7pF9Vxwrr+zuNRuXBZZPuW5TbFi+iOznBCPPkYIYAJTf3lRJrZ6Gz9rgLWHjT9cZEnxjlG+Tg==@linaro.org
X-Received: by 2002:a05:600c:628d:b0:441:d438:159d with SMTP id 5b1f17b1804b1-442fd60cee6mr37039065e9.6.1747406878248;
        Fri, 16 May 2025 07:47:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747406878; cv=none;
        d=google.com; s=arc-20240605;
        b=d90oK1WN1dCKqDTWMPLPA1cdrsPxcjRuEHYr+u2V2fzm2xJ+4X/woyE/jA8FhSfLbz
         uE8zYZQhdlNGkqn0qMDZOIaOyza1T57ZQ1mJZch7zJMBKHzCnr7+zbGlxMR3x9W8UgUT
         t4faz2bF3ifob4QObfDdKGEHTZrpExN4lQ95I9hE16jH8evr/1EGWN7jPjwnDhKOZwOr
         qTyCzC+p052SWTnOQBa4z3MJLfmnRpZOgIuF2BWc0TSJPw4v2RkX0KrEE95DUUDvn6yG
         5lLiauJV11TzqOv3pz9kNl1h43Q1jiAs/WpMsgoGF6jxPkSAuNNeKLh96LAuserKr04X
         T3yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4Hz9R3lbGIV+V7GuRIm48x4ah4B5SS/VSn+imgLSZbM=;
        fh=U/608log8r0oH9O42wxKPu2I4sIMf1xhvk95B1qj4uI=;
        b=XzpFe0NfQ5ZYqZyRTmMQ6UF8o1X/h+/oKVjdhBUjFObg3u3lVv/KKioiJw7ISP+PBf
         flmod+Aj3aCkrDXwcdtYxOjAu3zclM3YEKvkhJRt9BYzwG5iX5kg4Ee+Ml/PEAY0TVEm
         7BZjXTTse3guYWxWXSqmt8nDfnAZLs17Icv7zB9qqnGx+gXkLBky9i5a+RASgySdEyHf
         dM5ALfymo3KpzlCqd8thMLeBINZXCN5Q4ccA4hTG/zi6kNkJRB0XZdxpfxTVGpnOYesk
         H8pESZOxEYOufC/V/xSEAyMIld1KPu+uiWEIt0k1JDDzN9ot4L2BNK9GACGgmbBpqfDJ
         t3mw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NcPzWG1n;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-442fd5add66sor7007535e9.8.2025.05.16.07.47.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 May 2025 07:47:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NcPzWG1n;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747406877; x=1748011677; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Hz9R3lbGIV+V7GuRIm48x4ah4B5SS/VSn+imgLSZbM=;
        b=NcPzWG1nIkjNBqhqkFPds2L6Sgv8nFMXblWvYxrEPMZIgBohpEfejKGdJvdQfjzgb8
         yAxHJDX4Isb8GVkm3SoOlCxfHBrizQmA9ANZf9aPcGMkBlvyvavXWCbP2fArX7RVG6Xa
         ot3UTo4BOOuKRCb2Qi2HSzZMVaacAiq8La9paooLEW/4q8OboLiLHcujfXMx2k0xiAcl
         UER+kdOUcbrbfvNChxQdhAct5/JX16gv+5fr5cjDo5lw3bLnOFmWLMxzD2GzIlaWI6E7
         NRIWLU1IBcVlN9Vn86+cmrGwMoPgLJT89BL5fdI4Tgt4g3y+6Xs+NKQvr8r2Vz9Grgz5
         BQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747406877; x=1748011677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Hz9R3lbGIV+V7GuRIm48x4ah4B5SS/VSn+imgLSZbM=;
        b=wtEFVLSiGORYZhQ0iTTA8P9NZHOfTPcNhOJVayfS6bf4z9IGScf+o5T7xQu8gj5bPF
         HH9JRBr2ObgL8hK5q5jnA50W3ixbV5ybxHhGMwQDyZdC2PBT4rJ+1gqN4Joep3RM6MAO
         qra2+MF23/JVFi7r01YxMivI0s6XfAgV8AbqfNSgmMLwh2iDB6IwJCf7SwyjxgX3RtRp
         RWKJh3GnZlNosNQgKQJpdTvyDnHlSzCAyMXsMqIHFWykg+7ZmYXuxq/gG95tPpZQNQU1
         sN1CbWDDkmMPHJ7CKlydSNdt99KOKqqAaBasXQJRiQj8RvGGb8SOuBML0+xwg8dVA8TL
         U2ag==
X-Forwarded-Encrypted: i=1; AJvYcCUHVXXqqkW8mvBtp5KDjRig3Pryk8bz4aPllYEUlKxCv0PG/4om0e5FRk95ATu6VxYQVNxIX5HD0qAv+A==@linaro.org
X-Gm-Message-State: AOJu0YxER3YANw/wy9zpGJn3yRikI+vDBhcDDn53ex2I5XO/DmyiCl5p
	KEq9nq3tSgEiOOsL/Tm1bakH/EmG3BC0Xv5pvOQ/krCGGKqzs8w6T1ZpQt1i9tXCHCrhVQ==
X-Gm-Gg: ASbGncv8ASdbNKWxAahOqKLNFcWFVu+ZSnO4KipVMOvt3BfRbTOjAJYJ2/zK/yE/jpp
	zQG6d5Z2kkiwzX4GXWlRV8wksJtxSjUevXoBucAkho+/aIsVfLfeZq927j9WBPU3W0dkKOjFBuF
	/6v46Fqv80JuPJnVQ3Ts6mTAnTN4TBQyKyysWpHEH1MZ5yNwUERLDqK2O9cchL3BlNX2b8lRNwc
	5PUUZmQv5lS0IyOExBaEv8kGDkmXvjWVvCjS/vBeXhONogsoSHoiiHh6rg8aA9ZeijpGeWyDNnx
	iSYU8UV9haOaTxmf+PWk11iselA875sumUtUb++ncN4jKloqIFpStyQ1Jkg3dMAsLEOzxG/mmk0
	CErogY4uvHxCF
X-Google-Smtp-Source: AGHT+IF0eU5h38psqMO73iwCcgaikINZxZeJcvoOVEPB3Ux1ZqP2RZfnykIjp9/yr1rIYKQC/TmJrA==
X-Received: by 2002:a5d:5848:0:b0:3a1:f5c4:b81b with SMTP id ffacd0b85a97d-3a35c83915fmr3580179f8f.23.1747406877576;
        Fri, 16 May 2025 07:47:57 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.61.1.248] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d1c6sm3080519f8f.2.2025.05.16.07.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 07:47:57 -0700 (PDT)
Message-ID: <002caade-699e-4128-ac08-7797b83b3cc8@linaro.org>
Date: Fri, 16 May 2025 15:47:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] tests/functional: Add PCI hotplug test for aarch64
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 thuth@redhat.com, berrange@redhat.com
Cc: eric.auger@redhat.com, alex.bennee@linaro.org, peter.maydell@linaro.org,
 qemu-arm@nongnu.org
References: <20250512144629.182340-1-gustavo.romero@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250512144629.182340-1-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: A+WQ9nwftHCb

On 12/5/25 16:45, Gustavo Romero wrote:
> Add a functional test, aarch64_hotplug_pci, to exercise PCI hotplug and
> hot-unplug on arm64.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   MAINTAINERS                                  |  5 ++
>   tests/functional/meson.build                 |  1 +
>   tests/functional/test_aarch64_hotplug_pci.py | 74 ++++++++++++++++++++
>   3 files changed, 80 insertions(+)
>   create mode 100755 tests/functional/test_aarch64_hotplug_pci.py
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 23174b4ca7..9ebb768214 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2065,6 +2065,11 @@ S: Supported
>   F: include/hw/pci/pcie_doe.h
>   F: hw/pci/pcie_doe.c
>   
> +ARM PCI Hotplug
> +M: Gustavo Romero <gustavo.romero@linaro.org>

As mentioned in v2, since this might interest ARM contributors:

    L: qemu-arm@nongnu.org

> +S: Supported
> +F: tests/functional/test_aarch64_hotplug_pci.py

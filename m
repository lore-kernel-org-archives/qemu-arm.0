Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp2375441njb;
        Mon, 16 Dec 2024 09:53:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVoilgeQe2BoNCzV1FyNYZhPCWfX28vlNR/2ZrZUXopEJAFtS7RQydXI2Ve+qP9rxF8GCnA8gu2QTB7yg==@linaro.org
X-Received: by 2002:a17:903:41c9:b0:215:3661:747e with SMTP id d9443c01a7336-21892999566mr192593905ad.8.1734371606698;
        Mon, 16 Dec 2024 09:53:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734371606; cv=none;
        d=google.com; s=arc-20240605;
        b=gxa5Q4v7qDvD4SOY7oxRgHRnDw+Ox+0ogbhvTdre+YLXMjbkic+k431nAGWwjDTjls
         5xD1plI/a33fGxB9hVomLptjP2bIDUTHKfSUYk6hkO5iQGlL3rcmdPZPdZ7rZncHmDcU
         2nL1iE08tH/PpZ9g3k6+idYpRBYaEpT4dSR33I+1kdvFbZjlKUsgUCXXkz3jXOBezvjK
         zDe8sEO+p7VdPLqP2a45AJy0SyrqQ6waEkVZ5WnzrCV0iEexOTrIlGj4ZHRoGRenrmwb
         Y/XR/csYH2BEsw+su855WElSKJJMSvihUw4Po8oUXuetgpH1wd2KefgDG6YSEunU/HVO
         Y0uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=MBzqm+6+i/WpgbOCL2Iux3DANRrssM7vUL0Y79rULN8=;
        fh=X7sQNbyWjnFOWjUL/vXrv751O+ezv0ole8bEs+thfoI=;
        b=VJqfhOxz+dUDg0Nb/zzCByqI3vfcPLCmlcQb+cS9mW9JPFs3uMAEb8bbpQDx1XWFa+
         sBFMIsvFair4uSK3Iq9B+pweuCdrTVpO4qHEEgk2An3P8VO2N3zkq+p2n9cc53H8eRrW
         LLHUKTfVu4deLVJKOF0/Sf1hdFNPBTp4w+/KrOYWg+QjnrWOX1BMuN7uO0tZDFuQpuhf
         LlW2TRoMXJpurC7i78qre3Zh1mgepp5ucMXWjRI5zmhy9fTZhAsmGhBuEzvpyBlWkiAr
         O5o791U1nIixrDJWXCbTeDCRoddEveG/C4+/X8XGgDwgf+A3F0d07jRg2YSZu/UQ7m+x
         xi6g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m8z25EKX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-218a1dc738asor34737035ad.5.2024.12.16.09.53.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Dec 2024 09:53:26 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m8z25EKX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734371606; x=1734976406; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MBzqm+6+i/WpgbOCL2Iux3DANRrssM7vUL0Y79rULN8=;
        b=m8z25EKX5hePk2Bf4+eeynET1VtzmbHuGdishxyeLI/UnR57E7uRKo0xcCcTBuIj2l
         pQMKNTYc8V8QPDDCKXTPp30sLZz8VcOYQM9uPJbOH8zWaBZwKoj7hSn8RZRcspw1Ieve
         IoU1X4xilEfqPjxiqm5QlRnUosOc+ug4XwM47vZviF4vIjx1bx32/sanXklE7QgMmNAy
         0etix+0EFshCvcRSzQcj0CVW6owRBFICcmB1g0ed5NMVJf+8yVBkXUYjE8RdP6BlibzH
         lJgvNSIvlaUEwWansyLQ7Y/rJEJL0ngFiNYL6bo776S6TTNDlhr63nHubkJuCkH9L4CN
         aJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371606; x=1734976406;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MBzqm+6+i/WpgbOCL2Iux3DANRrssM7vUL0Y79rULN8=;
        b=lDw7gQK49nmtAvxa6phvStFGYxWzA0K8uqSuTnEJjNIf3ebIlsebdxR1G+lZqK509t
         KBZwhF7wwAZTkr6szZ2MCJzfGR94PfJUm9tSVM4ntL2RxivScQ3ZllefOu4mrYT+CHEs
         ZvLs1WR10sKWUhdcv30+MgFoTieZi1Gh33UpNhmRMy5XyBED3zWBRljqRO0hxwzRkVfe
         M7kA3EYOehBHh0jW1ZeBvX+y8cJ0Ktbg/BhxOqEykT/NfJtzSV6+2/wFs09Y+/rNO7Xp
         sURrDvWXivZjZkMwYjIM/9vdl5ObgRnRqwBnv53KD3/AAJtEKL6X/vUKhLrwIPJ6n9e0
         GTZw==
X-Forwarded-Encrypted: i=1; AJvYcCWwtZpg5wicmplPDu8Ct3jolYYp0UxLhzu66IMn12pHAH+VfZetH672Qr9Un3LfF2NZtNvQ+1SLDwTVyA==@linaro.org
X-Gm-Message-State: AOJu0YwGh2+mRd9aV0VDIAUsEUrqU6F+o4ZGtKOTmsw671/FOk2Eg/Hi
	QUgwVbmfx8VXOkT9QBtvZWvJKUyW7eH5YGroRBNZsugVBVALM2JYGYF8DDrRpg/pvg==
X-Gm-Gg: ASbGncuK7ftBzgoB67jqwoxSFhA04nqCBvv2auki+VPPV0uuf/XvLlWRcyQL8vJKFiT
	IxflNQeqVyuEnMEubBGiEHn1PLtfRmav3ZHHkZgdETs1mFpyG1hXj59WikzcghzDFU/ktH1iM7R
	7vZ8CWAEOHTvBk+DsS7pySqamWaAyl+c5NIo4+staY/FuUd3OsYvWyZ2sZTDSuTJVzE6VzgHw1k
	4wGWM5RyHqgnm62nSc2nO338oRk7JRY72wQVIR+0qSi5QPDn6ZcdRR3R/qDeFq5O5qLFWcS3BdG
	z2HFAMJB9DCat+xUamC2WwJlPPfQ
X-Google-Smtp-Source: AGHT+IG+5tBIo4tnR2W3OtwzOX5nHv6Z64YhRO7rPfxHEdYGouQ7NQQG37t87dPhNsbDyFgeM5/Vog==
X-Received: by 2002:a17:903:284:b0:216:2e5e:96ff with SMTP id d9443c01a7336-218928de5e4mr198675035ad.0.1734371606345;
        Mon, 16 Dec 2024 09:53:26 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e640desm45746135ad.214.2024.12.16.09.53.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 09:53:25 -0800 (PST)
Message-ID: <73c89377-d8e8-4018-8448-3c8acedc94aa@linaro.org>
Date: Mon, 16 Dec 2024 09:53:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Change default pointer authentication algorithm on
 aarch64 to impdef
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 alex.bennee@linaro.org, Fabiano Rosas <farosas@suse.de>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20241204211234.3077434-1-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241204211234.3077434-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: AF80VWXXJ+Ez

Hi,

On 12/4/24 13:12, Pierrick Bouvier wrote:
> qemu-system-aarch64 default pointer authentication (QARMA5) is expensive, we
> spent up to 50% of the emulation time running it (when using TCG).
> 
> Switching to pauth-impdef=on is often given as a solution to speed up execution.
> Thus we talked about making it the new default.
> 
> The first patch introduce a new property (pauth-qarma5) to allow to select
> current default algorithm.
> The second one change the default.
> 
> Pierrick Bouvier (2):
>    target/arm: add new property to select pauth-qarma5
>    target/arm: change default pauth algorithm to impdef
> 
>   docs/system/arm/cpu-features.rst |  7 +++++--
>   docs/system/introduction.rst     |  2 +-
>   target/arm/cpu.h                 |  1 +
>   target/arm/arm-qmp-cmds.c        |  2 +-
>   target/arm/cpu64.c               | 30 +++++++++++++++++++-----------
>   tests/qtest/arm-cpu-features.c   | 15 +++++++++++----
>   6 files changed, 38 insertions(+), 19 deletions(-)
> 

gentle ping on this series.

Thanks,
Pierrick

Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2125836lfc;
        Sun, 15 Mar 2020 13:18:23 -0700 (PDT)
X-Received: by 2002:a62:e701:: with SMTP id s1mr17204779pfh.140.1584303503065;
        Sun, 15 Mar 2020 13:18:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584303503; cv=none;
        d=google.com; s=arc-20160816;
        b=MskbHA9HIgfCMq9hHjdEgmNw4pMLaqwHYsh37vlmKFZHkt2lxEkR7fMa7sVF/tedA/
         BC+Ci32alfjRPVHvbXFlcU8EEtGYj60+dpSlTD9YHWYxIVbeN6BzpjX29RrlQf0+gpFZ
         JxfgmM0WaSIN86zrTFzgSWW9LUhnJ5tJ6W0nxJ2aKrA841LGE9rfwcrLUpsz6Lcelo+O
         EOYnkh9EV7v69xW8jVC/f8pS4HAiVuAdkVmrbJgCIMW+XHufNXjzI1MxD64Tq4hQDy72
         4nZ/hGBpw+7N9MFc5vd4rUBbXq6cRd7GM0XHkPRtHdh7usZk0VmNF0b7MuD+XmXNSMeo
         dN+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=hUbgdJ8axJNBUNavUWRYwmcrmlXlzsQv8v+AhElMzek=;
        b=mjOsHpqdwX8NkahUWiYG6ZCC0UcIkFH8pM6v8S8MDmHRO46zCFwahA8ldQiAn4+qhW
         a/lBLzdzEORMZtKLYWjQ+FglJUa1C8sp6kMZ0vqSISoqZf9isyV0DZtmqm8QDis+JOkv
         mJsIy5l4KqEi+smGoPr/GI37+/TMMD+Ob55TOzCMXc40+8DaA2Jftk9H9AGrLXiw/M3j
         jMmmECj1rB6rYH2hdP7TLCnGweRm3dtTYzacag4PkJC63WRPdtMkSN5yiAkmJxoV58RT
         aEWzXOL2SfF3lLXWZdcrMkxpNVGQ63HPzPt8MShwis/5QSrgjGsY69rwK3vomlh8gp0H
         cphQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RucN+341;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k3sor13790522pjp.15.2020.03.15.13.18.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 15 Mar 2020 13:18:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RucN+341;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hUbgdJ8axJNBUNavUWRYwmcrmlXlzsQv8v+AhElMzek=;
        b=RucN+341Pl+98/KvSN2eY+qezA3vEcRqE3AjB/4Rf63S2hr0bM1rExlB/XwbFI90Me
         PLuAgBlYSqSlG+txsaNPVK3kQ2llL7+IN5V4DZmAaK+zMxftjvQnJW4pp0rHOingxnrg
         xMkbNgie2vhRQz5iSBV7JWSnzmifnS2fK5fV9olR3ZFWtsd+4ROSnoA6jAIiBaas7gUN
         PcNI3b9bk02PC94xkf35OjROnsQfuy8lVvjn3IRml69T3pk+ROUV7G67+4leH/IEnfHY
         wlKay4tNAuAXWtw0EcI/0jkPhih2eba287kF6byYGHOPcwqPT8V/51q6/O4mb5ZZmvlu
         pB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hUbgdJ8axJNBUNavUWRYwmcrmlXlzsQv8v+AhElMzek=;
        b=c4PZukdmyMHkVZyFiL8I9W4CNC2WuIXQ/HCVXyAO8cW0mnw5TAFQ9xyLid/j4/NwvT
         57fwO6M5ZyxKwK6v0xSRcnME7BXiuzNByMF/WSC37b5YzIgkUPAKYgWdf16nBkWAa8a7
         zHvWzePzrmoVHdi37aaQJEZ7OMMzi0mjn3eIYK3XBHeRfmZp+iO4C2SuPgDgGT12IdyW
         rR49KzzRn+qxW/yr9mzQalxjOwzpyhzXl+vk73s0+IHFOXZsuMpqZsN3n0IsAe4zxCHg
         INCTXcoHd/Ipulr5zQ3NnLldw/S1o3s+sjgJMmxG3IvuaYp7fZ0VAmlxYSxUF+ZZN+cP
         lYhQ==
X-Gm-Message-State: ANhLgQ0szZpqpdEbXhWHIyA2xTEbgi050oVLqNeW5Wdit7JB1EkAAqM1
	leGPN4uNp97IXE6lWkAeVmUwfRvI
X-Google-Smtp-Source: ADFU+vs/addkmQN34sUVbe/KT4pAtgwLGl2LIxE4JatwXayNepsIoE1ea57z4d0zFfseanAvIUJJ8A==
X-Received: by 2002:a17:90a:e2c4:: with SMTP id fr4mr21482382pjb.91.1584303502400;
        Sun, 15 Mar 2020 13:18:22 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id f17sm51074460pge.48.2020.03.15.13.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2020 13:18:21 -0700 (PDT)
Subject: Re: [PATCH 06/14] util/Makefile: Reduce the user-mode object list
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
 <20200313183652.10258-7-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d20dc940-1d2d-eed8-3240-9cf28b55d6a7@linaro.org>
Date: Sun, 15 Mar 2020 13:18:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-7-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ShgRF81ozh5C

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> These stubs are not required when configured with --disable-system.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  util/Makefile.objs | 59 +++++++++++++++++++++++++++++-----------------
>  1 file changed, 38 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

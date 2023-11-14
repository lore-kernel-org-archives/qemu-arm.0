Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1998270ejc;
        Tue, 14 Nov 2023 04:25:43 -0800 (PST)
X-Received: by 2002:a17:906:ccc3:b0:9c7:6087:49a7 with SMTP id ot3-20020a170906ccc300b009c7608749a7mr6874411ejb.43.1699964743742;
        Tue, 14 Nov 2023 04:25:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699964743; cv=none;
        d=google.com; s=arc-20160816;
        b=aZMdGhEQAlZxliOzPGpl244qONU+JjmNIBQeXgq9XGH0/APdi3nW3IyXnTqEil8Ydp
         331kzaReU+7nEHcV0AeTQ5j+KjlhbvfNNcse0vBQ358Dprv3IdS1BuXQpYJe5Y+oHWq1
         BCsCK6WirALXB9c0d8tExWK3bu/0/fcQ8wvdv8VIBDbgva7Gpx3R00mqzl4LFZnIZ9fa
         tdtiuVNBS8gdVdedgfC8RM4XLnCWESg4vEN0NLkqCqNGleSOZahxc/HbfLeYTblMqf5N
         ogLX6nzxQCCxDuNb9PWnf33qelPcXSKq1E4FWYlhPe43xLjFnEYhtPJkZ6tM+dQtHrF+
         gu6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/OaNUIXzZbTozIX8X4xF9tfJTPhcFd4ZMAc/W8lKR1s=;
        fh=zNL1u6fc+PAQR8kHjT/hG7G+4bmfCKWi7BeP21vx3dU=;
        b=rzZSanaEtIYTqa6wfk7G1EJjyN9peRf7NG5aYWtqgus7/P4xMXdMSezptGYtW5N3TR
         ahII8XmqpGapY3kFoZXTtf3nNbNuj/1BA8zEhdL0B83EoucMLmXAdo4K1d77cZ29q8kK
         d4Higr7z0oqA6/Z6s1+tjqjPn97haZAnf8IeWHkrWrSMHNVkanOeBPuMzXGaVxyJxFsG
         Wz8Y14j8Mu6iXpQ0qjjyru8RJZ1v6z0qQ54f/peKTSbDYJBks2c9tXi4FXnw5k6CWz7O
         sdXzExk7aQG8wa290N6xNcY8bdXCpLr+2OlYTg3SsOC2RD4kEvXbDEcf10ibxrg1j61j
         Flmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RGkRqiZA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c27-20020a1709063f1b00b009b2b2ad2a82sor1822592ejj.17.2023.11.14.04.25.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 04:25:43 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RGkRqiZA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699964743; x=1700569543; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/OaNUIXzZbTozIX8X4xF9tfJTPhcFd4ZMAc/W8lKR1s=;
        b=RGkRqiZAQqcVvdV9igdJ7MxYWFAtcW76HQjE8rJYRlH9kHaGwFwSeKxZ/uHgayuzTu
         BFTLwrJOh7hfWaPpKzgC40L857ORjXUtBXY9OzfvXN5T5X/XmyMq2VqtSkvpgDDdWykw
         cYUWQ2ElVSY+4Scd7ozXPdR+p2aX+Xn5VotaTlefUyEXzhKJ3882jpkKbN0JaY0k90Fu
         Yg0VTfXUBFOUzZG2o5zlHF1aMQsBR+c5KhYQFNWeC7SVzwdf27aUrpgg9xkjIFd9SZme
         Pd5jKzprCPqFMVgrjonPCYgnW+ydZGqyKysDgTvo5KxNK3i3b1Zjd6lkKaEUQkwNU5S+
         jIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699964743; x=1700569543;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/OaNUIXzZbTozIX8X4xF9tfJTPhcFd4ZMAc/W8lKR1s=;
        b=M728rbhuknWEtl2UJzCen+CzeOwV/xD/PVSARjDSj9u6XG5VE8oYGY4pOyVnnOv05i
         /mp6uBUiyfFlKA9kMUOqjgJzKZ9XS8vyXYcj2p9ApB/I3Szea7No9VTk7FwC9EWN7lvX
         GQp0UnZhyUaC+k65WCyuU4jVEMFos8o4JS5F/BxcNJ79N7IuQCKP2A1o/A0Wm75547GH
         GdYcH88q6TrUE8ol4oAwTXSb0e6MFr6fE3n4LrSHyh+vP/Vde7Rx2rM6UeL5dCYfbY3m
         GNRfFh/LVtBzZZ8PazAHJWl+3oZe3DEQ5jGpsqlHODE0vIyquEB5l8gL+V2pVQAAK1Je
         vQog==
X-Gm-Message-State: AOJu0YzEvjMYOX/Yaah4A20Xq4ZC/Enoh+x9c2hl+iVIKQWJffIjp8fy
	E/q+xqRcXULrw5/RH6jRg9ZUa1nX
X-Google-Smtp-Source: AGHT+IHM6IuBxGUDmhvjGjE56b7qH2UrMdIaZaFuXREseUVLlPhT1pToLbIdRgtL7O9mZ4K3ubCdVQ==
X-Received: by 2002:a17:906:5245:b0:9e5:2b1f:13f4 with SMTP id y5-20020a170906524500b009e52b1f13f4mr6552715ejm.42.1699964743415;
        Tue, 14 Nov 2023 04:25:43 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id rs4-20020a170907036400b009a1a653770bsm5412508ejb.87.2023.11.14.04.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 04:25:42 -0800 (PST)
Message-ID: <86153cf2-129d-4e1e-8949-786764bdf607@linaro.org>
Date: Tue, 14 Nov 2023 13:25:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 07/10] sysemu/xen-mapcache: Check Xen availability
 with CONFIG_XEN_IS_POSSIBLE
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>
References: <20231113152114.47916-1-philmd@linaro.org>
 <20231113152114.47916-8-philmd@linaro.org>
 <9ba10b4a92ac6782d0c581b1e1ee5d5efee44c33.camel@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <9ba10b4a92ac6782d0c581b1e1ee5d5efee44c33.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: dkiDltwlyATF

On 13/11/23 20:52, David Woodhouse wrote:
> On Mon, 2023-11-13 at 16:21 +0100, Philippe Mathieu-Daudé wrote:
>> "sysemu/xen.h" defines CONFIG_XEN_IS_POSSIBLE as a target-agnostic
>> version of CONFIG_XEN. Use it in order to use "sysemu/xen-mapcache.h"
>> in target-agnostic files.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Noting that CONFIG_XEN_IS_POSSIBLE is for Xen accelerator support, and
> may not be set in all cases when we're hosting Xen-compatible guests,

As is CONFIG_XEN.

Maybe be worth renaming CONFIG_ACCEL_XEN if you think we need
guest hw specific CONFIG_foo_XEN variables.

> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>

Thanks!

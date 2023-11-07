Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp207152ejv;
        Tue, 7 Nov 2023 02:09:21 -0800 (PST)
X-Received: by 2002:a50:d583:0:b0:53e:6d33:3c94 with SMTP id v3-20020a50d583000000b0053e6d333c94mr28380307edi.10.1699351761409;
        Tue, 07 Nov 2023 02:09:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699351761; cv=none;
        d=google.com; s=arc-20160816;
        b=kMXzuhd3FGRVW9+J9SJL8J5EdB68Y6qiKiAS86hnqhc0i/5TrsXC7TeXwuEnsZc7ji
         KzyzYZiBwDz1k8ukE5A06KBWswC2ELvY4ieFxgJgNI40aJnyj2oj9/52zDXOj4ceapIq
         vkbRyAsKVgEiHmo1IPb5wfggS4+DVxpgzgp952YnVyHsrUqqBc8GsdsMnKC8CmVw2Ysx
         PX1YigZ5LlCQdmBCgeKPnsiUUG8mvtkBxM2uHkal5DNtQGEacm0LcFhWGV8v7KMduOsq
         5f73WNSk3D1llW5K2D5ARnZ1c0N3XJFrSkZQL6ba8SzCtpWRlPT29l6vj0CVEaoins6B
         YvJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=I1/9USN/jBOffMp2yloOb5x9kWe3LnPxTW7blqDcHgQ=;
        fh=KGmh4890KH1+11AD+oNRzRSvRXDCBxYbCMx1eS5pbik=;
        b=0LIOjLd2SshSB2X6eFRUOFoN3H4b92v7l/f1kfIG3gAk2XgwcMWAdSuYCm6uwDSurA
         UDLmizU+D3HwN6WGg2ZKWImBbxsCVjv8oPjKpGImArDs+seljtOka0CV69CH1x20x+9i
         0WOjATtbYhyeyJEQF1HfvVX8s/iiVOz/efGxx3CA5MjPuSxbyp34XvqHb/yjs2JFmOix
         N4aXtWc36jdXWdvBS0x0njXQ8iWRwpvueHprShIKU05glVAppbroOjx/kHoRW8IqKYor
         zumbIjE5ejXiVJYIO93xy3Clsn36CIrEXOJLiUUN9W/ROWBbPwopV7Wo/Z+iLXH/WhrJ
         0LtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aCA5RvQ4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s26-20020a50ab1a000000b00543caf4b9d8sor2840253edc.12.2023.11.07.02.09.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 07 Nov 2023 02:09:21 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aCA5RvQ4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699351761; x=1699956561; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I1/9USN/jBOffMp2yloOb5x9kWe3LnPxTW7blqDcHgQ=;
        b=aCA5RvQ4wzzrSV3S8699E7i4C/7EjgFlAjzGBumN8nOjy0wz9VYYhCr2eeXB25677E
         nohLLsXNGcbNSZBtBqBAfWV/vB0zYPB5heyFzgCEuHCORdUB4JqdHW0JD2XIqaCgZLaO
         fixJCFM3T7wi4oUqcHnz8Ws2SM+CXYNs+nMgL1UyKWz90ljBWOgBb5jy58BQ+ZsnkfJ4
         AGUlk/LOgNzP3Q1vBNm6pHjht6cV4YJqpxkb9w7O2myfvYxl/WEmY58D0VXVETaZoLrd
         5dZxLso6ATCi31HEZKdwp7XNA4rmehmHohHtHqn6sJT0c/OTGq6iy7kZdQ5jHVlw9TeU
         nuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699351761; x=1699956561;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I1/9USN/jBOffMp2yloOb5x9kWe3LnPxTW7blqDcHgQ=;
        b=Udblka77r6UUKR5A2Q0lBkkCD7uh71LM/YK2C0HpKMrGqpAbH8cS4zJMEw7oNPPDiP
         JoQJwsAmkkeHsoDT1oqF/dNrr0FAQUXpIqrI5GIXoNtjDI1pgKufKW5vIOHdWsS4dAvU
         RfbIZMvJJCgnH5vHZyOhFgJ54HAljPh61ltaM8RyUfEERGY6noigIKbiSsyj6SfYS+7F
         Ao2ce8kDRFYxgpXFboKdKTzF/PUYOZISIe+xZ5afm9RPX54aqhhCOByZXPM+vLoXjWSZ
         /Oi+IpznWB2POF1Gab5rMynHQrQH+33lR34e1G8HTonutU6Rx6fn6TdQRfQhruy0Wqzm
         INkw==
X-Gm-Message-State: AOJu0YyqkJ2uefIzj3iGcEHRuBnIu/4/Da1rk9KcizBmCx3DJQIkzEF+
	8eYyki0ql3+qquJWMHMV9neeH5nUXbASkl+nd07+xA==
X-Google-Smtp-Source: AGHT+IHsREcktv5dvqQ2cBAqy8QrIyKH8UP64Cl7+lTHN+KBuQS53H2dfJXqxgYiOpp+imodOZzX1Q==
X-Received: by 2002:a05:6402:1b0e:b0:53f:e49e:4be with SMTP id by14-20020a0564021b0e00b0053fe49e04bemr20396618edb.42.1699351760854;
        Tue, 07 Nov 2023 02:09:20 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.216.69])
        by smtp.gmail.com with ESMTPSA id k28-20020a508adc000000b0053de19620b9sm5450734edk.2.2023.11.07.02.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 02:09:20 -0800 (PST)
Message-ID: <04ea9a57-90f2-4da2-aa83-96691ba8fffb@linaro.org>
Date: Tue, 7 Nov 2023 11:09:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/22] configure: tell meson and contrib_plugins about
 DLLTOOL
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Richard Henderson
 <richard.henderson@linaro.org>, Greg Manning <gmanning@rapitasystems.com>
References: <20231106185112.2755262-1-alex.bennee@linaro.org>
 <20231106185112.2755262-13-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231106185112.2755262-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: itDff2Yv9BE/

On 6/11/23 19:51, Alex Bennée wrote:
> To cleanly handle cross-building we need to export the details of
> dlltool into meson's list of cross binaries and into the
> contrib/plugins/ make configuration.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Greg Manning <gmanning@rapitasystems.com>
> ---
>   configure | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

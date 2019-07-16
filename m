Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp712921wrv;
        Tue, 16 Jul 2019 02:30:06 -0700 (PDT)
X-Received: by 2002:a5d:4cca:: with SMTP id c10mr33211189wrt.233.1563269406895;
        Tue, 16 Jul 2019 02:30:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563269406; cv=none;
        d=google.com; s=arc-20160816;
        b=uCRT8Bz7XL2t5r9Ly+ndJAJh1hbbwMT+NHnDSyvjFMfQl28diWdr18pw0D+5q+RBps
         HEC0vMzug+TfWQWvA9v3PLu7LoIoE5Z67pkmTEm4gG6aRrqcMQtSK7SmzY/i+iG9QnQG
         8WDCuIUz7P7Og4zwaQVuxlUM9G9wPGbSyxXsJR5B2RCulpRAcmYkHI0yMY6uzHiL9Gsh
         iiP6eei5OgZ+FPk5F+qpBLTYLm5Unhus+b9zkizela3dX4ehsA8UNbwGWeI8a06P/0aN
         1GwUB8+P8ScDZYQkSujASx6W3yS+h34kcYeVfK2DYeLdMfPXxc9hNiPKPqc9hxcBBcEa
         AnyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=ijlboercCQvvQ5Ml3GWYUTK8hI+90I319LkMxxaJwXA=;
        b=XkmKYPl4OpRH1mzjuVyFZYtMAGCyNKeEOCQDwdpavXJBZsDmSDfM5RkUXDsFuu80BS
         ieRrYMi7nrXoLgz1UaDCtswycRlsRIDuMjrE0Ji87pE78RSx/AlAUZnMukiDNKt+EiHx
         eM2UzDlqVLlqJFnrgxKCBg3zjyLk5Pay9XOWT2/ELITfxUizWVy0aAWZ7QV++9ZOncMu
         J0yTbgKjMi4oXzoEUJC+AbaP5rJHEw02aAdtkxcovy3bjX8cG0kKk+/iBhjPtg7hDcmT
         3HQfwTCJlV/VWj1s3EjLr52zSdCQuxJpwNtttgQQKpSY3Ad/hQqlvSHqczV3/K/TBrPf
         ixGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t7sor15637377wro.19.2019.07.16.02.30.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Jul 2019 02:30:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ijlboercCQvvQ5Ml3GWYUTK8hI+90I319LkMxxaJwXA=;
        b=iMU2me00OfXTckhcIK6Dmompi/wXVJtYLCWT7KhmWeBzcvbZ72B4x0bFJhvdCEum7u
         5lwZCU0AerpqvoYSXAMikNyddDVbXjVEr5sIy0uHhQ7eYOZfjKJ25DFyT3Gca6/lr7va
         jmtbtPpJ4wSHcwKljBKk3JaD1TRe4dwV6xivhl/uYobezAp2DAfTkDckObQKrSNeuOGY
         nXEt65DuSHyar3FnSNekHOwPUA56C1o5ln7DpQJbw9GPdiTjDlOu+MnbLr33oV+9qaKi
         xmMy9BsD4yj+WAftyA6FqpEl3WsGqnPNEe9E19s/w5xDs9DWC06F1dgtfyJCAt6t6kLE
         12Ww==
X-Gm-Message-State: APjAAAWGabXM4Thz6aRQIr7+H0c9YlHKekoIikWk3jtfuwBPxVuPCqfE
	TmqzGgtwx8l67JzZ4sGZQnfSFg==
X-Google-Smtp-Source: APXvYqy/ws5kGdnydZRfgqcGyTUlmMX7l70ayF/DZkvsP7wh8Uo+bIOa11Enh/xKIgTZ3uXhWrQOUg==
X-Received: by 2002:adf:ef49:: with SMTP id c9mr36109437wrp.188.1563269406680;
        Tue, 16 Jul 2019 02:30:06 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.37] (62.red-83-42-61.dynamicip.rima-tde.net. [83.42.61.62])
        by smtp.gmail.com with ESMTPSA id y18sm19538209wmi.23.2019.07.16.02.30.04
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 02:30:05 -0700 (PDT)
Subject: Re: [RFC PATCH-for-4.1? v2 0/5] semihosting: Build with
 CONFIG_SEMIHOSTING disabled
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, James Hogan
 <jhogan@kernel.org>, qemu-arm@nongnu.org, James Hogan
 <james.hogan@mips.com>, Riku Voipio <riku.voipio@iki.fi>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <arikalo@wavecomp.com>
References: <20190715152225.26135-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <1cb9ca73-c988-8f7a-7b37-d28fbaf72c7c@redhat.com>
Date: Tue, 16 Jul 2019 11:30:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190715152225.26135-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: fJKRzZoCuAm/

On 7/15/19 5:22 PM, Philippe Mathieu-Daudé wrote:
> Amusingly Miroslav and myself hit this issue at the same time.
> 
> Note now that "config-devices.h" exists (commit 6c22ea9d83) I could use
> #include "config-devices.h" to implement Alex's suggestion to avoid a stub:
> https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg03607.html
> 
> Some know (arch-specific) limitations are:
> 
> - MIPS ITU is accessed by coprocessor instr (ISA feature)
> - MIPS timer is accessed by coprocessor instr (ISA feature)
> - MIPS semihosting (ISA feature?)
> - ARM semihosting (ISA feature?)
> - ARMv7 NVIC (device)
> 
> This series attempt to fix this the most trivial way, adding
> stubs for unreachable code.

Please disregard this series for 4.1 release.

As explained Peter on IRC, "feature changes need to be ready before
softfreeze".

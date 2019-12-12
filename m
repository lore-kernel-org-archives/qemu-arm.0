Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp21912lff;
        Wed, 11 Dec 2019 17:56:01 -0800 (PST)
X-Received: by 2002:a17:902:9682:: with SMTP id n2mr6663779plp.336.1576115760863;
        Wed, 11 Dec 2019 17:56:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576115760; cv=none;
        d=google.com; s=arc-20160816;
        b=Vr81qMsJANA5r9uACp1bW+cB9ZwlwQj0/cttM2TBaKfjjt0ls/h31Omte1QZKR4v3x
         MUy5jhm1rjZ6rWt/KZsvdWZuvROszGkTaG9pc+XkEbv+P3aUe31R6yNlW5cy6Sgjhave
         zkk3R0625qAin0+WjNkMgA/VJ8vPmsmi85jf+pfO+Zrn33fJVxvCYBYe2BE1bX+7W1tY
         XbMO51iaVpdiUftZGH3lMpHwDVToAiTenbdkpm8sg6zL1/MeIXzkZVFcpjmhJDTw+ZUq
         Fc7Qp+BMeyKJb6x8scz5yIE5+XvRy9iKXCmWTayyrZNSPGAGz+w8Y/Pp1I4Okr76wiQN
         Idfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=ZcpmQQfWOxKGqTFSxMEKdaMLE/l4mvb0EyNfdGxA7g0=;
        b=OZFzB6DC9z721RjOfbT1SRtzNfAj0yntLkcWiBFpBuvUqiSSy3fGKqyReq5nuhgtEP
         jEg4LnCw0Z/LfrZ+erTJSJbVsaCsNxhqnQEyxOXzBQXjcLvaw34C9SBUWWls32FlBk4Y
         AtQGofFlUzTuzRs5JOYiXAfq1P+QKNN65yCXzfIA67hOeBmMyNatig1Z/HOPDFaC7TfN
         LQ3maeOI6EdCaolWHWm6HQuw8+EjVw4r8P8PB/iKYSkg0TX8IoeRC08iXvPLA7LBj5ry
         E32iW6vl8FMZJ7kjFkD67IT6HCv1xq3e54XFlJkbISth5yN1qltKt6xytQAmC2rYxcQh
         gCWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WsVL++Iz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z15sor4190148pgg.24.2019.12.11.17.56.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Dec 2019 17:56:00 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WsVL++Iz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZcpmQQfWOxKGqTFSxMEKdaMLE/l4mvb0EyNfdGxA7g0=;
        b=WsVL++IzOAmRyHiVEHDRVSBjhsDi/SnZivmlTsKiEChne+P8jVI3yM2Li21eHRcc4c
         Ev4R+uxUidf08FOChuAKAADyZBsjsfesfaMFolhkQrVDK/LG1K4HWEsW80LnYJbRee2C
         hmw0A4sKd6PCiSvUnsz0TIWXDYlE7A+5YUSwoVaHfA7vq4Tcqie/A0o1xF57q8R0hW0e
         V6cgz5z9jGNC93Z00YiTAx4ub9IeqBV9/QWh8+AoIyGAIs9uSt41brEm6cXs05/xad3z
         hBun3TftB/2OSddVF1XGB4DE0BZcwaNLlIeY6PApnAuU3BN0sul79xBevbwsFPk7oeyI
         YZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZcpmQQfWOxKGqTFSxMEKdaMLE/l4mvb0EyNfdGxA7g0=;
        b=ZJoM1NBnR+eLGJR04orpF7jiKT2ahNaTHxwH/c4hnNTiONdPYRXMzV5iBKgR6KI1/Z
         NTvsbBeCqDJN/NPyaZ9ShzD7Q3MoZT/HO+7d/EVxpab7d0SyHWyE+nQHwnqu8p3aVlSf
         FVkaOJMu9gB6CK3YzegGr7l215C3dZVAx7bXMq7j5mGq8qx9mQYQRPpqEHr+oMT24J1r
         maosEHaRQ75o7opWnHAKRk0H42kRf6TRzxlQi2AtgYC+WNp6WpTYM4QiN27hh7Ih4VtD
         G7V9vCtt2dVXqaqCqlOPBGZT75hI1rVcn6Jo0S2GWfMo5hp83pRfuh3V5BgYzST4Fx6F
         QNhw==
X-Gm-Message-State: APjAAAXTpnzxaGHe34nfq6t8fQhLsFZNEonnq6rrr/s1NvbQtUxbw4e1
	zuHkqB4bkil+dOjMkPUVAzPot0OY
X-Google-Smtp-Source: APXvYqyhITzwXVS5e7icg7DK8QtXs5njvApH9ofZ43U7RW9EK0jR2qhd6W2itNOLUREGZTE7XU+kuA==
X-Received: by 2002:a63:4702:: with SMTP id u2mr7765676pga.125.1576115760284;
        Wed, 11 Dec 2019 17:56:00 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id u190sm4459483pfb.60.2019.12.11.17.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 17:55:59 -0800 (PST)
Subject: Re: [PATCH v3 08/20] gdbstub: extend GByteArray to read register
 helpers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: alan.hayward@arm.com, luis.machado@linaro.org,
 damien.hedde@greensocs.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Peter Maydell
 <peter.maydell@linaro.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Walle <michael@walle.cc>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20191211170520.7747-1-alex.bennee@linaro.org>
 <20191211170520.7747-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <134bfe14-23c3-4301-bb45-80024f9eb4fb@linaro.org>
Date: Wed, 11 Dec 2019 17:55:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191211170520.7747-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 7SpFy3+DN0zz

On 12/11/19 9:05 AM, Alex Bennée wrote:
> Instead of passing a pointer to memory now just extend the GByteArray
> to all the read register helpers. They can then safely append their
> data through the normal way. We don't bother with this abstraction for
> write registers as we have already ensured the buffer being copied
> from is the correct size.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1326317wrh;
        Thu, 9 May 2019 15:51:00 -0700 (PDT)
X-Received: by 2002:a17:902:76c5:: with SMTP id j5mr8672009plt.337.1557442260456;
        Thu, 09 May 2019 15:51:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557442260; cv=none;
        d=google.com; s=arc-20160816;
        b=C1F72pEaVyh7CGiGJ14Z1U6optwrm8YCHCHAOJgyoYWWKrpGvm6fnXV0s51eMJ1PmC
         N9N1pcEMkMb4pNOxcQzLzesl6//nx+N23g7OOwhJiYqzS81uKEzKRkpJ+JDjI3ZmgGrn
         i2zGOlHriZxzaHERaLqlBr6Wsg/+Ko+sCu9rO0KFhlRTHN5OxMx5JQZoyNquRDrbvVGI
         n7m+GYwgnqRMG8ksR6GiufT8pi2t9DjvNHV8aj5gNgGVArap3Mm69V3E6m/phmsxumyo
         K3rAw4D8Y6M9gcY36Y+a9R7K4qwFICvHWKFkF+hNOweNaVgGOsXj5b4lInaGoBIMUajL
         CTig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=yvRqqDAqHNuZNYnIgDuR6IPFZqm4fCF5M05PO5Ov/MY=;
        b=VFIDSzniqLWENzq96pj/Wyn3dl4tJCL1Da+09d0/V08Pnk6L//zkDtRJazvmVci/cR
         AOttKKz4s9Jm1dhU2P7o0Ig92nrE3Dq2coqwl7M6AG5WEX6avyWvNLC9MnF/uhNI5OCZ
         Ur4Jf1qnJMEfjXigkJd7uU6RXDcbpI4Dbo+E4RYPYI28WY/jUSek9N7lqxBZGNUmGLTp
         5YVtSbcyWQMe7Zo6ESdm7YLwQWLoDTOiV28t5jQBi6zuJ2RuqeKsuNnRXVCYN1JtfD5V
         opKkngynY3g+mCK/Rl+nmPoyIosMSD1fn7lp+w22+rSm+0V52QkYLMb3A3B+HpyVe9kS
         Jujg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RDXF7T0s;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h3sor3781713pgi.87.2019.05.09.15.51.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 May 2019 15:51:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RDXF7T0s;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yvRqqDAqHNuZNYnIgDuR6IPFZqm4fCF5M05PO5Ov/MY=;
        b=RDXF7T0saPCn2PF9MTcyyj+zhYbDrTsY8ForJKOAkIDuU2IYhJhaHlPDtVeGdPgbtz
         IUAPw4Os6xA3UOuR8HURjaFMVdw5n73VuTiZ64hVPrBEWnpj/Nm3tKhAqqvgt//nV4vB
         GYD+SMGS/Yd15IMdMTvOWnFanLqgwixgi0tpV0k/rXlqV4cbQdQawRCrCBJNccxIx25B
         ++aKoczHq36J/JmSSLZkxaGGvX5Knp7jE1E2jaFiYlkObfyH2wAB6I4Dc+59JJB38h/N
         YZxg6S0TQga/YSvoYw7jbKniXEG9gigki99+SfDY7yy12X1Q7wFFo/TxZobYbfoZnLwO
         EvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yvRqqDAqHNuZNYnIgDuR6IPFZqm4fCF5M05PO5Ov/MY=;
        b=eFpB01ZLvADglXmQZvCGtYtQeXYJN58YzIkMy0PCq2BRu8u6pzf2VrYxERH605oO5t
         BlxQ9ibn2gCDyikK7L3HBa2rJ5JHWOrytlCbXLcYXXGnH6XwYOadEBgJiKjr/lZx5s9Y
         wgZCvSpAVfJ/lQquO9Vf23S37rBod9kjFd0b2oO+3y65p4gB5gWZMDHTgqFz27ATsbRP
         2Ykx3Up2oZEjJmMPWjJvkxKAzwSYpD5b5kPSDBmEpCkQvAzYHJDhCMcySKHm9iWVj+Pl
         I1sQX/6cagNnqUdF0YNqooDxMltH+sM2BOzKH2dJIp3jliFNYNLPkXbpXKel4pVUtSYi
         J7iw==
X-Gm-Message-State: APjAAAX1eCMMwrEHYX42oJEZ4IZUU6acAB8rDqNKkGvc1N9YoaLxar7s
	2FlzNBaMq02J4DRJsS0tJuPaGxWE
X-Google-Smtp-Source: APXvYqxFJz3eOsOLQsarRe90UeuFecPOzRsTF5uDftq+4ecZUb1FKD1kwd0qVw93vq/cAhy8MVDNFQ==
X-Received: by 2002:a63:27c3:: with SMTP id n186mr5732580pgn.189.1557442260074;
        Thu, 09 May 2019 15:51:00 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
        by smtp.gmail.com with ESMTPSA id g188sm4382446pfc.151.2019.05.09.15.50.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 15:50:59 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 06/23] editorconfig: add settings for
 .s/.S files
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20190509165912.10512-1-alex.bennee@linaro.org>
 <20190509165912.10512-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9a4eabac-07ae-81d3-a473-0c261744bf96@linaro.org>
Date: Thu, 9 May 2019 15:50:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509165912.10512-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: H2n7WDNGOd1D

On 5/9/19 9:58 AM, Alex Bennée wrote:
> We are starting to add assembler foe tests/tcg so lets make sure we
> get the mode right.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .editorconfig | 5 +++++
>  1 file changed, 5 insertions(+)

Yay, thanks!

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

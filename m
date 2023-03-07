Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5390615ejc;
        Mon, 6 Mar 2023 18:43:48 -0800 (PST)
X-Received: by 2002:a17:903:32d2:b0:199:1160:956c with SMTP id i18-20020a17090332d200b001991160956cmr13268891plr.31.1678157028279;
        Mon, 06 Mar 2023 18:43:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678157028; cv=none;
        d=google.com; s=arc-20160816;
        b=sdZO4T4n6/rccR8t/YD5hHhUaBU7+BdmDluyBIF973h1R7qV2fM8foHqFyNSmskSsT
         FdCypmLtPy/NarE8GHYbbyq4VbAKGe1WRyMP2Gn03chTIFtE7FhRcE6o8YORb4HNj9J2
         EWSEhcffDo7u7ywaYC6ICwHm/yDdicS5ZC3RqEIXZ7wF8JMWRDiiD96WfUcgxsMTxii2
         BJ4t0PZSGTzCKH+3Btl8ADTL+DVtnCn9S0TbnV6TkL5h+WBVx8D+vtRKATVpvIqbGDui
         ynM2YWdk/BWSuWuef8vHhSZqTfW07sb9cQlyPuftjeAMY6huamvHQ0ipmF2aO6nAnqVo
         SA1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=TZZUerayr4Vwu+mLpbm9993BkKWAeLPQd3Hs8A+YpLQ=;
        b=c41DhojjXH3Spm1gGeQm8YbCm6dyJZChV1GUAxRPNU+nqHJnQB9BqF6F6+gQkVRSIt
         5mBYIV7uCByhcvnL/RMumM0emLXtk6DX5IWLz0TjHWZqoiyJFd6uM2dj/BKSaxrQnCbD
         fncZ3umyQTgbkSvwX5NGRe6YpG1Gwo8AiyvZhkWcJWPW7J2vvmnnDTS6pQeVDCYHKEer
         +TUBeLZoT6JQtYp/jfVEsI0DZVULWbmrtRBZiJaKHKBLBv7CMXDn/kt9UjO9AjGcw/l2
         3zDJeysqiKSV4eICOP/mbOUu0Dch7lbRU1BNnWKdoJgCEoslqH3AqTBAfm35TMNMpdhn
         IskQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GJPBc3z+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jj19-20020a170903049300b0019aad2e4b7dsor4601216plb.86.2023.03.06.18.43.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 06 Mar 2023 18:43:48 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GJPBc3z+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678157028;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TZZUerayr4Vwu+mLpbm9993BkKWAeLPQd3Hs8A+YpLQ=;
        b=GJPBc3z+jhZ0HwjeNXwiWdLykxv/heTtof0JnXRPLTjNLt7XoK4QATdgNl+zC+uYER
         10d0xOLQbQ5tKYoDbIepka+6YTmlOUZmsOSvE70UNfF3w9HogCJB7jX1p7RTdlmoYAfV
         JPY7PUgR2Wlg1G7tB4aycGrixENBPBoSczpL3n5ygJXhOGdt0hO2g+lGwFfljuixSS0L
         MJPHza/Fg/HF+l4hSqLwluZc/FJxCAJaiegNxwZntC0CHWeeXnLOvth8uFAOaT2d8fta
         bCGTwmswBAEx6jDFOnheZ5bo6qC0nc8ABG1jflBxDQb5iGqPx1QACgdrDd/l/2Vtkp5n
         KjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678157028;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TZZUerayr4Vwu+mLpbm9993BkKWAeLPQd3Hs8A+YpLQ=;
        b=Ecd5EiX7BTgFa/drX7tfGg6ajgM+K7XOb38EHxYpRSIVtWincTFezHm9Qf6kzODSzC
         fhrGAqRC0p1/eZf4P7K626v7Q1Fk7mKOTIO29Wnp87RLexalbIPqGMjRwaXoIlSIdcPI
         P8ulWNfj7U2ppsEWwjLvv3NEKESdxkMojGgtq5sLtT9g3bUrxy+XwKBOMgX3V6lp5pq/
         0b1r+c7hmsPe2wMcqbTEQLMgCSeQTRWGfYrTIXxb3MfJRgJQxzWhbOItwW+/qUv5Zwcr
         LjvDBQV1IujYb8chS5YrFyCNwF87JP+V66SyWQzPe3EeuDv6QPjtjKhygE2IU16+HNMY
         jh3w==
X-Gm-Message-State: AO0yUKVI1eFmQyzMqRunUUJJNRAOJgP2uzw2u3SXkw4+zFUa6jA5W4mI
	s6bjRTVe4yURhyV9xVraUfLyGBoukSIuQDyUqjcyXA==
X-Google-Smtp-Source: AK7set8T2iiJsAa1B9KEmbNwjnC1t3/UPR2fiiOhp2gcxJV18BX8m8me8ijn0RPS48CAkLqh08YiJw==
X-Received: by 2002:a17:902:d2c9:b0:19a:7d0e:ceea with SMTP id n9-20020a170902d2c900b0019a7d0eceeamr14474139plc.25.1678157027766;
        Mon, 06 Mar 2023 18:43:47 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb? ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
        by smtp.gmail.com with ESMTPSA id li11-20020a170903294b00b0017a032d7ae4sm7360964plb.104.2023.03.06.18.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 18:43:47 -0800 (PST)
Message-ID: <861d7a45-734e-8115-ec57-7d0629fa36a1@linaro.org>
Date: Mon, 6 Mar 2023 18:43:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 4/5] docs/about/deprecated: Deprecate 32-bit arm hosts
 for system emulation
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-5-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230306084658.29709-5-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: /I2f6lJQJH7u

On 3/6/23 00:46, Thomas Huth wrote:
> +continuous to be supported on 32-bit arm hosts, too)

"continues"

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

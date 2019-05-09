Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1324246wrh;
        Thu, 9 May 2019 15:48:08 -0700 (PDT)
X-Received: by 2002:a17:902:2808:: with SMTP id e8mr8685497plb.317.1557442087940;
        Thu, 09 May 2019 15:48:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557442087; cv=none;
        d=google.com; s=arc-20160816;
        b=z+HpYLo1OzaUJqGgtsT/WuP0DTi973jfXMeK3Y5J42PLIrxRC/G1jrLOTB+swQD89i
         hV75Fb8QVYYveep4AXXixpIPGwuqCKErrGNTHKvFI39hWHbI+3PKgnlRO2vevZgduulV
         CZbboPeZHUTntIOJPf77eyxz6TsxSXbaAxQvHqu2LFQGkDbJTVx05KTtxuPs4RAtkaFg
         OynqPIOBeq2YSfOOpFepuLcHwxBwaOrbn7KS0ASu6OTHVb6dSB4WhklKn94+aEQK7ZP4
         VO8KBG6G+1JDnI3T01czcviRWZeR5hvefdS2koEGA4cfeswgZ+KbNxsqMlMoCbeMX9ra
         m11w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=AeZkrmzSFIAMabPsvVTKjOEFDCIZi5BYjF0m4ztvgT4=;
        b=b/xlTt+aZDYPn3X1sQboVUFmbBHnoA9WvBCJAuBUijsYARGCisqAmEkVfojMWP12Np
         jKIi3BJb5Buv9Bk9BPgYcOQjgQDJ3TdxQJlAi/0EgJI/7j6J0SgQYX9Sow1uknALLfBi
         cPY3UdNaFNij1nnBQvBUpwi22vAszElIN85uCJqiWc5nOLwgAFcXqKLlmltfgaoofT/8
         yPtXUdN0+Fx/CibsoLZQMGkXCQH8WJu2lfAzlSdE4OhJWhH/8/SFrs4V28b3n62i8dHE
         pYYCZNnLUYvvaqogvWU14rEGPaZPZSKLmo6QyI6CKIGlkptuB9Oo+eFRt0kNS9fhX1mJ
         el+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ppi7H/zb";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v9sor3833350pgs.55.2019.05.09.15.48.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 May 2019 15:48:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ppi7H/zb";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AeZkrmzSFIAMabPsvVTKjOEFDCIZi5BYjF0m4ztvgT4=;
        b=Ppi7H/zbmFHG6W9yRhPuvSlPecdaE5XvETU6BUmd4NYgZPOpBPH1o9mn1SoLme+32B
         WLHZ3ZVTAq952Pe67Hvp88IP3sq6WTXGnwOHBmhtNDryS9utOfDf6vT5B90YTJlgTtjc
         r1H+SHBekW8M0e3xB9v54FRjOMo3/TmidyWivmfHi5/xwLSTAlvyptobAl32O8F1ryel
         E/sH0Oi/HUJHXHtSP+Wy7o/hDX3d57/O3rdbFyIxsju5pAwBvY4ndddjfJmNw7bkJmTA
         SgdjbcORf8ysp95CZYFUDlN/bUnFdAQ+rpePOSzTzzTUVeFLItFLqNXTIAKGY09H2enj
         7fIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AeZkrmzSFIAMabPsvVTKjOEFDCIZi5BYjF0m4ztvgT4=;
        b=atDaQFa8B1hFE2N7jYlySnJno0YGpC0+5RwU4D07wZ+u+TQ+gc0SUK+p9e1NQMlxnq
         MMI06po2/es9f23aICRDHlOF01ARI+7zQEeVncGZG6/feFO63PRvMXZrCoTftCXOXEg3
         yBOMwVe+6tTZEKe7ocxIGofBys/BtHdC7diTq/L7NCfFlBxSpomRNQnA4dxpZ0DBk+fV
         SdsykDMWMPnqjbfEgQ0DdTJIEXhbEtwLtgnIJjC7T08aBi4LqDSzy1zQhtsNQ6TD54ei
         SBVJnwcel2PRj0/JuLbNB++dtqVKNqxWVxZBBLRJFQCvud0GOIh1C3zA16+/Yuq5gDZf
         SuEw==
X-Gm-Message-State: APjAAAWFDheR8gdeGxmhwPpHexJveCLZslAXO02Mc5NWghqoCvpLngk5
	ZLv1WJ4qOxBU7S4fQrS2/Bj7qexY
X-Google-Smtp-Source: APXvYqxm0q8sIrtnhKho7ggsdxeaOlZdqnB0plWM4qiLcyuAAllk6/h01V6IdyxoonCrc4YaCZ7JTw==
X-Received: by 2002:a63:ea0c:: with SMTP id c12mr8947949pgi.375.1557442087377;
        Thu, 09 May 2019 15:48:07 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
        by smtp.gmail.com with ESMTPSA id b77sm6883859pfj.99.2019.05.09.15.48.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 15:48:06 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 05/23] semihosting: enable chardev backed
 output
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20190509165912.10512-1-alex.bennee@linaro.org>
 <20190509165912.10512-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <252a5c4b-6ba7-6fa7-8792-fe597e766757@linaro.org>
Date: Thu, 9 May 2019 15:48:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509165912.10512-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: qC2kenvo22js

On 5/9/19 9:58 AM, Alex Bennée wrote:
> @@ -51,12 +51,18 @@ static inline const char *semihosting_get_cmdline(void)
>  {
>      return NULL;
>  }
> +
> +static inline Chardev *semihosting_get_chardev(void)
> +{
> +    return NULL;
> +}

Isn't the point of this function to avoid...

> -                return write(STDERR_FILENO, &c, 1);
> +#ifdef CONFIG_SOFTMMU
> +              Chardev *chardev = semihosting_get_chardev();
> +              if (chardev) {
> +                  return qemu_chr_write_all(chardev, (uint8_t *) &c, 1);
> +              } else
> +#endif
> +              {
> +                  return write(STDERR_FILENO, &c, 1);
> +              }

... this ifdef?

Better to change

- char c;
+ uint8_t c;

above to avoid the cast in the call to qemu_chr_write_all?
Or perhaps we should adjust qemu_chr_write_all to take void*?


r~

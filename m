Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp12115360lfc;
        Sun, 1 Dec 2019 18:20:33 -0800 (PST)
X-Received: by 2002:a63:ec50:: with SMTP id r16mr29106459pgj.284.1575253232962;
        Sun, 01 Dec 2019 18:20:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575253232; cv=none;
        d=google.com; s=arc-20160816;
        b=pQ1DzJD1v99ufZVlzK88MQ7CaBv9XnI8b0ib3lbawGImyauDazjWgpq0vpuS3DLEa3
         VFNKw6+qKUgEgB1oHSmAs5ecOEEX0rIdjLYin3rVGyU8hX67loZvACVqZUkj6ppfKeHt
         HTL3HaA/cq6OLEgXK1jwryv2msZMa2axm7ykdq+H4shnk7fLWpazs/Dn9S1/XfUTmX7b
         kqgIAG5wYjq0X604eT2r1WIP8/g8bqLT00YcPz7vnOOQ2eeWs5ouhNxtQRo+t+tTToF1
         jo392tsdUfFVbsfe8gI2isSB7a4EFKrOIUbqzgHAN/3kRQ8/QRIOjpuTktObA4O000zX
         NfmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=5hUapDdSTy6UoCaM66PJkqib1gmdUsvni7at3Ufdd7s=;
        b=EYLs8a2JviOlnfTRhK4ui8beSzTqo5mc/HVtNELxNnEDWRoffCrt1RlYuIhS256eDf
         TWMhyQDyF2UjvpV9xNwZrgyutalNu+F43lP8TdJjTJuPUWHUOf9aq3bUbyLkhQE6kX66
         TJbN++Sqq7llJyRRPB2+VnEaV+yCOgHknDv1Ma6jhrqA4419lvoeTNIGZ1E8p4H6aQ13
         0I0P3wFi5THZVMNUD+/hQJy32Zb+/NvXW+KD8gRUCD6y0bOUJAnYDk8pPpZuWx2hNWeU
         lXCZm9azwZSJQOgBUJRXKrseNlkbpRtsAb9/njbbnlmJMRN1AtLVoEYtuP0tjm6q6mLn
         dojw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jHYnvDBV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j10sor26873870pjs.3.2019.12.01.18.20.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 01 Dec 2019 18:20:32 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jHYnvDBV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5hUapDdSTy6UoCaM66PJkqib1gmdUsvni7at3Ufdd7s=;
        b=jHYnvDBVn58Ny1PQUdsLQnJQpPYnabVyORpefXghJEcMTp7k4NYdar5CnmOMda27XM
         GT6yYXdrwrLII+FwZrurAeY8wq3XhhRTMM1SebX/zEjLTMursTOHxibXwWCc7xDbtB9Q
         5Iy4Usnd+d2xeKoa8SkQ4QtE5EYvTmzOW24EawViHoBQtr0bF+HPe332P6RR2QM125k5
         1hB1Re7CEYWSMCN4O2nzUUS9hKjT7rR7QRDjMlLvVqfyLOd0mZQ0+EcnKIV6iXlZ8xU6
         G5P0IclncwYpW7g9Qp5iDC+ShhFmcc8g69hYDLgGJvYN4jrLVAhFoHXnVANQp29RoouN
         UO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5hUapDdSTy6UoCaM66PJkqib1gmdUsvni7at3Ufdd7s=;
        b=e0GueT3UJ1YSdzflTO8FLmLLE2gE83WFuoMRPuf+lQYVzCcOz8yJNL0a1qi8v8mFJB
         N21dsCk4C4s7TmNlHS7grf5Bp9AHB4E9At+9yB3UH89seWAmt6pRZPfJ4NSBV4I/p98Z
         HIRJz0pnz6zbGKFYPa3lKW6uKPWlW+F+1FtqLyK+d1F3zccwFx/cJF0pd4aewSI1URUD
         DiVk0PW8tUgU6zYl0WvkpxU4u24L4DGAcp5U3sDvtWvQYDKm5AjFQsFirIGUQQoAg+XJ
         RdqRVABOBONsRxix03QqOsQJupRYCW3dS4vkTwGOK8YlPVcoa+ztl4stLM2SgV35a1m8
         tyZg==
X-Gm-Message-State: APjAAAX75AAjlEBsgyIWjeqPo6xQ5BQsHPFJJtzaQOaKAgT+HDBdy+5J
	1yYuI7T73S5oZ5Gfc+Uhm+eVDQws
X-Google-Smtp-Source: APXvYqzcXDYGSuCRSjKxq1xJuolroMKTSgTJZV9U8azUqGUsCSbKV2uX9/86J7AjdunGuI+f6h+ZnQ==
X-Received: by 2002:a17:90a:650c:: with SMTP id i12mr33314855pjj.28.1575253232515;
        Sun, 01 Dec 2019 18:20:32 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id u7sm31314045pfh.84.2019.12.01.18.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Dec 2019 18:20:31 -0800 (PST)
Subject: Re: [PATCH v2 06/14] target/arm: use gdb_get_reg helpers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: alan.hayward@arm.com, luis.machado@linaro.org,
 damien.hedde@greensocs.com, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20191130084602.10818-1-alex.bennee@linaro.org>
 <20191130084602.10818-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b6b96831-6f07-f452-a888-feeda7b57802@linaro.org>
Date: Sun, 1 Dec 2019 18:20:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191130084602.10818-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: VwBh5dsDivIe

On 11/30/19 8:45 AM, Alex Bennée wrote:
> This is cleaner than poking memory directly and will make later
> clean-ups easier.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - make sure we pass hi/lo correctly as quads are stored in LE order
> ---
>  target/arm/helper.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

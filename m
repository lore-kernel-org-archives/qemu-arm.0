Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp319718njj;
        Thu, 1 May 2025 09:25:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV4iARhG3nF5RKywpbyPsqlWr13YG85uDGv1gbz1ti+lT7x5pF6nmYfqpY5JyffZco9G5vFF2DQDNLYtg==@linaro.org
X-Received: by 2002:a05:6a00:21c2:b0:736:65c9:9187 with SMTP id d2e1a72fcca58-740491afadcmr3519381b3a.9.1746116707807;
        Thu, 01 May 2025 09:25:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746116707; cv=none;
        d=google.com; s=arc-20240605;
        b=KAYRV7XxK1TRvrsUVve+n+YD2oufMi+qtzM5VwGlvfp76XhhWud4VA7b3+tBtmtnjJ
         om8uWwyAWz0nPEoDcl/Cr9i2RgNbwOnzVqD0FF1RjRZZB3Yb+Ccpe/z+p1p91jCluPwA
         s6vd7CeS0XgSFjAoRgjivCqb/Zkm3HXlMuCFSNVdEaJpq9iSGxp6YIAqvYVtfTil4fle
         xKchHDL/13vLAoyv/BPrEEB0o3xmWdBt3ci2x3qX2i0jrqyd3aw5Uu3ZqfCKqgxybZT/
         JJpMqMVkFbaVrtskW9HbxLRucjrWnRzHFzYrbdIGZedbkFz/0hdTzInmttoeRQa/0zip
         crnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VNk59ZUe6VB2+qVVwcJX9X+M3hgSClHFSRBg0Eem0Gs=;
        fh=3myoeUmaQ84vk3rq/SPbXEaEd/vjjUIOepDfI8LJjEg=;
        b=CbicPc9xCf6e/Ob7CLt3XxIGVq+S8SsrKNDwbTxkx36PTdjwT9cW89nlurG4SE9XIa
         oJxbG0CyWG9qz7KmX2OjxxQkaFJFix8JnFeX3rfhZld1qQ6XBuqCZv/nn8rJVLHtPpRd
         FcmTjS74A6nm4leStZ07C4VKq5wTBAVHzsQPlIhnYF1tJzcRdJUcu0lqJLqLZ/Gt8gqI
         V6ydV0p0W+7Jk1q+1p3tYE3KfIf8HYslICKB0Z/1yIcva9sCImyWI69SOoGMuuWOP0l9
         dQqvNKq+cxqjK1UaU0jP8PGnkqa+pld52VA45Legkjeh8QGk1R0ipTmFrig9ABraabRU
         vPyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zdHLSDMu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404eeb1379sor651754b3a.1.2025.05.01.09.25.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 09:25:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zdHLSDMu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746116707; x=1746721507; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VNk59ZUe6VB2+qVVwcJX9X+M3hgSClHFSRBg0Eem0Gs=;
        b=zdHLSDMuC0p37OHyR8OwKZfne8So5bufJFcFRXgasf01Plqc6tNIIVAdtwcLKI07oY
         SRNQGn5l62Eoks/5Nmz2ONCYVmottg+CQU/yGGQsaxyRpxcVi8sEYP7/2s+JVM6hTPc8
         xgv8TaE7UkcGvJD+dqknKdzep+ZyR7nm4r0ICSH0Gv51fA4Ca8Q7NgY+oyGaUVZy7Evt
         oFIPWQMCRk3Ftm144+4CKHcBQ5zxrakv61bHfI41Ad5bIRTVBGHoWZoFGlGtuhnLjwmP
         4Oa1RA7NWRH0Xc56xgx//B5AYmcIZ+1LyhVoyqsAFyYIqcpByMX95hPQZkMA/E/Dc2cg
         Hx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746116707; x=1746721507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VNk59ZUe6VB2+qVVwcJX9X+M3hgSClHFSRBg0Eem0Gs=;
        b=nvVYUiy3GNjHx5Dkr+0eFUtw6RSkIxnG/bt1Yz18XaIEC6TycD5aSNVa6uaxYvRVU3
         3zBJGnAIB4gOtPMGYDOibHiw9ExbKUfyQFE545FRkBXgwLJ0fWavI2MPsJu6cM8Ofaec
         XQhyvG+p6bJQDWxH+jiaQ/ywW1zjog88bL8laYMmmo4YsNCtwU4YKxmCRUwKQFtlf8ON
         FVdg8jIvSDG7UuI7VHo+nFVzj8JltcUXr2QpspKx5zzeg328dO9ZhhFJH235U3roe9ew
         V2dBx6/YoXlfgIpPPDkTsga6evBjCWrrvYQ6/FsRC2VWy6LUwmb+v4eZnc/SwZcPmk5v
         25og==
X-Forwarded-Encrypted: i=1; AJvYcCWlc7SLevKJHAfWYux5uZa4nWg/FB1ufpjnfKssMd/A+gyb8tFlFsLgRPRmcmYhxIhRS+q0kkMyiVPc2A==@linaro.org
X-Gm-Message-State: AOJu0YxQQK80pfErPmot55n+dfpFxRutB1S2hTsHnyTNmstPGgOfLW4B
	Bq/BFC63Szx9kVjemaX5/+qog2GiLGXMi5w1bBDJ1/m9Kiua3w9q0T/iieZwB8qyJA==
X-Gm-Gg: ASbGncuo+QiXSGMZaDGT6F1evBAhbdtWSVu/uvN4fHM6aQbYZW4/eqCLEYlw6RnNKd4
	DFWAgsu8Y0a3EpazzOhWze64qswiu5abVgBkzvwYO4CkCudcvxQr0lJwWq1v4ofzElp2hoXD/fW
	wZv7Zhg5eF2WJyB0Jr/RQfdf0iBHjU+FviU+hLFVoGfdGbYOIRzfCKxFeXNXVSynCYf9vKvs8hQ
	wYgz61wsusXObYSUhFWNAQr4ZjGJA/2J1EKAyqFdK3V5IUr8csIUvQIQDg13gjsfKROYtHP8D2J
	KRgMfVRzeSUB9CxjAmkpHPIwcaqbT55hE9CLR6epteOWAVyeClc6zKWe539MppdKY8zC+s+ONZT
	wI0DizW8=
X-Google-Smtp-Source: AGHT+IHYs10iloHYrQh2kjmtAsUkB8MQeuBbK00pRi5XkfUmMDFdDqej7kPqvmBATt7xswRBv62qAQ==
X-Received: by 2002:a05:6a00:2405:b0:73d:fefb:325 with SMTP id d2e1a72fcca58-7404918322amr3877125b3a.5.1746116707417;
        Thu, 01 May 2025 09:25:07 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404ef14af1sm1005693b3a.48.2025.05.01.09.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 09:25:07 -0700 (PDT)
Message-ID: <59320c42-466c-4c23-8da6-91aaacf48f59@linaro.org>
Date: Thu, 1 May 2025 09:25:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 33/33] target/arm/kvm-stub: compile file once (system)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-34-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250501062344.2526061-34-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: UgJ6dVaXILou

On 4/30/25 23:23, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/meson.build | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

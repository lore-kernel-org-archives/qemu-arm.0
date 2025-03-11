Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp2021830njc;
        Tue, 11 Mar 2025 10:40:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUiqt6mU6Vc9JbQe4DjlRYFSbMnPdkteR/lcu/JbklJeB8lcCdw8gIn2m5HzJxD/ffIsgIn6dXuZev8sQ==@linaro.org
X-Received: by 2002:a05:6a00:3c92:b0:735:d89c:4b9f with SMTP id d2e1a72fcca58-736aa312be5mr27135850b3a.0.1741714836946;
        Tue, 11 Mar 2025 10:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741714836; cv=none;
        d=google.com; s=arc-20240605;
        b=LHmFR61Pa19LnwGYYTXK5FZLm8aF2qhqZELbcHsWITX+DTTPci3f3kBu8Ba9gRlLjp
         iDjK+a2W54ti6shEbHYKa/EXFl2HWAQdbjAzbn+A6Mq1UXJuZVo1mwauD6cmWHfjddWK
         qwFpi3ZFzmGxXRoErEuiBGWOoDB2baxpJfunTzegi1lNoFDtQAl57BYJdwBla8TEi5oW
         DavowUIJUkt99h9s5GRD4Bchia58Xh9+JSYfa2xvC/FpcU1zLgCc5JM8xJFTnctYQEB0
         T3cCpuHQqlPlNjGoEkDwdXUk6d5GZMjIEOm9cz0po6rQp71dKrp9ohDBy5Vqv/MXaOlf
         PAYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fJoSgtJei61Vv1IRCa8Xzx03ffV9RuFjSgTUQ60+Pf4=;
        fh=iJ+EvLDGBsUVM9LcRiLN6CPPDryFkwAEjM6VDiXdDWI=;
        b=Rr6Ox4xLqLVdd+MZ20g4rdH9wi8GEU5BrghJmNUI2ZS6Rsof88fxBr/SjHuwAzrxNQ
         U0Hp3PMG8hkqhAxGhAiAMRWLxGyUgLKutpkcHkl49qGxkS6hRYzXUrvTpdM8vxrioTd0
         kkLC6QE315HcdQvfKdb7qlwYRcvE7aBtdVwZMSAUcHtwQzV8dW/BuT983KbwCU8zeFC8
         Z/eBjsJ8pBiKNaO3bChoulOm4jT2XfUe965+1rhZ66DlSHNc/hTxqUkZUxWNw1E8TyEf
         GsOR731DBViANLOKlHmzxxqEqGQYxtqt8EIktZ6cvJeHE4+Qa41rJAosheL6m9f/O1j8
         1BgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HUobpOsJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af50b77042bsor4811988a12.5.2025.03.11.10.40.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 11 Mar 2025 10:40:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HUobpOsJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741714836; x=1742319636; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fJoSgtJei61Vv1IRCa8Xzx03ffV9RuFjSgTUQ60+Pf4=;
        b=HUobpOsJEo5EVhsakAgwjEWbz8Vgu6DbWRJB2M7lhzP7y6jvkzAdToIbgP4x9GPpRw
         2VulfM46pIG1g8nGVIx2E03XqvdLaUq6ZYT6cMM30B6he8P4uqdz3Rr/zJ1uvvQBWRMc
         1OfWutHTzD8SR3U3fB2nR9eHsCW35+CUSwx9QtdVirpzfo0FnmB+0cacUw/C+S9KPPJt
         Xo9WYQA8bfYu6ejITTTrtCvqdswWvkb5nM9A+aoaLGJFFcSuGUoOIWjO4x2u6ubZtJqV
         8pxqTzkodfJ+NG91LEDnF8E28o69JWv2JmYkkRRfXremZfYAkQ0MFUjZfW0rtf62ui5U
         pndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741714836; x=1742319636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fJoSgtJei61Vv1IRCa8Xzx03ffV9RuFjSgTUQ60+Pf4=;
        b=PR2rk/QBFxwytE5Wp2ulrXm9tIwCjqz/BRC10T/B32qf9KtaSjdiSTCh8DtyhUcN37
         PQQjQysCc0dOieaIjXpJOQmqbebpVFEy+7hN88WTIaIkXOqngZujUFHVcKyhJz5CsMGd
         JdhZgF9yMttSxOIN0jtOv3EII2TQRPgnZBzb8KDptlMkDLr2c4hsJF98ucRbJ6MNxQ9Z
         hj5QDiJaNMveahU1OVesqK7grC9WuMGL6iG2Kc0VoisdJqkp5fNXIb2hGbx0b1WDTBY8
         yu/JGZWErdiTukIuHpGhph7rBzDO/36Oi3LCpoJ5jo/icbSNJGpfWZ3YFI5/nl0AQx7/
         uTCg==
X-Forwarded-Encrypted: i=1; AJvYcCUKxh6ZZ6jmXf2tkDiXAAP6vb4vyFqnl8vT6k978YpHGQ1vz8OXxg4Sp4YFYI8bnUQhZmy6M+0oAYjqvg==@linaro.org
X-Gm-Message-State: AOJu0YwUnXMTIoP8SKbsGexsvrj9npod6XkCHzSZUHetdcwZ3DU0Vxfm
	WbXP8VLg3gNLwTYM7liNkGYr0TWZ/GevCpNdHQJ2q2G0vbIUeRLWmOe9xX+w/TqLSQ==
X-Gm-Gg: ASbGncs+Lfw70yTaNEKL9B3l+CfgNXdBDA32r+IzsAga6qmt306DH91ZPVX4SNaRbV4
	J2Z3nCjQKRpbSq0bo3FORc0no39wGiaK2NSFnirv2UNxNYPbjekveEugOsDwFJ9CXd0U01iGdyg
	iCWNu1UG5U3OeGHKVjxLwVHJELFHu/HkWI6W9J6mA/arqI54YsS7IZVPf67lBEo4LLtjf+xTNLI
	7tT5CsVfebjd/+AAjf4hXWfMK0vpIIlZIDZnhBJ/3yihM32osrAA1kQsYtI5i+8eg47pUEH9Ghr
	8Qb0bO10/Ii9ZekYDWAvTOFEN8cTXKr2I87IsRNk1ZoThwXsex8BwCEMfgN2l8I7zIkvZHfRNCc
	botpSbyVY
X-Google-Smtp-Source: AGHT+IGlaR9HwjrPVHTQyRxHtXjUtcHCgPfmVSkbp3ZKMt8nZvn1Cdbu6c7wfGboStIgwisDcZkQ2w==
X-Received: by 2002:a05:6a21:164a:b0:1f5:60fb:8d9 with SMTP id adf61e73a8af0-1f560fb098fmr18554773637.33.1741714836477;
        Tue, 11 Mar 2025 10:40:36 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af52f391035sm3669478a12.77.2025.03.11.10.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 10:40:36 -0700 (PDT)
Message-ID: <37fd4871-f3c5-43bc-9dd5-1c0f72dcd392@linaro.org>
Date: Tue, 11 Mar 2025 10:40:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/14] arm/kvm: add accessors for storing host features
 into idregs
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 eric.auger@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, peter.maydell@linaro.org, alex.bennee@linaro.org,
 maz@kernel.org, oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 agraf@csgraf.de
Cc: shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
References: <20250311162824.199721-1-cohuck@redhat.com>
 <20250311162824.199721-3-cohuck@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250311162824.199721-3-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 9/WiAFyT1IOR

On 3/11/25 09:28, Cornelia Huck wrote:
> +/* read a sysreg value and store it in the idregs */
> +static int get_host_cpu_reg(int fd, ARMHostCPUFeatures *ahcf, ARMIDRegisterIdx index)

This still isn't used, and so must Werror.


r~

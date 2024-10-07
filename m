Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2196127njb;
        Mon, 7 Oct 2024 14:09:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQnTOSeJvjgCf56IhBsL1rFTBgxnAyVU1geMwU2PT1Eb8k2pR60BL1Rvk44+YXsHoyQejFWOtH2dukLQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF1C4LnGp+UxmqOukwfC0Lm+M6n0cul7Z8fSTjKYWBE2EdUIoF8k+ZG8Zm42o1KZrAbULqL
X-Received: by 2002:a17:906:ef07:b0:a86:b46b:860a with SMTP id a640c23a62f3a-a991c0756a5mr1424656366b.54.1728335362483;
        Mon, 07 Oct 2024 14:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728335362; cv=none;
        d=google.com; s=arc-20240605;
        b=DTPgf6rbgEaOBOERjdOFKMPC1CeH/PpYLJiNUklqgHf552dK66NWlnmFUjA3S7e7Kp
         8mIWf7aUwbBb/SR1MHPaDru7OkMSKLWBN1eKg3pkv4/NNhq1YDkeAeziWu5uQWSDgw0u
         hedVd83SFzJTvQZDbqZnNYL9QhbzlGnXt8jzEDh096YpzmY1J590FbOZmM5Zx0J+OiYu
         PUAS/iyeZtFdqvM3bxTEEmsJb1Uw+MhfZpiODvZtQKDcwJbev56j5siPApGoksTPNLNs
         7YvjiFsc0DrMaqbf9mEiUJimTza8xp2g69BdjtehXhebgdB2rpD2bFJT8fSmYD7NufS6
         r0/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=ui-outboundreport:content-transfer-encoding:in-reply-to:autocrypt
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=TyKCRNHmeyFgjDaIevWefebvU9noqHM5gZ0NJ7NBUOE=;
        fh=3fZ7Wohp6BUOfptJMglDqKETKOsQS3q9o/uj1RhoDNQ=;
        b=AqOufKgscFov5bh+g9lGcfjg2QumhiS3cs3cLDvYM2C/yiT6B2j6w/8xMHfyEhDFc3
         IylfN+fZERHUrCAVFKRH05/6lpVss3tA+szQPdvbjy3dvfEfs27QXzjUPzKMKi19C7kG
         VHM8YFl0xwU3DzoEmHqVRO9ltYAw61A81TLx2vwf94/cgaxLk2Wsi9WwRcaQCbU4Ejki
         afC1JdhLBe+UUatUONfKd49kGSuVedZ7xVy4cj1G/traI8Rlg/X4YlGoUt7vrmKrU+kT
         lfabaXBoFImX9mKBtKVf7DJj96cF0yXnnT4yi2CIX4ainq4wlqgodml0Z4CuuEqiDbIU
         PUYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=qMKfh0nn;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.20 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
Return-Path: <deller@gmx.de>
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.20])
        by mx.google.com with ESMTPS id a640c23a62f3a-a994616db66si337394566b.92.2024.10.07.14.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 14:09:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of deller@gmx.de designates 212.227.17.20 as permitted sender) client-ip=212.227.17.20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=qMKfh0nn;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.20 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728335361; x=1728940161; i=deller@gmx.de;
	bh=TyKCRNHmeyFgjDaIevWefebvU9noqHM5gZ0NJ7NBUOE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qMKfh0nndex7u3T8M5LTv33MshgNYUUAAfXELrnT9v30ITAliY5p8umvEInJ3Jj/
	 ZsvvK3pdGtgzDy6kWIXB8bKWclWDuPBB4CB7wWIEqYnvPZQ19o3563laglmxxkFye
	 uXLz7+CfetpOIqRc1PZ6DMUpQkNmyIJnfqeobtk7fc3Kh5oqcCOW3NXBF1AGmL3xJ
	 To15kWbaWNXYmEPbD3LbycjGet2/QCx/WE3RWNzN7Gg7NhmZ9ZpWWTLrLGJaDtW76
	 dUIs1g5fcDON9vpxEHDvj6V+MQcB0OGOdMEOnuj1rMj0KP6+DWtez5Q2aYhAevLMd
	 iY9i11crY0Kjmic6wg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MO9z7-1tMKgy2wtl-00LSxQ; Mon, 07
 Oct 2024 23:09:21 +0200
Message-ID: <1e416170-a14c-4d78-8141-412c32b3dc0f@gmx.de>
Date: Mon, 7 Oct 2024 23:09:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/21] hw/core/tcg-cpu-ops: Introduce tlb_fill_align
 hook
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-7-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CP1aOEoy66qdltkCQpaCnXfu567xmDWznClWUj5yuvS2uB/x74i
 AdvnpUnRivYyrYrKZJABlfH73B0HXA47nJFZyjanL2+BvpN8zTfYwFCICfS+SU58WQTlMRA
 GC1YTYfm1e9IphCdAbOuhRPRp9m4UyXU2ATX76/q62qyjaugdbrL/qqQiCV2jL+PWV1rc2m
 r6qJTO9k6hQohTpsAlfjQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:o6721oMgQFQ=;aztqfcqVxCBSH1bP6/4kwyEUxXk
 kQgEyMOYrGGjmnIaJAzpoQYGK2a9irBFMTASaHmkyBn5sKWgQz08LKi++c6GUyxTjKeUCJ+Zw
 YUL39hYCoRuI+ir+OMdYcYKPJ97jcYQoDB17lmcXVUvt3DCitFUb5EJ7dcV7Z9SNKnhghKQGk
 4A/qsqKbPijZkiQJnoVg7ldupNzENx4RBYvxVNYwQkE4Gqet78B0ikKJo6owTbrzN9THO7f7T
 ufr4U0flUr8cg78q5pjX80belOhc7oIdxJcUDldevgi747kbN1K1OuvBcJNxVnFLpryvIwDtU
 jv9EnBPI2hQzJ0utgKoWzaOApC5NERJ/5TxU59bwYRbddDJQyQT1R63NjtDHRfNjnA897wYtq
 eQTqhrZsFRoCInrItf1UrkjolYxldb8DAtLek9uAhtoeFCSI08AT7in7ZWpBqmh2W1kNW+fpr
 dFMvMq+YcWnFal2JRDl9BK7X2ZUtcdewVIx3H0Jg5Fo4BH2/e71R/VVB4gIfAH777Gnv9iGw/
 34r7O2q91fIOLsfVHj4iZ8Wc5IJ/tgvB0PjxOpYHtUUEIkgKf9YEqmnAjYNaWK98r9M+11Q/l
 dtfobh6IQgyWpn+65xwRzXYR+a1Z1VE0gAwa+2tUcX5zJjxDirwKxtWCYPQUfED4I53I/CBo6
 dq/dlGIDb7SF9opnXC7HQYXcNHvUoWPuiiPt4ERV3v9/OSiaOw0sMI5iWx2bJ5XZsRQLO40jk
 dtZ6I7nrHHcBHj/wbSvjxS0VmekgCzh6+kFd8b1sEGnp0DiXKnEhDnUN1DO2y09pFU4RFNqzk
 fZVZBwr/0YJO4OyoMq1yhaCQ==
X-TUID: XhubWYU+5sKF

On 10/5/24 22:05, Richard Henderson wrote:
> Add the hook to struct TCGCPUOps.  Add a default implementation
> that recognizes alignment faults before page faults.  Populate
> all TCGCPUOps structures with the default implementation.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Helge Deller <deller@gmx.de>


> ---
>   include/hw/core/tcg-cpu-ops.h | 25 +++++++++++++++++++++++++
>   accel/tcg/cputlb.c            | 19 +++++++++++++++++++
>   target/alpha/cpu.c            |  1 +
>   target/arm/cpu.c              |  1 +
>   target/arm/tcg/cpu-v7m.c      |  1 +
>   target/avr/cpu.c              |  1 +
>   target/hppa/cpu.c             |  1 +
>   target/i386/tcg/tcg-cpu.c     |  1 +
>   target/loongarch/cpu.c        |  1 +
>   target/m68k/cpu.c             |  1 +
>   target/microblaze/cpu.c       |  1 +
>   target/mips/cpu.c             |  1 +
>   target/openrisc/cpu.c         |  1 +
>   target/ppc/cpu_init.c         |  1 +
>   target/riscv/tcg/tcg-cpu.c    |  1 +
>   target/rx/cpu.c               |  1 +
>   target/s390x/cpu.c            |  1 +
>   target/sh4/cpu.c              |  1 +
>   target/sparc/cpu.c            |  1 +
>   target/tricore/cpu.c          |  1 +
>   target/xtensa/cpu.c           |  1 +
>   21 files changed, 63 insertions(+)

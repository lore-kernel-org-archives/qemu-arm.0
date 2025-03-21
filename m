Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp497463njc;
        Fri, 21 Mar 2025 11:04:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2p/+y6RE0Wjpbg2ibo7OTLEme588a+c1mv7p5x9+KmlJiNW2HkU68ozXW99b2+EzgN6s0g330giEAiA==@linaro.org
X-Received: by 2002:a17:902:e888:b0:223:35cb:e421 with SMTP id d9443c01a7336-22780e258cemr61937425ad.49.1742580255308;
        Fri, 21 Mar 2025 11:04:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742580255; cv=none;
        d=google.com; s=arc-20240605;
        b=QWoWEWN95iNYI7BNLvtjcGRMkwZSwQClPNvaTWUFcaHsfKjAaN4KAk3nl16wqSRJvJ
         RizMQXiAM6PWms84op/z6DjOC5U3Yg5gFfhUhpWTvDOPgpA30Q8AIEO78chDXJqiXpOx
         UtRESUnk04e379XmlWrfE28AJij/K54PbElJSrsH/B6XueZdG4cNPziNQIQGazXxzJwj
         KlFA24bu48Cv/vsUB9NmTtzpTzKrtV2GhHPw7af8udTCfNznCdNYNv1VeTIfY1Oo+sLr
         UMk+glddVZBUz5oHQTcMUOzc6qzA56uAmdbZBxIdq9/npo9FbBOvWFeaTcJk7s9kz/Uo
         MPaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PL0qPEA+zXgSlNQNFSDmg2xA01GQB55ILLw+Apqjr2Q=;
        fh=1vl+23KLviVhC9jf2NJCpHnjtGWkiVYM2WFwFETY+PI=;
        b=bsINh86zeAKv/omo41kRyIo2wAMEvzoQ1ryB7CzhCF8hbc15HlBuo5KkwbJ/JLUvAi
         DiVkpXzfCru8JOTud9sjLHWGSNNCraGL3qUTHxFIx4cGfhDxyDXb58kt6sSg6+tPbstS
         CbRjdUFQY3uu3hsA8eqSycCXkM0nLzqbEmSwHeCjMHGNP18wuUs8yNFovZ9ij5hW58WA
         WS8FyXdzo2GKIWIpgXdSXxK3eu3GFATe1tBMZ4LpFnf1ZRD9oxUxexI5AdAoV0DWVmHp
         XIZjk12IQM2o7ZiVonyQLBXULa/tlsW5EOYEouYqGCL6vHwu2kKS5jZ2R7TsXnUhCh49
         A8bA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dX+MahHP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-3030f799e3asor2054913a91.6.2025.03.21.11.04.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Mar 2025 11:04:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dX+MahHP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742580255; x=1743185055; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PL0qPEA+zXgSlNQNFSDmg2xA01GQB55ILLw+Apqjr2Q=;
        b=dX+MahHP0ypx3M4f1q7PeWQWirWG4XsNSYFNaABjTMswoUGhpWWd0w9hL+jVRKqf6M
         X5RPp2IyUWEh8NAgF5caoO9pUvhQf/gm/oN/rxSzapRAkG12HfbtMGdSPY7ZyR4GRVDi
         VklM8oWZ166trx46G0o3UzzM4SfAYVI7azw4WGOLfL36eQIfUZv5Ms2T8xL6HdSzhWAr
         aQ2RRSFU4O/oG234Ic0j3musoUqYBcpuGaa90cdU0L4iaupA7z7P05m1a2M+sqi0ZyH4
         CEPlgdgbkI4UdK4Wf3ewtM7apSgvQnY4odmKwfjlY2+W3IyYuyQnuyjesWn6TED9lYAX
         SvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742580255; x=1743185055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PL0qPEA+zXgSlNQNFSDmg2xA01GQB55ILLw+Apqjr2Q=;
        b=K8VH97lAFd7ZYVDTzeH0pfWIwPdEguUq8JfeIFHpUXoMA6wLPJI/ZtfYveRPHO7ACO
         boRxy61RLemwDpRZlJkdiBxqvachIFjCBJx+vVn3hiI1aIrmV/jYIL0lwBRJEfsD+fEy
         sx734iDDBQsitxKkuLzwux0V2NwtMnasXzKuECbGraauLKHTp+q+99EulleC4I35XdLC
         VW9IC+LKd6WQDkOQBu91+LVo1+wohnWvM7R5sWvoQxC7BWMk4lK3yzJrzaiIE06yievX
         Of/dmz5aEBBqJnD+thnm72aLIDLJAFEnnWac7lhH+hbGgC21Tqw6W3ziYHvf0P4N9Pr6
         axgA==
X-Forwarded-Encrypted: i=1; AJvYcCXh8VagwbSr0yxzPxun2wvyO9obllDAXon1yzPf8zJVDBTpduR//HfKgAMdbwjHgKgx7WAMOut8CjB9Lw==@linaro.org
X-Gm-Message-State: AOJu0YycrYvgNPVDqJjfHhxuCcpkpsHI3IIk9iJIghfUNVqMyb3O9rXs
	M1i6Z+x4E174D2LMBdMpz9aVevR9pRJ2KxArWeN0sWfILW7ndSFh3im0nAFQYQTmtFAYkIZ8FME
	iPow=
X-Gm-Gg: ASbGncs0i8vzdoKwONfm+Zj+W7Av2tAzPAEgSUALLosbfaeLvZSSMcZYEC58aoIbSPh
	C3rZW/PnQXRYcp5aJfU8s0Kt19UwTDiwHwpLI0NLF+q5SlNmsxeptFN628rkZ+6FvslUuG7kaFc
	eL0qSSoJPZpHeuq35AwrC+wdf6bjqizgUPmCSCGtgO/eLDrNPJnynqUkT8Wbze7bbqwV83DWOKk
	IIzsRq80158XH06B4ZXlwRrhYkV/0IWrgAFBo3LCcSJakLIuhLVu3wnVd1e42amxx9DcuPONuc/
	aDJXpAeRrw4H63zPgMeMq31WQ8iBFCZhHe6B+VM4GTOl/NTIcoBtZoeM3xFH3fMaQbTR2XHOrvl
	IpPmVw1hj
X-Google-Smtp-Source: AGHT+IHKXjEUCnE6VzHVkCLtFKWbbVt3Ake1Wt6ZXFbYB7MNgjYHbGv/cN9TbzfMXRXziM2HTCsBvw==
X-Received: by 2002:a17:90b:4c0a:b0:2ee:ee77:227c with SMTP id 98e67ed59e1d1-3030fe72754mr4960108a91.3.1742580254676;
        Fri, 21 Mar 2025 11:04:14 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f5b782esm2369450a91.2.2025.03.21.11.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 11:04:14 -0700 (PDT)
Message-ID: <39d4c320-1487-4bf1-8505-5a50ecb9768d@linaro.org>
Date: Fri, 21 Mar 2025 11:04:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/30] exec/cpu-all: remove this header
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-17-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-17-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: GQfHZoJGqW9B

On 3/20/25 15:29, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   accel/tcg/tb-internal.h |  1 -
>   include/exec/cpu-all.h  | 22 ----------------------
>   include/hw/core/cpu.h   |  2 +-
>   include/qemu/bswap.h    |  2 +-
>   target/alpha/cpu.h      |  2 --
>   target/arm/cpu.h        |  2 --
>   target/avr/cpu.h        |  2 --
>   target/hexagon/cpu.h    |  2 --
>   target/hppa/cpu.h       |  2 --
>   target/i386/cpu.h       |  1 -
>   target/loongarch/cpu.h  |  2 --
>   target/m68k/cpu.h       |  2 --
>   target/microblaze/cpu.h |  2 --
>   target/mips/cpu.h       |  2 --
>   target/openrisc/cpu.h   |  2 --
>   target/ppc/cpu.h        |  2 --
>   target/riscv/cpu.h      |  2 --
>   target/rx/cpu.h         |  2 --
>   target/s390x/cpu.h      |  2 --
>   target/sh4/cpu.h        |  2 --
>   target/sparc/cpu.h      |  2 --
>   target/tricore/cpu.h    |  2 --
>   target/xtensa/cpu.h     |  2 --
>   accel/tcg/cpu-exec.c    |  1 -
>   semihosting/uaccess.c   |  1 -
>   tcg/tcg-op-ldst.c       |  2 +-
>   26 files changed, 3 insertions(+), 65 deletions(-)
>   delete mode 100644 include/exec/cpu-all.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

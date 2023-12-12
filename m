Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp868286ejo;
        Tue, 12 Dec 2023 04:41:06 -0800 (PST)
X-Received: by 2002:ac2:5dc4:0:b0:50b:edf3:167a with SMTP id x4-20020ac25dc4000000b0050bedf3167amr2557944lfq.0.1702384866635;
        Tue, 12 Dec 2023 04:41:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702384866; cv=none;
        d=google.com; s=arc-20160816;
        b=Da+yXz4VUqbeRDhvB+1EOEEuLb4TdXYq9a/wOjMIBM+3SxrdO4Cv+jQifPZgo7IW44
         BGaqDgKAmEMXL15xhpyi06URDFFFs896BPNHJ1+usopGvMMU8xwvMhEf5AHX8sDenrJe
         wOp2qrOonU6mp+VtBvrPqkZjO9pQ+xoxx/Wj+IDS93z0C4wgqAQoI/hM0qZqk6vO1y+B
         BoUPtSmRZ3rJjtUjnjeEjSj9N0XZjeTi2z0AIhblwaWWcUq8P6EP7NZXTYqYC0bsVVP3
         LTU7l4vLf8AXvoJKds3JWJHpd+ye5PP5PSMxTpc9ceQ+ox9zEqvL+ZrzpICi6GtVbGMN
         4vjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wlgXh/5dlxWKpmOVvCZZMz1542zi7cOXE65xucIWQf0=;
        fh=zb5cMKCGKGhw+gS3a3/5++vkWyTrFVh4rSXNmG3kpwA=;
        b=ceVNnbRW1SGZ6Zk+asxM1hF2TSxOcCGqLoTmxMsWgfAn0C6ioeiguunmd3Eyn37DG8
         OJ+LNREUsMqoD1EA75ErO/YFpahFqY/yUj7dzFWaEOopZff30sZtUm5GUjXZGOmq4FWL
         EZkBi/kJ2gw93I3sSfd8RVXnpjAB5C9XYesuGITU0zg49dukEUwoE0svzSzECTpqao19
         fAy12+woDX4pTqYC7/nSFj1qX2Pt4y/pJj5YExJizJBBVsHM5eNjHWVErcUVrIsCurgu
         ZCp5ACAIqylplqbL4tnRwWIUnKfyfLyGpYtn9v+RRYOdkdtguJ6XB8kRRZ39QUwHCPT7
         Q5nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bZeCSRdd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m2-20020a05651202e200b0050beb2f42e9sor2113760lfq.8.2023.12.12.04.41.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 04:41:06 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bZeCSRdd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702384866; x=1702989666; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wlgXh/5dlxWKpmOVvCZZMz1542zi7cOXE65xucIWQf0=;
        b=bZeCSRdd+VS6GQfzsnp4gi5TK5/l4sq2Og7LUXv7HoQbypkDz92TMuA4myeOaWbWAj
         Ll0jV5NQ9+9axvHQ005oxRxm+xg+tpwEsldPiqFCrYAcTRUQL/SWmgKEo1MMG8w4BBAd
         /abVTLz5W8vo8x+f1ttFPio6DnvXyocjoPhgfqAedcualt1d68gzgR7ZOHvvgJnmgvs7
         +h8qKzi4pCorLY6VqSvlb2Q03cga+voZWBznC7imiWSKSBRnTEIE8ug3S0ddCWwnIHvD
         vVqxk6Mj7PVJNCzU5U4mHu7oarfuONGdSKOj4bMqJO7tvmhpI3xa8d9LL/gB8tyWuKfX
         FSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384866; x=1702989666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wlgXh/5dlxWKpmOVvCZZMz1542zi7cOXE65xucIWQf0=;
        b=T++6SwB4InOpHXXPr52MvhEHqyE4KpOo2+GFuLa8eYBtA7nuXHcP4StvlVGNAoyuGp
         zO69JOvHGvaWArVXe7dVqpo1JbW0R6peuJl/2cnVw0laUS2qcgk6I8qyYNjsxJErhz3A
         A9NJqMOVrkdjpD+7VOp3upMr48NoFra1HNFq/FvduK+jFx4sojL2N++txjWeYbuchx2+
         PjTCgk7DsvzuHqxwvCZXDd5Y27XD7NuNc+MnsCmRZxa5KB/W6nQ/oe/kD74S8vZfG2p/
         htO3FFGopOzxTjSNToVi+hKNAjX1JcF59jt3xsEOm/uiU/O1iAAiId/URHiNcl9v1C3n
         3Pdw==
X-Gm-Message-State: AOJu0Yy7swHN2gLwIg0vra28293yXR3z/jrX52hJZUk8f65mMpjK4awh
	5rkK6DasfiEMlE4LTkCIahfy7L1s
X-Google-Smtp-Source: AGHT+IGVuKKXcOO5S+DYtylVPRV5Au95HHz+ZdrDNYIwMVahDpFTAQUfBoVTS6/f2pOnkEIlPeigJw==
X-Received: by 2002:a05:6512:1595:b0:50b:f78a:37c8 with SMTP id bp21-20020a056512159500b0050bf78a37c8mr3971601lfb.95.1702384866233;
        Tue, 12 Dec 2023 04:41:06 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id ts7-20020a170907c5c700b00a1b65cd1957sm6228907ejc.107.2023.12.12.04.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 04:41:05 -0800 (PST)
Message-ID: <45ce89e2-6dc1-4064-adb0-5c88e5ac78b3@linaro.org>
Date: Tue, 12 Dec 2023 13:41:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/23] exec: Rework of various headers (user focused)
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Warner Losh <imp@bsdimp.com>
References: <20231212123401.37493-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: hlDHZJdc1SYl

On 12/12/23 13:33, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (23):

>    exec/cpu-all: Remove unused tswapls() definitions
>    exec: Move [b]tswapl() declarations to 'exec/user/tswap-target.h'
>    target/ppc/excp_helper: Avoid 'abi_ptr' in system emulation
>    accel/tcg: Un-inline retaddr helpers to 'user-retaddr.h'
>    exec/user: Do not include 'cpu.h' in 'abitypes.h'
>    exec: Declare abi_ptr type in its own 'abi_ptr.h' header
>    exec/cpu-all: Restrict inclusion of 'exec/user/guest-base.h'

>   include/exec/user/abitypes.h                  |  8 ++-
>   include/exec/user/guest-base.h                |  6 ++
>   include/exec/user/tswap-target.h              | 22 +++++++

Missing:

-- >8 --
diff --git a/MAINTAINERS b/MAINTAINERS
index 695e0bd34f..1341862c2c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3615,6 +3615,7 @@ Overall usermode emulation
  M: Riku Voipio <riku.voipio@iki.fi>
  S: Maintained
  F: accel/tcg/user-exec*.c
+F: include/exec/user/
  F: include/user/
  F: common-user/
---

(Although maybe the M: tag need some update)

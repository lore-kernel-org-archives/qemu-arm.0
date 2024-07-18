Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1375772njk;
        Thu, 18 Jul 2024 04:32:23 -0700 (PDT)
X-Received: by 2002:a17:906:309a:b0:a6f:51d0:d226 with SMTP id a640c23a62f3a-a7a01353a95mr346793466b.66.1721302343029;
        Thu, 18 Jul 2024 04:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721302343; cv=none;
        d=google.com; s=arc-20160816;
        b=E8lhM5ur/Ts/+5TniakOPTl/l7bF+mraYluKE64AAnll7DaHkRXBT9oSg1TIJI8sZE
         upEKCk8zlyavKPcTF996ArKyVmeBRTixGihyjCa0oNSlUm53t7Z2X4j5QvBAkjX6Yg9p
         euhjQrbDRTLgtwtKEg3qEdSutuTQi9bEkzju8kqaxsNKw8aOosIUxsTKYd3/hwnlnaQT
         wol3aO9leCTf9t61Xybot9/54iKTB+zZQK2dn+zxWFWVbfb8FlzuhcC/q/3SCZ9qs4nx
         KL+u2T+SMYwHqOiUT/jl6oUH2rrWEAj0B2OO7NtD/hlyEOI4FVFwSCkPPlHJIUBqF/Tc
         3vog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ryIKyPb7RjkROR33Ga1OGU7ygAznzAr+5J1u0kZSIeU=;
        fh=8X6+4fQ3Eegt8YDX6OW9RI+0nIJojlKHn9XJunP2neo=;
        b=TLRs/R+rirovVqUdK2mKDSdT9H/j0Q6OrNCfSK/iaEulvDRrtQh5aTyjwc1DNpRjZj
         hMS+upc4WLA98OXGJIqE8KoeWlR2mHuL5BRGmKUGvVtkGR/092PRYqfi4mwv2gueh5up
         sv+9MaWc6+a3toDJM6BvV2pYcgBTeO6BD5ncHiCwFxSexzDDoD5QAv91T75u6P1Bb5ty
         OPNYXhITvsxniAnW+Ga5w3KNcooDPFBFAfbQdbyCbXckhlpxo2pHqcBA4lgnpeTMe3N2
         SWOstEEbP8lLpHuwKKHC8xQKTTcIQoTMcO8SE0AUhNfdnl7T/0kdWw5B+4sTmO8anRVb
         QV/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kQPZBfs2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a79bc8750fbsor287009066b.4.2024.07.18.04.32.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Jul 2024 04:32:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kQPZBfs2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721302342; x=1721907142; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ryIKyPb7RjkROR33Ga1OGU7ygAznzAr+5J1u0kZSIeU=;
        b=kQPZBfs2UmslTzgg/fW87ZoklSns3WaMkoge8hKb/OJDuqTtcyOipf7la8IpBHHM9k
         7vdxXiPIFWY8ztN2wd02TWUmNDsHt1rs2Ufzy6qKWRer7cFPbz0sm/91CevN5RO4kBU/
         pYa7KRe+Rw48TQTkkbdtpkaRLwAXbfOhfsWJzlWegrtfF+CWJJEn4XBbgr2JYIYkCknm
         pNXT6WhkmSJRSzdwooUOhh/OsYDs5+aKNrmFN8cog7rBhMgg8kw260UPptyx4DlaNmam
         EBw9GCzHU9WGVqqC7vi09+L6pH7WFelmQ80qdfuFRGqfb+c8QyjurjbDyG/tdwlY52uW
         NpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721302342; x=1721907142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ryIKyPb7RjkROR33Ga1OGU7ygAznzAr+5J1u0kZSIeU=;
        b=YBLx2obZnzGwXNfH5WTIC2nO+2TTLPAh33NOBp6rQDhhYcxR6gDCc7WbHRXWMSVu1+
         /ojDCMMV1aHYOEEZ25gN9J5DJdpj1dpIG4S5zRw+f4OC8JOzZAnQml2ZFuLGKr5GQK1L
         0H0rmSo2eoGrOkL/Mzgft7+0ecmBw7OU735zWJ7Nn5oH6FWy4voriyGvbsYVIt9FpRO3
         ho70If8O3ULuHQWq4hy2LnwEGV2IsMsi+HOgd5Cazw4XT1Dq2JR/PQZAyovAuLD5Odki
         fW5yGZ1EssSsEYbZGnPICVJMez77Ewo6Z52bQM8zTjfmgvzTZ6YEhPLFyvQ6M4+yvEa0
         nXsA==
X-Gm-Message-State: AOJu0YzCk4MUaCDYMKASGoNGADbkCKQPupLZ67byV+/baLwsFlRkolo8
	Jeca0rNdgaydC2htV/8otH/fGgSWNeIJmXpXGgyZVlLS1y0RncTA8nPkFP/X4TMQYJL7aI9Bmhz
	qUnc=
X-Google-Smtp-Source: AGHT+IG3IJ/43HLG6tMGubR4equSkkgvVKLiD1V1GQijfzXIvwg2UMnDOAvQBKco/yPgxQAYPKw8Mw==
X-Received: by 2002:a17:906:705:b0:a77:d0a0:ea6d with SMTP id a640c23a62f3a-a7a01145908mr306994966b.24.1721302340856;
        Thu, 18 Jul 2024 04:32:20 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.173.113])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7ff9f0sm548113066b.160.2024.07.18.04.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 04:32:20 -0700 (PDT)
Message-ID: <b9851909-5b68-4dab-9231-044ccd138f80@linaro.org>
Date: Thu, 18 Jul 2024 13:32:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] tests/plugins: use qemu_plugin_outs for inline
 stats
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-arm@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Beraldo Leal <bleal@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Ed Maste <emaste@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>
References: <20240718094523.1198645-1-alex.bennee@linaro.org>
 <20240718094523.1198645-7-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240718094523.1198645-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: h9gADr1c941H

On 18/7/24 11:45, Alex Bennée wrote:
> Using bare printf's in plugins is perfectly acceptable but they do
> rather mess up the output of "make check-tcg". Convert the printfs to
> use g_string and then output with the plugin output helper which will
> already be captured to .pout files by the test harness.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/plugin/inline.c | 58 ++++++++++++++++++++++++-------------------
>   1 file changed, 33 insertions(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

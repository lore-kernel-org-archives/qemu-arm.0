Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3283732dye;
        Tue, 1 Jul 2025 09:34:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXISCrJutFl0UqJ+tfCLu9HkCr8DsCiODwno3AIK+hMpCrv1BTxutEL18B+FHuir+Ui4CqGR3Jo+6iqGA==@linaro.org
X-Received: by 2002:a05:600c:4511:b0:453:dda:a52e with SMTP id 5b1f17b1804b1-4538eea4d94mr167609915e9.33.1751387695988;
        Tue, 01 Jul 2025 09:34:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751387695; cv=none;
        d=google.com; s=arc-20240605;
        b=Zx4AmVGsqMH3HIqvKlhFUMYx6hWFycXim1vdpNdSELcOcd0D1jZhfjY0v5dph4oYen
         u4NAMFLIm+1I710rJy/qYxSeWRE54BxOYRgExIaEqS2RBt61V9gkIxh3Uq1kz3041h1F
         UVO4u4ByjzQHskoY3rQf56l2ilEWrciXL/EZBJGIXEstrozDZ2azYZbgZ+n5ruCaZCA9
         4WLjt/eoLJ4W+JuIGr44vpdICICLSEE6lO7McDQHpN5thRanR+zDqztF0mTX+s2ImfnV
         I5UwC0yz+7/OJ6phhVdxn82Z4lBgGinSxEly9MIVenTTMFFN9IAPaCVbfbMKMBqZCNQt
         9ahw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=d2K10LNjVF7YPHB2xQYULfdat2hC8OE4Tb7cNChuI7E=;
        fh=Ea3Bltyw9oToP4MopjpTD8kHHhsC1N8tm/1CDoXqlhM=;
        b=X3GbTCfthjqT5dvbdCn9AzYKaDoxHrZzlyPbeHisR00Uq1sTQSKm8ElNBCTKJ+HrI1
         hE+fg9A198DxmSUCXLCwkmpUvuF/dJQSvNexvfa0NxDBSfXnPsmVAMOkqLDp1iMqdB87
         FNA9vndw7yrMcLLAaINBUDlm7aX/5eeXnKrMhTfd7fjw96RI5yMt0QFfrcgEL9D/wr0+
         T+04y2g79Z2cQIRjXmR7OlnL0TMYfBSNXLZmasv/gB23VCVC0rlMbp/lw8uBQkE+9QnG
         0XSu9AOTyPJ45zuBIsyS/peqxZRt1jGv5tWJzKr25A8zno7eO5cB24z33Qj41E3TY3a/
         k+8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wI/Vgkbx";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4538a432e30sor55271775e9.5.2025.07.01.09.34.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Jul 2025 09:34:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wI/Vgkbx";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751387695; x=1751992495; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2K10LNjVF7YPHB2xQYULfdat2hC8OE4Tb7cNChuI7E=;
        b=wI/VgkbxYYT7wtbyG6xtcRBPKzf8M2HtV4+lpvzn2IZZM1RbjFqeqpw9UKkThqaeTw
         5LoKj/mLP83x2sfW+QZU0ljWysL4fzGU9ztEYfNN28Z/MOm4AagGo0UqZfy5CL/jxksA
         sM/tfTgWLl6LhcPq8/6gTefb60WXhYv+BD/oaF+I/FQZ6BOTp6sFF3mXKwLxvOYNVCZ6
         BdEu8dHF2MOrIcIpcCNsD9bvG2C8421STfVj2uNGKdlOrD2+brLqp4f8AtnGFzbUQB94
         sFheaV+LUi6AvNRjohrL2gT/8bFXh67pqQRrUT6l+jNo0Fgy0XlVyWsFMXOL/Bf2JNRL
         r02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751387695; x=1751992495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d2K10LNjVF7YPHB2xQYULfdat2hC8OE4Tb7cNChuI7E=;
        b=l6XkJmaIT+6Ej47pUfimD9RFLjUGxh3kIClpx5s+Few03sdGE3rQ9aot7jeqWI8Hai
         zTI9Z4GvaMB4ZWyC9XZR/s51IaVdzpz12r1CXO85J3wJ/bD060+6Eo1TcxnVy3094FzB
         nb/GsIDixBdqkSA7OiiPlrWe3i+WSZTOOlTcL11zq1+achgzBHXNnkSzvw8WDLy1X6De
         sDAI8VX5lQBb4vYaHkPF2VKSwcMTq6jERiHWjsbymW6ArFGbNkO4/S/BBfNAz0p4q7wQ
         JtI8bQMc4yFz1dSa9t+X1eBasVqXjWme1r1RIL5LkCFfokUaAhnS5Gwmr4B/FNWVB64y
         CRow==
X-Forwarded-Encrypted: i=1; AJvYcCVjE2pwpPOwaLqGVk7ThAkXRe7S6/N81dbdRLO0cf7hV6ZAnAxiLLQ5fl28KH52il2hs6bu1vqXB8mw+w==@linaro.org
X-Gm-Message-State: AOJu0YwK6V3wWv+sBwF6cKrW+nHaYEqFGkHgvDET3q1sF3novGj720iE
	MO18flwQtD0RipDX6ZC+5B5G/btHoz/6p/zYhoUVc01z8G3JItk/6i/iSXvlYJ+yIjlORA==
X-Gm-Gg: ASbGnctE1l81Yi73xwZg5kJtQ1ALpxxargvEF1iaLpCJb2eOnRj/WxUXgynEPq/NPaO
	Gw1XxotWMniEFx70UuIHjogQ4IF1TaRJm0uMFuNoreZadb4TosRENoxSkgDVr0Q3S0pbCw8LbGt
	X1VUtiUpGJA3bJcTpWDLTRTp1ydJq6maHF1IT5PnTVY70ra8iFJE9+WFFomq6D5vjRhGwR978wS
	4iejYT9nk8RjZB+n6N+yXV+tmaNHANM0spuA8gYc/m6MIcA9i+Eh7J7nI84k/U+qGT1aOfLm2tB
	zUVZWaQwfDyVd2bVX/uhptu1U0o9sm804KpSDnnZvbCPenFIxud/W4TZuDhaH6TKF/cGz+WuqKy
	YoONu+BX7a5r7EYxA6xPV6G/3dVBOrQ==
X-Google-Smtp-Source: AGHT+IELwnWyYcu4hvfdvvbC7DYEvVdua5rlUoWfFzyQB8GHFmkYY6GB86F+9a8HBtGke/AvoPoUtg==
X-Received: by 2002:a05:600c:1913:b0:453:8ab5:17f3 with SMTP id 5b1f17b1804b1-4538ee837e3mr172158175e9.22.1751387695285;
        Tue, 01 Jul 2025 09:34:55 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.218] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234b30dsm200624615e9.12.2025.07.01.09.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 09:34:54 -0700 (PDT)
Message-ID: <30fb9500-b38d-4143-a4d8-d72d30a18292@linaro.org>
Date: Tue, 1 Jul 2025 18:34:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 25/26] tests/functional: Add hvf_available() helper
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Bernhard Beschow <shentey@gmail.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Cleber Rosa <crosa@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
 <20250623121845.7214-26-philmd@linaro.org>
 <CAFEAcA9MLMJBFk+PQCJT8Bd+6R+vaho9_vXmDCjPU5cp6B7LfQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9MLMJBFk+PQCJT8Bd+6R+vaho9_vXmDCjPU5cp6B7LfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: n5piqgBY+5EQ

On 1/7/25 17:50, Peter Maydell wrote:
> On Mon, 23 Jun 2025 at 13:20, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   python/qemu/utils/__init__.py          | 2 +-
>>   python/qemu/utils/accel.py             | 8 ++++++++
>>   tests/functional/qemu_test/testcase.py | 6 ++++--
>>   3 files changed, 13 insertions(+), 3 deletions(-)
> 
> This seems to trigger errors in the check-python-minreqs job:
> https://gitlab.com/pm215/qemu/-/jobs/10529051338
> 
> Log file "stdout" content for test "01-tests/flake8.sh" (FAIL):
> qemu/utils/__init__.py:26:1: F401 '.accel.hvf_available' imported but unused
> qemu/utils/accel.py:86:1: E302 expected 2 blank lines, found 1
> Log file "stderr" content for test "01-tests/flake8.sh" (FAIL):
> Log file "stdout" content for test "04-tests/isort.sh" (FAIL):
> ERROR: /builds/pm215/qemu/python/qemu/utils/__init__.py Imports are
> incorrectly sorted and/or formatted.
> 
> I'll see if I can fix this up locally. (The missing blank line
> is easy; I think probably hvf_available needs to be in the
> __all__ = () list in __init__.py like kvm_available and
> tcg_available. Not sure about the incorrectly-sorted warning.)

I neglected to rebuild the Python package, sorry...

Don't worry dropping this patch and the following.

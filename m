Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2619784lfk;
        Tue, 19 Apr 2022 12:14:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:1486:b0:50a:40f7:5a86 with SMTP id v6-20020a056a00148600b0050a40f75a86mr19726699pfu.43.1650395698759;
        Tue, 19 Apr 2022 12:14:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650395698; cv=none;
        d=google.com; s=arc-20160816;
        b=kLAyEjcaDNn76CqB48Ouq+srEAjMoG8s//Hr13BvE2bL7BuvF3q7nnu7NGYRkUICIt
         fpy076Whc8ksXF29rOWwR+xykKLZ7bL6eNQ2ZWQxyDfcZzMrKsfd3YSegeY23LYL5F6m
         Qjdb2P5MXQTjl90WmttgFW4cWVFvXT2VNsGMm08UQV2bMpAVlxlCmPM7Gfc3i4NTPnT1
         pyb4OE7ZAwtYcoZIVLj/b452l0oYWOW6GjwJ9plCpM0/mZ9HaieJBauTDlmQNoaMHNvH
         KapPcFtp9AATk68ZYW4Rrwk1thlNWpyvgKQu67WI1eZjH2gmEEZuDRgnRDd0MRe86cIR
         m+eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zKnUCqHVeFG8A6z5tyPjGGQpoRJ9Da4dEyIw20Sq7hg=;
        b=E75+ugzAblHeUwJn7ew5kow30u7m17/eitVeu0bdXKw122KM7+/hsxWFZ8ewtXX2qh
         HWxuybYuTflmuuHWjeBFDjnOejBfwEbuThBASYV/RunSkQSo9At16nZbRAhVqY56+iSx
         X3G+6vo+j3oBN2D0tIZFPy9O5AIe1n9JplmekTZh3Qe9/dGO4dN+U6hWrdJ6bY/qCSRF
         kFh/yLUAMGSb42XkQjLzxNk6SEI0eJJct6+dX6xH5CgCWoABNaOkS+D6U0Y6PBnXaARb
         u8ifs6ueUtYTCfu1XTZMmZLY7p1ngcWqtpi6b3ocycJVTN3j7Yxnf67vn7CnTlShCDsw
         U4lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fqodW7J2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id cl2-20020a17090af68200b001d2b2884a98sor128217pjb.29.2022.04.19.12.14.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 19 Apr 2022 12:14:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fqodW7J2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zKnUCqHVeFG8A6z5tyPjGGQpoRJ9Da4dEyIw20Sq7hg=;
        b=fqodW7J2v/I5TP/btLe4+42UYHJTKgnRS5uul6A4ilUAabgLzG9KxBTAiOzOoOoUWZ
         ILnPyv8FvrutweDY9/cxBQSQ/licy9B7DYC2UVcSvQUEVHaaVZJxrd+P5ioWoMsBWNcb
         zofST6e3W9AcBewOlX53A5lBBX+BKWkdsHzDy+eKJvRfJ30sqJANWv0/IicqctGWhKQp
         VRVAPM33ReuX4x6wmy/bJJvmHPR6vkyvRBtH20WIsLDRospiTbG2TVVXVi6DSTMlfYwg
         NazzRBIE+wxCXybCAL636vq7nYVgz6bwrnUrDBLp0WB/GrmAwpwCtReLmJu2ZK+e8pOF
         k1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zKnUCqHVeFG8A6z5tyPjGGQpoRJ9Da4dEyIw20Sq7hg=;
        b=4CDVvWFBMhXT816N3tvlv4+YTLBy9PYSZNzlZeasSPj8fzv28pmC56sN0Bq2Q6EB1N
         vRUWm4AOKJFjRHnp1d4DbNoHu7tWuSSHEPAEtyAARpkraNF9bz2waF5bMXyBsGHXXtUz
         m+fx7Ezuc+7JHTf1Jpc/umKnvridvelMZbYH73e/GEZUUDezGUBXWzHZoARk9bsmPNLd
         QO18/Srtk/yC07KaXswPdWvJckwEkkmvnD/uxrqxo2tsadWAhKCOB+JaGfhncxe3q5a9
         QDdyQhO3vpQg33lUYGt2bs3C2W2IbdaNkvqo9+71qDosj/MY8hbdFMumfD9h87FOfJcx
         2jug==
X-Gm-Message-State: AOAM530ZN8Gtg9MkG1yC3kQ11DiWRcyBSBJubisuXP3xohW2IJ/TeTxo
	Ao05VoTJqcgd87Tsl8yCTwpF1w6vZMhDkWfG
X-Google-Smtp-Source: ABdhPJy97WfRDbE1xdOVvT3dfMuifX5rS2h+L3r5B6o+cWcRMxGKWOnejKoWf9GI3aIPTKZXDx/nNg==
X-Received: by 2002:a17:90b:1c8b:b0:1ca:1ff6:607b with SMTP id oo11-20020a17090b1c8b00b001ca1ff6607bmr105728pjb.244.1650395698311;
        Tue, 19 Apr 2022 12:14:58 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
        by smtp.gmail.com with ESMTPSA id ay33-20020a056a00302100b00508374700b9sm16296241pfb.166.2022.04.19.12.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 12:14:57 -0700 (PDT)
Message-ID: <278f05c9-db1e-4990-4fa7-66f080e07dda@linaro.org>
Date: Tue, 19 Apr 2022 12:14:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 22/25] tests/tcg: add float_convd test
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-23-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220419091020.3008144-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: YXI6IE2vmJrr

On 4/19/22 02:10, Alex Bennée wrote:
> This is a simple transliteration of the float_convs test but this time
> working with doubles. I'm used it to test the handling of vector
> registers in gdbstub but wasn't able to find a non-ugly way to
> automate it.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/tcg/multiarch/float_convd.c | 106 ++++
>   tests/tcg/aarch64/float_convd.ref | 988 ++++++++++++++++++++++++++++++
>   tests/tcg/arm/float_convd.ref     | 988 ++++++++++++++++++++++++++++++
>   tests/tcg/i386/float_convd.conf   | 988 ++++++++++++++++++++++++++++++
>   tests/tcg/x86_64/float_convd.ref  | 988 ++++++++++++++++++++++++++++++
>   5 files changed, 4058 insertions(+)
>   create mode 100644 tests/tcg/multiarch/float_convd.c
>   create mode 100644 tests/tcg/aarch64/float_convd.ref
>   create mode 100644 tests/tcg/arm/float_convd.ref
>   create mode 100644 tests/tcg/i386/float_convd.conf
>   create mode 100644 tests/tcg/x86_64/float_convd.ref

Is it worth adjusting the current file to float_conv.c.inc, with #define FLOAT 
{float,double} in float_conv{s,d}.c before #include?

But I suppose this is ok as-is.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4877151lfb;
        Tue, 17 Nov 2020 11:07:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoVl3NWOhaEcSHtDLKyRER5yHb8FlqOiYiEseGZa0K2oYHthx5eqyLvENa797Y2XffJ2vr
X-Received: by 2002:a25:38ce:: with SMTP id f197mr1331427yba.12.1605640055083;
        Tue, 17 Nov 2020 11:07:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605640055; cv=none;
        d=google.com; s=arc-20160816;
        b=1I0xxT6v8lTEG6Y6LtgFmAKP/k9J/7akllU9+5KDU8K9b2SsMQ8xJs3VQe/cEz4NLd
         Dy9aFho54RX33ksavrj4Jy+jwEFqPsXkRRYp2m3ltsh+AcGuafH/agooczUqhLDrGRxr
         S7CQdBJN0nXD6JH1bicE+RB9E9K5Sl/sBY7ttqRTAGSSey6oyFqpJtbVN8PgIn1tdokR
         hqvAyvmABiM/FZfLxNRbETcflcey4oOV+twGq/z7emS+cLucRmMhDLyqceATlZGpRuHR
         tI02K0wQADG5fcj788rAnLgwI9nc25+VOHqqRXEPP8yIniR7HCMPxys8LHQRywAnqCZn
         uKlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=cI5vzjMjkZwOCABGdt4PTtHtT649Rp34MdRuM72kzf0=;
        b=dXCYzQaxKuQYLtP5+fzjld8v8yo/YByFGF6AEVNrxgLxmjZdlQMwl7TNUPJXrW+Oqd
         QtHAuL4i81mksDY4hRaifdSl+d7vmsUq/zPEWk124ohpsU9UNX1pZF09/livRgiVepw9
         cTgr1IfkBw/uAae82DK/zuoBc4Yj1ha4dzRnN0NxKo+1JN8QJ7TjJtfAcP3ppbWzc1nH
         /G1bxcIPUhqFjmmKRGLWM1G557hBv72oLW0sDAukjFTYS7xZzQkbD5/P9xNK+bCrNONG
         Xy4k04HYfM2WaqhNrAahMJVWqNwFCxUxeEKhQgcI3dFVKvC0iM0GfQb+AAs4wYbGHmJm
         y1Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tak9mN5p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n123si19607212ybg.334.2020.11.17.11.07.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Nov 2020 11:07:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tak9mN5p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kf6KE-0005E5-C1
	for alex.bennee@linaro.org; Tue, 17 Nov 2020 14:07:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6K6-0005DF-J8
 for qemu-arm@nongnu.org; Tue, 17 Nov 2020 14:07:26 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:37636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6K4-0005SF-53
 for qemu-arm@nongnu.org; Tue, 17 Nov 2020 14:07:26 -0500
Received: by mail-pj1-x1041.google.com with SMTP id ei22so1045879pjb.2
 for <qemu-arm@nongnu.org>; Tue, 17 Nov 2020 11:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=cI5vzjMjkZwOCABGdt4PTtHtT649Rp34MdRuM72kzf0=;
 b=tak9mN5pLXHGFZd1r4Lc3WYSIWZPANmdTkWOL7cpfPpffbax+YU6Ni+4NuxhTL/Y8a
 RBd6+HvGmuUhd1ffxy3xqAaXaG7K7W6aiCr5/GF8m1ybK2RsTplVPKbciwKDWUW/sigE
 dB7k39z2XWWw2vrZltCLFdkDKVQM5hJbBeLUOglFU/IXO8CTBM2JyJzdIPg4scBZNyZy
 3yI0TdFec92/zMdGEQ1rk02JQ9Kw7fKlPCzUOh0s5F3EynLiVW1JeXIUaaPBYnf8tXyp
 Y56GeXAz7mW/sz8GaHc8BUC+GDHspv4WxoRzAYYWxANHWn8LEjiiE5LGJYigiVWanjQP
 0sEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cI5vzjMjkZwOCABGdt4PTtHtT649Rp34MdRuM72kzf0=;
 b=Jp6l9xth+yje8q5bJj/P7wUFsTWJWnUqHHGA7CpKOrueor0tFcBA+NiK08uQx3Mhdz
 Z3nl2tcFC05VSCojrkKuy3wAkF0GB+oT9vt0k1KIjKYyXOtJAaVsfcC0wwhR3QIKiDa4
 A82+q+1BiL19yRKHIzB7qrT6tGdXUWWAu0ofjUfkzEhuSoBobPAuXR3FSlyw8o16jAAW
 SyT6dq02C8fJv+b1mwwbe/tcu1+IceC8+nRn0smsIj6RJKOoACLM8v60wXnW496Eozoa
 FB4958ovL5tNv0lVJdhxHrSINcSgIZfBhiobzj4FHnRrD8fwpPxXZSHR0cp2xFh8mNfs
 XIgA==
X-Gm-Message-State: AOAM532Vr+3h86gJAYgboiruoEpNcoMFbuR5JcnA9EwcWYWyMQihaHTB
 AO8xS+ssLlMbAEFx6T+Ny/mnfg==
X-Received: by 2002:a17:90a:5309:: with SMTP id x9mr503800pjh.98.1605640042294; 
 Tue, 17 Nov 2020 11:07:22 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id g18sm21603192pfu.131.2020.11.17.11.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:07:21 -0800 (PST)
Subject: Re: [PATCH 01/15] hw/intc/armv7m_nvic: Make all of system PPB range
 be RAZWI/BusFault
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201116160831.31000-1-peter.maydell@linaro.org>
 <20201116160831.31000-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c3b2e0dd-0a7f-3c9c-1e14-d358ea15f1f7@linaro.org>
Date: Tue, 17 Nov 2020 11:07:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116160831.31000-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lXS53e8Z5ywn

On 11/16/20 8:08 AM, Peter Maydell wrote:
> For M-profile CPUs, the range from 0xe0000000 to 0xe00fffff is the
> Private Peripheral Bus range, which includes all of the memory mapped
> devices and registers that are part of the CPU itself, including the
> NVIC, systick timer, and debug and trace components like the Data
> Watchpoint and Trace unit (DWT).  Within this large region, the range
> 0xe000e000 to 0xe000efff is the System Control Space (NVIC, system
> registers, systick) and 0xe002e000 to 0exe002efff is its Non-secure
> alias.
> 
> The architecture is clear that within the SCS unimplemented registers
> should be RES0 for privileged accesses and generate BusFault for
> unprivileged accesses, and we currently implement this.
> 
> It is less clear about how to handle accesses to unimplemented
> regions of the wider PPB.  Unprivileged accesses should definitely
> cause BusFaults (R_DQQS), but the behaviour of privileged accesses is
> not given as a general rule.  However, the register definitions of
> individual registers for components like the DWT all state that they
> are RES0 if the relevant component is not implemented, so the
> simplest way to provide that is to provide RAZ/WI for the whole range
> for privileged accesses.  (The v7M Arm ARM does say that reserved
> registers should be UNK/SBZP.)
> 
> Expand the container MemoryRegion that the NVIC exposes so that
> it covers the whole PPB space. This means:
>  * moving the address that the ARMV7M device maps it to down by
>    0xe000 bytes
>  * moving the off and the offsets within the container of all the
>    subregions forward by 0xe000 bytes
>  * adding a new default MemoryRegion that covers the whole container
>    at a lower priority than anything else and which provides the
>    RAZWI/BusFault behaviour
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

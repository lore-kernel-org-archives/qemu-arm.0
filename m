Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp183355lfm;
        Tue, 21 Apr 2020 21:18:09 -0700 (PDT)
X-Google-Smtp-Source: APiQypI3Yx2GII4dWgLZCCzKFIijrE7Dby0XC5QsgyJqyY2rYs6Lucz5LRNgO8lZ5Ugwhab4EWes
X-Received: by 2002:aed:3bf2:: with SMTP id s47mr23788076qte.126.1587529089532;
        Tue, 21 Apr 2020 21:18:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587529089; cv=none;
        d=google.com; s=arc-20160816;
        b=pEX0tVwlSHie9QxdJZ11mK/y5RLh+kuXfJL5zj4jk3daDvlQNvDc9ZOrzvDqHEfQkm
         bBoWBuyTDCLq7mO9ZgAewOSk2qg6M7q0mx7mzMumiJ8GORyQD0TjmcDs5sZ2x6qF352t
         D9op2STvs5JQZz1kI5PO9yviSUwMd7D8xHswlUbU0lMAnO3HfUe+cBVPjJZsRiPT4BEA
         guwCUtfAsSY9O1j/ifzd5zvY7Equ7YQrTTIBFoSFNyPV3dtSPgK4wpr006b8Mq9wWQJX
         b4gA/xvbwzzypv3vQj34rBc7dBvWARMjuzKoV1oar7NFb52ZbfeVSVtYzkK0cdHZdhWZ
         MNBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ms2dMCxgzwYBAAxkHw1eJs6bOAGxrj5YZkd2zEbCOXQ=;
        b=mYF7S0gpYyHEvKuE3mEaGk3dsdtsw1iW2Yrxd4JmXPccfd3sxeaCALSXLIZwUVTnDz
         EHcmis/JSI9IkFNoMdm7gwATQscOCShEL2d518EAk4FzpNMlPxf6HjB1bAP11TfMDcaE
         aefhbLLua03VMIWUJVlwzadIqgm69Hr3yWm9gzZKxYAJ8ZUIDEh+irYiGBDVRNkQ1tjA
         bXp9e2vDnCnRAkydcEc0gDm0qP8YaWJO7g0jQjnlgZlcAc2oqCsPR7PkAfeMzInCbVTD
         lzm0bm0ckIjYiw1+ZPmJdOtIj5nAZSX5kqaSri24CWj3ilhoY/6Ok05F/Xh8+BYMPE86
         rQ0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="K/2YCEye";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si2747361qkj.195.2020.04.21.21.18.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 21:18:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="K/2YCEye";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jR6ps-0001V4-TE
	for alex.bennee@linaro.org; Wed, 22 Apr 2020 00:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41252)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR6pg-0001RS-8e
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:18:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR6pf-0007Mn-Ju
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:17:56 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:34363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jR6pf-00076h-4k
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:17:55 -0400
Received: by mail-pg1-x541.google.com with SMTP id o15so462614pgi.1
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2020 21:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ms2dMCxgzwYBAAxkHw1eJs6bOAGxrj5YZkd2zEbCOXQ=;
 b=K/2YCEye7ppf8wjJ0/BWBZuxzbuXlx5WJumuMG5dIEsK0nh6FJhDyhRdk4XrEsBqW0
 JD9fi92Su+VzZTaHETNNuBKvO7J4p4py1It7k9fET8CeVZvrJxzDF6Y7R2K+Z9LKzLou
 F+oi8WBYzMX/a0S1GRF9GcGPDooXiX+O2xRCEHwKSdgsFnp1cw8ZP03y/vUmsL22BjdI
 X1ZbnSXX2Yj1oz9foJ9+6M4ih01e7Y16yadMQ02Oswa7J780P4PEYPg3yBYWQHFxetPb
 VkW3TZcG+tXYtDWaRLlNtTNsDOFWghWva57WMXj4FXL3T++dNdQXR34uWnhweBPTVFlE
 6AKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ms2dMCxgzwYBAAxkHw1eJs6bOAGxrj5YZkd2zEbCOXQ=;
 b=HJx3O+cua0f3GLknxC/zBqkHVn0O6AgsaGUR81zFzSJeMTL3TjoRUBzbJxVnF3PBrK
 QzLZbfTjeY1Y+LRHJf8tfU6/oEwjN/Ecx8P4vzKc1Ex4SCdQnwYUWbs/Ruvv4bcF7rCI
 BWa22Y6CJq4T+1A0Z+2nMD7XU0F5w+GuGkCmnP7Ir/EVwngJrApzFm67bSgeuUEF7htp
 2QzLWICcKln6TVZ4bNKjnQ+2XBE5ZL4Vz2KpDEDah/YMnZSvUm1COsLlA8oDRGdqpORr
 tKaEld7ML4m3WmhI3XurDeUyDiirgGHzOcfNN0THZE0RRsnr3TOT2RbC9JZS1Wboh84r
 hStQ==
X-Gm-Message-State: AGi0PuYWA6uAmp+mXPdREse10IAYy+HXrlV+NrGF+Oj5c/fITWz1Xa6O
 iXKgk8ZM0lgTY7ajbRZA4C5bO/l11VE=
X-Received: by 2002:a63:575f:: with SMTP id h31mr21526361pgm.200.1587529072423; 
 Tue, 21 Apr 2020 21:17:52 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id 135sm3986601pfx.58.2020.04.21.21.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 21:17:51 -0700 (PDT)
Subject: Re: [PATCH 5/6] target/arm/cpu: Update coding style to make
 checkpatch.pl happy
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200421131926.12116-1-philmd@redhat.com>
 <20200421131926.12116-6-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <91d0d94b-8133-53da-ed67-7c5fede8da49@linaro.org>
Date: Tue, 21 Apr 2020 21:17:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421131926.12116-6-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rP2vTVACwr6S

On 4/21/20 6:19 AM, Philippe Mathieu-Daudé wrote:
> We will move this code in the next commit. Clean it up
> first to avoid checkpatch.pl errors.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/arm/cpu.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

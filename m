Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp246579njk;
        Tue, 17 Dec 2024 06:27:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWfV5zF/mTVWUtEBGVGElH2nrFJWtopzaysUwZuxNik4t9PPLfLnGTOn4Clv6y3Krl+GpCKOnqXujtNNA==@linaro.org
X-Google-Smtp-Source: AGHT+IFKFZxoXxeH5s6qVmiwMTj7byEtb5HMQuA+oUNB3wED6jq7Z+iD0BHw1KJEK5I4zZlLhHlj
X-Received: by 2002:a05:6102:54a3:b0:4b2:4908:e9cb with SMTP id ada2fe7eead31-4b25d9680cdmr13599624137.3.1734445661329;
        Tue, 17 Dec 2024 06:27:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734445661; cv=none;
        d=google.com; s=arc-20240605;
        b=eaFsqXm1Ifur55NbObMgmuuSdEjeJ5PFNOyXVrsRiqKHj+dyT05w5SBxGIwoX7B7mR
         6fJGlfm7lALJJM9FUHR1OVOnVt4Me68mAHUAyDNmGBbnSYR1/0kc6t5ekMAiGAXOc201
         SnzCYkg31lkIIcIneLATDJUzkTHgp5nc8fm6aStatNxozdB5dfrtxSk2u4hdhSUi7PWz
         YMnQ+iXIIrF6y6HEdjuCM4AaVJw4PTqvcp62Q49hXncwjLFKlfvUt6FA375dQeLRQCdL
         N06fkw0uhoYFBTpaYjJCtZz7iJvn3A6o5RitQqVf6v1Ng+4oZEOPQFCUNREmWbh6iDcu
         jjjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=GsyXWVa1gTMAclEmkq2u33yD7kGsA26S3gQAbXi9QGM=;
        fh=/xC44rMQWMbXCNpb7r/mNDEmQQ5K8oWcpkCcvA9Zpxg=;
        b=Wtm628Sue8ykYkPJKSUVh/nKxC102UNdgc7qmdNGTkb8C6vqWGExTpQpL84tQ//uny
         0Gv4LCgYjyXIR1wkz1PPREqHaIsH3H/O6dtFsrSh90PQhXFcjO6OiI+28BYQcxPgCR0j
         bfB+16LpJSPvEI5R7EtOlqdsu+pdc7+r0TLq0X5bTlMlc35bs7RqlPyfGdpCcBWIoMSX
         nrDTuCtFEej0i0n6qBEZJ9Gh/NdqPwdKAFuFx7oX0XNiDpXkCNBPVXbH4RerBNuF5IOX
         RzSagXxbCW/Vb81/7fcH1lascaMPiadPZuBXS/NvXxtEYgGxioYf1BYUZXRKdXip0Cqu
         Kotg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pajBoo9O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b2703e8f4asi2106155137.339.2024.12.17.06.27.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Dec 2024 06:27:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pajBoo9O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tNYXm-0007Pc-6b; Tue, 17 Dec 2024 09:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tNYXb-0007Ma-LR
 for qemu-arm@nongnu.org; Tue, 17 Dec 2024 09:27:16 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tNYXV-0004Rr-R5
 for qemu-arm@nongnu.org; Tue, 17 Dec 2024 09:27:15 -0500
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3ebb4aae80dso1444972b6e.2
 for <qemu-arm@nongnu.org>; Tue, 17 Dec 2024 06:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734445628; x=1735050428; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GsyXWVa1gTMAclEmkq2u33yD7kGsA26S3gQAbXi9QGM=;
 b=pajBoo9OmX4tGP2EskQlO5i+eBE5mEbF3sYjP14gG/KzixJLphDHVkg+UbMdlsmlk/
 37tV0wahYtUJqmh/f7VIDJlGCZ+YQBy6U32e1xIl80sYMv8UFrpm9Df6IqawnI5fStt/
 fgx9MINBEl9XQKrMnsrnnObvsyAivHWhAwDgT8Xz071PjCFtbF1oUBziDBEBbmkZdsEL
 orYYP7cuzW9hidkA1jLmHth+FFnOYzPkwxu9bqpdXSQX4yO3CUv5pZccbtOrNwnR3foU
 702E2crzRKxNMucyy/31k624h606jpUfHyAamq0f0ZOnVju79oizrvinaPGowsO6TZin
 rLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734445628; x=1735050428;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GsyXWVa1gTMAclEmkq2u33yD7kGsA26S3gQAbXi9QGM=;
 b=dcWocARj7WiBE0jxTk/Z9Xym4GTujO/kZ/Z/Cm8NUWzK1KjOERPeVjRLT9UM/tDImb
 UHK1Ouol3OA7OFI+/TvvPPzn+31TYLG23Tih2c/W0zZhHmoalQB2YkIAvVbi6gUBiuXD
 hJR5Tkru2xxGZp3aMKRnpW75R+wha5rCaBohadwMjPJFZ1FY1aUOL0gKDDZhnRfPMca+
 7Fr1lGYYNOMBd8ZHRRr7+E3GpYv7M+8BgoZYYSJ/tfmXjmeE0k9QpSopEnHUkIVRJm4X
 4i9erDeWmHnO8YKt8Rf+5BoVt6g+00Y/kDzgTtqQWhpT0CkxPUfPwvHp2B48REoyS6oN
 hIbA==
X-Gm-Message-State: AOJu0YyLpoUMqzXKj6H+qa/d/AJAOo/03YiK42N+88G3AAdNnB3mHmKb
 uTTs/c0fp71on39U1EacabTkRRJMW0GKS4YhLCzeOVaCWSQnmiETMRP1zxzHkWg=
X-Gm-Gg: ASbGncuWtANA57hw8QSm2VLNBy9cwyIS/QUWKOGWW8mqQ4j1ueX9cwTCfVHyTKv9OEK
 IDocmitrysiuCnkoSUED4bwjSJLRUOkZA6J0EBgB/TxsPlWPJ78gN0wx74vnJ4YVX/Cgg76dzK+
 m3d5+tbF2NTWpZNtqXw5Tj49ODTq1dmdrLxygU5s+PX7TzY7/OBeWO4jwINGLN8cgv4HIAYZ2PP
 tPJP0ikNvXQOW41+sO08TeTE4r9+f+rja+D7tFtDYTe9M6fxGnlquHxNgdvFLnkpPQDAIXrQ6kY
 tJk3G74oSd6ENuhzpvZfE92UBjo1uE7/eTE=
X-Received: by 2002:a05:6808:1987:b0:3eb:777c:184e with SMTP id
 5614622812f47-3ebcb271462mr1808803b6e.13.1734445628205; 
 Tue, 17 Dec 2024 06:27:08 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71e48371490sm1999987a34.33.2024.12.17.06.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 06:27:07 -0800 (PST)
Message-ID: <0efe16ad-f34b-4a7e-b872-c3f2eb67f977@linaro.org>
Date: Tue, 17 Dec 2024 08:27:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/tcg: Declare cpu_loop_exit_requested() in
 'exec/cpu-common.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20241217140648.98538-1-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241217140648.98538-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: M6Uc0WkQdC/K

On 12/17/24 08:06, Philippe Mathieu-Daudé wrote:
> Move cpu_loop_exit_requested() declaration to "exec/cpu-common.h",
> along with the related cpu_loop_exit_noexc(), cpu_loop_exit(),
> cpu_loop_exit_atomic() and cpu_loop_exit_restore() methods.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
> Based-on:<20241212185341.2857-19-philmd@linaro.org>
> ---
>   include/exec/cpu-common.h     | 18 ++++++++++++++++++
>   include/exec/exec-all.h       | 17 -----------------
>   accel/tcg/cpu-exec.c          |  2 +-
>   target/arm/tcg/helper-a64.c   |  1 +
>   target/s390x/tcg/mem_helper.c |  1 +
>   5 files changed, 21 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp760155lfg;
        Sun, 15 Aug 2021 13:00:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJpFHzbLEs84vHfh30/WMDco3Xtvfe1lwWILtAfEL+i9wNaU5n2V538UBl718WZjO9JWkS
X-Received: by 2002:a37:a56:: with SMTP id 83mr12667164qkk.22.1629057642575;
        Sun, 15 Aug 2021 13:00:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629057642; cv=none;
        d=google.com; s=arc-20160816;
        b=f3iGCMcrAjWxm8DrWVpS3vU3ug/fLApd7tt6j0Nv7lNUOBwWELrelK0/lKslAcLN7O
         OnvDaDrntF+9nQ+4XtJ9NHUqAKjKKn4ejEW/pzkAUPcxyhjdQYAauA3SSMYNl+Dyq8Jd
         RRKfZtNPj1HKBBaBBRZ7Hym7cRhemVPLG4SuXYxtaX131K4KzpkoAA67rQKB/cyWFzwM
         Qlr1zbiHkKDBKHvujqmHWgiMeLfPf3hEyl/SmTfz8SEjhWdclyXj0N08PgNHorVfL9yv
         eRjGjpswepUhktNfVWli//WucmXNY4rX5TTPmX/GwKUih78/ePe8Xjw7JcaWM0LS4vIB
         qdKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=KSrz753r9j341lhniAa2wjKyfup+UJr0FLHIk3wdgm4=;
        b=dk2aMK5MOuvRyTgp3TVBMX3DiNAA/+PHY5TEL/Rh3JfQueuaoex7AkIgYGWaMyxwAO
         oGOZpEqc2ulnFxo2d9xwaQfxOXkL0WIOozp9ChseR0c3HmVTWpqC1iZ8EEhz7fhJRgXA
         Q2U7Eo+DPi8m1EpD2gg62c/kjHMdosua3cej/mLNv8ij6oe74f/WWlS8eZ6AgMk/g2u8
         DvgLw4HfBIWa5Y6RY4kHxml5EWj+OgwgYES4Ayf0zClFcZspqVmeYUHTA78/6PMcQzob
         yQfB0DePRA/0x43bdqP/+O3bQCSIZIrPtwWIzRiel8vTvf0il0+aRRsAbvAJnhZqXxKw
         2jYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jRE5DG+j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jo12si5423853qvb.215.2021.08.15.13.00.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Aug 2021 13:00:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jRE5DG+j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFMJF-0000Sn-UJ
	for alex.bennee@linaro.org; Sun, 15 Aug 2021 16:00:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFMIs-0000Rk-2g
 for qemu-arm@nongnu.org; Sun, 15 Aug 2021 16:00:19 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFMIp-0002DI-Uu
 for qemu-arm@nongnu.org; Sun, 15 Aug 2021 16:00:17 -0400
Received: by mail-pl1-x631.google.com with SMTP id a20so18548224plm.0
 for <qemu-arm@nongnu.org>; Sun, 15 Aug 2021 13:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KSrz753r9j341lhniAa2wjKyfup+UJr0FLHIk3wdgm4=;
 b=jRE5DG+jXkuDVpTlphkazXFr1WAIPjQG1PwqvNJDCBbVDjbeiJ309Uiv5Y+b7TM3BM
 LX2UFita57j1N3AH7RjTuuQFzMMLxki1t3QTZtM3GeBbGv06CO3zQDPF5Iqg4kgTSfHs
 bsmNl+sKzzLfxJRV1PN9YnAym3ZsCMofy6BuUuyRgzFKfxpARUB/2s3mqJlPtkJOHC4q
 5rEFHXJSGb2p8JTIUiVQ2ZAmxXc+L3/i5+EEKsZyAojReRP4fkvCZgn1iVcqZBJmaJfE
 hsEbIzXUdODAy/Ajr5e9iPop3mrlVMopEZwvxp4S8Sbu67YaPIxai9JEWCY4vhFsi8fF
 Yj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KSrz753r9j341lhniAa2wjKyfup+UJr0FLHIk3wdgm4=;
 b=aYPR1gWRo+/XLYnIV9mE6p3I12+kDFfiI3BOchjlphvhDgFfWTybwWD3NUDQKzDzyB
 RWya8JMX9atKuSgfWaf2EIh0+9pSVR70xUZJnVonF5o6M7ajCX94XyZNHmpCbt2prIpV
 gdiUbMmKq4Unp3N98jMMJkvLasmjhxa/asVfm++lbG1wvRzCVlcU5sDh/DyntgjxzPnr
 ajmNew20W+0cO/knPzu18bx6ES/Q0ww8d3TQBqrPnFkNAzLaB+3gMlNtsYjeEwKA3lCp
 OWzUqgXLykmX0GEVFLl15XJYgGgmwSoGLHfYSDZPtu99906vh5c73okjGI5b4L7tZs8W
 Wk4w==
X-Gm-Message-State: AOAM530aRD1LSyf38chpEwHPJLoDm9Ch6HQy1vOhocbCD5cGMsfFZ/pu
 L+RHL7P9OBeLVYtI/YKmC9caSA==
X-Received: by 2002:a62:fb0b:0:b029:3ca:1345:9fd8 with SMTP id
 x11-20020a62fb0b0000b02903ca13459fd8mr12831341pfm.14.1629057614171; 
 Sun, 15 Aug 2021 13:00:14 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id b13sm4013938pfr.72.2021.08.15.13.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 13:00:13 -0700 (PDT)
Subject: Re: [PATCH for-6.2 3/7] linux-user/arm: Use force_sig() to deliver
 fpa11 emulation SIGFPE
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210813131809.28655-1-peter.maydell@linaro.org>
 <20210813131809.28655-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <616f6454-5e43-a98f-0769-b242c377c050@linaro.org>
Date: Sun, 15 Aug 2021 10:00:10 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813131809.28655-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dmvMLTsaZ9Ow

On 8/13/21 3:18 AM, Peter Maydell wrote:
> In the Arm target code, when the fpa11 emulation code tells us we
> need to send the guest a SIGFPE, we do this with queue_signal(), but
> we are using the wrong si_type, and we aren't setting the _sifields
> union members corresponding to either the si_type we are using or the
> si_type we should be using.
> 
> As the existing comment notes, the kernel code for this calls the old
> send_sig() function to deliver the signal.  This eventually results
> in the kernel's signal handling code fabricating a siginfo_t with a
> SI_KERNEL code and a zero pid and uid.  For QEMU this means we need
> to use QEMU_SI_KILL.  We already have a function for that:
> force_sig() sets up the whole target_siginfo_t the way we need it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   linux-user/arm/cpu_loop.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

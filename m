Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp866448ejc;
        Thu, 11 Apr 2024 03:47:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVZe/w/wT9FGCpi15XgryRqcNsAbyUhc11eGZIki7/PJW4te+X6+4dym285GnwnLlFHdnATWhK8sRxGyRgsk+PQ+J+dnw7Q
X-Google-Smtp-Source: AGHT+IEqnABuQJhS5X6oZr/1FpyrVzLCuj8DLnXzpJHVoyFy1GiFGJFHDX3S/RJwE4m3k7k0wd53
X-Received: by 2002:ac8:5d51:0:b0:432:c456:509e with SMTP id g17-20020ac85d51000000b00432c456509emr6548900qtx.10.1712832440226;
        Thu, 11 Apr 2024 03:47:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712832440; cv=none;
        d=google.com; s=arc-20160816;
        b=saSYBOWLg67lpLNVEk90tcdjrFCrBXHGTqkHtFz+C5OSfyYKUTW7aCLV3HetwnN03q
         r5ixJtYif+SYKUpyWx7qjG8UAyNDguXHymrr8/0cDUX1qBZ52tQI3B9h3tYA/hzTCeEO
         Zru+43GwsT7FYdmuViuIj0uzusl4fZ6WhNliasNqti7D+MuncB3Q8b/NP9EWWcAgXMez
         EEMpZRwoNTcvkSuIRRqooVP6EAzkmhKyj8vPkLVg7fW8U0kXSbq3gse9OKr+AiY7ypzc
         bsS+yuJLbdgBpioZ3Ui/X0KbDdn0J1RAlryE0v5uKxPo5EIMcePG6X5OHD1aqL4pswod
         dw3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=sKWmKBLG+YXBZ1tTc61l69JC4XvmnzRAHSm/Kg1vw9U=;
        fh=qhYFOvkJmPXjHi4htzZ1+QBDbF0OrNdmIFaZhBiDz/c=;
        b=mvy3Ez2IHqztvMcd63hbDncI3JlS10e+F6aby1R1A7tGKbRSISlm0GfNUUiw6Mr3mL
         PaJCmVOZw4vEEHB3hoIxsewLkfWXRP0uAnkqqo6qE2GfKJHRYuYggJxz1wHzl0yTMgp5
         BD5i7ZX/8i/OPlA5wFHQvZyZSi5VHAkuXqGTB+VROeFPDHFhu7pWfPyfdKQdquuR3hhp
         VdIaucDWg174azfdUzRqmPS4GRvTyRXkYS9ctPHC9iywaykmz9pdNtZhQHGX5qUxZWPD
         n0JcqsYgwo5Rd7Gfa4/TeXS6ohH44lHkJLYB3Y+GltTE37Yty7JPePJJMZNN6bH/2VG6
         zWFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z5X5HUdT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp32-20020a05622a1ba000b00432b5cc5f49si1153982qtb.646.2024.04.11.03.47.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 03:47:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z5X5HUdT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rurxY-0001iJ-U0; Thu, 11 Apr 2024 06:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rurxW-0001GP-7u
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:47:11 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rurxT-00056y-Ee
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:47:08 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-56e2b41187aso1234080a12.1
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 03:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712832426; x=1713437226; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sKWmKBLG+YXBZ1tTc61l69JC4XvmnzRAHSm/Kg1vw9U=;
 b=Z5X5HUdTOhuGTwVwDZu7uz2sZq5zpbUeZNhLEAogXRISL+49mCUZvcu36qVeSRQ4cD
 /fRfWvmCsoM8depr49EPNH26O4+It+/E1OgPqD3PCTt07RuA+9Wi1fdE7W6I4kRSXBdd
 v+4yMNae6Y+nyxeTc7pZEasOOzWb/B/XC/PBoLJXVK1nhJswEZkzlHHymL7H3M/Gk95j
 vimcW5Cj7y2J+tZZi4kILg//RrkmR+nLqxwIjG2smwAbCObC2HkJ+qgrnM+xI1ZRAymr
 JfqrkSU1Bzm5koy/2+ukOFKmUT/8H4RWrtn7StyvisLN3F7xC7SwDoSqVoNDVO++uQEW
 uYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712832426; x=1713437226;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sKWmKBLG+YXBZ1tTc61l69JC4XvmnzRAHSm/Kg1vw9U=;
 b=l6jtXVRUfpdNJmBKc06VKupYuPQTTatYijFX3Sk2JozIB6Zi9nRL+80QkpNGNASLkl
 7+Xvya1dlDO3kKv6G5gW26oO1Q20cd3kosJsLxwtpOG48w9StUcCxXQlM7PE2O2Sry+W
 1nV7Ja1Ojl6rL+6POZcoYq2oOZbH+IzoHeg3ZmVQF18FV6iuKVX35BNfLxeV9BkGu9a7
 xfD1kvCHeWJvxTWM5aY8X0NoOzcXfeLG4Jlv3XXq48eDy0X2j6vlRa9DPu1PQncFQiuV
 e+KnoTcmNIGD8PaV+DzA4EcdxSDYZo8Xyxs2Ra/4o/MOwhfVaUaqpGktGVUR93No8cQh
 4NaQ==
X-Gm-Message-State: AOJu0Yw9I71h43C8F5n3swrajWuVbBv1VoR57Dkn4c728xO98rxyOGsp
 2Om2R8Eyy5wCXcaI6EFRVgPe/UZSnfJ+vlFwGjk8Pb3LiomDKTYWqQ70aKIbfb6OXTp/wA+VYRP
 tRc3ViJTXN196k4Q69HJvBfYn4rHUOXy1m5PuIeuP6P5Ontbr
X-Received: by 2002:a50:cd8c:0:b0:56d:c85a:7893 with SMTP id
 p12-20020a50cd8c000000b0056dc85a7893mr2169253edi.8.1712832425985; Thu, 11 Apr
 2024 03:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240411104532.588170-1-peter.maydell@linaro.org>
In-Reply-To: <20240411104532.588170-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Apr 2024 11:46:55 +0100
Message-ID: <CAFEAcA8-QfBq_UGHtS00tBYEOY1y0ZbzbcyaCeNp430kHuGJLg@mail.gmail.com>
Subject: Re: [PATCH] hw/misc: Avoid sprintf() in the imx devices
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: bSoA3HfkuA87

On Thu, 11 Apr 2024 at 11:45, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Various imx devices in hw/misc have a pattern in the
> debug logging where a function which prints register names
> has a fallback case for an unknown offset that uses sprintf().
> Use snprintf() instead to avoid warnings on macos. (The
> buffer could never overflow because it is 20 bytes and we
> will write at most 10 digits plus 4 nondigits plus NUL.)
>
> Commit created with:
>
> sed -i -e 's/sprintf(unknown/snprintf(unknown, sizeof(unknown)/' hw/misc/imx*
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Philippe: here's an easy sprintf->snprintf conversion for your pile :-)

Never mind, I hadn't noticed you'd sent a second patchset on
the sprintf issue, and you've already covered this one.

-- PMM

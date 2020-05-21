Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1706374lfb;
        Thu, 21 May 2020 09:08:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/yEUn4QOJ4Hi6GfGkGh+p19ZizH44l982EnfSDD3UmLFHBZ5vqCCPWsk3Vj3lAVBht4x5
X-Received: by 2002:a25:c08b:: with SMTP id c133mr16188733ybf.286.1590077305463;
        Thu, 21 May 2020 09:08:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590077305; cv=none;
        d=google.com; s=arc-20160816;
        b=BCtwdaCMntKfA9Q02QakJSNGIwFttGLw4/B8f6PAFvuNnoAIwqBWqh3s00MzhH/dpp
         VNjwzuWeyRmI+W97+KXNWOptbS/BXkt0qJ/dF2eXwFJN+ocgcyLtwU3wndvYO055phXV
         FpDAT3riV/Bh0Ea0eop8kDIyMr+iHXHIfiNNxTcKnJtJdlkkr6wJ7qCf0/tceeu/qWwo
         KRsOS/XNDtLdZYwLAjZf5icaIDexuTq7MLXDa1C3rvqrVFgUgnmwyfj6u+M65DC/g+QD
         5jpYk4ioREUwd1LKfcStAvK3pDl7e9S5bH+qQ/iFDYdcAXjGXLlkp97mv9PQXj96gnN3
         zZyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=bT3gaOeZufGXXDWlU1SW7moyeQJ4r1NDiSe3lomWxgQ=;
        b=ZnvT/3v/Dg3HmnApVGyw3KrY5gimpuk5tOT2ab2cGn5PUMZhvC8d/KGmm1jIfDvwcH
         Q4/f6ZMUGFRPX1oR/BEwGYBB0HLvTIVNYg5WgYBNnoq6Uv9cdyCc3MRu/3+wScrKV0BE
         hAG0/J0pM80Q1VZOw7ilBWn3+oiCvsBOHVsjxdOL0cNaF9taWh4sj4/aFb0Vo9vAToVb
         2pjrJr85cQH8grPYWhY7Oe+V7Oatp0yx4iWjr8Jk4m/IkdDYjf0Vs3IbqMttDTGVxMis
         gwM9WsZpUEPs0Xw7RYRIDi7D7D1PW1GjQ2a2SLONkVv99U9+7DMd9iYL/zttiymbcj+q
         UeXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L7km76KN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8si5344049ybg.74.2020.05.21.09.08.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 09:08:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L7km76KN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbnk8-0006Wn-Rm
	for alex.bennee@linaro.org; Thu, 21 May 2020 12:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jbnhW-00029F-84
 for qemu-arm@nongnu.org; Thu, 21 May 2020 12:05:42 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:45302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jbnhU-0005wk-C8
 for qemu-arm@nongnu.org; Thu, 21 May 2020 12:05:41 -0400
Received: by mail-oi1-x244.google.com with SMTP id d191so6605182oib.12
 for <qemu-arm@nongnu.org>; Thu, 21 May 2020 09:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bT3gaOeZufGXXDWlU1SW7moyeQJ4r1NDiSe3lomWxgQ=;
 b=L7km76KNNRQyit0R7Fl6wyJy4mU32M2xxS3c1GCDhr8M6TqP6gmwf6CW1NZ4bk70GH
 X7Ucwm7wq6J6h1Ka6R1rSWCQypM6qAqOMLNQA1bewM/olFk8J5U6YYX7e6yWx8YBTe/D
 5x2Q1TEGx/pLZ4dRE7Cl07efqMNRRVyREH4K2JKdqJsLZG2bLhcvzFFW7PQSXzfRU/cX
 /inJmtFSIe1Ulv8hy1JryAX8L642C+7S8uKsR01TDuyFwrNydmb34QYX8TuahmM4y8LY
 zF6p1QikWi3hKxvW3uyae3ZYDH4qYKkkzC48AcHySo0ys6BEMgzMKt65HfXjVRhWT+cw
 2U3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bT3gaOeZufGXXDWlU1SW7moyeQJ4r1NDiSe3lomWxgQ=;
 b=YQ2gSCE8zcdGlP4/4HfuIuHJDYbTbCZLKTNAAJgsg4TzA7MVOBEheemDui/D20LGm4
 NVkx7cQ1go9WTlsZe0KY7NHixbsGkHo+ApYri7+PKvy7CJdWNr6rR7Ae9QeU2UHs8Rk/
 K8jHl5cC/UvCGqHEAphfRHxsE+ojvXo1Bh2ck295qgsZ19xjSl8qeAspResqwdORo+jx
 ezH8j/sEDGaLFj/vQSiv3xBAp0I5zw7ztASiiwjkGjnG7pvX0ncdyHjzoYOW+Na4TBLZ
 yrDPUtt4feFGFbNk+ZCm3SjQQvWk8t1XVSsntHszv6a+4hMicz/eX1a/lV2xLM4SA34G
 LDnA==
X-Gm-Message-State: AOAM530DtDr8queBqMce6hs/htbMvqi+zUDc7JNFDTsz3iXcaCqYbCsF
 YVjC/vunwuL7jii0jO8wmo6gmBqWOYrBcleQIhDctQ==
X-Received: by 2002:a05:6808:6c6:: with SMTP id
 m6mr5854979oih.163.1590077139195; 
 Thu, 21 May 2020 09:05:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200518140309.5220-1-f4bug@amsat.org>
In-Reply-To: <20200518140309.5220-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2020 17:05:28 +0100
Message-ID: <CAFEAcA9OyhO=EKy-7KC8hOWYN1QsnxYmyg83mSvGx5+J229-0Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] hw/arm: Replace hw_error() by qemu_log_mask()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DQEQwbrhRcYA

On Mon, 18 May 2020 at 15:03, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> When fuzzing the devices, we don't want the whole process to
> exit calling hw_error().
> Replace these calls by qemu_log_mask LOG_GUEST_ERROR/LOG_UNIMP
> when possible.
>
> Since v1: Fixed uninitialized variable
>
> Philippe Mathieu-Daud=C3=A9 (4):
>   hw/arm/integratorcp: Replace hw_error() by qemu_log_mask()
>   hw/arm/pxa2xx: Replace hw_error() by qemu_log_mask()
>   hw/char/xilinx_uartlite: Replace hw_error() by qemu_log_mask()
>   hw/timer/exynos4210_mct: Replace hw_error() by qemu_log_mask()



Applied to target-arm.next, thanks.

-- PMM

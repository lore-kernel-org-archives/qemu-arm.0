Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2257658lfm;
        Thu, 30 Apr 2020 12:11:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypIP7KP4VM4V8642MMwEbrTQHDNizlJQMRE2TVZl8D5AFS4SWzwNWq5LxspJgPZMeAZZ842T
X-Received: by 2002:a37:63d0:: with SMTP id x199mr4931615qkb.3.1588273893671;
        Thu, 30 Apr 2020 12:11:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588273893; cv=none;
        d=google.com; s=arc-20160816;
        b=jzee/J/QEYn21I6fgBeLGIWu3MtgW91hMmz15pPY6JJhaqL5/mzipL4Ct7cA9Cx7RW
         hJiAvBcutPcR3Iq/mrfsjwZGjLlXv338Q3NJwkBxVst65ThQhvjbDFbXFdMM8j7bqczz
         lDFsu5iMJdXENQW+vDDEb9aYiN6vDVrQty7UpzH83lz2/lHPbzSOc8jUWuqOcviy/QD+
         Kuc3fFsKu0Uy6pcdETmy8MWrzpDdnxhcqHH4/QOCY69yLq3jiIlFu0hFwxJ3miSeWNjM
         tl/qzG6QaeIu/DDNj9xVpEtwfR4TcCzYM99xkUlwzA9/Bykr2v8Xh7J0ZTkTgEWHhYnw
         8fnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LgjUQk/EGFtc53ThLQ03ghkSZx4QRIKElwfLRyRylEY=;
        b=QsQfKxnXoR+RYGNWkclE/p7Ygo3CbN/pgNSfGGjukQSysJuiAB3Kp2cA9Fk1uISX/f
         XyRNOkUvcRlKK/mf46qpum9v3gp7hY2AmFogswtEP+Ray/qEYlD5vA2fEaTpZH0yVqou
         lrocvLLB6U+3xUl6szIYCclnvjUUFXzfc2YMAwsXyo56jOYuIjZkE5XHzlpnFDUYd9pG
         plHf/w6RtxYtfKZl63zPfmnT4LhPswU3ZMjwuIoLVBctNjgjjmSx6+Gt2iGo8lfVempQ
         AmhEZdhdu6YB3IYYT5cbCDdN3CdoEDYCoMxCMjUEIt1lbjeCcbPSMT0H0FbxU2Bf1A0M
         GX4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qSV9W5Tf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id g7si296591qka.121.2020.04.30.12.11.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 12:11:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qSV9W5Tf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUEaq-00072g-Qz
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 15:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44464)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUEYj-0003HO-7T
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:09:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUEYi-0001BS-Ky
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:09:20 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:33589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUEYh-00018D-Um
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:09:20 -0400
Received: by mail-pj1-x1042.google.com with SMTP id 7so3850509pjo.0
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 12:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=LgjUQk/EGFtc53ThLQ03ghkSZx4QRIKElwfLRyRylEY=;
 b=qSV9W5TfucKkLa/rrCXEtKqr3jl+TLiBlMgg1yYvnWPV8b5jynCsvqF/szPGW5ym0g
 Eo20OuhJi1h6ByaEy6aru26bKNcwDunLPldrB4EYjwyYvyJnOTnrIyZJKqScVr0QS5br
 cIYpovo5jLrrmcnUyf6OmCsTGh9aSp/1vrngPMOvql/fiTa7unAan7OTqVcR8HWhPMyN
 b/TxxugUsKRaTv7P8kkuzsf0gelsjIs35BTPdL2BRqqAvMBYxE9NWQlHUitnSgQ2pNam
 5HFQo2ZsNeZExnmwpnrsc1WbzAFsiOoELwYyFPe9PbN0fCCHvvaxFWdefoiVVkq1IvxN
 4c7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LgjUQk/EGFtc53ThLQ03ghkSZx4QRIKElwfLRyRylEY=;
 b=QICBHpxvtgYemfSIg7IC8hAsvurFvoSEZtlRsx3jQPAkR0Gr4d7xcmbTdlr5Jv7pRf
 bXsNTaOwGldp/9+fIADAHFdjguyzoPAXHsCS2G4cALphqBFBg2VBobUXr3jqzypwdNdJ
 jGkb3crh2xJSrSyZNa0M7q+kENLXRgsMTNj0YZGl4l1sIOhH/HoYMye7oN5bHc3jEbQr
 aiPPSL0hwwRIMubsOSEBIkapF3gnpLx+U92F9szdDHqVemZtMH/N58H1wLRO+CxK05xG
 SPbrbeeLmSXiTXVTz/EeR5uurWWrA/ooNu9tTdj5LcxyeCJ3XVM+ZsfzHStGzWaLGhBU
 UF3g==
X-Gm-Message-State: AGi0PuZpUxqBdnfOgUEqKCwiXGctSZJaqDM8BTcstWeoTWVEvWJW9zHQ
 g8gel+euUL3Mo/k9PMJvk5Kbhw==
X-Received: by 2002:a17:902:59cc:: with SMTP id
 d12mr449901plj.237.1588273758411; 
 Thu, 30 Apr 2020 12:09:18 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id d29sm421946pgm.83.2020.04.30.12.09.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 12:09:17 -0700 (PDT)
Subject: Re: [PATCH 11/36] target/arm: Convert Neon load/store multiple
 structures to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a442928e-b986-df54-f787-a9a25682975c@linaro.org>
Date: Thu, 30 Apr 2020 12:09:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::1042
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
X-TUID: 0HqbimTjrSOW

On 4/30/20 11:09 AM, Peter Maydell wrote:
> Convert the Neon "load/store multiple structures" insns to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c | 124 ++++++++++++++++++++++++++++++++
>  target/arm/translate.c          |  91 +----------------------
>  target/arm/neon-ls.decode       |   7 ++
>  3 files changed, 133 insertions(+), 89 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

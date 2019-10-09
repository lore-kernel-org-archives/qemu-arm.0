Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1116643wrm;
        Wed, 9 Oct 2019 09:04:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyHcIqklGEQZ5rzLF7EeHIAFSqMbWY7+l5Aih1aVJEzDUno76t81YxeKHVVi3FFsbHcNnsg
X-Received: by 2002:a05:620a:8dc:: with SMTP id z28mr4376785qkz.83.1570637073833;
        Wed, 09 Oct 2019 09:04:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570637073; cv=none;
        d=google.com; s=arc-20160816;
        b=PdSam5LG8+P9kYevobz5JMJj+LVvgHoyzkCDSugaxiP/Vy19wSoPTY1gwFkGU3fDyb
         wzHqIr5BaesgC+NzqbQuj+RvQbSAnh0Vs3oI+rO+D9kvQv9pKZivBLL1z3FWDOJpt58E
         DdG+XKFcQHY4Z76uTTtZ8WRFjG0wf1q2mLNvC5R/vUl8ASHRB8wi+AYNMKxWDLcJ55rC
         vdmv6u/MgoDHAA4k1Zh7TzWLLYTTQbx6bttdI1utUajjPJ8zO59U8TELMpEu+42C33qX
         OoIEZy9IIZcc2/nmZwOBGE6wbL0BMxt1n9dQK9td8H6QS7lGwt+geQY01k0HQBheoUhJ
         gahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=8UMEmM0M8spBbkixIMqYmPrgIc0DqB9gcnQ2zQpAiZo=;
        b=FAg8yBVmkFqVUP0Ni8en9R5tWVRVYtKhc1QsE5U02FpwcMd69eNRxENYZS/jNqNctl
         qiI5O5rT71vJ7krAR4ZqlmltCboYjGkB+Sl+x9Zjb1ndkCatqcjZAiZ4o04OKpyUm7dV
         elHpnP0DYQ9Svx5t8l9gZVSSudsxC5h0RjiZen/+wvhzOgPnE7bAS4No2wOc3s6dhL+Y
         fcOn44T+t2t8MjGKTgAR0GOToXtLf9isxdKF6PS+a+TOfgrTcVHtn00XfghksYZ1ULUC
         H76Op322pGg3k5Do3Aqpb40jMU4nXqPUFEFpBcPfIv0J1pZAUMp4e60ReatAMMSczb7X
         AI4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vUdpUth2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o71si2556492qka.334.2019.10.09.09.04.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 09:04:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vUdpUth2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIES0-0004BA-C8
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 12:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45754)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1tZ-0001lf-Ry
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 22:40:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1FR-0004dC-J7
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:58:42 -0400
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:45366)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iI1FR-0004cp-5v
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:58:41 -0400
Received: by mail-yw1-xc43.google.com with SMTP id x65so220177ywf.12
 for <qemu-arm@nongnu.org>; Tue, 08 Oct 2019 18:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8UMEmM0M8spBbkixIMqYmPrgIc0DqB9gcnQ2zQpAiZo=;
 b=vUdpUth2EV7mAedIqN/tWOmpyo4ZmeVAPWj9+ak9aTBwJNE+ZXVIyjnySkS2RC/WVX
 iJJ9+La6qrBTEDeKvhlivGiEw7UWzXhlzKn/fzuGzGB/P81xyUZIsuh6jB7bQU53eiS/
 B/7tMm+z+pW+8zMEEwzBquMGV0tsnb6aC/6vs97VD5VATpAYUE/nECb+3Hq5Df7P4XKi
 hTjLgHiihNybNiEGQv7gi/gthK+ja1JMgUB0Rm5/pTyWWbqPd4DS+mJkNI6YWOyeCNru
 ze7XAJBdhkaVZ/7ZVwGiMJ4dQIOTCPNe8ZevDbaM+HVvQjkkCe2e9xG0RRcUF5y2Ded8
 5TNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8UMEmM0M8spBbkixIMqYmPrgIc0DqB9gcnQ2zQpAiZo=;
 b=GxfF/nTn0D0R9WeY9GV8EEGVvxqFAYYkklNiKU5dOVSGvrjpsv2GYy6u+cax0ccf9u
 H/OmJA1RPzd32Jbg6AHNoBrN6yTVtizGP1vwN7sFXfGXEnInRFEQO4tXQCyFMLTvtKhU
 y3SHktbdDDTi1CgfMbud/GfdhZrahePanST4OQfkG8prDEOvHA35I93ZPyRqwoOVFodz
 TTuVhGcQBWLmEcgi2jqFMMq1UvfNqb9pNLH8QVSPhV6jh7CRHBtuggrV7Zlz1+o/si71
 SaG2l+cWwkrSxI4U7StfYmRKs7ct7Ao2dVC+2qpztKhE7BSDq35GNlQt2tHpTDmZRPkm
 AwuQ==
X-Gm-Message-State: APjAAAUhv3irUdYhbBCIrxem5v8NsUoGAuzGGUiZ4A2LykRZbMTzRLo7
 TW0NCCwaNWwHmr8tT11SWnMvwkGWKcE=
X-Received: by 2002:a0d:f8c6:: with SMTP id i189mr960585ywf.411.1570586320530; 
 Tue, 08 Oct 2019 18:58:40 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id y67sm234362ywd.63.2019.10.08.18.58.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 18:58:39 -0700 (PDT)
Subject: Re: [PATCH v2 12/21] hw/timer/exynos4210_mct.c: Switch LFRC to
 transaction-based ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a15bd258-a909-557a-0bbc-9cc16141b2f1@linaro.org>
Date: Tue, 8 Oct 2019 21:58:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008171740.9679-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c43
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oaLlOQEMPaGc

On 10/8/19 1:17 PM, Peter Maydell wrote:
> Switch the exynos MCT LFRC timers over to the ptimer transaction API.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/exynos4210_mct.c | 27 +++++++++++++++++++++++----
>  1 file changed, 23 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

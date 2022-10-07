Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp607280ocg;
        Fri, 7 Oct 2022 09:51:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Twyd7XJe35i4oOGCO0Wds0Od2yU4uduK3hJwnaNJxubFzN36N0A1lBx+JR/1WawI+mTe6
X-Received: by 2002:a05:620a:371f:b0:6dd:bf63:565f with SMTP id de31-20020a05620a371f00b006ddbf63565fmr4397136qkb.754.1665161513908;
        Fri, 07 Oct 2022 09:51:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665161513; cv=none;
        d=google.com; s=arc-20160816;
        b=z9nm6PMujiV5TImRhQDnnT/Gm8xqJW+afDVLwtbrlMgl3NmzqpU5/vLimzq7WQ0Kb/
         qP3mIMyZfJDPRbx1C8Blae7E1yjryYDhSdQCtQEVrnmHF+XshU51SvSfpgWSyI1PFYLm
         jmMBLSofKC5ckB6xXcOJOxUVfx8x8wmiuvx5zwMpszS5AKXKbI+7N4UJMI8q3/wFgqMC
         FoZJx/GzAb0Ev/TczCJ8aHTFQh8ysMd/shZyZJw4BoBoY3yL5qLRruIjMasZ+LYzbgtB
         F82XNh8fUxMzt+3i3cnb0oA2S9hYGrrAPqKxCbluBg6K/HIC+xMeu+2TKNs30MN5dhOs
         9FWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=WmZ1iLaRWTR5WM0lMJr57R9TNS1Stv8HvXzJ5i2EblI=;
        b=fY2svtrCaDoIvBZjcxaE+b76mvpYdEA7sfX5R7vC+jPOB3pwXMI1d/J7ARZ1x5lV9f
         o+vtdbN2FUG2lZaYW9bQGwMS1SoePA3F+7thpX64S9lRsUHdVhLP+/I+5YdOm7X2zUjA
         Wx5IhXeuWWUAoSjqZhZQjowS6J79ZVoze6R10wT4zlwPrbESOCirVm+sYjkrKricO76/
         xUG991mntgHyJBxYOl7KE2rAl2ADceUm7tQSUXQUdSlrwziYDVaNwqXVdMEv6LISiBoP
         y/kxyUiMQ9UazyWcAhzKtJwjT0CDimIjYlNCpSHMGj9xOsLeh+Vv2ERsXr5nOCizVmxs
         hsGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CICsygMz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fw9-20020a056214238900b004afb3c1bad2si1061223qvb.222.2022.10.07.09.51.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Oct 2022 09:51:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CICsygMz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogqZl-00019S-GU
	for alex.bennee@linaro.org; Fri, 07 Oct 2022 12:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogqYl-000181-7q
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 12:50:53 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:35630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogqYi-0003zB-Cg
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 12:50:50 -0400
Received: by mail-pl1-x630.google.com with SMTP id h10so5064374plb.2
 for <qemu-arm@nongnu.org>; Fri, 07 Oct 2022 09:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WmZ1iLaRWTR5WM0lMJr57R9TNS1Stv8HvXzJ5i2EblI=;
 b=CICsygMzgub3EGcE7XFdWJ17zRMTZVEX7qVHIIGWYIQNl8K/Xy7++0pIqiF3JFHSWy
 uumfC9A1nFnICXNNrVK4ikmhHNWw4sJRl1+xTrjz4oEAIXJ2evxD3iUYQZ9t0NXjlwSK
 Q4fdKMy5Gj9LEyyCKMYqdOVLOFnrYirLg+/uZuTrUkjT4cOYet1tEoGAb9082QEL6SQ1
 lvcihu5BrXZ6s2+UNZUaUZh2Kd0F+8KGDIyjDoPE3cKBF63AhDNNVRi5K52graxv+Ta2
 Hw0Up+YVUuLMT8UoUK2CNfLUCVmODpKigQAmNvFa+u/+Hj3qBmh0Go+oHRPgPOKHGtqS
 vhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WmZ1iLaRWTR5WM0lMJr57R9TNS1Stv8HvXzJ5i2EblI=;
 b=AnwfqxvOQg7g6MLg5U8RPW2H6P7jPSHgLLJ1k/wsQLgu7p+3mUI+9URuXFsLqAs6Ih
 Ajpx888nn65Y85YNCZd8sDklb8ngMufxchStvYw5MciUx+mWRa9OXvpH9B4Z11s8Sxx4
 E4qp1dXCYD+lu/Pm4bDhpFqd+LRmoOeVE9i8rEVOlBiTGijVETKzvyCLoqu1sagkYX60
 DZudbsNSXr7UIcqdHggexBushsgcly4MAYqA8g7ghR6gcfKqte+/ChvEdxF5vdTclIsu
 3tHDT0Y9IEmLymG0vgBtGRPGgeRwWN3Byx+eqbBzcBYxTeOBbxU0hb+MJ/QgSah4r8BE
 7W+A==
X-Gm-Message-State: ACrzQf3iuDhOhRuPtkISMLW0gr2ePRWLMriO/T+VR1zw4l3yqk+IlKNs
 r00n1IixNkwigglaHTknY8+tXLxS6mPKts4YYmsjTg==
X-Received: by 2002:a17:90b:1d04:b0:20b:cb40:4b3 with SMTP id
 on4-20020a17090b1d0400b0020bcb4004b3mr3085341pjb.215.1665161444789; Fri, 07
 Oct 2022 09:50:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-42-richard.henderson@linaro.org>
 <CAFEAcA-LhvMYbTTcsC+eAcAeA61e9Kq=zf6fKr5j_4dusuRDiw@mail.gmail.com>
 <52ec3b12-b9bb-b2a9-52c8-54a7016182c6@linaro.org>
In-Reply-To: <52ec3b12-b9bb-b2a9-52c8-54a7016182c6@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 17:50:33 +0100
Message-ID: <CAFEAcA8Qe-Y1HD8ULjDgrcRGbpXruqL=te9NXtTv2OWv2DOBhQ@mail.gmail.com>
Subject: Re: [PATCH v3 41/42] target/arm: Implement FEAT_HAFDBS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zWKobiN+cop+

On Fri, 7 Oct 2022 at 17:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/7/22 06:47, Peter Maydell wrote:
> > Are there definitely no code paths where we might try to do
> > a page table walk with the iothread already locked ?
>
> I'll double-check, but another possibility is to simply perform the atomic operation on
> the low 32-bits, where both AF and DB are located.  Another trick I learned from x86...

Doesn't that cause a problem where we don't detect that some other
CPU wrote to the high 32 bits of the descriptor ? We're supposed to
be using those high 32 bits, not the ones we have in hand...

If we do need the iothread lock, we could do it the way that
io_readx() does, I guess, where we track whether we needed to
lock it or not.

thanks
-- PMM

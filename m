Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp189907lfm;
        Thu, 30 Apr 2020 20:40:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypLzvxbFTp5d3V9UsMarOIwOzyCHYH8Ww3lgsRU9pBhaf2KCuoadPNuipOdcGvY6JgbVqwx/
X-Received: by 2002:a0c:8262:: with SMTP id h89mr2049032qva.173.1588304400053;
        Thu, 30 Apr 2020 20:40:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588304400; cv=none;
        d=google.com; s=arc-20160816;
        b=JIFkZkyw/Kp1IzSwk2+NxcRdYBYdzFsL8uvxOJQekrF3jcryWB7bbYchJ1sLaI3uzR
         ++GfEcqUR+Gc/DlPLR0Ej3SeNwhwV/iqRP3Uy4vVYWtJOY2ozHMcvqqg+cA71GC/PkX0
         wq9hV6hli8xc1rHG5FEiMrpGTVCUjMUPKdWm5janYIQWYP3Wn4wFOrUImXrNbxkWhATB
         kPu158++E2HoqzJ7qJLM96f7wkvvQSNSqH6YFFWsTWInNT5GO8JmwMK+KQUl0XnCPP9V
         dk4wLGUzOBqCnn/0JtEuuY+A8kTw7NtUDS2bO5VUIrYep/h5Ib7CJIufK1Q+cuszqous
         HCHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=9Lfb6fl65+m9OpZgd0SnqULuyiqYMXw+U6I2a5N+7EU=;
        b=yKWOj6eiptreAxeeJO7MMwGNhM0ZIhAqw6C1nwhbP1ACx01IgT3DYm37Nj0nrDdYxr
         U5aOoME2Y4n46XKPx+wH3L3nUUIEkW+GK+jRLgdtRmTg1OnzdFE3t+48wZv/fzp7ddV+
         hUeySnm4vz70OrfkMO3ttvXRASdKMkVmmrhMqm/GPdbQf2nlK7eRUkvBkZMjY13AoQTS
         /WANhB8ntdlXAxpaWFL1BQQqCu2QanLZBGqIqExRasmYQ4YYSbOi5VU/ap7IUF12u1a4
         WBy1z8ELXKEQ3oGO/V9Xg4W9gPj1MWY5CVgDjYIRRaPLCrfp9eJJJKCwkMPWr1uKH8IY
         xZDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TNnoMf+E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id i1si943579qka.197.2020.04.30.20.39.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 20:40:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TNnoMf+E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUMWt-0006S2-G6
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 23:39:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53288)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUMWf-0006No-9o
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 23:39:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUMWe-0007Uw-Fm
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 23:39:44 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:34723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUMWe-0007PI-0g
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 23:39:44 -0400
Received: by mail-pg1-x542.google.com with SMTP id s8so4035455pgq.1
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 20:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9Lfb6fl65+m9OpZgd0SnqULuyiqYMXw+U6I2a5N+7EU=;
 b=TNnoMf+Eo0W2Wr9DzH9GR5eyz/OSeJeZ+w68bNqAbkeIXx/VOK1AH6r4W2m8afgwtw
 9dgm5jqDDM+woimFpZBSo7AO1bCSdgQMSBtqHZiK2VjB2kiB1czIde6DjP1ov/QQAGho
 zHFmVtoy12rBaUCPRsRMUhdGrAma2F82IdYO+V+XwvsahTFpWupdDIIKxxV7aQ67/BiT
 Pt5vdlsyAl4YLVc/QJ3vD55hA4lQFUaZL2QYJQeV0sgzLreDBn7G74YcTC/U0OwRAvRO
 OA2cG1P9HT+H77ehZ3SapVbw17FURBSwn6i9HxxZGofee+JqUpv9l3JiMrJQhtvQ2qxx
 KWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9Lfb6fl65+m9OpZgd0SnqULuyiqYMXw+U6I2a5N+7EU=;
 b=JX9M1kP2LcmrYvtEJcF/kEcAEk+rHbTY+ocNT8oEVjWNWtU+gk0rGPSkadEM9jO0pu
 feZxhqRU/2MISBpbf9/6JOhf3DvbHA8CSxAErA/rgfN9OmGUhbW0f6GPvtEi1SiDNUBV
 C4yl8jkugYvY71g2XxgyV7ViLOosNz+oxJhZGqcr3257H4+euwO8PNtMSumtPJg6L05B
 8fn99QmPlqlB1rX48tfwuBiT8B5SgryTWx4dkCohGVNj8JrVd0SjUXdau3FTg8/+U3Rx
 cE1UDShwUI2e5ZqX049YwJx0NMMqFGR/UFniOX/S+qZUzeSx9SbSTRZZqsjpubLvhXZp
 SXqw==
X-Gm-Message-State: AGi0PuaSd7Id0qp+AWPo4QwsOMFJR7xm5wRH8nLJXphatd+T/eruTPkd
 7oaFTSnl4LZCJrh2g4+vlYELDQ==
X-Received: by 2002:a63:1d46:: with SMTP id d6mr2361300pgm.236.1588304382464; 
 Thu, 30 Apr 2020 20:39:42 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id g10sm1013012pfk.103.2020.04.30.20.39.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 20:39:41 -0700 (PDT)
Subject: Re: [PATCH 29/36] target/arm: Convert Neon VPADD 3-reg-same insns to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-30-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d278d90c-7f2f-d886-7c0c-2d46e10ce1ef@linaro.org>
Date: Thu, 30 Apr 2020 20:39:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-30-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::542
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
X-TUID: hnW+1e+WYAwi

On 4/30/20 11:09 AM, Peter Maydell wrote:
> Convert the Neon integer VPADD 3-reg-same insns to decodetree.  These
> are 'pairwise' operations.  (Note that VQRDMLAH, which shares the
> same primary opcode but has U=1, has already been converted.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c |  2 ++
>  target/arm/translate.c          | 19 +------------------
>  target/arm/neon-dp.decode       |  2 ++
>  3 files changed, 5 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

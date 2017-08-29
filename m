Received: by 10.223.188.70 with SMTP id a6csp6138770wrh;
        Tue, 29 Aug 2017 08:43:08 -0700 (PDT)
X-Received: by 10.237.39.69 with SMTP id n63mr6140199qtd.143.1504021387966;
        Tue, 29 Aug 2017 08:43:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504021387; cv=none;
        d=google.com; s=arc-20160816;
        b=hmSyilI+alBikZKGDONvWUkzJF2CZwQC7jfSRW1vTrJTPDsPY4/mdJQhSiWvdQto6J
         /LxxGKvU/LpLIkO30ZBGoEnxS3lmBx6rjbHbe2+lFKW5Ceb15Ryhk8+JYDkBPHzYKsmI
         llcINkoqfnX91pN8OF1pQ9ubnJZVJ+z70YIXLQx11B3HDKG5l+9rIBA6XrBMjvGTjn3v
         7wmKQ4VNAUzV08/kZ9THZfEcaXKg2TdPhL92sylq5IOSeOYxwmaz7Tn16vNdOAhHv2Kj
         8jub4I7etQZE6+Nqf8bQZuytB3pziPLoENjVTduiwFTzzXgDPGYCU5CTSMIwKzthmJRA
         Q3AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=lT+jX1KJfRO/lAzVbolV34pyqGo0oHa7JuixH6tM2kk=;
        b=HVFcy8GG1i8mDzO6z6jdAUhBtIPgdYwIFNKVfMb8WeUDTANCKwSvR1QDhjYuALhADH
         s8+0kv/U4FPoQAiAFmYPQERimAQTV49J3NPfJWHA6Dh1oO4nS2eN9+ehfC7zdERhTKam
         atd8zeSDSq7QNAZhEioQsFbSHptqKHE6K+I8psspzL9hmA8lKD5d3VG3sDs3O1Kge2Xy
         qN/jsCoX8YFOXjqMDX10o5HPias3bQBDLyZRwx7pJ4XoBRIcJQW4xD5uAgJG7NhBnz4c
         t/oXzSec44SnTmNIreOuQQMfGg6KP/Uh4KnQUDCBRH7YCe+Ww2PWOw1ELwqQG6+ewaOH
         l5lA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DN97c4ay;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q56si2970595qtk.266.2017.08.29.08.43.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 08:43:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DN97c4ay;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45580 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmifR-0003An-JC
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 11:43:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmieT-0002hK-R9
	for qemu-devel@nongnu.org; Tue, 29 Aug 2017 11:42:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmieP-00013C-4E
	for qemu-devel@nongnu.org; Tue, 29 Aug 2017 11:42:05 -0400
Received: from mail-pf0-x233.google.com ([2607:f8b0:400e:c00::233]:35969)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dmieO-00012N-V9
	for qemu-devel@nongnu.org; Tue, 29 Aug 2017 11:42:01 -0400
Received: by mail-pf0-x233.google.com with SMTP id z87so11267242pfi.3
	for <qemu-devel@nongnu.org>; Tue, 29 Aug 2017 08:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=lT+jX1KJfRO/lAzVbolV34pyqGo0oHa7JuixH6tM2kk=;
	b=DN97c4ay1IdtvdZf8h2ZSCG5IxPhMM0CM2qBdFMMcfMibk4dG/NDo0fKSbIpY8tA0L
	J+LrtAHhKAlY620Ku9IxJGnpZtyNoO4zYP068fJ4HW0IBHjaY9L2kN8hiJ/5rMxfLzk4
	icTKW2/F1qJRjinUQAogoINgxMqu5KYP4VzTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lT+jX1KJfRO/lAzVbolV34pyqGo0oHa7JuixH6tM2kk=;
	b=toiHjNZafXw+IEkA1pqEJu0D1B8MM8EGlpVtemsrSO8ZFrygTuxNBKa43e80en6lhe
	6LNiTJb10Y5ecel1z17wHjSD/SvSxl2oYkLd7fs0adI6ZYgpX5LB/KMunFr8gCQ4u8zC
	5ZdPipI7DYHPaI4Q9qL528OXjKUq2mNweZHOFM/lsQ4Evw/M7xWrRh9Qv/apiSAgApHG
	TBgNrVBLvLPSk6eQ/UGu+e2S2X6Q60GVnTcM7Z8lerZXaf+ufTI1Fku7SO2DLIMFEAIN
	BA4IvVEEwmJbk5PR9oA/lAIXQejRtIot4CQwnR2mjtXk1O1ckNPK4Nbp+faIJv7JkIse
	ebUA==
X-Gm-Message-State: AHYfb5gwyhgssfM+979S8A+rOBLKkXA09HVMXhAdUeP1A5vCyUfxSZbj
	WwmyB/ZvS7ykF6Fc
X-Received: by 10.84.194.131 with SMTP id h3mr1008854pld.100.1504021319642;
	Tue, 29 Aug 2017 08:41:59 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.gmail.com with ESMTPSA id
	i128sm5802754pfg.81.2017.08.29.08.41.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Aug 2017 08:41:58 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-9-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <243eea50-7167-ba35-9481-9c919e446371@linaro.org>
Date: Tue, 29 Aug 2017 08:41:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503414539-28762-9-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::233
Subject: Re: [Qemu-devel] [PATCH 08/20] target/arm: Make FAULTMASK register
 banked for v8M
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8IOTFefAiREk

On 08/22/2017 08:08 AM, Peter Maydell wrote:
> Make the FAULTMASK register banked if v8M security extensions are enabled.
> 
> Note that we do not yet implement the functionality of the new
> AIRCR.PRIS bit (which allows the effect of the NS copy of FAULTMASK to
> be restricted).
> 
> This patch includes the code to determine for v8M which copy
> of FAULTMASK should be updated on exception exit; further
> changes will be required to the exception exit code in general
> to support v8M, so this is just a small piece of that.
> 
> The v8M ARM ARM introduces a notation where individual paragraphs
> are labelled with R (for rule) or I (for information) followed
> by a random group of subscript letters. In comments where we want
> to refer to a particular part of the manual we use this convention,
> which should be more stable across document revisions than using
> section or page numbers.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      | 14 ++++++++++++--
>  hw/intc/armv7m_nvic.c |  9 ++++++++-
>  target/arm/helper.c   | 20 ++++++++++++++++----
>  target/arm/machine.c  |  5 +++--
>  4 files changed, 39 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


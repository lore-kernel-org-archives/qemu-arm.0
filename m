Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5405035lfp;
        Tue, 11 Feb 2020 10:31:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqzFP6JUS5n40mJxXcvqG9nEsMSUGga4/l+dUjIImy5ARkZ/5HVsjOD/LfLD4YyIPLVE2x/b
X-Received: by 2002:a05:620a:795:: with SMTP id 21mr7719314qka.60.1581445863484;
        Tue, 11 Feb 2020 10:31:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581445863; cv=none;
        d=google.com; s=arc-20160816;
        b=Q0aoIUSw7ii9Mk8sU5QmOoFqDGclMtzLWdiiyCczRxfFpnl+ZveBG1ciXloRpGEtlB
         Jl3yeJzrajiwY4nq3vbj54PklMN9rZXuDZx7b2HRGFadh0v3B2jW7UzfykXy0w4s+2pW
         7gWzmv5fTRdE6nbaL0xPvja4qR6YdJlqOB5FsfE+GQdcdjAOT6s8sJC3uy3KSekDMsl6
         f5cwE+gvAO2CmbbrDo3hLcI8PoUtvgM1IPa0G3wJTgDrdlflBhXATnoj0rkdh0CwC4zJ
         5rZhFGhTsy3O6P+YPMYkvNdmdR/wxmfBKDsgQZucgWyHQEV+jD+dWSwSdGxGOgDtN5pD
         sKew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=48p9j7a2FQ69RWmeEDij6QMtYa6lvA8nNR4+fSAJxwc=;
        b=ORXGibvtLNolKQxtBv3a0KvgMUjh5Z/Z/TGUH2I+aTm77B0oqt7jbwc3ERSjdmIRAq
         NDqPvVNIw6Z7TvDm9QOsVGapSSvjJgetVCKjQoYI0SRg8r7Yp0Wux1gz8UzPUhfpSl4n
         ifuPaGnWHSyiy2yGnjDyBGyiD6YbhKGdfPxC38PWlpBr7jLV1CZpFMDIHoENrRZkYAbD
         4XRhCZzF1eRHmPMTTUPB2JiPbNIUi6vC0AG/dA3ImnY7+ZigBbQa/mx2C+Zm8FUoDg+/
         x/2sTj77VA+fVLvqqjbKq3U91PHSiQt5v3X7fDBZKy6st4mSEFd3msTT0zW0TKv4mPwm
         uqgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TC4pZUX1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17si2312895qtn.1.2020.02.11.10.31.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 10:31:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TC4pZUX1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1aJK-0000EB-U4
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 13:31:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48125)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j1aJ8-0000Aj-IH
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:30:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j1aJ7-0000Rk-MP
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:30:50 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37059)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j1aJ7-0000Q5-FR
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:30:49 -0500
Received: by mail-pg1-x541.google.com with SMTP id z12so6167164pgl.4
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 10:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=48p9j7a2FQ69RWmeEDij6QMtYa6lvA8nNR4+fSAJxwc=;
 b=TC4pZUX1Nmlvxtwlkzo4Zsqv+ZQW5nZKfHfVawjfI3aBS8ntEJjXdi9AL9si9E6ABQ
 Os2wKfzD3X4VU0RkOllmKZT1f8jWZ9OxK/ig8HZgNWX23TfCpipepX4JrcmCjXLmCcR4
 BPMK1Vq841B7cBU34PLujbsKmfdmZ2loCUfTLgA7MixpvTLu0BjFVef7V7HqBYvCmk/T
 hFtvETkUFwn2Ustt6ikY1+zEuOOw6HC1Kdb78dKMtnkrnpU2dNQGXq4VbKl7zy/ktFOY
 TUtsyIKyyKHAZI7fcdmT4HU7z25aGNBBvfWxus7eNeVSbyl/gYQcWugGMo2JSjkssrDN
 HaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=48p9j7a2FQ69RWmeEDij6QMtYa6lvA8nNR4+fSAJxwc=;
 b=qQesUXF2MRe9zf2Z3TNVERLbF4RtT0Tn/hshWcgEneGkMg0WvnYu+rsBoPqyV7bqSN
 uJdFbjTbYjXaLSQgmeGKIYOecLChj+j8HBYmBIsXUroeSoJWjYz2tqWp8GPzLgezfxzL
 t0hyYm5z4eXDPuytNctdW+z1egsI30dg4otylvN6S53c41LuMjxyJ/E9t0cqECuQkovc
 i9Z6hJCxlTK45n+WuRLkJ8wA8Se+xlX3h/otIx65yqerRWhAEKMRxHopGh6kxJUlchn+
 QIKBuScl+RPcYG7A7yA7DKdXncIm/xClDVy9eX5VH0fFF1pREwsyqdTEzgnb9WhVu75r
 EsIw==
X-Gm-Message-State: APjAAAWCVzYGiWZyqgFEMQhZCp9E2whe//nx2+DvrcNdObR0sEXbUY98
 Nq75Movy4nMzYZlAoWZJz5wQLfI424Q=
X-Received: by 2002:a63:445e:: with SMTP id t30mr8269006pgk.367.1581445848444; 
 Tue, 11 Feb 2020 10:30:48 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 u11sm4120486pjn.2.2020.02.11.10.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 10:30:47 -0800 (PST)
Subject: Re: [PATCH 04/13] target/arm: Factor out PMU register definitions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200211173726.22541-1-peter.maydell@linaro.org>
 <20200211173726.22541-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <39d47875-a324-e3dc-d61b-6a419642dfd3@linaro.org>
Date: Tue, 11 Feb 2020 10:30:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211173726.22541-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U2N/reqYQRya

On 2/11/20 9:37 AM, Peter Maydell wrote:
> Pull the code that defines the various PMU registers out
> into its own function, matching the pattern we have
> already for the debug registers.
> 
> Apart from one style fix to a multi-line comment, this
> is purely movement of code with no changes to it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 158 +++++++++++++++++++++++---------------------
>  1 file changed, 82 insertions(+), 76 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


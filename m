Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1469094lfm;
        Thu, 25 Jun 2020 09:37:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhNYbkl2glZttg6KO7KpNgGZB/0F40JuZS5K3zw++lbMYLM/1n7lnz9Mr9VJ8fbVHSGYCo
X-Received: by 2002:a25:86c7:: with SMTP id y7mr5789466ybm.69.1593103055071;
        Thu, 25 Jun 2020 09:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593103055; cv=none;
        d=google.com; s=arc-20160816;
        b=egVzg/9VVnCtwM17A6V3lRaKrUCJkV4mnQw0PmVg/KEP7lr6nIhead3qCeQ5G0mkJ0
         s92Nv5/cQJS3TpB/EHMH9qBXF2G7rz8LQ57kjT1iUWU7mM1y0OfyaJi6wY+a47MVs152
         FSrpxYLEY/mpBf3DqGeXL/io0+2MFXe83bp7xv1mfGFoh0EWC4wf/xmLD9cxo25TVIyW
         bHO/0ShdqIO0c73MMBA2VT0rz59kK/lSB+2yiwmzPJGDaqiDiDsZPxE1NqYk6NnburO/
         dLVCdDzcPeq1VYpS6+GFaSB7eBFfy4gBWS+K3L04wPOpy0RL1P/FSwdsVM2LSBnKMRZP
         /Rbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g4UX4UfNRLpswpEvtDKEP0JEsYCSxcqTTFcXbCTIZfI=;
        b=Y1EJdxxJsVn3KsfaJeiYEaqaEnyMIzInDAjzP1XI9qqATPBVPHkDLAyR6f/JOU5d1Q
         XlIRMsDbNSH5DXpeJKkyu0UW3CT3cBliMk1ARd3MTpvf+r7eC44p1MbcpYsuMLRVRawO
         FMX5DdhIzyDCt9bUmkUp/UAAyuAToivDz3g+ZYKfBLM5BKMJ4nIJnljTO/xtCU0DNMTl
         ZHWPEqsFOBBtvn1MoPbCGmKfDxLNAb1wltrQXJwjDGwxtluyP4lvHvwvLfy2NCt2lD6I
         eO7ZX/XVp29HfUR/z4JNvRKl2MbbyClGJ8yrC8cd3+fyMsJrgXC1WJKeGKyWY+4SutYN
         XJBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KaklORHm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f96si22321301ybi.131.2020.06.25.09.37.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 09:37:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KaklORHm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joUsY-0003dX-FM
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 12:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joUsN-0003ZT-UT
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 12:37:23 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:40534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joUsM-0005yg-Gy
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 12:37:23 -0400
Received: by mail-ot1-x344.google.com with SMTP id k4so2683559otr.7
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 09:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g4UX4UfNRLpswpEvtDKEP0JEsYCSxcqTTFcXbCTIZfI=;
 b=KaklORHmalJpP4ZdDTzGrTh3nqHuI5Svel9kDsR5ReCsHV+LWbvyIqoVYu2+bRdh4W
 VLTB1UF9vlepQ/OM/mb+VyjGQJO1uvQIW+3mkSzLVLiYB5fovHNjtC4lDU0at/CRa83N
 9JZLbD5Iyl7pRwsYjw+mEKItLbzy7NcWf6octxzt72plSzV+3DWw6quuWzxNkAnpFiHh
 e1tYglVLqvZqL5YvS1b2aONR8gaJxJwssUhwCqA4x5r4TN9PzaB48/hk9DfXNn+wP3G8
 lISSCDUXGGPSTMHv72r8ObhPrJN4DPS6wP7KOwQjjoEBjBqs44XJmJtUf7p6PDD34cJz
 ztXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g4UX4UfNRLpswpEvtDKEP0JEsYCSxcqTTFcXbCTIZfI=;
 b=RxJtyOVfRG4cUV+v7j6290o+47X/3EubLKAaeedwk036s26V7so0tHsLMHRPZ7a0XE
 I5YlCFcxmJfKb6Fu1s8lGP3h/s1yNUoAl1WnX4VVyUsXn6T1gWg6uCOkyq9LVZXkLyJE
 GR2KJitEyovhe0nVcF9Xot8C4gRTLX0CRCaqAtB9gnQAxgr/rqqUVbLDjALO9M/IWhbq
 u2qzEfw6LDsKqdzAdupfz8El1ua8yXwRJPhkIDkkvJ6PsJkgn7iWBRqk6xcli+hTNrtC
 9bbw2OJC0+weTcqeESKsULl3q6y1MgXpap0Vj2mMCqLouUjLtpPrDh6HLBW0W+LVCfX1
 b27w==
X-Gm-Message-State: AOAM531xZLrjVSzizVZgTOemtNI7+hsu42iMJJ/WUFg9vQZbM6W/WM/v
 Sfd/+bjAHd5JZTN7w0G3pAYOmyoAD0OqDKfcqUWwCh5Bhf0=
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr26330242otn.221.1593103041110; 
 Thu, 25 Jun 2020 09:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200605041733.415188-1-richard.henderson@linaro.org>
 <20200605041733.415188-8-richard.henderson@linaro.org>
In-Reply-To: <20200605041733.415188-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 17:37:10 +0100
Message-ID: <CAFEAcA97vFoBSwmFkD6bpObD9P6W8J2iowKhk7mT32+xjte-4w@mail.gmail.com>
Subject: Re: [PATCH v2 07/17] linux-user: Fix guest_addr_valid vs reserved_va
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yBWUuFV6V758

On Fri, 5 Jun 2020 at 05:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We must always use GUEST_ADDR_MAX, because even 32-bit hosts can
> use -R <reserved_va> to restrict the memory address of the guest.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu_ldst.h | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Doesn't this run into trouble with the arm32 commpage?
The reserved_va is set there to 0xffff0000 (stopping
at the commpage), but the addresses within the commpage
themselves are still valid guest addresses.

thanks
-- PMM

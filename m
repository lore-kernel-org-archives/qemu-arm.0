Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1767483lfb;
        Thu, 21 May 2020 10:20:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/GXggRMZJhCs81mOiwPkzZIltKkDQKE7e/Y8p9zYWyjyvVK/lCv8SjpGGUMK31TzG7nwv
X-Received: by 2002:ac8:d8c:: with SMTP id s12mr7688747qti.61.1590081656670;
        Thu, 21 May 2020 10:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590081656; cv=none;
        d=google.com; s=arc-20160816;
        b=Fnr4Io2Wmrfk58yIEujSRTarZFZRUTr2k2/Eu+XqhjH5gfR18Wi+MCycHmrmW2Hic3
         TtDB5EtchH2TcZBk+iWurBG7B6HSOQ6zMfgTFPao/M9hcFNBtCtsG6GYYfODzoRXxsrD
         PaDFo9/qgHCgXDvh8tY0JBgSHgi3WmhiwfOnYicz7FsKbxILMFz2IMtj5FzdYAg8OZcv
         P4nvZY/mD2GZ84D9wAD2ptewbY1n6TLmTPbuwwGwLrOuhABUTp8uZmrZaH5rnhW4ZogD
         iKPnEhu/WM2ofrQRERP7KaSFGsVVhXXQcUjC4ShOsxtcOLo5PhFVzKoh1mYFMY/dzGDY
         kr9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pLFCIp0XFHZeGWDRfPEhCpc7Fs4qtKzYvjQ0W/FfaSM=;
        b=X102iPkMQv9n2/eABc+fnFedV2t7Xyi9jB/TLR6hasfjYPS4IHi1RUF2DZadPQewvP
         LjIlwPI+ebYV3AOFIscAIPdjZ2Xe1SVmoDl93oVZ3BdqvWKeSLV18v7mVZiwIf6/tS9p
         zzj1/DOtgHPb1Ihtq4cktfhUaTA8WBrU0tYor/OOKOblOi3K614dWCpZEqVgVFxyL0JV
         DvFSz6QbPmyrO2L+XqvJ23GvkqGsPPQeRiRbqWEWWLzRIn2j27g557i3tm449wzL6Ww+
         c7lZ3jPo6s8aBgNcRed6xfIQy37yE+D9Fd5TyDPRuFAx6ol2nGXvfXlC5iktbOgb7Ocb
         JPmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mmkk+70z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z40si3652693qth.244.2020.05.21.10.20.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 10:20:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mmkk+70z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbosK-0005oh-4A
	for alex.bennee@linaro.org; Thu, 21 May 2020 13:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jbodM-0005OZ-Lj
 for qemu-arm@nongnu.org; Thu, 21 May 2020 13:05:28 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jbodJ-0002cE-6D
 for qemu-arm@nongnu.org; Thu, 21 May 2020 13:05:28 -0400
Received: by mail-oi1-x242.google.com with SMTP id v128so6797282oia.7
 for <qemu-arm@nongnu.org>; Thu, 21 May 2020 10:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pLFCIp0XFHZeGWDRfPEhCpc7Fs4qtKzYvjQ0W/FfaSM=;
 b=Mmkk+70zD/89rdujcnneto7uMGa9SbFNBrB0DVeAfBxci8pcFW4tXDNWLhkiHkyRxH
 ibercEhWtyj4XYbLkviAecFp5xjQKBU2qzTYSaRjJP9xE4aS2Q0PCP9hEmxT5RlBCsof
 WkFI8YHURhitHTB8gUQSTNNKcdNt7kgL4PRH8aFgevV7TTdOdgvDXJBKuU6rXQZCBrt1
 4HrThCh/PAPzp+P6mGX4fGhYwWxxVcKxBACUCpAgc+aqi1/Q5B+/LecviO9L+wL9eHBh
 YokVG5ENMQUoqAPZzdRdLInnzPz/+vaJ9cO5aruqr/Y3NFg0mgXfGZlWO5GAJHEuif7l
 hlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pLFCIp0XFHZeGWDRfPEhCpc7Fs4qtKzYvjQ0W/FfaSM=;
 b=gm+9vTwCde+e/XLnqDRVNQJweINZMMb1RMaVb9pJvINqNjy43nhRUHTi1nBWgQrJy9
 9xT01fkHbf0CbizUw1DweC0FqE/IkWrkucNAdeto0gquYyDmf1jYfQg8KVRP4NAjlvWp
 k7v7KVlRkImSa0pNtmWgSh+x2DvxfKy3Sv8EVXtZRG21CO2I3/mCvwz3jZpeQQXN5L9L
 Eh0mLJiEnksQKcTAdZ8OUgwKwJDMSdy+PJ5B2LPXVVZ+5jFMHHep3812A/qovRiYdbSQ
 Vz+1nNY1xG2Zv9sH7RM2TAS5D8SWc5XqCRwbdBld3dbcopcnbTIK+aSl93ZqHctJxh4u
 ij8g==
X-Gm-Message-State: AOAM533xhueHy1Rv1QzEj91wOurGdAuuh36Cva1oUI68RShdYSd1CNl/
 V2qvvxPozowQqK5J0lEOQqukWW9gVZblJn4mWcMQKVtz
X-Received: by 2002:aca:eb96:: with SMTP id j144mr6875001oih.48.1590080723816; 
 Thu, 21 May 2020 10:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200518143014.20689-1-peter.maydell@linaro.org>
In-Reply-To: <20200518143014.20689-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2020 18:05:12 +0100
Message-ID: <CAFEAcA-X1MpWx-_Y_UwSyToZs+M2__vKj8tRSKEPMDq8t_M47w@mail.gmail.com>
Subject: Re: [PATCH] linux-user/arm/signal.c: Drop TARGET_CONFIG_CPU_32
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GrbU6M643vrL

On Mon, 18 May 2020 at 15:30, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The Arm signal-handling code has some parts ifdeffed with a
> TARGET_CONFIG_CPU_32, which is always defined. This is a leftover
> from when this code's structure was based on the Linux kernel
> signal handling code, where it was intended to support 26-bit
> Arm CPUs. The kernel dropped its CONFIG_CPU_32 in kernel commit
> 4da8b8208eded0ba21e3 in 2009.
>
> QEMU has never had 26-bit CPU support and is unlikely to ever
> add it; we certainly aren't going to support 26-bit Linux
> binaries via linux-user mode. The ifdef is just unhelpful
> noise, so remove it entirely.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---



Applied to target-arm.next, thanks.

-- PMM

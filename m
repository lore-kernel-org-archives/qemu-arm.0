Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCA0C55165
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Jul 2026 12:29:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpPtO-0006Vw-VY; Thu, 30 Jul 2026 08:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpPtM-0006US-R9
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 08:29:40 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpPtL-0001wH-5L
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 08:29:40 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-668432fe416so2672047d50.0
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 05:29:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785414578; cv=none;
 d=google.com; s=arc-20260327;
 b=bMN8LcP8DetIoaCyDvx/r77/pNUvXC0CxqIwJbO9OCdxiSwEj4JtxV2Rk23RvD4p06
 iySFG49ZSuWYcI37zTDwdwbRZySq1Bj4814ewyB1JIU0hxmRMW6j4EIONN6XlB8AdR6+
 I6K0hDChHbVNLiTQ4mLpp24Di0qWh6dt+wYupO+hoS5RufSIxAHrOTjS2BPge1uXUONH
 e2/PX5qrlDdP1fsMG/bYdVyo475B3hxn3cB9FUItQMV0I6j7CFNCBwoxlG/f0VFIOthb
 QA6B2b07zMhmuEg3U9azoAAl4wvlGtN33v85M3pWvyKtWEGClHMrqr+WeE8gaAVwdU3y
 fJQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=h83qJRCbPi9Q/QwFzKfiuFaidosc70DcXYKbE7sjQQw=;
 fh=MY+RTGlDZBw1hjx9sCas5mVeVTtr+VfM/WJHDpsZ79Q=;
 b=rgYxjibtkjGdZ65434rCrYLJmqaKpQ4zpTWMU2FXXUa6SGEUhwOLMK+TrqoAdU/u4x
 yXGGP3oF19am+M7ApPNqH++aDlJL2NsAg2CsYYCd9WZ58TDs1mmROMMhKiY/pOssvCLu
 KxDsaWGf4ByU63Ux6alx0SFbalschh0hD+X//6gjh8jtino/5yAwKIN33ZVvOkto+UP9
 YVotbtpdpeTi9VILys9H21/fdhhg7a/ojrDVuQiiwbfZCA10pjW6CRPofmBH1H06urEg
 OMIXYNK9aQYYEdQWRdDN4e4EuwJF9g7m3Thv+1czOsrDvdc9ltFu6rY+XD8LIBR4snfd
 NNtw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785414578; x=1786019378; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=h83qJRCbPi9Q/QwFzKfiuFaidosc70DcXYKbE7sjQQw=;
 b=EDtBduHcpQbJphVTKc/6TCJ3O8M9tF5iJGIDDISmeqaCjr4tORFhINioU1TVeTxM8m
 5nu7eWkl9f1UnZb/8DqY1jzuPX7BEvZ4dmZwbnFKFLjWZZiQ+xpYo5CbhbLgq3MLCNxJ
 JAD25XbYmLRZKML/w85f+FG+gTWNYiSzUqjRSeJ2eRDPDY//7927IzfEOngVXhtyM1sM
 0edsxWWgOBi/1xemuOunvSObVI4mz7l4yAxzRSmnlaGEdw6AtKG+tbzQHvDYspRCqjx6
 WOUN/yVEdqYVRxvUJW6fFx0bMF72tTMpcg6HcUQi/A5CCHThLyO5aZ+7/NVQT9M0V3KW
 yn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785414578; x=1786019378;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=h83qJRCbPi9Q/QwFzKfiuFaidosc70DcXYKbE7sjQQw=;
 b=l5klqydKiEpyC3BLlng9RI8urG0s4OzbCeDKRQY4ucrWA0qJez3kONN9zZ2z+MFy6C
 L1ZG5L+aJNHWB/96QzLOFlpUtuUIT1CbhiJLkt354yJSBiFzWKqIncGUblqvdjtU3gFn
 qohJZHLLXp7rytWfQh7BHRB3+qcydKFo6FIT9YH1Ohqo9rJt9RmjbvgwI4lZEih68DyK
 AQsDdj2MXDzvDwTR1HnhDgflr7uUAusy+ZFkXABJsLn7466muanZhrmv+o0piWwNhnL0
 3eu28SbCtx/FUCaTuIl2BiexxhSyoQR3+RNyLtp4SkuVfV1K5zChc1MIKeNK1m7RHZrK
 Y+KA==
X-Gm-Message-State: AOJu0YwLzp48pxux7RPB6v+Czrcuyb+SigU08aFklFn69rKpYgVu8nRo
 mdB6OMjDeWpN73S6UiuEMvhLBAIQ8Tdsts5gj2ehd3sfIQPIASl4FL7z5hgRGfKb+WF6Y8KLJen
 yRm1f0IBFGUwbKa2KcgNEQ0glsbhbDXdDXjbEkyvf8Q==
X-Gm-Gg: AR+sD10WFynS6WXFdBeaM+ICLAPwGcXjNYqf2wvobQUm4SMz8Pw14HUhcD/UYsk+X3e
 Ns+oxlguetVPTOJ5kCp1O4jfiBoGu6Hc1O8Tz6AxG6Q3M7BZIJZ5VrUxph7m3DNmKLT//W1sN9u
 /27eq/yvppd5TMX80WKLRMLboNW1yyweVhcpO/io+0/6BlfF+Pg1Y4mEMuvuZCMFPFsT6xhU49P
 Lt0lWP+cCzSaD2OFnd8l20pfLGsL1XDc0xxfCmeebnOSC4+ZH9HutmqgSUWxdSvi+T8hC94MdPS
 s4b7Ekue5z2oe9cFEHl0dqMfTkQE1wSbXZmOURQONmDdz0LubVy2qJuk+P1NtIX/df4AXkzW0vq
 3vAPNJo5FsascT1yycjjtdq8VfjlF
X-Received: by 2002:a53:a6c9:0:b0:668:9b6a:652d with SMTP id
 956f58d0204a3-6693a329ea5mr21489d50.3.1785414577810; Thu, 30 Jul 2026
 05:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260729231325.3808993-1-titusr@google.com>
 <20260729231325.3808993-4-titusr@google.com>
In-Reply-To: <20260729231325.3808993-4-titusr@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jul 2026 13:29:26 +0100
X-Gm-Features: AUfX_mxM6cOYRMi3l6xyZZeoTcA0Okydka2OwzWlafMGaSytHFDJbUbQfDAbUcw
Message-ID: <CAFEAcA_RjDnLufCgRxFhbPQv9SrfLxC8RvY5-SKzVWpJ17P7Gw@mail.gmail.com>
Subject: Re: [PATCH 3/8] hw/i2c: smbus: increase MAX_DATA_LEN
To: Titus Rwantare <titusr@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 imaginos32@gmail.com, wuhaotsh@google.com, philmd@mailo.com, 
 fanjason@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 30 Jul 2026 at 00:13, Titus Rwantare <titusr@google.com> wrote:
>
> The 32 byte payload was raised to 255 for block reads in the SMBus 3.0
> specification. SMBus does not provide a way for devices to declare which
> version of the spec they are designed to so we must allow newer devices
> to return as much data as they allow.
>
> vsmstate_smbus_extended_data is added to avoid breaking migration.
>
> Specification: https://smbus.org/specs/SMBus_3_3_20240512.pdf
>
> > 6.5.7 Block Write/Read
> The Block Write begins with a slave address and a write condition. After =
the command code the host issues a byte count which describes how many more=
 bytes will follow in the message. If a slave has 20 bytes to send, the byt=
e count field will have the value 20 (14h), followed by the 20 bytes of dat=
a. The byte count does not include the PEC byte. The byte count may be 0. A=
 Block Read or Block Write is allowed to transfer a maximum of 255 data byt=
es.

You could line wrap this quote so it isn't one super long line.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


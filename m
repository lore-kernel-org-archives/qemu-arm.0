Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp384257lfy;
        Wed, 19 Aug 2020 04:58:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzx8zdGWdgFtEU5AUU71Se5h2RwYWrQsX719phgXJ8eakGI5fBXVHMycx813USHUUElnOoK
X-Received: by 2002:a25:1683:: with SMTP id 125mr30026063ybw.145.1597838334951;
        Wed, 19 Aug 2020 04:58:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597838334; cv=none;
        d=google.com; s=arc-20160816;
        b=pDaBvH1CWQY8b0yNS+3nVNn98sevx5BNMyX4mhhafR7yMAgf02Ivd2Jie4VPGYkwc9
         SLY445PvuYgwlmEhihAXY/endkRV1xJIByTEUWCSTomAik+EFeKLcdjBjwJYJZRRWUOU
         nXBLRVrJQg8mkeNOZ9DjPONJEwIP0qUccFVuT62MiSdoaJJAHZQLzXy8yWfdrw0MAid/
         MQ8oT4ngt9m7A+i+xk6v2rnVwyJUv0wFYS16OhSaiVrGGjEoJenpLSwAgcoGHyIvLg3T
         Rugny+oE5IP8pAb2hI3ODo/sZiE4uHwNKrqnDT/KO1dt0mSEEvH6Owrw7LMzaiU1BpY5
         /O+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kNJC21lPiWCaBSwurUQSg0f5chZ2P6oPnVzPnlAJYBk=;
        b=WyjgPxRxF6Qwgd/wMRvsQIigvkaHXKfC20OS574oAYxpeFhcjHooQ90Ja/s3QyAylH
         SZMVl+uQgAQvQW//Gl6a5zY88ykQwatmpiI41dSABLPKlrpB5JcbCbi+QRszsDQsE3Zw
         eHj61afOybFp3wkWzFCIEpzfVWW2USwVN3otoDYdZEPfWhzEK3ymswnrl5hm4fz3Y5JH
         OtrCvpNum48a2AWwj84oaCK5Buhd0V+qrZTiQf8SYVtn2lSv5qHIDgboaTR0tx8i8ejp
         y6xGXDAiPj13Js9vdMB4C7SSXTATwKJ5wMcHMErsxOdKZtxP0FmyIQ74o3obvXZNYKGB
         d+3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NtqAdW4G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z63si22311655ybz.470.2020.08.19.04.58.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 04:58:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NtqAdW4G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8Mk2-0004my-D9
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 07:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k8Mjk-0004l6-Nn
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 07:58:36 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:41473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k8Mji-0005RT-VO
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 07:58:36 -0400
Received: by mail-ej1-x633.google.com with SMTP id t10so25945117ejs.8
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2020 04:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kNJC21lPiWCaBSwurUQSg0f5chZ2P6oPnVzPnlAJYBk=;
 b=NtqAdW4G0Wgb9WsEyG+SdwfQJUnXFaKMMhrkoLcKe0YkA8DfXtRfD+E1E+I85ZW5J7
 3v0pGxjkw1T2FgCePejJnIWNr08SlVTcxbqelU2GXFN1Oc7mpCpq97Nb5txw5791Olrl
 2cQj2eVb+IzgRwX2JR2/yRX38KvNEz+9mWg4JgXz/2TpuSqPgFFttfsFWAN9i7RiJupA
 jUxGBe3pBNRhUMqtoo1FgZ7W7yaqTC9J7DdSxqtxYpI/zPqkpzAuQwRlzXblXNyLQA2d
 qzYowzyOS9ErTmL6+68NjdhMbSfCa7DiHDXDIPK4+Wfo/j7MnC7iE/quPxmNYcp4OdOe
 /D6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kNJC21lPiWCaBSwurUQSg0f5chZ2P6oPnVzPnlAJYBk=;
 b=a0OpHNoBRCKsS0lBequp6xVRJ3RsZdcQ1KKsskDkTwaPi7l4mzh1Go6MkT4+8wzlvv
 MvWK4sYdWTO3gXQEqC4pYO/UHdM+pcAlNIQRo6dM+9ElTcRHjEfczOaBsGx3NzpBxHF9
 aecvfCxzfuAxGj2YvjvsqTRr2T9ghnOsMkWv+mvRdgKMRT5yvxV/dDEFP26ZI8iIrFVD
 kOu1E0xZZ0BR1/5dua21+9OL9repuz0umu0RwUyZKtYwGgAvL6rTperz8sS8EZ1h+/bk
 7wMhaOVT8LcTUbXe9pgwr60zVmu5QvF3XBSWvXtgo6Vas6vNFWtzciC4IAmwQoGp4Snl
 0n2Q==
X-Gm-Message-State: AOAM531kgZUoWGHFV2NQ44T6ut0HETmIw5c1zTkrWPprz/ZqP0pL+OtE
 mI2hgdAgbIlmGRTzRIZAwCWE4i72Ciqpjr2blJ5H7g==
X-Received: by 2002:a17:906:2cc2:: with SMTP id
 r2mr24138075ejr.482.1597838313186; 
 Wed, 19 Aug 2020 04:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <1995755327.3077884.1597670507808.ref@mail.yahoo.com>
 <1995755327.3077884.1597670507808@mail.yahoo.com>
 <CAFEAcA8OAWdW8MS+7Fe-WUt+B7rP1AruUZWuAo9rAgP5P_0udQ@mail.gmail.com>
 <2127347711.3710404.1597756636356@mail.yahoo.com>
 <CAFEAcA89ydoNcWyBxRvdc648ifOD1sS6e-p0pqoiQe6w=bj=wg@mail.gmail.com>
 <1348331683.3733974.1597759332262@mail.yahoo.com>
 <CAFEAcA85SRv0DUqa5L62WLpbzBeV7Wh91GmyOG3GJrxWpTtXNQ@mail.gmail.com>
 <1227370812.4280844.1597836314970@mail.yahoo.com>
In-Reply-To: <1227370812.4280844.1597836314970@mail.yahoo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Aug 2020 12:58:21 +0100
Message-ID: <CAFEAcA9afVDZO0yd4aOtsUeR8TVc-sfDrdTgiME_1o72NVx3sA@mail.gmail.com>
Subject: Re: Arm Cortex M4 floating point
To: Mircea Cociuba <cociuba_mircea@yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2+GhuelyqU8n

On Wed, 19 Aug 2020 at 12:25, Mircea Cociuba <cociuba_mircea@yahoo.com> wrote:
>
> hello,
> This email will be non qemu related, but close to the original problem.
>
> I managed to get the FPU activation sequence to compile, found it on the ARM comunity site:
>
>     // ARM 100166_0001_00_en S7.3.2
>     __asm("ldr.w r0, =0xE000ED88"); // CPACR
>     __asm("ldr r1, [r0]");
>     __asm("orr r1, r1, 0xF << 20"); // [20:23] enable CP10 and CP11
>     __asm("str r1, [r0]");
>
> The documentation also specifies that this code must be executed in priviledged mode.
> There is little to no reference to priviledged mode in the Arm documentation.
> It briefly specifies that a certain CONTROL register must have a specific bit(nPriv) set to be in privileged mode.
> Where can I find the description of the is register and memory location? and are there specific instructions that work on it?

All this kind of detail is documented in the M-profile
Architecture Reference Manual (definition of privileged
mode, what the CONTROL register is, what memory location
it is at, etc). As Vincent says, execution starts in
privileged mode anyway, so unless your bare-metal code
is going to do operating-system like work of switching
into unprivileged mode to run tasks and then switching
back again, you don't need to change CONTROL.nPRIV.

thanks
-- PMM

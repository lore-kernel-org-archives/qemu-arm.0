Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp2834514njh;
        Mon, 2 Jun 2025 08:32:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW56exYOZyj5hJx8uaIekuI3ShaYgapMg15RxR7HQNLXwHCS2tmHXTegjkKgUUJTFxyeOO4INL2wSjRjA==@linaro.org
X-Google-Smtp-Source: AGHT+IE0nNWj5GieROcRACL4rfMeqKZbJ1Dkxd6LDe8Y2qcVPWGdsSsrTJmw25O5DRbqVx8BePZK
X-Received: by 2002:a05:620a:618a:b0:7cd:3a:f2d8 with SMTP id af79cd13be357-7d0eac654a9mr1268518185a.24.1748878337107;
        Mon, 02 Jun 2025 08:32:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748878337; cv=none;
        d=google.com; s=arc-20240605;
        b=Tcxjqq0UU5PHyWd8EZIuCgZlagWVZloGOwSYIS/66vb9x/LuXf+sVxSn0lrF6lGexP
         FZ7WZID+XGRSUCKcZDSf0PtVK/wkTirLqoOJTxeYtGRfsaffF9VTjiyTbNWc4LbG2fcy
         LyOiSvQtmBA49Y0nVHkyOMS5BIdHzbVLgcf5HVYOuDHhIQHQ9eSTdPxU8UHi6SBNNorJ
         HLK0nJCXLOhn9hbBkA02QmxG9V3VbboEBVoQQtXdyqY0iTUjgS8CfptmqjH8qjPonf1T
         0A8LT5BXRWb/p618g/dk6Anu1HonSYbszNTLOeatJd+2fAjTpGr3Yn4TGXgyunel0mX6
         6sMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=GGEoK/+QIc+qTv25wns84dfmjQtAMU4zYUFc0evEeBY=;
        fh=uVutygXwdfk1JYbIKokRyycrHjkg04KZN3hWLUSa9sM=;
        b=Y0rD/a9lG/jVqPGVdtX4WU2rqEPXpLVsF5g7HS7GnAL4kbbiEU1DqIBYbdYbZoU+Cx
         ydBmbhuwsxED2HrjhdeZOtVfPGQI9mfJ1DVYUFoKiyq3HUSOWcjtp3HlsPkAF/Spy8ru
         8bhr4096q+raJOvdBPVgo58X65jaDNnVhKYY409pX3TQ5UndDxEjNqfiVU+RSSfFj3y8
         NIKExhSuQtBfmzqdtNYmJHYNMUpWK93MjcadhALPUnD3EAsGJZv2+ZIEnnyNZu8/Kqbn
         Ht+VFjsUb5cz8ZchwLFBRtpoylKHbipfM7z2OgAzo7IfrZGQQjKT+YYfD01npytvzqpi
         98hA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q6208Fxy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-87e2a3bf52csi2795427241.86.2025.06.02.08.32.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Jun 2025 08:32:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q6208Fxy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uM78k-0000Su-Ki; Mon, 02 Jun 2025 11:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uM78j-0000Si-FC
 for qemu-arm@nongnu.org; Mon, 02 Jun 2025 11:31:53 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uM78h-0001XK-UQ
 for qemu-arm@nongnu.org; Mon, 02 Jun 2025 11:31:53 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-7300069c447so3034752a34.2
 for <qemu-arm@nongnu.org>; Mon, 02 Jun 2025 08:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748878310; x=1749483110; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GGEoK/+QIc+qTv25wns84dfmjQtAMU4zYUFc0evEeBY=;
 b=q6208Fxy027GWpisv3Ujd/9uvMjUQOLjDjMIU4nmG9AzKOho+2gVCb6Ns+4A482f4M
 4uGgPaXlP1NduB93SLjPfbg99B98z8/ohsc74XHMMm7b9YKuuaJX3RuGkLnSS49dnBYi
 tXYmHbioVTbQCdcvBzZ4J4jeYtdMQKXnrOB8r3d3Y/HZZ2IneJYSZAJZV9VrCnDsMcMl
 qutWLa8u0+OYapI1oxiQGVRXWBO2M6XyiaNv4wZVTeeka4Z1xMPr8jDZwngruOiqhcGo
 8YI+X61zqbdXgbJseJxSD4Kf/YMh1O8m6AfDi2SbpvS/+DDlRzfETyKCyO4Vfmf6gGNC
 UOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748878310; x=1749483110;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GGEoK/+QIc+qTv25wns84dfmjQtAMU4zYUFc0evEeBY=;
 b=aEURusJQVmwcvz4rLgucBf9U16EIa6kaP6BrmGJwHlYbY7aJ7RJ3FQIUzCb/kcZiGr
 FL7QX9zlMlIzVDeAQwtt1TKwXHM3c0i5FK8sv52pyEtieS9hrYkS5OHD7F8kELVI5YUw
 uZu20yFNATeMHcd3nPfcKHVUs1sVkwaNMcFSNbTFcqSmQFSvIMjTrNq0GfUxEFJAwLZc
 0ZVW9mmgmUpVWoBceea5BVgwQw8GJWmKeKXdkWa0WhzpkSYge0Mz4ZMM9N1BvYoJ0xcj
 Dz7L5xwa0XQ4okFLntNBpW1iQdnrmNLquFvDklK+K3PdekTd4/cVrmbi26fUF089BgYs
 0P+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc20gi20yVnCU48Z/mBDy0yMbAJ/L138GlsKsg+Ln3Sov0ZBU/wzB3iuv+BylEjOsMq2AuFU0OFg==@nongnu.org
X-Gm-Message-State: AOJu0YwrEbUD3QWdWIZu64lA2wcXIxqH0F84pC2kxSFC4PyHSbYpP7On
 T4mBf65uzqXczr9V8bCAWWhZySDGPvT3VJodQqtJesfmw4mSTXnpLRWZ1asY8j879BPiUebNhbs
 JXUEmprZkezlhbdetL+/z38oHUvC4YrVRQ9UWkYuzmhAt45wMs+y3
X-Gm-Gg: ASbGncsjPwyTy8vmSF0HEjkiPUBhaLMaH0tB6R0on5SeS6Drxvu4b8emOFivpaUPZbX
 vGgp84jtJrN4b5ajqf8TH4Pyb9Xk5h+LxrUPUZKpUgqOZGUP1H85VL6AJovfnsUdyH2ood9pLI8
 8Z7NKTBz2Fs1QQ//WjvguXQ8iNMBNzeCRFGA==
X-Received: by 2002:a05:690c:6382:b0:70c:c013:f26 with SMTP id
 00721157ae682-71097e62258mr110272497b3.33.1748878299704; Mon, 02 Jun 2025
 08:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <7aae8238-f7f4-4f3a-9a7e-e9afc99d1d0c@redhat.com>
 <1301bf7e-0e52-43c0-9910-55ea34647a34@roeck-us.net>
In-Reply-To: <1301bf7e-0e52-43c0-9910-55ea34647a34@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Jun 2025 16:31:27 +0100
X-Gm-Features: AX0GCFsaNcY7-pGXClrTdQHe0n1lU-lWjnYgeC8uCJzVPJcDZO5vXsu6B4FR8O8
Message-ID: <CAFEAcA_0Hu8+G50sy0FJ2rX-=cNymLddDdrS2nN5ZY-doKiT8w@mail.gmail.com>
Subject: Re: Is anybody still using the "highbank" or "midway" QEMU machines?
To: Guenter Roeck <linux@roeck-us.net>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x32d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DMvFE3l9lo9q

On Mon, 2 Jun 2025 at 15:24, Guenter Roeck <linux@roeck-us.net> wrote:
> On 5/30/25 07:23, Thomas Huth wrote:
> > I was trying to create a functional test for the "highbank" and
> > "midway" arm machines of QEMU, and only succeeded after lots of
> > trial and error to boot something on the "highbank" machine.
> > Peter mentioned on IRC that he also does not test these machines
> > by default, so we started wondering whether anybody is still
> > using these machines? If not, we should maybe start the
> > deprecation process for those instead?

> I don't try to boot midway anymore. Commit log shows:
>
>      midway only works with an antique version of qemu. Stop testing it.
>
> That was back in 2021. The log shows that it needs qemu v3.0.

Might have been fixed by QEMU commit 61b82973e in 2022, which says
# This change fixes in passing booting on the 'midway' board model,
# which has been completely broken since we added support for Hyp
# mode to the Cortex-A15 CPU

> I only test highbank manually (not in automated tests). I have this in my code:
>
>      # highbank boots with updated (local version of) qemu,
>      # but generates warnings to the console due to ignored SMC calls.
>
> I have not run the manual test for ages, so I have no idea if it still works.
> It also looks like I removed the local changes. Those were needed to enable basic
> SMC support for highbank; maybe similar code is now upstream.

> Ok for me to remove both. Not worth the trouble.

Cool. I don't think these machine types provide anything to
users that is particularly interesting (if you just want
"boot an A15 or A9 Linux" then the virt board will do fine,
and the original "test system software for this hardware"
use case is long dead). So I'm in favour of deprecating
these (and eventually dropping them).

There's not actually a lot of highbank/midway specific code
here (no complex SoC modelling, lots of stock Arm peripheral
devices, so just 400 lines in hw/arm/highbank.c, plus another
450 in hw/net/xgmac.c for the ethernet controller), but
if nobody's using it then there's no point keeping it around.

thanks
-- PMM

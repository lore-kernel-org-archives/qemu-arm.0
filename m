Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1223131lfb;
        Fri, 13 Nov 2020 02:12:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyz8Z9sgtFIh0jLnT/x+NZpZDnaAvb1lXUBfpzSlXxEeMocib9IVJP52Hb/KKK4xCXqhNMG
X-Received: by 2002:a25:d049:: with SMTP id h70mr1687086ybg.190.1605262322394;
        Fri, 13 Nov 2020 02:12:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605262322; cv=none;
        d=google.com; s=arc-20160816;
        b=YJqfcZRWIjG64rG5PlXgtY40x1ZFK8QfR6Qu4PS6R9wFXVEXEwFasyLC0ILUlkSlyP
         GKOO4lkxAv+PDqxq3Q8BPTZUBM/CWFe3oe4HPtxz8UU6Oi0kAT8vv1vW4E+S3N9sqZTm
         FMycgfG1Lr73GDUkInEQw6XXzsRmAAQn5/DgVbMysfg97wySpzWaxZx0Sh75dIfkzWd/
         Wlyg0XPuB4VYgBLiX3bhz5WHFUORUtWqR1zIhe0Pb5mQ9l0rLtCd3QbG4p3IOB39/k9g
         mS+/0/tA68VDLnqKLKtrfIRTXFut7uBvig7bct39orhAU8ryetE9KWhvT5OPVbQdBIbT
         VERg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D3718KrCdKwADXxpYT6OUExFH6MEmkX4SKc+dE5BmJE=;
        b=co9SgE7JVtJwF+bNZZi0owGuYNXVsr2qefK3eWFwcbw5RlV5GuKblyW0iQYr9XcNvU
         796CknjtWZq5ve0mA/oEGKJeOOH12jVLvgKdwGzhYR2dDy4av7xUnIaVqc/LS7FDI76r
         ZBhNLnKuKrDw+h0G2lPz8bd2UtVdyaT7jG5+kQcpIgWzaiakyPbPgVRJbYg6FwjO+YOT
         8K5DN63qj4OaVHlyMk5i3ROwfwQfYF4IYSNaJZaiUWivnPztCOCDywj8yrQ4tTEFsMi+
         zo9jBOZ7BISBTOF6krV7lmq778JiGPKADhS9ueabL4RxIY/14hQS3fyCXpzrb9OQCen5
         mnfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sDcxpOjb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p80si3922501yba.166.2020.11.13.02.12.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Nov 2020 02:12:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sDcxpOjb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kdW3l-0004T3-P4
	for alex.bennee@linaro.org; Fri, 13 Nov 2020 05:12:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdW3X-0004Pr-7Q
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 05:11:47 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:44419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdW3U-0001y3-Fd
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 05:11:46 -0500
Received: by mail-ed1-x541.google.com with SMTP id l5so10026237edq.11
 for <qemu-arm@nongnu.org>; Fri, 13 Nov 2020 02:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D3718KrCdKwADXxpYT6OUExFH6MEmkX4SKc+dE5BmJE=;
 b=sDcxpOjbumuE1RE09iySGFYF/gXj26VPSVM3uvUnhdVoYrqFNMZcyWJyAmsdNKyjTm
 0B3Xb9uWZO2dcX6fSXbS/FBWOKJ1qJXuiUgc8/KVEEPfUKPgaVKv/T0FeQ18y93NMD08
 4wMMzXQQ6n7+QEFBfl/Re1logzu4KxHt8dTyjkVkKTORKcTS4EcxcYkcsvHEjA4yyfcb
 osSt3mqkIrfcz67iI0T64FJlDHK54LEH42LgoblLldT2ILM3i/1XEANaM2OWhDmiTP+k
 XeEkrxY27mGG8L/U6upp9fbcyPNmlTzkxDRm9yTBSgqlnZwRas1yeU/frkh9InZWqWEv
 6KhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D3718KrCdKwADXxpYT6OUExFH6MEmkX4SKc+dE5BmJE=;
 b=n/wEAm0DZP/ZfaGGkwdGQODvbcpLD7Nut7BlMbeHq4RvVULxYhbhW4anJgmsl/dTPa
 Jqvd9fMQOBlZvCT7Dx6ng5dd7GKBHhExqxfsn1dMK2Sk7jnDBmmHXJ1vBrQC2YWvhzJy
 IKV6xRSFhmuL9Y50H+a9DWuyJV0lL/lc3zRTCHGF2ekyPWXo/4A8WhWIgHpFPWTOzo9J
 MqIF6DbewUhCSVkjmxtCRguTu3f0Fyq+sXwaUkoz4RB4vjPHoHX3TktDgWuHPqcinmrf
 ijb/c1s1WK5iaknIpP9UU5Vs7g/vys02LZ8A5pVy25lI+RrFFqJGO3ALxB1xcMmn4zNG
 DJSw==
X-Gm-Message-State: AOAM533j4HH2+po096TJTc8cgJFoXelY4igDf2AldD4e81lAmPebnWUw
 uu/zj1zkNw5IFROGETwlCu6OdYRaJKNyn3mBp+JkCw==
X-Received: by 2002:aa7:db8a:: with SMTP id u10mr1732469edt.204.1605262302079; 
 Fri, 13 Nov 2020 02:11:42 -0800 (PST)
MIME-Version: 1.0
References: <20201113095854.67668-1-changbin.du@gmail.com>
In-Reply-To: <20201113095854.67668-1-changbin.du@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Nov 2020 10:11:30 +0000
Message-ID: <CAFEAcA-3A2s3b5+kVPmDfPxG=gypOhD8agrqx0mUYt3gZKbMNg@mail.gmail.com>
Subject: Re: [PATCH] arm/monitor: Add support for 'info tlb' command
To: Changbin Du <changbin.du@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZAfTbm59mqth

On Fri, 13 Nov 2020 at 09:59, Changbin Du <changbin.du@gmail.com> wrote:
>
> This adds hmp 'info tlb' command support for the arm platform.
> The limitation is that this only implements a page walker for
> ARMv8-A AArch64 Long Descriptor format, 32bit addressing is
> not supported yet.

"info tlb" needs its own entirely independent implementation
of a page-table walk? I see this is how x86 has done it ,but
it seems like a recipe for the info command being perpetually
behind what we actually implement...

thanks
-- PMM

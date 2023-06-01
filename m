Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp578913ejb;
        Thu, 1 Jun 2023 09:39:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7fFQWmkBsGZ95Kb4/m/T4UVxwfkAIr3Ic7oes+I/9j6PJs1nXy9Hm41payWSr3F7vzLI5Z
X-Received: by 2002:ac8:5e11:0:b0:3f6:a7ad:9ee8 with SMTP id h17-20020ac85e11000000b003f6a7ad9ee8mr10585916qtx.19.1685637577836;
        Thu, 01 Jun 2023 09:39:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685637577; cv=none;
        d=google.com; s=arc-20160816;
        b=vOG6A1FmLUErxO31GabS5uvFZjfrjbSsSWyjQtaSTYmZE8UD2vI36j+ot0imtkVeVW
         36K3HVjKzI1ymzWXXf82un4/9nWgQi2b2FSysUsNig5CEWsVgA/Z1HlSa0UtVa1cXUiu
         Bl5zkJLsnxa1LEoOs3a/R8uvpuJdCB/OJaFCx9PAlqv9fsgOisCn9IC5WSakzC2EjANx
         xO9T0Ku2tKYVkA4/AEL7kdIE7CP93DqNwzmtwCjww5D/IxAj+63IQEA49bJB3SKDrddp
         qL84LSfOJto6rF2HO0bRfUfaTKRGTy8wb2lL0V7WtkhEGgQ3taZU8wImjdDfrH9S405J
         k/kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Uv9luzTU0p6UXz3uluPT2PgWXkOyXiF0blju11cjGkY=;
        b=0Vi8yFJGxF3bufy0iTpgtAANMz+ATDNg13wJvXUPc0wHIUBUs3PywImZubt2uRWCcl
         51zcY1xo0lA6mTVYA0JswDXU9GxSmhsMLIqR2tMW4rEQvYeE8CiMEDx5Su6DmWm4sLNS
         gbZ8JPufhA3q2IDBELJVH5JpfZxjjQaBIqU9Z6hFvv0hBC9RVR8rlIADfs2Ap6LdSZmn
         tSCwMW767603QEMazCskYJLJfu7sCNEDBrjnQvnaQHHPgUCJ2gpKWb4uJVNX+yaL4FwP
         5/+KBCa0OTmzw8nMnRMH2cfr57xPOQAiqHQc7vlWloiIphXzFr2Cnu+kZkcKXIczEq3a
         7XRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kWNPuYVa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15-20020ac85f4f000000b003f547c90e04si9900308qta.63.2023.06.01.09.39.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 09:39:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kWNPuYVa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4lKb-00019D-AW; Thu, 01 Jun 2023 12:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q4lKZ-00018p-Ny
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 12:39:19 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q4lKY-0008Sf-2E
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 12:39:19 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5147a478c38so1659542a12.0
 for <qemu-arm@nongnu.org>; Thu, 01 Jun 2023 09:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685637556; x=1688229556;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Uv9luzTU0p6UXz3uluPT2PgWXkOyXiF0blju11cjGkY=;
 b=kWNPuYVap0se/5owakJf/E91FL52n/3I/PJxytzY8mIM3o9Uv6/ExcWjqwi27exUjc
 dX17zVbVSnwZ3ZBp863/TML+jgc89Q5Eh0MIgKV/MohqH5tBWN4Tfk34bPKOhSBN+Dmy
 28AlWkLQsbm7wyYIZs7c+smd/MraNrj0FtbmmtiS0dbVdZD/M0emwM1Ju/h3VG4rNNTA
 +W6/vPYZCLmnHk52zkBfwfWIcxZshsnvffqdd98D3XD86nVbcT35RUeOd2CD0LfRdZhF
 cjUxgT4KYAcX5KandxQDKem5vsauWsWmpo1bt0X+u4Wob/7eENEyUH9soNuTsFiCpD5t
 iWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685637556; x=1688229556;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uv9luzTU0p6UXz3uluPT2PgWXkOyXiF0blju11cjGkY=;
 b=lTMwKoaLcK1DsZNFgJwe/ue6OqMQgQgPGj5J71nMnelL8JwL80zcI/1R0HepXiDpZz
 jUYtbHRxBCQMq4Evizi/Z0eve135esOYuQv9D/UOdoYngbRCMf+TSwIaCBtTdP7D9z2C
 B6W2QL4yXf5AfylF62O1kHC5PsE+SrdNQs0XmqXd+/9tIiwk2r+1poF90vXW5JGNcH/I
 r3Z1RztSggkylyioqkhMVuXKUEHN5uUMCdppEdtjxFUrTQT93v73OiXZpHAVrWVkdDUW
 G8nfQIH3bxtnAu+G4GlGw2gsGya6jMR146292UTWKW86xzakuHoGnb4w2CYLP7otNo8p
 gx3w==
X-Gm-Message-State: AC+VfDxsfvbPfQVAWVx8o2q6fLbHpqHoxgHyHIv31/QlWH5GglILgjW1
 4EeabF614t9xQQbM8UfbEpmyy2ulWErQX4TcLez0pfWAvNa2vfyQ
X-Received: by 2002:aa7:cf90:0:b0:50b:d553:3822 with SMTP id
 z16-20020aa7cf90000000b0050bd5533822mr332048edx.7.1685637556064; Thu, 01 Jun
 2023 09:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230531070229.334124-1-wangyuquan1236@phytium.com.cn>
 <20230531070229.334124-2-wangyuquan1236@phytium.com.cn>
 <lfcmvvqjp64wngrdk33bvkb3k7op53l24lcoslah2evsyh3esc@at7jnsnrto7h>
 <CAFEAcA8h9-YWUYsvuERttmsEK3xi+K+xasFdoWmnFm26S6npNw@mail.gmail.com>
 <b663fb55-dc8e-9fd8-9d82-7e693c3c4ad3@quicinc.com>
 <CAFEAcA_9Prr1xV2s1q2+GpWEnrsEEFT57bbLDnop5Hw3MaxM0A@mail.gmail.com>
 <da42c1fc-4adc-5eaa-2d72-6747b74f8ae8@linaro.org>
In-Reply-To: <da42c1fc-4adc-5eaa-2d72-6747b74f8ae8@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Jun 2023 17:39:04 +0100
Message-ID: <CAFEAcA9pUGUa4ev_y3U1z1BdU+AaGGKtRMcQjC5prvWvT9AWEg@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Leif Lindholm <quic_llindhol@quicinc.com>,
 Graeme Gregory <graeme@xora.org.uk>, 
 wangyuquan1236@phytium.com.cn, chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 44I/AjVqntwn

On Thu, 1 Jun 2023 at 16:30, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> W dniu 1.06.2023 o 17:01, Peter Maydell pisze:
> > On Wed, 31 May 2023 at 17:37, Leif Lindholm <quic_llindhol@quicinc.com> wrote:
>
> >> Ah, thanks! That explains why we did the thing that made no sense :)
> >>
> >> To skip the migration hazard, my prefernece is we just leave the EHCI
> >> device in for now, and add a separate XHCI on PCIe. We can drop the
> >> EHCI device at some point in the future.
> >
> > Why PCIe for the XHCI and not sysbus? At the time the board
> > was originally added the argument was in favour of using
> > a sysbus USB controller (you can see Ard making that point
> > in the linked archive thread).
>
> So something like below? I only tested does system boot into Debian.
> To make it work also changes to EDK2 would be needed to list XHCI
> controller in DSDT.

Yes, and you also want to drop the useless EHCI controller,
and (as you note) both these things mean firmware changes
so presumably that's a version-bump event?

-- PMM

Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp455434ejf;
        Fri, 23 Feb 2024 01:45:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWeGy9CfBAscxHI3juXjKNeKI4ayeIWV8VyS2k1j+EkjDlTWOmjWDPxFLyp7giPOU/OOjxY+sQQA3aRIsagRILDl3tcbsoh
X-Google-Smtp-Source: AGHT+IFxaIkZSKmLPFCGwzDYuLc2GMf8m0d5a5Yvx7aSbaQ3WsEQG+y/E8ahqSym+wd1zWbi+Ahf
X-Received: by 2002:ac8:5dcf:0:b0:42e:36b1:c65e with SMTP id e15-20020ac85dcf000000b0042e36b1c65emr1389277qtx.66.1708681499956;
        Fri, 23 Feb 2024 01:44:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708681499; cv=none;
        d=google.com; s=arc-20160816;
        b=FqqvpgD1YmaRW/2NlvyMKBMqVLmNQXqu4tInkpUfiHa+fUP827ycpuclLW3OTDSjwv
         q/5xGeVvBcPWtxU0UF1eb2esqXX7Q7PCfq8qIpqkV4R5LhN42vj8o1ODf054dqYujRLZ
         xPRzDc1LAv/BiYW9D+eVF3hfdDSMYw7Eq3z5gCPhCe4m1Z44iqril8eK1TApAqL/EfAu
         Y31EeXVJyRDmqVIV+wrnUUJsM/2HTZn5AmdufoZnW6bbk6/VHus+qWPJY76KkhvyVeJ1
         0hhomwlQSLqYZUhXUFcJnk0LBieJD2s+oLUpbnefOkhm3BAtieyxW8Di2BXBtSmxBkXD
         Ypkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=6XGxrLa5sW5SMtNskCL4fFQeVIwLt2ZkORTFwK4N4I8=;
        fh=l8NGOaEXAwZ5Ida10kRHfW1y1GTfOdJSN3+Dot+4IBA=;
        b=jgXVUFM0E2EOmCDDnTLOBSe9M6pzFiXCP5UiMMlceeSSCX23eG3lnVcskYvQBKltxh
         tmPs7SVsXU0FHzHODgrWufovpmzU/2jPetJczoBoqvCU1lng003R4XWYXIsHchBnP9T7
         8iKOSa2T8RGGEvcYFCe4kHq9XqTrzrtuH5GymscAqA38G4yS66ubYKjHP0xVys+WmtRE
         gemJjoVGFb9NlSSFm2bd0VWrD07dGrToznrGCXqtmAJ4pqemwV98RPcBsXxjyRpEkLH9
         O2HkEHKnuMhu4MJG7LoHGWPSxBSP3kBdgQrZr0IKlD3yHGhlH1cL2syDyXAznhowK0nF
         F2Gg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pTrdbpZe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15-20020ac85c8f000000b0042e694ce804si41739qta.629.2024.02.23.01.44.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 01:44:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pTrdbpZe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdS6L-0008Lz-86; Fri, 23 Feb 2024 04:44:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdS6J-0008Kn-Ag
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 04:44:15 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdS6E-0001Ue-R2
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 04:44:15 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-55f279dca99so792323a12.3
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 01:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708681449; x=1709286249; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6XGxrLa5sW5SMtNskCL4fFQeVIwLt2ZkORTFwK4N4I8=;
 b=pTrdbpZeFT8385AVqcx9azjBY5WzV6cnxpqgQoA/xXmRicB2eiGK8+z8BT+KEtEhuG
 c8Zf7YF+D7RKd/bzEh7RvM/nkxT6aSnEPlnhcd81dZAwFPOQRXPMiGnfBW76UARAs4I8
 DSsyOKA5PmGB7jsO2pjncw1rOOupocJsC0+L075See9cU0hSRdUi8aCjoq+dv7gI8z4/
 ePAqZITiGafCZx8ghzbEAUfl4V3v9iWlH34pwqwtNkd/zInp7UHa2soSDlDDTFBaclN7
 oolPchJ3UR3S+zontGS2wyAEqj6CbgBss6HXrMl9V+beCSNLaM41+fiO7QS/52fCeZQm
 n7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708681449; x=1709286249;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6XGxrLa5sW5SMtNskCL4fFQeVIwLt2ZkORTFwK4N4I8=;
 b=Xd5gklO5jazBa6bc8hHkbGZZgGnxB1nHKuoFZ2bDUK7fW4POqkX2dtrAlLWtXykm6j
 6eanEjw58LNbqfPzH9Fqfr353dmBFfCz+qDg6eZhJbOrpKuDjoUwQdyELzhSMejUdrer
 sHj8sAgI9P77xVEUunmCINHShUrU7u15pDhJjV+HHY77+f48FfG+IdNDprBf/y6aFag5
 OInHoBbmyKK9TVXLzqBbe/aNBlFzi4f86ozlIt6+qLsuz2vWPnvE1qAAacVnF/u5rvac
 Ba34ZJEX31zAMjK4MHPtgVAj8cd7VIeqB+kR23sdVKH0lTteyGS0gS00MJ2qxdGtS32U
 qydg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH/sCI4n9q4/jn2Ao9/p1YkVXsCEs7uSZxXrbsChi0QozmZ1dJNTePZHuiyPj3vceF+6DR7XElZ93p0dyajWGQTOZs
X-Gm-Message-State: AOJu0YxbRKCNv6eK0VpMd/tnWHr++P+ReEMwUzGW8scFh2paK/NSDKtK
 NWhicSR3yKpU2FTrJIOdjmBwQmwDovosGjNySbDbyz28lIZ54aL0ruBy57UHftc/8of+SlLfsC6
 fpOpOiGCEStSWYYQ5osNbwbjzxNsktBojLEqKiw==
X-Received: by 2002:aa7:da57:0:b0:564:7962:4545 with SMTP id
 w23-20020aa7da57000000b0056479624545mr868392eds.15.1708681449020; Fri, 23 Feb
 2024 01:44:09 -0800 (PST)
MIME-Version: 1.0
References: <20240222125517.67131-1-philmd@linaro.org>
 <20240222125809.67291-1-philmd@linaro.org>
In-Reply-To: <20240222125809.67291-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2024 09:43:57 +0000
Message-ID: <CAFEAcA-+3-zt5SOTTrLnyWh8maDLE2QFR9S_eXOCQ071qyXZqg@mail.gmail.com>
Subject: Re: [PULL v2 00/32] Misc HW patches for 2024-02-22
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: WQvJynpAK+fM

On Thu, 22 Feb 2024 at 12:58, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> The following changes since commit 760b4dcdddba4a40b9fa0eb78fdfc7eda7cb83=
d0:
>
>   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into stagin=
g (2024-02-20 10:11:08 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/hw-misc-20240222
>
> for you to fetch changes up to 7164f7e4028ad3b01a5f98c27482587b401ad420:
>
>   hw/sparc/leon3: Fix wrong usage of DO_UPCAST macro (2024-02-22 12:47:40=
 +0100)
>
> Supersedes: <20240221211626.48190-1-philmd@linaro.org>
>
> Following checkpatch.pl error ignored:
>
>   ERROR: Macros with complex values should be enclosed in parenthesis
>   #62: FILE: include/hw/ide/ide-dev.h:31:
>   +#define DEFINE_IDE_DEV_PROPERTIES()                     \
>   +    DEFINE_BLOCK_PROPERTIES(IDEDrive, dev.conf),        \
>   +    DEFINE_BLOCK_ERROR_PROPERTIES(IDEDrive, dev.conf),  \
>   +    DEFINE_PROP_STRING("ver",  IDEDrive, dev.version),  \
>   +    DEFINE_PROP_UINT64("wwn",  IDEDrive, dev.wwn, 0),   \
>   +    DEFINE_PROP_STRING("serial",  IDEDrive, dev.serial),\
>   +    DEFINE_PROP_STRING("model", IDEDrive, dev.model)
>
> ----------------------------------------------------------------
> Misc HW patch queue
>
> - Remove sysbus_add_io (Phil)
> - Build PPC 4xx PCI host bridges once (Phil)
> - Display QOM path while debugging SMBus targets (Joe)
> - Simplify x86 PC code (Bernhard)
> - Remove qemu_[un]register_reset() calls in x86 PC CMOS (Peter)
> - Fix wiring of ICH9 LPC interrupts (Bernhard)
> - Split core IDE as device / bus / dma (Thomas)
> - Prefer QDev API over QOM for devices (Phil)
> - Fix invalid use of DO_UPCAST() in Leon3 (Thomas)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.0
for any user-visible changes.

-- PMM

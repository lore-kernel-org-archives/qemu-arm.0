Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4636440lff;
        Mon, 16 Dec 2019 06:45:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqwO6LkgXJq8sK5+1xRVcan3pD0/2skfSpEJMbp9hAWL9qS1fVph3AwP64SpcwTtTvwuaB58
X-Received: by 2002:a0c:8445:: with SMTP id l63mr27136575qva.161.1576507547717;
        Mon, 16 Dec 2019 06:45:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576507547; cv=none;
        d=google.com; s=arc-20160816;
        b=Voh+GXncQ1+n1cdYnxdKUrl8Km1yxkh3qSfJ/UZw5UDcne6/b2idYWYhZgYcSimlhK
         pV/qEesEG1F9FpjTnNVU5Tqf+cj+wppd2UIS9DgAUhwyMkbWj/f1lt/NIuNi6HMOyOWw
         PNX+yhu0wZp1LxvL1+sjn7dKJy0hFd6O0bRJOwrD6GyFFGqaoTuxJi7wm3YF2g19euY3
         b3hdosLNUy6ePsqY6vS/dFXLQK9STNyhsaxyhRe0tIJ1Lagy4qMoNANc93c9mHb3b28u
         P5u6uKo3D5WObgpdwo0S4KlK3UP0qo4uJL5i29uJwnhxpwj9P8oygXaWd7F1PPac9rzm
         8huw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=231fU3iMzQe2NqvaAMOSWvzJKwEVFS75zG4TLEgLhp0=;
        b=ZaATJZThQSHRCJ+Oi1XpQM7JHuFTiTGapajZ5PUZRsZuS0zoyLcTCNYPONJbJwsiuo
         JFnp/4daWOmEnDgtMiXk4QlR//pkEHLrYL52isjGqFSpjYFuK3gI5u8TMXnEa0i6xIYk
         bGoyM1OBmFYOJa5y8A1SBBbcOKvZqETgOBt/HL98EjI72PrpbeyNEXjvCRnYnnrmHNsl
         y64Tl0jl5AQckkZyJyhNH4216RjMQcNvizJEAPYfe7P0lqC6kRxB/JEib4lUSwsWPcRU
         R/4Wu90tgk+3p0M0AN4eB+A076lkVwCqoy6cHBFCfKQSpLUK1iwoBQIBIQk/8LDlbD+M
         VkCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oryjdQVS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j20si7211824qtk.275.2019.12.16.06.45.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2019 06:45:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oryjdQVS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1igrd4-000591-Nk
	for alex.bennee@linaro.org; Mon, 16 Dec 2019 09:45:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43169)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1igrco-00057W-0k
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 09:45:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1igrcm-0007iR-IM
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 09:45:29 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:32779)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1igrcm-0007i2-1g
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 09:45:28 -0500
Received: by mail-oi1-x244.google.com with SMTP id v140so3494952oie.0
 for <qemu-arm@nongnu.org>; Mon, 16 Dec 2019 06:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=231fU3iMzQe2NqvaAMOSWvzJKwEVFS75zG4TLEgLhp0=;
 b=oryjdQVSYx4Y3wBBP/su6/e1JjiDmoC24RrLSMLdi7WVJdPVARG+pgV0QfG2aZ27GK
 AKIYKLUfNgIh8h35PGLQpVk8tOSKk/oKjh5UKYGCtLIVnbxGH2IqldSIMLNebs/y0C8L
 zls2jmSXC49ryEubAKNJcut0/ioshx8Dl+HAK9oeyeZdPeSOunirhSfClfe7BZTgy6Qm
 axi5I14Yln7rrye1+ZJs6vUQexW/uIfhkm6QRMoaDqOuTIG+bl5bi7rGmhYZvmrw88wE
 knCI9xp0R1aOsXOGYhG4XBndL/tPqZ4vwImpEUxX/YWljFXtpzx/4IAZnDIjJE0GqNqr
 18Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=231fU3iMzQe2NqvaAMOSWvzJKwEVFS75zG4TLEgLhp0=;
 b=b4djeyMkhA9oc7J3GdBU7MEkSJvB7eaxW/fwMBz3WJVUugxt3GAvVIdmtyL9YCSz0p
 Hk7ehptnIUARH0HSgVHAKo/QJoswmTfvDKHHD8FcAGJoEel33uME4bmyqCc9s4N3sBP3
 ZzDufUfi12ha7H3H14r1hSW73o4qR4V+EW62Mk+R61pgq/k78CQCHFMhRIHDkbIgKHgw
 ZrXIP0l5ERXDq7SSoMljioRPZtzaGI6wvko6/0AcYNeXuUJ8WvzJeW9nct8YW+32fq2z
 PFR3bRv3k5v/J51oahjc5rnedGJau/95zUAjH+Gmx/OUzbiRUIrEyZkMCPlIqb3qIJqk
 3KFg==
X-Gm-Message-State: APjAAAVD1ZIeEP9eT1gQHdYZNP1X+U4a7pYnRO8HvEphMI3KDMBEsd0+
 2ir6wlIl59OsKwtLjkf68NzXmtTiBMBzD/ECPk5PdQ==
X-Received: by 2002:aca:3182:: with SMTP id x124mr9925501oix.170.1576507527017; 
 Mon, 16 Dec 2019 06:45:27 -0800 (PST)
MIME-Version: 1.0
References: <1576076260-18659-1-git-send-email-sveith@amazon.de>
In-Reply-To: <1576076260-18659-1-git-send-email-sveith@amazon.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Dec 2019 14:45:16 +0000
Message-ID: <CAFEAcA-Zz+Ape9z39s8uHEGUN3nOH3-o9t=EEJsm9M+oeDuebQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] hw/arm/smmuv3: Correct stream ID and event address
 handling
To: Simon Veith <sveith@amazon.de>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CbaUJnMVxXXV

On Wed, 11 Dec 2019 at 14:58, Simon Veith <sveith@amazon.de> wrote:
>
> While working on the Linux SMMUv3 driver, I noticed a few cases where the QEMU
> SMMUv3 behavior relating to stream tables was inconsistent with our hardware.
>
> Also, when debugging those differences, I found that the errors reported through
> the QEMU SMMUv3 event queue contained the address fields in an incorrect
> position.
>
> These patches correct the QEMU SMMUv3 behavior to match the specification (and
> the behavior that I observed in our hardware). Linux guests normally will not
> notice these issues, but other SMMUv3 driver implementations might.
>
> Simon Veith (6):
>   hw/arm/smmuv3: Apply address mask to linear strtab base address
>   hw/arm/smmuv3: Correct SMMU_BASE_ADDR_MASK value
>   hw/arm/smmuv3: Check stream IDs against actual table LOG2SIZE
>   hw/arm/smmuv3: Align stream table base address to table size
>   hw/arm/smmuv3: Use correct bit positions in EVT_SET_ADDR2 macro
>   hw/arm/smmuv3: Report F_STE_FETCH fault address in correct word
>     position

Something funny seems to have happened when this series got
sent out: patches 1,2,3 are correctly followups to the cover
letter, but 4,5,6 are followups to patch 3.
This has confused patchew, which thinks the series is incomplete:

https://patchew.org/QEMU/1576076260-18659-1-git-send-email-sveith@amazon.de/1576076860-24820-1-git-send-email-sveith@amazon.de/

thanks
-- PMM

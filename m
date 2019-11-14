Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp5488318wrr;
        Thu, 14 Nov 2019 05:42:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqzgEVaJGNQ7qOsTO9D1UkcmR1p3M6TzD2yweJQTteEEmfXOPlE18oP5fJTFi/1LtSZWkTg5
X-Received: by 2002:a17:907:20b8:: with SMTP id pw24mr8242338ejb.28.1573738956494;
        Thu, 14 Nov 2019 05:42:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573738956; cv=none;
        d=google.com; s=arc-20160816;
        b=hWGaIeWDVyEH+AmLMug4WSSiHn6bZspRZY9C+JsIc8eI4LnCJIAANWIqwk8xxMftOJ
         arh0nnGLXQQ0BsZ3JSVs3/63oN3JB3Z0zJ8fddSxnGmB70g/GvEcyPD6aCV9i6vOg78F
         ERraB2RJFlZ6bMM6+gdVNespZbL4f5gZxAmSjYbcwFGr62nAyMMh5SF6K+TUphRraz0g
         GUoQDq2l/Qfx1Rx0xoUDTcfMm/aZWhQ3bfWNzJxOkMyjqgC7pyOoxs/SqsR+ANnQzVjm
         a3CI7NjKkgPK2SRrT7R5eJF4UNbUof2SbThFIIp5MF9VuXNfxj5nyVNTokPKJyzzTC7N
         0dOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4GAnBww2X6cSXG0HbjYAqPKGo6hRQcAfSHD72VPTYQ4=;
        b=opg492z8E6HkeljvnMjdbVxe/qGrZL2WJwHRYadwO9Y/kGGgOtICbsNhJTJccdIWQM
         i+GDW4ycmaC0PKjFiB7u2Ghr33rOz3JHMmwMbbWSX3xXn7ylA5IAAkecpLKSzlYHguCy
         2m0YSGVRJkv6tnGeXrwUFpeGSsZfDpeKlAR1Iiwa1h2TdLDCOgtmwS3rldKtTmHbcFHz
         ziKIRUefFXJoXbFhMIlKoTe/hVWfctEaDILeHCJr1hkF0eNsFKRm5uBEE++aM2sEPdJx
         mlnAKV+Yso5zp1nxHslAowkahy4CJlmJBg0QdYJFvSkZx3SrGvGWa1QjoXvnLURLjlDE
         KR2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KYp4YTq4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j21si3416475ejd.265.2019.11.14.05.42.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2019 05:42:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KYp4YTq4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iVFON-0004u6-7S
	for alex.bennee@linaro.org; Thu, 14 Nov 2019 08:42:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36092)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iVFOC-0004tg-GC
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 08:42:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iVFOB-0002XR-6E
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 08:42:24 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:42526)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iVFOA-0002Wl-QG
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 08:42:23 -0500
Received: by mail-ot1-x342.google.com with SMTP id b16so4843310otk.9
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2019 05:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4GAnBww2X6cSXG0HbjYAqPKGo6hRQcAfSHD72VPTYQ4=;
 b=KYp4YTq4x3brN9zCcjIeUbtg9BhpH104DSnRlYMeVabuwbXp8YBG0tSZ48kqVAI9aq
 sRQAfV70uDk/Ucumc3CbwWooC6FZqE1KeIotRQ+K6x5ejgfUBoP6Vj2bgqdhWJTGWbJ4
 52B60jiYT/+Xh2bvCDDFLOyvdRbLVA2hCGtyltUOmhgPTx59+BGN7SP5yqNv2o13vkMv
 Y519gQts8SZBZzfAVOxAmrb0H88F/rAagE7xk7ciy1MTv9sSNgCM14gi2hYi5uFIu9vK
 WpXuTAM4LeoTw96R2JqPdmp+slxeZvltMxblIxjtYCTV69wsHuMj4H8FKMNf6/oKYieL
 cuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4GAnBww2X6cSXG0HbjYAqPKGo6hRQcAfSHD72VPTYQ4=;
 b=WAabPE4uVRVQ+YY5/hGlBTH1M0Rzj1Z7GwCEUjbzsMSzwnp+D82p0C4KJDhoZ569xd
 HXYG43JNrmIfw2S66c6AaxUPOYi61U9HhoEkRK3OErqNN28caPs6Jp5Eow9UD4+CdtUv
 +DYym/A5vo/C1yTl+7ddr/CJqDLuw6t0EvtOATO9TZyAP2jyZ4aVrmN9paOVpuB4zJFy
 uoQz/2OhBEcU8XQy8gZ7vj5q2dtVUE7CJyXMLSyTv3og6JuMi00XQSqgPlUR7yr9IZqA
 DhrKc2Bn7w2YTdefA25GRPfUmKMQILZRENx3go5xdqNB81AQ4C3rqQt9rK8yypKe+hO5
 0uQA==
X-Gm-Message-State: APjAAAUBg0AdEF7ePTfMvDzIUFBLSUzbdhK6oIurKyB9FW8HFilr/Vo+
 XAV4u4qUC/T9vilvRhLUuCfc+UVl/CUi0Kts/VD87A==
X-Received: by 2002:a9d:68cc:: with SMTP id i12mr6755559oto.97.1573738941582; 
 Thu, 14 Nov 2019 05:42:21 -0800 (PST)
MIME-Version: 1.0
References: <20191104115228.30745-1-graf@amazon.com>
 <CAFEAcA8zkR_MZ-28Nc=x4j05U9MsFYfzQtkHxTf65ZwacK020w@mail.gmail.com>
 <246a7cd4-7c39-c92e-05c3-1045bca2c114@amazon.com>
 <CAFEAcA_kwscZRqK5wTRu5WLkixGYbdV0c7mZMV6n+40DOS0-Mg@mail.gmail.com>
In-Reply-To: <CAFEAcA_kwscZRqK5wTRu5WLkixGYbdV0c7mZMV6n+40DOS0-Mg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Nov 2019 13:42:10 +0000
Message-ID: <CAFEAcA8HwRNd+Mg91RJ1DpiyoNJKBWHjFT_Te16xTV5P7wV_ug@mail.gmail.com>
Subject: Re: [PATCH] pl031: Expose RTCICR as proper WC register
To: Alexander Graf <graf@amazon.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Hendrik Borghorst <hborghor@amazon.de>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9lsP+bYBfSb3

On Tue, 12 Nov 2019 at 11:57, Peter Maydell <peter.maydell@linaro.org> wrote:
> On Tue, 12 Nov 2019 at 07:28, Alexander Graf <graf@amazon.com> wrote:
> > I still think that being consistent with the actual PL031 spec is
> > preferable though. If any real world guest breaks because of this, we
> > can still revert this patch and document the exact breakage in the
> > comment instead.
>
> Yeah, I agree; I'm essentially just gathering material
> for the commit message here. (The gold standard would be
> to go find some hardware with a real pl031 and prod it
> to confirm behaviour, but that's more effort than really
> seems justified to me.)

I propose to put this in for 4.2 with an updated commit message:

===begin===
    pl031: Expose RTCICR as proper WC register

    The current PL031 RTCICR register implementation always clears the
    IRQ pending status on a register write, regardless of the value the
    guest writes.

    To justify that behavior, it references the ARM926EJ-S Development
    Chip Reference Manual (DDI0287B) and indicates that said document
    states that any write clears the internal IRQ state.  It is indeed
    true that in section 11.1 this document says:

      "The interrupt is cleared by writing any data value to the
       interrupt clear register RTCICR".

    However, later in section 11.2.2 it contradicts itself by saying:

      "Writing 1 to bit 0 of RTCICR clears the RTCINTR flag."

    The latter statement matches the PL031 TRM (DDI0224C), which says:

      "Writing 1 to bit position 0 clears the corresponding interrupt.
       Writing 0 has no effect."

    Let's assume that the self-contradictory DDI0287B is in error, and
    follow the reference manual for the device itself, by making the
    register write-one-to-clear.
===endit===

Is that OK?

thanks
-- PMM

Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4837875lfm;
        Tue, 21 Apr 2020 01:51:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypK28ykcBAwejyfjxqx2vs4O65IQzDZrGXd+A6sGwoOsIs4hPfuPALcJ7a5DSsGm4crLXmtf
X-Received: by 2002:a37:a9c7:: with SMTP id s190mr19569109qke.75.1587459101025;
        Tue, 21 Apr 2020 01:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587459101; cv=none;
        d=google.com; s=arc-20160816;
        b=Snd2fz4KQSJgipjNaEDXEZxBlJO54x1QonSlBGTy1YPgyQ4R5h4JOOgsRDnv71bLvz
         wyA4PYXxjUQ1k2hHKp1UV8KmLH4XaZbPo3pa0n5tfUKHVDHEaf5SYPXYuMxS3vQTkgNh
         OKc3qLeoCmfLRVxkIaXtBRQefjFipzI5zmwan3InnMaN4wHKC5IAaMnYzo9zsz+92OOx
         t5Egkz026q5HHMgph+wpIRgLa+XhZPjfFSxl65ZkWKq+QVdI2B3k5yI+7iYQhyrDeAUJ
         mk51hHWJfogIuBPpskd3bvN70oxU8JZueNHmSO+HSmSxqG9DKls/PNUJ+XS6Nq6vyUAQ
         5aLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=tKlYXusGO8+AF+t4nyiCrjf3f18bDU+5mXqYykkV59A=;
        b=isdfY7XXP9NBkL+/qcakH7Bfq7DyaEDCkLEUC2w0J5nq0Ale+0gy/BuGaIK2Q+1bh1
         weGRbwIheAl0KGaygmFG94JrkpQDPsvgtWyBg0vXA33LiBvZR0E3+Q5msAHkV2pcLhRN
         A36NiDGqiaskCz/UCieOs8FBerkkHNCkbvf5ecqV/VZLXdf/deLHkqrfs0WncYyQ6NAT
         iBWZymJW12UXl84WpKn7J5WE0MrxiJUMPlQ2bpNfw1aK9kvFiwtK2wPvxRxR1LaYC9pP
         uBc8IKKjvRumEXDiwMQaYYA7tLydu7M/RUlvkhL3Fzz+T3qnGvtfFYyXuf5ocrRwWE1A
         LqgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B10pYOq3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r17si1053855qva.31.2020.04.21.01.51.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 01:51:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B10pYOq3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQod2-0004Dj-Gl
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 04:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55856)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQoa8-0000v5-He
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 04:48:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQoa6-0001YL-Ag
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 04:48:39 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:46301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jQoa5-0001TL-LH
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 04:48:37 -0400
Received: by mail-io1-xd41.google.com with SMTP id i3so14142981ioo.13
 for <qemu-devel@nongnu.org>; Tue, 21 Apr 2020 01:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tKlYXusGO8+AF+t4nyiCrjf3f18bDU+5mXqYykkV59A=;
 b=B10pYOq3OUMYwUl3gUq9LooijAfiYfXBFPwFZ8ze4C181muB65q/9gEn+/VoOhnsg2
 UuG5oXe3Tn5PvICedKLBkK+0nhe6d42VArmmwNSp+F3PmIvaAtTBqOx3wGxrXHzPxfYF
 3mWh4ioPx3+dpSRTWPUNut3H/sqvGX+EfOnD+ygNUgM3mnEIx6pKnV+XJf2bN1pKlJI/
 7WExXCa+J3/ygSNoMEsIcyC8uLukU8YjPRm0emax4ShLgJ3NyZM3PY/oBcjULpU3hxr1
 y1s1xs8kgf4NHsFlDpQD6BDq74cRor/N03JlVyt5ncV73WQ1BzZGCOlsP5yizs8VZ6Dd
 9ARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tKlYXusGO8+AF+t4nyiCrjf3f18bDU+5mXqYykkV59A=;
 b=Czs9bFAq9pZAniqWQ43kHu2wBMZCFm6Ynj5TWjoqErM0G8cRr3/sQMVF5xOKdIRvqo
 S5TrBZJfemYx6UlIs08egy8K+rsWnxuOXJquTfup+JKu+e4plh0YPCJuBVx95MvfFv0F
 GGAc+5nkVid8hccYA3FNs67SqkDLnSuLbDSCcuaUR7+d297udJMC8WoJ6Vu9u30Mj07E
 Zoi5r5NXvDF/kVgowq+hFguNNS1aGxg5toFDKU6MrOwdXEISOMepnnQALVhJ7FFuferJ
 7Sj08Exd+kJNFv18wvYpU8PCY6M4baTJaKgPaPA9JhMp7x6ih9htin6a9gZRgI86OL2Y
 p07g==
X-Gm-Message-State: AGi0PuZOZp14xlCc7ROvpi0PgNtipc4h9wrDng8+L0DV6RSsQy3F7GlY
 aCuwScwJEaQ+IJcPtxekjxYcGCaCBz2u5uEdo70vUg==
X-Received: by 2002:a5d:860b:: with SMTP id f11mr1110300iol.104.1587458916322; 
 Tue, 21 Apr 2020 01:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200420212206.12776-1-peter.maydell@linaro.org>
 <20200420212206.12776-2-peter.maydell@linaro.org>
 <66f1e3c3-13f3-cf66-68e8-281260e420e7@amsat.org>
In-Reply-To: <66f1e3c3-13f3-cf66-68e8-281260e420e7@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Apr 2020 09:48:23 +0100
Message-ID: <CAFEAcA8M5n-_V_Zz8KWo55s-_Ca61dh2dg0KXKqngtr+8SBStA@mail.gmail.com>
Subject: Re: [PATCH 1/4] linux-user/arm: BKPT should cause SIGTRAP,
 not be a syscall
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=peter.maydell@linaro.org; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::d41
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: omerg681@gmail.com, qemu-arm <qemu-arm@nongnu.org>,
 Riku Voipio <riku.voipio@iki.fi>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H3RuRSitF8Qu

On Tue, 21 Apr 2020 at 08:48, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> I couldn't find a git-diff option to display this change in an obvious wa=
y.

Yeah, as a human you can say "it would be easier to read
if the '} else {' line was not treated as unchanged", but the
automatic diff output isn't totally awful. Sometimes you
do just have to look at the resulting code...

thanks
-- PMM

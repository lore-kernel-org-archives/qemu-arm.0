Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1855379lfg;
        Tue, 25 Feb 2020 07:58:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqz8qU1cN0G3GlyZNSdMmrom+LwNT8RmXUBEifz0CFRWjA94QcYZUAF22snch6ZLzcKVF8P2
X-Received: by 2002:a37:4f51:: with SMTP id d78mr56714340qkb.28.1582646331583;
        Tue, 25 Feb 2020 07:58:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582646331; cv=none;
        d=google.com; s=arc-20160816;
        b=0n0S6FtRKs9cIUHyGUIm+9gs1/sDQs4gb9reMUsfAskvqowtJVqktJpZcGRtvgTff3
         OA28PUW/bYHZ3NOY2bKA6UAYG4KVxR392IZ2b5/VZ32hzwLFYlSxoz+rO3DnBUzMwhK5
         VVL7kJTIpDAsABIFinJZYFMh/waNTOTlQoDGcLGhTRBZ1kPsr/cXJdNVD4GZvVBd3bv9
         +H/7eIuaVbyMMcSho2P8yUXzMJa7j1IAxj+4Ez9DDqPsEfUeNaqoZwU+GTYPsjYECZ6N
         VKRMzcqUY1EVWLDUXe9+9V/ztmz2KajoAE3hxils1cj5VDCjFO1od1vPklRQHBO7urbN
         QD4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tNHwY1eHJJ3qs8vO8aynlhw0l903XZzzrhTFAJUhL7g=;
        b=Cc0sg4Xrn1NpgPav9WoTZMmnvmpPyA9i4oEoezBPncK1i7Ud/WaeNC41WKWHsh9NAC
         Gagqym1N9xCypnag9hN7mAIKs6GlIVXWVr7P0LCDk+JpEYNqO2FRRp/V5U8n8euRLf/u
         6ZbiLJ+cxK8166xGkDpujHTIsrgBWSN4F3+Mt+vUSQVKSggjQ8pG5FPhluYS5dBW8Zss
         mjfbHfM4cohJdra01WFwrXz8ODwBeX6eaH7FZOOCA7ujo64upo8O2OS+azfpyHLWXGJT
         pKD626367Yx6Cn2Q8nqB7IgPWKfS03SZc/SVaRQFC7lOTef2Jx7jDlJsCHsFPB1lyTlJ
         +E6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ZRb/Nusr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u28si7399127qth.303.2020.02.25.07.58.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 07:58:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ZRb/Nusr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6cbj-0002CQ-1K
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 10:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36725)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6cbZ-00029K-Fm
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 10:58:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6cbY-0000ml-DP
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 10:58:41 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:35931)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6cbY-0000l9-87
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 10:58:40 -0500
Received: by mail-ot1-x342.google.com with SMTP id j20so12536402otq.3
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2020 07:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tNHwY1eHJJ3qs8vO8aynlhw0l903XZzzrhTFAJUhL7g=;
 b=ZRb/Nusr0/qbO+5w4hg8CuAU6mWf1pOAdvXQUYT6knm6A3l5LlEo5GlZMCj+SLcJWJ
 vNCFERdTXHmHFbMPtsCyLQLqy2opJEXRVmzAL9VHgR29zBxvtgxteg+AYy2aB1PpgomP
 3j7lG4Sqey/AITcr1DK8wRNmG1QoI3mXUOznghIRxpVhPb6l7RyVjlUOqBI33y9mHnHp
 JIpB36zGLiEp5l99Rq+YXDNeMDRLvL7MLHaxya0LARhOxSLnsbui8RlfPqckJjjGbeRJ
 Bt00vaqCjkGUUTS/1Atgt42nY9ZEV8HGwEycT4lTHDj3f4v/0qC0xfOts809rarmn0oy
 Jllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tNHwY1eHJJ3qs8vO8aynlhw0l903XZzzrhTFAJUhL7g=;
 b=bcjV1UufjfWVSreY309XgwK9vKLq6qSaReWgaqOOiM5L3rhRhf6UR4kuJNZce0IW+S
 MhWw3IUi7GwQNdKLY/IkSr49n6R3AlkVhGn0Asw2RGUYv75elpyjFaYUpD6GXRsgntGO
 xIRkuPR4G2LfJ3Yvmn03r/o5vggZ6+H1pDfUkYOqpDgfIITncFAsSXEHyMN6T0uMLoqP
 /fLG+PDywprgho9zc3BSuuuFvb5LX1Ye3V6CyZaUR2ekSQn65BTVksohDuEnIy361NdP
 QsIomLdpzqx3aPTWAZ1klfp6wxUwC/y5mR+4WBmks7rw88clHbN96F2L8JsH4HP/W0RY
 h66A==
X-Gm-Message-State: APjAAAWsBsTZ+dilFs6VZEEQipTFx56bnQgDUjVTLkBP/uJSUmRRHxY9
 ELINPDOEq8oy9NJQs86x4wChZ6c/nKB4Kb2pWGNdtQ==
X-Received: by 2002:a9d:68d9:: with SMTP id i25mr33255846oto.135.1582646319169; 
 Tue, 25 Feb 2020 07:58:39 -0800 (PST)
MIME-Version: 1.0
References: <20200224222232.13807-1-richard.henderson@linaro.org>
 <20200224222232.13807-6-richard.henderson@linaro.org>
 <CAFEAcA9WZbZj_hPemTGr+Rkh--VmZt1eis189+ExuPVNipgo_A@mail.gmail.com>
 <49741058-7dbf-d20f-95ce-5bf9b5e5bdb2@linaro.org>
In-Reply-To: <49741058-7dbf-d20f-95ce-5bf9b5e5bdb2@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 15:58:28 +0000
Message-ID: <CAFEAcA9nZx0eCnQtjCdG2OZRK=pF-Afb9jtvGZ=dJTAbaVAL1Q@mail.gmail.com>
Subject: Re: [PATCH v2 05/17] target/arm: Improve ID_AA64PFR0 FP/SIMD
 validation
To: Richard Henderson <richard.henderson@linaro.org>
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FtFWkyjXRnUs

On Tue, 25 Feb 2020 at 15:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/25/20 5:24 AM, Peter Maydell wrote:
> > This check is supposed to be "did the user accidentally specify
> > some incompatible settings on their '-cpu,+this,-that' option?".
> > By making it check the actual ID register values, you're turning
> > it into also a check on "does the implementation specify sane
> > ID register values", which (a) is useful for TCG but ought to
> > be an assert and (b) we shouldn't be checking for KVM in case
> > the h/w is giving us dubious ID values.
>
> Hmm.  Because kvm64 unconditionally set VFP and NEON, you're right.  It was
> only kvm32 that was examining id registers.
>
> The only consequence of kvm giving us dubious id values that I can see is if
> ADVSIMD is on, but FP is off, we won't migrate the register set.
>
> Do you want me to add a tcg_enabled check, or shall we just drop the patch?
> The existing test is good enough for just checking the command-line.

If it isn't a requirement for the rest of the series, let's just
drop the patch.

thanks
-- PMM

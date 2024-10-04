Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp540429njb;
        Fri, 4 Oct 2024 08:59:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWxsy5HDZ5+pC1wkSmtZDd30pYlCLBiWEW9EOP4qa9TNxmZ8yCNNzsys9BrHI+ZP8SLJyUXz2B5DUKUWA==@linaro.org
X-Google-Smtp-Source: AGHT+IFefsS3BKJs1oICPfx4YZ7xjYCNi0tg7WCyVLZUhEM9E8N2T035rdAi/fdP6sGW51VMcDVi
X-Received: by 2002:a05:620a:4084:b0:7ac:a10e:4e5d with SMTP id af79cd13be357-7ae6f3ac91amr537461085a.0.1728057575204;
        Fri, 04 Oct 2024 08:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728057575; cv=none;
        d=google.com; s=arc-20240605;
        b=Ik7pGvCsUP1FJYCeGPOSEZ+kQn9zW6nIQcUVTKSIabV7UWratH5N7rRPPQeVIr7WJR
         uliuomIVxVT7rMaMbAzXuB6rYuRExJUPTy1pyVlNndeaLzDXNTUSgVow4ULgWAcWNraH
         +wR3gscRNkIc7Ywr6Z+8kYj2TPG18kDUk8gVnkYx+rNCoyakUjVrHhGTySvQHwTX/5TJ
         8E3xD3uoGHmfGamUGWDCpeFZBi06u+AgCxqqzepa9FErJ8Qn0c5fMPattFUiT3miJqFv
         kCNeAl9ZHsmELmcvWWq9PR0/mTq4qKYiUGkzf2fHnlHH8Z4xCWY+uzyUZ2BXjlqswlTk
         q3hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=HWGViDOQRtvE03XV98m1bwgXILGc5l07x+W+qORtMAQ=;
        fh=1IgQfatbeMS6oMM/jZof18N3iWfCskm7bwsgvB2/d5k=;
        b=kdECS9/BYWLvTUVgSlhvx5lEOFNfN4J/Na9MIqadq/sRAKrB4WSFM6MNyI6hylTqj4
         iG6M24p6bqZBR1fEYcMrXhZfltjJVMOPRDpFGnRDDKqWiCpHW6ssIWH5Wvy6fsfnsw41
         Oe8x601Fl6o+m455zhs2ypzI02nU9Tlf+/UMfVwnpToLTHps0zbVPYnQh10pbyzRM/Ai
         qxiRYUM9Yh5pWwdkQfmMUF/Q6RFWvhSfQd5I4AP5H/YPZk/18o2tAkK5fM53LenQbFZV
         pP/FcfTIEgDUPkL5jYzsV2QOuL6V80EsKkgSCUn/tlpqvLPDtxWf1BMm3ycjwdAzM08k
         +qeA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wwGeMp35;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae6b762333si351622885a.208.2024.10.04.08.59.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2024 08:59:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wwGeMp35;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swkh3-0007V0-P6; Fri, 04 Oct 2024 11:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swkh1-0007U5-SZ
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 11:58:11 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swkgz-0000tI-Mp
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 11:58:11 -0400
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2fad100dd9eso26530961fa.3
 for <qemu-arm@nongnu.org>; Fri, 04 Oct 2024 08:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728057488; x=1728662288; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HWGViDOQRtvE03XV98m1bwgXILGc5l07x+W+qORtMAQ=;
 b=wwGeMp35GCSyNvSZO5C8NdxB3Ig4zey1ki6jOWTfDkJNYXrQVHO1khqxcOYuTaCK5V
 0LSGLqQpi+USCw38tVTe2yfs/mADUPuvTkCJ9HTiN8kMCsT0FHrV1x1AckLOn73jF+Gx
 pknpAsQf5EA+50Pl9fg/8WBqbNFxs42Tf6VTFBHAImSgfinkWWhHLrDRxHBkwrozp4cm
 hw5gjaLuRVxkwj2JkJMYr4uEdvqNW3hmmPrmrp1AHqjKLSP0TWb4Ht2tIQejNy2Zk7fL
 ORkgWGCOFd+/B654aXJgzxuKZNjV9XxLmUkrSitUbsu4iiERkea4RXf9XtpdB00g355u
 qriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728057488; x=1728662288;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HWGViDOQRtvE03XV98m1bwgXILGc5l07x+W+qORtMAQ=;
 b=Ht6wKj8SuPmogrfmRuFQflS54HW/CLO7SpZfb5rEWXhEtcKANr7sz0Spp6X5tW+OEp
 Xn/acKsJAnA5+KDwjkukf8G3ynwjv3cZbIKVHENqW/9V1RTu1HXx9lxIrsDP9wHJdMWz
 r1k3vdYx7uSc/87wY1l9ASU3bCje0uaGgvyKuVZiSoc0KGPwWIRYQ7ekg+RrqFkcoKuA
 k57S3mzgpwaQ3C6oVP2Jvj6GvbBX/DRlijkG7bYzz0MMr9uZmnzttNRwQuFIyf7jFnou
 kOs0AIk51vaeNfdF1X2Q2Vmvcdgl8RxvKXanhsvVBNXH7Fw8mBkCI7iqRV95TXETc4er
 uT+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNN5KkMcmLe8ZfYiDO0nCHz2mCpfZEAZMpMg7UB6GTpwtWaC7kwbQS5S7VzY5duCybNkW5p8ZURQ==@nongnu.org
X-Gm-Message-State: AOJu0YzySR3bEcwdnJ1pD+CXfuyuhV9VyLKvy84hfwKGoeUa088U6zwj
 okgnIZEf1hETEXvdxS0Fe/PKOm0pWG0JYPUUqoDarfefOk4+amODaCmt86Hg2LK48tXElej6s4g
 1NQqFBLJxSUAVMP7Q4eSnr9Kj2tW7AtHK+p8J2A==
X-Received: by 2002:a2e:e1a:0:b0:2fa:c57a:3b1c with SMTP id
 38308e7fff4ca-2faf3c63ed4mr17625661fa.17.1728057487436; Fri, 04 Oct 2024
 08:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <89f184d6-5b61-4c77-9f3b-c0a8f6a75d60@pengutronix.de>
 <CAFEAcA_Yv2a=XCKw80y9iyBRoC27UL6Sfzgy4KwFDkC1gbzK7w@mail.gmail.com>
 <a4c06f55-28ec-4620-b594-b7ff0bb1e162@pengutronix.de>
 <CAFEAcA9F3AR-0OCKDy__eVBJRMi80G7bWNfANGZRR2W8iMhfJA@mail.gmail.com>
 <ZwAPWc-v9GhMbERF@linux.dev>
In-Reply-To: <ZwAPWc-v9GhMbERF@linux.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Oct 2024 16:57:56 +0100
Message-ID: <CAFEAcA9bnJR__3v2ixjjEyQD+Kwz4oR9+HO=w8u6JsVjgnXE2w@mail.gmail.com>
Subject: Re: [BUG] ARM64 KVM: Data abort executing post-indexed LDR on MMIO
 address
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, 
 kvm@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Enrico Joerns <ejo@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22a.google.com
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
X-TUID: 3GWXNehLkH7b

On Fri, 4 Oct 2024 at 16:53, Oliver Upton <oliver.upton@linux.dev> wrote:
>
> On Fri, Oct 04, 2024 at 01:10:48PM +0100, Peter Maydell wrote:
> > On Fri, 4 Oct 2024 at 12:51, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> > > > Strictly speaking this is a missing feature in KVM (in an
> > > > ideal world it would let you do MMIO with any instruction
> > > > that you could use on real hardware).
> > >
> > > I assume that's because KVM doesn't want to handle interruptions
> > > in the middle of such "composite" instructions?
> >
> > It's because with the ISV=1 information in the ESR_EL2,
> > KVM has everything it needs to emulate the load/store:
> > it has the affected register number, the data width, etc. When
> > ISV is 0, simulating the load/store would require KVM
> > to load the actual instruction word, decode it to figure
> > out what kind of load/store it was, and then emulate
> > its behaviour. The instruction decode would be complicated
> > and if done in the kernel would increase the attack surface
> > exposed to the guest.
>
> On top of that, the only way to 'safely' fetch the instruction would be
> to pause all vCPUs in the VM to prevent the guest from remapping the
> address space behind either KVM or the VMM's back.

Do we actually care about that, though? If the guest does
that isn't it equivalent to a hardware CPU happening to
fetch the insn just-after a remapping rather than just-before?
If you decode the insn and it's not a store you could just
restart the guest...

thanks
-- PMM

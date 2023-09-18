Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp2815680ejb;
        Mon, 18 Sep 2023 03:45:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFai4f36zzmTYF2+hIjgsoEUcE2l5rnVb/EfOGK6eE7WImmjH933nodl6RVHQlfRYblHjLB
X-Received: by 2002:a5b:648:0:b0:d47:8db3:8bcf with SMTP id o8-20020a5b0648000000b00d478db38bcfmr7612535ybq.49.1695033934846;
        Mon, 18 Sep 2023 03:45:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695033934; cv=none;
        d=google.com; s=arc-20160816;
        b=BsUTUTmbi/G3rxtHrUjxnE6XDGXGZshohGyedgEzC1StYXJwCwGMwNGQV8fbG/4Vyv
         6R01asB7ZixeS8/VzuA/e/+k6jif9SmkbeDKKkK5YHygpbOtLfNAWq6swVDj/F5RpL0D
         Ir3j4XT0q3w+gXVK9qQxXJA91/f2GrKchNc+QZnl2RcD0lUBKtk/8VSWL5g3mUNquYEf
         YZGbgX2dnzA6iNSaCIUGVY0WZMLayXv6TjZvOkvVs3EZU090Vtg46KZtZBArhDOBJPXA
         FDUVC31IR0iL+0GPuuCZ3bZqUIQTBtt5wj6xH2VFhDxXeNTfa26XtdeIfCP0EdDHCvpG
         9Tmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ewH2NLsTRFu015y52HgrX6Ba49oJNfW64QTSZ0Y+pxI=;
        fh=1+iHolRYECe2ybtGU55u4K8H4b0+ghpL8z/BMNYY7WM=;
        b=IdTQsOfpvUmB1BEFiRHn1fEza55yF4D6ftHfyNwwKwgSXoyej9oLAeNkYtQzAab47u
         O3vYTQSAGjejWv8SK8Cx+NyYOEsD36GI3O5i9vfVmHdJYFkbqF15whyyXmklG18j0fj+
         ryAa4X/6Cfy0hOoDbgwKGXJD+w/LJov4cCYoqoTyVN6OX4QmoUQvTmCmjky4QXa2Tpwz
         687lS53agn1Zse6gVOC0xhacy0xtO4YpLSdlPPtEGFtxS/X7Px5dKYz0m+UPpeBRNTkb
         KsBfV9Z9sp2Fi90+RIXAokpScK5IrrHMRScp8KMCO6h5MgPIPRyu4zZ2KJs08Ha8VRh5
         sDgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XkQ/i8ed";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 17-20020ac85751000000b00412184dcff5si5927703qtx.498.2023.09.18.03.45.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Sep 2023 03:45:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XkQ/i8ed";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qiBkh-00079o-Ha; Mon, 18 Sep 2023 06:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qiBkd-00077o-Q6
 for qemu-arm@nongnu.org; Mon, 18 Sep 2023 06:45:12 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qiBkQ-0006Gh-TW
 for qemu-arm@nongnu.org; Mon, 18 Sep 2023 06:45:10 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-522bd411679so5546060a12.0
 for <qemu-arm@nongnu.org>; Mon, 18 Sep 2023 03:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695033896; x=1695638696; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ewH2NLsTRFu015y52HgrX6Ba49oJNfW64QTSZ0Y+pxI=;
 b=XkQ/i8edc9rFWLNRvziIFog5/0GWn8D+BUNfQK4QPxsN5uAeLH9hgZv70r0wBJHrHk
 oOta4I7xs2AkmT60JieW/+Jv33DGIcm85PUuKOujuD1vsJooZHVRyQoDKGfyj4K6nEX8
 lEmP+60nBxzSEWHb626u1pDfESRPsTVznM6onodO31fWVcPWr3B39EDliqrVdvJXwQl3
 iPnRlndwMOPY/OmA4TJt4GpsXYjyTnApbqWnJmkPhBip5aCAFkjOLd6k302eiBBxvR4B
 +YouAg3ECvjFaal/u3vCtPgDrGr5f08e3rfx/VfQC7Vf+ORwBchJUfYJ5pFj77KJVIaS
 4LKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695033896; x=1695638696;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ewH2NLsTRFu015y52HgrX6Ba49oJNfW64QTSZ0Y+pxI=;
 b=S9Zjb5BU0BGvUg1Bbtvvd8ifB+WiSg7Z5GTYVKAWY0hGyrtPZUTEDQBHciaPnu8xge
 hrql46tFd/Hh8Ma0L5uXxXE36BZGxZy3dN6g3SOMfCGREXZ7z1bFmzR8BsHauK7NFBO0
 ZxftXvMjC9cM+b0+9j79oVG5WcRo6+pqQ9GeYMdrbVSQSpeaEoTLV6xkp1P9QsysbFfe
 IerwVkpqPPaB5A/IvIOFcvf2qwPYLrjOuytzPmGd5MKIlZQEVz7o/kGUOASypFcGA87q
 0CW6rKIzF2a7XDHd95WbjSudNLoLdooJ9DGcGqXnZgwJ/HUoU3jweCyJy1gwXNMbk+c/
 HXbQ==
X-Gm-Message-State: AOJu0YwU7+UZwhI9lBFsot6DGi9wM45dielgCZxIKBQVH7UlVfpsThBc
 2is1iugUpboAwUzX9qzaKzJm6GgL9Zr5nfoytvCuzA==
X-Received: by 2002:a05:6402:128f:b0:523:100b:462b with SMTP id
 w15-20020a056402128f00b00523100b462bmr7613449edv.5.1695033896362; Mon, 18 Sep
 2023 03:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230915115535.129834-1-quic_llindhol@quicinc.com>
 <20230915115535.129834-2-quic_llindhol@quicinc.com>
In-Reply-To: <20230915115535.129834-2-quic_llindhol@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Sep 2023 11:44:37 +0100
Message-ID: <CAFEAcA-Y6km+SY+qkHV91rJ8fpG4JpJwT5KobwYxVM8PA74eKg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] {include/}hw/arm: refactor virt PPI logic
To: Leif Lindholm <quic_llindhol@quicinc.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Radoslaw Biernacki <rad@semihalf.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: 7G2VPAB1JALs

On Fri, 15 Sept 2023 at 12:56, Leif Lindholm <quic_llindhol@quicinc.com> wrote:
>
> GIC Private Peripheral Interrupts (PPI) are defined as GIC INTID 16-31.
> As in, PPI0 is INTID16 .. PPI15 is INTID31.
> Arm's Base System Architecture specification (BSA) lists the mandated and
> recommended private interrupt IDs by INTID, not by PPI index. But current
> definitions in virt define them by PPI index, complicating cross
> referencing.
>
> Meanwhile, the PPI(x) macro counterintuitively adds 16 to the input value,
> converting a PPI index to an INTID.
>
> Resolve this by redefining the BSA-allocated PPIs by their INTIDs,
> inverting the logic of the PPI(x) macro and flipping where it is used.

This patch changes the values of ARCH_TIMER_S_EL1_IRQ etc, but doesn't
change the code that writes those values into device tree properties, eg
in fdt_add_timer_nodes(). The device tree bindings want the actual PPI
numbers, not the INTIDs.

Plus keeping the PPI macro name but changing its function is
a bit fragile if we end up needing to backport a patch from after
this change to a QEMU release branch that predates it. If we want
to have the base values be INTIDs then probably the macro should
be INTID_TO_PPI() or similar.

thanks
-- PMM

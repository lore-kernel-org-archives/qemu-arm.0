Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2170528ejf;
        Mon, 26 Feb 2024 08:42:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXQQItyReHMn6OCSr+q4jVgH98A+heJrjCJ+fndjxTg9BoJo+9Wj7FMUdfhrLPvBQAz51YGdX9r49gXWn9tyGE1mPEHtdWW
X-Google-Smtp-Source: AGHT+IFvupAFQeXsR0TRp1oUAxwhEFN1E81UQ7OZ3JNdT/TIfDXMV5TX36eOz71sQPZvPHyyBot9
X-Received: by 2002:a0c:f542:0:b0:68f:39bf:35ff with SMTP id p2-20020a0cf542000000b0068f39bf35ffmr8038901qvm.58.1708965730617;
        Mon, 26 Feb 2024 08:42:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708965730; cv=none;
        d=google.com; s=arc-20160816;
        b=XM3Yuu3xNkEMrWuwhAb63IU+lJ7GCBVb4FO2k0TrEBGMxXJu+T6l5ALmGMhLMcPnD5
         XY04kAt78hDjFL3x1RaO/Bp+DsLgSlP/I8FsFHF2JugY01cAzpJ6785Kb+EpbdyF3mp6
         HyVqZ47JZMyRwPTUYQ8J6sXvThDOGP+izlqwueNnUebNWyYY0M5zqjWpJJ4DuhMIULms
         dkPkvymWokjWJX4Ox2nfdlxzuCS2R3jiNMHMvhmZQa83Px5KQPfoh1elF2SaPZSLmCuF
         B7LDgVK/k9Z8OV1LN82qavdf7vSnKsCMyyh7mrtDdsJ+0/bxO9MvCta/95YhZyXKpDtv
         f61g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=zz0g/SyN3o6gzFvtFXQUqIxjWNzvG/FFb/14quMjtqg=;
        fh=MzXMExTj1ZocPBI+IODKg6hN4zsuJnyVi9sxN73i6C0=;
        b=nhnTaAuceamXSAeItxRG7k3g95dmWTj6TdRaJ/PUcSXShsmtVB7rD24am7VT9Lgnx+
         pjRmJKHkvfi7qPPKrkMdIsLhOeWxBP1JRWf39ELXkwJXKrsGzNF3XDnL0KReVdRkG/fI
         6EL/8Nq/1FnVHsLJ9H8e/AO+GFT2wLgU7X8apRNvJIbn9tP/muyP6M5sjQs9mMAXVq1M
         0HEO5yqRLK74UqJj1jCneNZe3kTDE7m5wK+JKbXUItDN0+ZSQTBGDf8J7oY4gWyBjlLY
         5NVUdDA4/YxndCGqni+QuC7/BqvZc838RJYm5cvQ+xkQf4EGeSRxgfIH7o6o3Us/kKRa
         G6BQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zg5+6lZo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id im3-20020a056214246300b0068fd1c016c8si5542610qvb.421.2024.02.26.08.42.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 08:42:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zg5+6lZo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ree3C-0008KJ-SL; Mon, 26 Feb 2024 11:41:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ree31-0008H3-EB
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:41:48 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ree2x-0004sr-MM
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:41:45 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-565ef8af2f5so1513865a12.3
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 08:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708965702; x=1709570502; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zz0g/SyN3o6gzFvtFXQUqIxjWNzvG/FFb/14quMjtqg=;
 b=zg5+6lZo/TW29+BD6qnRaqpbujgfBKQPH9HyHX2MJ72EtLrXKkYAREMescyQyo7KNq
 AaYIqlrQsklO5O1oZ0xgfiT1Tf8KMaqXG/3sDTUuz2EhnqyK/9fJ7vZcgRqpYM273lsP
 hjt2KXuxHZm+DZnMmNQYWfVwlp21Gp/FeBhoSIem7m7du9KY2qhYyq4qo3uOzAWf1xPR
 L0ZWMT85qpYvUGapdzuZhcFyhBVmveYZMn4ej8Ure+8hSCv+A7qJissax+Z+bjUjfSy6
 bUrqE00syGRKFBuiEgK2XbxPk7djWDtL0mJRoxgm0GvNJgwwXMmO4R+hKdMKc1ItlqFg
 cKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708965702; x=1709570502;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zz0g/SyN3o6gzFvtFXQUqIxjWNzvG/FFb/14quMjtqg=;
 b=W67FEzeWuKB6O678zSy+uHhZc+mNaftkrk5FI8hdDUA42Gsyg3PBATm0v7sRbCmpMg
 LG811EyJa+PKz1NDT6vDCbP4jbJ9kL2zBVRpHlSFfaxgMwaSFHkaO1jiLwIZK2cmEAVd
 +64bZZ0RZKFt4V+6HxzNSJZGLgikdYwp0iJEa8l2b3G5aw/spWPX3OMqqiPQP7GMoK2v
 uBgfolAPciBhX1KhYW7p4LqTJLhJeTPVWXdAB1571bE9GL/nhlGpCpvRdKRMK3HQyNJB
 DBH9w0IVnxv9jIkx1+Z7+EYG+lZ3zYl9Bwj/X86LcnrxkAkMQBfg3YXDAJLAwlD6yrbp
 hSlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcT0srFBp5r3+Eijr0VlEBYDFP4IC7sp2i19nPeVqDp+yIGxAe5RJFblVrjL9TsxgzEXXQ/ZNBnmK+pMtqHl68ixap
X-Gm-Message-State: AOJu0YwijE7S49WdQ6yQLyxIg/8yTYnqV3znif6gZkPgZ1j+yWbApsK0
 cwU8GcKcX+pvNA6XnP1YgBdCNanbngszCCA5gTNE2DOEyTvYC+xrWpQhjqlNNXM5B5HDittW20l
 NoAP2M5m5eUImpdlOq5Qi2VUKRwJrXPJnefP0tA==
X-Received: by 2002:a05:6402:b14:b0:565:63d6:40d7 with SMTP id
 bm20-20020a0564020b1400b0056563d640d7mr5823202edb.5.1708965702008; Mon, 26
 Feb 2024 08:41:42 -0800 (PST)
MIME-Version: 1.0
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <20240226000259.2752893-12-sergey.kambalin@auriga.com>
 <2ab7b523-816b-409b-a58a-f09e3f71ff8e@linaro.org>
 <CAFEAcA-WwWQnAQTmoCixaW5aeRWrdx__YoSHp_VyGEbk-rOkpg@mail.gmail.com>
 <df5f7f10-41ba-4c2e-8d50-9d35203d940a@linaro.org>
In-Reply-To: <df5f7f10-41ba-4c2e-8d50-9d35203d940a@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Feb 2024 16:41:31 +0000
Message-ID: <CAFEAcA8D45XrBBL1f7SxBCVD6vUO+Yvsxko7Kx91qgEbzrXG2w@mail.gmail.com>
Subject: Re: [PATCH v6 11/41] Temporarily disable unimplemented rpi4b devices
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Sergey Kambalin <serg.oker@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
X-TUID: 6C9aRi19tL8D

On Mon, 26 Feb 2024 at 16:06, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 26/2/24 14:39, Peter Maydell wrote:
> > On Mon, 26 Feb 2024 at 13:35, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
> >>
> >> On 26/2/24 01:02, Sergey Kambalin wrote:
> >>> +static void raspi4_modify_dtb(const struct arm_boot_info *info, void=
 *fdt)
> >>> +{
> >>> +    uint64_t ram_size;
> >>> +
> >>> +    /* Temporarily disable following devices until they are implemen=
ted */
> >>> +    const char *nodes_to_remove[] =3D {
> >>> +        "brcm,bcm2711-pcie",
> >>> +        "brcm,bcm2711-rng200",
> >>> +        "brcm,bcm2711-thermal",
> >>> +        "brcm,bcm2711-genet-v5",
> >>> +    };
> >>> +
> >>> +    for (int i =3D 0; i < ARRAY_SIZE(nodes_to_remove); i++) {
> >>> +        const char *dev_str =3D nodes_to_remove[i];
> >>> +
> >>> +        int offset =3D fdt_node_offset_by_compatible(fdt, -1, dev_st=
r);
> >>> +        if (offset >=3D 0) {
> >>> +            if (!fdt_nop_node(fdt, offset)) {
> >>
> >> Peter, I remember a discussion where you wre not keen on altering DTB
> >> for non-Virt machines.
> >>
> >> Since these devices are all implemented at the end of the series, why
> >> not add the devices then the raspi4 board at the end, so this patch is
> >> not even required?
> >
> > I'm not super-keen on it, but as you say it goes away once all
> > the devices are implemented, so I'm not too worried.
> >
> > Doing it this way around would let us take the first 11 patches
> > in the series into git now (they've all been reviewed), which
> > gives us (I think) a functional raspi4 with some missing devices,
> > which seems useful in the interim until the rest of the series
> > gets reviewed and committed.
>
> Fine by me! Sergey, don't we also need patch #39 (Add missed BCM2835
> properties) to have a happy Linux boot?
>
> Patch #17 "Implement BCM2838 thermal sensor" could also go in but it
> doesn't apply cleanly on top of 1-12); maybe Sergey can send a series
> of "patches already reviewed" on top so they get in for v9, postponing
> pcie/network for after release.

I'll put together a pullreq tomorrow (see my other email for details
of which patches plus the necessary changes to the avocado tests).
Sergey -- I suggest you wait til that gets upstream, and then
rebase on that.

-- PMM

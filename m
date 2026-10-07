Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44CDCA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 10:09:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEOaX-0008Jo-Lp; Wed, 07 Oct 2026 06:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xEOaW-0008Ij-1B
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 06:09:28 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xEOaU-00045l-HL
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 06:09:27 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-8ab8d96d02aso18020817b3.1
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 03:09:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791367765; cv=none;
 d=google.com; s=arc-20260327;
 b=gj+kWlSF4nkzC7fMi96Hw5N9tm6/uiB/9Xd7+uROBYalZTVBzr7bhxGWJd+bdLEfcB
 qAzs1zVZF21m1Z5oVmrFpH8tFMisoAf11m4YGTTcIwl2zPy81bEH+Dnvbel199ac91rs
 Y2hm1kkvU49svE3kPtwGDUdWY5T2tRPKUW33Xjgp+K4jg1wOU7XqkCfBqVgM/Q8g0jWa
 XfRY+3bXbpOHD31eZEUcy8Lc87zshE8ZCI1ZBrhvQgdmytwM09GtKr516ts6A+BrIGFX
 HKtiB9NsBhywFqZtzixGDr786MojaEconHSethFvJKZoyw8qkDXRu3/VF0KjHRygIDpL
 Z90w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ZIgJ4Torh+ZfX/aU5V1SR2C2Y88pcVBPp0ItlG1t/C0=;
 fh=F34O/QQ2ezFqqRmkGkMHPulZmn6FUTv0lLTW27IJkag=;
 b=ZCYFgetSLndasxdrtmurRC8KGky23PSFhpmZnSmYV53cWOjJc9SsWnhYiwdAOgDN6B
 MxZldi9YNLJyLAXq5DKAIA3p4Eq6fHsXOpyMoRjuVnjGDLAddXd+RXcj0bYWfSqkU5lG
 9SyCoZWJErY9sTJq+pxCESo1NEdvTd7waaofJmYKO1eAkj2j1WjvbNf8YXMWJVfs5xSG
 q2KO6VT1lm56/vuyF5MeQd4d8blB2H7WoKqedbt/O1LUcfHBj+c6CHUdTNNWGf3XieWz
 JH6q/bEOEDaTVm8QYJ4yHMsDnBeEMhTYriBYUUH0xIqUKuqIuDLOC+x81hK8OGrGwb5+
 ANuA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791367765; x=1791972565; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ZIgJ4Torh+ZfX/aU5V1SR2C2Y88pcVBPp0ItlG1t/C0=;
 b=HHBxF019qTILRloQC+y9TTZAT02+Ox9igpSO+O7AMB+i6n3E8PRS+NOsDvoP3D3Zyn
 1HCYEJpAWe8ChJ1wEjyuAzoqWVe5PAhnbV5uUgUhTh4M3v3NGTMb32RhWdODsCXrvqvZ
 Tc62PYMSRL0RSqn1uxXZCUzodnHclEc8rnehgJkyCDuqB1fMQxV2bgCJbaujU62Wjozw
 qPJ/6kD0MYu/lLA++GmtLFuuUBTXnzkQj3taXUfcPHIWMAV++6Y/jRlpD470PV0bpe5c
 7inUCX2kR8cNWhkc/HJxuw/MtdUJ3O6eS8kr+/acgSw8g1uDSyJAaeRsQdAunG6Kc/jz
 rjmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791367765; x=1791972565;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZIgJ4Torh+ZfX/aU5V1SR2C2Y88pcVBPp0ItlG1t/C0=;
 b=gtts4o5h7U57hgEvKoF+Zjt95B15ONLRLBqbtZA2zl/zNrJR84K8W7fuVFbYt8DrC1
 E+e8mg/h2eRm81ronbe/0ahceZLUQ2yOWjYujtm0VbR98rqFnp4eE0aXbIzcUNlsCrTr
 2+Syql/i2nSC4GhWzsG4jzX4dw9nZXSBBwX99N+II73WBY+LIjZCV4aWo+nTuCG5yNMx
 OjgOYbeBum73M6IH+8f0yRcMETNM0CHbLapCAHlFignKIIQYbCQEBRCDw3bFcSKLAJXd
 tQ82gWtHZ7mZ0xtK6XpHwTkBXFNIAsc6Uf4se/voox3iKje8iLklaomhQfU97mB+4WWR
 Pt+w==
X-Forwarded-Encrypted: i=1;
 AKwUvBwyS3woAa6mvkeKsGHMynla6izuPLl4tVTAO6Zjlpt15Q05K8G2s+U2gr2EyaENie1TaUJTHdlivQ==@nongnu.org
X-Gm-Message-State: AFq9FYIrWWyTTPN8bKciZ/LfvHct9hQqY2FYWuhDsinAVyfwIu/Q12fL
 2bSXrhEjILEiTw9jYVsA4zlJRYTZokIj2+vsOCb4f9bnbCD2s1uM8kfWQzF5GkHCYvTLtF3mhAO
 hqPva+n3Dqn05iPyRjcnxFknB4GeLk6Q=
X-Gm-Gg: AYBFou2Ki2VsuA3v+JJgbEm8Cr7CMIG3rfqdMoQOo80+3/Eh3W6WNnffQ/9iSHCdFRV
 4LP+3MJoqNvMxXJCIV8UqgRN5Wn03q9m/9t5YCLAS/2Bc1REoBoftlssdDRlAOJqjiAWEt/xb6M
 GvPU34B6AdKDEwMLvB6DsdEORDFv4rvryAEcp9G3+GKOVaCBCFb1hOFl3jLHdBN2sqoRCn3yHIg
 /8iLaMQvfGJrlGxts0yNNnaEXkRwEbr43old89L5yNV5V1HzkUrZQnG/q9+rdkFDC8X69qczG47
 jhAleUi/ZzQ4ztVX5MRTP2M93kwO2YoLMVUYJoRrAzxF/i0yZyKQ768Ry1MqTRAQYrUPNZ0eKQi
 45fNP6BQISmKSIFA=
X-Received: by 2002:a05:690c:10:b0:8ae:dfee:cd2d with SMTP id
 00721157ae682-8b05aff25bcmr13543247b3.66.1791367765124; Wed, 07 Oct 2026
 03:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20261004090500.3082641-1-bin.meng@processmission.com>
 <20261004090500.3082641-2-bin.meng@processmission.com>
 <CAFEAcA_U-Aoo1MmvAm61_HxhbA+1A-YX1g+oh=1THsi9QKBeOg@mail.gmail.com>
In-Reply-To: <CAFEAcA_U-Aoo1MmvAm61_HxhbA+1A-YX1g+oh=1THsi9QKBeOg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 7 Oct 2026 18:09:12 +0800
X-Gm-Features: AclHuK-RAiyvgyHssYuZJo8Fm-r1oxm2Ng2UU8GMD6r6juHcb4JuJ9yaRlG7eF0
Message-ID: <CAEUhbmWxS3XRfP4-Uj8MuMoeBb05YCyhHAzJc+_My6kj7L_qKA@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] hw/cpu: a15mpcore: Model the reserved page as
 RAZ/WI
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Peter,

On Wed, Oct 7, 2026 at 4:41=E2=80=AFPM Peter Maydell <peter.maydell@linaro.=
org> wrote:
>
> On Sun, 4 Oct 2026 at 10:05, Bin Meng <bin.meng@processmission.com> wrote=
:
> >
> > U-Boot's shared i.MX6 identification code reads PERIPHBASE + 0x4 on
> > MCIMX6UL-EVK. The first private peripheral page is currently unmapped,
> > so that access causes a data abort before the console is ready.
> >
> > The GIC-400 register map reserves offsets 0x0000 through 0x0fff and
> > specifies read-as-zero, write-ignored accesses to reserved locations.
> > Model that page in the private peripheral device.
> >
> > Reference: GIC-400 TRM (ARM DDI 0471B), sections 3.1 and 3.2
> > https://documentation-service.arm.com/static/5e8f15e27100066a414f7424
>
> The Cortex-A15's internal GIC isn't a GIC-400, as far as I know.

The Linux kernel says it is a GIC-400 on i.MX6UL
https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/nxp/imx/imx=
6ul.dtsi#L158

intc: interrupt-controller@a01000 {
    compatible =3D "arm,gic-400", "arm,cortex-a7-gic";

>
> > Signed-off-by: Bin Meng <bin.meng@processmission.com>
>
> RAZ/WI doesn't match the documented behaviour of the Cortex-A15
> for this region in its TRM:
>
> https://support.arm.com/documentation/ddi0438/i/generic-interrupt-control=
ler/gic-functional-description/gic-memory-map?lang=3Den
>
> "Read access to reserved regions results in a Data Abort exception to
> the requesting processor. Write access to reserved regions results in
> the assertion of nINTERRIRQ."
>

It seems the A15 manual and GIC-400 manual are contradictory. I am not
sure how to proceed.

Regards,
Bin


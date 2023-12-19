Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp1702865eji;
        Tue, 19 Dec 2023 11:06:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUcbmWTCCOIKt7tBx1zQyXRYWIB2mA+ExhNV2h4PDa5+4zIY6ssIj/cmna0YyetqyzzJG1
X-Received: by 2002:a05:6102:1609:b0:466:a4dc:dd16 with SMTP id cu9-20020a056102160900b00466a4dcdd16mr2018523vsb.51.1703012764739;
        Tue, 19 Dec 2023 11:06:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703012764; cv=none;
        d=google.com; s=arc-20160816;
        b=SLJxGdgg9N++uzRRrE35QY8elrs2ssM7ABKoQohiy8S3csA3cm3j7YdtQbwwSH07ZO
         ZFf9pGDyjiPT0qiJanIHbxp7rwXOMjLM8S8tWRv7icrm5V8zmA8mY4RWyGtV8W7mVWAV
         Z32djcsdaHJZQDlbjVGYYUuNB2n3g2nD2s6mXR7sU7VNVMSrcCNOUUQ/C3KVEB57c1cY
         cATCm7KGIL1gzPCuMumuf19kmDQNKceY+H00+SsWgQLMnXogq3lttY2MVJ03sh78bS+S
         s1ZySS7F0pKer5qxJ7OUcpD/Eh51gFGDIEG3NFyUi52UXnf5xNN6IZNxmsUXwZPNpjfx
         7V7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=o1gkDaoRWnuKADigBfLJemgjsZtPwZTBeG2A0bj8Ekw=;
        fh=fnK5u6AleUgHwG2ARaM1rpJbRAMLaQj3Xqc0NYcQmaY=;
        b=mBt3Q3uZmyoxlpN5JisG4Acc8Sei4tYp5++AltTxC17IanK5xjjLiZzsamLQ7Klt8Q
         +2CytnOKs7/PSzj/F37gl0HoQMsx+t7iQjRsPUBniI1lz1kFP1VRwq9kwYizCpgHaDp6
         JYU8d7T3gUk5azflheOpb1vaXU3bd7qTnETyLF9pSZkHmv/3fIpzaT2edJVvGXSa53pb
         OTMVxy1cphzilfWSLba17GpSgyxVs370KdtyAse9AFS//F/Bozh5pg+3AVWPENmAiChl
         lfq2sWM3X4vDuI2uRwwUl/c8eK6/UAAwhOMg+f7uFCaSAAAM4rXXNKM1zTnTZ6rIIoT7
         JITg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=D7LJyZPD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12-20020a67e20c000000b00466af424971si376376vsa.72.2023.12.19.11.06.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Dec 2023 11:06:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=D7LJyZPD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFfPk-0005sf-NA; Tue, 19 Dec 2023 14:06:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <n.ostrenkov@gmail.com>)
 id 1rFfPO-0005Rr-AM; Tue, 19 Dec 2023 14:05:40 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <n.ostrenkov@gmail.com>)
 id 1rFfPL-0000DE-Ms; Tue, 19 Dec 2023 14:05:38 -0500
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-dbd04e7d183so3168401276.1; 
 Tue, 19 Dec 2023 11:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703012734; x=1703617534; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o1gkDaoRWnuKADigBfLJemgjsZtPwZTBeG2A0bj8Ekw=;
 b=D7LJyZPDYd315bBmxEGlRGrmPYfOyIm7fl6SFSNpvDuERW8xtYqMo46EquWSpvoRvW
 WRPZoBe1fX3TpPcpt2URsKpZ4LRWXWyhZDCwXLIt72bsDa/Mch5eybcZKFpKaEW5OZr9
 U7kAn/tzMVT8BLA/9jyGYwpzAq2DogkikguL/gYCnWls3a5CBEnJa0banZLGdRNei011
 w3n5tXKvTxWYDKaXH8jf9+Z/h64sO751LJTqmf9mwvc/3hXSf4YeI1y+krA7/h7svxoh
 YvURoqneb+AO1jmN4arVSFCmz1kd6ZDV9mP4R/jpUFK1vZnzYda2dJI4PZ+IFkJzK/cw
 +j4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703012734; x=1703617534;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o1gkDaoRWnuKADigBfLJemgjsZtPwZTBeG2A0bj8Ekw=;
 b=ksjjJ0bdzU2zhl05m/pfFB3ALAMA45n/Seh9xLOZGr5W/vT3wYiQIrAYati4xYebra
 tAC4gNgVAIKeu/Mzjr2n+nYEsMrobqoWXjWVgf1/yPx0lG3ipkkF0/e8FAxDdNH2FtJD
 2uNCCKlGhyiTEYuS37Wb3RkZWkqjRORMCN56oiZjhn2qFJzUX0E2J2aGaZa/tq3I4ILz
 2F5T1vrfYiVcV1xntIwBralib0K6J9kHzoP0VB3j01FVzgrYBpBI4YUcB8FBZQmOsIni
 W4ILAYbH6wSbCmk5QkmjPc9ZZRxiGaA+L8TxwTovgA3++wOFxnl0sK5TzFYd6GP2iGsA
 gk8Q==
X-Gm-Message-State: AOJu0Yxk2K+m0dNDnI2XjVcbKCAosA40oXEbLysaTH+81rR7sfCiGh8j
 hx5bvgJUyKsKoZDQnzjzcfI6o36A/Xd42mw5YQU=
X-Received: by 2002:a25:83cf:0:b0:dbd:4a26:957d with SMTP id
 v15-20020a2583cf000000b00dbd4a26957dmr1718559ybm.85.1703012734354; Tue, 19
 Dec 2023 11:05:34 -0800 (PST)
MIME-Version: 1.0
References: <20231219105510.4907-1-n.ostrenkov@gmail.com>
 <CAFEAcA-Gp-8ooEhHazJg5Q-xyQ5xB2ox2+fU_tNBYV0HTkwg6A@mail.gmail.com>
In-Reply-To: <CAFEAcA-Gp-8ooEhHazJg5Q-xyQ5xB2ox2+fU_tNBYV0HTkwg6A@mail.gmail.com>
From: Nikita Ostrenkov <n.ostrenkov@gmail.com>
Date: Tue, 19 Dec 2023 22:05:23 +0300
Message-ID: <CAC8KSA0F-QtkS5T7fcEM=+iuVCNAk88SYUUcVaTKG2hXNn2Uhw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: add cache controller for Freescale i.MX6
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000144bae060ce18d1f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=n.ostrenkov@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 3X34fO8vv/QE

--000000000000144bae060ce18d1f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

thanks for letting me know! Enjoy your holidays.

=D0=B2=D1=82, 19 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3., 19:08 Peter Mayd=
ell <peter.maydell@linaro.org>:

> On Tue, 19 Dec 2023 at 10:55, Nikita Ostrenkov <n.ostrenkov@gmail.com>
> wrote:
> >
> > Signed-off-by: Nikita Ostrenkov <n.ostrenkov@gmail.com>
> > ---
> >  hw/arm/Kconfig    | 1 +
> >  hw/arm/fsl-imx6.c | 3 +++
> >  2 files changed, 4 insertions(+)
>
> Thanks for this patch; it looks fairly obviously right,
> but I wanted to let you know I won't be able to do proper patch
> review and take it into the arm queue until I get back from holidays
> in January.
>
> -- PMM
>

--000000000000144bae060ce18d1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">thanks for letting me know! Enjoy your holidays.</div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=
=82, 19 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3., 19:08 Peter Maydell &lt;<=
a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt;=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Tue, 19 Dec 2023 at 10:55, Nik=
ita Ostrenkov &lt;<a href=3D"mailto:n.ostrenkov@gmail.com" target=3D"_blank=
" rel=3D"noreferrer">n.ostrenkov@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Nikita Ostrenkov &lt;<a href=3D"mailto:n.ostrenkov@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">n.ostrenkov@gmail.com</a>&gt;<b=
r>
&gt; ---<br>
&gt;=C2=A0 hw/arm/Kconfig=C2=A0 =C2=A0 | 1 +<br>
&gt;=C2=A0 hw/arm/fsl-imx6.c | 3 +++<br>
&gt;=C2=A0 2 files changed, 4 insertions(+)<br>
<br>
Thanks for this patch; it looks fairly obviously right,<br>
but I wanted to let you know I won&#39;t be able to do proper patch<br>
review and take it into the arm queue until I get back from holidays<br>
in January.<br>
<br>
-- PMM<br>
</blockquote></div>

--000000000000144bae060ce18d1f--

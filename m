Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88B2C88E7D
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 16:13:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6Vme-0002FP-Gn; Tue, 15 Sep 2026 12:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6Vmd-0002FA-7q
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 12:13:23 -0400
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6VmZ-0005vm-2l
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 12:13:21 -0400
Received: by mail-yx2-x10.google.com with SMTP id
 00721157ae682-85d45ae011aso6016727b3.0
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 09:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789488798; cv=none;
 d=google.com; s=arc-20260327;
 b=lLLrgOiIkQbdtdba+LPAVpS9Y7PYBtvwcO9J5UwyACM6VzILG91dwCjPbqoAnf3EsQ
 w0htCxpQp54nhI9h3N2bvDFbbJNAV27/d6X6ARqMtEQLWZBel9jz9qkcGFwI+x1dhykF
 9vlY3EqEF/tglK+1t3SL4Us6+LiZUODovB2ZlmtwasgGVNVU1wHMQzJcnBVHYFVP64UZ
 8RNUTBblcvE3UpybGR/bRWcOAz6jJ/X2ve1SreMBYBLC3Sd8JZZsmqVriiOvZyT5V5Tv
 MpqDKuRK6jfXNXjH+ax3L4HaDdp8o7/4RIb4Jph/5EtnluZXzMyIRN7CBPqju5piaSZd
 0e4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=/5ul9R2d3z6fhjgPNwSZloyBYPFwCNFybU1JshNoOog=;
 fh=pt1dwHSTdXRbiyGXfRu9nosNp+BokDuR/CX4xIF3mM8=;
 b=Xfh0MtfJiWZ2lLYwNDd1uW1HMOfzsxeFP3BiO0qa1SQmnUy69svQsqqtvs3p5v1rJK
 3zEtU80xOheP5NGU8ayI3PepbRokjgob3U7uVAFXHx5nH3W/0mb76SEGLT6vzSNownYY
 spIuABy/NoUU/ffvEUkrTGePCpwLfG6TLI3nyDVguwz4FopWxS/fhjUV7vnhYy5f6aEu
 SydADv6RG4YhynrO0v6uoSvIBugx1fw8wFmyfirAk+3J0Nio63oOIoh3wiydc6sw+YMk
 IVwniiRQpkXXplot97rl+wQblUPLHtNrrpTZknU5MKCIr3xiPSP/61wTKG9tPRZt12Wp
 XpXw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789488798; x=1790093598; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=/5ul9R2d3z6fhjgPNwSZloyBYPFwCNFybU1JshNoOog=;
 b=nvNST2LiU+wcHyBParI3sgwD07pTlGIW4IKU+vYzLppbIbRoS3EApJsr0O1NqJ5Weh
 2cCQNU0e5CCB4Az6oC5dY/MfGm8jn1IDudkSDNrG7q2oJZS8XnOx0a3HpPFnbINJcTI3
 9c+YoPU0ZsgOB5v1SfES3X01poM/mhW2GNxazSspjPmU+Z1N56HK0wm3h8hYybRkoSxY
 5MZGlsYSucVsUDoFnutEP62TosotbyczVS0NBGFVcvQLP/GlJstcw/N9Ykbn0kGK52Dn
 xMNytimuBBwgF81viozdeSRYweZGhse8/H6aGkqyuAu95CoTuAFb12BKpcY6iq1i3qy6
 E21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789488798; x=1790093598;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=/5ul9R2d3z6fhjgPNwSZloyBYPFwCNFybU1JshNoOog=;
 b=CkWJT7GNQPwsbA8eOJIKso/JY4FRrjJvqYsPU9iPE79+KCpFogLPXetpNyl5z+Lbo+
 fliXPdRVHQocqJeop2a4FvwiS6+ybxr586CHCOxk+8m08PK8CFsKHJoKAdPRmH4b4yBo
 e4P3f+nQFv33I0K7rrZ703twZrt/+AbsjDFJKue2CF+bu+LDo0MQu7YQq/d916mwcGic
 /ktlMp+o3kM194psGEgE4NOzxpV9GuqGxfE0xmut+3wfJdpyYQAi2Btn5BEs9VT/q4Xp
 e32aDoRVbU5z0+2m3fYBk9ziiomhkYBx22Xa/Jkv++dqqUY8eoSO4g0QLcSH2qSPpQ+R
 wygg==
X-Forwarded-Encrypted: i=1;
 AKwUvBz+g/thniFzJwt3URR9/hJDELZ276nzAUEBBsd+WgguS4J6wdaHYY5QAeWciGLdC7o31JSah2oGYg==@nongnu.org
X-Gm-Message-State: AFuF++n+nUwt8h1OA0e66s6+82wFA8cz7ZHSWLzIZrgHucV2SqaESw3Q
 ctaF6rHjXI0O2RFF0mM9CR/0scPfiW3udM5wPdtmCVBCz5IrSOrdSYZbo2aawI93uP/IZ+Muike
 PkeXddY5V45zxRvangztKHlpADiURlJcWNvyVIe3lmA==
X-Gm-Gg: AYBFou1npQXWbcv725fys6FuT1hMaJGI+UKefm38Gp3C7KftWiYkAYZGqZMzIRGm1IJ
 H9Ma7iIXxx3AHBjxXKixy30Qg388osJmtuZWQiWwN4H5LXSNczr34FjBuKdH1qcrwD8kQvBMwxt
 3zrf/NmvdAdQSHI0nFjIcA2++EoHkAz8M5ceozgVbpCoHYcW/UWbPWUdVaLQ9s53jipFDvaJYUG
 hown5vbR4DuAWCYvTO20XT8n5jGooCuru1gj3IbQh5KQqBAPTJovVvZPt26UyNZ34iRy1f4qgKr
 t2aGXq0di/5/TgaQ7eRPBNX0IAIMmtxwx/1fK6tPGvGOkZuVfwcIZjMhSAwr/ExUGIV0mNydyt2
 bf7njlmY+zEBxmi2H71ak80d6ZJhkgnVys+lkLxTm
X-Received: by 2002:a05:690e:1907:b0:66e:62cb:bb6e with SMTP id
 956f58d0204a3-6715cac005fmr850870d50.11.1789488797684; Tue, 15 Sep 2026
 09:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260904161438.3838261-1-bin.meng@processmission.com>
 <20260904161438.3838261-2-bin.meng@processmission.com>
 <CAFEAcA-p=UaNk-Qddid99o7zeGS4WqmvqAugxtjtBKZwv9ie8Q@mail.gmail.com>
 <CAEUhbmX3N2u732mUZ8wG0pdtN+vCrVf4rdX3TR+vHPeRunsGPQ@mail.gmail.com>
In-Reply-To: <CAEUhbmX3N2u732mUZ8wG0pdtN+vCrVf4rdX3TR+vHPeRunsGPQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Sep 2026 17:13:04 +0100
X-Gm-Features: AcwNN1WUGlOp62e_u77RKxrO6eBx6PeevZUeanHkFoo_G-SEvdJncJBh8x4Z6JQ
Message-ID: <CAFEAcA91O71cLf9ogos_xuTx+9fn-jdUGP5u80RD6hOxAQNQOw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] hw/arm: fsl-imx6ul: Add SCU compatibility window
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::10;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x10.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 15 Sept 2026 at 16:52, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Peter,
>
> On Mon, Sep 14, 2026 at 5:20=E2=80=AFPM Peter Maydell <peter.maydell@lina=
ro.org> wrote:
> >
> > On Fri, 4 Sept 2026 at 17:15, Bin Meng <bin.meng@processmission.com> wr=
ote:
> > >
> > > +    /*
> > > +     * U-Boot's shared i.MX6 CPU identification code reads the
> > > +     * Cortex-A9 SCU configuration register on i.MX6UL. Cortex-A7
> > > +     * reserves this address, so provide only the compatibility word
> > > +     * needed before the console is initialized.
> > > +     */
> > > +    create_unimplemented_device("a7mpcore-scu-compat",
> > > +                                FSL_IMX6UL_A7MPCORE_ADDR + 0x4, 4);
> >
> > What is actually going on here, though? Why is u-boot reading
> > an address that's only here for the A9? Has this been reported
> > to u-boot as a bug? What does the real hardware do?
>
> I suspect the reason is that the imx6 family contains both A9 and A7
> based SoCs and it's a leftover when imx6ul support was introduced in
> U-Boot. I do not see a bug report against U-Boot yet.
>
> >
> > Whatever the answers are, I expect the correct fix is not going
> > to be "fake up this specific 4 bytes to ignore accesses in the
> > imx6 SoC model".
> >
>
> Apparently the real hardware ignores the scu access on A7. So IMO it
> could be accepted as a workaround for buggy software although guests
> should not do so.

Mmm, but I don't think the fix is going to be just this 4 bytes,
and possibly it shouldn't be in this SoC specifically.

What does the TRM for the SoC say is at this address?

-- PMM


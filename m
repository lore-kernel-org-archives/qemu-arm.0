Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D6E106ACCD
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Mar 2026 18:21:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0key-0001I3-1h; Thu, 12 Mar 2026 14:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@linaro.org>)
 id 1w0kev-0001Fa-Iy
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 14:21:21 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@linaro.org>)
 id 1w0ket-0006kY-SU
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 14:21:21 -0400
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-466f00535cfso980948b6e.1
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2026 11:21:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773339678; cv=none;
 d=google.com; s=arc-20240605;
 b=EdLfPb1w89AhmQ9z+6fw2t5rffBq6gd0meSmpZP9gJtHKwEq3chgvbqz2wxTgY7P89
 cCKo5MyvXnTlSoMrkRNn0/1wa45firLYSZGohq9fiahe+Jv6dfEYE37LgyiL7ISh2X+a
 FrkOQAjvHoSaAWUZqfzRbf0Z/5h5oOEZC+ZBOTV1STH+gaLZcc3aAXndGw1l1/i6yCHT
 5RGvTWBuqCDn4DN5SDhRa9a8awpekamf5mCTFyoq3etjnAl5u3l2bFO4wKStUjrCOSlw
 OjFFqRCR7mbetiF0ex1ZBlv9VBP9uk0n4+e9+cDnFS+6d6mFC76L4akFWwKOjDkk9X+N
 01WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=3GUBg4/MKX2N2US5F4ShWPk7363f3mIcvS87GGNVCTE=;
 fh=CeQ7m/cvEiO4DdJ7HfGThwMnyin7DwcczZvkn3JrBEY=;
 b=NtJicK9ehMD+5htowLwCMYMlHGAzImGCp4Y2K/3aQnyhqRMRB4dVXNAIWKmPYO/4/B
 4LTeErVYZIkC6yDTroZOcu1P/qRzu5qOA3MXBLupr2YIsHyvT8nSt2Ifa2L/ZoVKTbbU
 Dyzs9JdIPB6AYaTkSHZwWkxQeJUiRwfKVSiY6kIAXswQQ+XeObbRG42Wdr7DvQ6ZWh4Y
 86ypFbKh2tu4B5tLZlzf6mwqGOaGeQTAsbuwBce/jrJQYCR09F9r1qtWOSTCniob13cX
 Cnlbf/zh8XNkogV6eM83tpwFXXi2hlbVrrOSPRMCbMUfW5EXC+AiesOIIYnJbWmRqSmA
 A4uQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773339678; x=1773944478; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3GUBg4/MKX2N2US5F4ShWPk7363f3mIcvS87GGNVCTE=;
 b=PskAIHvx9BY8DtwHXaQJt6uCwJkclVkMdNy9nyucfmLoMYHia5oOF5v+5GL2juW3Sk
 mSJD39/e98Bj/JFqKKK9QksQADw0N8U/mpkH5gkSqiGmeMo8wn8XxAbMiSakiuvsQ2wg
 ubA+rIPzcqd9bwHIq7vhx5Wp7QepAtYztFI2cNDu125nW1FoN14N/u1CkEPwZ/juzzIo
 iaM6wu0nzNXUh/6pOBzh5WQi75nAgK6/Dse5TSkVgR3GJroiJoH+m5KXkhYAOLWwNHXM
 zXq2PnD5Z0xsxmTzoI1evdpKzeSB4R7aOAMyUAppRJf6gvuG2cI9gR+HwhMzCQmNXxXB
 uKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773339678; x=1773944478;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3GUBg4/MKX2N2US5F4ShWPk7363f3mIcvS87GGNVCTE=;
 b=xTDXxkkV0c+W4tt+XKFmT0pxS66xxjJCESy7KbMrFfJpSaZ11LGqyDPkKg3yBe4DWr
 zxgUlTKMnSTzudnBlltBPF1Wnyk/lClx2o/T+ZKFuvRxD2nLghPtw/MLhljbhqEgYSL2
 4NmP7FplWPZr225p0zYMac5JL6WrCW4O1HWDExlsNNXYXjgv4dVymD3rGWbpbBpLs8mi
 80efJoQHCzg14sit8vA7ttdME7jmc3K6Q+YKbhaZc0OaKKkMOJ1ieI7SErUNJ3xtzrmi
 yfU+Et0c2VPaiJi1YJhu4vW7R8+42UY+wv23x38e15uyawYyp15oW7S4D0+k65f0Vlsl
 O4dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk7uc0oWg2Hfm1c4XURlZ8Ofm7/Vly+BZE2eZgbi7U49YiJMm0BE8wy2AUmuf3oOkXr87WDTzpWg==@nongnu.org
X-Gm-Message-State: AOJu0YxZBSj8xOGfeumhI4A4gqwQEB5on9jodZEzgdbTaOeD+PXLgP2v
 BQJtIZ6wxhwxzRTLIEtYSK8qz35CwM5D6Hgph5WEh40MwSg7S7ai7CCaNziSJYW0dO9Xe4D/nn4
 QF2+mp32p2knTRearq9k/p/NEtzM51YHcrp0bHxTOJO3HibltkuvSGng=
X-Gm-Gg: ATEYQzxdycO9SFFyl8b/o5Xwl0BCsaLvsSn3tnC4ACsakHF3OyxiDo0diCAPFegvtvQ
 s2K5LKdtpUPJPYOr+TfXSeOOO+nJHYkt1kkkDmSZ3XbuD23yGvEsB2uNoHVFiylfV9fSSvqponu
 e7/oH9IqzlChXsR4CoTgj0NXfXv6G+gOEqG4m2JKk9OtNqqUQ+UCCH+RPmqQjPhgr08yR+WyFj3
 eTq81XglQInSqJ3jGGY5hkIt1pBamQoIrTE5TWsikUIsu0Y/FO0ljVPG6Lz1+4UfrIrL2wVpoKz
 uBzLThY=
X-Received: by 2002:a05:6820:e0ab:b0:67b:db41:595f with SMTP id
 006d021491bc7-67bdb415a91mr32098eaf.74.1773339678166; Thu, 12 Mar 2026
 11:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260311151014.55915-1-mohamed@unpredictable.fr>
 <20260311151014.55915-6-mohamed@unpredictable.fr>
 <c3a46ba7-7f5b-4a4b-8d24-6d78b7c0f5ec@linaro.org>
In-Reply-To: <c3a46ba7-7f5b-4a4b-8d24-6d78b7c0f5ec@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Date: Thu, 12 Mar 2026 19:21:06 +0100
X-Gm-Features: AaiRm53gxsJT3x_Gu04pyKeNLjfiiYP2-bB0WctywLWioSlpdS9ntOXnzGAO4U8
Message-ID: <CAPMQPELPaVbVg6HzsUm0s_w=xMqrmKUyC1dD5rEUu_FujU_hoA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] target/arm: cpu: alter error message for host CPU
 type
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=philippe.mathieu-daude@linaro.org; helo=mail-oi1-x233.google.com
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

On Thu, 12 Mar 2026 at 19:19, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 11/3/26 16:10, Mohamed Mediouni wrote:
> > Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> > ---
> >   target/arm/cpu.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 7e3e84b4bb..e73d7eb4fc 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -1629,8 +1629,8 @@ static void arm_cpu_realizefn(DeviceState *dev, E=
rror **errp)
> >        * this is the first point where we can report it.
> >        */
> >       if (cpu->host_cpu_probe_failed) {
> > -        if (!kvm_enabled() && !hvf_enabled()) {
> > -            error_setg(errp, "The 'host' CPU type can only be used wit=
h KVM or HVF");
> > +        if (!kvm_enabled() && !hvf_enabled() && !whpx_enabled()) {
> > +            error_setg(errp, "The 'host' CPU type can only be used wit=
h KVM, HVF or WHPX");
>
> Squash with patch #1?
>
> >           } else {
> >               error_setg(errp, "Failed to retrieve host CPU features");
> >           }
>

At any rate,
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>


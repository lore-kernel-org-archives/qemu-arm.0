Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC3BD44C67
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Jan 2026 15:37:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgPNq-0001cN-06; Thu, 15 Jan 2026 10:35:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vgPNm-0001XJ-3W
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 10:35:34 -0500
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vgPNk-0002oV-HC
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 10:35:33 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-78fba1a1b1eso15764707b3.1
 for <qemu-arm@nongnu.org>; Thu, 15 Jan 2026 07:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768491331; x=1769096131; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UpqU9cfo1pFWzDH7JoKCp5+Sd89DbW80PRV4Wz+Ueqw=;
 b=idbs4jJ9aiMsUoslYq6C/cHh1HhjHpowW4uaXEUpnvHCyPFa5Dm0xwxRABjBCLR2VF
 hcx0RX8ExNCnLNEk/94bkqmDSNSXgJih/J+QTySw6AWsdgYrotnpXu76aiHu7eW8OpFB
 swETyiWKGDdNOoqBBfojkZep7PddQ0NfcGCOzPR2go6MwofuLju+AE7KXeuKCSntGt+1
 olZ4K7AGemgJ4epuoVQ7q+23/1c4RJjkBPapyWe3rxBs+b7k8VJ6sIDlH90Lak9fL92p
 WDqgvAShIgH0Lics0ijWQ/OT4JQxxyBkkzQT8jt004oO+9SPw82cOKyPkzPipQkCOneQ
 mEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768491331; x=1769096131;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UpqU9cfo1pFWzDH7JoKCp5+Sd89DbW80PRV4Wz+Ueqw=;
 b=YNTLL83gcY5jv8phYRrW35KPVXhKd5bw3rKWyrvOhevc2uFiqaqYJ9PW/OJtA68SQ0
 J3Ct1rZOdXLi1GwVd+CXcuGAAFt6lqrelqfzt+ocZD+AmfQkZjLbNxxLUI3luZVn0Qhj
 Ay1kO5UBt9EgA3oBYENW8P1RwrM83zcPEUVDsQz60x9IiRzWFaIkHLp+H9+Yo67oq2i5
 zdurLMpppBQEJjltBqIFExDLeEm+l5FhlNdhzVg41AOBX6r15F4IRoaVwt/eZfdwf3Ew
 niy1eKYprpLQkPULcrPXuSEOIbcoewYSiZcSNH7aq34oVRHh7z2fssgxAHdeDukSxywK
 USVg==
X-Gm-Message-State: AOJu0YwLjqqHrbp7fMUia+TaYYfkGty87E844GScM2ZhtDkyTXKpY5Hv
 PjKW9cgaXe2SqvdejRhlYMP0hAaaNja54CuPRptjrDATpupGUwtQ1aJT3rkehJwbBgwoJt5l3ko
 6LBs09hlEmr5egt7EwrTmsX6Zh6yTTiLLGLWEwCZyjQ==
X-Gm-Gg: AY/fxX5gADpeSmabk4TC1RdwlrClo8jHVegTh05TMoCqZh8SAobFghLYL3/eCKSm5pz
 1/nnk1HRMdyzsAvgh7VDvI3vZXZUNIKlxKW48642mmuH2S+IzRpSTBYsx8XFwbDnb0E3dyKxdiA
 TAFdZwABRaCRMjQ7m1pGLPZU0AWqPHqZAoAigc/zhY4ufsJ831pCMgFF8V0kmxWOmx4NKZrN9wK
 J254uNWATiLWp0uqgRIaVBZy4LmTan3Smxjkfv/Xkgtc6kQyJNU9fiPvjRszv4wV7xTaM7HYuLG
 Er5nSGtytjXhujoZ8CNpjss=
X-Received: by 2002:a05:690e:4012:b0:644:60d9:7522 with SMTP id
 956f58d0204a3-6490a66cdf0mr2252946d50.47.1768491330941; Thu, 15 Jan 2026
 07:35:30 -0800 (PST)
MIME-Version: 1.0
References: <20251231170858.254594-1-peter.maydell@linaro.org>
 <20251231170858.254594-3-peter.maydell@linaro.org>
 <87zf6ww9fg.fsf@draig.linaro.org>
 <CAFEAcA-YDPYQ7mny_zFjgjWc4W8K18kUVuBgFbQ25sNpsM4Vvw@mail.gmail.com>
 <87a4yej41k.fsf@draig.linaro.org>
In-Reply-To: <87a4yej41k.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Jan 2026 15:35:19 +0000
X-Gm-Features: AZwV_QjB4D2lbqmup96-AwVb94MUvdD4h5wBDIKv3TOqeTpUTA6fGnau-GyfEHQ
Message-ID: <CAFEAcA8bF6p0RhT3X5RUNo-BjNy1mVzUwc_gKv0L45oxZiEi3A@mail.gmail.com>
Subject: Re: [PATCH 2/4] target/arm: Correctly honour HCR.TID3 for v7A cores
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Thu, 15 Jan 2026 at 15:20, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > If you have suggested names that you think make more sense,
> > I'm open to them -- since I started by knowing the behaviour
> > to me the names I ended up with seem more "obvious" to me than
> > they would to somebody else, and it's the "somebody else" that
> > I'm trying to help with the naming...
>
> I think I follow now. My only real suggestion would be to make the name
> _v7a to be distinct from the v7m profile. Although HCR.TID3 seems to
> exist for v7r as well.
>
> Anyway:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Thanks; I'll make that change and apply these to
target-arm.next.

FWIW, v7R can't have the virtualization extension, so
it doesn't have HCR.TID3. Virtualization for R-profile
only came in with v8R.

thanks
-- PMM


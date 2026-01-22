Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97952C44536
	for <qemu-arm@archiver.kernel.org>; Thu, 22 Jan 2026 11:26:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vispk-0002x1-Jp; Thu, 22 Jan 2026 06:26:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vispS-0002lx-9p
 for qemu-arm@nongnu.org; Thu, 22 Jan 2026 06:26:26 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vispP-0006Gr-Rk
 for qemu-arm@nongnu.org; Thu, 22 Jan 2026 06:26:21 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-7927261a3acso9809767b3.0
 for <qemu-arm@nongnu.org>; Thu, 22 Jan 2026 03:26:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769081178; cv=none;
 d=google.com; s=arc-20240605;
 b=GEgDc/cdSKysMR95Qpm67+Ce/htqYIi+FwMxx8QMU3gIkPxp/AkPN6XFiRsVYMNE0X
 n1V6kAGl/jk3tZP092w0KOqkyvkH9LbS8Io9jx/0Ok+Qs5+xu8kX5XitRl1j+IjoA/59
 DViiaU50qKOmieQz6iehYfIxy0tJ+OAR4kDQbwB3jillSM6zCzk6GbcGFeRCjpgmmj6v
 sOXHCoXUhI9ckqOad3mZKhPeJPwh5ex0djXPK9zcdRx76ED2HLVO21dAGafwvqAG4VCY
 PnrD6xI8W+D7Np3tuKWj08PhH2KTo8ecY0d2ujWmw2Kve4sXRtIr6VTJyi5qo6H1zQhW
 d2gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=rgEvRkwGXbRvC0M7mP1KpwNQ5+3DO4/lNkgAX/APsq4=;
 fh=WY7YDmUZSeGmK+1o1YXUharjNNBJ50sD2/4y5CBbjYs=;
 b=c+9+GCvK2swqQFe+Sgn7FRiq4fRU/iwKAEjyP1r/7eJD95CahVNqyBAPCCNj/bJIcL
 1JdCjbCpeWSwpiRiX8GzazuoPX18f6zn/QSprFrVlC6h/wtDxXB1mZN0QzoSZDgAAJ+z
 PckHDJLWha/NmPBsRRsJJa5O+xyzROEoZmBFADvH5nS6OIGbMke3WU9zCvvRT5BhU38g
 NK12lUJEoJDm3AHHYNOl5kTLWzopyubTk086sXloKEDA8SApy++OKDcROAJ3cCvtw1bV
 F9IEFPMRSlRiAumxgytrsPlaYfL5r9V/E+GLO26Ocudf+56x/96rRRK4+uhuNcgZ0xGx
 dWqA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769081178; x=1769685978; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rgEvRkwGXbRvC0M7mP1KpwNQ5+3DO4/lNkgAX/APsq4=;
 b=XIE3c8sYVK4ZLD6eAEFRuxDDb3XJ8L3q69qWoRPQ5lBAfQ2WZXMEF5cl7uFXG0rymL
 BKbFLtm+t98Tzl+lJnFK8gig70ObpG43jIHWSZhJUj9nie/OLD8VpdVlptPzi9HE3zID
 JwGIo3D24spTqDUeGua1RgOkEy6F2n9RwLfaQNAWKGQZMHctG90cfTJrNjuaarhu0vEh
 9QQ1nVyfvb9qCS6ilq1wbpXXWE1KtIiLxR1BPeN9beB1aSFdMyF/mun5kxl8OG7QyoL+
 SGsg4pP3V1MOfjxkpboYPO8mkwr1ehocpyZaeOBwYqJrcspCdCCuY7Gz0dA8t4Vk0uGA
 oszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769081178; x=1769685978;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rgEvRkwGXbRvC0M7mP1KpwNQ5+3DO4/lNkgAX/APsq4=;
 b=GfLtAJ1TZFl8bIX9m2mNrdb+jorGNtYUTK1drwk0qv27T3oOU5rKio3PR/dKvKZloE
 EAFQOKwV9qmEyq+bvwJHhLKrpMXKmDMiZ16un2vH9AqqZsO7LIxTcHfQTI0AEaq6HNtB
 Qioz5jQGs5zyLLFJnvTXFwk25hC+L8iHVIjpuxsp8IdKBaGjEzmyeWJhzkhQzXys/h9k
 REq8b3jX9l2bMv1E9ZcaeqDauc+Bkg0PwMOd7OLmXUcv5B7kOl5SX4um2YmpK7rI7ZCe
 Gc2zcc5uDT2TMO6bnVxd6Fz+OhcHRCAIKobyJYusjd0OEKPXXGJX72hJmnOdk+1XmCWc
 i7NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcxidiq8ncXkHxxQ5EHzLgDyImIgUBKREAz9AFmF7Eu93ctfpAhzkAJjwWbr+3Lk2poTOLhqsCEg==@nongnu.org
X-Gm-Message-State: AOJu0Yz/az6hVIBQyF/Bfwm1qreiYPZ9LCJtrumrw5dI7zlioF0qTYRc
 JbkVn6U+Z5lar0SEfLYUffy3qW6bUOy1t4vbyr8DgdXHixkQDIM+RNHXiDtF83etnXmxsz3hQT3
 DV57NXrKYSGEM2LHMdDSgoCMxzIPnzUNv6IB6VD6EgA==
X-Gm-Gg: AZuq6aJ2lHd+VUcTHFX8bEX8Hy+QJ65qjS9sY0YIxGYQKRNIcJnVYGo+2K8CHFitsNk
 mXmPYfAQKRo0u7wgtZyY2Ky0ZGOfFCZmgaJyHdqv1hqhQ/eJ/xGDxSbxBDNq/tvZoPKCuod1Lep
 ehC2QFLwLvZ0bhP8sQyTBXYng1HkraSlD2B+PY1bwj5lbcAYiBD7yPfYC+1cyMJvA7s3ewqpCt3
 MDsx3QCHD2+2agUSmERIAoUcNmpe6+mCqwur35VKsGSh33taG1tJ/wIT+hcDv1riQ08Ig==
X-Received: by 2002:a05:690c:3701:b0:794:35b:af87 with SMTP id
 00721157ae682-794035bb38dmr75835117b3.63.1769081176391; Thu, 22 Jan 2026
 03:26:16 -0800 (PST)
MIME-Version: 1.0
References: <20260121105932.135676-1-alex.bennee@linaro.org>
In-Reply-To: <20260121105932.135676-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Jan 2026 11:26:05 +0000
X-Gm-Features: AZwV_QigehipCatmEcqYer0yuU5Rag9xnEYyjpgG-Gw1DXFzh8ruUV6KeOCYYJk
Message-ID: <CAFEAcA-cnf1Q4VU2xOpukc7D3wYrxJ6U8hTS+Yme3p7EzcmsJA@mail.gmail.com>
Subject: Re: [PATCH 0/4] GIC DEVICE_LITTLE_ENDIAN clean-ups and potential bug
 fix
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 21 Jan 2026 at 10:59, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Following on from my RFC on Monday I have split the
> DEVICE_LITTLE_ENDIAN changes apart from the corner case bug fix as
> well as updating the other GIC regions.
>
> Alex.
>
> Alex Benn=C3=A9e (4):
>   hw/intc: declare NVIC regions as little endian
>   hw/intc: declare GIC regions as little endian
>   hw/intc: declare GICv3 regions as little endian
>   hw/intc: avoid byte swap fiddling in gicv3 its path



Applied to target-arm.next, thanks.

-- PMM


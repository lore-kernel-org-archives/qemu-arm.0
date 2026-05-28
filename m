Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058EDCD5BD5
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 16:06:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSdFF-0005ZS-Io; Thu, 28 May 2026 12:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSdFE-0005ZC-Vd
 for qemu-arm@nongnu.org; Thu, 28 May 2026 12:06:04 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSdFD-0005fB-El
 for qemu-arm@nongnu.org; Thu, 28 May 2026 12:06:04 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-7dc18e2498bso16543817b3.3
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 09:06:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779984362; cv=none;
 d=google.com; s=arc-20240605;
 b=I1m4KQBKOpnVqR39aVRUGQAqi8SSuekfHjEoMY528bvvo26ydbQ1+sQxp+nWDJpYUc
 klAAUtxRhSAx4sFeIPX2kAlRUzgrwJBvaC9xMjjT+GBX2x6HMiNrfoYNxG28MrDRzfB2
 OvNpTHu1EOsfE+u+DsrXnS6bKA5z9B/oLJf5HGDPcGNBTJHb6O74bOey5iamPBokw6S+
 2lbUHACZPpbMiQb+Y8lwMcDFPrnja/AuVH84XT3ttg/H7AcrJGVcvckMu6aeJDcCZhEn
 0Hw1WEOKr+nSw2KYFEtV4GXGv1NYLk3WhSzs2qeFPZc/7/v3wGm9PWzKqyBtT2yV/Jc3
 itEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=3WPDyIonSBCgGlVYifqoCBmZfz+ZrP/eDqswI+ER1VM=;
 fh=HEddDFrm07u+fu2rPuunlx3XhDBjp+wnm7gZ2qw5LLI=;
 b=DRHcSHTn53IIdc6ZkYhiarhJSKfiut9z4xvV4J7OgalLL6jeBl/XGQv2u3v4UHo54+
 k0u14s2dOvhKHDharM1HuUic6csn8Br2JCsZ4J+wRiC/2duHhlo9r665j6YLVVuPiJ7V
 dQ/SZkfhCANpIlLSzolif/JbJHpBpKR0OvKRT3MQfKhrF0+sPtdNS74p6ge5fJC8aJJV
 nXrVVA9426fbAR4J+JKlJZkzBYQy2S5gL6DBbSeGEdw+kqJ3A8pA8aN7YfXQFgSB/TFN
 dXwFIWE/eWdTu+/+YSecqWFtiLz0S1Ji23xmuHTprvLyzxAfBaCEzw2YWQOhEcLYh+YQ
 i+WA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779984362; x=1780589162; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3WPDyIonSBCgGlVYifqoCBmZfz+ZrP/eDqswI+ER1VM=;
 b=ee7+NDaRhxiNCcD8CMRAz7DDnl8s3LwTgY0BNTFDU34Ry6i31G4GUH9GPgq+5sNl+S
 P0PcXnUpqqRWR+YD8tNRC9MuPKyH+pKo3V/NezlXVyoGpB+0yv/KJleZUYJNoZIwjc7/
 LnisVVpdtt9n1T+DIqQktAvCiIB7iv0X+ENMJA3NXdNqyLnvAnJpRpG8EywsxrrEIdM2
 2ahfpzdQM8Yi0x964PTH9emnnzhzXNlYNp9h8do7osHx3H9Zw1ZxYPpfJqSUEi+wsAM8
 icgYF9CD3CZ3v9eiqIVRMr0k5mLA+3kEdoFlQ3R4B71Fn5qPrPfj+C8+nz/fh9kUXDZF
 YENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779984362; x=1780589162;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3WPDyIonSBCgGlVYifqoCBmZfz+ZrP/eDqswI+ER1VM=;
 b=V1OEXM/z52KP1MRlWMOXSHdd1UnkcBtyvWGvKZapUoxk5/axZdbT09LzI3UWUcg5Dw
 X+nRPjqbXCX90Clbm0Q6wvbihZ2l5CZL0LE/r683GoNsQQgnIzTCz8WP/frpwJ/Jvezk
 y5S1RyBlvU/I6iOUIyOuIEWdSl1aCUxYrS8G9ofltBwvqo+ATbzXKOTFS5gwMJnGVW3L
 bgU+d5IZswlOJRF/Vh8vilL6EOpK1nmM/TaqFOmBckYUT7TnYhgsExxJ2f8jwJLBKzvh
 62WX1OHBb6gn3UuW7t9Q+I+fZcsG2fF8pOGs5AIhW/PB/AQGUBoD1jK1v/OjT5sbOGKp
 cpCw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8AAyEsmPl7bQbGy3exu8iZ4VMIANwAoj1OjdFxhSB6C4UbCkQopM4gWsmwHp3t/UNz5aerc9w44Q==@nongnu.org
X-Gm-Message-State: AOJu0YwrVTDcsnufHQbw/j7leRdpwxgTlp7rsB4wwiSmw+3I1Rf+r4Kd
 06zALigLkN9pGTeKxP9+8yFt6VzUUjr9PHU5Ewe85Dcm3LQdig9IiFJTWL3T1Cvl+Iuj8sMokek
 fXVD2JtPIDR8a3MGWa4tSJ4p7KKE+Us2RsHxR9bFW/A==
X-Gm-Gg: Acq92OFcDQyDsklo1hujVP6A6qjQLGBmKIfG1v11CBNepWAU8aAsLAJzpCoK8+Owwt6
 UqS87TW7EisI3IgGHM/wMHOSf5PpCzu4ftU6F59u9pwk4P4Ek3kJ5t8rT5iHhwGs0w2DPk0aRMs
 gFPZit6HtL4xCJ7gEn1xOJ/mG0MJaBy594ly5XxqnPGy4sUlvyk8bFKXzfE1n11OsQ8iWYCg86/
 5i8+8RgFuyqFTHQX8jvaXoWU1yQFlGNR4rxZzPm3tHJ4+/6TUxJMsyQix0jCVR/eboAhqrwTOKo
 9sx1idtnu4D/lM+tM43nVEVHG5PzTJsEgX5jD2+gviJJMkNxU+fp2YB1tli6NlQwwdsKkn9TjEn
 hnFlU+BpmbT+9
X-Received: by 2002:a05:690c:368c:b0:7dc:2f45:d036 with SMTP id
 00721157ae682-7dc2f45d29amr46894057b3.41.1779984362125; Thu, 28 May 2026
 09:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260527114320.1581552-1-alex.bennee@linaro.org>
 <20260527114320.1581552-2-alex.bennee@linaro.org>
In-Reply-To: <20260527114320.1581552-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2026 17:05:50 +0100
X-Gm-Features: AVHnY4Kzu_yhLWNBW-7DlJzmuj9Pp4fD2a-EoJBaUpYYftjQUzoGD_6uwx3F36c
Message-ID: <CAFEAcA_-rY7A0Q2GZcFBVd4WOn8S5TXM4kaAnz_Gzn2wHLnikQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] target/arm: fix WFET typo in syndrome
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Mohamed Mediouni <mohamed@unpredictable.fr>,
 Pedro Barbuda <pbarbuda@microsoft.com>, 
 Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Wed, 27 May 2026 at 12:43, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> A stray x slipped in and we didn't notice!

You might mention that this didn't cause any actual bugs because
at the moment we don't use the "WFET" enum value anywhere, only
"WFI" and "WFIT".

thanks
-- PMM


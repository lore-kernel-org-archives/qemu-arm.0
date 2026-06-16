Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFFECD98E3
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 15:04:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZVKm-00086Q-91; Tue, 16 Jun 2026 11:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZVKk-00085z-GV
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 11:04:10 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZVKj-0002aK-2u
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 11:04:10 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-662bf1dab83so778911d50.3
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 08:04:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781622248; cv=none;
 d=google.com; s=arc-20240605;
 b=KiT23J8t1+06vTfrR8lYLnNSFW4fYoVmshxfFvdOwla9Js+0VzCLj/MeMlxYUg07J6
 2oJmCncpai9L8V32Tk7MYeXVhI+jXgETGyJs2RNvDeuTHJsZuI+R1e7dU5Ee5Ix1aSz8
 ugHVOtVkKpknKVr/68MLlWvD/FiNlC6l/jL3UZE84J6E9EzI6bPqQ3yNXF+354kCwcbu
 GyC5wNJX21vlCXHVuKoAq0FaDMV7DVfPNZK2Z6OXJd/3LdXa406+UTdPKlpB6J2n1a3r
 4T25NJeKh6IdO1JWh2FRUiREBTP7GkvO5sSK1NW8F1NefNfvi3sk0ncUPb7CFzdpfAFT
 lykQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Qc37mOnJ6NP0Da6Jmo2Tol2sFJDfI2JDHyuPKZJfqN8=;
 fh=QQLIctGiIOy/Mi0MOut1HEFX5JqpaCxWp+yUS0IS+pI=;
 b=Gzb7ppSVbEpKbyjQtSNahAFLCqrw0NrWeWooBpz1uEJFLHMEVAAsELeR3Q/rWDcLZS
 p8RgjK9oP+zZkLofVaah8TSju9wF6H2Z1JztseOtnu/v3Q3ddzPibjhvHeBE8AI6eLi3
 SQcSjQvgiwN1Ix3PwH8exvalPw0gfzm9W3RkQRGMplarvpSIzee90+1cUIHUKamrjBVu
 o3SU0uimpIAjMctPF2UqYct++yA62YPqJ9IhCTsCdze8qSn3Jd1zsc418skV6Qx5mBS6
 ctAoC20bAmQjmohK3eMojPm9Q2lbMfRgUKMIX7EafqhVazL0iyhoXDMsIM36U+XFRwws
 wkHQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781622248; x=1782227048; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qc37mOnJ6NP0Da6Jmo2Tol2sFJDfI2JDHyuPKZJfqN8=;
 b=whejmiiDxjbPrudV68b+eEdKFEStsEQlGK/q9C107+2M1Dd5GNa4t+YXE1OV60+3J5
 lvtD3tH7kHAbp+d2fovVMKXnt679XpdQ+N4HR/rrWjBt/9ld52x+ishB+tMajkvYL4i6
 3UZZfLeTF7i2F3B+aoNvN9oF/2Dh4RWjqF7nNIQi4JNtTyYDQWKfOBq2+v2zzwuTDt3n
 IkkGnX2k7vdpCnatUfx6bRspiDYAJigv2mIcnwM1lrSkX7OLmAacsjngxnRHLjBD2DMx
 axSVIOw69RutI2540r2KG4giGR1zWkTiMW6zRqKvWeTkGDYPFGFqO02HCcg7hDM1BKEZ
 nXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781622248; x=1782227048;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Qc37mOnJ6NP0Da6Jmo2Tol2sFJDfI2JDHyuPKZJfqN8=;
 b=XChem7zixzdFilFOsgHP+oU08JiK68ziXMCOd74GBI0M6K7lu/1fcbQ773E7PYvt47
 9UvFTL7KDUSAkRpkIhIDBUuuDuYkjmJtVAJ10vuSooF1I9dVj1R+UTbbxjp/GpDcWz36
 bl6s+X30Ea96+ep/D6y76KXItYWUovowy59hM5qUm77UQ2OqUhA1CmArfvAqfpSHnFzu
 V0Yu0tIfLaVcKQMvVHI/KQmByvwVoLf6L43+5tcuMsaMY/9KMgog1/7um1sdU/l//b8h
 x6y1lNKOinBz6l0guVQsMWKgHL8CWsaucSkMTpNGquq39MlifiddkPYPVof8aYxNBA9Q
 VcAg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8o5IiWkf9v3vNR1X25JtAV5f2sfQrPxcj+EWLl2LvNicqA1PJBlevlk+z35icKUYZPQENbCTuLnA==@nongnu.org
X-Gm-Message-State: AOJu0YxomOKq4YQqpDGcRR9hV/8bgS3XfbXgbhXXngmaX7Y4AATUn1UC
 UOKSm9Tn14FE748oDVjco7WRzieD5Gu9boPC7DIlQoE9dU9jJoVhVRQGlxW3I/n8+7CUwgF+T6c
 4uU+9LNj6Y5mtTcmk9rZ5tFjRIFSOx4ZZe0lV3Ab5tA==
X-Gm-Gg: Acq92OGV3jJC+IeI2r/S3UxJxpEorJ1J2XXzL9b6TfGXgDWOqCUYtjCo3rOONGI+AbE
 Fl4f2AApFFG5UoaMAh9LBkx6pN+5+Wb3QP77NgByn/CP7dxJbKZyFYdaCc049kAAHVPc0ADzGHx
 M6YEE3JWpNW9fT0AWIA1wIsiITVfOlMFgKM6YL1F6024HkXGj4Eq+WZSWSal1n7ZemxbnV+mg3d
 sNB+Jt9E6rg6Rs2YHBD+fuJ4APJHvE2+dvYnHdNtU8KzrsgaF6xUK1jXcY1Rt2dOnVlJXnPmSwR
 6WT/GbOU09pSShdo4rn+j1X6oebwrEIiDdEKBX1wAPPlYd4s5voQjU03ygRkzXT6VaQ=
X-Received: by 2002:a05:690e:484d:b0:660:5694:9e4d with SMTP id
 956f58d0204a3-66284f8c462mr10594077d50.20.1781622246143; Tue, 16 Jun 2026
 08:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260609024027.22140-1-nicholasrighi@gmail.com>
 <CAFEAcA-YSacshreh4z0Ld7pYdqjECsGxHmkfBrKgQdVPqHVPXg@mail.gmail.com>
 <b246751e-da58-46c2-9ddd-dc48b9b1284f@oss.qualcomm.com>
In-Reply-To: <b246751e-da58-46c2-9ddd-dc48b9b1284f@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 16:03:51 +0100
X-Gm-Features: AVVi8CcrlM6gqKh8FVBffKX1gWEScvo0BOgAK19E9CsAMnU-Ei_m1S4-J0mpnvc
Message-ID: <CAFEAcA9PObTXRKQEzh=KtRQtYzY8wan-3ROOkOg7PBfc+Z75bQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/bcm2838: Route I2C interrupts to GIC
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Nicholas Righi <nicholasrighi@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Tue, 16 Jun 2026 at 15:59, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 16/6/26 13:10, Peter Maydell wrote:
> > On Tue, 9 Jun 2026 at 03:40, Nicholas Righi <nicholasrighi@gmail.com> w=
rote:
> >>
> >> The I2C interrupts are only routed to the legacy interrupt controller.=
 This means
> >> that for modern device trees that use the GIC, the interrupts don't wo=
rk. This patch
> >> adds a splitter to route the I2C interrupt to both the legacy interrup=
t controller and the G

> > Applied to target-arm.next, thanks.
>
> Too late but still it was in my review queue:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>

I haven't done anything with my queue yet, so I've added your R-by tag;
thanks!

-- PMM


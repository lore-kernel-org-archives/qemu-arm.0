Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E372FF8861
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 08:58:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHHnH-0001fr-4E; Mon, 27 Apr 2026 04:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHHnF-0001fW-O9
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 04:58:17 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHHnE-0004ZK-6w
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 04:58:17 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-6563f83ae9fso3718306d50.1
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 01:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777280294; cv=none;
 d=google.com; s=arc-20240605;
 b=bQ9bFHPj/DohHviuVV9IPCIERE34sr9Qt8e13P3N7Tg0xv+6ViElZEnlhWC7NITHG6
 s+sXc5luRjw0rSH9+rOUo84+YuIJMCkrG/1CkddudcpXjhbcUHyt/0+hN00pATZNE9Q7
 atWJ9WqEqIrB5zYrPkeRKRj7Iu6t80LVkBGAJqLJSF1grm2dt7FuD6RIxrfe5c1WodkC
 EwR8tpm4L843yZLkYgSKDt4GMWpZTUE8FdEsIobhFwfh+izQSiA/O3WgBx6fIF/RmZee
 KpaRCNYq1dh8lY3c52Sif0Je85gMu13wCTV3iR8E9s/6fUyGB3Z8WUCqMhAGZmdeOhT/
 B46Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=gGYUzp9buDQOti67WGxT2EMWbPkkEoKE2zmm1YvBsJ0=;
 fh=XBKIzy/5olOcuvKrlflTaTSQ7Pe5HpMEfUPR6sTW3v4=;
 b=b7W3sQsf1TpLGVrSwmNZYTqiHB0SNNp/9nz+QoXNGhXy76fcDAEZNvbiV49gWitN4L
 /Y05ZHXoQndcS6azu6kvJquFD2PhVkgaYfGsNC8+MR/ZX8HA+tFejen2T8KqzTpy4MeD
 JNshBKgvj/KZK5m0tuAj55yu3ZPVH+TpdsJeRy4TxSH7vym2KGuQxMizBRsFvXxbQKnj
 iXn0JJK2Axx4Nhxu6NHlzMFGtFBI6lPTAo9n/sT7SUzfF51NCOuOGoTyzVy7E1lxOZ0Q
 1XBgnrVkoSLWgwhqWBwEQZhAlgydhLFSvnLLDY6WoOYkAy8mMgo+u4sUAhRzMqbDtOpR
 W7Jw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777280294; x=1777885094; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gGYUzp9buDQOti67WGxT2EMWbPkkEoKE2zmm1YvBsJ0=;
 b=quHPKs62Dt+LCpdsQFzyLClAMt2cc3tO18phzFnA2P8QeSk0LBQmCqIzD3JJpQpYSR
 XJCI4JrPtK2dlFiMuSa5mCmU+sSXIobufPIICkgYPCTM9b5l8sWEDtwFj0X/Z26IeLhV
 ByLOAZUwbHvK+/GewXtKq9qMGA25AX7dANUhmK3n+0eRBpSV23qMjYMOJoEdN3bm1J8M
 xcG9Rc3aHi3uWl6DIDn+OVOSWxo4H8L/ZOMmYFZmNWHpWgzl413BHr2d+k2U0ZcSzB6s
 4lOu4ZCjzvMNRZjOqdTa2StKQTtZA6VdxqcyLygiGmuxLDnq0199RFT1jFdyD+6o8pgR
 DjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777280294; x=1777885094;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gGYUzp9buDQOti67WGxT2EMWbPkkEoKE2zmm1YvBsJ0=;
 b=J2vtngr+0LIpJT3Wv3/MuS3ywpw8iKYI/Hc4h6/iF1s1Qr66otf0vC3w5qkNl9b41x
 BpCp3E+fF8aDtlHzQa1cY301jr5pZfF1a0Ym58cCh8nAzoZxTcmbVXrD6jSn/s9J+fFl
 x4qu9xJyTSyvemHHVnC3P4UOGzPkKhmA+HO87BZlDpN2Ck9OYsvb9bUaCarUXJ2T4q6N
 FAqnZtT5TTC8ikpQFO8UXqxLUHtqOeVW9UBgv9Cc44mg63CSBmEBXdkU9inFPSDjQAF1
 Kefid5Un1nBzOv6oShhB6M3U3yT/Ewz+zcQ2XLCBHyqQ0oy5wFGnw2andAdOciy3LLdd
 e2DA==
X-Forwarded-Encrypted: i=1;
 AFNElJ++AOAsFKs7Ho+Y6jCaJLBOFn55N5smW0QWOUND6drcK/1HZppghkbGrydQ1zjOhzMGDrKsz7SFhg==@nongnu.org
X-Gm-Message-State: AOJu0YySZIb46LfYOupDi8CKvSbrkCWPa2d+nCN3lcNO6ZEzEALYafj0
 Xn9P8GeAh2kVp7c95YKR9yK/yS2srMmOxPEWgbV/uGrPJWF/erkhlaGsoL4ZC5AOKFaSYP8VITL
 i7J4kSGXWdItJBiqEwiM0HXo87qSdsja8H3oeauPGNQ==
X-Gm-Gg: AeBDieua1yyvivd9Z0yhkqAAA1Stcr9ZyIFptBmqLH/9SFq6ZMqQOujYSXbqwhLa1sh
 7RfeUl1JpkfU+LysvmOu9gIVLH865Ft2j05dCK7ecuy/2htRByAreEAPk1Or6HJuVRFN6121zPk
 FCKbvuICPkvPLVML+nMltLtnoCdZ1LHu+7md32UzN8ni02bKX/eMqpNgZ4Y2EU1nECGUE+ePf90
 JiPD7tTmwEnANMB7Wo2uYNEBpOogm640gyq5KOnvvNRBt1n6nXM30LgkSKAHI6qyPGdCqHIcBuR
 BO8qUfubYFx+2QynUUwPEGsJJTfjP7cyNlM6WZf/Mc6ZL1xWn+dFflse9DqUkG5JvyRr2+z2THR
 X+w==
X-Received: by 2002:a53:df50:0:b0:64f:c830:1e45 with SMTP id
 956f58d0204a3-65310afd6e0mr27530851d50.50.1777280294200; Mon, 27 Apr 2026
 01:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260414005348.4767-1-philmd@linaro.org>
 <4a4ab25c-aad9-4383-bf39-00a22cd5d287@linaro.org>
 <54fa03d8-f1cb-4510-bc57-e18b6a048cb3@linaro.org>
In-Reply-To: <54fa03d8-f1cb-4510-bc57-e18b6a048cb3@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2026 09:58:02 +0100
X-Gm-Features: AQROBzDAPu5zehDOS6TSeVrWBHRuLcJqW_yLhnupRvMAJtB_vFlW6cUBXoJKd4I
Message-ID: <CAFEAcA87F45dRkDrmR8b6wihdHMiiCWxqLjoN9U8rqk7jWRCqw@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] target/arm: Remove MO_TE to compile MVE/M helpers
 once
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Mon, 27 Apr 2026 at 09:15, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 17/4/26 05:58, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 14/4/26 02:53, Philippe Mathieu-Daud=C3=A9 wrote:
> >
> >> Philippe Mathieu-Daud=C3=A9 (9):
> >>    target/arm: Ignore endianness when setting MTE tags
> >>    target/arm: Explode MO_TExx -> MO_TE | MO_xx
> >>    target/arm: Hoist MO_TE into mve_advance_vpt()
> >>    target/arm: Hoist MO_TE into MVE DO_VSTR() macro
> >>    target/arm: Introduce mo_endian() helper
> >>    target/arm: Replace MO_TE -> mo_endian() for MVE helpers
> >>    target/arm: Compile mve_helper.c once
> >>    target/arm: Replace MO_TE -> mo_endian() for Cortex-M helpers
> >>    target/arm: Compile m_helper.c once
> >
> > Series fully reviewed.
>
> Checking as of master=3Daa15257174d, this series still applies cleanly.



Applied to target-arm.next, thanks.

-- PMM


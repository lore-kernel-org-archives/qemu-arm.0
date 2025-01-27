Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2452030njk;
        Mon, 27 Jan 2025 05:57:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWY7HPQ/o2gn/Rlw35Q39iL8NeRglP/vaUZJ+wBH6EwkLlrg5TqE1BrNBgwXuYMHh9mWAKLGDpfcBl/Sg==@linaro.org
X-Google-Smtp-Source: AGHT+IEfOh2qgjdNjPioS/gh5/FiraXQYWl0xxg3pPm2aa1QEI1Bc7rnaPACMtNBtdpSUjlSjKuZ
X-Received: by 2002:a05:620a:1911:b0:7a9:ad65:f4a1 with SMTP id af79cd13be357-7be6320cb93mr5943097485a.26.1737986238629;
        Mon, 27 Jan 2025 05:57:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737986238; cv=none;
        d=google.com; s=arc-20240605;
        b=BwEdOuooL0jWOY11MgyMB2mghV4qB+V40hLuaP5tOLX2roU41LGrHDWAFf9n+kCpVE
         hY9wheW1Lme+QteRodDI3Ph3I1nq6Scc3Bt6N7mnOX7UqOBV5wQ/OpEOrJwbXuOnBiwx
         7Ks27PcedpFWKl8psjGtUPd3fcU2EA+deUK6YqOSyzZaWYAV2RI6bCjttWgvIBr9uQDD
         5zAYF/N0CbAdfCLze+H/y8eRUfWRpb3VO60melax0p1LxZv74wZ5W8wOuHmCmHLqu70N
         JWsZQP9c12xCAgiWcX/Kz8tHvJq/mNA9q/qQJYtkul/6tB+RUemOSzK/CA527YXRSpuU
         OfWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=J9hySiJuW7zJ5/L5A5U9aPxWXWt3qzANoVEFjcetJ50=;
        fh=AYF3O9kvTY9ZRi0UBpz//VFFlj8ttJHxqP5l5Tk/ggU=;
        b=icWA6YlYG0iFT4HFfCjaruq/RBuMpvkI1XMUCKN3NKTjyT2LRhQlxMFNfY3r7BKS4Y
         GJpnzmqRbpPeXBytU3inpopLXdDFvaGPsJTb0la808h4LVujB1n53DP4Xhg3Y6LbkH0l
         mRRmfJUz+63HApZOrqRfSRBTbAx1wlZNUVYhkaFYsigToiDZ5oP4bO5pu4Fo0OUBoN0v
         mJG0GcvE65hYv/qxV5Lc3FkYXRHw7+g+QZiPs1dcslCrOB9QNoLxzVyVenlyBDCTCBNf
         Jw+tDbbtI5Q60OysQOk6S63kyu2T7Cgw9Z4gVv+ahSUhvqzYQHt3xR8UGUxuKFUSoUCR
         OIfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wpiYnuGK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66b6aa31si95422481cf.204.2025.01.27.05.57.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 05:57:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wpiYnuGK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcPbv-0001Z6-BL; Mon, 27 Jan 2025 08:57:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcPbs-0001P8-3r
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 08:57:05 -0500
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcPbq-0007gt-Ok
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 08:57:03 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e573136107bso7204470276.3
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 05:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737986222; x=1738591022; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J9hySiJuW7zJ5/L5A5U9aPxWXWt3qzANoVEFjcetJ50=;
 b=wpiYnuGKylzY8lgWFFF5QO9WQsgPaxCE2/QhCFmUbmN4dVZE/WJSLOfM82G5RFYmlP
 kCBlHUOFzreBYku4T60ofSncNPbtWOoK+OPPpVkfh7+Zwaxi2f+Ag8Nz6wGQmvbXRSIh
 srSrFEBoLdELSrMsK3Hqa5pKCIOkA1+iU6guDoug+u+oHuVAgDTncioWFGyMb0oWvw2a
 a4mnxHmwOcBcybhPVv+4HzS0RUZqrJJiHOGtWJnEd/DM8qYn5zMgPpnWe3EFBiN90B72
 WMIfa9gTDUINmWgf6bKFruLw9aSQfR6jL6W/I5Tbfjn8L2lhTeUiaqUy1XuEb3wRwlLI
 bMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737986222; x=1738591022;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J9hySiJuW7zJ5/L5A5U9aPxWXWt3qzANoVEFjcetJ50=;
 b=k9a4Db58bZ4wNizIFFbItnEdqwB4aBqujCyF7d+FVNR1SooJh6NpmE8HxTjo14ZqA2
 1dLjO7jY9Gk7Y6EEvXNuGrsn08TzLMG2HyzL3P2pj7oknTALbJcJmou69owq4J4ytiU6
 ottSSMW4DBKRYTcKBc87hfhO5ViGw6+Leg74HZz+n4ug86LLqmlVDtqFnc6OJ+MOJClZ
 rDtDGFz5IFgoxqW7GXonZyT9FAzlt6vi4I+W8nhykRwDH7nO9DdmnV9MTyVdHHcFRRzJ
 Zri4E4YCujMmbS3/xPfDcRNkua1U7Eg3hCbgGseMF5aoP6DioVHzf9nCx0whjp68MY7f
 eQmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXo9WQH2xONMi/efQGbWGfD5KyHGBNHb7KvXf7FzK4O/FHz7LNfVknzK5CdsIOXPUK55ABnncPQeA==@nongnu.org
X-Gm-Message-State: AOJu0YzELYHV6n5Fj4kSfe/Fc6Nc4vj5LVtQaj3e1k40Re50OJT+Xf3s
 tphjFvsGHe50VoNrZNlSMqqrpcqaTS1r945XmBIf2eF44kIo2agweD4VkGkjkLNUjSUDvyy7EJt
 fQezvrllAdVQ8H1LWU4f96MKqgXXalVBuo7wIHg==
X-Gm-Gg: ASbGnct8DUFaC07uNedDSWoKZVmSu8chXucs9YifUb0gvSmO7pES8pq8bW258t1ga9F
 MI7eqYThfN/4GSCRUHxEiD0zqh7PFLijCPgsnBd0mB72p87THUB8uyIODiXw+T9k=
X-Received: by 2002:a05:6902:20c6:b0:e54:ab05:4505 with SMTP id
 3f1490d57ef6-e57b134b2c7mr29199377276.44.1737986221878; Mon, 27 Jan 2025
 05:57:01 -0800 (PST)
MIME-Version: 1.0
References: <20250110160204.74997-1-philmd@linaro.org>
 <20250110160204.74997-3-philmd@linaro.org>
In-Reply-To: <20250110160204.74997-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jan 2025 13:56:49 +0000
X-Gm-Features: AWEUYZlmoT3WQRw0heBu9ghSDiwVJGz2t8pz8SKoBOzMap_wgGnTpDk_-No50qI
Message-ID: <CAFEAcA9pbN649LT0GrYv9j0AKQK++S6yFyvp6G_CgTnRhNr38A@mail.gmail.com>
Subject: Re: [PATCH 2/9] hw/arm/stellaris: Constify read-only arrays
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
X-TUID: C+348UJK0hVM

On Fri, 10 Jan 2025 at 16:02, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/stellaris.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A5EEC142A
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 11:01:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxNUm-0007Fu-Qj; Tue, 03 Mar 2026 06:00:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxNUk-0007EN-AS
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 06:00:55 -0500
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxNUh-0007kt-TC
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 06:00:54 -0500
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-64ae222d978so5154799d50.1
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 03:00:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772535651; cv=none;
 d=google.com; s=arc-20240605;
 b=eq4T7J+OYe3a7CNges4vMadz4oI5X/obzC1iZOBHlxwmQbxuGo3gtluigEJxs4HEj1
 0s1JVryNLDGlSEtHgbcWn2nxhZLxQovkl9LFogEjlghjXmjRMp1h3uQFZNxJoy5xoSzK
 56KvV/rbNA+dR0py9n7BWxuY2ZpCRSVojBsOxuLHiWPA+po1itOwnHvsvBk8kgpBvFVo
 ZINqE0RMuxxEFLrLyJbk17KkaewxRH4YiUkhBZDKdPZ2zjC9cWxOUIaorj/YNG6F3aSP
 Yw7kDIF2rJ/330y08UA4lFl4lQ0cqkfEvHkQ1DpKu7oeHF8goxGLXWTlunBzHe/gZktm
 SM9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=KRXX5KuiBMSHmvFdQ0zCdhWkb2TUDqhzUrzVLgt0l9s=;
 fh=1Hc/FZtAxpxVkvv07xlakz4A3E20NUoeA2f9ameCNhk=;
 b=kUCQZmzkE4fZ5cwbAYaofHexYs76wU0Ma0YKxpdnbC8rqLz1IYBJazHaPqI2Dd5oED
 G6QdKFbK0Vc1BWjgk7IhtSm9RihRum4gsKXgcvhniI7wamNVy6mxQdKnI6TD5BVE3h4g
 MTo7+plDygUtSjE/1VccgJC3Qf5L0S4Kk7/RGJ6ll58em+dtPDGPvfnLcxWB0vK3awg0
 Z1YQvZ9ffr3BYiWQjxh5U3WP3PCxYQeIPJn6MFCUEOIZL6MRkcbSAt3jH1OUsyWP0xI7
 ZO2mFIAfyl2QGm5xM+rsBTgk9083PIrzf4ns94vN8uVOywUEJjvmMRfHgMqpaTFymMdM
 RO9g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772535651; x=1773140451; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KRXX5KuiBMSHmvFdQ0zCdhWkb2TUDqhzUrzVLgt0l9s=;
 b=qarMesWrxVdtLFcXUwwwM6G5t9do5/MkD1mdIWvr5dbxmBijvq/7HkScpgpogfhv1L
 F97m1k09h+zALEGa02502oaAThiy38l/3ntpZtNYDg+ZI6OUkTxHOdSKmQCJyfRw8RWx
 84U23qkN79hDbrgpj8MaVAgPvnc1xCf6O03DQk1iRl6APHxGQXZmpoh870BSgc/aJ/fU
 TPDYB+YupJOgf5dZARKjC6aQ9LZGuYS24GjfnhpCabYkvWhuQ/XVW8uIKQJ24bpTb7w0
 jxsYazn9fUW7ROYVmW5yY/JfBYZejHGK8NkVb+QLjJgDKGJYSftJwqS7n62eiDaIH8fo
 fgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772535651; x=1773140451;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KRXX5KuiBMSHmvFdQ0zCdhWkb2TUDqhzUrzVLgt0l9s=;
 b=cgbEfGWU6iUpMdxaVi5RN1bHpeX/Sahvtn1x+BCS6sdnIiEpRh5u3MXJD/0YhSUUv5
 gbKaFHENu0u/8EZ6I02vEYWJVxzl5N3CoGYcFqIGhGXem0XvzyxReehhIluFG4YHZhqp
 RG74b+0q5oQ/FFcVj7152QwU7eUzY0kmdqs+Fk51db/60bYgc2RNj7K7bBT8Hs8Oh6og
 Y6EF9TGpeZITffAOBzfwRPB2Zo6OkjwdkJD47ETl0VvtoQNVrExk9H+gAp/gJNahOVe8
 6nQTCjIi9wKtOwlnbVUOVNJtbUIHJuk2KAo/0I8u+/vF+NgSnp+xJbaS8CztJxh3nwtH
 Xjwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5DaTPNz30dPlrVP+iSVeP3KaQODUzE0NrpwHn1RWN3w1OQMjlfL0gIRD4GyK79W4tP5szDNePMA==@nongnu.org
X-Gm-Message-State: AOJu0YwxLIvMVVAWihL9/33RFURET/rBw4lVqVTwaw8yDmknOMZGH/Mp
 p0RbaTl25xqzCDusODQHwKQHTGH0+dnM20020Ufi2CR3dUQiK0rX/GE04bc5TMFK8F8T/2Fe8m0
 NUmnr2dW63CR8Z2Len3c2nIUYKXrRaQ0i68nj5bQGpw==
X-Gm-Gg: ATEYQzyEZU65qWr2BD0aY6wP4aH88S05WunZQqUhKmsCP6M8pKYTHZiuV2juLfuUPB2
 bVICV1tGNCNUikN1WUshtmUd1nYMTrvuvUfUJGqgiiKoB4NYHB2a6P43UNVQo6YtFK5CvFzLds/
 fVf1Xgp7RsLWlsEKo3eUWXavTtp0RDaYdmGeSN9OfC8nNLEuJ4ry+ZgmGeh03032tVF942XsHW8
 OjHRG9/sgLd/QVVkn4A/vUK7x+g7sYEuTBjGpUjuv+dEB6YP18Z00uagRGNlWruD0Xbgd9/9RZS
 tIrqWu0t+owzEtnrRO63E74/o7YBDOHVilPPKsVP+gczrQXU4rBc/x+fr3LFpn3Nk/4=
X-Received: by 2002:a53:ac9c:0:b0:649:b851:4eb with SMTP id
 956f58d0204a3-64cc22100bdmr12924692d50.53.1772535650475; Tue, 03 Mar 2026
 03:00:50 -0800 (PST)
MIME-Version: 1.0
References: <20260226100232.500781-1-eric.auger@redhat.com>
 <20260226100232.500781-6-eric.auger@redhat.com>
In-Reply-To: <20260226100232.500781-6-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 11:00:38 +0000
X-Gm-Features: AaiRm53-Cf_9FKRbMSruGVx57MVL97vcyiHugiaXKNH23S8nk3oXycZPMrAckII
Message-ID: <CAFEAcA-_AGZK6fKZLR4fEKMEMqkE_nwe4WPA02mqryxF5fz7qg@mail.gmail.com>
Subject: Re: [PATCH 5/5] target/arm/machine: Trace all register mismatches
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, sebott@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Thu, 26 Feb 2026 at 10:03, Eric Auger <eric.auger@redhat.com> wrote:
>
> At the moment, cpu_post_load() exists with error on the first
> catch of unexpected register in the incoming stream. Let the code
> go further and trace all the issues before exiting.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  target/arm/machine.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


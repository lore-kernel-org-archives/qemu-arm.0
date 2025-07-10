Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40E6C83F1A
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 08:14:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZmQD-0006qk-1M; Thu, 10 Jul 2025 04:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZmQ9-0006p0-LZ
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 04:14:21 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZmQ2-00071D-Ny
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 04:14:20 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-70f862dbeaeso7432127b3.1
 for <qemu-arm@nongnu.org>; Thu, 10 Jul 2025 01:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752135253; x=1752740053; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1IHzzc6C/yZZS/WhRHD3wUKG06scagrHJZ+IrHZ2gYY=;
 b=vaiYy7bcri50ysGZzNosMhzMf4W285h38cQPMTl99xJHv6FZFNspVgjlsDLAFZsi+W
 RlqohDA/CVNUXv0uHygNPodYRaPwNLOi+osraVFrt21TYch+m3OuEMUjFbQFfa3xS7cu
 DEVX2ExNzAmLHicE4N9cg8rfjp8/y0i1ZKr631gC6VeXAJknK5l5GkXrv8VqhitYUEGw
 yZAZ6aFlMuLioQ3IwTwmB94OshGvIR27GERvPMKKKOo66znrJzvT8ZNhlTZIUfIgEYwO
 2+XrndLNGENEpMmbZsCVie//fqD2JrGvlPQfCMqRmxqnWWVKtTdf81XyyQ/9h3Tgz7Up
 sVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752135253; x=1752740053;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1IHzzc6C/yZZS/WhRHD3wUKG06scagrHJZ+IrHZ2gYY=;
 b=IkMLLFeOOTUIz5GCw+Qh0orUgaUtAkCIpB1vuRH+ptlW8PaueCIOsrAxI+ZIIGiBIF
 HMdGLn2p2FnDiG4OuiEu+ZjEGOCpUQcH3kAD9Ay5X6Mv06m4cN1eBcrHoNF5Jzse75/+
 4yA49jiQtRTy4D4myMVYPeRa2B25RPgQymO1upjHUMelEbFULM8PDZJalVrTRkd/eEk/
 ML1rtIMr6cBTVfMqljbroJLDAm8V86+HtyfC8PWhHNGqP9i1bCff9+1b5PmqJQQV40ZL
 O/RWpDT95YFkY5paiN1YCOrKbAZWfr0K/dUQHSel3PnLIv5IjzlY30RDLjNTfgBgR/Uj
 mxSA==
X-Gm-Message-State: AOJu0Yy/vKBn1vXsIotWLULYhLru+UIZshr0lycK1vB2n8iYX0Q91aJd
 CcwnJp+uFzwt9Ba9i8ml8JPZ4VjDj5+crVuDtrenVFJzu2e8m7Ywts+bt38TH1BTz6eXeWwY+Dd
 gnG2n3ILedo+ZG/uLrs+A3G48SV0/jKOc3NQMu3y2Vg==
X-Gm-Gg: ASbGncsGxh3CN6+DHVVqbcLYHdDIhbiBfH5ZxVERvpYiYP45oQBaPqgTrh9CNVIkE+D
 v58iDCDcumLHTQio3TlxQYN4L7MOBOp1xSzWJ2edPcqifZCMtLPAseyQ2RlPS55Lc6k7XpyAPaW
 vVXeRiMZtFK15Kcfud8jkgolD2IDZJ9TGp03+QQ07ItuCW
X-Google-Smtp-Source: AGHT+IEgRGMavqkmnEAh3ihnMRKU1o8ECFl81+banPmU9m89fL6tfb6875f+5JJ1n/NG+v7t34OLobrmFJyyH6NFw5Q=
X-Received: by 2002:a05:690c:6908:b0:70c:a0c9:c648 with SMTP id
 00721157ae682-717c1774a36mr42990637b3.19.1752135253020; Thu, 10 Jul 2025
 01:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250704141927.38963-1-cohuck@redhat.com>
In-Reply-To: <20250704141927.38963-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jul 2025 09:14:01 +0100
X-Gm-Features: Ac12FXzWdUoz8j8Zll5t6-ezJ1-6gAtg-cJJQOot_KDGA2xDn0vcyWA5YAWecfM
Message-ID: <CAFEAcA9yv-BQQ+3JpiaXpYf+gc0FVKsOy9Np-3BkR+UvB7Enhg@mail.gmail.com>
Subject: Re: [PATCH 0/5] arm: followup on the ID register storage series
To: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Eric Auger <eric.auger@redhat.com>, Sebastian Ott <sebott@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Fri, 4 Jul 2025 at 15:19, Cornelia Huck <cohuck@redhat.com> wrote:
>
> This series tries to address some low-hanging fruit on top of target-arm.next
> (move some more registers, some cosmetics; see discussion following
> <20250617153931.1330449-14-cohuck@redhat.com>)
>
> Also available at https://gitlab.com/cohuck/qemu id-reg-fixup-v1
>
> Cornelia Huck (5):
>   arm/cpu: store id_afr0 into the idregs array
>   arm/cpu: store id_aa64afr{0,1} into the idregs array
>   arm/cpu: fix trailing ',' for SET_IDREG
>   arm/cpu: store clidr into the idregs array
>   arm/kvm: shorten one overly long line



Applied to target-arm.next, thanks.

-- PMM


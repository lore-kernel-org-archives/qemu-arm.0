Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp390078ejb;
        Thu, 8 Jun 2023 07:49:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5btW8l9Jvb9asj9q89+PI49oKFGuenGqqpn8TQiOiQwDeT0EVQxUS3AHOMacAhD7PEzS1X
X-Received: by 2002:ac8:5c16:0:b0:3d8:2352:a661 with SMTP id i22-20020ac85c16000000b003d82352a661mr8246575qti.3.1686235798544;
        Thu, 08 Jun 2023 07:49:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686235798; cv=none;
        d=google.com; s=arc-20160816;
        b=oOqNCdTY599qQ6dRA+ANYAxsNbv6MJ/50usxrxuFTkfxEDYIUd3845wTsdLSE9rcYJ
         sM/ssOFjnc6ErV0R2vpJJnbymbPZLanEp9+WdbpVFsQXS4ttlr36ZAnOysBw5atxMY+3
         d0d1bOLRsXhDyMfxBggb3hmpWofC4yFyC6XPhi2sQ50EPs8nWfFR2+vkhfp3KxYZuNDT
         ZKZiC5PcEYhlOiHXyer1/nOiX37KqDR4Gyze3/iefDJPoadJPVCUQZC2Vu8kBJxeEodj
         W6d3vKLDYMkFrPhSlCL/VjsbRK2loQWmpOCdGeZX+3ol5BJbBQDf2HxieNvuvfkYVxG/
         hXBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ANx69dORteAsxGLIZaz7JrrH/qlIT+bmp6x2pLcA08o=;
        b=y7Jb8MrEqm/4IQZ9mxIIW8cVBfbnRPK8Vk+Uw1V6UlISi27maeVI53OLpEDYlsqSOF
         JEX/l38V/+NGunWD0pT8dLG5DYFd1JIxQ+F46ItXn918SO94e87nE0EgrCbpCOdjRnLk
         Q3v8PeJ6DcuQMSNDA6pEpv2qQDjiE/nxf2C8p4h4CbWPb6Df+UQiwGsBOsf1OsKMQxcr
         Ltmnv1ITUuKuheg6OIdARf1b4adE/DY3uX+SFNIz3JWwGD977aAyWXg8aN7tWW0Ud4So
         9U6nolk2Da3RnG3Ti4jufQ0ETRKrDNkbNd2Tt3JCd9QcNFCJGNaUMDKUdr7EebJ6OlHh
         73xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=neK0+fDv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e22-20020a05622a111600b003f222dd7bf2si701153qty.105.2023.06.08.07.49.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 07:49:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=neK0+fDv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7GxP-0002CO-RG; Thu, 08 Jun 2023 10:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7GxO-0002Bb-Dp
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 10:49:46 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7GxM-00017A-Td
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 10:49:46 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5149aafef44so1059205a12.0
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 07:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686235783; x=1688827783;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ANx69dORteAsxGLIZaz7JrrH/qlIT+bmp6x2pLcA08o=;
 b=neK0+fDvajkVAoBRVof0mlPU5q5XoO3xp2cFd+6Ym1TgcICvXPG5+JKix10xphdW2s
 8VsYznn3Nf3bGhHIm9S/0UxkVBte+6TQyRNSuAxweTxvt72gBChEbCw7eVHgXC1GNVkG
 865XUyqOH9cB3C7FtIsNqerY8u+7VCJUe1aRU4ze1en0LxJ6RC4xVs0D0wQKgQQHCylP
 RGQYwEqG5KmKEbmV7IKXtPbpzQxwdarj2A9MtkaO+L5O8EOa74r+4Sa3ZzKuIRj2aGBd
 VjkdGbZZxZFMjtN5UofjNcihM0kqPR2Uj6FiWX9g4wZxdgx61xPG1Sa747W67Pd7nmlG
 PSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686235783; x=1688827783;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ANx69dORteAsxGLIZaz7JrrH/qlIT+bmp6x2pLcA08o=;
 b=lAt+Wgj8ACBW2Y6Gm9mrIK8atceWrcJ8XqRJwMGUxuEgYWMAO0jmffy9OLDwWR1ib9
 GcdHQvWt5QrnyDsjk2A02x6f8cwLTvNgvAatodtKKaeISoOfhZV5Ciwm3eRlmWZYTYln
 x7pULuPCbFbeF9a+K6ukV8PCnYEZVRTQ+FHLMM0H0JRfPo59hBLZVYpfN7J207p2boTU
 fiqe4zivRWXcYD3HFLv6mHsR/RPGMIqNZuOGqXD7xRGDwoIHg/KHRmsLTauEHyFRIanA
 HzUgoK1TnD4+W1/oRG3GB2eHue7GFHrz2HllsMFsh1rbIBsbktA6r6Sm3MBjsSLQloz7
 gu7g==
X-Gm-Message-State: AC+VfDyRyNOcqGME3pfWoBytZdtuhfo0kuTypLhR2QSOEYZ7Y0dlp5rx
 YE1uaQ/bLQaAhbTBcZut3EmBEVt8k6IOGPKUGeRBqQ==
X-Received: by 2002:aa7:df06:0:b0:514:bc92:8e1d with SMTP id
 c6-20020aa7df06000000b00514bc928e1dmr6296274edy.14.1686235783332; Thu, 08 Jun
 2023 07:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230531203559.29140-1-philmd@linaro.org>
 <20230531203559.29140-9-philmd@linaro.org>
In-Reply-To: <20230531203559.29140-9-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jun 2023 15:49:32 +0100
Message-ID: <CAFEAcA-ySTBmiF9e-meJ7gs6TH8vVcu52zTgF_q7W_o+PwVBpQ@mail.gmail.com>
Subject: Re: [PATCH 08/15] hw/timer/arm_timer: Rename arm_timer_init() ->
 arm_timer_new()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Sergey Kambalin <serg.oker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: AcIgQd7xU9rO

On Wed, 31 May 2023 at 21:36, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> QDev models often use foo_new() as the combination of
> foo_init() + foo_realize(). Here arm_timer_init() is
> a such combination, so rename it as arm_timer_new() to
> emphasis the returned device is already realized.

The other convention is that foo_new() does allocate-and-init
and foo_init() is init-in-place. But we get to the same
place either way.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(It would be nice to do in-place rather than the
allocation here at some point.)

thanks
-- PMM

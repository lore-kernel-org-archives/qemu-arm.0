Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1849612ejb;
        Thu, 20 Jun 2024 02:35:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWl7TnjRcUXwL+Z69Y4ETF8ag1jrqvDucglwROBxoldlXs1lYfboVKKYckMbd9bzByXwsQDroZnaBIU1k4HZjBB9h4776ff
X-Google-Smtp-Source: AGHT+IFIvqnudQg5QxzBF2rMxNvZwSCxvcp7sD9Ugu8FTilSn2tJSLoAukT8fjOjV84IMjvcXi5y
X-Received: by 2002:a05:6808:10c7:b0:3d2:227e:a513 with SMTP id 5614622812f47-3d51b9975e8mr6285409b6e.22.1718876134544;
        Thu, 20 Jun 2024 02:35:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718876134; cv=none;
        d=google.com; s=arc-20160816;
        b=yfU5D/HjroG8FLznF+AYKirdTAgpz5njJbJvYLvB0P9n5qGn7uEJyny5P9Qe5l3IkN
         9mSzwvvTw7a6jhBy75yahLjhuNLAlb/fUMyCFo0aAxh+R9PdQxOTWQhl394ASEhHJryn
         +kLTvfaGyWJ47YD9D5OpuG5wlVZk/j4SNQhmT9tLBo49e/IpigtEihkKOrJQLY1gi9Zl
         kAuXxXvzEPPZWbQU+kGdNQTQ4THqI3jy2a1UWuDTAg86X/RqHS4l9O24WMjTMNjIHAoZ
         zJrOA7FaPxEi/ypggUGEDuBjvhqJb3Nw/Y1W7Ui2wNm1K2VGjTXEjvus7+g0GxlAjmy5
         y5AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=hbBsbkBy2PdD0EA2Zs5jFS/sdRgXA2mOSZ7j4O4WgI8=;
        fh=+sg07TPt1fMaCeVe+FgVyvtKaXzR/PbFAptlCQac8FA=;
        b=SGyd3JYuRPIc1I7Unaw31xlvciCY3fb+GIx5rOTvqQSnpRwQ1va0ngv3NoL7nYD45+
         cT5yMf/EEUE2TM1ZdsM1rOXASXbpyL68WxHEbhftsVrGuDNfAgLyNDjJN2NrHalCSAmX
         u4+M9XMIC+V6TfNduNX+1Asz81T41juh7AzDdQ2RIbuVP8N/cgJGcVrJ+Cldh3efJy4O
         nUognLm2AGJGoi8Wc1o7axG3RwThi7HRU/jupzYLoIxgWCZeYA+lYKAg8+94cJ9I3clI
         f2BonFF5Tp3hWLTZrbsfX1574LGkNF5PBUNzASTlMdULR0V86b8eNQTz23EpPB6pVePJ
         UTzA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jzbQHIwd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798ac0859b7si1632617685a.703.2024.06.20.02.35.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2024 02:35:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jzbQHIwd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKEC8-0006fB-LV; Thu, 20 Jun 2024 05:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKEC7-0006e1-87
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 05:35:03 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKEC5-0001g3-Ll
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 05:35:02 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-57a1fe6392eso765809a12.0
 for <qemu-arm@nongnu.org>; Thu, 20 Jun 2024 02:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718876099; x=1719480899; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hbBsbkBy2PdD0EA2Zs5jFS/sdRgXA2mOSZ7j4O4WgI8=;
 b=jzbQHIwdk8j85FPFAf1TNxoGofyzcS7n7mY7clxKEKMTGLgiUHYg472OOhdOTtyywe
 +uurQvAO2cC49e6hbygx6Ks6XBSowFK0SDr8Lr2okPHNsTfd0enPvoFH46GkcjnJcctK
 Yq/RR7ZLUJAVhzbeB9Si0OVtP5kn2LMEenT9XOBr95T6WSf8wTlp6QhrIMDF0Nlan6CC
 mmf4kOeGP5rNk/QkiVGMJCYxW9dnjBUIJG/3QHt+5uMVNfLCGt9w48bJDf88XEVPRkeo
 CcfOuKHZiKuT3Ggd8wQqLr8V2Dxr4QZLAaKwJ6EbR4LRlSH4RokwyN1CeBGEzS8uE7D2
 +DFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718876099; x=1719480899;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hbBsbkBy2PdD0EA2Zs5jFS/sdRgXA2mOSZ7j4O4WgI8=;
 b=bg+0yBtMc+rLTy1sIWYZgqqCbUtwRoT87ee6wlnYVSYj3vu0tVZctQxI3+aS1VJIR2
 +wpWS0WmxfAUoYfOGBNHjmzoV9bIGbb1GzL4gp2mQzEhhr9VqVVxbyrbX9ZIUjKw18Zk
 yPTCppDTSqnX142yfNus8/i6xN5f7/ZRCrU1uvdl2vhUsria+fi9sSxEy56VKwW0Ym/k
 DbCa2CiOQDb7rv4cDutOZWXs8gSVw5RaLaJQxnIa9AGGvl+UEaMLRv0LeahwSHg0qi7g
 0rSF9kveIZoMNqpfXBPYxLzdiyf/e920uh9LO5KIv0P7R54d5lf8jThv3emU86d01PB0
 tjmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDstVOWNgsU46jnxFrWm6Yak0HoBcc/kMkJlqotpPfHcKCbQKrFIfmoRjFWFH0FK0jZKx1oNoOaRUOnHCGxEKwxoZX
X-Gm-Message-State: AOJu0Yw2kyRGxB2+fgItko5FU3kRgU3FQjXJWCJssXdVF9S8Lf4yRcsp
 60IE03BkQIv+G7jzGmrX//rITzylI54AGLfrL44nAqIisZ1CGl4PuZGGLTeT8qwDk6xSrjcyAWo
 PSrTcPFTW0sl0AXE/sMyQXsn3qCkLYhao8tsvQw==
X-Received: by 2002:a05:6402:3414:b0:57c:a7dc:b0de with SMTP id
 4fb4d7f45d1cf-57d07ee7906mr3004193a12.39.1718876099202; Thu, 20 Jun 2024
 02:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240620060014.605563-1-marcin.juszkiewicz@linaro.org>
 <20240620060014.605563-2-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20240620060014.605563-2-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jun 2024 10:34:48 +0100
Message-ID: <CAFEAcA9XbYr9jzYm908_stCUrZCqixB+cysFTRCe2MnAFW1FVA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tests/avocado: use default amount of cores on
 sbsa-ref
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: wQXEGHfQtV35

On Thu, 20 Jun 2024 at 07:00, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> I was wondering why avocado tests passed with firmware which crashes
> when anyone else is using it.
>
> Turned out that amount of cores matters. Have to find out why still.

This commit message confuses me. It reads like "running with
two cores will make the guest crash", i.e. "apply this patch
and the test suite will stop passing". I assume that's not
the case, but what's actually going on here?

thanks
-- PMM

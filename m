Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC9DCA0EE6
	for <qemu-arm@archiver.kernel.org>; Tue, 19 Aug 2025 16:41:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uoPOu-0000tI-3Y; Tue, 19 Aug 2025 12:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uoPOr-0000qZ-32
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 12:41:30 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uoPOo-000542-0i
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 12:41:28 -0400
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e9321ed5e5eso3877252276.3
 for <qemu-arm@nongnu.org>; Tue, 19 Aug 2025 09:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755621684; x=1756226484; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GiIqO8Y15LCBDs0lMCOxPe6ZN5Oep/dNFqGsKEBNDpE=;
 b=mT3CoO0pZMWscZyGTykjJ3n2krZuWmzA9iJjNgzOjh2ICpp2psKcel+BEUZzgrr6U0
 EQRBiCWzA0RRgja1F9/6zp9MCGK+YGL5aH6M/r07D5I+iBjkfDOkzTbZ1+LTSdNp9gMo
 U7uvh9mW3hyWf06OcXIzGBYYvR8rPseava8B6MzB4HQhiObGBcmVzCZoyYQtCZ7EciAz
 xdgZBSmYJvo2UiCcebU6ACfvM8bjsLdXdz4Dgs4jXX10p3RzGLLum2zBw7pekwKgkCAm
 kGn2cVWN0EDh91IJZyS6jM8WoVRzZaimhdL0bgWPA+8Elq3ZM36w0C9vd5JhGSV0cJ08
 SMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755621684; x=1756226484;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GiIqO8Y15LCBDs0lMCOxPe6ZN5Oep/dNFqGsKEBNDpE=;
 b=fAtXP0uau8dlxmyU1aw6zYcdPP64AJQEVdV5G/HiTvxr2Oyjmg4cc3tNl3FrSJzksZ
 1A0RNwCyaV4QpMGqWenUpy2eV/wvuopUzppmBzN3nfFUdZAe3dIYFYWgiX8u59mvfiCG
 hOrqX8BECLygl3djYqlVgKrYOsdEXMLdTV9P2ufMQwByQdYn73yYwWLisoXCnvcoGhT1
 apTHJvBm0cvIPF60JKpWYM5lHegFCw8SLl/cflrU1iCthcCjg7+Vgo9oHJ4cq5bo5Jaa
 RzouRrRosgW2vXmQSMyQEVvG6nRuxTNCXHZRdV1BbNPp5IW6lxd7DlNHFeiXqmhDn9Vl
 KE/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6uReRwNwm/VrFpgQa6VUJdAlpxwVhZtLjYOF0YGahuijEBMGk/2fGJznj13G7IHewM4KzCYNhnA==@nongnu.org
X-Gm-Message-State: AOJu0YwnVMy74I0gqPkvKfkyEPcyEAZfiD4IHaMMudL5ceduPUZ1gwvP
 lpzSn+UlI24Z6bxM6HFBv8c0WoktEYgN6omP395YAA53hmPVU7TnodwxhNDas5PO5RGkU30h/m+
 RJqt4+4LG9UORYaVmxxuYQMamAKYk4PHIofvS5nCLxQ==
X-Gm-Gg: ASbGnct+t9Gu7lxX3NsjTpENXRXKJNBfcVNhH8hMr2gIh8OxBGGS5/Jwd5z1DnGE97i
 VAN3s1XoFbPI4XU+IsSHRIGRvYHbFyDCIK0kM5SVSOhDoF3PLPYNTk84Rt+ucDNAGKe58eTfiS8
 noeSqFEvXyFYnSgl0H2q8F/symmpkVzfFQRbhfCBcPii5gkeS1NuAyefAcf5psd0paUkcQimhy4
 aaNRClL
X-Google-Smtp-Source: AGHT+IFBKSmKfq3bO7E8/WN4Yysbn2OVXEu5/Y/HzccGqU3UG4ujnaS+fV2vevliVqq9orT9wzH4jC65J17HxnxQFR8=
X-Received: by 2002:a05:6902:6b05:b0:e90:6a88:ea9a with SMTP id
 3f1490d57ef6-e94e62ed1a4mr3301889276.25.1755621683825; Tue, 19 Aug 2025
 09:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250815090113.141641-1-corvin.koehne@gmail.com>
 <20250815090113.141641-2-corvin.koehne@gmail.com>
In-Reply-To: <20250815090113.141641-2-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Aug 2025 17:41:11 +0100
X-Gm-Features: Ac12FXzy_SG5iiFJQHz3gV0BJ8U6QwAgKSpDqJMi-lGemZgHqUeb9vAuewxkpzE
Message-ID: <CAFEAcA-m0nqON13BMWMSy6xrR7F3wRLXOTNvavRun5iGvOxFnQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] hw/timer: Make frequency configurable
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>, 
 qemu-arm@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>, 
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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

On Fri, 15 Aug 2025 at 10:01, Corvin K=C3=B6hne <corvin.koehne@gmail.com> w=
rote:
>
> From: YannickV <Y.Vossen@beckhoff.com>

> Signed-off-by: Yannick Vo=C3=9Fen <y.vossen@beckhoff.com>

Is it intentional that the names in the From and
the Signed-off-by: are different ?

thanks
-- PMM


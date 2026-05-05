Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D55CD342F
	for <qemu-arm@archiver.kernel.org>; Tue,  5 May 2026 10:43:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKDFM-0005xN-Tk; Tue, 05 May 2026 06:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wKDFM-0005x3-Cr
 for qemu-arm@nongnu.org; Tue, 05 May 2026 06:43:24 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wKDFJ-0003RV-Oe
 for qemu-arm@nongnu.org; Tue, 05 May 2026 06:43:23 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-651bf695701so5019565d50.2
 for <qemu-arm@nongnu.org>; Tue, 05 May 2026 03:43:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777977800; cv=none;
 d=google.com; s=arc-20240605;
 b=jmeFJ0R+amLHAIHEkbjo5dfdDARY4cygQKo8/8dvZmJ6uLDygd4D37vZdZQSxgP2LQ
 XaskG5VgCKNm4RqOgHzhwpPk6W/DYmgmy97HGXWIPW4zPLxuW0aUpJuIEOkVuSD8QiOU
 WJMlpr1mJQvLLNFPkc+WZaL4TtRqdi9l5E8BL6sViOdNrwIZSZmJ+IGVz/0ygsNwZkr6
 VnOME+g4gtt5Ml2CLbtLRpoQvDsJo/2qfEL2GhdHp4EmLvFjTAR2Jeu4N1dRvIdyb3st
 1/PapGSHrKQgF0itnrbEFwJuEjIxnuXfAGKwQI6ojRcd748AINA9nPRKLfaomY2Ys2M+
 T4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=teRU8rk5MOHTky9u3q2n9Q0lB+lXbes576S+k8BVAS0=;
 fh=Q98E8kC4QNzVbfqf8dyFrMKUPtFw6oP1+c0kizufYwc=;
 b=PU4SIqbMMnDG4Ge71AFJykcajcY2uame1onAQmycrzqEQa7FI1ewXlUkwrtyfchsk5
 iCK33nJBTceDkzr7zC36QXdvTJhva+sYMBc07vQ5Y0Py7Yg+UhV0pLMgZnTMzmWdS+DB
 OS+G4FQq6ygG94XXMqPrhqr++8+Nsh/Hvga1+2I/DUPdGFrRneaoOJFyxlZIt3RUqXwU
 rQnBtyRnEZYjUrZAQ2wvh/AaLZvqpAm7aBluJyRZFYf5CQJ5P8JeLJ8omJHoxNln4w+A
 z23jzmXa1jL/ZCL0rVoMLO0SV2xNUo5/qR/ch/zb/rXulAZDEhpsTMAl32GSDAJLyU3m
 hLsw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777977800; x=1778582600; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=teRU8rk5MOHTky9u3q2n9Q0lB+lXbes576S+k8BVAS0=;
 b=nRLkey2xLN0wd662lSBgNjtrr1H7Jk6U6MXiyhSmrs6tg2gFUh2eDDgNwvUmfVhss7
 B1fIeeYGk+RFKRqEofPfBqdUHbcyd+o92Zax6F5e8iSVTFcNpIuE3++tDeaGc/c8r/J9
 x8TDJveH0U7XUApGxWm+eOltkxUt2Xn2JPIpfe/W3NgG9Zaqogu7uQfkfLNQCDyFtDXa
 i51mKI2C12CqQi4nUWguo0A3E+VZIGUPlSfJTQVI54MBA1jfI2fVuXnxG4uUraqG4Rzd
 4SkWjZ60ei1KyjRfCbsKlM8luN2EDaNiUAHHWLqd1GhXqNBd0jY50L38qixXvF0+Quey
 me+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777977800; x=1778582600;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=teRU8rk5MOHTky9u3q2n9Q0lB+lXbes576S+k8BVAS0=;
 b=s6pebkynPCSnVmxnyvjTfqVfsrHq4wL99VRYZcITiE0ivsuBF23/Ri5Qrnj3EDVQSC
 oB2/McXfHEBRRFmkOEXYizawIPFcdPvVccadq+QZHzwdJdrd0OWxlUvodU/OQJ0TnLH1
 Zk5VwuWOWgBeZBiPkHwbvLEttFJ/5WvnBcm7tvueuDL+R7kCLagKro5nswO4MtGaqYum
 jzEPZT18+vKEljJfw/Ng2m/sExlRacmpiygnLBDf8EG4mW8oiZBk4hpfJeCdyxrZXY0B
 A898wLXwg93erbToEZdGBWhWkx++lo6zd49/2Tq6yrEJbx1oLGVNXJXOTPifG21WB94O
 vXlQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+iR1YvqkvcbYgqVDRdpO1SvkPUv3JDzXf/4EXo5o9tqFO2/2gpAAS7grpsiC4BawcalM6XPjn5Hw==@nongnu.org
X-Gm-Message-State: AOJu0Yz3fC8c4rsNIsaSQV6hNPuCw3DT+KvI2d2QUdvtLkCz9asXKzTE
 qZ7WhvULN34mJjMWazrDLBfddRyzyIE1KCWq2Wmp8Gz7EjKzBeg7CAy+5f91sJVCT5hzCD7nfFF
 lqX0Yt7KoM8IHFa+dSKOrBiu1NDSwM1SX9yhtVFHg7A==
X-Gm-Gg: AeBDies5Qmq6vnw1zSJ0d0SYyFWYDRBa0cacP8WP5RtETbIbbTTPLAnNso1Waw6mUNG
 da6ngrKtrvcwPxfOf2crHqJ2f6dPGUEDvc3pMqPjXqg3TkQi0YnRFwmamNKZ14EwkWeRzLcGHWY
 cdtZy1zttKaL2dU2rtPq2IR/6Gk4nBa4VZ6Pc5q7YRwY1/rsMUCE9lYS+zdXqvpsnwnltZ/piLX
 by6knvqh0NFvF/BhxmNGfn4L+NAYVuwzlWaLt1MjLKphF+59IB/51KFZwVinOubCUE2osJeIxnN
 oMwwCNdSaTnBigztCD164GUxKgzA2Qj3dNB4Mq9eY1BKVkVyATNHStKURaYevUf1D1pmwOpcMPZ
 iyQ==
X-Received: by 2002:a05:690e:4141:b0:657:4568:c4c4 with SMTP id
 956f58d0204a3-65c69c8c288mr2852351d50.18.1777977800404; Tue, 05 May 2026
 03:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260505103649.68361-1-alex.bennee@linaro.org>
 <20260505103649.68361-2-alex.bennee@linaro.org>
In-Reply-To: <20260505103649.68361-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 May 2026 11:43:08 +0100
X-Gm-Features: AVHnY4Ls6_-k7RaEWNQxYbQZriOGVLpDj94R0xrIT_Yg1eU1XrIhDMRH_WiV6nk
Message-ID: <CAFEAcA-rFhHmS2+ToEZkr1+HE_e710-ZyyPESHLzCeW0QopY_A@mail.gmail.com>
Subject: Re: [PATCH 1/5] configure: report unsigned qemu binaries for check-tcg
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <th.huth+qemu@posteo.eu>, 
 Thomas Huth <thuth@redhat.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 qemu-arm@nongnu.org, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Brad Smith <brad@comstyle.com>, 
 Fabiano Rosas <farosas@suse.de>, Kyle Evans <kevans@freebsd.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Tue, 5 May 2026 at 11:36, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> On MacOS the initial binaries are created with the unsigned suffix.
> The user is expected to sign them before they can access the
> hypervisor APIs. However for TCG testing we can run the unsigned
> binaries so lets make sure the make variable is correctly set so we
> can run the TCG tests.

We have a scripts/entitlement.sh, and this seems to have
at least some plumbing into meson.build. What stops us from
running this at build time so that macos users, like everybody
else, have a working "qemu-system-foo" in the build tree ?
Having to work around this by knowing that you have an
"-unsigned" suffix until install is awkward for our own
scripts and for humans.

thanks
-- PMM


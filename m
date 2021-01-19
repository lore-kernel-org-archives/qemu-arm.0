Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3344366lfq;
        Tue, 19 Jan 2021 05:58:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLduiPOR4IqzYM+tdpIWKv8PIcelav1dkafmg+/CEwVPCvqO88YGq1ET0HrgCjg9qqKPVK
X-Received: by 2002:a25:80c2:: with SMTP id c2mr5689932ybm.411.1611064680400;
        Tue, 19 Jan 2021 05:58:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611064680; cv=none;
        d=google.com; s=arc-20160816;
        b=PLn7umGaq2MVAHwUS/Z4B33zHNpBeoqpt2NLNJVmS29Yi9vLE4lp3P7XsiTGYUwdfg
         +soSZcIUACC2yj9zd5HoA/xyQA6hRE9RMTRnniuvUosU6uButQoev5mT3ezzSkmCAy50
         dUZGxoBcKLtK+55q2vgYv/6fI1LMj5LJxCWpVEV7MsLvw4nY1UcEoZSJNArheRoDCpU8
         vF96mWP8Ul4fAu2jCSC1U9QBJDkr73RurxnZOUpqcrQc3Cs4WvIZw2l7MO80PxnCpjy7
         9AK9Tlw4ijRE5XwPMV8KtqypFpvQTSdyAIDqNdLBsg/uSqz9LxedAjlTk5fOc6cXZWiv
         eWuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=euRII8kzx/arn4UryvhCiEH4Dl1uD9pmXe8i99mqOO8=;
        b=F6EWvTgtR92myUVcO3L/r8e4y/3UV5N9agBViZxNxQZ9nsTzFIiGvcdrwHtIMSFjuZ
         qq/jTUh7jF3yD1Zh/xr0iRLjrurfYzTX6v8Pd2nFXCnnLB4sVEfmur9OIwxdHVi6I3DL
         0N8qov0tg4Q3IbSsSwBRUqmB+SYEUjHjgggdOlktOtOgTqJkYJM8+pJJ8k3+iS/IPQVn
         ucZdDB6RMFtLbXeyIl/0f7n1do6ALq+iKZU4dlmEN4EZ4R3pcnCs7I/Cl/zSUk3enbwJ
         KyVbLeKDdfkupkoKzVCTJ06Xq7vlIqxZ0mff9Ytqw7Ph5l+fSJnmmxjAmd8ivtA611tW
         XVfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="NTinbHo/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x199si24126959ybg.160.2021.01.19.05.58.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jan 2021 05:58:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="NTinbHo/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1rWB-00052b-PZ
	for alex.bennee@linaro.org; Tue, 19 Jan 2021 08:57:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1rS0-0000YW-EC
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:53:40 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:40248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1rRx-0005hI-Sj
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:53:40 -0500
Received: by mail-ej1-x62a.google.com with SMTP id gx5so9348821ejb.7
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 05:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=euRII8kzx/arn4UryvhCiEH4Dl1uD9pmXe8i99mqOO8=;
 b=NTinbHo/BMuviduIVxtNwf/xqo07l8m0xr5cHaMNmC0CL6xbFgB7NRDDo83J9LBYmd
 jIKji9tPmGS5dd0HDgzEgqAqhpMKVwO1+00AlUz0im2F1EajwsBzrrupvM1O5/rpUA7U
 p4yu/ESPXhdJ1veA6w4rjDRMteIoZqWKkqHCL8ADqNhNUR8K+PEfmmq4+6opNX/bbyx+
 YDvvLXfU1IuQ/Mr23/XPXHq0vu0B68xbCE+OEfAiV9b+Z9IxjzMxjg53DT+E2Er3no9X
 eoeBJT6qLQgQgFF3/t8m3dSjKJ3/p0/XdHFWabJutDlhU503U23SGk0WpfWs5z5VONXu
 RKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=euRII8kzx/arn4UryvhCiEH4Dl1uD9pmXe8i99mqOO8=;
 b=J0ALo0NZiH3iFWoPqrHLGLIBZjzfGOFUazbb2xCI/L/X7rTDHfEwetgQwK+bkgxspt
 VonC9Bfc7Haz4hKUnRT1FM9YvwcuxED6j2basewKR5Mc/pidSymCWhofn5ocVqZOtJRy
 tYGJ6sz8c9eFPLwAXF2M7Y+aK9LL2mt6kIGGs4JQG13WB5Vh/YVDoZQQmCUThciccCrk
 KuccinYVmqd/qouUDSTSZfgaQB/Kr3XFG+UsDRSEoezjoCYvRjZ/dJli4xrYIjLYJRYr
 zCjsDDUU64bh5pOTH2SDQ1ARNHhU9aSqM5kf0orrgpqxnk74UCGeyk6K94fR9vaqpfYS
 1BFw==
X-Gm-Message-State: AOAM531rlr9JLhzKMpNJwiF6+gC2UZeireSEu/sxtRAyCzLDd0wx+RTs
 fqrirdbrzhKaxQ2woFhhRN1m/F7U+wUpJkOgIJeBPA==
X-Received: by 2002:a17:906:3d4a:: with SMTP id
 q10mr3086185ejf.85.1611064416410; 
 Tue, 19 Jan 2021 05:53:36 -0800 (PST)
MIME-Version: 1.0
References: <20210119062739.589049-1-f4bug@amsat.org>
In-Reply-To: <20210119062739.589049-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 13:53:25 +0000
Message-ID: <CAFEAcA_76OiMLW0vhi5HZM_Jr+VQbofRNFTDkaOxetK-XmcKnA@mail.gmail.com>
Subject: Re: [PATCH] target/arm/m_helper: Silence GCC 10 maybe-uninitialized
 error
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1YCKMIVPhkKe

On Tue, 19 Jan 2021 at 06:27, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> When building with GCC 10.2 configured with --extra-cflags=3D-Os, we get:
>
>   target/arm/m_helper.c: In function =E2=80=98arm_v7m_cpu_do_interrupt=E2=
=80=99:
>   target/arm/m_helper.c:1811:16: error: =E2=80=98restore_s16_s31=E2=80=99=
 may be used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>    1811 |             if (restore_s16_s31) {
>         |                ^
>   target/arm/m_helper.c:1350:10: note: =E2=80=98restore_s16_s31=E2=80=99 =
was declared here
>    1350 |     bool restore_s16_s31;
>         |          ^~~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
>
> Initialize the 'restore_s16_s31' variable to silence the warning.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/arm/m_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM

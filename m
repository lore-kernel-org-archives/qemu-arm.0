Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp322323njb;
        Thu, 8 May 2025 03:37:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUDytk/ZeryA2IwGxCcj02/9vli7ENqADWw0gvHYvRgIiDWiQsFlirlROIyw2VopshI/qTLV1m6ARxh7Q==@linaro.org
X-Google-Smtp-Source: AGHT+IG9CKe9LIL716Lg9+UvurmYdEaKKl07coDogSQIMcShxIRxHrA5KXDQFruyj5dhDoIGaSy9
X-Received: by 2002:a05:620a:44c5:b0:7c5:5d4b:e62a with SMTP id af79cd13be357-7caf7415964mr1262434085a.54.1746700664779;
        Thu, 08 May 2025 03:37:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746700664; cv=none;
        d=google.com; s=arc-20240605;
        b=d7z41D7w/XcCNTcMAgOlqsRl5fdzrqdnUoXD+QDjq6heQT8ZzHpC+8iCWEYC7dVeoR
         hs/lRhbINwAiqrylsidwkftEbsmRfmvsMCQF1QNJK2pk8Mt6YmqOf2bhiXnOMLc93O+3
         ZNj16ICk5u6Vqbe4PePxZy4CDu8gfUkJX8h55KB5A7m2qPWcKuBF399gChJgq55+f6St
         zX1UIx9+XqJtgziiMiGs4EVU8kG4PR8BZKl16XUlcYXjkpz97lY7yNgSJOn+lTuNJYWU
         WBOAVwvEFb73wxe7RClZB30KzZqqazHiCdYRS2KPJThGqlmp0+VmDJHRBD+G2yoyMJ0L
         dDSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=HxsGv45yXM2dGvzaNPkdS3GffWkTTOXIPrTUUIiufPc=;
        fh=mgPd8ROmo53zmigWvuQo1WFwSunQeChNuGvrDl8cdkY=;
        b=PgVvA8N0T5EFyOBS94hP+FmIik69CnckcWGoUJwHrHAqNifY/7gvdOkVPJL68JjXlP
         GlUlp1Nj6etwImzmZ406Nrkjgz3ZvZItUgqDD2xdeQyRiItZRhLpNUOmqApKcnAg7SZU
         18lSQAXOTVoU9TNYWTghSy8x+ui7y3UqqkDKTBuLsOteORwTnXfKqH2ImRiDiwqfxysZ
         5Bue7RETdSRjCW0Ru7qDhRHeImWyRQoBBTlOC6ml0zMr501R/kpi7V4uRP1oqnIgZUNj
         3bLmmRT3/xteYz6uN6CpR/E9JpbsPbEGLK+LuHBpTSZySq/aSzdO3RsGRKj9pNIbGLgO
         NmBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bpRzO0Vx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7caf75ad032si431180885a.348.2025.05.08.03.37.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 03:37:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bpRzO0Vx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCyd8-0002Fp-3C; Thu, 08 May 2025 06:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uCyd6-0002Ev-IZ
 for qemu-arm@nongnu.org; Thu, 08 May 2025 06:37:28 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uCyd4-0006XI-Uy
 for qemu-arm@nongnu.org; Thu, 08 May 2025 06:37:28 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-70a2d8a8396so6959727b3.3
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 03:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746700645; x=1747305445; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HxsGv45yXM2dGvzaNPkdS3GffWkTTOXIPrTUUIiufPc=;
 b=bpRzO0Vxr4UKxhsxn/r/tgUYP/wBwLrlbLISPjM9BB0gP7uVqa9znN4wlxUCG4U+JW
 /yGxI4WxCPr5TsLBkd1HATjFNrK9GTye8IoKn/dzuAjZQbILJp+pD4xCch/wMXjFvHJ+
 rwy3CARsM2GZSaKwZtUSBWq3eF6JC0kEMlBJ3Dm4wFmStvL6Djq9p+UMDJx8WnAF7o8K
 jdk0lApBUfxLZKqsE0wjJUbltEHS8h1Tffovfs5Ac59CmQYoeDdkmDvFM0fyK5dQey8S
 hL2PSFEkgiirdg30/9M4AqSfcapiJhfHxsaaqqs995HbzkyJjj0wWFSeYxP5wJ7c3Mps
 soeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746700645; x=1747305445;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HxsGv45yXM2dGvzaNPkdS3GffWkTTOXIPrTUUIiufPc=;
 b=EYDxLQb961QfX5nHEIj0/P97qiEfy4JyFpOfK/N5dUdQC5dy3C3tHiExUIKwe95659
 VivFgu50WFy9mxemuHctk7uxSw7mv6GEBj7g6V+c3ZxecYkkWHhnYcyAMoMVIlTJ+BcZ
 ymCA9AFwRpUkOByRtirJIJWyOzLFPzOF4kZiUpy556RokDq1qTStzehgYK5lppyosX4t
 F500z3RP4v/mUQaJPunH+ut2RAGSswghVYTwRvyj1iEdAoPhkWuYKzSi4RRNhRKbV9ER
 Eh3dTmBCdplOrluSIea160QLRx+s3PnTJcLq3AZgTZWB85hrButdkCmAAAWEAtiO1Jom
 PVBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1h7bPTh7z0V14mZIcLDQCeAyEl3bzd7STZzT8OKhQ4IyKJnz0Ds2nS7td7efDPMqt6MrbU/0Jog==@nongnu.org
X-Gm-Message-State: AOJu0Yy7DnOCtNm5rqYEyjBKo8eVq0JzB0H0pAE+UU7rfXj4fQRDqMOp
 YD0QVxLFg1IcUdlD0DCD4ls/0PFzrGTvX3Pxk6AJ+eq5CwgxOEBot3qsnYPmp1pSnaEI67FP9xO
 9JLp2OpD6VCe8iuZzKOBeyNUJXvBQ3ZwSuK6Ptg==
X-Gm-Gg: ASbGnct5jDn+Mei1XeLYhBo3lmZvkVvr5+zGnw6vdXzGz6q0zVF+9eYPbffC/NTut78
 +QnMRw9/VixgocsZOoJB4G5Huv2l2djykqw7MH+W1qMWg+rAT5T8XTGiIiN08oGobqqtSXf0347
 2N4+IpqnO6hX1gEWSgArK7/qo=
X-Received: by 2002:a05:6902:2e0a:b0:e73:1cd5:fae9 with SMTP id
 3f1490d57ef6-e7881b1a1damr8773251276.30.1746700645629; Thu, 08 May 2025
 03:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250507124040.425773-1-shentey@gmail.com>
 <aBtavpDt1yfoavj7@mail.minyard.net>
 <8a5893be-7217-4c58-838c-01370db5d6bf@linaro.org>
 <b0737130-fc97-40e0-8488-3daaca23552d@linaro.org>
In-Reply-To: <b0737130-fc97-40e0-8488-3daaca23552d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 May 2025 11:37:12 +0100
X-Gm-Features: ATxdqUEOYQ166hgRIeGt8wr00URORUpqbEwn9Q__mDvxV7UdnakoJPWylvMg5NY
Message-ID: <CAFEAcA9xSecBW6NZe38757oWNKXrfvHfy0+Cfq=itPFsHeQV+w@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c/imx_i2c: Always set interrupt status bit if
 interrupt condition occurs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: corey@minyard.net, Bernhard Beschow <shentey@gmail.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PX/teX6XNNqs

On Thu, 8 May 2025 at 11:32, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
> FWIW I noticed the patch subject is truncated to my default git-view
> because it is over 72 chars. Since there is no enforcement on patch
> subject / description lines length in checkpatch.pl I suppose nobody
> really cares about that so I'll merge as is.

I treat subject length stuff as an "it would be nice to be
below this" thing -- I try to keep them from being overlong
lines. But sometimes you really can't express what the
patch is doing in that length limit, and in those cases
I favour having a slightly long subject line over having
one that doesn't say what the patch is doing.

In the description part, we should be keeping away from
overlength lines by having them wrap at 75 chars or
less, unless there's a strong reason to not wrap (usually
it's a URL or we're quoting an error message).

thanks
-- PMM

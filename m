Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2508073lfq;
        Tue, 1 Mar 2022 02:43:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQcle54F79O+tvH2HuOaN5tsidUG0HtsTuxaXSIo6Tf8RBLKrhQ/dQnhFJJ2Cp/GCl+L8Y
X-Received: by 2002:ac8:5c86:0:b0:2de:54b1:2631 with SMTP id r6-20020ac85c86000000b002de54b12631mr19430613qta.466.1646131430825;
        Tue, 01 Mar 2022 02:43:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646131430; cv=none;
        d=google.com; s=arc-20160816;
        b=IDyQz8cymZma2jmsbYo7qROD7p45HUvHKH/2YIhZgC9J9kahwK8Qgteo7VG56d2Tv/
         CMfUawRysRisnbohJe9YnP/AiT04kZzp0A/f9WX1IzRWilXjvnG4MxZv5hn2JqTVWDfl
         duKbBPY9Ky8Mw3CxwHEZ2v8Vf01pgje8zDPLVT4chlkWx7ub1BFViLx/xpIDUD+2Pzm5
         o81FXVlDxW5slrD/q3EOFXdktwbPsZqE9BC+mY8Y5PxIVvEZ6qc3ymfoX5daP6vAz97D
         iSEr1ea+t3OkqX+aL+jCCtVVWucQSDJkb87SyESlpwj8MiD1h5TNE1gB+EyurZ0fPkVm
         MX9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=34jaHwAsn1GS4jiZzitztpzhzuRyuPyDxEqyib98OVc=;
        b=SZGioLqZ6tRvQcIXPIijjgA0JmhVN+xsjdyIVGAeNLzM3RTxo3Ikl+44gZWOlcRTKj
         0zAoji9FHIXLlaA1Pa+mNIC9t+kYgbOHeQ666nBvjMGOEKPqzxl04rA/ZyA7UUKvKvPI
         S5B2UmAdiAfkXSvKDYS1i4cOPtZegELQjeLxelxH4eTkWqkJ0toMDlk/7yS/J0T8tU5c
         +x7FScNBZ81dz7DsT4P9WXnlEn1/egbh/8oBjnLNf50wZ+e4FWkmQB1KrrUlxxLreqNi
         G2OxUSTm7Vja49OBzyW31mYdFtuIya7ne/vFOqZ/A9vAwVp8FTH4XysoCq94+Q8V/4GM
         9J0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uuy6ZnTc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12-20020ac8764c000000b002de79a1e2e2si3835078qtr.758.2022.03.01.02.43.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Mar 2022 02:43:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uuy6ZnTc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nOzyw-00050S-Bm
	for alex.bennee@linaro.org; Tue, 01 Mar 2022 05:43:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOzyl-0004yw-Eq
 for qemu-arm@nongnu.org; Tue, 01 Mar 2022 05:43:39 -0500
Received: from [2607:f8b0:4864:20::1131] (port=35151
 helo=mail-yw1-x1131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOzyj-0005Yr-NT
 for qemu-arm@nongnu.org; Tue, 01 Mar 2022 05:43:39 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2d07ae0b1c0so139813597b3.2
 for <qemu-arm@nongnu.org>; Tue, 01 Mar 2022 02:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=34jaHwAsn1GS4jiZzitztpzhzuRyuPyDxEqyib98OVc=;
 b=uuy6ZnTcCF2SiSE71N3OcYKnZ2VTs8AwDtzgUeSdAUuyf4ssB4a9SmH9NIyRE7HH4D
 HRlLBAFc0sBPtFr2fv5qVzplI5R0i7giL92OxTncgbJ6ZDQ7dHZvEOLwqkR8KIs45rAq
 6ezzIMm1TUDhZCNy6IqT8glDoVt6NCXWVyQhqEHRkDHNhBiNHqVzxwv2i0h5AY4fH5mR
 h/xRr/JfydfmWb1bGauBn/GeD3+hbEHLPoYWTJwMnAu58g9ugqxizGSvChWq1NUqoYf7
 mRqmpG+vsMoET0Scq/eHHzmQ6ovxCKwNhUhKHtSPgmctmh/lTPqKNAoKdOJ0Sj0YA5dA
 3m3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=34jaHwAsn1GS4jiZzitztpzhzuRyuPyDxEqyib98OVc=;
 b=uVOPBv8JbRRx/+OLO832SNn/5OZxj+xyLG1TT6nWNrzfWQaQBNtXqYOfVPNINdUGhs
 YtARm/UhixIRptyd4myWCjPVhqEbUwpuNTLEf3LQSy+a9BNydsf8llkIm3H+3wflKYAH
 aBhSAgdHi+aqBN/c9iIBq9RkphSzbjk/cjAtsyxi0d/VBHHNjNj+FeZBowTLeE2XVRsf
 /haSne1OUhRCN+H3b5fsfI+egGYo/uiR/VeCydu9kaTWlxJsdgbSbnpwWGTqMSRYl3fB
 V2vnYfg95sJZNxIffl6/beDp76m+ndKJs0kZ1SbmNKf56NiwKSQweLj68743U0WCJxrx
 VtQQ==
X-Gm-Message-State: AOAM533IiUwP3FaH7qOP+J+JkSGq0fF34H13KgyggvXfl4ciFK4qAqfq
 uFO/901+XjRVhnmEtWJDVi6EJFp8wrwDXp3GW/E1dhcP27w=
X-Received: by 2002:a81:b49:0:b0:2db:f472:dfca with SMTP id
 70-20020a810b49000000b002dbf472dfcamr573650ywl.455.1646131416589; Tue, 01 Mar
 2022 02:43:36 -0800 (PST)
MIME-Version: 1.0
References: <20220228071239.404171-1-clg@kaod.org>
In-Reply-To: <20220228071239.404171-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Mar 2022 10:43:25 +0000
Message-ID: <CAFEAcA8Lj9yUdmWGMme0-wuMD0BWLCKzWPfdfo069W276Z5Rpg@mail.gmail.com>
Subject: Re: [PULL 0/7] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1131
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qY/Bdgk8jEUk

On Mon, 28 Feb 2022 at 07:12, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit c13b8e9973635f34f3ce4356af27a311c99372=
9c:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply=
-20220216' into staging (2022-02-16 09:57:11 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20220227
>
> for you to fetch changes up to 3671342a38f21316a2bda62e7d607bbaedd60fd8:
>
>   aspeed/sdmc: Add trace events (2022-02-26 18:40:51 +0100)
>
> ----------------------------------------------------------------
> aspeed queue:
>
> * Removal of the swift-bmc machine
> * New Secure Boot Controller model
> * Improvements on the rainier machine
> * Various small cleanups
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

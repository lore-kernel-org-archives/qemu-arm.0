Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp319164lfg;
        Thu, 11 Mar 2021 06:11:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLgUkLNMvD7HiY01jfeNzbQ73iCjMZA/43EBsS9pjpj0ZP7LS/NzJRLsWnMlR0KfoTvMPj
X-Received: by 2002:a1c:7e16:: with SMTP id z22mr8376615wmc.74.1615471875962;
        Thu, 11 Mar 2021 06:11:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615471875; cv=none;
        d=google.com; s=arc-20160816;
        b=AoTvtuvJTEQBvb6EWrJqWkgZuXHEpuWTwteI0fgSG3n9JxMcO8apk2NHBb92uA/Q6k
         fXNxUT7eqbLMJPoeRF3hJ+urb0QXEeXZrv7hEGP06iBNMV5dre7JZ9Bpc8kO+KJ/av65
         4bgmWjR86AmMkkssAQhOSVU0uTfupap5j4W9xADpvijvloqAD0f1WvseObhwcc7LDW/l
         s9Y1/sccuhWZeGXmaw+EAOaR1vCN8V/SYMxQBG+PAz5+aqxLg97hWjTqCpVJ+0VtudT1
         SbINWgg4lnRzOT+5cgmli2MXZNEgxrByxr8YIw+LRpq5SWEN83MvzIXX6N3dg7FBqIYA
         I5KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=lt6W0DL25DD4fkY17KrpKAIssrwOr6WNuWnERU+QiP8=;
        b=BPVEa7kvIdZSqENG+B7DCFnTtYzbXyk2tm1Uwx6IMY+3WMbyhGSYFKeTuZPexE/mTy
         bPgwaD3gDT/cEyAUysKtcDh3mXAYTAwj1pQ5/bhLKWI1D5uwT5EWMD9k51YA5qEKCAr4
         aFqwRi3oCSDI4gN+1IqzPgbrrt8INIsXd0IjtY8N4xWkTcdh1+xLocQekx/Ee0/ymYOI
         TYf9Ko23ZRKemN3NsdRRbTRiDy5eA10jB7C88k81YhCxMa9tcTj3Bg7fAGGmW9eDClnY
         r+4BukV3mPK0kGFVr9+/2i7IYA+XvVJ+LWp5QRjBkQ91uVuA7njT8AdMdT3FuujUambZ
         Z6OA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fDwET5KO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h89si2723666wrh.96.2021.03.11.06.11.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 06:11:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fDwET5KO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKM1z-0004i1-1Q
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 09:11:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKLoG-0003e8-6T
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 08:57:04 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:43946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKLoE-0003pC-JB
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 08:57:03 -0500
Received: by mail-ed1-x52e.google.com with SMTP id e7so2878683edu.10
 for <qemu-arm@nongnu.org>; Thu, 11 Mar 2021 05:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lt6W0DL25DD4fkY17KrpKAIssrwOr6WNuWnERU+QiP8=;
 b=fDwET5KODp1CoibrKFi/XJurFuwznITo4nV125xWZWtPcacxt5iQn4bbtL+ngWmnu1
 yrxeUi3zFo/D+NpPUx8yWf2RZUM8c48khKoLbZeDppnBN3MNUesCBbYaLq8b5NSygVVS
 7PUCD6eH+Ifce0ZSGRT8W/a5pRhH3CKFxt5TZgNN3WI26dvTkzDlCK6brsamx6mWV0/G
 sckbp+cpXU//XGsySJ21q9Kda2viputltVZwom+ilqLjLVMG71UGVVEchIO2D5WegMkV
 /RbQp6EDLtlpHSK5qjUo9dTcq/arhtOjA+eINtyfk85OYGTkANnuizO+7A39SVNb0yvU
 S1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lt6W0DL25DD4fkY17KrpKAIssrwOr6WNuWnERU+QiP8=;
 b=Sx/avfjwsmRpjxhM+RUGTUbWQKwTLeA+2LsYL8DW3HXIuqhgJKsywqAlS66IZ5tJ5f
 whQbMivftchsqdfCFZppf05f0PV9+fFAGW6ig1dpKW3hLr1pB3jWwEwPjtFzMM8IaET6
 mxcjn6hdyqJu2rGw2qCPoopStxhhI8SU3M7RBM8N4AWbl58POohQgzuj4PdC7A18PmAE
 oFp9+9JxSS5B0FwynCsbWyBZqH4H5DPqF1JuT497RmKXzTlBOLXCr44cJHFR3kP7NsRX
 fx39kstgLvHjlDZsd3kbDULW23H3p/qtAvG+unbCItLWcVzSEHrvoPLwzsdvotTxwg5V
 zwxw==
X-Gm-Message-State: AOAM530cZkIrr036M/UkzGrDbool5vhAzmeQhYCoY2aj85gmRaDGUHic
 r4+MGIdR6Po7x6LcGZa7SVFl/9A2UYp0M69YsWeW/Q==
X-Received: by 2002:aa7:c3cd:: with SMTP id l13mr8508581edr.52.1615471021014; 
 Thu, 11 Mar 2021 05:57:01 -0800 (PST)
MIME-Version: 1.0
References: <20210309131641.2709380-1-clg@kaod.org>
In-Reply-To: <20210309131641.2709380-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 13:56:42 +0000
Message-ID: <CAFEAcA8fXS2xEhE60qDDXHhicOVJJyKax+erKJ2Ks64TDP09uA@mail.gmail.com>
Subject: Re: [PULL 0/7] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n2ntLS3vv3Bz

On Tue, 9 Mar 2021 at 13:16, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit 229a834518b950d56fd1bc94923276504d0ee9=
d4:
>
>   Merge remote-tracking branch 'remotes/philmd-gitlab/tags/renesas-202103=
06' into staging (2021-03-08 15:45:48 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20210309
>
> for you to fetch changes up to c59f781e3bcca4a80aef5d229488fd45dbfdbd9a:
>
>   hw/misc: Model KCS devices in the Aspeed LPC controller (2021-03-09 12:=
01:28 +0100)
>
> ----------------------------------------------------------------
> Aspeed patches :
>
> * New model for the Aspeed LPC controller
> * Misc cleanups
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

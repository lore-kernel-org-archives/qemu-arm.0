Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp364058ejx;
        Fri, 18 Nov 2022 08:06:10 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6CQKfvjIX6uGYzoU+asN5TsrSyNs/fZIYrgopeGsF7QqTkiO/VX7dAQ5et1UIb6VHRU/RA
X-Received: by 2002:ad4:4482:0:b0:4b1:9daa:b53e with SMTP id m2-20020ad44482000000b004b19daab53emr7267767qvt.79.1668787570069;
        Fri, 18 Nov 2022 08:06:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668787570; cv=none;
        d=google.com; s=arc-20160816;
        b=pyIq0unnSqo4Mn/xgrH2fElFTktfKemqVR1YgDhXqKfqpRM6isHOETkkMHgS2zF1wg
         sBEWeFMOj+VOxWCOWqZ6fq1Za+RmSm/M4RNiGWSml/KLC6fsJnZhUT+SCRGI/kngtuqQ
         w+Pf/0PU8kh4FP+0h0StqF0cnA8Zq6RZ4w7/qjZp3lhhXISpnYS1cCOcA/b4VriR9jq3
         oecJ6vjgqST3x0fiVPT1rc2qXe5whlGpTQnVdrDIUfNFFChaUrPvW4BFwzRRWxS1hBPe
         eoPDtqrU8tU1V3M7ZtcsG5ZozN1g9vV+6pVPDjypHPzpQX0c4wpOkcPZjqJho6frd3Ve
         A6bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bi4ZAZJvkgJv41SrJLHt1DuZHHcsY5lnonEqW8hQ3j4=;
        b=fofEyWCY8gvBF6Te7sWMrvZJgCpa9Y7EouXTC55SeI7uv79KieXlwD6+r981kR5zS9
         T4LsIQc8ZMox/fzIE3wJQL0MT4SvmbHqq+vJCe8DA2fmMEEjzImUggwh7tcckI3zliO9
         1av5t5IBDPifH3TILHdvpNODssJyR5ePHMBKzJIM+4qieESYkpQ5KJruytNrwSe0AOjf
         tKrNxNE1Pyqy0vmjUyIjESDqyvkg1ShBEMvPHbFnuwz9lfsQml/lOM+ouNAadOAS4wYj
         f/0jf40Q2BNuo49a8IVNEhzx/jJ5+CPzeiCu9Lzy6h3EIri6QzexFi+JKG0Fn60KsA5h
         QVRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uwAKI4WL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv8-20020a05622a4a0800b003a520b1e2eesi2217738qtb.21.2022.11.18.08.06.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Nov 2022 08:06:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uwAKI4WL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ow3sN-00005d-R2; Fri, 18 Nov 2022 11:06:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3s8-000050-W7
 for qemu-arm@nongnu.org; Fri, 18 Nov 2022 11:05:46 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3s7-0004nf-0h
 for qemu-arm@nongnu.org; Fri, 18 Nov 2022 11:05:44 -0500
Received: by mail-pl1-x636.google.com with SMTP id g10so4923876plo.11
 for <qemu-arm@nongnu.org>; Fri, 18 Nov 2022 08:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bi4ZAZJvkgJv41SrJLHt1DuZHHcsY5lnonEqW8hQ3j4=;
 b=uwAKI4WL2uvffHlebNWmcAOjzw+MDlMMSScYCOpnl2+hXnVon9THTUbV2FllNcd6TV
 S3C4GDsAgYjMEXi2N06ELYq8d/Ni/tIpcMEvvpTvHfZYv+83KAp1vCB2W7RHAMmyQgg6
 TMiEJtAI8YetF8ekEZxRTWxQtECQbx0tSPAPWK/UR3+yYc9wRGNPX9kXs4nyb3Zo1S6W
 yfGRD3cS/PF4fatPrG+zbkdJ7hDX3GcLy2jifTvkKUu2wI8oXn0WUxVmtSNIG1Akpnmz
 ULHSUCS9QzhZju4PNCvrP3xEK5cGTwhw++tX7mnRsKlyE6ssgZRjkAeyd+2UjlZMJq5C
 pNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bi4ZAZJvkgJv41SrJLHt1DuZHHcsY5lnonEqW8hQ3j4=;
 b=R7T4EoGvcTQnbEDRYQpQESRQ+Fz+IAIrDjml3LEpgcYD2buSrp+mliT9HoJ4/UbiZ8
 X85EZwXC+WanCCoNCQ00mwMFRDgtLtSETHXa5DjmIhmtoUALQL0I2sMDHLE37G6Qj/5P
 /HK1n6d5I1GUsIJ3CSWDsnmeognc6iezGSYHavEFZ31R80LtnYEekEivj5FY5pCh2Y7R
 dwNz/Kfq3bZAk4C2Wl9WLg6jzErkGjqqdn1MDRug/9dsn0yZSfgrlxv7cfQ0V6SLGor1
 RzLlv1WLobpBiJklEDMOxXBCYyqe6EoldwepaFGIbzCji53tI5ICa4+S7cyWm1uW57xk
 1W5g==
X-Gm-Message-State: ANoB5pnz/HLXHf4Oebm0zDQmaJ0fKPurlI276yycr45p+ee5QDiv/74F
 /6CYrFFdLal2lruvNPAinGBteBdfGR/oHSsihtlWKA==
X-Received: by 2002:a17:902:e950:b0:188:bc8f:5fb2 with SMTP id
 b16-20020a170902e95000b00188bc8f5fb2mr213266pll.48.1668787541420; Fri, 18 Nov
 2022 08:05:41 -0800 (PST)
MIME-Version: 1.0
References: <166783932395.3279.1096141058484230644-0@git.sr.ht>
 <166783932395.3279.1096141058484230644-7@git.sr.ht>
In-Reply-To: <166783932395.3279.1096141058484230644-7@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Nov 2022 16:05:29 +0000
Message-ID: <CAFEAcA-TcDhKLFJGpT67OJLq2PG3qk-2S9mbDix7BdviXDeyEg@mail.gmail.com>
Subject: Re: [PATCH qemu.git v2 7/9] hw/timer/imx_epit: factor out register
 write handlers
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
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
X-TUID: qgsmNLeSXDaX

On Mon, 7 Nov 2022 at 16:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> ---
>  hw/timer/imx_epit.c | 211 ++++++++++++++++++++++++--------------------
>  1 file changed, 115 insertions(+), 96 deletions(-)

Good idea (unfortunate that git diff has not shown the change
in a very clear way, but it does that sometimes). I won't
review this one for now because changes I've suggested for
earlier patches are going to affect the detail on this one.

(If you don't already, you might try setting
   git config --global diff.algorithm histogram
which I think often produces nicer patches. I don't know
whether it will help in this particular case, though.)

thanks
-- PMM

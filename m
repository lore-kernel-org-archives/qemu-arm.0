Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp2608169ejg;
        Mon, 22 Jan 2024 08:43:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+LNYz8rGK4zRbO6cC/L3Kp86ykFCUEhdcywg+OVAbPTvVStDiDHWOMZRPB1BE0JaEU70T
X-Received: by 2002:a05:6358:3386:b0:172:ab3b:cc1e with SMTP id i6-20020a056358338600b00172ab3bcc1emr3678856rwd.4.1705941812993;
        Mon, 22 Jan 2024 08:43:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705941812; cv=none;
        d=google.com; s=arc-20160816;
        b=ngJxXBl09uGY0d1HN8MDFK4BE75EepZmpLTik9kEu59/DAkzDxon01fHf4x6XyvKB6
         ttS7qwc15SlcB8DJSIAhrb3BOj6CQkgeCtAcCRPXOpBFf7BWscfwBgiQPAMN84b5nHqV
         dLUWAv7HNgqnF4UCGEDFfkG4mGU2NnT8Fy31Q4xtb24QaQTO4KhAh3cE5FsV/8q8RLK6
         VJTK/2d8FRSqKV/sLmq1/cBsPuB3EMzKh5TqciDLsuxuOQwSa913WEkYgtMjA76xejHc
         E2h1jzmPF+7FTLj28J8NV2dGq9BbYnZ3G2fmJEutE45BPeJiyd3bW0UfNZBxAoidEu7i
         +eVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=7o+3Lhp1y3h2TViNIsOiXVCDGhYDVPML4L+0I8nxFes=;
        fh=R0Uk93c2UowJAnA8LybPaViTSfjsv755BgrHgmmG7As=;
        b=mIHefcWEpKz0pAsOArybqE5U08etu3MXKfcQK+5YJAEwPT4ZMMRSwpu2Jp1+xXe1/M
         EqbEPjiNftiYZU5bOblSki6T4Wgidi0rcyxAizeTwD30rDILGU4WXDRT/g7IPwNDcgkI
         RceyD8vQivufA/a7QO9vVitKwVysC/8YNxYYREHkSDZy6Z7nkq55YLdq+5y2ZRqPoEYq
         5e29Q43HzTo4I6Sg04vocWsQMzjkCKDSq4O3t9jFHQfVav+/BSK5u6JtT0unQobjg+ML
         Y4awEdOKqgf+bPlCS0+AnsGx6sO7G+sC4GrQyxnmKvpNv3H64Cn194tyEPHz3YgZS/2L
         sZEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="RA/9/OPO";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11-20020ad44bcb000000b0068565df363fsi5658161qvw.36.2024.01.22.08.43.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jan 2024 08:43:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="RA/9/OPO";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rRxNv-0007ph-6K; Mon, 22 Jan 2024 11:42:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rRxNt-0007oo-KI
 for qemu-devel@nongnu.org; Mon, 22 Jan 2024 11:42:53 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rRxNq-0002eK-RR
 for qemu-devel@nongnu.org; Mon, 22 Jan 2024 11:42:53 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-55c6bc3dd54so553707a12.1
 for <qemu-devel@nongnu.org>; Mon, 22 Jan 2024 08:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705941769; x=1706546569; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7o+3Lhp1y3h2TViNIsOiXVCDGhYDVPML4L+0I8nxFes=;
 b=RA/9/OPOxmjLhlmBaQlE8f1TYv585QvRIxUSr6P0CA1J7mkDlwU6O6xVPaFWGNChZR
 YmyoPjegyxpLCFhtmNFXZcQ/JX1V4QeGs8Xp7G0ueLX0RETh7/orm74I22vKlDKvwAxX
 RKZp11WdzEAxboW7BXQon0vXbvhwei1KREOMrrqNfCbc2pHFwtEWS+bPWzH2HZDpqpeN
 Nlzz/RiT8Gm2K/kwjJjN6B0sGLxOeFDpBDMHP0hRBex5j4MxwFIzubODDqkcE/0RLKme
 pydVmGKB/1YToOmBBlRzOqg0SDw93qE1NxygrMpO2BwtZ5nhOht+Yj6tHluuGxQ75Ks/
 vpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705941769; x=1706546569;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7o+3Lhp1y3h2TViNIsOiXVCDGhYDVPML4L+0I8nxFes=;
 b=ZoefWCVeSlKZnuH39bBJkaz8PdZsPUHjP58pnhdfyuU3CzrRGT5tmqh0VRDNCmzQwq
 DxeXvhVXYhgehbRoaSZIkUxzc87ugjEpDDYnra5FdrZQEdwNCiPWLSu7gvR9Oquw3qQk
 ZztQFXm2hsgh7T346EaehtD5W/qR8RXiVFHT3aLxQ85O2QvGdbfFWuCb5N+SpBJ2/SpK
 9F7eqbTraC4IPX/P+2zrvS/DxVKnQ/BOwl32bgBkSsTFiDmr4TOBs+6LtAm7f0FlCNN8
 p4U7thF8+ANAmV0KkMz3LuJ5DokcbTG9fiYN0/yVFv6E5MCRHS4T31D8ld7VCKcokL2s
 B5Pw==
X-Gm-Message-State: AOJu0YxRkBAw8uwcDYzf4IXqvmfiBU9C3DejeDfCcNqrNoSsdoVn3Pb6
 PQ/kiG8OVM52Losqh1nJKPIvuHzgymw+HNSO63lQQhK6hby3z8DcqLkgOKsvOI7AeilGWSLcgoc
 GdfDwl87cKalyItFdEPcMgJIROOQHKvU1Fe9E1A==
X-Received: by 2002:aa7:cfc9:0:b0:559:f1ed:f164 with SMTP id
 r9-20020aa7cfc9000000b00559f1edf164mr216133edy.27.1705941769167; Mon, 22 Jan
 2024 08:42:49 -0800 (PST)
MIME-Version: 1.0
References: <20240119215106.45776-1-philmd@linaro.org>
In-Reply-To: <20240119215106.45776-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jan 2024 16:42:38 +0000
Message-ID: <CAFEAcA-v4Fj=0-FpGDMk=HwS5-NjcS-uJrqBLrxEqWk-rfJM8w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm: Unconditionally map MMIO-based USB host
 controllers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
 qemu-arm@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GsDaBQSOu5Br

On Fri, 19 Jan 2024 at 21:51, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> When a chipset contain a USB controller, we can not simply
> remove it. We could disable it, but that requires more changes
> this series isn't aiming for. For more context:
> https://lore.kernel.org/qemu-devel/56fde49f-7dc6-4f8e-9bbf-0336a20a9ebf@r=
oeck-us.net/
>
> Since v1:
> - Mention migration compat break (Peter)
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   hw/arm/allwinner-a10: Unconditionally map the USB Host controllers
>   hw/arm/nseries: Unconditionally map the TUSB6010 USB Host controller
>
>  hw/arm/allwinner-a10.c | 49 +++++++++++++++++-------------------------
>  hw/arm/nseries.c       |  4 +---
>  2 files changed, 21 insertions(+), 32 deletions(-)

Thanks; I've updated my target-arm.next branch with this
version of these patches.

-- PMM

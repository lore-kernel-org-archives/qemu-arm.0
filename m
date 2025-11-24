Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DEFCFD317
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Nov 2025 10:31:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vNTqi-0002Hj-Me; Mon, 24 Nov 2025 05:31:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vNToE-0000SY-QM
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 05:28:43 -0500
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vNToC-00026B-JH
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 05:28:38 -0500
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-7866aca9ff4so40371127b3.3
 for <qemu-arm@nongnu.org>; Mon, 24 Nov 2025 02:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763980115; x=1764584915; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2hyjjylEO1+Bxvt8srtSXcytEioak2OYTpLYSTUsVyg=;
 b=ufhLQF+0fnVZGhbRKIhs+EwRs800oQcAWMGBIBrwnBZdx9iGt3kjYnPrqXl2XoXeoh
 3MybLzMF7r0gk3+YGl3TMYAfkjeVG292tb21mpzwF8H5hsrFfuq+4xd7LKOqXNEGkcBd
 7WzXZ1SMhcWSAO9h2hoH2O+hhr4t+T5UKBgUU6HdNHfdTVtkU00qAR4SaxifZoQvV2rP
 EdwkH4PoO2wjTeHLCJfwoHMHaRNJLF6GqxpyDRlMI0pmBHWlcoW+3IECIciT+Ga/wzJE
 JDhPobZph+/9QLsdoExa8MKiAvtqH0mVpZ3zHqVQgt+M9YUGnTkncujizNrzLODu6d9a
 1VkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763980115; x=1764584915;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2hyjjylEO1+Bxvt8srtSXcytEioak2OYTpLYSTUsVyg=;
 b=TMkHL85fvTHTycV4F+oJRHseNnyp7Sm6a3wKUqTJshlb4yuEllL7u6y331v7A1YAdw
 K/oBvx5PWuEYG7aKR5Afc2fHI6tGGbvSwBJp+UN9NztDPbo9jK4SAopGGyicN6G1zg7+
 gj75KjffsYBzGAPwSiOkFJvxgUyQE3mETfOiBfgi4IxlZLC75lxQNI1Q2DUpg+ZKbjaa
 2NUQ7xCNPndLcTvfjYP4RuFC1YjdgmHkrno9HBGBqg18FmFvkWeiox0jPGmoUqaS3mT3
 uO0gsO9MjQMFx2VzcdsWniGgi7NkmCpAR1ikkvjTYrHcufsoZ34VzonytxVUAL57g8gY
 LUyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTZFkwxNBI/M324jATgudxfwdlVPYGDz/0i6sJqfijBAAz/SZO/7vHrPq3ClP8gOF/G9an6g94ug==@nongnu.org
X-Gm-Message-State: AOJu0YxD4JaVuxH07GwGxlGiidFE9YiPBNz9PfsddgBTJyqksHAlqwD+
 Dlg9WNxvjtkjWCWfqHnTI000w2/e3VNSDGz9517iE2hPrWVnbCyV+l/P4nK5EqOVPlrOxtlmO8G
 2zSXmrpHTz7GZjBPXpMw9qXb63nIgASzSOJ8YBqQJo+StW4BbLTKcOqA=
X-Gm-Gg: ASbGncsKFobcjB7GLbyzMgN8OQ6DBchTUMjwXFxHkaqWcaIEFgoaflzJ8q2WroEwRDk
 vNR4JngFsKT2Ui8Zr27+kCklIa7g/AiS4+Ru2K218r4j70t6ZCsDa7B3as1iQhyT2+1TZd2gqE7
 8lptTRXnb3O1cmgJV9Lf41BvQKvtCrCTobRZVzfTVpDtcOoGayoO2UpBgrdxl/KNFkEq4GKpQEy
 y84WEFvTyv88TmVqPh/WyKMK3nudZBULk3zz6LLB2Fg3CS9fbhy2573DQFEPwqzoXd6Aj0O
X-Google-Smtp-Source: AGHT+IFMBcLlHuxHDoFK0cwo3jStOECfk+AIUKxqXsfJy+dt3v5PxN/rMusM+lwycwDYsqx8rTrHlpUO3rhCPI5b/rw=
X-Received: by 2002:a05:690e:c4f:b0:63f:a3d8:1b24 with SMTP id
 956f58d0204a3-643029709b7mr7193882d50.0.1763980115108; Mon, 24 Nov 2025
 02:28:35 -0800 (PST)
MIME-Version: 1.0
References: <20251121093509.25088-1-philmd@linaro.org>
In-Reply-To: <20251121093509.25088-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Nov 2025 10:28:23 +0000
X-Gm-Features: AWmQ_blBP_fuX2EAOZD-5eT_3-WYhhRS_d01IaB_w_UAEjXzAgqGt57sJfB2YVE
Message-ID: <CAFEAcA9oiYmHifz6-2PCCbYcZ35eDAO1AvP2f1xJNw7U-v3-YQ@mail.gmail.com>
Subject: Re: [PATCH] hw/display/exynos4210_fimd: Remove duplicated definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Fri, 21 Nov 2025 at 09:35, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> FIMD_VIDWADD0_END is defined twice, keep only one.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/display/exynos4210_fimd.c | 1 -



Applied to target-arm.next, thanks.

-- PMM


Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1433C5DF94
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 12:19:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyTdf-0006cG-8E; Mon, 24 Aug 2026 08:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wyTde-0006by-Ke
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 08:18:54 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wyTdd-0005ti-4A
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 08:18:54 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2d5cad1a6baso31138515ad.3
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 05:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787573932; x=1788178732; darn=nongnu.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:content-type:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=zwFk7Qs7LW2zpArddxeb2NmtMBSk1hlDqg+eAqih/2w=;
 b=D10MMqq+QkaYbh8VAKHreEG38nmzEQiioh5WtTIkiL2UlAqX2yYmw2hwtY+i2AU8oZ
 M0NQdLQYElayjdGZUOJzKbxuM6PvUs1ZyYa8L5g47h/K1skMVDl+0qvBTxCu+VJt9LHd
 UEfTXznwqOgkB7rnWVsSnD7fsfEbH6QD1DworDOuDOGRi/BSpls2V0hq9+9541VX8ysE
 FPMCR9lI4wODzFON3PNSkv31B+BoOHnluS0+3OCoG9hbtJJ1EUadHwtaYgULtcEtM+Yl
 oHQ1n0kdLezluOdhA5COFXu0yJO5MdMe0MmPFs2rzixZSZOXhJiZu1xdE2TapCuCdRzB
 F+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787573932; x=1788178732;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zwFk7Qs7LW2zpArddxeb2NmtMBSk1hlDqg+eAqih/2w=;
 b=cv3Qi3GNgY5dBZMXNPMHd4Z64mmeJMwHGN18rZ37d1kVLT2X/kzrCNcu6WlGRiLI6o
 CdkMvxwIrI+f2Ig7JclziDUAlVAPy98nlTU9n26sqkXYJtDRbEV1DXIldmnacHqQxFal
 pqsC/ztHtku4CLo+pkpEtuPE6GJE7XGE5lb8ZpM+VAvPFuF4p4umP49aICdwQa3h0l1N
 0VkWIkoquU0js0c6uPCaYvyytILJoKEYnLj3to9gb3rL26yOE8uWoFN2tyvzsSlWvEp6
 qNABVf7RbHdHXaL9AyAQ/N2Y1Z3DLUZ6TfZve3OmhfJpBiKnmrDkGtIJD340obyZFzIf
 bQUQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpLrwpPXBx05LopvTLGbmDH6eTglWrWvltcac1PlMfZLDeIYQ8WduG/7qSnnDZAgUlh/dvGL1heQQ==@nongnu.org
X-Gm-Message-State: AFuF++kQ4pJzqvz4fwefkTk7y+9MX9QqYGDKjutTjP0JhnwxYkBkqV0T
 mndu/y9QdR1PDXRqopJOftI+1On/I9qaScESVUPC8A12DyyBbGE9j4Z1
X-Gm-Gg: AR+sD11FUiTWn+A37p6mR8uYDwgCHKEpNj6y4T1Obx6QEHeFCaTo6DaqCP/tRr7CxW1
 DXu1hT6Dtea5TFSpUeNAPDoKgc3lwzEFGZK8+MNRZovTl2CyLVcOGUUarhiEN3J/g2mWpQv0klE
 HwAbX4i7TDOAeuNKxoqawUpKI5S+Q7Tl1XC1KIQ+IcaGCoUbeK2tTYEb5wr7IjErU/ur7Suf3RM
 dL4ZCuI20HefpgSEgWWhIjpF1jr0PWyZQ6esq/YIFLo0xTTSfny3pU2Q/eXj7iMByCnN+Zqc2d3
 xJObwif+rIqMl1LhJsUlZOmSlxeSRZfS3aquvsP9ZKHjxHM0jW8DRw/LQXRZ8xlk8UCoyrNL0PD
 CjJpGKty+6ZGlR2HRbmwIxg31pt2M+ldq3mUf3dMrqoXFOmKnvlth4lHOXZEYAKris4yrjlaf3Q
 Du2sPLXtzy2qHC/Z8/V+VeHQRIzb0uSPUSps5mKDaaGdUDJ9b/moC/1FG8WzvgFoyYmewF
X-Received: by 2002:a17:903:2c04:b0:2c9:e9db:8167 with SMTP id
 d9443c01a7336-2d64ae365bcmr507511125ad.7.1787573931552; 
 Mon, 24 Aug 2026 05:18:51 -0700 (PDT)
Received: from smtpclient.apple ([117.55.237.216])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d6767b0aeesm16343435ad.36.2026.08.24.05.18.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Aug 2026 05:18:51 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v2 3/6] hw/arm/ax3000-soc: Add missing class_size to
 TypeInfo
From: Jack Wang <163wangjack@gmail.com>
In-Reply-To: <20260824030505.1969726-4-kchiu@axiado.com>
Date: Mon, 24 Aug 2026 20:18:36 +0800
Cc: qemu-devel@nongnu.org,
 peter.maydell@linaro.org,
 qemu-arm@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <118138DB-16FF-4F7C-8E75-92976E21A71B@gmail.com>
References: <20260824030505.1969726-4-kchiu@axiado.com>
To: kchiu@axiado.com
X-Mailer: Apple Mail (2.3864.600.51.1.1)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=163wangjack@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


Hi Kuan-Jui

Sorry again for ambiguity in my previous message.Before I only found =
problem in ax3005.  After applying the series to my local checkout and =
in my local it look like

 .instance_init =3D ax3000_init,
 .class_size =3D sizeof(Ax3000SoCClass),=20
 .class_init =3D ax3000_class_init,
 .class_size =3D sizeof(Ax3000SoCClass),

The missing `class_size` issue for AX3000 appears to have already been =
fixed upstream by the following patch: in =
https://lore.kernel.org/qemu-devel/20260821110101.3971391-16-peter.maydell=
@linaro.org/ in could confirm it

Best regards : )
Jack Wang

> static const TypeInfo axiado_soc_types[] =3D {
>         .parent         =3D TYPE_SYS_BUS_DEVICE,
>         .instance_size  =3D sizeof(Ax3000SoCState),
>         .instance_init  =3D ax3000_init,
> +        .class_size     =3D sizeof(Ax3000SoCClass),
>         .class_init     =3D ax3000_class_init,
>     }
> };


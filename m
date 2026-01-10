Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAFDD277D0
	for <qemu-arm@archiver.kernel.org>; Sat, 10 Jan 2026 05:42:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1veRjv-0007KI-OA; Sat, 10 Jan 2026 00:42:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1veRjt-0007Ji-67
 for qemu-arm@nongnu.org; Sat, 10 Jan 2026 00:42:17 -0500
Received: from mail-ed1-f47.google.com ([209.85.208.47])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1veRjr-0001sA-Qw
 for qemu-arm@nongnu.org; Sat, 10 Jan 2026 00:42:16 -0500
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-64baaa754c6so6710035a12.3
 for <qemu-arm@nongnu.org>; Fri, 09 Jan 2026 21:42:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768023734; x=1768628534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zkZ3g/PYYS1upNUgjJa89MZRfvZ4OxliVSa97j3PzXo=;
 b=W3mzVG8/tQyVPgrsQFNlinz8/7P2KsZqbpy9OcKoOHCHLOp7S9wzyR3eQxyyBtVBEi
 PzdQEXye7TAW6tZ8JQ7EPD83ZtVlnOmqdn4idjllwFYYD/smZJKs8Wcb9sfbGlAP1Wlu
 ihfZTGiFFFYrAaZVeVnKoXjwCKMBMPPZOKu3udOnzkKhUbRcyUaZNWuBZs1BNDhUZQHt
 Ovz7SwPxY7HoKOgGdX4Cy8Fu1Wxe5Lh4kYPE8Y5JLbU2jq7NChsEjFTML0wNJWGTyayo
 SzIK7X4DVUy+9haLu50CsDoN3nbGfUd6yPsC0GyZTtvLfOBDp3vzlC/3ppK3xx0BrBi9
 Yzaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWywQSm+39XFeamlJY+tNw7JtTZCvJzyzByS0UPzTmUSXjAdTQ7DjxgUMaWND6DWR+iCy2f8ER0hw==@nongnu.org
X-Gm-Message-State: AOJu0YwA+v7dRlsoAH5V0TOpw8ARRHJ6Fe61tLbBgHkzVzoCUw3GTAsY
 cdffPYwstp/+jA0ZFurM3lpUZ1832DO9ItysWpLq6wspK1Jf+i8fRB1d
X-Gm-Gg: AY/fxX6BB1ctcl5G0vC/heKr3y7MV3jGIRnY5AfL5kn+9ZWAfNmeqM1L2+IrkyliPuv
 SXkuFrN9QcXxDZ8qS0QqNXLVd7It/mBoco1S7glq2IOoS1fiOLJs6F5AYE+fP/7vQLphM5V/wR8
 iD0ShY4UC40h7zEFjo+TnubUJZV/ae9slUqvg005lIs5yTc3yrsqhQe8eRE4fV2KNuDIdeiXFkp
 J2g2TrvwoX5tIgbvY8vd03QAJ8PauijSMXmjo1mrYg8NvJb8eGwQhqQ4jPMt5zJDrymDCpN9Bfs
 8qR5wnt31PBNjArhJo2GvL3RAsfDEC2fW7oYJLi5goKrjWl1eXXWEgrwO9KVsk0Qf+HP5RPwacC
 1j/ePwpi0DAeUE0zKfu9KXI1I4sOFHHnA6c63+jsC7MU9A3naXBJR17FzGj9rWq+13Smj3UOslm
 k=
X-Google-Smtp-Source: AGHT+IHU+EVzbu2BPgGceKfUbYZbfiXbVVDhji/SMTbft2TAcuTVtIwnstWw43EMU4R3lxIuHHd4oA==
X-Received: by 2002:a17:907:2da6:b0:b72:134a:48c8 with SMTP id
 a640c23a62f3a-b8445232b14mr1156831566b.14.1768023733996; 
 Fri, 09 Jan 2026 21:42:13 -0800 (PST)
Received: from tpx1 ([47.64.114.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b86f61d2774sm70046066b.41.2026.01.09.21.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 21:42:13 -0800 (PST)
Date: Sat, 10 Jan 2026 06:42:11 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, Bastian Koppelmann
 <kbastian@rumtueddeln.de>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
 =?UTF-8?B?w6k=?= <philmd@linaro.org>, qemu-arm@nongnu.org, Yoshinori Sato
 <yoshinori.sato@nifty.com>, Yanan Wang <wangyanan55@huawei.com>, Aleksandar
 Rikalo <arikalo@gmail.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [RFC PATCH 03/12] hw/m68k: register a nextcube_cpu_reset handler
Message-ID: <20260110064211.40a4388d@tpx1>
In-Reply-To: <20260108143423.1378674-4-alex.bennee@linaro.org>
References: <20260108143423.1378674-1-alex.bennee@linaro.org>
 <20260108143423.1378674-4-alex.bennee@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.208.47; envelope-from=th.huth@gmail.com;
 helo=mail-ed1-f47.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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

Am Thu,  8 Jan 2026 14:34:14 +0000
schrieb Alex Benn=C3=A9e <alex.bennee@linaro.org>:

> This is a fairly simple migration to the handler. Alternatively we
> could eschew stashing the value in reset_pc and just re-read the ROM
> on reset.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  hw/m68k/next-cube.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)

Reviewed-by: Thomas Huth <huth@tuxfamily.org>


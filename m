Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C38C531CC
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 20:39:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vtAnv-0005Mv-4R; Thu, 19 Feb 2026 15:39:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1vtAnt-0005Me-HL
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 15:39:17 -0500
Received: from mail-wr1-f44.google.com ([209.85.221.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1vtAnp-0005LM-Mi
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 15:39:15 -0500
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-4376acce52eso864187f8f.1
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 12:39:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771533551; x=1772138351;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9BpgoJc/PzaqOPAtwlfNaqzjV6lvVbW8hPLr+UzaFYw=;
 b=EqFT+X2c/X5w3KwzO5pwTs+ALSxhKfJN8OfpDbvsv3hPVMWBFk5GfVG8q/ezOQ1dm9
 SV700GA9iomJnZWNsF5cCfS63MjpuAjsUrfUng2GRiUYKqVq/DTe+2bzasV8xyLu8/+j
 bUITwadJ2XGUDE43RWrt6lh++PG9qATjMrL6sndqDk2+Tl1KGzGQiZmkJwYIxECs0pri
 akKRkJ5XaZgdxZ5lDgj5cWBcDtg6ME9QPE1whBd1zll/fh1P+hskvzbcZlXbh95SY3yK
 PFIXtPs4SA76bUozz6LbjiYUCp9JF3pIqkpjUR5YBOZGUFnhzUTuL9Jj2QT+IrrdMiqw
 A6tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf3hiQbJpIy59XFp61iay7W/4o6Yj0oIcrXmMdoxcvvYlITo0ZymY9GsBUzh2QgMXSk0XXvCS7Kw==@nongnu.org
X-Gm-Message-State: AOJu0YwPlwADzhWr6AoAw+7UN/j1bcL8WrL9xcipSgjtJ9Mpc34AilsE
 Tp2dkRbfRzZPdYKVqsXOF/YasrTPpYeUs/B/lTrPcxoauAZSZy7r1mgB
X-Gm-Gg: AZuq6aJ7LURJ/vWJBjwKgZpYIQigAnLp6DaKaSrMHCZ/evdZH4qMqFmRZJKeYdfQYu4
 bTm+rMfUXhGBxnm6E5Z2C3oG8IXjukSoD7xPLP9JRu8xSPfFuhTSy4/+pNoVXKH6NnxaU51rAPj
 vK7v/JMg764Z57tx/J6pzzqhEnypK/zE0b8vRHLKTEEoo0/lPuAv5wPColLOsxT4u1QZ/qPxO5l
 grQctxal845OwSCmJJRa1BSz7K1zd9KfMRcLMsl5lXy2YhmOCHjuLn5TD6tPvWovAA5y0aJCPjf
 Qgvi60+oP461P93mzZrBNpPeU1tAKzgzeoNJ0wmydq8O5yCxeRMeO8lR3rBUFfNcLHIJXcAvfgf
 n12HnH8q+pwnaFuR9ULMAmxcWLMtw7We5p7oNr1rY/inyIEnv7eBip7xJLEtwAj27aLQjO8d7N3
 7KyFQo/2NOalY=
X-Received: by 2002:a05:6000:2f8a:b0:435:8ec5:d27b with SMTP id
 ffacd0b85a97d-43958e0cdefmr12054332f8f.26.1771533550927; 
 Thu, 19 Feb 2026 12:39:10 -0800 (PST)
Received: from tpx1 ([47.64.113.117]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6a5f0sm49846353f8f.11.2026.02.19.12.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 12:39:10 -0800 (PST)
Date: Thu, 19 Feb 2026 21:39:08 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Yoshinori Sato <yoshinori.sato@nifty.com>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Aurelien Jarno <aurelien@aurel32.net>, Jim MacArthur
 <jim.macarthur@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, Peter
 Maydell <peter.maydell@linaro.org>, Bastian Koppelmann
 <kbastian@rumtueddeln.de>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Aleksandar Rikalo <arikalo@gmail.com>, Richard
 Henderson <richard.henderson@linaro.org>, Zhao Liu <zhao1.liu@intel.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 01/14] target/m68k: clean-up includes in cpu.c
Message-ID: <20260219213908.6de1c847@tpx1>
In-Reply-To: <20260219171810.602667-2-alex.bennee@linaro.org>
References: <20260219171810.602667-1-alex.bennee@linaro.org>
 <20260219171810.602667-2-alex.bennee@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.221.44; envelope-from=th.huth@gmail.com;
 helo=mail-wr1-f44.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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

Am Thu, 19 Feb 2026 17:17:57 +0000
schrieb Alex Benn=C3=A9e <alex.bennee@linaro.org>:

> We don't need translation-block.h as the TB flags are local and the
> only bits needed come from cpu-ops.h. The vmstate is a system only
> concerns so we can guard against including it for linux-user.
>=20
> Finally tidy up the order to keep things together with the local cpu.h
> kept at the end.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/m68k/cpu.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index c721a23b966..d849a4a90fc 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -19,12 +19,15 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "accel/tcg/cpu-ops.h"
> +#include "fpu/softfloat.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
> +
> +#ifndef CONFIG_USER_ONLY
>  #include "migration/vmstate.h"
> -#include "fpu/softfloat.h"
> -#include "exec/translation-block.h"
> -#include "accel/tcg/cpu-ops.h"
> +#endif
> +
> +#include "cpu.h"
> =20
>  static void m68k_cpu_set_pc(CPUState *cs, vaddr value)
>  {

Reviewed-by: Thomas Huth <huth@tuxfamily.org>


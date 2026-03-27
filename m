Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1868C10F2840
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 15:24:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w692M-0005gl-K2; Fri, 27 Mar 2026 11:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1w6924-0005de-CT
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 11:23:33 -0400
Received: from mail-dy1-x1344.google.com ([2607:f8b0:4864:20::1344])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1w6920-0006Ji-FW
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 11:23:31 -0400
Received: by mail-dy1-x1344.google.com with SMTP id
 5a478bee46e88-2bd9a485bd6so4218803eec.1
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 08:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774625006; x=1775229806; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PzJcmu/U65FU4wQTMalP+dP1gUaMd8JFyXaRRb0LPKo=;
 b=OofQAQRWVprCDkZ98kqt4LWTVLuqdlJSbc8BahfMER4WSlmzY/U+eN9fK9eVt1VUcB
 RvDCs1DPfpG1bcOGmC7d+CScnAU3nZfZM5ZwC1FfQTR/Yti2S1pzOo7TfsTYYOKVswSw
 /SBNR4Y309fdHsnpL5SzgneoQn0e3MePhIePy2byzKBJ0zC9EvHcvYpWNdeLJzCPPVa7
 YcIu6aXIIhtM3cO+Od7RwRTsGt6Lt+sf3NNIJPBp9UAEpifKR7dqNSfhFxsest8rfvd3
 OPLhjfZVyfB3sp/1eid9YPNKxwE7D30z0OhhPqmd9JgYIiewHCCxXBQaieNcct542Eqh
 JiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774625006; x=1775229806;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PzJcmu/U65FU4wQTMalP+dP1gUaMd8JFyXaRRb0LPKo=;
 b=EmZ7G6tgbAy92M9rE2Qbzu4SWJHq+fCFTPGS4pZlQvnjjialF5D215IlCcvWIX+Z5U
 uXL7V61mQGgcRIxFYYbjWhJgaBSB+9bfB9veEpzXXm2teEABQ2zm2nvVLITPPxBBfBow
 05T3aD2FgybTxSWy2KrlZ1cqS1CLXz6csySFI+IAvSiazKwfbhDSdkX9ZNv2tuEXEW2L
 JdiNu//KxyRmGYY31OfSVAbZF6EtV4gt42qIAv71ryZ74GSDII3ux/KmShlvsYJbCsBz
 Eap6VA3unSfxyngvKY7F0KZ96ScDS1YwY0HnTx6zqLFnEkDY1zsD+zZUEhVV439f5S+N
 rMew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQF3zvaglJNxH/V5aq1FMj5OGDy+IQvMx+X6AoBVb+y1a2wqv825LxwCPM2dlw11pI46WMg8/h1w==@nongnu.org
X-Gm-Message-State: AOJu0YycL/rLmAj3PVVAhLqVyJW+8Zaey4zBvlwf157CrBAbhIBDtH+a
 QpFd6VocJjDVL3ojZkUgyOv+bMfysCzgWUBPm/VB35xmKuzrz+JmqHa5
X-Gm-Gg: ATEYQzxdgBSRPEV59d6LvjWPYYnn7NAl0KkT6kglQmR3oAhMyGpUB0TuS88l7V3g+9A
 AofIM5p7bFg2gIrEhh95fTPGvgPEZ8wBywx1hSJm2Zq3O0PgYIhNEGyf0UPr5XAscIS6lA+lCt0
 o/PMgxpIXkgRlB6wgK41EWP0vK0po0Qz4WRIU3BIpzU2CY5XQxmE40RAvse9LyK2dDbTPUjjLdn
 LA7L0Dynabk8izJz5brjZLEcmnRuGvdcQD2MbgVbvSkK5cT+/OJxjqBRCKKP7IM0bd2EuzJg0BR
 WA8OSDE/ckpn8yrOQPt0RShciTHzTTpx9mtVcbHONEr10ZrmsMgLE155iA3GiKHOhx80szUkvu7
 RFEurAK9+u9Uv5/bVuQzkGeXTnhVgYMeTv/Y5ydIrXrHX3fkej86u6ujVY2Fms1i33pJurHw9f8
 Bnv9Afa/A8tgW2EkjujPf0m9nWz/J0jwIV2L/qp8Enh5X+W34yF8cx2NUbGAcRfZPzM8OZcdERT
 QltDBanuhc7NPBtjyxt7dJoYK84kKw=
X-Received: by 2002:a05:7300:3254:b0:2c0:d92c:2c68 with SMTP id
 5a478bee46e88-2c185fad9e0mr1793181eec.31.1774625006061; 
 Fri, 27 Mar 2026 08:23:26 -0700 (PDT)
Received: from ZEVORN-PC.localdomain ([38.95.120.198])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c16ec4934asm5319735eec.8.2026.03.27.08.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 08:23:25 -0700 (PDT)
Date: Fri, 27 Mar 2026 23:22:49 +0800
From: Chao Liu <chao.liu.zevorn@gmail.com>
To: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, kvm@vger.kernel.org, qemu-riscv@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Peter Maydell <peter.maydell@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, 
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Chinmay Rath <rathc@linux.ibm.com>, 
 Glenn Miles <milesg@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v2 07/15] target/riscv: Use glib2 instead of
 strcasecmp/strncasecmp
Message-ID: <acagsTxLwZYmZaf-@ZEVORN-PC.localdomain>
References: <20260327134401.270186-1-kkostiuk@redhat.com>
 <20260327134401.270186-8-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327134401.270186-8-kkostiuk@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1344;
 envelope-from=chao.liu.zevorn@gmail.com; helo=mail-dy1-x1344.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Mar 27, 2026 at 03:43:53PM +0200, Kostiantyn Kostiuk wrote:
> This is a change in semantics. g_ascii_strcasecmp() doesn't honour
> locale but strcasecmp() does. But this is OK for at least one reason:
>  (1) QEMU always runs with the C locale so there's not an actual
>      behaviour change here
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>

Thanks,
Chao
> 
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
> ---
>  target/riscv/monitor.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
> index a9d3111444..bca04a7580 100644
> --- a/target/riscv/monitor.c
> +++ b/target/riscv/monitor.c
> @@ -303,7 +303,7 @@ static bool reg_is_vreg(const char *name)
>      }
>  
>      for (int i = 0; i < 32; i++) {
> -        if (strcasecmp(name, riscv_rvv_regnames[i]) == 0) {
> +        if (g_ascii_strcasecmp(name, riscv_rvv_regnames[i]) == 0) {
>              return true;
>          }
>      }
> @@ -358,7 +358,7 @@ int target_get_monitor_def(CPUState *cs, const char *name, uint64_t *pval)
>              continue;
>          }
>  
> -        if (strcasecmp(csr_ops[csrno].name, name) != 0) {
> +        if (g_ascii_strcasecmp(csr_ops[csrno].name, name) != 0) {
>              continue;
>          }
>  
> -- 
> 2.52.0
> 
> 


Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C58D277CA
	for <qemu-arm@archiver.kernel.org>; Sat, 10 Jan 2026 05:33:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1veRbN-0005gA-Lr; Sat, 10 Jan 2026 00:33:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1veRbL-0005fM-Il
 for qemu-arm@nongnu.org; Sat, 10 Jan 2026 00:33:27 -0500
Received: from mail-ej1-f42.google.com ([209.85.218.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1veRbH-0007Z4-Dj
 for qemu-arm@nongnu.org; Sat, 10 Jan 2026 00:33:25 -0500
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b7355f6ef12so904762866b.3
 for <qemu-arm@nongnu.org>; Fri, 09 Jan 2026 21:33:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768023201; x=1768628001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6ZJM9+Qb5R3H/JqYUjp/RvWtsDXW5WPQG7eijFBqulg=;
 b=t5HgGIe0erXyeScKQs6rvcWItkCKV6zKybzk0fKyP3gMWF0DtwxHo50o0A8dYXzvST
 wCrROq3lByoFGxmispZRC1AhZgig4Q3nXlTn2bIUkHhVx/ef0pyspkncXTnntlzvb1dz
 2jrewYbIY0ZaHWlTWfTpWd9RPHK8U5Hfl8GDCQnnm9CLJ18VlWtlNrR6Te7FqDc7GXgj
 y9nKBI13dqkPIuSFyA/Jcyc6e/ou3Twv5vjB4NjBSXcFjn0gfKloK/I11vmRmme77Jd8
 kw79scIMau66XsBJJlK32ldCwWwxfG2TWTkzfbM1PCturCaFMKkCb+c/vKx2bmdnIuRF
 EqzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+9AAHNmI4L/Vh4SSgzOJ5Nfbdxp/q++0Z6KGPWEHI6rmmcUMkWSxCrxJ4c+9taZnSYPPXDJVGjQ==@nongnu.org
X-Gm-Message-State: AOJu0YzwuzofsSpPvLddZBnEK1lEjhtrylU2oSGKc1ORrfq2CnNXV9us
 WPhpPXUVMrobiFfZLNAmUb0xXxnU4ujSESjwn4Lz/TRXNaD/3X1Mgi7F
X-Gm-Gg: AY/fxX5enqhgd/vAyJFPzyE51WQFJc3f77zsjDIokPxvPCoEGLedOK6YiXn5aIl70V9
 TJD2k9pVr5SwUhP/udHTPcLBGS2v0lAzPHRCFiTYA70Oz+J1EbxE045Bw+TMCuiQWkRzsVtrL0q
 Jb9iUp6dKiaqf7A3VcDlAQHu8WDssjoj+Gb6O3d4HWrVzVm8DPDFKrhax+PNJfaENWzEWCuc4ek
 cdtSK7bfNx3IEmIF1Zn6QVKEr5Pt5uHlch/+bzPM9STy8EvgtntWyZ5/R7IFL7hMaE2l6Fl45nJ
 grjyjjcQp4kk+dmeifC6w9ZYorhRkqcZZ6rtqR1s4UkqhdnqS/Oq+meMY5DeIzR8gOZthN4iAnN
 FgMt2Dgrqv/awEdc+ybsXDsRazxtxIXWlEuUU7SsUR3sB9gdJ2GPYX2bKTlHt62k+84YkxRZwhw
 Y=
X-Google-Smtp-Source: AGHT+IExWRr5JVdYHAcJM2mVArTFlt0PJWqFpyIFMwyhmdizG/7Pg9VpAVShnvab0J7VJmLTx3TlAQ==
X-Received: by 2002:a17:907:60d4:b0:b80:413:16d6 with SMTP id
 a640c23a62f3a-b844537804fmr1121005866b.44.1768023201181; 
 Fri, 09 Jan 2026 21:33:21 -0800 (PST)
Received: from tpx1 ([47.64.114.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b86fee09163sm5120966b.26.2026.01.09.21.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 21:33:20 -0800 (PST)
Date: Sat, 10 Jan 2026 06:33:17 +0100
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
Subject: Re: [RFC PATCH 02/12] target/m68k: introduce env->reset_pc
Message-ID: <20260110063317.38311d23@tpx1>
In-Reply-To: <20260108143423.1378674-3-alex.bennee@linaro.org>
References: <20260108143423.1378674-1-alex.bennee@linaro.org>
 <20260108143423.1378674-3-alex.bennee@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.218.42; envelope-from=th.huth@gmail.com;
 helo=mail-ej1-f42.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

Am Thu,  8 Jan 2026 14:34:13 +0000
schrieb Alex Benn=C3=A9e <alex.bennee@linaro.org>:

> To transition CPUs to use the multi-phase resettable logic we need to
> stash some information for the reset handlers. Arm does this with
> arm_boot_info but for m68k all we really need is the PC we should
> reset to.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/m68k/cpu.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
> index d9db6a486a8..fda015c4b7b 100644
> --- a/target/m68k/cpu.h
> +++ b/target/m68k/cpu.h
> @@ -155,6 +155,7 @@ typedef struct CPUArchState {
> =20
>      /* Fields from here on are preserved across CPU reset. */
>      uint64_t features;
> +    uint32_t reset_pc;
>  } CPUM68KState;

Reviewed-by: Thomas Huth <huth@tuxfamily.org>


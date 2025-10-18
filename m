Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E560CCD193
	for <qemu-arm@archiver.kernel.org>; Sat, 18 Oct 2025 05:52:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9zrl-0006wj-Ev; Sat, 18 Oct 2025 01:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1v9zrj-0006vr-IB
 for qemu-arm@nongnu.org; Sat, 18 Oct 2025 01:52:31 -0400
Received: from mail-ej1-f45.google.com ([209.85.218.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1v9zrg-0008GN-Fk
 for qemu-arm@nongnu.org; Sat, 18 Oct 2025 01:52:31 -0400
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b48d8deafaeso552618866b.1
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 22:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760766746; x=1761371546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kC5/uJPP3WnDo5AHh0vgk9XGDlztc0ecSESwKOHyIvY=;
 b=IYPGalTTfgRi7+MdNeyIFVhxC2WzviXO/xOunQY6A5QeUHvGD1LQs2isgjDMDHznoi
 f2DR1cVEeq7WmZ0wcvTIqqbKPSIYZdyqDEAAg+ikeG1ACirmtwGmBlUV4ynGI8z4a7Nv
 WtnFPk48gkO2qGc3vUuLJWZVBCR9qwXeiRpOXJT/gY+l0w0hDkv1tC59ai6fjFD8ubBU
 tyFtITI6dmCogFDocs3wQN+zOzcJKlQR4AyELU4y7xdVH1C/N6Jf7fKl70wFTnpX+Udp
 l5Dqi8NiHREu9l2f7Vjju8BuXRlW9Tai735532PuhI91bhOO7/FfyH4bFgRZZv3iFa5+
 C2MA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDX3hpX75TOYumBqcVVZ8iVLyBSeVmoD5sxBUr/n8Q/QjaFjKZTR6x+Qol+DJqJkC39Ajc2U34SQ==@nongnu.org
X-Gm-Message-State: AOJu0Yyo0GkjVMSxoyBqSuWeWHbZjZF7vSKKMWpwicwXUb6E7ZGHbl+H
 /8m2UaL5MadAfSOrIRrmVGpf6awCy8IBZK4iX+S2g5wEN1YEPhra4kZa
X-Gm-Gg: ASbGncuM0GwTvYjY53GogK/ux5KwYBkQ/vUAeh4lWndEFC422heo0Ot050I6elqkj/E
 6MxgFbqlEfc22pdg/zoCc6pPgZZXHUNRp4bnC7ULGBHrkOXzQ8K0U5Kbl12tXNnctr4XQc2YICy
 1f0ZmL6CPV6faGTkHmO8sPQnFhikwfT9tn8As4Dsvzp7kXgbiq8WPrT3vTCAcVXzP5AWkOwcviv
 C/ktBYFW9w29KZ8T0w7wz4hRtuYqXBESLE78j0f69Xi63FPqlCcdHIBFF2ljM2hH3XFqspzjtlb
 yIAfxm/KuHIoWGXsADGs9ma0qFAY3ZcHG0kHNgSkJZt0HR60oXBkhdc5tLtCnXB+FUVO65S0fb1
 f5MUlU6cmZ4Ir+4r/MYf9giBXk9L2GeVF0hoxS0QN9sThVdiobH7P6I6qs0ymwQSuJgH2e3ecNG
 74jy7s2oiZ2JsADUc2AsJZgiFLU7RI8Uv/
X-Google-Smtp-Source: AGHT+IEwM7hkjdYadSIZ/B1LrJ6NLoLeCs3l9kSDnXN0Bzcy3G/cTbunueoKKeMggcWXJ5k6oQ6wtw==
X-Received: by 2002:a17:907:c06:b0:b46:8bad:6977 with SMTP id
 a640c23a62f3a-b647235ff0emr769025566b.18.1760766745781; 
 Fri, 17 Oct 2025 22:52:25 -0700 (PDT)
Received: from tpx1 (ltea-047-064-114-135.pools.arcor-ip.net. [47.64.114.135])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65eb52603fsm167889266b.57.2025.10.17.22.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 22:52:25 -0700 (PDT)
Date: Sat, 18 Oct 2025 07:52:23 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, Peter Xu <peterx@redhat.com>, Laurent Vivier
 <laurent@vivier.eu>
Subject: Re: [PATCH 06/22] hw/m86k: Get cpu first addr space with
 cpu_get_address_space()
Message-ID: <20251018075223.4f8c47bd@tpx1>
In-Reply-To: <20251001150529.14122-7-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
 <20251001150529.14122-7-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.218.45; envelope-from=th.huth@gmail.com;
 helo=mail-ej1-f45.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am Wed,  1 Oct 2025 17:05:11 +0200
schrieb Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>:

> In order to remove the convenient CPUState::as field, access
> the vcpu first address space using the cpu_get_address_space()
> helper.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/m68k/mcf5208.c |  6 ++++--
>  hw/m68k/q800.c    | 17 ++++++++++-------
>  hw/m68k/virt.c    |  5 +++--
>  3 files changed, 17 insertions(+), 11 deletions(-)

Reviewed-by: Thomas Huth <huth@tuxfamily.org>


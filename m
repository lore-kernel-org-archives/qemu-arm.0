Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0864CD277CE
	for <qemu-arm@archiver.kernel.org>; Sat, 10 Jan 2026 05:50:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1veRrs-0000Ug-8Y; Sat, 10 Jan 2026 00:50:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1veRrr-0000UI-EC
 for qemu-arm@nongnu.org; Sat, 10 Jan 2026 00:50:31 -0500
Received: from mail-ed1-f48.google.com ([209.85.208.48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1veRrp-0003qD-0N
 for qemu-arm@nongnu.org; Sat, 10 Jan 2026 00:50:31 -0500
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-65089cebdb4so6000120a12.0
 for <qemu-arm@nongnu.org>; Fri, 09 Jan 2026 21:50:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768024227; x=1768629027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eRE2jIFI4PRbT5D4j3A4sJTwO2YmFR1VHKUIeiGdRb4=;
 b=X4lp03wUwf0UAPmcPyUckYXYRhRqyOsL5OCaSQmD1nxqAHXL365OcWuzM5YSbvXJSJ
 Q5DvRQj4j6830c2j+rySVAn6jfn+FBNmkC4YsJVJ1nHv1w/rYmMY5EnzXAVwif5FWNRt
 GrkVeHmO2ri5PpgOLmha/D29JXkTpsbh+fc3/WQK/619IE2LiqcodaFu3+D5tL9hIo2h
 OMapjh/6jujP+KaLPurRopEmOT78fw+h2jAqQF1FieiFfFPu37izaW6cFuM7+lPKA+th
 nHSIVKxtP0kDZuddG4CeVLgTBOfQBTNt8QE7C9mLcHeNm3qaVKF++j74pEWAFsz5DOzb
 3WxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX8PWHVGO1BOqq7uqQ/cqN+ZEL4rC7d2suzT0XTjr0sS9j/Kd6yf3zJ4av1tKPAHzUu1n40pIpEw==@nongnu.org
X-Gm-Message-State: AOJu0YwdlDHgCZJCDy1J7b71RcYqOfLbCoYnfrc6c63tjZHRnR+u8YlO
 CBQaBYNAPpdCvTkpE87XdByqusQoL+GeBYzx88Dh9sXTkC348Mj2Pmar
X-Gm-Gg: AY/fxX7447CgvaB59+L6488ggkDrIXhdN6ibuZk6tNRJcJ8Hhz1++aXk1Ff6lPxapNT
 PQ0tkL03JZ+AGgemh91Cy19SSNW+GRXn9/okECBQNOIy8vpsePgQiYhPbQrEV7LbJ3pFAg7Wc9k
 7YLNskiqJ5gAohoNpWO3gQ2/TJ2f+aT3QuK5CnAKhscg+B3dDnzlaxwRqUs/8tYV7KOIoXidzkk
 WG6fYg2Q1TkrzKN8c7VLPMIN+TmAG8XUoNL5rivLKgosG5oTY1sVPF2KgZuXQ2uV2DthNnbv+1g
 9dTBHhNoXBf9jh60daj8V84uZj4Vo6X1h1KA5pyyHDIGKF5OLoM+QQeIXGTjb330BbQEuX+PAws
 Er7l9UG2gA/IuzFTvp3R69Vu4TMJS0gDKx+/C2uOytWlYOA28/Ke5vbEpAT9poutZD3k/mkq9CR
 U=
X-Google-Smtp-Source: AGHT+IEL1nXMeq2BJlsHuAy52u5aoRVpFjVRq5SiCRAICb4i7q/TqCJNzz6qu1PFd+45boSGk/vHHg==
X-Received: by 2002:a17:906:f599:b0:b83:288a:2bce with SMTP id
 a640c23a62f3a-b84451f1870mr1249853866b.24.1768024227225; 
 Fri, 09 Jan 2026 21:50:27 -0800 (PST)
Received: from tpx1 ([47.64.114.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a27bfcasm1339724166b.21.2026.01.09.21.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 21:50:26 -0800 (PST)
Date: Sat, 10 Jan 2026 06:50:24 +0100
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
Subject: Re: [RFC PATCH 05/12] hw/m68k: register a an5206_cpu_reset handler
Message-ID: <20260110065024.707a75f1@tpx1>
In-Reply-To: <20260108143423.1378674-6-alex.bennee@linaro.org>
References: <20260108143423.1378674-1-alex.bennee@linaro.org>
 <20260108143423.1378674-6-alex.bennee@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.208.48; envelope-from=th.huth@gmail.com;
 helo=mail-ed1-f48.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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

Am Thu,  8 Jan 2026 14:34:16 +0000
schrieb Alex Benn=C3=A9e <alex.bennee@linaro.org>:

> As the mbar/rambar0 values are currently fixed we can migrate the
> setting of them to the reset handler as well.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  hw/m68k/an5206.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)

Reviewed-by: Thomas Huth <huth@tuxfamily.org>


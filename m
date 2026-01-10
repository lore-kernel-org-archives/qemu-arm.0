Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEBDD277CE
	for <qemu-arm@archiver.kernel.org>; Sat, 10 Jan 2026 05:53:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1veRuG-0001F5-W2; Sat, 10 Jan 2026 00:53:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1veRuD-0001EJ-Ln
 for qemu-arm@nongnu.org; Sat, 10 Jan 2026 00:52:57 -0500
Received: from mail-ej1-f45.google.com ([209.85.218.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1veRuC-00045w-6l
 for qemu-arm@nongnu.org; Sat, 10 Jan 2026 00:52:57 -0500
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b86eea8a26cso49457066b.1
 for <qemu-arm@nongnu.org>; Fri, 09 Jan 2026 21:52:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768024374; x=1768629174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5KaRVfD8vFBWldhz15PDRk1OWb+fX4kJPAoKXrOuBf4=;
 b=BmzI/JzcH3cc2BsPH9bDuMy9ZdVAPCRN2STd7NnhtTp8tv2PVOjcQVIWKB2KjGwz8h
 7EomBOXIHnVTOQt8Le741ZfJmxClszzPPrzSeXuoR7HP2Rr1M4pWKfGRxmqDHUq9M2Tp
 KDDizMY72AyCgW2ccPTrrjOXN38Esnz+1paBMSwIW5JwoSadYRnTp/B6UfIgipKup01K
 aVwBCiQC52kP9xs95E/Wgrd7Hy8dtzXyJHTOYIwzxo//C6mTi0RJg//S5tRpsPnEELZK
 8KA2ynwLNrwqSfjAavCAHeYXeLV1ZheHYt3qbaaexyl0vlGHdPDShIdZqZAx3iMo2J3n
 k47A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGEL2bK/0tV8sTtwo1QegEQ35O95HDZ6eYTfSEV1ouE/JByxNdPRFHLTG3JTWPJYN8Xhy5lDbamQ==@nongnu.org
X-Gm-Message-State: AOJu0YyNQxhW0nHancrZVEaOScFru64tGAVyOEVXn5j9oBP7hLxn+u8s
 7cmrsVXgs5xCNIc/yUlYqAZuYbMOXaSRx2h+mHZdDe1hjxwALAdMsSMO
X-Gm-Gg: AY/fxX7kTVabWsEOhX1U+g2haC7Zi3C24gxF2DQL7o0Cd0ooGLUf5GR6o6yXs2QTXeg
 YrDwrcUUKUuvd9pKdnQICUvyqQjJJb5M+m6f73M7nS4jISrYTX1masOC803iufkMtwopD9jHqM0
 1y21GVA/OwPowEZn5K8IXM2uv9zq4omc4FsFjTzCmP5aYTXps6X9HAqH1Az4eGeI++PQ52dmM1p
 K8JMfO1nQqXDtM8AmT6g2uf8arUMN/jO15uRS9e3heUsqEV5Gj5FT7oglDNF9JuqjJJ3sy+Z8ML
 aARRj8G23BLelGfyrYV13QRMDYEHDy72WtsqP+OitSgm762g+UJk4/dsPR/oBH/ZKlcFUfAZ4Uh
 sSff6DaTLEPRULMSCkUBPABwtj5ouLzRDra0EzqTZxB9Eh1pPztcGT+FBNGVgHqmnv8ih4rylV6
 M=
X-Google-Smtp-Source: AGHT+IF+/4UuRKDaJV1QBx2sRsvMqnwoziK7A/CTDBA27UijfT8nuRN3tr4UMvgEd2gv54W0AiWT0g==
X-Received: by 2002:a17:907:9615:b0:b70:b9fe:aa56 with SMTP id
 a640c23a62f3a-b8444f3f882mr1297460966b.20.1768024374508; 
 Fri, 09 Jan 2026 21:52:54 -0800 (PST)
Received: from tpx1 ([47.64.114.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a233f2asm1313540566b.13.2026.01.09.21.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 21:52:54 -0800 (PST)
Date: Sat, 10 Jan 2026 06:52:51 +0100
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
Subject: Re: [RFC PATCH 06/12] hw/m68k: just use reset_pc for virt platform
Message-ID: <20260110065251.16ee2e03@tpx1>
In-Reply-To: <20260108143423.1378674-7-alex.bennee@linaro.org>
References: <20260108143423.1378674-1-alex.bennee@linaro.org>
 <20260108143423.1378674-7-alex.bennee@linaro.org>
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
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am Thu,  8 Jan 2026 14:34:17 +0000
schrieb Alex Benn=C3=A9e <alex.bennee@linaro.org>:

> We never actually set initial_stack so revert to the previous
> behaviour and stash pc in the common env->reset_pc holding place.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  hw/m68k/virt.c | 24 +++++++-----------------
>  1 file changed, 7 insertions(+), 17 deletions(-)

Reviewed-by: Thomas Huth <huth@tuxfamily.org>


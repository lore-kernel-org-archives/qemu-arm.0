Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CB4606A32E
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Nov 2026 01:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N4NGqQr9
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRfg9-0002Lw-CO; Thu, 12 Nov 2026 20:02:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick.lister.dev@gmail.com>)
 id 1xReGw-00052S-QO
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 18:32:03 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <patrick.lister.dev@gmail.com>)
 id 1xReGu-0000dR-9I
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 18:32:02 -0500
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-8b58d6f67a5so167905b3a.2
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 15:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794526318; x=1795131118; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=kMzA7RdrHgK7flc6um3AlTABD686DqJETvpWPCal8Zw=;
 b=N4NGqQr9NUMIdmGbRkPgiZTLnmeJAesm18hVVsE9fQvt/AMLu0wkQN3NvECepM687x
 qx4DMzJa5qOJN1WMeraDGn9usQEXAXUNbtihAOp1LwAbg+aE/k6Kka1LW5GC9ObjtsvH
 pRslC/NG/EqNFF8TirQpsJ3XMMkxX0TJJHGBfQaNfc0ixui2oaHxG+8BaRnS9Sr6lG3P
 8NvAueJhkYPutFKbS4Gzxq61t4YhtiP/q17wLG+a+jYxNS8Aumzs53Y0BRsBlHFSsxcQ
 XBDhHA+2gReAuBYV7rs70WM4Ku0nwVLSvu0uzAoB4gxN6Uek3667zN6wENIW4vXtEE3Y
 VOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794526318; x=1795131118;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kMzA7RdrHgK7flc6um3AlTABD686DqJETvpWPCal8Zw=;
 b=XRRw82JmcdWw5OQkQUc9pUqn7VAh82dow9G5bDh/mT9DXcebb1k9JPltlmI2wsMWHa
 Y8HbCFqQAkYUcZKqrvhYOdmcov9t+OoQeLG0cIsEHRl92B+8VdYaGaiWm63k+VBLJ99F
 sW3MMH5FAeWpLgkANCPqUv1DljKuNRFXvrdHlz0iCrOtXElVtikgebfSoPC5leIHahPi
 rG1nug9aPAPhnDqkKHLeBP1+bOWCIkvn55TMIwLOLV5CRzXdPfp2pq6RxF57hYE2NULA
 RnkCS+R2Oaqje1KSK9QsE2P2H9KFj4JKpGBkijwuKf96+abAOjF6+8PT3uaU3NtpzlOM
 xvjA==
X-Forwarded-Encrypted: i=1;
 AL+hErFXQmrDcmm+4PnQxellNrrpr86kaLJ+boReVVRWTUY7EwnzWjtIlC3A4RPqrNmDc+r+PK5uRjln2g==@nongnu.org
X-Gm-Message-State: APuU4Z9Xq1Fs6gBP//lUFc8EvK5cNR85xqyy5aPglGFJOqeRjtAC769Q
 AKbSLgCDvpnKoLJoxrEwLZU8aw+20nDEv0xlwJU+Hxcehmu3xAU/WWQd
X-Gm-Gg: AYBFou3b49PcvYOFwwvyG4hFQDisg0RqenIqw44VRSLZqU16WEn6s5idRHmIhMHcRck
 hFZ1VeJfi103mTTeiEsxquUdEhX2rdzQIt8knp0weUrRdEa26rEnolR77JcJCXDko2H1rlHgDFu
 L6PJSNqTNHOz4gjwsvbECM7xEYByGHnpLHndm1CRCVQYdBsOCP7AX8gs7XVHom8Vx00+zrI67DD
 hfpyXU+J98X/tWIIzoK4JMeC5pkdBQfhT9063DW9eVtymS6f00vy/c8pS1J57w7ni9UOn3PND9/
 trv6UhO/0t8G5jnnAyqaZ2rhysm7oUkfpD9TaZ8FooypV5vEbqFb3B4l5i8phosldLvm2QBPJf0
 5cAuE5SHsL9h6LLSeYats781X7asgBTrCy1jeiY8ekrzZ60g5sc6rr/j4AOpCjp3pJ2/0IqwNzC
 0yitAID3uDehvpru2mYSE65r/H0bTWwTZ5foL2txD4wcSmTw9k0iADCbwKqm3OPmpP3bO+rUtT+
 gh/27j/1y3T4cknLcMt5dPNJ97gb9aGtrl2l61Of2NOYViSBA0OS4NSbAm/feQujOvUpE1paexT
 7/06Yqslie4sjVP/Uz5l3Zv1lycZzHkJtnyvZ5PRCYWLAQa6Q0aH95s6HEn+184tr7IfFqlQGzC
 XRmM0qRMTcn3dSSHEzPrpTXz169b6
X-Received: by 2002:a05:6a21:6f09:b0:3e8:b7fd:6265 with SMTP id
 adf61e73a8af0-3f7a72ba1d5mr589620637.23.1794526318165; 
 Thu, 12 Nov 2026 15:31:58 -0800 (PST)
Received: from prox-debian13-dev.listerlab.win
 (203-96-142-148.dsl-dynamic.connections.net.nz. [203.96.142.148])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cddc18adce4sm317815a12.23.2026.11.12.15.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 15:31:57 -0800 (PST)
Date: Fri, 13 Nov 2026 12:31:37 +1300
From: Patrick Lister <patrick.lister.dev@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Keith Packard <keithpac@amazon.com>,
 Nicolas Pitre <nico@fluxnic.net>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Nick Clifton <nickc@redhat.com>,
 Richard Earnshaw <richard.earnshaw@arm.com>,
 Ramana Radhakrishnan <ramanara@nvidia.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Riku Voipio <riku.voipio@iki.fi>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 luis.machado.foss@gmail.com, thiago.bauermann@linaro.org
Subject: Re: [PATCH] ARM: nwfpe: use task_pt_regs() to find user registers
Message-ID: <avZMWY2UBFdBLrqW@prox-debian13-dev.listerlab.win>
References: <20261112025159.473997-1-patrick.lister.dev@gmail.com>
 <0384a52a-31f6-4bbd-9de8-8efe73610e28@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0384a52a-31f6-4bbd-9de8-8efe73610e28@app.fastmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=patrick.lister.dev@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 12 Nov 2026 20:02:06 -0500
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 08:58:53AM +0100, Arnd Bergmann wrote:
> The patch looks fine, and it's clearly harmless to merge as there
> are no users, so please add it to the patch tracker according to
> the instructions at https://www.arm.linux.org.uk/developer/patches/info.php

I have submitted patch 9527/1 as requested, thanks!


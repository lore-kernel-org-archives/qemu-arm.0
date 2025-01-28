Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3441034njk;
        Tue, 28 Jan 2025 15:30:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWqnuVy4p2ZupxZCNSKJp0aGcwJe9DRrTS6aI97JHU81fmhm8sd8Fx9Vnl04YL233jb7t5RBerIZt6QRg==@linaro.org
X-Google-Smtp-Source: AGHT+IFxhKUKR1Nk+Frf4nLY2KC/wHLoQ+aRn4i33EYHP+ej4roIDxiZI8RPnBexyLX33GRSqnlB
X-Received: by 2002:a05:620a:2a10:b0:7b6:deab:d485 with SMTP id af79cd13be357-7bffcce52c5mr106947485a.16.1738107050312;
        Tue, 28 Jan 2025 15:30:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738107050; cv=none;
        d=google.com; s=arc-20240605;
        b=VSyKrSk587OEdbDcuqDuwDDwilZ4ES7Zl56SrsOoiyihkZ3chAnrf58c0TQMWgt8Wy
         Y/YtVab9tcc/CoR12EdFZdxZ02qJSd0+BJpLSqMCp1+gxhBibvUFiOa/krw8IMuyGKsc
         Gc1BLUf7bUw8dAi8KtIQX/RqVz00eGNCydp1ka6R/RTpndhZ1+k/mFnjnJCII6WimW1j
         v4EdD+XPP8oKwUj2R/Eb2X7U8BUXt4YwRnYlCaQpnC/iY56Tbka6llm9f5k676umAFdM
         RqWLvx+xslEkelkwBQZvu7p9mANTYbzP7wPY8h9KJiIHu26k1mj8m0ZNtZRTSQR1Cxh7
         XlrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=5Fe4Kd9zjpckFGitNEIbV20ei3cICRR3NvaaUVbexI4=;
        fh=4ubiFxNUfpRvcKAYgMhH+gyfBqh/MsXOhDxn6vUYmHU=;
        b=LklH2Lm1ayCKSTXec3ZAoNKa2iwl17aW9edpi7srw07pmZ9mGekh2tJXkUcgwxY5ym
         smtAwfKbvVUO2FN4Z5xNugp2YPbfihmjIcJ/PtDTOCzBXyjDKxaHBmFfQNWmVNDdsIWs
         OVwRdKlW40feCeckmOJ9/NOepJguuFjjYPg0wNBobjGVZrlcZqJbVX2u7a9Wb47rGcAZ
         yxlD292jFK7JP1mNSKZE5y/O6gctjC6sNwSQ6yWpIu52JCszfonqPu7Ynpj9/TQ3ej7i
         aulkJl1MhUCPomqcGxE+2oKxhIQ2Bk2kCeX8Osd5+a+ewvmALpBcAV85BOVJt4/JvL+4
         WEqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=PZySY69t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9ae81dfasi1528048985a.88.2025.01.28.15.30.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2025 15:30:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=PZySY69t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcv29-0003Wo-Lp; Tue, 28 Jan 2025 18:30:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tcv27-0003VV-A0; Tue, 28 Jan 2025 18:30:15 -0500
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tcv23-0008OX-V9; Tue, 28 Jan 2025 18:30:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1738107000;
 bh=5Fe4Kd9zjpckFGitNEIbV20ei3cICRR3NvaaUVbexI4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=PZySY69tTwJnce1/IEs79QK2+xCnKa5fKUgVE5TOucmyNw3CoJRT8LxRVPKrzuGVK
 CUE5Iq3b+VPmGNyB2UDw+LjuguX5kUVnqvo/xkqKfLAN1jRfLkMGc/yTvTxXD4lqZW
 g/wPezXhJy9LTQmcYc8nNTBv7doDyr3FHfTTECc1QQkGbJSAt7YM4+lhN0eBpc0/A1
 688ZBuHTESsOrqyGryxwAH2haQleVCv7UDnMET+dNTpVC9YzNSYnwfYh9C/U/fmX+J
 H4qiUdeN+3xS+bO/E01pbPlt+XEs9yOileYDszAhsnYrmsoUkXHGSM/6FcXDw2U5jk
 0XfTl+FpKOydg==
Received: from [192.168.68.112] (58-7-145-34.dyn.iinet.net.au [58.7.145.34])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 231E8734DE;
 Wed, 29 Jan 2025 07:29:58 +0800 (AWST)
Message-ID: <bee99a3ef4821f69f6f1a2f6cfc77c3e247e5d87.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/5] tests/functional: Update Aspeed OpenBMC images
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>,
 qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>, Jamin
 Lin <jamin_lin@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Thomas Huth <thuth@redhat.com>
Date: Wed, 29 Jan 2025 09:59:57 +1030
In-Reply-To: <20250128214100.1196243-1-clg@redhat.com>
References: <20250128214100.1196243-1-clg@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=andrew@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: M5wE7CtRX+7r

Hi C=C3=A9dric,

On Tue, 2025-01-28 at 22:41 +0100, C=C3=A9dric Le Goater wrote:
> Hello,
>=20
> This series updates the OpenBMC firmware images to the latest version
> for existing tests and also adds 2 new tests for Aspeed machines
> which
> were not tested before : witherspoon and bletchley.
>=20
> Thanks,
>=20
> C.
>=20
> C=C3=A9dric Le Goater (5):
> =C2=A0 tests/functional: Introduce a new test routine for OpenBMC images
> =C2=A0 tests/functional: Update OpenBMC image of palmetto machine
> =C2=A0 tests/functional: Update OpenBMC image of romulus machine
> =C2=A0 tests/functional: Introduce a witherspoon machine test
> =C2=A0 tests/functional: Introduce a bletchley machine test

The rest of the patches haven't reached my inbox. Did you send them? It
also seems they're missing on lore :)

https://lore.kernel.org/all/20250128214100.1196243-1-clg@redhat.com/

Andrew

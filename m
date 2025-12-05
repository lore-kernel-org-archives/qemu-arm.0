Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C459D32D9C
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Dec 2025 15:37:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vRXsD-0008Qu-9v; Fri, 05 Dec 2025 10:37:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vRXsB-0008Qb-DC
 for qemu-arm@nongnu.org; Fri, 05 Dec 2025 10:37:31 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vRXs8-0007mN-HG
 for qemu-arm@nongnu.org; Fri, 05 Dec 2025 10:37:29 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47798ded6fcso18002455e9.1
 for <qemu-arm@nongnu.org>; Fri, 05 Dec 2025 07:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764949047; x=1765553847; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QOFSSYrqeCFyByq4IbHxO8lBsCbmbRbdoXqmkmbFp/I=;
 b=b8O3SON/mUF8v4g43elvN4B8wxvd6k4b8JX+xSJA8y4TUMK6ey7pnYbLSGMfIdUwJh
 lfbUFnIkcvV/EFdJ8HT1etuFVziGW1s18NbvSPSnt09kpIC+ulNDcIHqEOon5YeSnjKe
 D6DZtGNAYqYwEVoaVQyvi4FPmibOweGbIdbFtH+q3C6ehWGO645SFl1nRxzEppY9YyD9
 bepehWpS5GOGNKTRoztgw0lbiNi0tNQMoYXL6Ppdk6kXCLf+fPmoOy8mWwDoslXKQsgY
 f2kfQ/lwIYRtzsxtqrhFuQu75ZZtyLCkFyMpGaVF/zLVwQtsnyu4B/422HmmlRm1bawW
 rOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764949047; x=1765553847;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QOFSSYrqeCFyByq4IbHxO8lBsCbmbRbdoXqmkmbFp/I=;
 b=IF5ejGMON68BKORaz92hPhIFVulSVdOK3HTVlohZcFq815exwsO8Pjk2T2UyTBckZz
 P8fHjopqj2EdW/t1lAg2uRkLp64t+1xHXXioHH7MkLqKOca4c4vELjHWhWf0wBKqXCEy
 WvF0b3aErTVASA0pBV88gVMYmM8IXC+kcPc6DWKtXtQxOrG13ihgij7rzjkDYA86MOLd
 nKyAHJpylaxcj1IdBR4an9NRYK756mBfSZwk/v0avQG2ZP2BvkRuRMA1HdKTzXBFpaK+
 2aEIwgv2FZTjY5m0BmzvD1UOzVH0GC8bV6HTmV0vErfZ8iljaDMUoSjvJYqB73BTNFBu
 VSZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrXNs6HnaB8E05fosHpvErhgyh7EGTPfQC3LC6pvyc9RQ1aamHE89KJAPUjxNb70SU5ishfIMOZw==@nongnu.org
X-Gm-Message-State: AOJu0Yxso/VFPeqO8daa3B8Iem38RoS06hYrmjgGNSa2MfDlXrHK132n
 LHTbZrX5SPpjoahN7HZN6MGeXI90EK55DqyQ0XC6+/wd5jerS8okUJPCJvt8Lk2VjQQ=
X-Gm-Gg: ASbGncscMNTTe3E/c2fvIihud7VDq0WDc46Nnv//iVC8yzzPGi7vPq5BuzpH4BRHydQ
 3n+9schtcBaEsRaqkhOUeJVhG98i9ZnGUwYvPx4op3WuxkLgZ1cxAdfiDEGHzmMQlkIkOcDATRb
 woDegyQmCAKM7pq3bqzizXS1jrGslkg68s6xk6qzeqLtmXhPR/9cBGwToLVitycWlx1sZqWsw/t
 F5aR0EQktmqXILyJCWaTKP0jYxnIxpSIOX2QRIzRhRTV4KrKsj3kmg6tZuLFjBVlCGMq6VP7EXJ
 oSVrcNs0UIXfpvKH5brtsE8+0WBedCQbw0Us3pKK5AHnpH9jzmXFz0ar7zkiuLREziq4KmndJPB
 6yPvtyDz3xH1HTEexPgPn+Yzg5Rae4X92k9ETXGQD1itvrAnO/ldTQnQv1KE5eaEEPcs6Xx4RZd
 Tfe12Ovz3dp0Q=
X-Google-Smtp-Source: AGHT+IH2uSVdAaMQRMIq/xwCCuAQkBphuS2YChjt2df3fT9ItD1XRk6JkPEKSLZdlvldl5jdIq9lyw==
X-Received: by 2002:a05:600c:1d15:b0:477:7b16:5f77 with SMTP id
 5b1f17b1804b1-4792aed9d53mr107100715e9.3.1764949046566; 
 Fri, 05 Dec 2025 07:37:26 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4793092c32asm90994845e9.6.2025.12.05.07.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 07:37:25 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2E82E5F7F6;
 Fri, 05 Dec 2025 15:37:25 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Steven Lee <steven_lee@aspeedtech.com>,  Troy
 Lee <leetroy@gmail.com>,  Jamin Lin <jamin_lin@aspeedtech.com>,  Andrew
 Jeffery <andrew@codeconstruct.com.au>,  Joel Stanley <joel@jms.id.au>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Peter
 Delevoryas <peter@pjd.dev>
Subject: Re: [PATCH] aspeed: Deprecate the fby35 machine
In-Reply-To: <20251126102424.927527-1-clg@redhat.com> (=?utf-8?Q?=22C?=
 =?utf-8?Q?=C3=A9dric?= Le Goater"'s
 message of "Wed, 26 Nov 2025 11:24:24 +0100")
References: <20251126102424.927527-1-clg@redhat.com>
User-Agent: mu4e 1.12.14-pre3; emacs 30.1
Date: Fri, 05 Dec 2025 15:37:25 +0000
Message-ID: <87ms3xq6ru.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

C=C3=A9dric Le Goater <clg@redhat.com> writes:

> There are no functional tests for the 'fby35' machine which makes
> harder to determine when something becomes deprecated or unused.
>
> The 'fby35' machine was originally added as an example of a multi-SoC
> system, with the expectation the models would evolve over time in an
> heterogeneous system. This hasn't happened and no public firmware is
> available to boot it. It can be replaced by the 'ast2700fc', another
> multi-SoC machine based on the newer AST2700 SoCs which are excepted
> to receive better support in the future.

Queued to pr/051225-10.2-final-fixes-1, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


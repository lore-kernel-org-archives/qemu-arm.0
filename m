Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B69606A31A
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Nov 2026 09:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PbRPBH7n
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xVQ7V-0000s9-9C; Mon, 23 Nov 2026 04:13:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xVQ7R-0000rk-OU
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 04:13:50 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xVQ7O-0003C8-Tr
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 04:13:49 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4bb64ef5a00so23043395e9.3
 for <qemu-arm@nongnu.org>; Mon, 23 Nov 2026 01:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795425225; x=1796030025; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=uTTE+l6YI9JuWAqmG1kclELSlKlQuPwIA0YAkWZ+Izs=;
 b=PbRPBH7nLYyocAAuOZ6jKPLuCqYB+1DFfGf1E1yaOhh2JNr456uYcYYGm5RDhzod6F
 WvvTRNNZ6xO6ClVA8r4YQ75zMAIQdVLFz7PWrsOkt6TntT4t+wsWDz9+BcEj8OfR4iGj
 1xeBBD8gZDrOMZ0wtK8UztVWt1sdgp5E6vTeCTqTINo7J8noRg38y/qJaSn9l4AK3NwL
 SITtCUH81ODJStZTLmp3V7bG/MkqUpmr8RDV2Lipw7kvTQ37JKUnN7i/g+bCGYGUooIn
 LVjA3MibaroZhcj5/2o8ULNKF2zHiwxgNxMG2OPjMwOxqRBfLPghfEU4/wJs9NsyaJRT
 0fXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795425225; x=1796030025;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=uTTE+l6YI9JuWAqmG1kclELSlKlQuPwIA0YAkWZ+Izs=;
 b=1/E23QfBdhSg/B83wvjeq3F2eWnbLHiZ4wGy9bLOQ32HfthaDJ+Z5pSv12LU0Y/zQH
 hk/QyiZUVb05Uq48hWRmEq3Fc6kd1lu42sttxI5MvS4HT0FoC+hU7X4Jq4/c5UTDrtqi
 Su/TwOtrVQs6MfLOj4wqspNihcuijIZrRlzOnLWeJT+9VnsdPMiVGoLd3lgGor8JHMje
 Xnfe1ujFE2XQMgg2lk3kis4hqaTaLn8c+cQ0xPjRsbJLwx/pX7zJLVmdFs3ZCVMMSJRV
 KVSJ/dvQTF2dc3cd4NWxiRrQIA0hIt4egZ0lFMWefXfx8KWSYvIvg6Xw9HSAw2tZdnFk
 pZkg==
X-Forwarded-Encrypted: i=1;
 AL+hErEuKmA2ChNEJoaHfWA9XVjM7uYRtp9ASaihEqVxHb2pr+WlUYzMv+xlXVyNWb6CPlbSGnpWIfT6Sg==@nongnu.org
X-Gm-Message-State: APuU4Z8Vh9m9rViXljgi2xtm+B6bJvG+suxCKpHckS1XQSJqMZUtyydw
 CLV3mW2twkRKEOgMvpKYlD/ac189/fc9+zJf0N2eLsCBdFMzm/DVuyHT6gxXU1aJBKI=
X-Gm-Gg: AZFdTZfTI3YKKUk1rZLV+PucmVwjuJjgH9t/v4Vn+q+DDuaDH5LvlcX0TBfR3RO+eM6
 pZy8vDiM3zG4LEXF9cCaoZoKK9L5P9h2aL+NSHwMDLou4GHcHb6vvdHwKRYInbWQX2r4IJATbfw
 xHQs8kdmSs/psTVHI7bP8pY3k8URqpfipjTu7rruD+PuUimB27piCG5Uc3SB8BuGwwjhytgHq6n
 N3ncHDbXcjjtHEVSvbvhV2aqM3su1GP3kEvu9N2Z3vynFacslcIgbVkJANUXYhT82tp4n3xg2V5
 lUjLiFMU1Sugcd1YE1csW+pKQ5ExiXz7Wre39ncxHT5G+8JF3+e4YYZcMLtiogEyTc1B+RukFrT
 nyXSAscP5LnUujfK46UVxTK6KJ0utMm6uebHfY5mZc6Ffb3US5dV7WgImdRikEF/iL5QgL4RNDP
 XCK892zVPduMmajEzLmjR9FKqs1lzSmW+HoRdeRzR1uzdEFSbOKFaxH6woCBI2hgli3iItMCuxN
 U2SpNTe/hXjrPEryZxSGsCDoxzTmjhOGdEF3wVrEY8PRwY0ZOXr5cEtI6a0yNXzchhTMErbNPyT
 ikheEIuZMLfR/dxWLcv0JBCL0nMk
X-Received: by 2002:a05:600c:5249:b0:4bb:665c:a078 with SMTP id
 5b1f17b1804b1-4bb8893a89bmr218098255e9.28.1795425224856; 
 Mon, 23 Nov 2026 01:13:44 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884ab091sm480682815e9.11.2026.11.23.01.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 01:13:44 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 171975F914;
 Mon, 23 Nov 2026 09:13:43 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  peter.maydell@linaro.org,  Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>,  Kuan-Wei Chiu
 <visitorckw@gmail.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Alistair
 Francis <alistair.francis@wdc.com>,  Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,  Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  Chao Liu <chao.liu@processmission.com>,
 Joel Stanley <joel@jms.id.au>,  Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,  Michael Ellerman
 <mpe@kernel.org>,  Portia Stephens <portias@oss.tenstorrent.com>,  Halil
 Pasic <pasic@linux.ibm.com>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  Eric Farman <farman@linux.ibm.com>,  Matthew
 Rosato <mjrosato@linux.ibm.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  Zhao Liu <zhao1.liu@intel.com>,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org,  qemu-s390x@nongnu.org
Subject: Re: [PATCH v2] tests/functional: use immutable tuxboot kernel URLs
In-Reply-To: <20261112133320.418012-2-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Thu, 12 Nov 2026 17:33:20 +0400")
References: <20261112133320.418012-2-marcandre.lureau@redhat.com>
User-Agent: mu4e 1.14.5-pre2; emacs 30.1
Date: Mon, 23 Nov 2026 09:13:43 +0000
Message-ID: <87fqwrx648.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> tuxboot rebuilds the 6.18.54 kernel images in place, so the URLs
> without a datestamp now serve content that does not match the recorded
> hashes and the tuxrun tests fail to fetch their assets. Point the
> x86_64, arm64 and s390 tests at the immutable 20260930 snapshots and
> keep the hashes that were recorded against them, instead of implicitly
> switching to the rebuilt images.
>
> Do the same for the riscv64 6.11.9 kernel assets, which still used
> non-datestamped URLs; their recorded hashes already match the 20241122
> snapshot.
>
> Fixes: 8ac1aab21fca ("tests/functional: update arm64 tuxrun images")
> Fixes: 09961fafc5a0 ("tests/functional: update s390x tuxrun images")
> Fixes: 467c9eb7dd31 ("tests/functional: update x86_64 tuxrun images")
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


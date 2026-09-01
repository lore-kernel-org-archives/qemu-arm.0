Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2CDC624D0
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 10:06:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1LNv-0001pA-7o; Tue, 01 Sep 2026 06:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x1LNt-0001of-Bp
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 06:06:29 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x1LNr-0000ky-LP
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 06:06:28 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-484374f54d0so1572677f8f.3
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 03:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788257185; x=1788861985; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=pXXXFGiAJ4nqD2E+RTxDcOPrNQeXZ44Vn9yF8+Pol40=;
 b=u7gEq6eG38SdQIfewkDCyMTJBbXx/WRePoaAVRFQO/IdTiln5aQ9knzsjoFYUDDjET
 2SMK5NqFUiVkJbMhkhsq1LW6lyrDQnNBCKnHyQnBzn+k30GKJeN6h0ZBL+Ef8I5COIEG
 CzQqqEgIsltxgmY9sIOiyE4+SKNpbBKEZoc1V4Wi/6BTZOywn3ML0hGgwEDuzuAntUQS
 UYhTN8adoqvwbvZWUEdhhRO/H9qMWXNXvTV29+Zt5NDLngZN4fSTwU8wURRWkb3xHjOG
 Zq9W2vzMZoglv3huoBArdncNaDzkotldLXabIN54ZoR1zuI9XfZBAfI1MtS4/aAq3+/q
 rAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788257185; x=1788861985;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pXXXFGiAJ4nqD2E+RTxDcOPrNQeXZ44Vn9yF8+Pol40=;
 b=DYBYb/yItU+BoHarulPixsuhQQvisNoNOfL/Ix1pGJ2zd7J2tBXAWMnASBFqqLgNoY
 TwfKrxhpUtqbCAxzazTo5d/y0W7mYtNAh55cey2NCNZ+7YBv92LDVfgaOgm23t/hy2jq
 j7Bhts2nm2mZkVNWhrnak5e/NBlQRgpfeAjLDLz3VCzDc0pYa0/yvvXYXzRfxhPBFmmv
 ABVrrZUY70AWAkrehBty6i4LPwL9+ShY+kTxBmqKUySpcbfaGaDlLcNbMa+sim/0C3GO
 3eXUN7QsTTyp9qTZBOmKLIehBfdc3OswMqhhfd6/Bw+05McmXrmA2ixOSh/QSJaDq1qq
 zVKQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByoIEEv4mfrYQ2DDkgUaWtHfED/5YyuEMjE6lAyBEc/ovSwsCsijhCRyiBBZHkk/4+gOxS4E0S30w==@nongnu.org
X-Gm-Message-State: AFuF++nfm+Kw0DqNeTgt9mmBanWYd4Md/B+R9zuf4zRUMpMDkxsXGyQb
 20dkrT/1tr4zIf7WvIsdJ8ezyU5JdSMTtDR0nIhE1TFa0DxbaJlB1/MEATwcX0Wdr1g=
X-Gm-Gg: AYBFou1Aj9dW/80FMPOhK9kZGfmLyMmI3BXdVb9GDr396TLDPckn3avv6TKqe+oH2Pf
 5urDYuDe/NT7esYQ8HwApzsauliHAHT/Plv1RSqoiZgt/ymHYV7I7vpag6LAQqW9cq4DXgzFwln
 /ZqZLNFt13V1l0FYAtDyMD7dEYREYeg9L13NKcR3qaNI/TwiB5bNsrw3vRAUFTVfFrnF9aSFowD
 h5PmNav84kJVs0h6Rai1GRkJp2LYOQECgixTF2K10ChIPes+/spxOy7e+Pgby4tC3mP6X9SINJk
 /HmGm5/V6LiyvEdOoILLlwBGR0wVzPR/fBDprUYEZbUBfHmzFa2uxU8HVvOTWprKV90T/Cm6gNY
 m2F81WP2fL8oaCqOV7tqYGv1sVS0UAoXVuPs+agsi+JJhPq7RhtZU3WmHX1qv4NaCxyB0W2KUtj
 i+i+X2FiUbMgWTCaV/NYr3vDvv8GNRWqW2M2iGSR35XaA/BCFUzGsi2N77rzcIb0qjyRx1gqk=
X-Received: by 2002:a05:6000:1147:b0:484:3334:9dc2 with SMTP id
 ffacd0b85a97d-48440ffa457mr10054452f8f.15.1788257185169; 
 Tue, 01 Sep 2026 03:06:25 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48442d36e9csm4163178f8f.3.2026.09.01.03.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 03:06:24 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2F0215F829;
 Tue, 01 Sep 2026 11:06:23 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Alistair Francis <alistair.francis@wdc.com>,  Daniel Henrique Barboza
 <daniel.barboza@oss.qualcomm.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,  Weiwei Li
 <liwei1518@gmail.com>,  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,  Chao
 Liu <chao.liu@processmission.com>,  Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,  Michael Ellerman
 <mpe@kernel.org>,  Portia Stephens <portias@oss.tenstorrent.com>,
 qemu-riscv@nongnu.org,  qemu-devel@nongnu.org,  qemu-arm@nongnu.org
Subject: Re: [PATCH 09/12] tests/tcg/multiarch: Fix vectorisation of memory
 test
In-Reply-To: <20260827050953.67184-10-joel@jms.id.au> (Joel Stanley's message
 of "Thu, 27 Aug 2026 14:39:48 +0930")
References: <20260827050953.67184-1-joel@jms.id.au>
 <20260827050953.67184-10-joel@jms.id.au>
User-Agent: mu4e 1.14.4-pre1; emacs 30.1
Date: Tue, 01 Sep 2026 11:06:23 +0100
Message-ID: <87cxuxwajk.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

Joel Stanley <joel@jms.id.au> writes:

> Compilers are not able to vectorise the load and store loops. Building
> with -fopt-info-vec-missed with gcc 16.1:
>
>   missed: statement clobbers memory: ml_printf (".");
>
> This can be fixed by doing the printf after the loops.
>
> Also, autovectorisation doesn't like more than one if statement in the
> loop:
>
>   missed: not vectorized: unsupported control flow in loop.
>
> By combining them into ternary statements and one if, the loops are able
> to be vectorised with both loads and stores.
>
> The trade off is the dots are gone, and the tests no longer report fine
> grained miscompares. A failure does report the number of bad elements in
> a failing test loop.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


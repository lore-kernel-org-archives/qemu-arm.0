Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B09CD8CA4
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 09:17:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWsaG-0007Mc-QL; Tue, 09 Jun 2026 05:17:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWsaF-0007Ln-18
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 05:17:19 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWsaD-0003yL-JL
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 05:17:18 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-65eb226b1ceso4635890d50.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 02:17:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780996636; cv=none;
 d=google.com; s=arc-20240605;
 b=M2xPw8bbrLkr7xBQFbght2K7j5a+dxwzZCCKOEUWwRpd5vrhkS/tZ00qs/yAERRvi/
 rE+XyoveZgBQu9efjVDmeQ85aK6KdLIgYj1POFDFXhnn4uONrEtEozxUkFbHJV56HQSu
 yeQiyf1yzwIBigRCY3GsG4p3TRULtosyzU558zOypqEY00TFtUfJxh5aKhYSqHQiAIjk
 tpOpLxomcM9An7YoVvrFHumZt35zTrSOg1mA3UuMbNh40bc7TZ/Bfx3jQv4PxZLbDHQH
 txHy/spWxcERnGZmuEtdZ15LXytGK0wQ/LFVK6PwYfIuh4AVUyROcMkkwMwi/H4muVAi
 JjTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Hyl+NSU+z7n/jaoyu122o8hmgO2jF+BUr2MmeWg5PGA=;
 fh=sT5anx/YoXeLXSwlInWGIDbvHLHWF7FB4GMg26oVUhs=;
 b=iVZVQRDH6PFU3GNtOmQXbZjOwHRku13d5fleymf5sgmx6uOxmavWb9vA62OuZ5SgCz
 7zme+ge34ELippS9o6yX7NvvNpOJT4Jk5JRaaJ467abIAIQ3+OsAVAPzcm9Cu9yix+FK
 1GIB8UyTK1z5r6rWwpLt6wyrye0Sv1VXg+Y7CbqPrPIKcI4Kkklvidmarl/QdjOwQF1u
 v8eBUSEFM9AvTJ8RZTKDCe/nJnCdWr2P2x9htqUyVNKLROknJl6YQm8irMujEWXMVyYS
 FUNfgOEkLg6c0+8quw7KKH1KdiETVeb9zySGPfBceQ7BP3VGN63jcuNQ4KwNxvDiMwuO
 1+Tw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780996636; x=1781601436; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Hyl+NSU+z7n/jaoyu122o8hmgO2jF+BUr2MmeWg5PGA=;
 b=Mx9qz0kTd208lld7qrbyfmd8iiWkzQXNCvpAI6/fI3NS3+ViiB+JtWp3d4heplTG6g
 GXjIr3dKD92RFkmAunM5Lv1XZ9CtQKXMsx5W6HifFRtJHldZnXlxK/k+Mbqp7iuswy5u
 xoS7KrMbPouVtEfVqdIKvymUpqacfNwufkmtqQDB3TBd0fRJREGGgonWgZF69iVFlO9r
 zS2dtBcSFME7z+fBWrOu1BgIsSLb5u7HKEk4jvIJobNzSW42tCbQ2c7oYlLjgTLPYzDd
 vdCfcqEVdTESjsWQhgB0CgkHDcdmzM8VG1NkTRZWew1Nonsg46/cf965FwSKygf6jPb3
 jmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780996636; x=1781601436;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hyl+NSU+z7n/jaoyu122o8hmgO2jF+BUr2MmeWg5PGA=;
 b=IRAxYoqM0wTMDoi2q/X+1LGXkxAVf3doHVcWIb0dj0KiOsl7Bt53fMjNtTWwOqzobT
 ApVFSdeXQpDbaLrmf23tWJ+dO8qqqiyBbZKoMXSbxQIj1WDvJiimBg3g+jxzfAMGtmpP
 j9qx5PngcpA72nbXw4KGemKctcFR3ihpswt8t2TSKCQXWjgks98HvRn8jDMZ6SLtOCuc
 OGQWrfM1R/dGALEYe9m+5VjO6+COrhHgEUYs22H7+vuIbjRE+Nrt13K7dEA8dCl1jf8M
 8S3Dlh7KxrIMKWhggcV5WveLsGuFIZfJ/c1ImYVWndtpJlWsL8cz7tGyCjCYaLS9uf+v
 BjJw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+GMlqz3xNV7r9Vp97BcWliYRiBhy1+r+nCJ9eveTsy5amjjXGiY+DqifubnsiXIrbS9sPAaV5bqQ==@nongnu.org
X-Gm-Message-State: AOJu0YyGktilA/+atj4wSPdNADWhsfxVa2OOeJviHclg9xv6omV8Gscb
 YE+Zw6Nx11n1PDN/r7AGBtoTWZvfYrKa3aesbrweguxkfu0GEy270G4rmIlD7GnYJ6lzPJqrIdw
 N5NiBV/XY1dZS7w1Ou/Cv9Q9D++gLwT2yY5giOQkVqA==
X-Gm-Gg: Acq92OFO70w8FyYf/etJMuPmXpnMBzkD0l5XjqFeaGpp1a4F6f7Ted7m2v+JEaGvKLD
 esSkarKm7nNsJueQttOPdi4w4Q572I/9RSKezo1WzAyXpbPniLBhuPnUH64S+cKUrDw+r7JrQht
 j4kOnNT7tFDiPFbzOplpHtIZL/81wifide3jSCLTCN20i7V94mqFmwTYyJ90Dr/IhToz36zsfQj
 1/c5hbULrmOZGeMrt6apd01/nSIH0Xsa0fd4sKFZE1eRhCDhC4q7Yh/j2aHPfnfp+NVkcOjhJTQ
 H5FqhbLrjKA0/kMLjlRBCylE6hGRQnlLOGClt4xcL0K3dq5V0Nfbiqi62sNog3uCUhBcn0d9p3k
 Gfg==
X-Received: by 2002:a05:690e:43da:b0:660:a41d:d166 with SMTP id
 956f58d0204a3-66106fe1a5bmr11617104d50.58.1780996635962; Tue, 09 Jun 2026
 02:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-22-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 10:17:03 +0100
X-Gm-Features: AVVi8Cf4Ga5fzjo0LJDFY9fr1o2kRvNnabkydRzO6PwyiBaCpbZmjf_CRJ23OZY
Message-ID: <CAFEAcA-ELhFuW5Ghv90FLmNg_Kyq1oa+0o+j2EPVs5snz6CkLg@mail.gmail.com>
Subject: Re: [PATCH v9 21/45] target/arm: Implement LUTI2, LUTI4 for AdvSIMD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 3 Jun 2026 at 04:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-defs.h   |  5 ++++
>  target/arm/tcg/translate-a64.c | 38 +++++++++++++++++++++++++
>  target/arm/tcg/vec_helper.c    | 52 ++++++++++++++++++++++++++++++++++
>  target/arm/tcg/a64.decode      |  6 ++++
>  4 files changed, 101 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


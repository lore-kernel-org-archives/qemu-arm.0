Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802F8CD98E1
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 12:54:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZTJG-0002Wi-2o; Tue, 16 Jun 2026 08:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZTJ0-0002Re-1m
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:54:15 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZTIy-0004sM-N3
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:54:13 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-6626cd98209so4717904d50.3
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 05:54:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781614451; cv=none;
 d=google.com; s=arc-20240605;
 b=BPdcZY0C5asnIMCTzitl/8ApH529B471IWFgzha8nIup6Me3YYdov9E6Fd2HLeiGgh
 AAzeRhtHCfMO9WHgpcWY4TVdntzwipy5DrCVrgIkvB5JFuDrSQ2UXL74xsP9RyJJVC22
 HagBQb1rl3NpWsnBkAfj29+qFjUhviZ7NoxW7qFuG7iif8fQjrO25CCg6yDLh4x0tQZd
 +QaSwSwdBaeptEZfK5IPoKY/TqtbrpiwMlAhplvjEQ8gO3hHyvfB8qmsLcqPZLLUk4SB
 6m9+c+jA37NEwv/Fx4TdRxo+64fak5xaF5IodsdobsOpvC+Izh1NO1cwpaWDr78Y9qtH
 B28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=b7ORtwr+bgAFGcFbGFQyTBKbTb5kga4FdFmDpH9qMEY=;
 fh=pDD7skKix+8N5AOzChMwl+nJlVGKOxQzlCNz7LFXxco=;
 b=S4GoAYyreyfECJt5uJ/zeysOZ19SAa+ARab9crpBROW3mFh58/7FBcqc3jaRMvcsPH
 ksa6xdP4Hf3QdwMU7ylxEKgXz15ahoAujZXS42UtJTVz5P0SN601RKnQFAovTx4YyBY0
 kFTzW+GhP8fA8HX0R2cVwzcAmTs+nSB3TOr5IUfbs0jQ94uTxozmueUlII+gsK3ZX5SI
 FwraxuGogysdCOU/7xAUxE+Ziqmx2APR0+6n7RMBQZOH+mFjaP9wDqmCKfL5HbDW2kNA
 jOI/VI/MYGP13a0evEvznhDThN0BFRmagQD8lEGVmQMmaoICwL4KoWDXK5k684P6lPxJ
 UnmQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781614451; x=1782219251; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=b7ORtwr+bgAFGcFbGFQyTBKbTb5kga4FdFmDpH9qMEY=;
 b=z5uz9lQ6tMpGnF+g02QC+304Iy/dwQ+k87NaFmehzZPNxTA3Pd4hV896Q6bF5rYhhj
 QmX7+mtretLQzdkSUZtLNs/QgO0pybO2UJ07mEcrIACAbUYpYoxtDxKlkjthDk4XyAxT
 DPv2/VF5k1J6TvmpwgDcLdVbPLIA5D2Tu3ZXkufdnwiZNQ19vhci7yoRUpKxKjxHCrUQ
 hyz67y6tHwl2045wnZFSQKq1bTq+4CnMAsqO+hwoXk0+MOaCk04VGFvaFyIXmkcYUkA3
 ac6ZljlCPhr7yVbb3eul2woAlLPzfPmU4c2euS8Hd04XRBrnBR2Ctx43tx52o6HT36K2
 rslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781614451; x=1782219251;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b7ORtwr+bgAFGcFbGFQyTBKbTb5kga4FdFmDpH9qMEY=;
 b=NFaiNa3+Qr/iJIHTuxNnvd5Wn3le0tvdviwI8jorainB7uDqKeQ887ahHXb/q2j8xG
 xodOQlpnYlA67ia/KC2tSuo5D7bLYTz2Z1SwnV6uORuO0vcSvRjtK1aGA2I1vUI/GXFq
 7cS8JZAgC7KdakTvlTvmt/Om/Vh5d1hlSCwKjRHiZa1lgAUMRHG+pzPkVWjXKpljTVBK
 FEkp5GCf46/paoYKvG8xJGzHS1yDWryK4r1JHiE4VBz7nz+JPqH0+Ix7J4IQaHB1be3m
 +oQ0F9uhhx++kOyUw3n/XJz9vTfENlismhTjKuT1lnPEzrimRmgrvnjufbrgPQUWXXew
 f/mA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9sBnG16cy6kty8P+3z/JVOE+0tgbl2bPGHz0DJayHHpnjEiH3TeJHJJ+8/jnvoRo7K6+5PLmgTYg==@nongnu.org
X-Gm-Message-State: AOJu0YydAFEPXYfMqDYesH6OPk+FbMAKpoS1YvLe14ppP5vOLcUMwstM
 KHcytreK+V99BRdBnInGBnRbsD+D9woeIeOHHC9I14yvQyiy6fze9QZsUAXgr2W3Gm96rETeOrL
 S3ze4Z1MVZnkh7vcqRrVoVxEcuCTlfwabH9OLH6GpCgWstfyCIo7f
X-Gm-Gg: AfdE7clRBa2qpg3GPL0em5Am+HPRfFQPHz2QBipotU/iVN7aszdK4AYMQfgVEKFjkYa
 QomK13/vm5OwAXmAegVW2qZW3lSL7L3zFeZ92J3fBLHKon6Lpbyce2qH9xFhdAng4QbyQwsA4w/
 N8J6+Z4SkSljQZg+KSLAQtBIP/5kEBe9gLV3paShAlt2arD2ljkVQse01RFyN1oF6i9fAydZyxS
 FfgazNn453/KV4Ji7XInxcTyb8nMof7FJ9n/IkGWX4C8sU1HtEioz91XOSfrWzJgBagkuWa3906
 qrZ26RsI7peNQvmpbL1jwsdfPRJLrd4ELLiHr5I0IR54hEmud8fao0ySnhcayLadKYM=
X-Received: by 2002:a05:690e:408c:b0:65e:5110:a60d with SMTP id
 956f58d0204a3-662b614f3bdmr2470612d50.50.1781614450987; Tue, 16 Jun 2026
 05:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-15-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 13:53:59 +0100
X-Gm-Features: AVVi8CcLd513JRm3KXUYEGtuIdxOxFJQAD1qNGmaD8esinyJWtbrvaVbTxFJVD0
Message-ID: <CAFEAcA8L19Sjg_KXcDRAE_m_d91BqjPPSS81kPu2_ZmXismFTQ@mail.gmail.com>
Subject: Re: [PATCH 14/25] target/arm: Implement SCVTF, UCVTF (predicated,
 zeroing)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Fri, 5 Jun 2026 at 00:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sve.c | 34 ++++++++++++++++++++++++++++++++++
>  target/arm/tcg/sve.decode      | 16 ++++++++++++++++
>  2 files changed, 50 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


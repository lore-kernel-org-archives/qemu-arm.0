Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C8ECD98F2
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 13:31:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waZIw-0006aN-QN; Fri, 19 Jun 2026 09:30:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZIu-0006a6-LS
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:30:40 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZIt-0003QP-Am
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:30:40 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-662d484ff3bso2422429d50.1
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 06:30:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781875837; cv=none;
 d=google.com; s=arc-20240605;
 b=jKopsnTI7YLw5Ocw3jvmp46SPIO7J6AyTpA/4NMSR65M1La3Uh8mfaf2jDDttmDgDn
 fZJYrdwbrjUgDKzXpTioH2uY3Gfh/i+NdTvGs9aEw+JN+DXbpTV6eMl//8yUgSGSMwTS
 aCPbVcI3Ms+XMhx/4wG3EXFhDfJmSjEfJ2o617Er8ur1lhglYlexdB+0q/6B11QYx7NR
 WG3ktf9AYfOo7y4sZ+URA/9t8kZLpKEBunbckT+yZM2SBlf7UL594+7oeqkG/IxX/vAE
 8lMPHMlDMlIVnDt5uS+ZScjZcs3qoDHbaxdshcruK1Yu9p9aqWMY4ru3dgtU+9y4x2Mm
 CBWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=NkkXr0ihJ/n7wB4GrrxauqFJjA/S9UTsGCjRKYb2MIM=;
 fh=S0gUJ/oCwbQMnamKkxS8ijLiwUnlTLaQN/whd7OsGzw=;
 b=A1pjMGRUnl2a20SBDxnfOhgH5sgIE/+KLcV+YW+OWs+qXMnqexMT8p8iwsl+0h4ye8
 GbhHvhYn6/gZNEcZWEBiXbm35+dj5D1BNezC6WiuNOx5gZKKnZ1VgY3MWaDH8f2iARTs
 bIXMxa/bAXb8nkDQhVdMYyvpHWMgt6bxTh5WBQyfStnkqxJOqv24wgiN8rUxZGnG0Akb
 WOb3QbHnrM96Ee/xvMcXij3xmZdY27Lt64BEJnRQPsLEzdOHbKm5baRt1cyRASi7EjYV
 bDnChVH2s84lZVJgmd9k3Y9uKr/F7v6ZXzR+HEMdrEbLRNqXwdwFO9oPQh0fH/SIh2jW
 fY4A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781875837; x=1782480637; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NkkXr0ihJ/n7wB4GrrxauqFJjA/S9UTsGCjRKYb2MIM=;
 b=jaowNpA7hE0PS+XZ9C9FIybWOlkLc+xx96kGmXbmSjAuQjSXH+5V7lD/d0xUTxBRm7
 LMZ9SmURUMrUrsT6t34Q8n7CLBdU/fNQR+L0tw2Ym2SPPW8hmvUM5PNvXSAo6eDsgBOw
 lGCB2VsDPdvbTtNfG0y88pBcfTaKE5dQ1U/Qm2ITPZPgdKk2pWi8mup/ygc4ppdWnIJJ
 RAy4JDQKwhRFpSttHq5yiZ0H+Ore2cJNTd9GSjdbZkOqtR9g+jE8U6CNu4XgFcZCPOcM
 PBmoN5bE15i23F/vcWlVSDigsTfe98C7R9rcmlucHEc4kub0WvwoS2444IWIec/BIsaI
 AJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781875837; x=1782480637;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NkkXr0ihJ/n7wB4GrrxauqFJjA/S9UTsGCjRKYb2MIM=;
 b=cDw7NSFoimug5SA852S45DChCSTIPq5NR6c75gGaZdCmlSgxJs5np2wxSNvQQfie0p
 lurFpCTuoIknWJ3e+DInS7mMlmIDG+jcfn/JvGwNuZ4Jv2pjuaJAFBvFFwhEQN4+r6dv
 PrXbmRTFTOitj1QTE++grcNZfSYGUwk+OseZ5koFdh9JEYaCvmrAHRsSFqgV1ifYn3kI
 puEwAb45Dl6nXbPghYWID3Si4ddYAwOmGFjuxPfkiuDwO4agIwxt6PWtBcbsJuH4HW3X
 sSlIOTJdlxLorq4QyjqYnOzpks5Oo4/YHpcaCLyNrwNiyoJcOuU5/bly9IU/ShyyTvXa
 cvfw==
X-Forwarded-Encrypted: i=1;
 AFNElJ81jC65y0N/6NUR+lg2fC8bfBLro60kGNaMCMyEaFMWDjMBEBIFFXakyVnSzwMLSM/CO4JD80gSSA==@nongnu.org
X-Gm-Message-State: AOJu0YzYhZ6Zb3LiykX00FnIQ+bomJ2ctxKonpPHxk15Sjc8WO1bOVup
 0G1m0wfdKxDXU+xc/ota442roi44oPSA9FBD6/lUPH5Oowyq+2+06K2ft7cDySLIZ5KwvWRWlM2
 lVPkIaHcFEqWXNV0ng361fFt7N2r5o4ib1RNGQ4PbUQ==
X-Gm-Gg: AfdE7cmBIFQ/u6JInC6EyG6f1AkZf4hyLrp3cwIbaN6LHXxRS9aateoz5ZmPrEa+Bxx
 MF66KLX9Z0xmNDq4Ud6aM5aTqvG+JP0peIRTEhA6WsbavKGvoOgvO9Ogapu115KCkJnAK/P1ZZ7
 jgP2diGA1nG9HuHjLCWdgA7wFhRiVl9whmi+UzfJKM0+HL4UAWYtk+jIHNjmnznN8h3A+lA/h4H
 i23pztMGvZnD5QfzEsWNo0fX+aUm7SPXS6OkPY/cOMaw5XDsa0H2wnQREfrQ1OprCWYyt9PfDeg
 aET3VfMxqupEP/Il1IzObkq9B2AA8CAKVIDrQBLU8jN7RT5Khterbw4b78bu6Plu1Gc=
X-Received: by 2002:a05:690e:b4c:b0:661:1307:3d40 with SMTP id
 956f58d0204a3-662ffdc4b2emr2763702d50.46.1781875836949; Fri, 19 Jun 2026
 06:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260618041517.573469-1-richard.henderson@linaro.org>
 <20260618041517.573469-4-richard.henderson@linaro.org>
In-Reply-To: <20260618041517.573469-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2026 14:30:25 +0100
X-Gm-Features: AVVi8CeweLmOxVHz2rCy6IijYa7zLfXThNMcdb3dglrGxssSZdb-DCgwnh3QmZ0
Message-ID: <CAFEAcA9+j-oc16xV6zaFRnrEuyiyr_CUj9utZiemOgQP22hFkw@mail.gmail.com>
Subject: Re: [PATCH 03/10] target/arm: Implement FMLALL (multiple and single
 vector)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Thu, 18 Jun 2026 at 05:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sme.c | 49 ++++++++++++++++++++++++++++++++++
>  target/arm/tcg/sme.decode      |  4 +++
>  2 files changed, 53 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


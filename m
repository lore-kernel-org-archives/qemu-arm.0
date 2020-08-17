Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3022549lfy;
        Mon, 17 Aug 2020 09:26:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKd8LQ0beY22oLjQjlWpdnplN+OUifOf2+aG0lpQ9xNQ7tJa24kjWOHOScJa+zVAvkWskw
X-Received: by 2002:a25:cbc3:: with SMTP id b186mr23347205ybg.36.1597681562930;
        Mon, 17 Aug 2020 09:26:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597681562; cv=none;
        d=google.com; s=arc-20160816;
        b=d/tyYpNqdELq7vSWmBCfSN7YlYuYRWET/F4wIMmOyAks4UOO2kKKg6Am3sQOmyvFUz
         hKCumGZTVdglA/p02uvBsUlif1inPDPQl9D/MYGhhgdwMAxcs/RyrBl7YtIyyXHekzYf
         /93hxzl9yufkrz14Eon6dcVDAtNA9AghM7Zm7VATriPTYsMEc1vWeS1GCy3Vrvot9FCh
         m593R0O44dHrLwFo3WTr8xu3kgwTR5qymTGeWwRZH2mQ8bSM+TWP1V60JhEOI9cIFpXS
         yewWIiQxCQMlD9C9R7R9p7UdWV2lAFi0u3LB0c0uUsROoLV+zXibAbDS+H19R7/SZvgB
         iXAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UlO9LVmXua/RzjAuAxiGJFemd55aUGNNWGiRfqphw1w=;
        b=duvOdYxe21OFWiihJgrho8YR/dhVH4GkV0jSS6n5C9AvSN3ikn/H2GlULO74X9Qqza
         sKmUYNPdWQJypbM99vK7lgVLo6i0aVEyYkpH0se6bI+5s8arz+QXx+rLFSws7BGraodG
         yXE8zHfg06XQDsxEIS/A/LlgHbToprbB5pmW63fWbDhnwqWx8T3FN+7vZ8SOZKnh/PfC
         nvNcv82CPvMy2wPlM6jMTpMhQK4QrFgBg+KaDAX1fN58boSnMQ742n1LLwDFIJxpVy+1
         R8KxaEGO7aytVLetuyuUKgNB5DuqqlgC+OWXMqERiXX2NLyNZ1eVyYU4KpTFggSGwHxa
         JB5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HQXmsmNq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r139si19144569ybc.282.2020.08.17.09.26.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 09:26:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HQXmsmNq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k7hxS-0007YZ-Bj
	for alex.bennee@linaro.org; Mon, 17 Aug 2020 12:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k7hrB-0002j2-T1; Mon, 17 Aug 2020 12:19:41 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:34304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k7hrA-00057m-5A; Mon, 17 Aug 2020 12:19:33 -0400
Received: by mail-io1-xd41.google.com with SMTP id q75so18266453iod.1;
 Mon, 17 Aug 2020 09:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UlO9LVmXua/RzjAuAxiGJFemd55aUGNNWGiRfqphw1w=;
 b=HQXmsmNqVW3EGyQpPQLyAYmfCOw11mvxEg2fQZx8DmJJk6VYsORb6eHbOPlIoReKrR
 KYftymQkOESubvpTC3DEsBMdBhGfZoU4y5E/aiH9RK7E/0AOR+Q2l5awGdxUwpobLxg2
 KICNQDhtC9JixRMUQM513BvCl/yELU30pNzA+gi/7jHLa2j9TKmZ7GOuAyRvpsEpjCS5
 4HUeYzfYz0gXKVecsCh53t4ROQXl5XDFO2YJBOf+vgDjCoIgh+0TGPo8LbVYlrxoMRTa
 3Nfwf+BYqKEBUDRV5IKjPPkx+G0FNf3ZG6qmmh7eUXHKCUN9LtKlw7b/smEkQCjHR2LF
 AQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UlO9LVmXua/RzjAuAxiGJFemd55aUGNNWGiRfqphw1w=;
 b=qh2S+aqBT6gHMtZwhs0D+EbTy52D4tia7bas/Dg2a6Tlw1AXblRPXtx8OrNuVuQJaX
 ghCyG3RbId2QNrXDUK1+Y1jFH6Cu+vduL8ZVpjypGK8I6yZs4Hr6tAgksuHbFel2cYIc
 rUqnWLwRb5cFix2aVaQhvKyl6HUicmzmkK9IRKes9Kz9XpmlUPOxgxk6wYGCiShLryu+
 6d297SU7M9J0pRcdb46gU+vML/fhwwOsXNzvjC4Fp0kxfoxtvt94uaE+QTsDAxpQPb81
 Di4i1ExVvg51mJ775YwnRd6i7u6w9620i3UvlA11n8dpDChhdSIyromF9WhN7USTx3G8
 D4sg==
X-Gm-Message-State: AOAM530annlYfBK1REGfpMNbiVnp7/V0oA7/5c5QksyMlNzPkmsSfGD5
 mBqpoa2A9HhM0egPvKE4X4D6rg2920P5+666jJ0=
X-Received: by 2002:a02:7092:: with SMTP id f140mr15558787jac.8.1597681170718; 
 Mon, 17 Aug 2020 09:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200817140144.373403-1-edgar.iglesias@gmail.com>
 <20200817140144.373403-3-edgar.iglesias@gmail.com>
In-Reply-To: <20200817140144.373403-3-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 Aug 2020 09:08:59 -0700
Message-ID: <CAKmqyKM03zhET-YPbV3rB6qig1UyR5RrjHUDBt2b26GVBBCKgQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] target/microblaze: mbar: Move LOG_DIS to before
 sleep
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, Peter Maydell <peter.maydell@linaro.org>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pifh0ORqoXl8

On Mon, Aug 17, 2020 at 7:02 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Move LOG_DIS log to before sleeping handling so that it logs
> for sleep instructions aswell.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/microblaze/translate.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
> index 47637f152b..c1be76d4c8 100644
> --- a/target/microblaze/translate.c
> +++ b/target/microblaze/translate.c
> @@ -1231,6 +1231,8 @@ static void dec_br(DisasContext *dc)
>      if (mbar == 2 && dc->imm == 4) {
>          uint16_t mbar_imm = dc->rd;
>
> +        LOG_DIS("mbar %d\n", mbar_imm);
> +
>          /* mbar IMM & 16 decodes to sleep.  */
>          if (mbar_imm & 16) {
>              TCGv_i32 tmp_hlt = tcg_const_i32(EXCP_HLT);
> @@ -1248,7 +1250,6 @@ static void dec_br(DisasContext *dc)
>              tcg_temp_free_i32(tmp_1);
>              return;
>          }
> -        LOG_DIS("mbar %d\n", mbar_imm);
>          /* Break the TB.  */
>          dc->cpustate_changed = 1;
>          return;
> --
> 2.25.1
>
>

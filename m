Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp690691ejx;
        Tue, 22 Aug 2023 05:41:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2Kcb2jN+gmRvKpjYrTZkr5WOxKsFEUXnBsxpHdXY+QFBJGw7RQOM/d4UsAV7kBnJlAw7m
X-Received: by 2002:a05:620a:1999:b0:76d:25b5:6e9b with SMTP id bm25-20020a05620a199900b0076d25b56e9bmr12416808qkb.23.1692708083015;
        Tue, 22 Aug 2023 05:41:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692708083; cv=none;
        d=google.com; s=arc-20160816;
        b=aJHTipkc1n9fpAw00gx27bLrOR9YVpr5Ty6BFWh2xU0J1le0V/0PXSMMmezwQuSJ4d
         VP4H6rfC7olnJiKbFVx+c4SwRhOPXcejpnPvJKrkIJBNqjEN4YYglT8+H5GoF3XdHrbm
         CU9ss08M4UCkPvcak+bXdF37VZLgdb3pOxY3CjUALHibIDFWhe9GeQdr4DuLWNNrIAQO
         m36lYd/dWA7zoAyBUCpnVNTMS6pCiYzpBRvXUVCdoS0bAJlslrF5CJP7ojG5t2SdlE20
         CsVBIYiuQgLCdnL9OXDHkau9qPYeIEVXPfHGdrcwFdbGCo4LJ9lnQe6sWRWdMkpbF5cL
         VLRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=u8Ncu8aR3h9eMD8scGzi1n3AJbGQYzVdDS6hz26+JPk=;
        fh=wXqw6aajGBSP4OKAgbWKHj3BSg7Yrdz+j0I8chPJZNc=;
        b=wM6W7GYAgwUsFHpQPc6CJeY/wjEGXUz55FXIYUMwcMop5coaFa9G2y73W8RW1kO6c6
         bPOInq/am5TT3jXi9jt4u2PiXGr8rJYtxwsqf+CU6gI5EtLBnH4AVfE5RLXTHGxwxAMT
         M5AqdLFKSr+E5ah2QxkC89gYnMYTuGHDnMZ8yGZR/Hi9ZlLbO3Y1gS+RdFVVA8u5JqaJ
         NEUm1h7Yce3gn3RTiRx5L7WcHxuhUhPp8ZXg4O4S6ttyLJG82JH+2osG6YwJWWOGTz2r
         AdVg9sEaG0HUkwm7h0hsMoBUcyj3R3YuBjJQArEt1MSeEqaXV/irAsMt8Qgr25+hVLrn
         DfGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NF3/NnBq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v21-20020ae9e315000000b0076d8408d591si5885884qkf.704.2023.08.22.05.41.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 05:41:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NF3/NnBq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYQgt-0006G4-G6; Tue, 22 Aug 2023 08:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYQgo-0006Er-AL
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 08:40:57 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYQgl-0005Tt-No
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 08:40:54 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fee769fcc3so27051815e9.2
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 05:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692708048; x=1693312848;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u8Ncu8aR3h9eMD8scGzi1n3AJbGQYzVdDS6hz26+JPk=;
 b=NF3/NnBqtM3teswifD6fa3hcHPneD1HhvqQpaLmWGojJnKrQn1HY5lz+I0z1WI0AWp
 7+Qlshl5m95u1vi9StXBqznx/BFqzBr26r18dHbbXGH70IpEx51Frn3hcl+Z+UXaPVXS
 rWqYewYClt1P6981XuXwxekFN2OWDQwQh/KbbztLTMDyqI4t0XChFHtWUMPtOCwv0ZVa
 C3RpkczLngV7517x95aVMh2mrnaA9aXbfjAj/I2MAFswVbY25gPjdLR9f4aYcJFvwUYy
 IUOrl/iAQHvcbmMEzUcI4agfHdgQTA9f8olSnC6ynZ4IC60nJ0j5f8dF1CbGuOSvnXAz
 RiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692708048; x=1693312848;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u8Ncu8aR3h9eMD8scGzi1n3AJbGQYzVdDS6hz26+JPk=;
 b=d3LU08tN9FGLotgYz8i9u4XWY1RTG9OHSfFLpZzBOUDb9hZs9SsNuZaAmkKQIMGJJz
 1bhyfC9rb7dGv4fxbJMNw1J+SuALats5pj7FwMDX8J+WdAHyJ3kkh6xKhpaazCpFftHi
 cWti/RxGrbIGRDk3hjK1sezQijdhbBrKWwacfZAzDCphzL34IGaYDLEIEPoQs6r0iJSy
 Z0HUbpi8B46i+03qdQMiIgWFg1lR5taFRVP4Iugba13A8mtPkpu1xNWYAx7iWOsJ+eKv
 Hub399gk0QX79FsvyFc8FlHtbBnsfAu2bPgbo6GU/ME0PJ3mV0Wv9aROJSz7fzAe00dl
 rFUw==
X-Gm-Message-State: AOJu0YzvfbpCjO3A+vRP0jxnRbDkteBGXbmPyBFBhyA4fJGiqI6dZQpc
 L3Q1o+VrCAF3CRp44jwTxd5cEw==
X-Received: by 2002:a05:600c:2349:b0:3fe:18be:76f8 with SMTP id
 9-20020a05600c234900b003fe18be76f8mr7377654wmq.38.1692708047726; 
 Tue, 22 Aug 2023 05:40:47 -0700 (PDT)
Received: from localhost.localdomain ([37.19.214.4])
 by smtp.gmail.com with ESMTPSA id
 x26-20020a1c7c1a000000b003fc16ee2864sm15541120wmc.48.2023.08.22.05.40.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Aug 2023 05:40:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
Subject: [PATCH 00/12] tcg: Factor hrev{32,64}_{i32,i64,tl} out
Date: Tue, 22 Aug 2023 14:40:30 +0200
Message-ID: <20230822124042.54739-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Y3dkuSLP9Yn9

This series factor the "byteswap each halfword within a
32/64-bit value" code duplication as generic helpers.

Modulo the documentation added, there is a good negative
diff-stat, so I believe this is a win from a maintainance
point of view.

I used "hrev" to follow the other bswap/hswap/rev helpers
but it isn't very descriptive, so any better name suggestion
is welcomed.
(In particular because there are other patterns I'd like to
factor out and then naming is getting worse, such 'wrev').

Philippe Mathieu-Daudé (12):
  tcg/tcg-op: Factor tcg_gen_hrev32_i32() out
  target/arm: Use generic hrev32_i32() in ARM REV16 and VREV16 opcodes
  target/cris: Use generic hrev32_i32() in SWAPB opcode
  target/rx: Use generic hrev32_i32() in REVW opcode
  tcg/tcg-op: Factor tcg_gen_hrev64_i64() out
  target/mips: Use generic hrev64_i64() in DSBH opcode
  target/ppc: Use generic hrev64_i64() in BRH / BSWAP16x8 opcodes
  target/loongarch: Use generic hrev64_i64() in REVB.4H opcode
  tcg/tcg-op: Add tcg_gen_hrev32_i64() and tcg_gen_hrev_i64()
  target/arm: Use generic hrev_i64() in Aarch64 REV16 opcode
  target/loongarch: Use generic hrev64_i32() in REVB.2H opcode
  target/mips: Use generic hrev32_tl() in WSBH opcode

 docs/devel/tcg-ops.rst                      | 10 +++
 include/tcg/tcg-op-common.h                 |  4 +
 include/tcg/tcg-op.h                        |  2 +
 target/arm/tcg/translate-a32.h              |  1 -
 target/arm/tcg/translate-a64.c              | 11 +--
 target/arm/tcg/translate-neon.c             |  2 +-
 target/arm/tcg/translate.c                  | 14 +---
 target/cris/translate.c                     | 20 +----
 target/mips/tcg/translate.c                 | 24 +-----
 target/ppc/translate.c                      | 10 +--
 target/rx/translate.c                       |  8 +-
 tcg/tcg-op.c                                | 81 ++++++++++++++++++---
 target/cris/translate_v10.c.inc             |  2 +-
 target/loongarch/insn_trans/trans_bit.c.inc | 30 +-------
 target/ppc/translate/vsx-impl.c.inc         | 19 +----
 15 files changed, 99 insertions(+), 139 deletions(-)

-- 
2.41.0


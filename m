Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2036669ejb;
        Mon, 31 Jul 2023 02:11:56 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHdfb9gXlahqg7iQb7mNBiMaW7rqau2ytfxss6v1LyImhz94F+0FS1yj9j9JGberD3NCxdP
X-Received: by 2002:a05:622a:104d:b0:405:4816:7e15 with SMTP id f13-20020a05622a104d00b0040548167e15mr12174491qte.43.1690794716017;
        Mon, 31 Jul 2023 02:11:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690794716; cv=none;
        d=google.com; s=arc-20160816;
        b=H9+tNtOnPoDplmAqmDRSHvaKgU+lQ5H4C8ZpZmcY3GlgXkK+LUHYDeg5IV/cqVgCIy
         i3XgZdlm5qwrYhu6IbFgxylrLjnFJOGcFHG9UjFVh4T5p+vz/9Vj70r2Eh+7KU1pvGxk
         tl0Cak784w09ZEa/W00zhuypA01N/cUMg9tB/mVlpGJUTzpA79FlvRCjguIFgl7QK/4G
         Zr16It3TgSozx+IWEiCeFy5FXdJXfQRA7se7GE0Pi4rDftAf9ACS426lZyJvz5jvgpVA
         cf+e3SkC/m1zDqa3MPXWx1W9OsZiRY2HrfGX+t4tuFa5Mxrjuv8iZJPZ39b1F1/CGo4X
         GR3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=stHb44EFqAwCnYucBnH3WIBdFRhGcLwC/3ZzkYUmkbs=;
        fh=He1msQv7C2jF8RvcpN/Rxc3Sy54EePC4s0um1PixWsY=;
        b=jePrRA277RzLjMIIqxkH+94J5aM5Y5mtuQIcfVCqJ5+Sg+4O3HBxpGf1kVgOQygF1T
         /jUqPuFG2yqFArT9AsBEF/kk9GGC7RjcSMfWE7AwKhivJ6U96i6hHV5unRIeTKQ0d5TV
         1upFILOLjsmnWpgTk47hbjCuEuzu6yWWItEnVNqpdAJ7qXfZueg0QP7u1EfhntvkOR2v
         BrJgU54x5K4ziWy5UV4vVIf8acgUZqZDSq+auOx7Opmq1ReoaLkyCLoHAmrLA53ThZvg
         QbtWk2dOY3CrK5IkUnuuIM19NUfMBxLv1PFmE2gFPyGYZzzsvrGA8Eqj+agRihbiMzmI
         PIVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=Dl3g3xCt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18-20020a05622a02d200b0040fc464f908si173552qtx.436.2023.07.31.02.11.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jul 2023 02:11:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=Dl3g3xCt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qQOvg-0007ku-Mn; Mon, 31 Jul 2023 05:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qQOve-0007iS-AM
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 05:11:03 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qQOva-0001PM-Nc
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 05:11:02 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6b9cf7e6ab2so3397481a34.1
 for <qemu-arm@nongnu.org>; Mon, 31 Jul 2023 02:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690794655; x=1691399455;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=stHb44EFqAwCnYucBnH3WIBdFRhGcLwC/3ZzkYUmkbs=;
 b=Dl3g3xCtIGyVccIgwFoQKI3Gk/zbHXNIb1WMQMQembE9bJZyHEQPDWywW3UGB83JTx
 FqPJGgUi78Kjlt3sCPXquPFLXyIWnrK1WCXXtKx8xV2W9i1uivCLXpLuzKtDePbGrI1m
 MivPVxSm27sSn9WqivgOrb6D37bRod5JpGJ7Gc24JeU5iYHAdGzfg/4x+9uvQnrIZgrp
 593zOi7eewqB8zdJ+hdr7SfJ3rkPzpQl6Sxu804CF43gax8rlBr5mOwMSFjDZJ6JrmJc
 sKYz5sNnT2Iz9Ri+XyGyn+TLCc89L9i3srK2d34HZiYJ8V8o5ad3f6nrZBnPLVKLy9Jy
 HLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690794655; x=1691399455;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=stHb44EFqAwCnYucBnH3WIBdFRhGcLwC/3ZzkYUmkbs=;
 b=haG1Kjl7jMIaOx8XA6glaA+EUVY2zHA0jeY7z5FXf9wvDjhF9WglVLqoSn4PhVJnga
 XImIsNYKeCk0IBL078NXqdzqOkRz36Rdwge0P+N0c+Ti89pyZjjQrSZ9mbIyCJd1Ulj1
 4J7l8YdP+H9Cj9+QJRt5OZetXwOWtvDWKtQ+CoOES0FxdnB42dXcAJm7X7WphM3SIzO8
 r5qSPCVUpj/eV3hWJ5I9GxDkeaYtua26o6EHLQkJpQwWjV9xgWm+jxtudmhAEh5cITnG
 Gt/tUDKGh8t0WO3Y/6HOkASIdiEPdlWM/UX5XAnlgVHHccVXKxeN2vLm79sgrM4o/KRJ
 fNZw==
X-Gm-Message-State: ABy/qLYPIPYVERpXiUIPwemKLqiEhloWk0lrfB09lu3cviwtKNiaPnc7
 rmkA6klCiPuHm6bH9huijGGbGw==
X-Received: by 2002:a05:6358:7e9a:b0:139:a0fd:780a with SMTP id
 o26-20020a0563587e9a00b00139a0fd780amr5945500rwn.12.1690794655548; 
 Mon, 31 Jul 2023 02:10:55 -0700 (PDT)
Received: from alarm.. ([157.82.204.253]) by smtp.gmail.com with ESMTPSA id
 p22-20020a639516000000b005633941a547sm7714752pgd.27.2023.07.31.02.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 02:10:55 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 0/2] Accompany -nostdlib with -fno-stack-protector
Date: Mon, 31 Jul 2023 18:10:38 +0900
Message-ID: <20230731091042.139159-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::32d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: xQxNC96ic10I

A build of GCC 13.2 will have stack protector enabled by default if it was
configured with --enable-default-ssp option. For such a compiler, it is
necessary to explicitly disable stack protector when linking without
standard libraries.

This is a tree-wide change to add -fno-stack-protector where -nostdlib is
present.

V1 -> V2:
  Dropped changes for pc-bios as they already had the option. (Thomas Huth)
  Make the change for softmmu tests in a central place. (Thomas Huth)

Akihiko Odaki (2):
  tests/migration: Add -fno-stack-protector
  tests/tcg: Add -fno-stack-protector

 tests/tcg/mips/hello-mips.c       | 4 ++--
 tests/migration/s390x/Makefile    | 4 ++--
 tests/tcg/Makefile.target         | 2 +-
 tests/tcg/aarch64/Makefile.target | 2 +-
 tests/tcg/arm/Makefile.target     | 2 +-
 tests/tcg/cris/Makefile.target    | 2 +-
 tests/tcg/hexagon/Makefile.target | 2 +-
 tests/tcg/i386/Makefile.target    | 2 +-
 tests/tcg/minilib/Makefile.target | 2 +-
 tests/tcg/mips/Makefile.target    | 2 +-
 10 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.41.0


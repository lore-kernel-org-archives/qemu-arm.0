Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2705651ejt;
        Mon, 19 Jun 2023 02:19:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ltOr4c5BYHLR9vAlmNo08RMgmmeE5UZUvGCuj878g4FT7ed4uNnMchjTKUsSAwf+4hypS
X-Received: by 2002:a05:620a:8e89:b0:761:fab8:5dd9 with SMTP id rf9-20020a05620a8e8900b00761fab85dd9mr7795263qkn.51.1687166354175;
        Mon, 19 Jun 2023 02:19:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687166354; cv=none;
        d=google.com; s=arc-20160816;
        b=fBKehZj4mSDeRe4AvOXRtjAZSN0pziINYX+q8w1R+rNCdsgGnzpW6ayOeRCI/Bg1Pl
         RfTUKhk+1VlH+555rtgkeQFo5d1g/bYqtjKIbjz09kwChop/IYxsD/VHbls4LY7Tvn4i
         wTqkRJ0kNv69vzNcQ7TZWP4n8LE6JfTqoDUfhteRXAm0A9zEHR/tlNxPoio1A67ZaX2a
         1PM+yoJvNfeQpTNhkG87bDONMQXrKhZp8csPHc6Pb3h6DsPSYPrAYd2zHiqwd8eMkXNd
         43Kt4C1hsXHN6XcJ/ErNFPhnNjwKc7enTf9bLvrKaZg+CMut+fYebo7Lt2/9h00OovYY
         HUoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=2/VrtV3ZTG0nVUxDR9INjm9Agnxp2gFnf7e5hISX48c=;
        b=0KoBr8LDgdhbSPCJQlid2QMgKP86ZeaheHpexx0Hj7nhORukxV+Nl0HDoAAyjmiQa3
         SIPAGSAEJebKbfYLdQMFNGyWsX1HEt77Rr3ihsxlIUgTN5r+jrkYpKuCY+WiB+fVzFn8
         fj4ioriLlYNdXp/xcgnVfsvdh1lhPjcEh9nhNmY3sD+OlWJZGSJ5ScsXV5JpKRx975Eh
         GDed9f5DqU3P8l3yr5zKjBlgNp1kN9L7Ewxgy1OwNgz4/JRo96Jg5KcYdDXvDmUBn8oa
         Q3963s0ot6RbSo2EdH3/f7Vw/VI2jqNWz5ln64MFOu0nRIbofK4keJqVkFSCC+2Wmt5g
         40DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cYuvRcVJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d27-20020a05620a137b00b007623a15e9c9si2942128qkl.568.2023.06.19.02.19.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 02:19:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cYuvRcVJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBB2T-00032r-0w; Mon, 19 Jun 2023 05:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBB2Q-00032E-Nf
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 05:19:06 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBB2P-0001vs-7g
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 05:19:06 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3113306a595so1912482f8f.1
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 02:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687166343; x=1689758343;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2/VrtV3ZTG0nVUxDR9INjm9Agnxp2gFnf7e5hISX48c=;
 b=cYuvRcVJSAt4kwdpznzDNN3LtwpME9MY3GI7h2kitDa0M8Xep1JxqmzUGDvvqQidiG
 +toBs+ZtE25SIpUCNHN0ef6vcPcZvblcSYKpvN0PvqgyDI46dz92exV2zfclbMjbtRQn
 LRJGMfsksfmNh4UusCikQ75S/mBGhqhI2JH3nAHhTDjfVWKGigrTf4dnPAlW43n25oQn
 gFHtjl9me3LLUPJp4D7sZcqdHcV4e05Afu5qlNOKK9XiSBCuaz9mHVPf90kSzunjJNl2
 QxgG5FpkzZgsQVIMAsd01k5Qo1JohMUHrnGuYh4V2jnmqcpVlI7fKBD6xq0OnzynDDuS
 4PZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687166343; x=1689758343;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2/VrtV3ZTG0nVUxDR9INjm9Agnxp2gFnf7e5hISX48c=;
 b=NzAJtUVALziIW6fxSNBqgdAE5q7B0iy7QfJ0wpNv6rSy0kGJljLzF1d9aiQBqHvVny
 Bu7fmD0TvA8KrxiYez0ocrjgxu8YS34HGL5uwFTZ24wewiCwfrZmXURwvd3NMIuk2Ki1
 DA8IMJxNj3S3cALpxwo/sJaB3u5MkmCCNWqQKgjo8gb46ZPlNQ9qm4+hrCPb0NyZrUgF
 Po1Du7PE2M6b7RcPYHd6aV15EiO/3bXeoTgVAV4V67DXjmXPwSgN+Wxl0rG0ki4HOjoc
 a5s9x2baET4NRTXkCJTrHI+CKjuemCtY1rXziEILYYhBYmjVolRX9e2EdbOdyN19tD1u
 fAWg==
X-Gm-Message-State: AC+VfDxA0yWnNw+7n763MO5NQlTV0tkvkL0ZdfY7ElRmpxmMIGRSnEKx
 ZGklGKFSdjKleGUV2wavpaQmqw==
X-Received: by 2002:adf:f287:0:b0:311:1dc3:d22e with SMTP id
 k7-20020adff287000000b003111dc3d22emr8522722wro.46.1687166343684; 
 Mon, 19 Jun 2023 02:19:03 -0700 (PDT)
Received: from localhost.localdomain (194.red-95-127-33.staticip.rima-tde.net.
 [95.127.33.194]) by smtp.gmail.com with ESMTPSA id
 b10-20020adfe30a000000b00300aee6c9cesm31022560wrj.20.2023.06.19.02.19.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Jun 2023 02:19:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/2] accel/tcg: Make probe_access() a generic TCG helper
Date: Mon, 19 Jun 2023 11:18:59 +0200
Message-Id: <20230619091901.51607-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: GdLYr4UcHkUw

probe_access() is not ARM specific and can be reused by
other targets, so make it a generic helper (after widening
its address argument to 64-bits).

Philippe Mathieu-Daudé (2):
  target/arm: Widen probe_access()'s address argument to 64-bits
  accel/tcg: Make probe_access() a generic TCG helper

 accel/tcg/tcg-runtime.h    |  2 ++
 target/arm/helper.h        |  2 --
 accel/tcg/tcg-runtime.c    | 16 ++++++++++++++++
 target/arm/tcg/op_helper.c | 16 ----------------
 4 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.38.1


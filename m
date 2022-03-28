Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp6344404lfb;
        Mon, 28 Mar 2022 01:50:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyk/sOxxisimdgvXrIShu2yImPWbjSfh5iwcHFcyq5dRvr2iMuMEqbrP8RV8bSzLz5g1AiB
X-Received: by 2002:a37:a084:0:b0:67d:405b:60d0 with SMTP id j126-20020a37a084000000b0067d405b60d0mr14866052qke.83.1648457412948;
        Mon, 28 Mar 2022 01:50:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648457412; cv=none;
        d=google.com; s=arc-20160816;
        b=BQwIV38LFzOdztZZmoxIAkDAmI3VXivgLYGvBG2NSzQXCGiepBgLP8bAH8+t3IvNl6
         dexIZ7j+b1du4KMSKH5Ove6se9a6zMUzP4ZVPJY79PU8E2fowaIrLc0siQE+dyn1A3IN
         5C7O3QzaGcUcJtcXNjvdKv/FL95sxUvFWbFJt7L6R790HBtSltxO42eT24oQuDXitq6c
         vB7tfJDQGko/yGVedpIq+/RaWQbkTrYGcCXCUITkN6KCyJaNYtMavcavaXB7kGiGg2ew
         sQOHZpfE0/ESP9iGjx9yo88SIJTJDHt6HoLSxx6sWCv0gk5+lnH8IDFO12wAz2M4f36w
         cTkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=as6M8B44WQoi5SAU+RW1StJnywxAgGY7xyo+dwowifE=;
        b=tJAMHEA1dAl/ZjEUIxFPaYD+eJ+CEFIuWjiMFapTM5r5raccuyixEM3LLVqLzGJQtl
         L+HSr7Ge+apDQw2+y8ErCkjx/TVJ7ys72cNWj2yptP1949ryc+E4z3wMVP280NxL9J0e
         GWYchY0gcRVG7guHs9U32QyE0/RMZmmYnqo5X8ct/xNL6Y3JNq6N2wWBkCWxLBMRvKwL
         YvpNBsYvx55rgdge7emBEswVSXS91szusM7Cpn6unLaSFIqBw1X/hnBcacsPwNBOdqOe
         BhGnB0MX+ss1q5M5dnS1iM6LooqzxpfLRCY17kRFdGjF6uFmdlcBJNt9mJ1NKnMPqNjz
         GkEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VonLHDfX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4-20020ac81384000000b002e1fbf3c0e2si5034402qtj.723.2022.03.28.01.50.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Mar 2022 01:50:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VonLHDfX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nYl4m-0007GE-D3
	for alex.bennee@linaro.org; Mon, 28 Mar 2022 04:50:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nYl2T-0004YT-Mx
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 04:47:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nYl2Q-000383-Gu
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 04:47:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648457264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=as6M8B44WQoi5SAU+RW1StJnywxAgGY7xyo+dwowifE=;
 b=VonLHDfXqkkkj3S7672iWjXx8935oYQhzyqa2in4fURkK+BPQNaBvrlzISotKvGdBJzV8L
 Id1VQrkKjuEcogKH5h4mZUAUDjuu481mDHrk7xCm4sTETt2GgyF6uksBoayR9JhA5A7tse
 jugtClTuAB8eOdkW6/jGlrhR6MyMpWs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-wJqyq-h0NnCEtO49_ncQpA-1; Mon, 28 Mar 2022 04:47:39 -0400
X-MC-Unique: wJqyq-h0NnCEtO49_ncQpA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B280B1C04B63;
 Mon, 28 Mar 2022 08:47:38 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CDE01121318;
 Mon, 28 Mar 2022 08:47:20 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] Compilation fixes for 7.0
Date: Mon, 28 Mar 2022 12:47:12 +0400
Message-Id: <20220328084717.367993-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WqLgiEsw+b56

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Hi,

UST tracing fails to build on Fedora 36, with lttng-ust-2.13.1-2.fc36.x86_64.

There are also various GCC 12.0.1 warnings worth fixing.

Marc-André Lureau (5):
  trace: fix compilation with lttng-ust >= 2.13
  arm/digic: fix format-truncation warning
  arm/allwinner-a10: fix format-overflow warning
  intc/exynos4210_gic: fix format-overflow warning
  s390x/tcg: fix format-truncation warning

 meson.build                              | 4 ++--
 hw/arm/allwinner-a10.c                   | 4 +---
 hw/arm/digic.c                           | 5 +----
 hw/intc/exynos4210_gic.c                 | 9 +++------
 target/s390x/tcg/translate.c             | 4 ++--
 scripts/tracetool/format/ust_events_h.py | 4 ++--
 6 files changed, 11 insertions(+), 19 deletions(-)

-- 
2.35.1.273.ge6ebfd0e8cbb


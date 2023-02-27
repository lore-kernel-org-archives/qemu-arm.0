Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4444939ejc;
        Mon, 27 Feb 2023 01:28:21 -0800 (PST)
X-Google-Smtp-Source: AK7set961cigd+qP0i969NZVBmr2YdM5YqFGRqg+DTlE2E3x5N8UxrWfdB0pdO/AhxQ3+pkjkz+Q
X-Received: by 2002:a05:6214:5189:b0:56e:ac19:a879 with SMTP id kl9-20020a056214518900b0056eac19a879mr41180882qvb.8.1677490101525;
        Mon, 27 Feb 2023 01:28:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677490101; cv=none;
        d=google.com; s=arc-20160816;
        b=tVtN3oov60YZMSWp/a4udkXzAms7BnDnnchr+IK1zwIlU8pySuSBRoTWM5A8EmflSL
         L+ZiiO4TdHFBVmaNDfd8N5NdeGcRTgGQaRe2gkVoXpFzV8XCRXdbzAEIBe46p3IqmtKc
         gdGCTUHuwPa/ftIFQr0w6ruluVkVJME3R8jQTJwO/d7YT0JvUqKyz2aoALuwnNNhs2Yb
         WVHBcyLU1gIWk13UryVNhcTfKNGVw/D2TxVDMj2XoeKfdHh5mVrDemFkqvSlIWK1gIJL
         FiVB2bCdT8UvVIAScyD+htuZL1ogFlY1+x0N5/bTJ7hLVev4DnCmYWcu+xTZF0DidgAR
         CNhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=vX+l5BNYXFo7s50RYdWlABKg5n7EzOmIIZ8TKgmZmds=;
        b=mJlyA2pVCSBK7K1mziRWgiAVZyoqGH6y004tpdfT5MwFm41nRt6cRnMcTXlLlvzDPZ
         V/XhaSq9hhx/uuHBCjG2zhp9+6GQAjoP/MEE8cNOxgir6rAbr315R/xSIQ6czRVWpTDT
         M20OsclNrr1NDuddSXKeqogdBIA2c0UTHmgnZiqfEk/PBjdjWtz4NCXa8l+C88qD/m7e
         w7sbX6sj9JBlvF/5PdDBO7QtOjT8pViPdTcphOe276BCsSLsnqfyHwroldvXApWDYG9X
         8xLh5v1QVMu9a9u+VwpNnD5dZDeqfWafI/s+nDTUhH2sD6Gak3Y+FJ7gKJ5JdZY4u7EP
         mpSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZLjatxPv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 29-20020a05620a049d00b0073ba88f6edbsi5689736qkr.80.2023.02.27.01.28.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 01:28:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZLjatxPv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWZng-0006aB-21; Mon, 27 Feb 2023 04:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pWZnT-0006Lh-VT; Mon, 27 Feb 2023 04:27:52 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pWZnQ-0006MA-IF; Mon, 27 Feb 2023 04:27:50 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 gi3-20020a17090b110300b0023762f642dcso5535566pjb.4; 
 Mon, 27 Feb 2023 01:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vX+l5BNYXFo7s50RYdWlABKg5n7EzOmIIZ8TKgmZmds=;
 b=ZLjatxPvtv293uuxDaqMPuaC+sxVH4Lhv53RasQqoLd/KuqA/Rx23UiKbWxi3R+PSX
 N1wiEvhjvhNebo7GYXh4tkPIlteXXkD5sy79qSmgAGAYB/TSgXaAjoiTEz0nvF+IaV84
 PpdhaMLcCH1DNq5iGuxsGCJXEorzp6ZQimmVkyGBoGliinLrUlZr/Uvi76dzsX2u2aJP
 aneUPRygb7v5Ez4PwHmtTNdCeMKdn005rFuRM0q93gt/zc+ofh45qRuKDmSrQmDkjuOR
 ESQl1rSR7RHBfNSf9WZv2Wd1CjYBcOZj1182tuITc2/vTa8nHvxX6I/LWKDAM64tcrqM
 xkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vX+l5BNYXFo7s50RYdWlABKg5n7EzOmIIZ8TKgmZmds=;
 b=eQzM7Syn8qLOcPRhxQS1iAn6CiNwwc6Tjw2Iob2N8x3pk07MElt+T5q6ZCgES35S7W
 YfXpJLKHkRI5qw8FsW9XzUADX9bXs6e1jFM8tlwcuKBFe1S754xan/lgqPRq/Gkhf3Hv
 6zqbyW3lvPkiSydANvMZS1fLJygb6tvkBNT0Upu5elhK8TPilFfFcVemf14zbzrIrp6C
 JXCpVTRi5GF9ponUAL3I+F2H5jtkOF68m3yqOw1IMWHNjSo77FFFO88BHiECnGbVJpd+
 dumCum47V+KhpuwF9Gz6Frt7rwG6V7YmLykiC66C/kUlmQGM70bzuMMJho6WlInpw3n2
 fl5g==
X-Gm-Message-State: AO0yUKXdalIRzoINosrSeYlmGDEOoKD5AC7Fwl2GYItZeeZcGYvAXxXZ
 uAMeTbPWQs+OWNwP8WkbQekNEr8dVXC3fRjXGbY=
X-Received: by 2002:a17:90b:3e8b:b0:237:ae7c:1595 with SMTP id
 rj11-20020a17090b3e8b00b00237ae7c1595mr4603508pjb.2.1677490064770; Mon, 27
 Feb 2023 01:27:44 -0800 (PST)
MIME-Version: 1.0
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-67-richard.henderson@linaro.org>
In-Reply-To: <20230227054233.390271-67-richard.henderson@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 27 Feb 2023 01:27:33 -0800
Message-ID: <CAMo8BfJXdtpxcfwnXfRaH3WARgQtyahZ+8oveF9SAt3uM3F6sw@mail.gmail.com>
Subject: Re: [PATCH 66/70] target/xtensa: Split constant in bit shift
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, kbastian@mail.uni-paderborn.de, 
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com, 
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: T8Qa9z0U7wOn

On Sun, Feb 26, 2023 at 9:48=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/xtensa/translate.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max

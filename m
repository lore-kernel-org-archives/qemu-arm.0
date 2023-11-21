Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp422729ejy;
        Tue, 21 Nov 2023 04:17:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFibwDbLpt+K+Uy3UjClSNzvB1ItxcZakAW34ThyhGRwRCuVpv8dqH1PCoEl/inDurJb+A/
X-Received: by 2002:a9d:7445:0:b0:6cd:8c3:5b4c with SMTP id p5-20020a9d7445000000b006cd08c35b4cmr11772168otk.16.1700569023370;
        Tue, 21 Nov 2023 04:17:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700569023; cv=none;
        d=google.com; s=arc-20160816;
        b=1IOypaupvm0If3knxXsmGTFVrvh7/UBvjBDX7Aduv2ODPz+/D1sqXqWNQgOOmS8M97
         F/VqdfpfTxvIj0nWwZyvbEavtl+401QIgV4OfrxZo8VNruQlASleOQWUhoMKFGQvDbuB
         WQsgsGTaiVFlWAQmGit3cBX24vpTuboglKj48XM1h2gQ+oLxWFWNyeJSC76rpyydTo1R
         2NZ9NOfIlSc70vX2nkA5uwuAGu/eSavboeTvDQNEhMLAk0Z4YEzEXiRy9VUwWsaVOqgx
         sjrBVuAK+Lk/csMhqQoqqvWYWTPcI1mSgZStPr8YiyLdfd9utvFNiOQMfTskDd/JX3wm
         186Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=JDxv8dF0rBA/MejO/JqkJYni6H0QlKaA2vRRm7RNVKs=;
        fh=A6d4BJTkcO4Tb4V34rr2mSX3341RstIj7VsNiQUca0w=;
        b=jnFuMCAyhVVQk6xTw+q7rLw4CvRqVKQBYjZg3BBfpofCZT5c8xLkmZ0r6fSWGwswG7
         wjf/DjTrXD6t5M5UMdDJXhgtpzqVWoYiaNjTWL5fsMCYNbPprGwaqBc6Z9+WVIjHdtuN
         K8D354mY4scznhmKH1X8O5uqVRJZtrHiO1dN69cmQ0XauWKopUAL0gRCzCDjPTsvOZsT
         dvORf8Zbu2wEMJyoYJdL5pctq9QK2SXZFJrnk00je3ikAioSmgohuN7grDqT/EWYodl6
         X9Hldw4WQRd79JaasGlYuO1nzeXZxxui1W127MwDT+GEHaS87YF2gLkkaBDwLrF5r4jc
         q+IA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xuUUQ8mO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8-20020ae9e908000000b007765135d96asi8446920qkf.390.2023.11.21.04.17.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 04:17:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xuUUQ8mO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5PgA-0004Q5-LR; Tue, 21 Nov 2023 07:16:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5Pfv-0004LT-8h
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 07:16:22 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5Pfs-0002nz-6P
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 07:16:18 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40839652b97so22632685e9.3
 for <qemu-arm@nongnu.org>; Tue, 21 Nov 2023 04:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700568974; x=1701173774; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JDxv8dF0rBA/MejO/JqkJYni6H0QlKaA2vRRm7RNVKs=;
 b=xuUUQ8mOYbccJQH5xD4XXvcC3Kh0wow4/fqAyxr5kfjj71FDo2rCRyRNJb2lsBqL2P
 quTSwRP5bU17vMoW7fi8yp/z/N5cAj6fqpkbVb64s0OR+wBt64AwXzzh9yvLHgXMLEXO
 +nrA7cm4CUYvTKhikDuyvOnWUHnXoG/peBia3Ctj8sSs+AAnPdbwTbKvtc0yH0Oaydqs
 QrLhDOX7Cb/a4Znm8xyaSGr5rTblPD219obRidwIS7VIJJsDF+RqnoRjnPvd+Pbz16+o
 jr8Y8x0yfnSJywpegVGCVDkXNbHP+ZH8NBsB5s3e+RX04y5p961ZMdkkmdSv6UDS3QSM
 QgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700568974; x=1701173774;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JDxv8dF0rBA/MejO/JqkJYni6H0QlKaA2vRRm7RNVKs=;
 b=KBnfPJfTXRWCgu31CZwYEdVMO+sT/P5m0v77EIq09r10aAR+v+al/5Taz8XjbODm0w
 m5aXo3R//D/X/iPWeijRLCsBxG7sB5g70nrckExZrl7xqSxKmCahQ0wy1dVC/EYW+nK0
 h9ADUtCEX9NFlrbW+OjSVSbmBR/z/541gwXXDNWHwUTN5L1aBIoVcD6OhV3zws0hhFp+
 hLEGlp5WzADw+/v8yyo8abnHnx7Il3+7V0KgLj/SYVQxubaKAwwP5FbkDslMhC+qnE8f
 0sert+yxINL9LH+HCQWNjOkUysfKna1TaCOBGJET+aboe5cYLyZDtLWlLBrVuMF5QRYw
 nz2A==
X-Gm-Message-State: AOJu0YwOFzaE2st/IC/wiPqPlCCIzLNjfV1VLk3GyWOGIAX67r397NBs
 2nQtg3WbEFxoN2wtVvUYumpOOGUWWAppvjDPEbSAIg==
X-Received: by 2002:adf:fec5:0:b0:332:cddc:24fb with SMTP id
 q5-20020adffec5000000b00332cddc24fbmr1510386wrs.26.1700568974435; 
 Tue, 21 Nov 2023 04:16:14 -0800 (PST)
Received: from meli.delivery (adsl-195.37.6.2.tellas.gr. [37.6.2.195])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a5d6a05000000b0032d2489a399sm14070970wru.49.2023.11.21.04.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 04:16:14 -0800 (PST)
Date: Tue, 21 Nov 2023 14:15:09 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-arm@nongnu.org,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 C=?UTF-8?B?w6k=?= dric Le Goater <clg@kaod.org>,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>
Bcc: 
Subject: Re: [PATCH-for-9.0 07/25] memory: Have memory_region_init_rom()
 handler return a boolean
User-Agent: meli 0.8.2
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-8-philmd@linaro.org>
In-Reply-To: <20231120213301.24349-8-philmd@linaro.org>
Message-ID: <4h3f0.gab1yddmsk3r@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: gQU4TYXEQp4U

On Mon, 20 Nov 2023 23:32, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>Following the example documented since commit e3fe3988d7 ("error:
>Document Error API usage rules"), have cpu_exec_realizefn()
>return a boolean indicating whether an error is set or not.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> include/exec/memory.h | 4 +++-

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

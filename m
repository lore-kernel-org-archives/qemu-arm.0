Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp401569njb;
        Thu, 5 Sep 2024 00:57:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV4JQ5sIyAO5ejoPiTgxH0u2v3v0C35o2O4wFBgmfcXQtgt64Imn1s3id1Lc3H6ueNKRVMQyAwYwunV2Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFmPfRabVe8MwxJehUbrxjcGytI2eAFcJ9z5ycPYq6aP5EEmwxH1US94YHaaD+fHo/CGCrm
X-Received: by 2002:a05:6902:2e82:b0:e1d:150c:18d8 with SMTP id 3f1490d57ef6-e1d150c1e82mr4120394276.45.1725523030777;
        Thu, 05 Sep 2024 00:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725523030; cv=none;
        d=google.com; s=arc-20240605;
        b=RVQ5Q0uCsr6Bjr+eBvdmGNPyn156hqvntTUQ2JIMYhZ0YCFtzDa+mzYG3RAhlejxTK
         Mpzb98sF0t3mT9JMjQ48A3bAj0I3zKajqsyC/SOAA5JFJuyBbXytspkeW9XbLsIA3+U9
         AkjtumMcej5mWnKHdibVLYkyiwSfnA4+kRNB+Zqg7Ygq18/1Se5BGc35MSiPmIkTk+3A
         09aId9GpchVmQgqGpBsLDwsTW88WlSGq9R1UJXJKh9Bn/uVAFBaZ+0sNh6Hwuzkgcaa6
         MLJ5XtlfLmwwML4Bg8vQi2aKEtqPPlBF95NyQW6d5/E4TDujsNvX22A+capz5k40Wqvt
         xeqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
        fh=w3gIRQoeZ+Xt5zJo5z9DBNiSaIRqgA0G2j+R4UPNyWs=;
        b=VZhWKJOKWKaV0L+5R40PJZkL3c21D1GlZLtfTcFFjlHLPjY/KSaCCdZ7KJnOkLPL8l
         3l98w33HajOqfbhMM8skC/5iokcE0zHlojKHFXserN+8w0DQ8l2ipoofpebu9WtO04R4
         AGg9YqIK68ZXBU94i8KhosTKWqriDGJEVOj/vk6oRP9ONWd+cyP0ggrYk41GiBI9YNBJ
         jPqWFLvtVdsjt3aHC5y7w9IJXZXW+epvfJacz2cPv7EgK2x+Jz56oLSM4StTOn3zpft/
         Su5zzXsdM1feYqwEo68kNxnXk4djyJ7JEtdE7KoUBHDBlXDylwLnT8wBIUMU6sfn35p5
         C6nA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XYkkFAsZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c52051bc95si14172336d6.446.2024.09.05.00.57.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Sep 2024 00:57:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XYkkFAsZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sm7MU-0006oX-K4; Thu, 05 Sep 2024 03:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1sm7MS-0006ml-Hc
 for qemu-arm@nongnu.org; Thu, 05 Sep 2024 03:57:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1sm7MP-0005O2-1f
 for qemu-arm@nongnu.org; Thu, 05 Sep 2024 03:56:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725523015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=XYkkFAsZbv2XbvhTXBw4v4xEOU0LlDKKxPajZgou417AnDgR66gQg0O8XZPHnSZ7sMmlL/
 d3RUhlmcyUKcudNDzKh2FB+enBmsp4IXdy6qIqrXGP9p6PqsYAlob5HvLqwC08EnBC8qr/
 Bq4sN3lRnMY/2w3zCKkcsMxPTGNaoUU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-_8rFARfwPQaPkotA37T1iQ-1; Thu, 05 Sep 2024 03:56:54 -0400
X-MC-Unique: _8rFARfwPQaPkotA37T1iQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42bb6f0f35cso3785715e9.0
 for <qemu-arm@nongnu.org>; Thu, 05 Sep 2024 00:56:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725523013; x=1726127813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=q4zQs8dL5cTq7w7a8jmH1e1bKFsX0egdEBqD5mKTCRdJrDFieqiZuSkkddDm/sAyGi
 uA4xIenUIxSQSEwSiZ+eW/K1USQgKT7GAkDzV3fMqh/khjJxUf6xrPzPuzNrTCiecdob
 cG8N26w2sgnQzXu1pSSqEzxyvQIa5GHeO9yBXfqqhjOaMgN89/9SXeTQiEVV49ZPXeSl
 QWaQlx82ctFTfyd3Y7GZ5dbHmT7ihb2yYl3YCy9DDy/beBeE7bL814+3TU/VlLiMgzsQ
 N3xSc9Sv9arJ3c/rWv+Hj+ZEZ150Ck4i6B4mlnA5IDv/+jw99bYfh5jPier/BUYhSVjX
 A2zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0a4HsBGGqkZry3xH0pO+JcG49RBRuhXxlhak05fQnXnvv0c70o4Ez3HjVgPSX/FnJp3LbokQ6GQ==@nongnu.org
X-Gm-Message-State: AOJu0YymIOVjsvkxp+qqUvTRfafjQA3+AbU1+pxF2+sQpKRmOYHk/Lsu
 i+/8/HP+1gDPcmkCXIzPFoymIzWr3s444LOGI5WWakXInYej+hxkwfGox6Li4i9SF4nFLobFdRo
 B6dvZXSQsADPAyHwNuRZ1r1pIIb+cuNFQfMfb43TuSsHxFzhGpw==
X-Received: by 2002:a05:600c:5494:b0:426:5dd0:a1e4 with SMTP id
 5b1f17b1804b1-42bbb20568fmr138180245e9.8.1725523013320; 
 Thu, 05 Sep 2024 00:56:53 -0700 (PDT)
X-Received: by 2002:a05:600c:5494:b0:426:5dd0:a1e4 with SMTP id
 5b1f17b1804b1-42bbb20568fmr138179765e9.8.1725523012771; 
 Thu, 05 Sep 2024 00:56:52 -0700 (PDT)
Received: from avogadro.local ([151.95.101.29])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df7c5bsm225133905e9.23.2024.09.05.00.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 00:56:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Jamin Lin <jamin_lin@aspeedtech.com>,
 Helge Deller <deller@gmx.de>, Song Gao <gaosong@loongson.cn>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Joel Stanley <joel@jms.id.au>, Troy Lee <leetroy@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-riscv@nongnu.org,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Tyrone Ting <kfting@nuvoton.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-arm@nongnu.org,
 Sergio Lopez <slp@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Jia Liu <proljc@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v2 0/3] Serial device cleanup
Date: Thu,  5 Sep 2024 09:56:44 +0200
Message-ID: <20240905075644.350538-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240905073832.16222-1-shentey@gmail.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: 7I6GOdrv6i3S

Queued, thanks.

Paolo


Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3233650njb;
        Tue, 9 Jul 2024 04:53:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWwOwgK8a1LNPu6/bKbFFjOGF48n+lmWBkNoFBrZcw20sBCbOuXWJm0jyNa/MijvusMoc4xLs1w/BAIBq4K/LNOANxJWy2G
X-Google-Smtp-Source: AGHT+IGcQ201e9c/p8NsXzuRNlOBAHht0QpCvfi8cEN1dAxPuby0ZI4X8gN4zsbuvGssxTpZJB/H
X-Received: by 2002:a05:622a:307:b0:441:57c1:b05c with SMTP id d75a77b69052e-447fa825dc5mr24950721cf.3.1720525981094;
        Tue, 09 Jul 2024 04:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720525981; cv=none;
        d=google.com; s=arc-20160816;
        b=OYS38dE43peHZMxea62spB7q5Bt4Ym4UFu5v596gnRs/BMYBop7frawV0tLcM6R6cJ
         12MW1nNnQ+lKF6kzAa6f9bFisOtffqe7WSAuN3QqpuEQFDcw/vvjKBi2TTAL4x6KcMOO
         ZujuqZwQ9HtXgqqThKfN4XOjrhEwP/aUY1E6NEuDBuGUMD1lqBXfzDypXY9jpiAjPh2T
         NoZGcjzFGo4963V1yhZjIOwiFJvBmW4/mCXgRFLbazivnbyzKil1lNbuzprUreb2xod4
         vpp7zSNl/aECmT9mu3bJfld7gg1mc4McdZmaZm9wNkDpUpgIWr49lYmwXiHBFjN11pS2
         q5Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=tFbZlbAPq14JSYGSgHWHrMHgaSNG1BMaQNHUf1dKK/M=;
        fh=//RUmME8FDhHHOy0et2Cqja/I65gKN6UBnwN7MzepaQ=;
        b=Cx8EIvUHfAidWAT7TkzUHS7eAzYj/ggvGis+xlg4vF1fFK06G0ThcuHYvi5zNSdrNp
         B19meNMsLRrHhhi9Ej3zhTMPrDQDhcmiaBkV3sUajaHRsd0PgDRcQSUh5XMfYjc04JlL
         TzAorKLv1ysnfXKK3S4VlTRTzuT+4O2sb2xX+m3AOUD+wO0k9NCpa1adXqFQArIAyvRr
         RRqT0UGrgopiSGsPCg37R88dKQFhSEkExIsXQtfSmMCc49vPDmYjKKyR6NOrU83nvz8E
         Raud/BHg5MR2Y0iWoz/Pq65MJxaYw9R0cN9vmv1LlRQQP8azhYyPwOsZ0o6im0BwJ6k6
         yuKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hfmh4cfC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9bc4ed1si19620161cf.470.2024.07.09.04.53.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 04:53:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hfmh4cfC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sR9Ow-00013Y-P8; Tue, 09 Jul 2024 07:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sR9Ov-0000sE-J4
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 07:52:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sR9Op-0006V7-Mp
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 07:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720525957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tFbZlbAPq14JSYGSgHWHrMHgaSNG1BMaQNHUf1dKK/M=;
 b=Hfmh4cfCBI8l/nLlg80v5GxkjuNzOA4HxLCVJiPAkMrxCu2lyggQJl6qVQCIOGJ/Zf7iIW
 n8yzN03jhpdokNy3QWKn6rhLYb2OHxYSgREn27tWK1tIEou5xN1jQfrGTULM79+cNDd2M7
 rQx2q5C01sTe8xGVwUKCGDEAewu/3xM=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-477-ieJyBd8oOl6ls5KWyNOMoQ-1; Tue,
 09 Jul 2024 07:52:33 -0400
X-MC-Unique: ieJyBd8oOl6ls5KWyNOMoQ-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5593D1955F43; Tue,  9 Jul 2024 11:52:32 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.193.243])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E6B7F3000183; Tue,  9 Jul 2024 11:52:30 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 0/8] aspeed queue
Date: Tue,  9 Jul 2024 13:52:20 +0200
Message-ID: <20240709115228.798904-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: YSyky7BYaDZ3

The following changes since commit 44b7329de469c121555a1acf9b288f3ae71b8e61:

  Merge tag 'pull-qapi-2024-07-06' of https://repo.or.cz/qemu/armbru into staging (2024-07-07 13:23:28 -0700)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20240709

for you to fetch changes up to d847ea7cfc6321e2519f587d4077428d90557178:

  machine_aspeed.py: update to test network for AST2700 (2024-07-09 08:05:44 +0200)

----------------------------------------------------------------
aspeed queue:

* support AST2700 network

----------------------------------------------------------------
Jamin Lin (8):
      hw/net:ftgmac100: update memory region size to 64KB
      hw/net:ftgmac100: update ring base address to 64 bits
      hw/net:ftgmac100: introduce TX and RX ring base address high registers to support 64 bits
      hw/net:ftgmac100: update TX and RX packet buffers address to 64 bits
      aspeed/soc: set dma64 property for AST2700 ftgmac100
      hw/block: m25p80: support quad mode for w25q01jvq
      machine_aspeed.py: update to test ASPEED OpenBMC SDK v09.02 for AST2700
      machine_aspeed.py: update to test network for AST2700

 include/hw/net/ftgmac100.h      |  17 +++--
 hw/arm/aspeed_ast27x0.c         |   3 +
 hw/block/m25p80.c               |  16 +++++
 hw/net/ftgmac100.c              | 147 +++++++++++++++++++++++++++++++++-------
 tests/avocado/machine_aspeed.py |  12 ++--
 5 files changed, 162 insertions(+), 33 deletions(-)


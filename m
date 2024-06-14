Received: by 2002:a17:907:681:b0:a6f:694d:5ff8 with SMTP id wn1csp92698ejb;
        Fri, 14 Jun 2024 00:28:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVDvNfUIYwDEX2VEixX8ign7q3an2JZL7b+vhiBaYVeQz39NXMU+7dxt4ykXolgh+ZXpW4o8w1JsoQYqpoBIOnRnhL2x7OE
X-Google-Smtp-Source: AGHT+IF875xnFcCX8HGoQFHpZdbLgSGgBNstBs1XUrYXbirYekUImGOIsiZAzfBaorniatBb/Mau
X-Received: by 2002:a05:622a:587:b0:440:51f1:288f with SMTP id d75a77b69052e-44216b1c127mr19197441cf.48.1718350102425;
        Fri, 14 Jun 2024 00:28:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718350102; cv=none;
        d=google.com; s=arc-20160816;
        b=YeqM5lW42L0nTJG5mF2fplKTlRRnbM9lpcG8w0nlyAYz4RvCPgGCQStoxlgJks6RhI
         1rCTC1GaZMND5yfSl7BYR3rZirLCsjn40NtmxdT61GajGdpTFrOhJRjZbHyC7e7G6Pv6
         5g+YeiHvtNr/qTPXnxS3LMhAjFZET96SAMy0jqweyn2PSzO+hR/mU/Pii9bOb1ciuGG+
         6+Y3YKCJvuJypUGcWkb3QTfYKIDOdD15l/n5pjXMslVj5Fx5hBC130NvfdRsdQ9ExdSh
         d74vCao7DXHXJpJqbhQ9rJR3bisMM+qb6yUEm54c7qGXk/Z+JPN+YFvLMaUhgLjH+1H2
         HvNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bpcuwxjalIJ0QJAmlthQ2zrRXoFKbmpEf1OqfPzxvQE=;
        fh=1x7vFveTi64FFonLntAXsLDCtaC/D3e0cEfMDM/siF4=;
        b=qFpO3njPJOAwcbqLdQ5bytyqV+PMHPiTDT0gx5Doh3Vh7eZ/B6Ze1O/xbDyMP7lPnp
         N7mpH5zr1kpfcsclzwNxRwqki49pa7s9e/1q3wQBfd9EvYgHENo3bhs31ofywb+l2B6f
         C8PqPGTj9YXnkxy9Ywqocu7bb0H2gsLwAaaoOlWb+KiRGnrXVZcVH/iIm/obfuIWX5uw
         lKdimkWpokXYeg0uq0mraFgbPrfg/PL9VaXzNcPSxD30acMr30AoSpkEHwkv7zKn/VLz
         5qibz5jz931SeMBfLtdXlbjKSwBnScJiExjVqdcWX/BQC5UMQPSxvwgM+u3aC8Z1h47z
         D6LA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HiSVbksP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-441f2fc7ee7si32036461cf.503.2024.06.14.00.28.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2024 00:28:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HiSVbksP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sI1M9-0004Ea-AI; Fri, 14 Jun 2024 03:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sI1M7-0004Br-Lc
 for qemu-devel@nongnu.org; Fri, 14 Jun 2024 03:28:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sI1M6-0000rx-9h
 for qemu-devel@nongnu.org; Fri, 14 Jun 2024 03:28:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718350093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bpcuwxjalIJ0QJAmlthQ2zrRXoFKbmpEf1OqfPzxvQE=;
 b=HiSVbksPd4Yi+FKdpxdxKIlHPygoGxmlr72W1KIHHVSxzNPrz/xJd4lBzwhqi7TVRcdGs8
 w/QjqcALY/bM4a4I5bcT2TG/4tGCZ86yMMorfvS//Y2esdsX5M2Ke4ceQnGL7fPwL2Ik+k
 a7WbZ15CVRMDGh623+VfCCbbQ4rU818=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-148-QTXTrMYiMAWpI4Wq7KXJzA-1; Fri,
 14 Jun 2024 03:28:09 -0400
X-MC-Unique: QTXTrMYiMAWpI4Wq7KXJzA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 35ABA195608C; Fri, 14 Jun 2024 07:28:08 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.49])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7CE653000222; Fri, 14 Jun 2024 07:28:05 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PULL 19/19] MAINTAINERS: Add reviewers for ASPEED BMCs
Date: Fri, 14 Jun 2024 09:26:20 +0200
Message-ID: <20240614072620.1262053-20-clg@redhat.com>
In-Reply-To: <20240614072620.1262053-1-clg@redhat.com>
References: <20240614072620.1262053-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.145,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eMM2f3Dgm8oa

From: Jamin Lin <jamin_lin@aspeedtech.com>

Add ASPEED members "Steven Lee", "Troy Lee" and "Jamin Lin"
to be reviewers of ASPEED BMCs.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 951556224a1b..0f63bcdc7dc7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1158,6 +1158,9 @@ F: docs/system/arm/emcraft-sf2.rst
 ASPEED BMCs
 M: Cédric Le Goater <clg@kaod.org>
 M: Peter Maydell <peter.maydell@linaro.org>
+R: Steven Lee <steven_lee@aspeedtech.com>
+R: Troy Lee <leetroy@gmail.com>
+R: Jamin Lin <jamin_lin@aspeedtech.com>
 R: Andrew Jeffery <andrew@codeconstruct.com.au>
 R: Joel Stanley <joel@jms.id.au>
 L: qemu-arm@nongnu.org
-- 
2.45.2


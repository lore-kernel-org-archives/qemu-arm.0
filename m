Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A41CD98F2
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Jun 2026 13:57:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wbf8m-0002NV-Tm; Mon, 22 Jun 2026 09:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wbf8j-0002MS-JB
 for qemu-arm@nongnu.org; Mon, 22 Jun 2026 09:56:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wbf8i-0007un-3i
 for qemu-arm@nongnu.org; Mon, 22 Jun 2026 09:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782136598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fZZHLqew+L0sNIC1rOgityrBeK37dEjwB9uEKt+gf6E=;
 b=JFl8baxy+xwp8gyFJB/Q5bQ3ZUJ3dBB6kyiCDQQCM1pTBhhpE+7rQNV0FTh5TMMyJdpHGU
 oEGDZACmSXXvDhWyH62mgI/4J6w+AiP9Ytupc7leWnmfMYajkfaIsTgJF9py5xl9EA/+7+
 LC9rsO6ntwjKtDNLwnSLg+/okaB7FyI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-8ShCShmaNiivWEakCYjxEQ-1; Mon, 22 Jun 2026 09:56:35 -0400
X-MC-Unique: 8ShCShmaNiivWEakCYjxEQ-1
X-Mimecast-MFC-AGG-ID: 8ShCShmaNiivWEakCYjxEQ_1782136594
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-469218e618dso663956f8f.2
 for <qemu-arm@nongnu.org>; Mon, 22 Jun 2026 06:56:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782136594; x=1782741394;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fZZHLqew+L0sNIC1rOgityrBeK37dEjwB9uEKt+gf6E=;
 b=SfrdYiEKisWa7qrLHJU+5i4PbG1qu01WFerS98nF+/19D2v6Jg8BSTd3vnOkThoGwj
 ajUU10gE8If54so7UbDMuooU+6tWcu2cVlV70kONQMuFxj36LMTYUwN4qxpSL2uuwF4u
 VjxCk0iikoQ39mZGcn+XCtZpGWaH/o0iaGS8nH6Vf0a8lN4JQOmocq/OdUFOW3lhUAL6
 1Ye/+Si7jCmLnuYuOjmlzEKEiUS8LBXzBVI5zjgYosb20bypc6Wa3yjBzWhAJMWYItcJ
 hz0j+dIn9x5Utp9u26gsHvSc+c64akCJf5EugEI/QKMKDb4dMBlJHrP78twHXg/cqSIV
 FQAw==
X-Gm-Message-State: AOJu0YxtFidK4aufHn6a28QRP/QFDHfdsZ1RRI9ArojHE8qbwpxpM2gH
 XdWITOIH8hdw+3kIdwPv4hwqzak35/iIAg2G8BCn0CuAXUI94S2G1g+eUfmvgm6nXOupjIhsw/3
 +Z+xqAnJshjReiQlWRZfGcStopkZ5jFGuXNi8fJSDjs4L9TCd1e0snQ==
X-Gm-Gg: AfdE7cn0rUWmdSqEIVfLYZqQ73jzvXJPdQGFlOyo0HROt/7SF3qXvHkwppZXH+zCKeU
 3YGcavCau2MxUwrRRFfQ/sVRFJgjZj2sJ54yRbOYxdnrQ735yIoQOrBTYnu0IWaSVldhLHtR0SS
 /EZ7D6mPrHCRXQRB5tIjYaHADXQWqB0iSbWYfjtkYA/p3Hcab77+K4143l17OkEIBKpQP8eaLBS
 /Tdg0FGJmuLcFal9e+YaiD9Mj/Z2WggqYbIdi4jqHcpuwH6/rPGNZOAxefo20CBYxmjylGdrI6V
 tTvL/DXYJEESFbeCqm+rDIZ5sCMOMztCuAvVplDvtlx1N56kr2TlzIRhUOiXw/+NxJ/hN5Jv5fC
 FYDKvfkxsex3hAjKVRxm06LFJ8nj64fvNYZe2EPAEWYKgcGs9JZ3/cAFu6+RCnLBrBNNv8JpiQd
 I=
X-Received: by 2002:a05:6000:1885:b0:460:70d1:c77 with SMTP id
 ffacd0b85a97d-46660d0617amr16297948f8f.13.1782136594175; 
 Mon, 22 Jun 2026 06:56:34 -0700 (PDT)
X-Received: by 2002:a05:6000:1885:b0:460:70d1:c77 with SMTP id
 ffacd0b85a97d-46660d0617amr16297901f8f.13.1782136593778; 
 Mon, 22 Jun 2026 06:56:33 -0700 (PDT)
Received: from rh.redhat.com
 (p200300f6af2a6100f239e076bbd76784.dip0.t-ipconnect.de.
 [2003:f6:af2a:6100:f239:e076:bbd7:6784])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466643f4e9esm25162303f8f.1.2026.06.22.06.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 06:56:33 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eauger@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alireza Sanaee <alireza.sanaee@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v3 0/3] arm: demuxed ID registers (CCSIDR_EL1)
Date: Mon, 22 Jun 2026 15:56:24 +0200
Message-ID: <20260622135627.40573-1-sebott@redhat.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -1OtkeHHXaVuKE1REsfmetm2Pk6ZZ0HdUX8FA3dHDBU_1782136594
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Handle the demuxed ID register CCSIDR_EL1 as part of the
idregs array. V2 of this series was posted here:
https://lore.kernel.org/qemu-devel/20260204133229.297061-1-cohuck@redhat.com/

Connie asked me to carry these forward.
Changes V2->V3:
* removed extra idregs_demux[] array based on suggestion from Richard
* removed COPY_IDREG_DEMUX suggested from Eric
* add CSSELR_MAX define
* rebased to current master
* removed my R-Bs

We still manually add the register definition to target/arm/cpu-sysregs.h.inc
- can we add special handling for that in the script that generates this?

Cornelia Huck (3):
  arm: handle demuxed ID registers
  arm: handle CCSIDR_EL1 as a demuxed register
  arm/kvm: get demuxed ID registers from kvm

 hw/arm/virt.c                 | 23 ++++++------
 hw/intc/armv7m_nvic.c         |  2 +-
 target/arm/cpu-max.c          |  6 ++--
 target/arm/cpu-sysregs.h      |  9 +++++
 target/arm/cpu-sysregs.h.inc  |  1 +
 target/arm/cpu.h              | 18 ++++++----
 target/arm/cpu64.c            | 14 ++++++--
 target/arm/helper.c           |  2 +-
 target/arm/kvm.c              | 32 +++++++++++++++++
 target/arm/tcg/cpu32-system.c | 26 +++++++-------
 target/arm/tcg/cpu64.c        | 68 +++++++++++++++++------------------
 11 files changed, 129 insertions(+), 72 deletions(-)

-- 
2.54.0



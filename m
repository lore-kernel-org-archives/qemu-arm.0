Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BA1C43327
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Jul 2026 13:37:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfHaX-00085v-Fk; Thu, 02 Jul 2026 09:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wfHaW-00084i-4S
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 09:36:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wfHaT-00015T-IU
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 09:36:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782999376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=utgm0XcZH1OQFlYYcbnG8kYHRsMRZSLs/jw2MKeR8kE=;
 b=BNVMME5gLBcMB8r14kyQ/fpRkjWJqDsbwqWNLZ1z5EJRRMif+INvGgnQY7lUpOssuOzH+O
 NJd6zOYVRN5nc5pAzZdSUkOPOZJ+uzL81qG3kLUuPeAY3h34svToXMf5LJOesnfNL+HlV8
 ED+nXDuScaA1lL7l+4XnPHFwh2j6kl8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-l4NhsW5MN7m4Xg9JakDNmw-1; Thu, 02 Jul 2026 09:36:13 -0400
X-MC-Unique: l4NhsW5MN7m4Xg9JakDNmw-1
X-Mimecast-MFC-AGG-ID: l4NhsW5MN7m4Xg9JakDNmw_1782999372
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-493b0a5e636so18745195e9.3
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 06:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782999372; x=1783604172;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=utgm0XcZH1OQFlYYcbnG8kYHRsMRZSLs/jw2MKeR8kE=;
 b=LWXoR9iJT02uqPBsudUZOzPpzB6PsW/KdmrmkvD+vY1GQPfxPVgJnTLjXbOBT7g0aQ
 PQVbPyG5EYGYnxYmsHO794sX0T6tICm0u6BBo+jJmW5FqLpKt9kIyRbCicrYqK1l+xPP
 TQZzAGBOcf9xgjK0YU72OYJVG72rNr8gglgURqQjn4GaiTFboL3YHP8LjmYp0b82pLgE
 3nIeEI4vS9ruy/K4WIjdZmEObJ3jsbdCMgn+QfqrVd8MRGbB+7q0XnuJNbO+EKFsW494
 n9ozbtD/DjJ5OdfejhkkQBBG1RgN8LiRQ9RyDMPQlEXgrZnvU52pGmh1YGecMSWwG+3u
 rB5A==
X-Gm-Message-State: AOJu0YxZ5L5FR2UcGuEyKOP6HwosmRJYgds8PZ1MtlMTr9yafL0vdNhh
 dKJyzFeVn9h4pMzROu4Y2oP63dA2C/P/B79DjV+0RZmYtv00vKaT8gUCNhZQPA8+W8gZ4RXk9uq
 lLFEJN5LEGNRR2gG/vP0zCrCU4jqMaRzkN9Y7hDgfGTLd24wmgaQ3fg==
X-Gm-Gg: AfdE7cmcYbOUP/lSr+0GcKac2/EEwvNT6zmJfM02cY2xYkAGJ5koeTm37nGzsXtpQwE
 X2wvF8cbd/K86rYzz/ePYN6XdGf/6uPxgSAjsFxQp1TbPWha69/WaBSp8OdSbsyoRXzRlFjYeCk
 y2Kvzu6XuU+M7Nye/XHXghoop0vCCl2EV90FmEALkw9ub2GbiJwZSTxnVKjik6XP8/bIf59bQ+D
 Wi28hp9668EogWjx6R9Y+0bVZAWix+mJhQTvB0kjwPtZeCoQlJRSD9KxUsKus1TnbR7ruvzxCuf
 qJJNf4uUQa6H7aU2RseogrYG9XIVr2F7b8P2D8/74DiVcNkTgy2B7iqd7wtdAVturFjf/mYFRc/
 j7ViG/gk18/SlkUEOmYoxywzCQrB/VI7UbhpOlm3ku6uSHhDeHxzQqsTBkYp5LkjjGNysE2c2EQ
 ==
X-Received: by 2002:a05:600d:111:b0:493:b243:8ffc with SMTP id
 5b1f17b1804b1-493c2ba5556mr72547835e9.35.1782999372001; 
 Thu, 02 Jul 2026 06:36:12 -0700 (PDT)
X-Received: by 2002:a05:600d:111:b0:493:b243:8ffc with SMTP id
 5b1f17b1804b1-493c2ba5556mr72547405e9.35.1782999371682; 
 Thu, 02 Jul 2026 06:36:11 -0700 (PDT)
Received: from rh.fritz.box
 (p200300f6af2a6100f239e076bbd76784.dip0.t-ipconnect.de.
 [2003:f6:af2a:6100:f239:e076:bbd7:6784])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db3dbb01sm9135980f8f.1.2026.07.02.06.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 06:36:11 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eauger@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alireza Sanaee <alireza.sanaee@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v4 0/3] arm: demuxed ID registers (CCSIDR_EL1)
Date: Thu,  2 Jul 2026 15:36:03 +0200
Message-ID: <20260702133606.34529-1-sebott@redhat.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PEjNOQRZLwP1qUWoiU2UbhQh5Q0B43ofRsVDApstHEE_1782999372
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
idregs array. V3 of this series was posted here:
https://lore.kernel.org/qemu-devel/20260622135627.40573-1-sebott@redhat.com/

Changes V3->V4:
* added R-B from Eric
* incorporated suggestions from Eric

Cornelia Huck (3):
  arm: handle demuxed ID registers
  arm: handle CCSIDR_EL1 as a demuxed register
  arm/kvm: get demuxed ID registers from kvm

 hw/arm/virt.c                 | 19 ++++------
 hw/intc/armv7m_nvic.c         |  2 +-
 target/arm/cpu-max.c          |  6 ++--
 target/arm/cpu-sysregs.h      |  9 +++++
 target/arm/cpu-sysregs.h.inc  |  1 +
 target/arm/cpu.h              | 18 ++++++----
 target/arm/cpu64.c            | 14 ++++++--
 target/arm/helper.c           |  2 +-
 target/arm/kvm.c              | 31 ++++++++++++++++
 target/arm/tcg/cpu32-system.c | 26 +++++++-------
 target/arm/tcg/cpu64.c        | 68 +++++++++++++++++------------------
 11 files changed, 123 insertions(+), 73 deletions(-)

-- 
2.54.0



Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4677014lfg;
        Thu, 27 Feb 2020 08:47:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqw/Mn0t1s/hDv8wS9y9txuDPpeUcUuUL2xTcmjDeh6Ua6F6bUqMoocXmNWwVtnNQyCXgpsN
X-Received: by 2002:ae9:ef06:: with SMTP id d6mr110404qkg.442.1582822075610;
        Thu, 27 Feb 2020 08:47:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582822075; cv=none;
        d=google.com; s=arc-20160816;
        b=yFzh/CYeCffEZmmTcqFi4QQZVUkMp7qvxfrTITOu2SeuLbrBn7Ybw8cECc1Fz0T2n4
         p2XV+5sM0RJtCG1+hOO44ThbFknCLQTAh7noU8aqz4ppQPQpzfrGWysW21SbsiVQQMkl
         byztCqLtW1HVQ6lXOh4hwWy/TUtObornlvIcx9lxAmSE+utjqCg5Gg1PH6xgIKGlKWTC
         OodogGbDJEzLyeC1rZVRMQWvqNHMIDpXXR8yTO0tdMTTT9t26Y6SQjHRJABLyhX5vHoM
         G89Z7DR+Lr0LMv/ZVMQWPZTE4k/bsZmxGfc1LoZtMGQeMoGA+KLmTGINF8Uuez7Mzj4Q
         Mafw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=LlPeDmKFkA2dxMrO69WSlBsUmcf6ugZCLYwYxBHJt/0=;
        b=nxwJXqCyaEr1ch8+nD6daYm4NL3vC9vwQVagG71TcS3FmkGJzy2pE5A004EgufulHL
         N9fXUJCv2x6agmN3Z7kNtSqQB+AgfPYUjK9bwxvCMiXSFyQcykyqlk4d27L48HVZnqwA
         FETh1o4spmhkLGoFkygjVW+bUVnP2Ky7cp3Cw/Bdu86f1ju/veLqnVorW8bplnkiT+Vu
         4xeLPyBOBSOuMlq2mRTRlaCfKCf1iBGHuGGVmiZMoODst9wgC4YkKt7aiVqigtqoj7Vv
         r+R/NSOChR9nUqu/56hA7ccNV/hyUO10iIYM7V3Ey8EGO89ZP/Fctm04wCfU3daK1Nkp
         u9pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="iWT/JNEn";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a197si1529764qkg.30.2020.02.27.08.47.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 08:47:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="iWT/JNEn";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7MKJ-0007RQ-1T
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 11:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43169)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7MK9-0007Qq-6B
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 11:47:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7MK7-0002Gd-GD
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 11:47:44 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46130
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7MK7-0002Fy-Cl
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 11:47:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582822062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LlPeDmKFkA2dxMrO69WSlBsUmcf6ugZCLYwYxBHJt/0=;
 b=iWT/JNEnmkOdUScfpqgu5IR3YCYA0tKlCUNmrzmzHGzQC60GEpiyDuiwbX+n3FoeDmMFd8
 5nk1uQWSTwuR1M17n0zh9LVnMpuzXqXADLTnojab0aAa7W/ar7sr2jUGzj5Mb3hLZuPxuc
 wlrxA+8d3CjAyK9j0XEJ6SgOqhkN7CU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-NwmfMzQsMh2bxQCcLJtXiQ-1; Thu, 27 Feb 2020 11:47:39 -0500
X-MC-Unique: NwmfMzQsMh2bxQCcLJtXiQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A4E1800D48;
 Thu, 27 Feb 2020 16:47:38 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-195.brq.redhat.com [10.40.205.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 173565C651;
 Thu, 27 Feb 2020 16:47:30 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] hw/arm/smmu-common: Avoid smmu_find_smmu_pcibus return
 dangling pointer
Date: Thu, 27 Feb 2020 17:47:26 +0100
Message-Id: <20200227164728.11635-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Xu <peterx@redhat.com>, Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gN+z3eVWy+Mp

This series include the previous patch from Eric, then a
code refactor to avoid similar mistakes in the future.

Eric Auger (1):
  hw/arm/smmu-common: a fix to smmu_find_smmu_pcibus

Philippe Mathieu-Daud=C3=A9 (1):
  hw/arm/smmu-common: Simplify smmu_find_smmu_pcibus() logic

 hw/arm/smmu-common.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

--=20
2.21.1


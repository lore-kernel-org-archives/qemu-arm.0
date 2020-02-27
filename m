Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4105406lfg;
        Wed, 26 Feb 2020 23:51:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqxBgf2KWpZXcm4hf6fGWJOa5Wnro6axkiPD3Gi/lvK6fILUPY3cQ80BX57bYHWMTPmy5v67
X-Received: by 2002:a37:a402:: with SMTP id n2mr3547951qke.71.1582789895099;
        Wed, 26 Feb 2020 23:51:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582789895; cv=none;
        d=google.com; s=arc-20160816;
        b=E+Yshad4P/iCIr9Vt0KzxOIxpW5dH1kanUKFiLNk5Sw0HoT2f2sYmqRLchDA7ui+nz
         Ug5cjWxRAtG9aYXQFNhjG2oeOEHNfn1tAX9N1ghThA1na/5e6zLFAvfL0b88POYJugXy
         np47yZ7tDXBzNJvP32e3Nfq9txCPNgW1EayNFfC6UkG4lOM1canQ0WgOXom9SUJw2p+7
         qzKwv9PqqXUPiH0lAUk5qmVZcE6FL1txmFjtKYV3EfxnqM9JOZ9lTEdQ5doYO558dP7Z
         HqPcP9KlDE66Mp6uca/TvWP866PRge8DACfe6kfddTECp6VkWciI+BT3GI/prCqxXfXA
         TJkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=xaisT5NWegrec9bUQSlMMOsD0jkZMNdz4KCm6xNj9SY=;
        b=jholdjXGvAJGg1xTcSe5/0WcH/8YCmg3HWPFCxjcGt0UwGzwzFzR6lgLi6wiy/HF7X
         jG1kKY7N5+6BjeXUb/tps/cMqYR2FTyxDpRuDMLy/4Vm+wKwcgADvQSNaHFQjakbKrVu
         QpQYZdHg2q6yQFESU8ezQ8qFbC5X+tLCA6DoT2MaTHUTlb2az+wN03y5BIs3bjmMxzTp
         wsdz5DE8rshUuu1JplYFdxVCC6AzFCm+QeVAJd/ZkyQCm+1vewrFfzzcMg9hPfeLC2mm
         PPGPvlfSLvMOxa9WeFUtUIBIlBOoKGaVTH3W1mq07/1o7WqDmqEm/sUmPZInIwbx16yb
         hV4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Qub9GRmP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j21si956840qtq.227.2020.02.26.23.51.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 23:51:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Qub9GRmP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7DxG-0004xp-Ii
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 02:51:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54110)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7Dx8-0004xD-7v
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 02:51:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7Dx7-00013t-4h
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 02:51:26 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37490)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7Dx7-00012Q-1I
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 02:51:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582789884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xaisT5NWegrec9bUQSlMMOsD0jkZMNdz4KCm6xNj9SY=;
 b=Qub9GRmPERVdEjpDQ8xFlo4hszdPns63pDW6mytFeByZ0aMC3iKjoXmPyvx/OGNkTM9Uk3
 0MIv9/LrbVX+TEJ6y3BkgpExGcFdWo0YsrPcmtTM+OoqOJInIk3g339mijhbgBlHqTtK58
 i7tLnHjYpMarLdmANY29PTg4FKQ7Ax8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-gTImNxz1OJ-3_tkYjz92dg-1; Thu, 27 Feb 2020 02:51:19 -0500
X-MC-Unique: gTImNxz1OJ-3_tkYjz92dg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC5C818C43C0;
 Thu, 27 Feb 2020 07:51:17 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-195.brq.redhat.com [10.40.205.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA6825DA2C;
 Thu, 27 Feb 2020 07:51:13 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] hw/arm/smmu-common: Avoid smmu_find_smmu_pcibus return
 dangling pointer
Date: Thu, 27 Feb 2020 08:51:09 +0100
Message-Id: <20200227075111.15275-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5YrBnnwXYaCF

This series include the previous patch from Eric, then a
code refactor to avoid similar mistakes in the future.

v1: https://www.mail-archive.com/qemu-devel@nongnu.org/msg683451.html
Supersedes: <20200226172628.17449-1-eric.auger@redhat.com>

Eric Auger (1):
  hw/arm/smmu-common: a fix to smmu_find_smmu_pcibus

Philippe Mathieu-Daud=C3=A9 (1):
  hw/arm/smmu-common: Simplify smmu_find_smmu_pcibus() logic

 hw/arm/smmu-common.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

--=20
2.21.1


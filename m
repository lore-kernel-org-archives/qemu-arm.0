Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5743794lfq;
        Wed, 30 Sep 2020 10:54:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkpLEUdwRRRS2A3RCV3JVZ+hU6mXUAvG7FM9NkzMa9UlT0Cyi1xO9ioQAFBCQluodySVwQ
X-Received: by 2002:a25:b45:: with SMTP id 66mr4555977ybl.2.1601488497320;
        Wed, 30 Sep 2020 10:54:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601488497; cv=none;
        d=google.com; s=arc-20160816;
        b=i6dHuvnpB+P3Izblm/DKJZMHCLEKGcsPel9rh1WMZmW86+ZjZ+Tph/jOXhKFxbA96H
         pTqqcm0egiKjXqlxAjbYcRle2D8VAd/Es+nkDF/AXKee/+GcSkBdkiDC1FLQOL/bjRFH
         n3EtSUFJrhRKFCCmSZnrd+89+5wDtvaWdVTtAHKTGC5K41JLDFSuQDSSbySYFqyri63d
         xWYdYHDqyagwdS95JvHEuY87W8YzcJ89OLxZ9TpOfSQb7wvXpIzcZehyarRpno/eVfzr
         MItgRpVOHmturauNssS3JHO8/2hzN+N99okSuo/SDh7LRwa3yYcF9F0yrqJcPuOBANau
         ZygA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=z6evKg8CqrYmhX7Ej1G3DLHlzVzjwlvlI7gXlOmgaVU=;
        b=UE5qEseu/ZjIcw1RW4T5I3/Uq3rnM0RPd6ReJKboaFeGZwU4aQG4GMCV24U3oHgYQ5
         NzEl0GcefQ/Uvw78yj2fN0ndQT669dax0Hz1cL2LObzfcyW9PZQNjq2yFPS3DFf1TVz2
         SroBp9TUiXWoZpa5c6F8VbzxacTpJlR6qgPXXMXAOuQYtY3tsph64A/WYJojw8nBXbZi
         sWJGBB+KwZ6bpQ5Fl0H6WgdYQxoe/C0EYNXZve2i93Q+9of7q35tYRDmAAOBCtEEnukP
         qtyRnk6gFGl0obiYF8D4x1DCJi7huCSH7Z3Nl4k6ksPcXdu3Io80mNvFVGe0Lyd3+Gte
         zfcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="cw/GOkrw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d63si2161743ybf.317.2020.09.30.10.54.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 10:54:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="cw/GOkrw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNgJc-0004k8-Ee
	for alex.bennee@linaro.org; Wed, 30 Sep 2020 13:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kNgEG-0005I9-Sj
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 13:49:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kNgEA-0004j9-MK
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 13:49:24 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601488156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z6evKg8CqrYmhX7Ej1G3DLHlzVzjwlvlI7gXlOmgaVU=;
 b=cw/GOkrw1fIX8iMU2HgLLMiFJL5ySd/lwDzYvbq560zCQm5TermcW/Gc51DpEvsnTm552c
 K0Iz0SrKGt5oYyc32WMz4vqK5KFcW6RvdWUt+nWQIgzQPbuPNelRBpkQlywNhVSxU6SOh1
 ohNkoHYVjeB89yopTyfO+pbjaBiIm10=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-V6qxIURJMfyxoxFja1Bw6A-1; Wed, 30 Sep 2020 13:49:12 -0400
X-MC-Unique: V6qxIURJMfyxoxFja1Bw6A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D319464143;
 Wed, 30 Sep 2020 17:49:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8853E7EEB6;
 Wed, 30 Sep 2020 17:49:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 590CA31FCE; Wed, 30 Sep 2020 19:48:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/12] tests/acpi: add empty tests/data/acpi/microvm/DSDT.pcie
 file
Date: Wed, 30 Sep 2020 19:48:51 +0200
Message-Id: <20200930174856.11296-9-kraxel@redhat.com>
In-Reply-To: <20200930174856.11296-1-kraxel@redhat.com>
References: <20200930174856.11296-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:26:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OJZnWJ2NJA+B

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-id: 20200928104256.9241-9-kraxel@redhat.com
---
 tests/data/acpi/microvm/DSDT.pcie | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 tests/data/acpi/microvm/DSDT.pcie

diff --git a/tests/data/acpi/microvm/DSDT.pcie b/tests/data/acpi/microvm/DSDT.pcie
new file mode 100644
index 000000000000..e69de29bb2d1
-- 
2.27.0


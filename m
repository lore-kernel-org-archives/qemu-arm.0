Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp288592lfa;
        Fri, 23 Oct 2020 00:10:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn6nfqGHihDKNJZHINJnmjlAk+a9I3pB2WgxqWsaiEzYt/22JEvj9+wvbkhOQca+bUJMWx
X-Received: by 2002:a25:cec7:: with SMTP id x190mr1416628ybe.513.1603437048271;
        Fri, 23 Oct 2020 00:10:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603437048; cv=none;
        d=google.com; s=arc-20160816;
        b=l+XQWjvsoNgawJRBF6LFQf6bhG+HQ7jcbUuX5KpGddWOvN5lPXiNrKcJZOkRBu9Ua5
         8z6rZ6FV0NjGoNs2Ob/4BHaJOybq5MQKGAXTRoRu9tsZ3py0zKR2PHW1t7vjlGXT02Lp
         QZHwXh9pTXRVaaCS1Zx1ykbAqIuJkniikZgYv/u7I+FS2z8FPVFbsLOtZk5sZfmNilVC
         I9C2W94YWimHTRl4dD6e2tghWeQinNX+cgrinnTgsTFfIvZ7DIp4dcgHZewm/WMjq+2J
         Kqyk/Z7nQZoY9brYGMtnNQgC3qP1SP+VS2j5mSrrJ+DuJAtxGnMTCeUjtQUOoZOevhig
         xoAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+9HKCEY7PeyytYMMAkm21tXDmuRxndkLeIX+HeKhYCk=;
        b=fl14m61eYr3MrzESDdbG8dKnaCVJqgYnRGJi0LW66M2MyGHtKQMksyF2VUCtjtK5o1
         nZ74nbRQkI3IPjZlWylp1Wzv9y3HYuTIhc1zLBcfwLrLxwzEg7Lb+H2HYrWLRD46l+ZB
         VKfweNCTpoeRqyeGHJw9C0hgPGw4An69oUpFUHjGCgNvlu4xb5UY1cnq1XvB+rtspJQA
         vyT8RVNKH2hfx12XwdF8JGvUF/Wf8UDfbfa/JcF//VBG18CUN1B43P6ug1p7Y+1lCfJ+
         UFJ7ghvv6Ybj+2D5Q2WhzWK6zWTvhG9fGNh7hrid0xO9lV+ICthwO06pYecYYZpLnwHc
         WLeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QtYisxdx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1si723965ybq.480.2020.10.23.00.10.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Oct 2020 00:10:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QtYisxdx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kVrDr-0000vz-IW
	for alex.bennee@linaro.org; Fri, 23 Oct 2020 03:10:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kVrDh-0000uF-FC
 for qemu-arm@nongnu.org; Fri, 23 Oct 2020 03:10:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kVrDf-0003c0-QB
 for qemu-arm@nongnu.org; Fri, 23 Oct 2020 03:10:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603437034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+9HKCEY7PeyytYMMAkm21tXDmuRxndkLeIX+HeKhYCk=;
 b=QtYisxdxT9ubncR8Y9jxv+qw+AzfsiB2T8QcilC72wmxvhs3kKfjLP2X12PdakX6TVJ3yc
 /6wujbP6/lN6BNGjc4y6eFZtpj/pC7OVoF7P4PxjKt2N1b/4jeKC3k6GFjN1/0/pRRfckT
 0k68xyYSfbWD6t1cAXbV8wDZMvVHljE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-4KCx7HXAOFerXJuNFZfFfg-1; Fri, 23 Oct 2020 03:10:33 -0400
X-MC-Unique: 4KCx7HXAOFerXJuNFZfFfg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 889AA107B471;
 Fri, 23 Oct 2020 07:10:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F38EF5D9CC;
 Fri, 23 Oct 2020 07:10:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2C7631FCE5; Fri, 23 Oct 2020 09:10:22 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/8] tests/acpi: add empty tests/data/acpi/virt/DSDT.usb file
Date: Fri, 23 Oct 2020 09:10:16 +0200
Message-Id: <20201023071022.24916-3-kraxel@redhat.com>
In-Reply-To: <20201023071022.24916-1-kraxel@redhat.com>
References: <20201023071022.24916-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 02:46:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XuJzjxiTGv8k

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/data/acpi/virt/DSDT.usb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 tests/data/acpi/virt/DSDT.usb

diff --git a/tests/data/acpi/virt/DSDT.usb b/tests/data/acpi/virt/DSDT.usb
new file mode 100644
index 000000000000..e69de29bb2d1
-- 
2.27.0


Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1679683lfb;
        Fri, 27 Aug 2021 08:18:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwM50KQaiEYWiosvvQ6clMSGHTJY8e78S4kKXF8n+N/7ET5fsR9lENeo0vhCatlg48qfQlO
X-Received: by 2002:a50:ff0a:: with SMTP id a10mr10343785edu.273.1630077497149;
        Fri, 27 Aug 2021 08:18:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630077497; cv=none;
        d=google.com; s=arc-20160816;
        b=rwMRp3aWJz1AQUZVTeIdcYIGnB8QKN7rTlHvRvigVEPDQiI2uTGFVTeLDZ1CckXT/e
         BalBc3Cp2Sh9Zb9jp/Uiriotyl45+ALJp1g2r0NPIOndcnBl+z38YCmpj/pKBszWNQJl
         +Jshpf+Y07NuR/pm0lGbWhwKoijOh22+xr7EMmzGKQf71dMLfG/hX8kwdi3dzU0EleJy
         oc59F9pAvD1dtI7qKd1H2sesMgdmZbJfetXbts5aHrNWQTN4Y1Qi2/Ho5vv5OCyezMnB
         iJbzXYmZGOO7tLunqFZptfdD8UW9KEbEs0LvdSR4g6mL3i0tafQG7hqkAjlm5yY/jT8+
         t4Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=L8XgRF1kt+KDBalRdVP8rge/CVuXZFXS+KX+MTrZpn4=;
        b=tgoX78O++gTmyDwlY4WvL7zPPmlIOrMtheBzAoxTtMDFd/HH8WpdU3piT1uDNE+eA+
         4PlwNVANaVYElFruVLqVA4ZyGJtnw7ulmXJGjin7O/GtkT4bdEMOtEqANXpyR1akw07b
         KTrmuN0ay5/5XoyyavUPMW9SkxtK+Yb0s4Ed+1Wavytz67Gni2Zt8YNrSRyh9r/SAu/o
         40qc1r1m5/8UHLLWlOt3kFQH6w1ODU+KGhaJkbP718DVDAmxjP+LE8uS75DHAHuZSYmi
         nWVbflobcETVjrBPZb2G1LVpsQ/LnCsbU+eufCAt/5IdozUUmvaHHNoq/sRfHAplVAzi
         4ePw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="PSbNn+B/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a20si8863513edj.163.2021.08.27.08.18.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Aug 2021 08:18:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="PSbNn+B/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJdcW-0001cC-5U
	for alex.bennee@linaro.org; Fri, 27 Aug 2021 11:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mJdcF-0001Yh-U3
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 11:18:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mJdcC-0002IH-PR
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 11:17:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630077475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L8XgRF1kt+KDBalRdVP8rge/CVuXZFXS+KX+MTrZpn4=;
 b=PSbNn+B/oIxtLa6yiDiSJN1Vz+RpLT0sFTbGR7i5WdX5fKEK3TbGPp41eTErm+j+BdmhkH
 D759W3q1ofesgvtvt2t9uKGvKtQ4XKzaYUcctjvsNApMVOkgsod4jw6tBt1KV0GP1gFCk9
 OdWNAS2coBgB5c/XUoM8Ay5QJMHa3SA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-P7c2GKnaNi2pKCHLf_tAhw-1; Fri, 27 Aug 2021 11:17:54 -0400
X-MC-Unique: P7c2GKnaNi2pKCHLf_tAhw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF6F4107ACF5;
 Fri, 27 Aug 2021 15:17:53 +0000 (UTC)
Received: from thuth.com (unknown [10.40.192.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EEE719C59;
 Fri, 27 Aug 2021 15:17:51 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	qemu-devel@nongnu.org
Subject: [PATCH 4/3] gitlab-ci: Don't try to use the system libfdt in the
 debian job
Date: Fri, 27 Aug 2021 17:17:49 +0200
Message-Id: <20210827151749.179112-1-thuth@redhat.com>
In-Reply-To: <20210827120901.150276-1-thuth@redhat.com>
References: <20210827120901.150276-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.743, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: syVIWYeymxWU

libfdt in Debian is too old to be usable for QEMU. So far we were
silently falling back to the internal dtc submodule, but since
this is wrong, let's remove the --enable-fdt=system switch here now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Sorry, I just noticed this after sending out the first three patches already

 .gitlab-ci.d/buildtest.yml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 903ee65f32..f0eb5f6286 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -74,7 +74,6 @@ build-system-debian:
     job: amd64-debian-container
   variables:
     IMAGE: debian-amd64
-    CONFIGURE_ARGS: --enable-fdt=system
     TARGETS: arm-softmmu avr-softmmu i386-softmmu mipsel-softmmu
       riscv64-softmmu sh4eb-softmmu sparc-softmmu xtensaeb-softmmu
     MAKE_CHECK_ARGS: check-build
-- 
2.27.0


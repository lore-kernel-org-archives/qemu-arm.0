Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1462048lfc;
        Thu, 11 Jun 2020 07:03:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwF41vzakCMj9Z8/HlythEaUms9Dit8vKcLHmbXas3NW4iMLBzyffcRynsWsVbSba+461Iv
X-Received: by 2002:a67:fd78:: with SMTP id h24mr6243232vsa.22.1591884206327;
        Thu, 11 Jun 2020 07:03:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591884206; cv=none;
        d=google.com; s=arc-20160816;
        b=z7Q/mnnnhL37Fl53Td3Ejz5SEvX6/tHXLvY89K0nOx3Ze5lkb6fbQfCis8on1K7Pdn
         q1r6VAgTHOiQWMmpWX8nHTxEN+3hoN+9kpvYFpgqEzp5uVOPCZMIOaicoYvNNrOX+oLc
         0tChfmu8XnGYnxfczQqtoqblnFELg7G/ZgauGkgd+V/y+zL2PKQ17VL11mFql+ESCS4M
         RY+QdxT0MlzsQlIw9bnCi85BmYiIzDQZ4UpbEBYIho3nhnvUUxzhJyW+OIh7VRMIE0b7
         cNsgNSP6p+1whfMur7VhOpgFQT4rBIGp+HJd1vSRnjOET39m1+tc74RwcSwh3/0ShOUX
         dj8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qDNBig6IWQiFeyOxhMViPcQxZlm7fNfvrCXicg2128w=;
        b=SOaNEFFtRLRuHZGSQsB0E9d6WhBjaxU2EnNEv3vxzLbRWl9uJc2M7tNZoUR9Jsm5fI
         G48oc/B7If6ckRxUvp5r0vw3a/pDMxuajdTwy4jCNNHLFq0aLq7SRRyHc3Zagc2xD5Y8
         kECtZ1epG+iIJ/1uzFmGs0rKio8EedA/MrS10c1HWa67DAzY4BiYQYes9JMZSrOugQ5b
         tb2ak7Rblc2Xeb0VcDsoW1Dterr2Lv5vWgA+fuFxC8sgH+UQ2eTBE78t7wm5bodA2Klv
         OywT7p+x8npXq9tW7yBBP0WBMwPacrHMnSwGMna/2fDVmK8m7SPq0bCyac9ZHV5k2Ue6
         atiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hTzU5GDD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w19si287941uap.33.2020.06.11.07.03.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 07:03:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hTzU5GDD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjNnf-0005xI-O7
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 10:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jjNkT-0002jG-0s
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 10:00:05 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:46364
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jjNkR-0002Ci-ST
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 10:00:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591884002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qDNBig6IWQiFeyOxhMViPcQxZlm7fNfvrCXicg2128w=;
 b=hTzU5GDD6sHMYjCYdP/l18SaLlI0LjvSMujjikMFYR+D2mj1opoUCFpkdidfg79lZg80Ww
 Oh2Jv5eo9TCexXQwuOrsp3Uj4doqRjYsqgOZq1Iqr+QUAvlMGYfU9kmlUKSHakPsVPdmtZ
 KY4peDDA+zx2NBlRk/FzgWfxlyelR1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-Gi3LDhk_PUODY9vPMY3jeA-1; Thu, 11 Jun 2020 10:00:00 -0400
X-MC-Unique: Gi3LDhk_PUODY9vPMY3jeA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F4F3107ACCD;
 Thu, 11 Jun 2020 13:59:59 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FAF35D9DC;
 Thu, 11 Jun 2020 13:59:56 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, shannon.zhaosl@gmail.com, imammedo@redhat.com
Subject: [PATCH v4 5/5] docs/specs/tpm: ACPI boot now supported for TPM/ARM
Date: Thu, 11 Jun 2020 15:59:17 +0200
Message-Id: <20200611135917.18300-6-eric.auger@redhat.com>
In-Reply-To: <20200611135917.18300-1-eric.auger@redhat.com>
References: <20200611135917.18300-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 03:29:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, lersek@redhat.com,
 ardb@kernel.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TYUE5ZZEfEay

ACPI boot now is supported. Let's remove the comment
saying it is not.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 docs/specs/tpm.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
index 5e61238bc5..eeeb93730a 100644
--- a/docs/specs/tpm.rst
+++ b/docs/specs/tpm.rst
@@ -346,8 +346,6 @@ In case an Arm virt machine is emulated, use the following command line:
     -drive if=pflash,format=raw,file=flash0.img,readonly \
     -drive if=pflash,format=raw,file=flash1.img
 
-  On Arm, ACPI boot with TPM is not yet supported.
-
 In case SeaBIOS is used as firmware, it should show the TPM menu item
 after entering the menu with 'ESC'.
 
-- 
2.20.1


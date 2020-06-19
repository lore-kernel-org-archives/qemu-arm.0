Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp634671lfm;
        Fri, 19 Jun 2020 07:20:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyOk14EtpcFLAHEH1mgguSttWoS0Z5vJUWLsu3kvL52P+HSIfRAs7mAxcHnmcQFH/DR19F
X-Received: by 2002:a25:9c88:: with SMTP id y8mr6119828ybo.317.1592576452961;
        Fri, 19 Jun 2020 07:20:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592576452; cv=none;
        d=google.com; s=arc-20160816;
        b=e0ma5vANIOuFUHkqw+l2LUaV6bG1siZO3z/CE0OSUkWJm4/qyhIFQpLrSuUyfcld2p
         8SvhQBDOC78fcKneQDBlLCHl4GkC0R7d05Z8Uus/A3yigfWunMjhMWpSagjpvoFbdP8G
         sacnd+oyGr9UomohL/V4f0caO35zP6F7dnctwLKcEM8KTiOeDLWbLpM3wE6V61LEhHnC
         yB/MDr4Zn/a4Uy7z54tiKz6jG+14cjhOmxy1LkybxZB5v96YTQGb5Tk17BifRYEpTvl+
         boDwczIcGM/7eYHtIwHwin9R56RwX5n396v9G7H4Z62Pzpi7mC/5hsTpX7J0gceeKG74
         Fq1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qDNBig6IWQiFeyOxhMViPcQxZlm7fNfvrCXicg2128w=;
        b=JQyLIo/SCTeLwo3OOjyn9G12laEVPAZfdYJsDV0XRPb9OBgxYeqiTZrHXWblV3STjJ
         wZmhP4JnfsRG3bO/iBzLfOns2aCrzY7Wn8Rkt+sK7JnuLswqEcPV9Et2Kt/JxM8/tbGr
         aLg93Z3LuYaTF4fU9A2+EnAGKBH+fi1W1tyXeA6cdokP5G7V73ZCQCrDn/8SmvWRdTqO
         5UrW8hipypAxqayqFQ5EdRCU1Oh1TH7nuoNW/FQaurOrlFDwPq4PYUqbfbXrAS/hGd3+
         S5c559QsldXIAA64psSHe/slRIG34Gc5miptkMCvbxrUODVg6B8FTrSWdIqvxL4kUBQH
         ahXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JhdPs3H3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y4si6061012ybk.397.2020.06.19.07.20.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 07:20:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JhdPs3H3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmHsy-0002GF-BR
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 10:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jmHre-0000uc-Dz
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 10:19:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36132
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jmHrc-00061W-QZ
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 10:19:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592576368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qDNBig6IWQiFeyOxhMViPcQxZlm7fNfvrCXicg2128w=;
 b=JhdPs3H3MEKFE2SOFEyieOR3Ww+hbXaCFEOf6vdsPOWbZEw11mwLnisZeOm6KfQ0DLv3pM
 2l7PtFhA4s/VRYLTCOKYSYgn3PH0AR0nCLlm8E+1rmlHCIWjvd2JKlvDkFbNqPIERRfpn7
 lqw9b/b9q6i6h4ZMfEOAH/jVjxvxC0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-8XCUtQRjPmGbnHIYfLtBew-1; Fri, 19 Jun 2020 10:19:26 -0400
X-MC-Unique: 8XCUtQRjPmGbnHIYfLtBew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60CD6464;
 Fri, 19 Jun 2020 14:19:24 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D503319D7B;
 Fri, 19 Jun 2020 14:19:12 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v6 3/3] docs/specs/tpm: ACPI boot now supported for TPM/ARM
Date: Fri, 19 Jun 2020 16:18:51 +0200
Message-Id: <20200619141851.16272-4-eric.auger@redhat.com>
In-Reply-To: <20200619141851.16272-1-eric.auger@redhat.com>
References: <20200619141851.16272-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 03:15:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, lersek@redhat.com, drjones@redhat.com,
 shannon.zhaosl@gmail.com, marcandre.lureau@redhat.com, philmd@redhat.com,
 ardb@kernel.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jiSBX4IJOihN

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


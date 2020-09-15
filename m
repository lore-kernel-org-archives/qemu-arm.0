Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3112089lfq;
        Tue, 15 Sep 2020 05:12:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzF3+/CjRQOEttsoluIy4hNu9CME3jET6cBACf5MK4RSqG4Nwqg5hzRZXoezzZ1ttm5jp45
X-Received: by 2002:a25:5086:: with SMTP id e128mr28443459ybb.173.1600171946973;
        Tue, 15 Sep 2020 05:12:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600171946; cv=none;
        d=google.com; s=arc-20160816;
        b=Y3WJRcYyJDfd5BEAMo10+uSga8OVKWNzJuKE+Jp+VDFmSM2ahpmwCCwlzy1Wh+StdF
         bdFZTVXe8QPOTbVxi4F732vAVTWRd9QWN0stX4P/C3coGVpprUDQW7x1WW/cBPvSP2lz
         WJc+WwaeTt5YVBmVNQl331gGD+5zF27n3ZVSsPmlHlrleGCCjDpuomd+ITIv4uzsHQIN
         OeeArpNdhmMHe/PXEn4S57h3J2RtgoTD7/mijXCC3JxXBdllQNlR2vqrbU+pjFu+sSTE
         Ip709EHUykWX182wA/07+L8Z50ttixLz37Uh0kw2jYdXfYoOdr/FP46Z9o1AcfnRRWLF
         UqcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+RoT3UHwL3C3aiK+dtyg81KyFCt1RZ6yhy/ND3g2/ps=;
        b=GfJwxgkRstBoiIhuk75WSRMgfOVPfidfWA1p/gpcwtv8TUlqJa7MT7snMo3lcmlNqo
         NyNheDWVZMaapNS7M7g25mAdh28qCGK4SWsLPs2BV9iMchLD2pGzsSpuwlVA1Qxnzrl6
         C6OuRd9HjEqZzDXM9zM/85RM8sNeDtensfDrOGWg8rU+6xBTCMX/ZdOMeetvHg1mU3u4
         gsUB04alQQKSL7bGdJMY4eZcneJEfsTxOmPWX04zeLjo9LTkSKHCKFHHnhYjdZyost8D
         RfHIY31sR5fnZKOSWhSmOw09K+rQsqgBJCchT4PAHMCtJQs/TiDBeV6BAKehFuvEnhVX
         payQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NUVz5kBb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j73si3053085ybj.443.2020.09.15.05.12.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Sep 2020 05:12:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NUVz5kBb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kI9ow-00060w-6a
	for alex.bennee@linaro.org; Tue, 15 Sep 2020 08:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kI9mG-0003ux-BF
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 08:09:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kI9mD-0007S2-Nl
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 08:09:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600171774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+RoT3UHwL3C3aiK+dtyg81KyFCt1RZ6yhy/ND3g2/ps=;
 b=NUVz5kBbCRSPxRKAPpC9Lmoy8xWTSaGoU168QbnaK6e079SifBt9wYbkwkQMKEf4uZ9fxE
 LzM/oFrmdFPJsXMkyovurLPE3X41r+Jd4hluDQZiJfqPuhxx+CTKJp6Fdj6WViryr5Sgz5
 CUEk2ki3yRGNsOtlunrNmi5B3GOP5LY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-P6HYTBTkPheSm9LcE4SqbQ-1; Tue, 15 Sep 2020 08:09:32 -0400
X-MC-Unique: P6HYTBTkPheSm9LcE4SqbQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0ACD918BA280;
 Tue, 15 Sep 2020 12:09:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9F6B1002393;
 Tue, 15 Sep 2020 12:09:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 656F040C06; Tue, 15 Sep 2020 14:09:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 20/21] tests/acpi: update expected data files for microvm
Date: Tue, 15 Sep 2020 14:09:08 +0200
Message-Id: <20200915120909.20838-21-kraxel@redhat.com>
In-Reply-To: <20200915120909.20838-1-kraxel@redhat.com>
References: <20200915120909.20838-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 02:10:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O/dh1j2hbbtn

Also clear tests/qtest/bios-tables-test-allowed-diff.h

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   3 ---
 tests/data/acpi/microvm/APIC                | Bin 0 -> 70 bytes
 tests/data/acpi/microvm/DSDT                | Bin 0 -> 365 bytes
 tests/data/acpi/microvm/FACP                | Bin 0 -> 268 bytes
 4 files changed, 3 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 97c3fa621b7f..dfb8523c8bf4 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,4 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/microvm/APIC",
-"tests/data/acpi/microvm/DSDT",
-"tests/data/acpi/microvm/FACP",
diff --git a/tests/data/acpi/microvm/APIC b/tests/data/acpi/microvm/APIC
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..7472c7e830b6c7139720e93dd544d4441556661d 100644
GIT binary patch
literal 70
zcmZ<^@N{-#U|?Xp?&R<65v<@85#a0y6k`O6f!H9Lf#JbFFwFr}2jnsGfW!{`1CcCj
H|A7Jk<Z=uF

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/microvm/DSDT b/tests/data/acpi/microvm/DSDT
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..b43f427a222a933d3f34aceab6224a2c6115c365 100644
GIT binary patch
literal 365
zcmX9(%SyvQ6upy2n@pNIKA<QF#Sf5arMONe(=?DaG1G?-VTyaft+=UO6kPiQ{RBV7
z&*`dor`gOs_nbMLa}$-!-w1&98W&=s`tfrq66BBqgUw{=rB<=7xA)_f7<+n>CE=5t
zE;#2y@U)soH1M>j)Okp0N|?)B()oaTI~2uqaQfeg{#@eeMV8=e3}=mj(J&<k`(T52
z$G~{<Rw@(SghZmuI3GM<2s%R)5Sg4V4Zd4o6Cc~5X(KC{LI+@fq)z=6m{mw6^ZwPX
zmdm;SZkF|){d}&e1=QM=t170OdV6g^6IRYjF1Tp2ut@AIEB@GM`K&7N+EF9YHntEE
jUShi3(B94m0^Q#uSOD0Iklv{mV=rh>BYn|!sEgD;a<EMS

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/microvm/FACP b/tests/data/acpi/microvm/FACP
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..0ba5795d622349e1521138e4123544637b4ab9af 100644
GIT binary patch
literal 268
zcmZ>BbPnKQWME*ebMklg2v%^42yk`-iUEZfKx`0ARlp*^z`()4z{IrRAIMxMsv1tD
QVL<yCp!S2@!U$yp0N^VO0RR91

literal 0
HcmV?d00001

-- 
2.27.0


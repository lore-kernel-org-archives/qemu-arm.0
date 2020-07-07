Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp912317lfm;
        Tue, 7 Jul 2020 05:58:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzp//4gdx50sZCqmU6ql3Slr1MWMbNIokUo5+vGFweKliaPMXrU595YH2CD9Vi+a3d1cIoe
X-Received: by 2002:a25:e401:: with SMTP id b1mr87499334ybh.414.1594126693049;
        Tue, 07 Jul 2020 05:58:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594126693; cv=none;
        d=google.com; s=arc-20160816;
        b=eMoa54LhI/R0GIBFB5hb7osRxxikmS5zuFn/P7Tl+1XaYotU+kbUeY4J8bF6dnyjOR
         NEH4OxZDtXme/jDURLYusq1VlnpT8CP1MetJRo3Shq7fmQvVSg+AhDzsdsLIO0S1Fa8e
         7B57/7w3tryKyy7HVZvVcznKKwPVHu7LyGtxOjmBdL5HrJ+nAmnTdbwAIF1+NqQTA4VN
         9X3LE5EvHbe9n3wfr2NE64aw09wKNk4jaG2fMtmpycJ0EzEdp/VuZcBQNISNDrCMUMdb
         lhQR1e7IRDqgT7QGKenBBniWisv8OOewFxhnZ+JMrpaM1tQFVyD4eoMPA+OmHNYxqtVJ
         5I0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=MNTlxHdwoZD1i7fR0/VxIsjSfZdUtlBEEDJL/FTCXj8=;
        b=hLxD0VezVSkiy1bI573NdSvaW1j2kOqVkqRE7rjkFfYbjd8jtP4gn8AQBc/7iCj6RQ
         of4rRe3ErdkvFXy81ffpkVIRfcGiMYGev4H5ubC7LaBrQmshaFtIf9Kfz6Qf+mYa+Ukw
         f/i6SRjOdwcCyAcLvLUDou7XqsRNYsHhiTNaoKY+GBiz71K3cXv4wyzYiPFOAdu6SS3f
         wg/P5rLsLjX1PLvsM9Crv/2eoAW4mKC4NfkLyFEXyEyj6DjwkvZSshq+2tQ5IdcN+lFk
         gEilHEVfMd1lvFAW46BSge8HqzV+PqU7sJgBnp+yOVMLNG8mOiZSGw+ZuuCUdrMM19EA
         dEOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E0JfvDek;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2si22095804ybq.224.2020.07.07.05.58.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jul 2020 05:58:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E0JfvDek;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsnAq-0005BE-Cx
	for alex.bennee@linaro.org; Tue, 07 Jul 2020 08:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jsn7S-0007t2-4p
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 08:54:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49287
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jsn7Q-0004oT-4o
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 08:54:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594126479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=MNTlxHdwoZD1i7fR0/VxIsjSfZdUtlBEEDJL/FTCXj8=;
 b=E0JfvDekVN0Ufy23cw96yO0DpmIJt7QqPes335UVx52NlSLWbyq3w4ECfwTpM/+NXb0x8K
 d3nYVgv6oEhmDahQuZUqiaVXxZCBZt6CjiAuHfC7eur0oNxsl51DdIkytE/kx+K/KdKQRM
 bWEcQL2eYRvakqi0C7xIWd2lclBi+QU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-vdRgpab0Oyu0ysiBpjyUEQ-1; Tue, 07 Jul 2020 08:54:36 -0400
X-MC-Unique: vdRgpab0Oyu0ysiBpjyUEQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CCB38AF840;
 Tue,  7 Jul 2020 12:54:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-200.ams2.redhat.com
 [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E570660BF3;
 Tue,  7 Jul 2020 12:54:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CA71B31FAA; Tue,  7 Jul 2020 14:53:57 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 20/20] tests/acpi: update expected data files for microvm
Date: Tue,  7 Jul 2020 14:53:56 +0200
Message-Id: <20200707125356.32450-21-kraxel@redhat.com>
In-Reply-To: <20200707125356.32450-1-kraxel@redhat.com>
References: <20200707125356.32450-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:46:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ilnCDI07w7pR

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
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..b7297dfe9a34bede2ad0d65281f0bc7497bbd358 100644
GIT binary patch
literal 365
zcmX9(%WA?v6uqN~#;dW@2S^JA=?9e2B3&nwF$SVZGd>C_j6YE5wz#n_gs%GoenLN`
zpW{k;$86@Fd(Irrxsi_M?+m~-VJ0WKAHL=?B917q*iIf_8y%W*_c&h3v1cYp<iDut
zLI^Pg&**u8ZO_O;U;2nK<1Tku=M&1^P-fG?`F|()bD3urNkp$TTvP^*e$0;bV;#H)
z4%U-4VilPxB#?O`#NdfS$mx?n$mVph{oQ~%Yf(EgZB?OS=l~o}=#*b=yGo^1+P}Fs
zYB_Ix*kyg-Kbtky0BievRfM=LcefT)Vfic<QphTciiFOx5YLsC&Wen#9aSPWsf7&a
j65Hhtd;1nJ=>DFd20*<S>z#XX{ze8pGFMFpU84R0a<feV

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/microvm/FACP b/tests/data/acpi/microvm/FACP
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..e52b16d24ac4f7b95a7d11a5f2ad801c0cb87147 100644
GIT binary patch
literal 268
zcmZ>BbPnKQWME*eb@F%i2v%^42yk`-iUEZfKx`0ARlp*^z`()4z{IrRAIMxM1_r8I
SLD0QG`x&72gWSRhWdi`;u?ztK

literal 0
HcmV?d00001

-- 
2.18.4


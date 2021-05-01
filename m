Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1373654lfg;
        Sat, 1 May 2021 15:36:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTTKT2LOmY3DFrfa4JKA8dKunKN5Ze4bPMUHb4nqtohh8BCvcY0qBdRHvqaDZyyFF6VZ9b
X-Received: by 2002:a05:6602:58d:: with SMTP id v13mr8787285iox.64.1619908617751;
        Sat, 01 May 2021 15:36:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619908617; cv=none;
        d=google.com; s=arc-20160816;
        b=bUGF7D1pCCburE0dNqAEb1oGou9GLftaNSKZVjMhexFLalcNwfhzqJuKZD5UJPPXFw
         TmVA9l0XPfpBfiDemym6gffocQFc5zOK5iH4l4TiWWq7Ahk+a5VmgO0hJRggnOAMrwDf
         akuoTh+ZBTjQC7X+onHDM+YtTYEnTZF4q1H6N602qQtX8LapLt6wUP6hd15BU47UqcLG
         OdApcMaMDD2KLgFRDwRNaL242Bb8kgGs/FCFCGx66ogiVNTqregjt++bPVyztN1m1IRm
         UQhMrCdVYL8K3VDILwmHVyYLIS6xmyCu2fRJF3EdJ2jK8TVsimZyn7NFOpmYRgOTdYM7
         HV1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=IiCOJYLYQjCXUKgsA8xTlklm89DU2HbkMO26QsLfhq8=;
        b=H1Oce8y0ncBriu0vr/sjkrgGJ6MxR0zkP6IlVqLHMLOJS2SO+8sEFJvzGx8RXj4KHd
         mABZ7656BZfMe8goVbWFNtmtW7JqXPHdrhOEk94vPMaVhXwc2IeE9+AFQ7/bV2EHalYe
         mZBPooEV3fQDEJLJ4cNAnkEyE72ohm0+MyLhoFcAb4HdiWU4G1kVuFO+cFHxL0GE4Km+
         wtqlvLerIYz8e9MMx0NB1YDQrpRJt4w3Wmq4gFnJGm9G3+zEczwYy7t2U/Mbo81pvPwu
         JFZBdg7NvWdoJHqL/IxPYO4gqBqE31czxp6xl2y0h4uUxvAiV7QZVsEompIKN1vWHMQF
         lt4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bXe4VE7Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m11si7711494ilu.158.2021.05.01.15.36.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 May 2021 15:36:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bXe4VE7Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcyEL-00044n-28
	for alex.bennee@linaro.org; Sat, 01 May 2021 18:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcyEB-00044b-VM
 for qemu-arm@nongnu.org; Sat, 01 May 2021 18:36:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcyE9-00083n-4l
 for qemu-arm@nongnu.org; Sat, 01 May 2021 18:36:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619908603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IiCOJYLYQjCXUKgsA8xTlklm89DU2HbkMO26QsLfhq8=;
 b=bXe4VE7YRN3m0+HN/7g6qUjW98HThnm51crd0yGtxPEdXI/HxMSG+MxdyyiZTz3N+H/A02
 Vacm2IyMqa0lqOuOGGqwgkIadVNGE3HoKeU0k+V3qX1w927P0EqOqqGFYAUlbvcm8taCah
 8Ddrm4pVj6At7BzRYDUsN3VxzStgbrU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-mosGgo-yOX-odb84WMloMA-1; Sat, 01 May 2021 18:36:42 -0400
X-MC-Unique: mosGgo-yOX-odb84WMloMA-1
Received: by mail-wr1-f69.google.com with SMTP id
 x10-20020adfc18a0000b029010d83c83f2aso1295789wre.8
 for <qemu-arm@nongnu.org>; Sat, 01 May 2021 15:36:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IStbyYiATShK5G0B53V5n+qRhn2ARGKs2JBKHFd0JhE=;
 b=f/uut3TJM5pmZImywL9AsK0rFhSEHqE+TJve5MOMov60UvMOug9YwJxRg45ta8BwRq
 hnJpywdxfNo+9BWV9x2cvuFBKDGgfGrTCRVuiddsfDRYrQfc6Jk89t7psh/i/tIAGZPr
 4NJerhFH1hmUdmmNAhbxqM3AcjZhQ2xVvkTzN7l8gs20G6N9CGSYcMHbx53yPZ1W7TsG
 5iATxTe1PnpAW14ebWczw4UI/7e224E5lr2OwgZRAu6QoY8uFlN3EKgATjKf7SWlzQgq
 ka7frfifKXNyzcXp5creFLrKCHOfGjkJf9AytP6Qe0MhnRTAbg0LosqkzccTxTzDaRBW
 PSUA==
X-Gm-Message-State: AOAM530LpInP59ViXFI9ixSCL8Ux6gmdMOPJZBLxJss4jGBLtV37/DzE
 szGC8gO/7JC3XXYzkoZpCjUkenOO19WqvJkSquSVpBfDISesnutp2aDQo5hRK7lRJ+I0Or1dVoF
 8A97a3EL9SfU8
X-Received: by 2002:adf:fe8e:: with SMTP id l14mr15445243wrr.305.1619908601127; 
 Sat, 01 May 2021 15:36:41 -0700 (PDT)
X-Received: by 2002:adf:fe8e:: with SMTP id l14mr15445220wrr.305.1619908600952; 
 Sat, 01 May 2021 15:36:40 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id q19sm17176530wmc.44.2021.05.01.15.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 15:36:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/10] qtests: Check accelerator available at runtime via
 QMP 'query-accels'
Date: Sun,  2 May 2021 00:36:28 +0200
Message-Id: <20210501223638.510712-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ib/Ie4wul9zx

Series fully reviewed.=0D
=0D
Hi,=0D
=0D
This series aims at having accelerator-independent qtests=0D
by querying a QEMU instance at runtime to check the list=0D
of built-in accelerators.=0D
=0D
First we add the 'query-accels' QMP command,=0D
then we add the qtest_has_accel() method to libqtest,=0D
finally we use this new method to allow running=0D
bios-tables-test on KVM-only builds.=0D
=0D
Since v5:=0D
- Removed patch 10 (Markus, patch justification not clear)=0D
  'qtest/qmp-cmd-test: Make test build-independent from accelerator'=0D
- Removed patch 12 (Alex, icount / record/replay issue)=0D
  'tests/meson: Only build softfloat objects if TCG is selected (again)'=0D
- Sorted @Accelerator QAPI enum (Eric)=0D
- Added R-b/T-b=0D
=0D
Since v4:=0D
- Added Markus review comments=0D
- Added R-b/A-b tags=0D
=0D
Since v3:=0D
- Addressed Markus & Drew review comments=0D
- Added qtest/migration-test patch=0D
=0D
Since v2:=0D
- Addressed Eric & Paolo review comments=0D
=0D
Since v1:=0D
- kept over-engineered union (I don't how to do simple enum)=0D
- dropped arm-cpu-features patches for now=0D
- fixed typos (Eric)=0D
- rename qtest_has_accel (Thomas)=0D
- probe accel with machine none previous qtest (Paolo)=0D
- iterate over QAPI enum (Markus)=0D
=0D
Eric's suggestion of conditional QAPI didn't worked out,=0D
as accelerator definitions are poisoned.=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (10):=0D
  MAINTAINERS: Add qtest/arm-cpu-features.c to ARM TCG CPUs section=0D
  accel: Introduce 'query-accels' QMP command=0D
  tests/qtest: Add qtest_has_accel() method=0D
  qtest/arm-cpu-features: Use generic qtest_has_accel() to check for KVM=0D
  qtest/arm-cpu-features: Restrict sve_tests_sve_off_kvm test to KVM=0D
  qtest/arm-cpu-features: Remove TCG fallback to KVM specific tests=0D
  qtest/arm-cpu-features: Use generic qtest_has_accel() to check for TCG=0D
  qtest/bios-tables-test: Make test build-independent from accelerator=0D
  qtest/migration-test: Skip tests if KVM not builtin on s390x/ppc64=0D
  qtest: Do not restrict bios-tables-test to Aarch64 hosts anymore=0D
=0D
 qapi/machine.json              | 47 ++++++++++++++++=0D
 tests/qtest/libqos/libqtest.h  |  8 +++=0D
 accel/accel-qmp.c              | 49 +++++++++++++++++=0D
 tests/qtest/arm-cpu-features.c | 55 ++++++-------------=0D
 tests/qtest/bios-tables-test.c | 99 ++++++++++++++++++----------------=0D
 tests/qtest/libqtest.c         | 29 ++++++++++=0D
 tests/qtest/migration-test.c   |  4 +-=0D
 MAINTAINERS                    |  1 +=0D
 accel/meson.build              |  2 +-=0D
 tests/qtest/meson.build        |  3 +-=0D
 10 files changed, 207 insertions(+), 90 deletions(-)=0D
 create mode 100644 accel/accel-qmp.c=0D
=0D
--=20=0D
2.26.3=0D
=0D


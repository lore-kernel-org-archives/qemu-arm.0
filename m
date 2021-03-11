Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp714941lfg;
        Thu, 11 Mar 2021 15:13:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwiUPSCupNlKyEgxdkadHZ1qNjA2PRl6U6V2FAKhJuWvM3z33c8/JtOObadZzDsbFuyF00o
X-Received: by 2002:a02:7419:: with SMTP id o25mr5865417jac.100.1615504384539;
        Thu, 11 Mar 2021 15:13:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615504384; cv=none;
        d=google.com; s=arc-20160816;
        b=QckrINfs86SlddP/nk+5fbjHwaw+9lkxO0SsfK99lZj/qjDB7ywEqQSxVSbQqrKjTf
         bt55bFfH3XRsXKYwE4Ae3iGpec3CHKLpZD+61RQ6nrvzcbmTCB88pt3S6Ck9UOOrRKLw
         vXsLGfgCGW7tGSdCW53wiI91vofJjrTIbq0fRtJl96T5WyN/bVeWQNUGCTYCRNVK3z6+
         BtQHRliclASfJ8eJZv1GCJFWEgcvMbs/Zha6HGVZaJFiKdGf0BogRANIHFCZ/fZtyVj3
         IDTEsKqbeR3z2WSnMoIc6Rh3ze1LFIFpQYTHvM5mRtN1ZiqUMd3bRQAoWPgqUQWaK5/+
         Bm0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=LJW/mzHGQ1NGtCTMOxz9c/B6EOk6c5uZ3kaLug/0I0I=;
        b=CGgM0ORSVr/oeHFKDhoOckBs3sXvM1NvHmBcRLHxGKT5+rDgivZ2PVfNego+h6uwYc
         2EkJBu5vlNOCEp4AWrjDYD0r4YY84h2KjchOlQHwJ1swstjLQK1j8kzEgnui9EL0ztU0
         cuSNyDKW61FZuyMaOpTButombr6RPxhGyuDXfK1JcCOo9kZhSub952WveoGuJ0OasltZ
         NM7GWrMwwpJnCr43gmEzL2fwZBxz5Y5vLbIv+XYUaO8NekIEWXtE+8+In1+xvOeFiZpR
         iIBfR/U4s/0yvOZnmRja734Qc1db1xXtWsHsgfxbsMG1+R8bh6gSS5X7OzGCMP+rJbg6
         wk0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Bh3nkSCa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19si3780556iom.33.2021.03.11.15.13.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 15:13:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Bh3nkSCa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKUUJ-0001hT-O2
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 18:13:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKUTc-0001gr-PH
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 18:12:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKUTV-0004zV-Aw
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 18:12:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615504331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LJW/mzHGQ1NGtCTMOxz9c/B6EOk6c5uZ3kaLug/0I0I=;
 b=Bh3nkSCaGu2FPnzR+eErwJeFCaKRw/aeWK8x3HRkIsSJ+awtmx/xyhM422/CpRB4lSCajE
 k9XgwklP1kDBfaK2kivCRH43hxU45tcTya7f6e5bC7/8PpjAcLL2+neh20s7b3AxFXadHL
 jxYb+qcsKl8i0jkjuyQUz8F6E3z6YD8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-8fEb-RhhMqmByWNmvGB1Nw-1; Thu, 11 Mar 2021 18:12:06 -0500
X-MC-Unique: 8fEb-RhhMqmByWNmvGB1Nw-1
Received: by mail-wm1-f71.google.com with SMTP id n22so1747029wmo.7
 for <qemu-arm@nongnu.org>; Thu, 11 Mar 2021 15:12:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8zfR7RPcuNDHDQ2aIvmkGMVu3VLHkTVnh2kI0ZtOC34=;
 b=lY5tCHtsFiROpkbAPKuVRoOqJXYRZqlC0nVv5sLCe8G8lGFLsOi+y/p6jliYn1vzEG
 1SGMrk8IkV09QRU73BmQhcJe+6DOo4r2ckUPgx8guMI9eh6eLojj2bDT3TM4r12qnXvm
 hgx1m85C1OY2G5jBb9QhIpPuqsJ3BCxwYNLWl9flii1MHHUDdMK0yDviGRGek1fOGdb3
 sulTHlYHQNCzyiasgvYBSH2tXhwky1xmZtOwv85n70LFXbMKn+BalSjur5X5vNh4A1FU
 cVZFK1pK7zSI4u/Wb7oKRibB7z4XbZR45wLhxKz2dNIbIxL3HPsdWMlDGEGFIZmio3TI
 zoNA==
X-Gm-Message-State: AOAM531SzAQkd/rROzJMLYUbMmWt17KvCHUflEgxA68OMlCnkJmq0T+x
 ny8/PhWZB3sYjEFQpuuUW2zK08oj4NJT5N6G8gGotkCEg80p+MWMP+N0OuJbwAkeveNQI/FbSRf
 VZS08i1NmI6ot
X-Received: by 2002:a5d:6cab:: with SMTP id a11mr11015025wra.419.1615504325532; 
 Thu, 11 Mar 2021 15:12:05 -0800 (PST)
X-Received: by 2002:a5d:6cab:: with SMTP id a11mr11014997wra.419.1615504325317; 
 Thu, 11 Mar 2021 15:12:05 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id z13sm5663674wrh.65.2021.03.11.15.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 15:12:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Claudio Fontana <cfontana@suse.de>
Subject: [PATCH 0/6] qtests: Check accelerator available at runtime via QMP
 'query-accels'
Date: Fri, 12 Mar 2021 00:11:56 +0100
Message-Id: <20210311231202.1536040-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QGvYsNRmXYT5

Hi,=0D
=0D
This series aims at having accelerator-independent qtests=0D
by querying a QEMU instance at runtime to check the list=0D
of built-in accelerators.=0D
=0D
First we add the 'query-accels' QMP command,=0D
then we add the qtest_probe_accel() method to libqtest,=0D
finally we use this new method to allow running=0D
bios-tables-test and arm-cpu-features on KVM-only builds.=0D
=0D
Please review,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  accel: Introduce 'query-accels' QMP command=0D
  tests/qtest: Add qtest_probe_accel() method=0D
  qtest/bios-tables-test: Make test build-independent from accelerator=0D
  qtest/arm-cpu-features: Check KVM availability at runtime=0D
  qtest/arm-cpu-features: Check TCG availability at runtime=0D
  tests/qtest: Do not restrict bios-tables-test to Aarch64 hosts anymore=0D
=0D
 qapi/machine.json              | 55 ++++++++++++++++++++++++++++++++++=0D
 tests/qtest/libqos/libqtest.h  |  9 ++++++=0D
 accel/accel-qmp.c              | 47 +++++++++++++++++++++++++++++=0D
 tests/qtest/arm-cpu-features.c | 35 ++++++++++++++++++----=0D
 tests/qtest/bios-tables-test.c | 13 ++++----=0D
 tests/qtest/libqtest.c         | 24 +++++++++++++++=0D
 accel/meson.build              |  2 +-=0D
 tests/qtest/meson.build        |  3 +-=0D
 8 files changed, 173 insertions(+), 15 deletions(-)=0D
 create mode 100644 accel/accel-qmp.c=0D
=0D
--=20=0D
2.26.2=0D
=0D


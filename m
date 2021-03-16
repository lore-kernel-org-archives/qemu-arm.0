Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4789159lfg;
        Tue, 16 Mar 2021 10:48:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2xyOLB9B6Q5pxXODrDCk9WisT+uc75eIw7nPi8l4C26QPs3hvNc6VKO6XDrwoRvkKr4ID
X-Received: by 2002:a5d:9e47:: with SMTP id i7mr4346139ioi.104.1615916935947;
        Tue, 16 Mar 2021 10:48:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615916935; cv=none;
        d=google.com; s=arc-20160816;
        b=d9eZdpg3GccHp7y04Q7qWnitO56UBjZrZJn4k+cp26mbjzV40KSQVA6ePxFSEINc+j
         JRTi8eOl051+m40/OlfgdChh/vBMG5/MjwLdf78+eVrbZAGOeUQ35ftQSOY67/b6mMl9
         VjX5rTyW3A2KRz+YEFmAtABDe/DPoeqsK5fyOJxXEE7SBlDlJtzxkSPE0PSxVItEkROV
         F90pKr9F4NI1OkxW7pP4Qe2nJvDcLEHTbLn/VH4ZygNgmklqGjrgsvODf7cXZJiJLNYk
         QfnWEKFCr9arD8zzUGoJoztzurQQpdf9lW3K3Xt8D1hve2FXYM8JXrfUi1WUFaMdDv9F
         4HSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Y4vN7oSQdHCfPupuCUAS0maVfo8Vbz/Nb2NfBAOhk6M=;
        b=S4lg3hRaBD8Tr9bu9ck/xFi1JRfKc0olnjJnnhD2ygax9bArqBtQTiUE6MEqIDaGmr
         w7RmiAxAre3A0JwkAhTmWTtCbCo4japoAZFukmu5EY/KfvCXZYNnmVm3C+guGUODbNP8
         WJIXPN2uBt8sayE85AeE2ocRNKeXrSzyw8FDve8c2z5TaPV37YcTJnSyT23Pk98k7fwf
         9gmp5KXD7GqtoW5ga7sKvyzGYmdvTx2EkOcDx2X0UDbhUQh9oAMH8jVmXyLHQ1LTIA3G
         RrugpzqE5YAWLYLfyCbqt0ctTVEdlTowZat8PxqpLV19TcfSCbb/qRhu5CRTURHRxsbO
         uw6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GT5EfDqa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n26si13694545jam.115.2021.03.16.10.48.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Mar 2021 10:48:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GT5EfDqa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMDoN-00045E-3a
	for alex.bennee@linaro.org; Tue, 16 Mar 2021 13:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMDRC-00088e-DB
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 13:24:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMDRA-0002pR-Mp
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 13:24:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615915496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y4vN7oSQdHCfPupuCUAS0maVfo8Vbz/Nb2NfBAOhk6M=;
 b=GT5EfDqaACZnmyCeJBLkZQTzSgw2KwC4jKUvnP069WNlAN5VD1Vpu1tKA4L+/1iRFXoaNF
 n6JW1efAt+dGU7rOqRU9kDekZ4/ogNYtJeN80bhUc8TcyVQTgskGpej94uKQ4Vplo5uxpF
 q3n1uWeMExlyXtcPSppSJCkCJLeQVf0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-6xu3FGjXOUyl3nClaYnm2Q-1; Tue, 16 Mar 2021 13:24:54 -0400
X-MC-Unique: 6xu3FGjXOUyl3nClaYnm2Q-1
Received: by mail-wr1-f70.google.com with SMTP id f3so16993349wrt.14
 for <qemu-arm@nongnu.org>; Tue, 16 Mar 2021 10:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j97TlkCGqiQ929kzGXJPvPswPxIcxtzguKWQ6Gwz4cM=;
 b=azRQejcMH6hBied+lIJ6oAx9bUGSw0ej+MJ5+czP6TeLos2f5xxoGob/Xk7zhL2ZxR
 sLi0+xLeHhfWhbbHKq5nGIm5ViC4guHStB0aWdIhr7bTYTNeQai3Zx6fTjMShh8ghat2
 3c4BQbbtfL6nN9n2r4ciD+rilCWbd/dUuoWO6qSXyOYmIqk9n2s87P9A5GbY779Halei
 nyTQmTwsyfGtSGeb1ZHpz1myZ7u418ke1s4ODnHixzGnPtCZSFh/k+l4N76+FLsWTArF
 m9c4SuilL20+OvsveKty9wYHd3+PIvG62RSfvJ1C3GFBN15nV99AjrJOcxm8xQdmZTZq
 e+Zw==
X-Gm-Message-State: AOAM533aJJ0paB/YKcrqF+QUNl8jT4wmZGGaJ17JgsFd/lP+XSI7m9AZ
 IdeG9bcCzLjonX0PG7ED0AvFwDr5SemkVIQOKM95bEvmGP7rZ1IE5+y1RV/rbqbNgLlRmRtT5NM
 Q20YnHduiq5Jq
X-Received: by 2002:adf:fb8a:: with SMTP id a10mr42633wrr.365.1615915493013;
 Tue, 16 Mar 2021 10:24:53 -0700 (PDT)
X-Received: by 2002:adf:fb8a:: with SMTP id a10mr42595wrr.365.1615915492788;
 Tue, 16 Mar 2021 10:24:52 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id y18sm23072328wrw.39.2021.03.16.10.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 10:24:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] qtests: Check accelerator available at runtime via QMP
 'query-accels'
Date: Tue, 16 Mar 2021 18:24:45 +0100
Message-Id: <20210316172449.3148634-1-philmd@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MMUiRMGB1C2s

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
Please review,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  accel: Introduce 'query-accels' QMP command=0D
  tests/qtest: Add qtest_has_accel() method=0D
  qtest/bios-tables-test: Make test build-independent from accelerator=0D
  tests/qtest: Do not restrict bios-tables-test to Aarch64 hosts anymore=0D
=0D
 qapi/machine.json              | 55 +++++++++++++++++++=0D
 tests/qtest/libqos/libqtest.h  |  8 +++=0D
 accel/accel-qmp.c              | 49 +++++++++++++++++=0D
 tests/qtest/bios-tables-test.c | 99 ++++++++++++++++++----------------=0D
 tests/qtest/libqtest.c         | 29 ++++++++++=0D
 accel/meson.build              |  2 +-=0D
 tests/qtest/meson.build        |  3 +-=0D
 7 files changed, 195 insertions(+), 50 deletions(-)=0D
 create mode 100644 accel/accel-qmp.c=0D
=0D
--=20=0D
2.26.2=0D
=0D


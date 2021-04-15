Received: by 2002:a05:6214:9cd:0:0:0:0 with SMTP id dp13csp1645350qvb;
        Thu, 15 Apr 2021 05:27:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjal/sY0bmdB8ITtc7OKXgq3vj3Jh4BGXKSkY9tKMw55+Nj4Q+HkTbm5Ni1Qylcaq1H5/3
X-Received: by 2002:a67:804e:: with SMTP id b75mr1367072vsd.47.1618489629810;
        Thu, 15 Apr 2021 05:27:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618489629; cv=none;
        d=google.com; s=arc-20160816;
        b=x4gEA+AwTObCr/xhw/1nJN6fT2FMZoM0o+soXRgXZSxhQoqMUEppH/S7U5hz+4p5VD
         mhy3eIbHLioX/VMhWmyeEtaM9MWRmLbtyVj8YJTf7hrZh58BvHAGcxdsbNcbalxQAzC4
         bxF6krGnX0kF5FO5splNsQ+J/tqVCoBy0uy2sTzjgsnuembQK2yG3vfBx4E1tBp+zyH1
         8BskBj20q9juJ6UOkNAK4w2U1gqJo3CVRFBj7S1u9cf9ePj3NPAi9v3CLdmaoJcE5dzj
         KmBu10AgZ/ovSIXBXEbqqMxbpfyGcdIvKvaxUW3XsoL/0Vn+eusU7tlWAX7y47RQLjHl
         QOsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=pXtf60TYT+/z0KTRgVxh+oiyMooqorWxspUIGNgWdZk=;
        b=IQOmdQ37445n6nGIXQky+ZSBmNkdgmWtatjyq5qd4PrzFQOqtD0bDfamsG42vuNSR7
         RJTQ8oAc1Dr49Kl2RjJLWfLP1yKL6xxdHNcT4jPkP10mxbnDTYEESwLlIkheBe+brSU/
         gHe+lZ5oTqvZXsIeqacmIp9kIc2K/K68VChF4ptxHILsC4u+HKTZmvf1Wnyjz0B8pQdd
         P1LD4aKCLl5xoSuLb4MRDJwrGynSU1D7kc7zOSpLhoR8x7xc8YlJKWLTS3lvG5pJfhgv
         L1UcM4xNdHpwR1fm8oguCGirwgjGrqTQJ70oc3cBZbLEXJaQZm/q95RzUo85wNCfemqs
         nZdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cdeLTdRY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e2si1040324uar.72.2021.04.15.05.27.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 05:27:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cdeLTdRY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lX15R-0002vb-50
	for alex.bennee@linaro.org; Thu, 15 Apr 2021 08:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX157-0002v9-7S
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 08:26:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX151-0005wK-9K
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 08:26:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618489600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pXtf60TYT+/z0KTRgVxh+oiyMooqorWxspUIGNgWdZk=;
 b=cdeLTdRY6LDXRP9BDPszY3pceQHxrkghvUARE6BdWaRpu9pbKk5/e1RrRW3jwSIKAuLGcj
 O1wcDOGSqbRNinEY2hMSAViXMhIxzr0m0MiDgpb8BLWbHbL33P+x7oGFs+OcdWuRWzFuke
 FCz/E0Zn1SEcNvgyUJAPF6byhwmS0gw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-ddLCOS-6N0mWaqgSGO6BuQ-1; Thu, 15 Apr 2021 08:26:38 -0400
X-MC-Unique: ddLCOS-6N0mWaqgSGO6BuQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 t14-20020adff04e0000b0290103307c23e1so2687934wro.8
 for <qemu-arm@nongnu.org>; Thu, 15 Apr 2021 05:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PX6iu3F1pA0ehnZXuMxawI4QCD3hd697/6OmNN8gdWI=;
 b=OFZdc+TK+UVjssxUpK+niNnnaz8OUoaieIFpWFGNraKAjIb/GoL+PpWGH0bwmm/vWi
 u25rwdYprC47RWuWCZLyv6pwzepFDGszyk7yHAAvY/43WAw9PjI7P55nSHczDfJf+pKE
 rAWNTVYK4koYsbA6uKKB8an1RCdVnaIpM2IV8kamxzfhNuIJgEVtR/NDnj1xIjfnJxm8
 TKy4F5XF9An8Pq13dGbpxdLLeesy4VuOQrQqoVjeam/3luQtHdA1oPdsTOYjyZgTxt9s
 Rr+KjL6Nsw2aZ7AHZbQCyRzGmuOwG3v8WKYx0GsvdQe7WeLh8mbdKbHYT2geoDHFBq4F
 dP4g==
X-Gm-Message-State: AOAM5332AMzVwKiGyNkqEgxWHn75T8Z53FbfeKzTHyXo+hirhrdH2TOW
 SPnOJdq3FR2sB63MCW6l+PpcE4ojNRkm7yve6CqPR0+eIoNnhV044sx4LHkM+XDikNUpWfktquD
 1VUei6k+8Kg40
X-Received: by 2002:a7b:c7d2:: with SMTP id z18mr2910906wmk.104.1618489596162; 
 Thu, 15 Apr 2021 05:26:36 -0700 (PDT)
X-Received: by 2002:a7b:c7d2:: with SMTP id z18mr2910878wmk.104.1618489595928; 
 Thu, 15 Apr 2021 05:26:35 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id h17sm2960469wru.67.2021.04.15.05.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 05:26:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/6] qtests: Check accelerator available at runtime via QMP
 'query-accels'
Date: Thu, 15 Apr 2021 14:26:27 +0200
Message-Id: <20210415122633.4054644-1-philmd@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8vBgjIHJsTpR

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
As a bonus we remove CONFIG_TCG in config_host, to avoid=0D
building unnecessary objects depending on TCG.=0D
=0D
Missing review:=0D
- #4 qtest/qmp-cmd-test: Make test build-independent from accelerator=0D
- #6 tests/meson: Only build softfloat objects if TCG is selected=0D
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
Please review,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  accel: Introduce 'query-accels' QMP command=0D
  tests/qtest: Add qtest_has_accel() method=0D
  qtest/bios-tables-test: Make test build-independent from accelerator=0D
  qtest/qmp-cmd-test: Make test build-independent from accelerator=0D
  tests/qtest: Do not restrict bios-tables-test to Aarch64 hosts anymore=0D
  tests/meson: Only build softfloat objects if TCG is selected=0D
=0D
 meson.build                    |  1 -=0D
 qapi/machine.json              | 49 +++++++++++++++++=0D
 tests/qtest/libqos/libqtest.h  |  8 +++=0D
 accel/accel-qmp.c              | 49 +++++++++++++++++=0D
 tests/qtest/bios-tables-test.c | 99 ++++++++++++++++++----------------=0D
 tests/qtest/libqtest.c         | 29 ++++++++++=0D
 tests/qtest/qmp-cmd-test.c     | 18 +++++--=0D
 accel/meson.build              |  2 +-=0D
 tests/qtest/meson.build        |  3 +-=0D
 9 files changed, 203 insertions(+), 55 deletions(-)=0D
 create mode 100644 accel/accel-qmp.c=0D
=0D
--=20=0D
2.26.3=0D
=0D


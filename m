Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp715438lfg;
        Thu, 11 Mar 2021 15:13:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5TPfce0cqkyyV1iJ48T7Pc23m/Avz7OrCKldImNSt3yO+1xLq9rnARMsoXwmW0Co/2ohV
X-Received: by 2002:a02:aa92:: with SMTP id u18mr5932120jai.119.1615504432345;
        Thu, 11 Mar 2021 15:13:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615504432; cv=none;
        d=google.com; s=arc-20160816;
        b=ELEAvJUCmeg5ivC6RApaVYDZx8EfEU4Dz2jQWL/aFWZ/8AoAtVmSirMicxRaFKUcR1
         F8Ia+AT/oArL3lPaFsy+YI6CwseIyrM/ZEURfmP+W/4B4s1LU8ZXLQ9pFWk/eBKQcqgb
         /1YVf5cEtgZxDHO6WD/Q0CoDsN8J/4UgMqzieqMF/eGSWFWlHemcHNohtrIL5MnsHtgR
         WKGNv/fNXq5UdohN1NPGvWDy85DTIvmCGKzw0cJ9OySkjtWccoB/Yu0lUfLCnb/QR0OZ
         cvU938enWLqMXuNl/FeBI2TN/3npzJtkFOOxLzf+wxd6MRbweddtaRHoYankLufb5QrT
         CFyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=r8j0KxZ86bkS8FC5cXOopVHnXZnokYuiGFfUmvAy3qc=;
        b=i/t6Ozm/bOL5et/uORv3oxrN4y6eBd3lSGdvuHzd22cWePi11H2iYpZ/XOSUGCfX/5
         /xc39P5wsErna4jXalGV1fa+SYnwiyE4KaqcnkFbYDapW6rBk3/8LDs+P82sb9UWQthL
         dVshLuq8NPkWjfDZKFz3GPZ9O7EF2uy7vQcW+FdzgdlnsPGg9hV6ihTYouOHZeJfAVzm
         uELu+xeYrX0UOEwoO0pLXosIkWDaANik/dPJIJmAG8TYWUP63xDsxpAxO/fqVL0WyeF5
         BCyojrqDCAv6tFfGiiIgzuf6bJ7cEajAZphGhCkKH9Kt8tLp7uCJoNblkXSxCIE35Xwq
         JVMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PcAlyXmz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14si4261054ilm.112.2021.03.11.15.13.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 15:13:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PcAlyXmz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKUV5-0002Gv-LD
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 18:13:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKUU6-0001ph-1U
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:12:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKUTz-0005AD-EB
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:12:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615504362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r8j0KxZ86bkS8FC5cXOopVHnXZnokYuiGFfUmvAy3qc=;
 b=PcAlyXmzyPkiClVSiixpdDG+jmVV6W1CW6YvYXgb3z6TgIHCKZzbQjKRAyHils6bCYvRIG
 R2Aj+PT5UD43qSSgdJnVipJajXdlaoweZDuBGhh0BlY4D15T/5FmK1a7ffPR4tVyBq3y1d
 0JryJIN74RUYYTaTArMF4/k2m/xXwqU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-t4TdAfXAMMaMdq4RKk2oHw-1; Thu, 11 Mar 2021 18:12:38 -0500
X-MC-Unique: t4TdAfXAMMaMdq4RKk2oHw-1
Received: by mail-wr1-f70.google.com with SMTP id g2so10236060wrx.20
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 15:12:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r8j0KxZ86bkS8FC5cXOopVHnXZnokYuiGFfUmvAy3qc=;
 b=L6Y96mPjCzP2ndkPOJPxDV7vl6pwkIBlotgceWFZBp+rDAZyMK+VR45HpEvWJX/Mrt
 /jrOKbejqL/UjzChUob6Xk6ZdaIADkZAkP+d9B9TAQCp9ej3IJwUILyvtzdXBP98JcLV
 EafMAQtv/w86EswGz2/10Zer9z7n5OHK1rTojJ+1WKF2COdAu3qjDSkqUi14YIj8z6zF
 Dk1gHgJdc/+E41IbAYR0Iw6c1nGFyC/AZ66EV+9vTEh8OmNEG+0nlesWFSKQC93hXMVA
 vDTYd0z+NgGOsjNLTjq333t4seDzLuNahTfJGbS8mKFJU1nuBUVZSBTFswzedKXvr7cA
 aKqw==
X-Gm-Message-State: AOAM531ZJHyNP8KvJi9+zpHpSpb+gfSVLoeTILutwAwrMS0C3YqnL5k/
 1Ok6tJTgVD0CiIEeHcjWxSIdQqRr5V1yZtHAOofri4+GtLAn/kTy4Gi2ry/Y7fCg2yFqk0IXnp3
 306d3voiqGehL+nhPp6K0R1PeWAt3qPASlYE6T6t9hDRu/im4PKCdz3YARqWFPi1M
X-Received: by 2002:a7b:c084:: with SMTP id r4mr10314910wmh.166.1615504357143; 
 Thu, 11 Mar 2021 15:12:37 -0800 (PST)
X-Received: by 2002:a7b:c084:: with SMTP id r4mr10314884wmh.166.1615504356954; 
 Thu, 11 Mar 2021 15:12:36 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id b186sm252054wmc.44.2021.03.11.15.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 15:12:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Claudio Fontana <cfontana@suse.de>
Subject: [PATCH 6/6] tests/qtest: Do not restrict bios-tables-test to Aarch64
 hosts anymore
Date: Fri, 12 Mar 2021 00:12:02 +0100
Message-Id: <20210311231202.1536040-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311231202.1536040-1-philmd@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SpFkYKIdVJ2A

Since commit 82bf7ae84ce ("target/arm: Remove KVM support for
32-bit Arm hosts") we can remove the comment / check added in
commit ab6b6a77774 and directly run the bios-tables-test.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/meson.build | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 2688e1bfad7..405ae7a5602 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -170,14 +170,13 @@
    'boot-serial-test',
    'hexloader-test']
 
-# TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
 qtests_aarch64 = \
-  (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
+   'bios-tables-test',
    'xlnx-can-test',
    'migration-test']
 
-- 
2.26.2


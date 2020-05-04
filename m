Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp275943lfb;
        Mon, 4 May 2020 03:07:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypIuqZfFaOEeD0cRbar+7QMEeC5UUvDkxDfTk1t7vKG9q9Mrey3RKoRnH80GoaKzTLUvANlN
X-Received: by 2002:a05:620a:b83:: with SMTP id k3mr15049233qkh.412.1588586872185;
        Mon, 04 May 2020 03:07:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588586872; cv=none;
        d=google.com; s=arc-20160816;
        b=0fnmMmAlQsxPtlMzMoUs3yjbIhBt3AZ2QJu1ma9iIufipQXxWZ3aM7n6XSS3M7qtba
         H7yj/td+nKoif7LB8Df4V52tNEg5VoowQBa8F2AOstMB6dvHksjTnxxZAfUQhJaXq6iT
         BItfLZXP+7PLbVMOpUSrmDrdkJqTdcQVscgZUgtN3X8KnWFnYQE6FkUxwdLWg01JYLck
         PnnsTNBydGIRAZcWd59nc5UeKJotAdc25dU7z4p3anEs6BoPmB5JTwsUqd9ySakrXLSi
         y5sovKm/42TS+v27341Fh4J6nZZvSrUcGGg6aPKc8pw8IgfGQzzeBkI0oxwouu7+ZYiS
         T6kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=/ZVZt1eZRouG8SfIcedxiaba1cChmaXwtwdN3BvQWTc=;
        b=Rkz4ny4Ytjh0IJA+9Zoh5vVXydHB5EWRory5RSRQ/5nicbr9I8Bzv0EdRiaOBc2OMF
         q31klmE480pkJ/O21ZacjY0L5krbvomIGnwAGKd3t5thrHLNcNwX9mMuOeBfOpZscuLt
         ujJSAZVYmx/Tu1wUyJFrZNtnGiS6LSRSJS3NS/paTKMnkxZSLdM+6aMMAsyD+9kxgyPI
         Tk0RalCIA31+/m9sqJY5uT/3S6LtHdGACTtUqfLzi8Qw6pmFpTOHe+thn2PsAA6cahkB
         GE9RAAUNPy/7g7GPsAc9YtSpNz5DKBbu+Ezj2PCXyFiO2ubq5P4dwoiE4uzEKJEMi/H3
         /PMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HcRGrtw9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id f15si6291604qka.362.2020.05.04.03.07.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 03:07:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HcRGrtw9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVY0t-00053D-Hk
	for alex.bennee@linaro.org; Mon, 04 May 2020 06:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jVY0j-0004zF-Ta; Mon, 04 May 2020 06:07:41 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jVY0j-0002jF-9p; Mon, 04 May 2020 06:07:41 -0400
Received: by mail-wr1-x444.google.com with SMTP id k1so20215794wrx.4;
 Mon, 04 May 2020 03:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/ZVZt1eZRouG8SfIcedxiaba1cChmaXwtwdN3BvQWTc=;
 b=HcRGrtw9qZwIdAjOVDw2nBeZQtDcI35wjvWlHOGFRg+YHxIgcEOeEOIUXHFvYJWe1y
 0aEc8lF3QcOuHPeMJ45OuZQ1/+1Dnot2UsK7TlMShn1hmMCU98nR3HqSnBLrZu1ndQJM
 w1kaQH2SKAmFC3AZAy7uhqrr/gwyVu0QHVGrrHfctlxK7lQakRs3aFMLtMqke8iQsdYT
 PLVukoSv+TknjgwBfsv/LgVJCO02T7xkFe7qLDeEyKZT9f5P4xcYNT0INYTTlZ5cGDXi
 WsE3CbUxGOSfFLN2WtsdFFKoJ5fyjZFpRUSS1D0HqN6DiszZ4ePD73Tu2IZ8D9II0tF4
 AY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/ZVZt1eZRouG8SfIcedxiaba1cChmaXwtwdN3BvQWTc=;
 b=noOYK1XdjMNS9BGSWHCvbufOnuv+1fC3+DahnHUlJ+1wkstFbm0LKh8PdqqC58wAar
 n7ZnJAWIzl3QnXHyuqePnD161JysjcC4UlIihkCczNiMHPwP8LvjNNlSXIPmF1gtWMxx
 IcfgnH5JD+vHlNT0aITdgnVRqV5Uic/tDZnGvDDmnJ+LXqtwq/8VgaS8/2bMBORBje+B
 lPel/n/QBRRwYwyk/eRie0zmxNPEz2j8nRu60uXkP2Khs3ryvHcX1OvZE53sszU8mSIh
 FblDIR6S6lTuA+LLjKxYxH/wLaX6vgwJI81NAon73oFybzorQvZ0I/Q99hSLnVdq/B5B
 1iOg==
X-Gm-Message-State: AGi0PuZwB0x2OYnSq9sdhbBBfFow9CY+2KUsGwzWapBtAsp74YhBkdsf
 G0rxLgagO74fEM2AKOJ5QVheBXIZDIo=
X-Received: by 2002:adf:a74b:: with SMTP id e11mr16878108wrd.99.1588586858230; 
 Mon, 04 May 2020 03:07:38 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id k9sm18517778wrd.17.2020.05.04.03.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 03:07:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] various: Remove unnecessary casts
Date: Mon,  4 May 2020 12:07:32 +0200
Message-Id: <20200504100735.10269-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a+jie0iNB9+B

Remove unnecessary casts using coccinelle scripts.

The CPU()/OBJECT() patches don't introduce logical change,
The DEVICE() one removes various OBJECT_CHECK() calls.

Since v2:
- Add A-b/R-b tags
- Reword description (Markus)

Philippe Mathieu-Daudé (3):
  target: Remove unnecessary CPU() cast
  various: Remove unnecessary OBJECT() cast
  hw: Remove unnecessary DEVICE() cast

 hw/core/bus.c                       | 2 +-
 hw/display/artist.c                 | 2 +-
 hw/display/cg3.c                    | 2 +-
 hw/display/sm501.c                  | 2 +-
 hw/display/tcx.c                    | 4 ++--
 hw/display/vga-isa.c                | 2 +-
 hw/i2c/imx_i2c.c                    | 2 +-
 hw/i2c/mpc_i2c.c                    | 2 +-
 hw/ide/ahci-allwinner.c             | 2 +-
 hw/ide/piix.c                       | 2 +-
 hw/ipmi/smbus_ipmi.c                | 2 +-
 hw/microblaze/petalogix_ml605_mmu.c | 8 ++++----
 hw/misc/macio/pmu.c                 | 2 +-
 hw/net/ftgmac100.c                  | 3 +--
 hw/net/imx_fec.c                    | 2 +-
 hw/nubus/nubus-device.c             | 2 +-
 hw/pci-host/bonito.c                | 2 +-
 hw/ppc/spapr.c                      | 2 +-
 hw/s390x/sclp.c                     | 2 +-
 hw/sh4/sh_pci.c                     | 2 +-
 hw/xen/xen-legacy-backend.c         | 2 +-
 monitor/misc.c                      | 3 +--
 qom/object.c                        | 4 ++--
 target/ppc/mmu_helper.c             | 2 +-
 24 files changed, 29 insertions(+), 31 deletions(-)

-- 
2.21.3


Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3986031lfa;
        Mon, 2 Nov 2020 06:43:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzA9E10KA4WPQNJ/8N9MXgtAJSW6NZBsoNrkQCRyTWoR5tuAUxf2VOGzrYN2YzpZ0Bn+yLD
X-Received: by 2002:a25:abf4:: with SMTP id v107mr20836757ybi.12.1604328229364;
        Mon, 02 Nov 2020 06:43:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604328229; cv=none;
        d=google.com; s=arc-20160816;
        b=fMlG6sR6BNR512tmx7w4vUVh5Ev3GxEP8i0uCdTMuvLlf2t8wofJrbkSr2T1bXmNwy
         OtAsI2azqyFGcHdqFkc5U5euvFogoWWtTHCWxR2CYPK9sPGTNFobsbVYzowTw9BhbgGm
         TcaE1/EJkjySDWkSb+br8Bksa8zWTeD8O1sideQpaWsXqFQmfhd06AtPAvTGguooy3KK
         ewM+1WOVuDPcCEtnZW5qJLzQf5buo9Pua0gBdimnfXbsj0E8rrGDyVDRiDkgzP0L+9gs
         MQKjQ9i1AEL7EthujwL2K5k4JnkRlMCDah27XOnvb7M362KAws/pldQS2bR7gyLdBQJ+
         9ieQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=j3HaWimA2sQhV0m5yDO0w67enm5B0faDw85mk9Xsiio=;
        b=fugRvhJhpGqXIp7+Thkq0IYPGhb/XPAFf6+ssqlX/WYI6yeXfRH2mk6fsm0ao+Oyfk
         JPGTlxRDMq7VUA6jfIwxyzAXaWSoUcaKRYuNfyrpP73zYG5Hx7zzKZIPgV0tNuPgalxK
         GlqFAmS6wtcmW18icKvG5lPWLfG/PwlIKH27XPDAf5XzlXhpVvwZhUBdjqnCQ6/BllvE
         b5whinDvoeAz/MZRqe1a8I76Az6GGY92NTZKrQMXsgACpoaTjRMG9aGIOcWS1ywBrWJm
         SAllLbgL43dwVnq7EuzID8/BUP6qB268qZhyf2fZSpLyrMuoEry5OoS3pYbb9rvVfu1V
         nyAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=G6lBXEbc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f66si7338773ybi.304.2020.11.02.06.43.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 06:43:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=G6lBXEbc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZb3k-0002SJ-NY
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 09:43:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZb35-00027I-Bw
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 09:43:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZb32-00059W-HU
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 09:43:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604328183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j3HaWimA2sQhV0m5yDO0w67enm5B0faDw85mk9Xsiio=;
 b=G6lBXEbcTxcy38IKL4wZpYPKNL0bpA5crNLeK2ey5LgE/KJ/CAEVZLVQB6e1dqUkdwaLzt
 xFQilriODF9Ga6uZZgrl3zd9x+jP7kLgXl7Ex79XFka3iZF3qLcJjg1yeYDr+54qfauV8m
 RsmP95Ld45+fYW63yQyiCEjb0/fir54=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-EnZPMeS9NcakW-7zfdynCg-1; Mon, 02 Nov 2020 09:43:01 -0500
X-MC-Unique: EnZPMeS9NcakW-7zfdynCg-1
Received: by mail-wm1-f72.google.com with SMTP id p7so1930687wma.9
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2020 06:43:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j3HaWimA2sQhV0m5yDO0w67enm5B0faDw85mk9Xsiio=;
 b=Am4iZIgGoIBL+g6MI00fkXtFAE/8JCmlMLTeg7uwF0PDSDiUt+AtcfQ69dVAfiiOIM
 64SRF7sXXj3OhWi4Nd7CpoD3yfZ02RaRkznT3neSg9GVYSnBxUIbf3DbhMVMmsZj3j+y
 h6118nWxnULR4r5Vs/8yMxUqkJOaNBHQctGKdZii9twKgTIwgVcSXnclpzJAwNEu7Jyu
 dYaHFoBJxb8ao9RhFkspMeZc2vu85g48FuXdTDeY1sZiPsM9pQta9fxIzzuzsjZqTSQ4
 7soyUlQ6Z6DdcoTWEnBkym2+Ps6rfymE7mBwduSy1CPxjygRIQubcv9/95xrhyUgFeJm
 qJyg==
X-Gm-Message-State: AOAM530EMpiz1NNR2hJvOF8sxDyURU1g0s22SRZeRXHQA8ZK1CgvwptY
 K+fujrK6pFmW4Ws2Hh61wcE+IAdTWOWhK2kwEjmI2z+2qT0EfIKvNBxsJVcI7eVbr3I+IuMzw+f
 EmwnJIDf+bqWC
X-Received: by 2002:adf:a303:: with SMTP id c3mr20547913wrb.417.1604328180670; 
 Mon, 02 Nov 2020 06:43:00 -0800 (PST)
X-Received: by 2002:adf:a303:: with SMTP id c3mr20547894wrb.417.1604328180546; 
 Mon, 02 Nov 2020 06:43:00 -0800 (PST)
Received: from localhost.localdomain (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id o186sm16176699wmb.12.2020.11.02.06.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 06:42:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH-for-5.2? 2/5] tests/acceptance: Restore MIPS Malta multicore
 tests
Date: Mon,  2 Nov 2020 15:42:42 +0100
Message-Id: <20201102144245.2134077-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201102144245.2134077-1-philmd@redhat.com>
References: <20201102144245.2134077-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 03:02:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Michael Rolnik <mrolnik@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fabien Chouteau <chouteau@adacore.com>, Aurelien Jarno <aurelien@aurel32.net>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /dLwfa6szY4Y

Since 42a052333a6 ("hw/misc/mips_cpc: Start vCPU when powered on")
the multicore support of the MIPS Malta board has been fixed.

This reverts commit 61bbce96fe4c8e3a2b7df5a67ba7dc6ba418e54b.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/acceptance/machine_mips_malta.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/acceptance/machine_mips_malta.py b/tests/acceptance/machine_mips_malta.py
index 7c9a4ee4d2d..eea046141d6 100644
--- a/tests/acceptance/machine_mips_malta.py
+++ b/tests/acceptance/machine_mips_malta.py
@@ -100,7 +100,6 @@ def test_mips_malta_i6400_framebuffer_logo_1core(self):
         """
         self.do_test_i6400_framebuffer_logo(1)
 
-    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_mips_malta_i6400_framebuffer_logo_7cores(self):
         """
         :avocado: tags=arch:mips64el
@@ -110,7 +109,6 @@ def test_mips_malta_i6400_framebuffer_logo_7cores(self):
         """
         self.do_test_i6400_framebuffer_logo(7)
 
-    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_mips_malta_i6400_framebuffer_logo_8cores(self):
         """
         :avocado: tags=arch:mips64el
-- 
2.26.2


Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6563638lfg;
        Thu, 4 Mar 2021 12:38:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDhJEmPliBNae9NI0r3OtURYW/Lg+/BeKgsmiYYgifN27VIokaeKwaC/jCUV/c+LwolLkF
X-Received: by 2002:a02:7657:: with SMTP id z84mr6042713jab.103.1614890326625;
        Thu, 04 Mar 2021 12:38:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614890326; cv=none;
        d=google.com; s=arc-20160816;
        b=Bdh/8OEFl9BVVmxoXkusjPpQk7b0xIChhOV/p3Wy6tEhkTfm8gWJGySw4j1Cn+pORm
         1NiFKYet9idt2KMy+oeqDvp30x0lQUD0PBQEdErlCp8tOvpSamGJF1OoAIS704LhlcDe
         9gcjsMQtLVMReHJEtPUtTsDhw21CgLatIvqmChGW70xI74APiR2CWtFokJerCI9LPo9x
         R7HWNlJlt4Yvm3aHJ8k3zbFXvQV9v1QHp95bF2YiZjpjbKl5dKvCfOG/xG0sd7n26Cf7
         wNjEIpWMGJXTWv1OYKQD3ig2R9nTktXpNm78/OKc/cJFHVf0KIixFB3endu0/UDLQY1D
         XQGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=nTmBRecbgq7cn3kHeKQ6l9ze/qGvDgWNraw7SS97UQU=;
        b=OyyguGBD2q2DuQ1+IJRRA5Cn2aPDV4xe3/u3KMRg0pArUiM2g/hcpVYau9G0rjRXdg
         Wfp3Dm5SzVx+kdqEyRUA3IMyoQQ02FaNSFL11t94/XBRtYmJYu5bkHMIXtpGzOEUeD7J
         0dzUppZqICHB9sA5uvCMJNAoUChKdJsWQyypWJj+Fk4rp75HCCcdLUEKokVjtcWOzYHo
         QXQlPRmwz8Ea3qS+qvuociPKSqTJXRIS1/RRd426SsSdQhAAJ0/JMY8L5pUkZcmpKGxu
         vymNuP68Er3U69GWzDilzzsNdPjICV5m3rSKLe3TNzlg2g/POvYBRF1Qq8DBJhmJG48z
         u0Zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rtaYZ9NZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c1si358907jam.95.2021.03.04.12.38.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 12:38:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rtaYZ9NZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHuk9-0003Qu-Sb
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 15:38:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lHuhR-0001eW-Q0; Thu, 04 Mar 2021 15:35:59 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:40217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lHuhQ-0005Jg-1p; Thu, 04 Mar 2021 15:35:57 -0500
Received: by mail-ej1-x62f.google.com with SMTP id ci14so32985658ejc.7;
 Thu, 04 Mar 2021 12:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nTmBRecbgq7cn3kHeKQ6l9ze/qGvDgWNraw7SS97UQU=;
 b=rtaYZ9NZXHbrY132dK/qAgdCV7DbROChBMp1P6dOCSlgDbFfMaQKgvuakrCO6VTuZ6
 3S4LGUrSk/E60wXlrEgMbZqKQ03Ssg75r19yqFcMbcm8900agRNJ2oVeA3jDV//3y81R
 HR+RYrEZFLqk9V1/TK47ut6fkhYbnISFE9utIqyJPdlDLIVmWd6ecOUtwMFJ9ZQYXLYh
 q+b9DEGQSl0iPQ8mPjjLO+baW2RPWeLBVkcxV/MOB6M5AhpivKhStJ4X8QSvy2fSQg/F
 lCN7AxmCq6X8QcDG0Vqdr2thukgdNdzteJPB9SVfo49xrZvaK55PyRTRy5BZCZ6j8NIU
 jtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nTmBRecbgq7cn3kHeKQ6l9ze/qGvDgWNraw7SS97UQU=;
 b=f0f7k32m3Jmsq1DtxLLoTHJiJDVxf64jeB3FeYzOMCTAxqrR+a7L6XlE1nsAtXFNC5
 l9XP+s8pr3fnNt0tfdsWmEc9SfdY5OIdiYcOFV5+/jUNMHL8LXidwfDgvsOF0rMkEFw+
 UvKVZJ7MwXq69mgNEU3+7Dqk4kqL+N3FZ7a+5SNXSm7EUCO/hIa5vwVD3vz5lFNIsOlq
 XATUKHiygjrClj1D291pY621XZL/ELLuQQ9N/NloL2yhoyC8WZSIO0SeeXwC3Ah/CQhF
 8YlT6BSn8cynIwycttPUX80eOf60cV95TJRQXMi9D3utLreWJJ4LRbPboTVgONDnLLn5
 2EsQ==
X-Gm-Message-State: AOAM530jC5fhATuX1UXl5mto8Umzp9njB42zq0By0VI9LeYAB7TobgLm
 42nyNTsscrprKRa2g9HeZ/fa5AzDvcI=
X-Received: by 2002:a17:907:7014:: with SMTP id
 wr20mr6372939ejb.179.1614890153239; 
 Thu, 04 Mar 2021 12:35:53 -0800 (PST)
Received: from tuf.home (2a02-a456-6be8-1-ebf2-7b2-6f3d-5954.fixed6.kpn.net.
 [2a02:a456:6be8:1:ebf2:7b2:6f3d:5954])
 by smtp.gmail.com with ESMTPSA id t8sm289956edv.16.2021.03.04.12.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 12:35:52 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] Allwinner H3 fixes for EMAC and acceptance tests
Date: Thu,  4 Mar 2021 21:35:35 +0100
Message-Id: <20210304203540.41614-1-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, berrange@redhat.com,
 f4bug@amsat.org, b.galvani@gmail.com,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Pavel.Dovgaluk@ispras.ru, crosa@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YDkjjq+uiaMS

The following are maintenance patches for the Allwinner H3. The first patch
resolves artifact download errors by updating the URLs to the armbian.com server.

The second patch is a fix for the EMAC that is used by the Allwinner H3 / Orange Pi PC machine.

ChangeLog:

v3:
 - fixed the acceptance tests by using up-to-date armbian.com URLs

v2:
 - added Reviewed-By tags
 - changed URL for artifacts to github.com/nieklinnenbank/QemuArtifacts

Kind regards,

Niek

Niek Linnenbank (5):
  hw/net/allwinner-sun8i-emac: traverse transmit queue using TX_CUR_DESC
    register value
  tests/acceptance/boot_linux_console: remove Armbian 19.11.3 bionic
    test for orangepi-pc machine
  tests/acceptance/boot_linux_console: change URL for
    test_arm_orangepi_bionic_20_08
  tests/acceptance: update sunxi kernel from armbian to 5.10.16
  tests/acceptance: drop ARMBIAN_ARTIFACTS_CACHED condition for
    orangepi-pc, cubieboard tests

 hw/net/allwinner-sun8i-emac.c          |  58 ++++++------
 tests/acceptance/boot_linux_console.py | 120 +++++++++----------------
 tests/acceptance/replay_kernel.py      |  10 +--
 3 files changed, 77 insertions(+), 111 deletions(-)

-- 
2.25.1


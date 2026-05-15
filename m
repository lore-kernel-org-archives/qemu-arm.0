Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F413DCD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 19:28:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNyCW-0001AG-FB; Fri, 15 May 2026 15:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <williamdapinho@gmail.com>)
 id 1wNvpa-0003qu-Ao
 for qemu-arm@nongnu.org; Fri, 15 May 2026 12:56:10 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <williamdapinho@gmail.com>)
 id 1wNvpY-0004xu-Fy
 for qemu-arm@nongnu.org; Fri, 15 May 2026 12:56:10 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so289735e9.2
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 09:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778864166; x=1779468966; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J2Enlths/eUd5QhHIfN949Lxdj1bjWYVyTCF5+VraFo=;
 b=luDAsgNcSdUlceeZkOmkNV301W8plqeSvWhDJHGt7H+PLN5xAK7H0+C2egMhviJcwO
 0d4MSXZbvWQL+hDDdobmjDArQcspXJKil8+ipMLBmdiIbTrF8TBsiFeR/VRskCElqMOO
 +4/FDXdGq/RLxv8gPMQ0rDlMFTwsSvJqaD/WFJGhzJYfpDlxAhgsLk39xtxOzMORIhgf
 Z2oAz/Pmv5ncfufmajr4rTH2AfXbFfcpuawaG5YTJwq88EW4QS10G7OhcfLY/cUK8nky
 b1uP4ZdKq/YQEgP5zsKRf0gVj7VlCJLcwEB9wm9VCgOx/WoOPdxCSwHOfYQXQNljAtJU
 wseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778864166; x=1779468966;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J2Enlths/eUd5QhHIfN949Lxdj1bjWYVyTCF5+VraFo=;
 b=UyFBJN61ka1B8FALPSOhDwykgeuTh6EbPP/nDzMOv82u+Dd3WRR8N2yRuipssch8Nu
 7yQj3rluQCswvE4EcKh4mhikL2EpPAfpkWLD3cmy1ivDkjL02ZV0AmDONwPZQJ0Kt0bY
 jZ4lSPnBRwTtlOigC1IcILcoZSujzoVMt5Hu8xk5Xt+p9jb+Yld3zu376qTXPvvRc6i4
 xsLRhHPL5oK2qw3UPthsXMIYGHXEmg86nY9e79pzCTYQk/pm2SoCqHB/pPsRAygWwCbz
 0r3DPzcQq0h0ey1PyY6cmwPcGCFly0BH+piHz13wH1En1QmO9iNyqmumf1nSYT5BcGjm
 9OOA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Fe4MuHiQXPj1pJLzp44rgaliOO93nC8/6vSVw9b+1oAbSeXQdRCgebpzubKlyBOEHDDp4T92jaA==@nongnu.org
X-Gm-Message-State: AOJu0YyMEMkSrD2AglLWTTIsByHEJ7i39sfveJKZ0wBP28mdfHkZooTX
 3gTPsyqHiadKAlRBuF2Wg7niGI3UquKaIMiIPTdfAWKkDkYPZx+K0bem
X-Gm-Gg: Acq92OGZTT4+SSlVYA107CNUekER3Ly0ThbfBT+E07wbAGJsxss3myjIzwK72pzjHij
 qQzC/yHkj4D4FlQA9g4o+2sVwB0yLT2vrKVdHp/jrCV4DKlVpCjhFG/mIwOEW4uwiUVUBpkjl9v
 vE+nebYvhDFrGuseA9/tPz7WBkCKRStlJVDrWAnYK9qLIZxMB3xMtA1xdRkd/cOX4Oy1P9YSMce
 absVsmuEf6UI42Fztf4H4AhMav4rzweo/GIrxe78XFEfgtcYW0oyCbqI4WfYlTT9TjQZ8617cHK
 lvPALe2Q0/ezSSRfNy29S2A4xvGdfJlsnMbdR1abQfE30+r5u5HY4ncGVd+1q4Ktd+WTqYZtb3N
 xv29IoqpgBEt68fd/QHuCQvI69AWHaLWdEE3Bf5B4Y/6n/ZKIjVRCEiqc4DUNVVf42OiWP3cBjF
 7vIM3wCPZYMh/tmU+9q0kZpnEGHXADIIED
X-Received: by 2002:a05:600c:8210:b0:48a:5c23:cab with SMTP id
 5b1f17b1804b1-48fe6322447mr63064365e9.19.1778864166219; 
 Fri, 15 May 2026 09:56:06 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:3::])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9adc2209sm14151347f8f.0.2026.05.15.09.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 09:56:05 -0700 (PDT)
From: William de Abreu Pinho <williamdapinho@gmail.com>
Subject: [PATCH 0/2] hw/arm/aspeed: add anacapa-bmc machine
Date: Fri, 15 May 2026 09:55:49 -0700
Message-Id: <20260515-add-anacapa-machine-v1-0-9765ce0b9426@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABZQB2oC/x3MQQqAIBBG4avErBvQIIOuEi3+dKxZZKEQQXT3p
 OW3eO+hIlml0Ng8lOXSokeqsG1DfkNahTVUU2c6Z3prGSEwEjxO8A6/aRL2cTCDw2IQQbU8s0S
 9/+s0v+8HOxZYeWUAAAA=
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, William de Abreu Pinho <williamdapinho@gmail.com>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=williamdapinho@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 15 May 2026 15:27:45 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This series adds support for the Anacapa machine type.  The first patch
adds the machine model and a functional test.  The second patch adds the
FRU EEPROM contents.

Signed-off-by: William de Abreu Pinho <williamdapinho@gmail.com>
---
William de Abreu Pinho (2):
      hw/arm/aspeed: add anacapa-bmc machine
      hw/arm/aspeed: anacapa: add FRU EEPROM data

 hw/arm/aspeed_ast2600_anacapa.c             | 362 ++++++++++++++++++++++++++++
 hw/arm/meson.build                          |   1 +
 tests/functional/arm/meson.build            |   2 +
 tests/functional/arm/test_aspeed_anacapa.py |  25 ++
 tests/functional/aspeed.py                  |   8 +
 5 files changed, 398 insertions(+)
---
base-commit: ee7eb612be8f8886d48c1d0c1f1c65e495138f83
change-id: 20260511-add-anacapa-machine-cf7076ab0afa

Best regards,
-- 
William de Abreu Pinho <williamdapinho@gmail.com>



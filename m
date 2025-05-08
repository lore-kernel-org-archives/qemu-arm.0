Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp294338njb;
        Thu, 8 May 2025 02:37:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVEFHs5c2Pi/gM+avFWLtXvdblqx6I45YcN41LHfHpHJnjWdlk7qm47PEV5aPN6AeeAjwlgd4TLnK7lOA==@linaro.org
X-Google-Smtp-Source: AGHT+IF49jJwq6wrxBsScaWzdkojCbVXn8IMmy4fWNI2FR/Xz2IRkMUqvPolZLr74etz2ivUqtYc
X-Received: by 2002:ad4:5e8b:0:b0:6f4:c422:53e7 with SMTP id 6a1803df08f44-6f5429b4e85mr109267366d6.8.1746696981397;
        Thu, 08 May 2025 02:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746696981; cv=none;
        d=google.com; s=arc-20240605;
        b=DD+gtxNaElrNQ4Jv4ayEK75OGin+q427x44ZHOL+WXGRKlboO5kk6TGl7vQV3lKCi+
         xBMMrBNqtpkZ/4vV/WZIOf+l7Pii4oUZNnD4ln1l7xZ+ulWb/APdNJylZLYb0LZ4uhXV
         3JWZ5x0ZLezvnHNAHXEhKb/VLZeellYmSjzK5JzTTxYBGHIRBi/4OmuDOYBrXIeAKqoF
         9j6eaLqzN4rxvFKWXpQLPdGOjZzDoYKImOfZDLFvjYe3CMlFlYsRxn/WC7WCQXBaVZiC
         8+wcsHmtu4zChsRxk9dAynpPd95Xx/R93nDUo3kMLBlphwM8ERMiZW19ma/UZCA3VWGd
         CQxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WpH/ZN32ovUa5G4XkDVgS1Uy4dkkEZsYAGNk5QPQgKc=;
        fh=cp5/pjrGBiOSnVnIYR1qYu8cyK1vwqycjiVaN+zSIMY=;
        b=S5XQj0SJcGc1FzFPw8WZK8zMrUuisd1dDGqc3ZVWMxAPWG8Wj2vyUz6aPZ/l5iVVc2
         BOhEVK7MdBFoLZI4tzVCu/Cg3EQmb1nniLUn/LE//zEe/WrmHjgiuD/0r+bWviSqBK1a
         agWboTGzwxkCUpbu5EFdv3BQfrn0savoH+l08X/Lc4TLVxc+t7/+0mxOt14yloQWVnZz
         O71Wy9a/SflsD6SfEejWrp1M5ITz/aI7CUFBk1WjiZ2VI8fMDlKvUnDl381RerE/lUsr
         KMNi+j8kHdvXzI5qfNlxzNiS1toqDPek2wUo2l+lCrXUT2/gp/EPKCuedUYYL82rno0/
         2ILQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KT9801BV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f54291a7e0si39209386d6.479.2025.05.08.02.36.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 02:36:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KT9801BV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCxfU-0005PI-8l; Thu, 08 May 2025 05:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uCxfS-0005OH-1b
 for qemu-arm@nongnu.org; Thu, 08 May 2025 05:35:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uCxfQ-0007ls-6x
 for qemu-arm@nongnu.org; Thu, 08 May 2025 05:35:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746696947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WpH/ZN32ovUa5G4XkDVgS1Uy4dkkEZsYAGNk5QPQgKc=;
 b=KT9801BVj+lIBV1xk34nZuk/IUesEG/4H+GjDIcNSJSy9OoH3WAJQ5fix561M45JJOUJVg
 U47YQqAM8rOt/nQ56DUX41Cy1GidXuoNkFZvUpieLO59n7vTeYepIlxJYgvZLOgC6I6LEe
 tk/U4m24UOwCx5MDG1PYrvY97MDDAYs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-92-ETAioxz_MeCwFS90nXw_2w-1; Thu,
 08 May 2025 05:35:40 -0400
X-MC-Unique: ETAioxz_MeCwFS90nXw_2w-1
X-Mimecast-MFC-AGG-ID: ETAioxz_MeCwFS90nXw_2w_1746696939
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 31E651955BF2; Thu,  8 May 2025 09:35:38 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.200])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5A0D41955F24; Thu,  8 May 2025 09:35:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Brad Smith <brad@comstyle.com>
Cc: Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 3/5] hw/arm: Compile musicpal and the xlnx machines with the
 right CFLAGS
Date: Thu,  8 May 2025 11:35:17 +0200
Message-ID: <20250508093519.144004-4-thuth@redhat.com>
In-Reply-To: <20250508093519.144004-1-thuth@redhat.com>
References: <20250508093519.144004-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dnMgwv5kuJU-QEQcbnZOpNzr0mKTXtceloMHyxqMkcc_1746696939
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.414,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: exx8FbhETEmf

From: Thomas Huth <thuth@redhat.com>

These machines include ui/console.h, which in turn includes the
pixman headers and <epoxy/gl.h> via ui/surface.h. If these library
headers are located outside of /usr/include (like gl.h on OpenBSD 7.7),
we must make sure to compile this code with the right CFLAGS so that
the headers can be found.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 5098795f61d..51d0c055abf 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -8,7 +8,7 @@ arm_common_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
 arm_common_ss.add(when: 'CONFIG_INTEGRATOR', if_true: files('integratorcp.c'))
 arm_common_ss.add(when: 'CONFIG_MICROBIT', if_true: files('microbit.c'))
 arm_common_ss.add(when: 'CONFIG_MPS3R', if_true: files('mps3r.c'))
-arm_common_ss.add(when: 'CONFIG_MUSICPAL', if_true: [pixman, files('musicpal.c')])
+arm_common_ss.add(when: 'CONFIG_MUSICPAL', if_true: [files('musicpal.c'), pixman, opengl])
 arm_common_ss.add(when: 'CONFIG_NETDUINOPLUS2', if_true: files('netduinoplus2.c'))
 arm_common_ss.add(when: 'CONFIG_OLIMEX_STM32_H405', if_true: files('olimex-stm32-h405.c'))
 arm_common_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx.c', 'npcm7xx_boards.c'))
@@ -34,7 +34,7 @@ arm_common_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'
 arm_common_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
 arm_common_ss.add(when: 'CONFIG_B_L475E_IOT01A', if_true: files('b-l475e-iot01a.c'))
 arm_common_ss.add(when: 'CONFIG_STM32L4X5_SOC', if_true: files('stm32l4x5_soc.c'))
-arm_common_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp.c', 'xlnx-zcu102.c'))
+arm_common_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: [files('xlnx-zynqmp.c', 'xlnx-zcu102.c'), pixman, opengl])
 arm_common_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal.c', 'xlnx-versal-virt.c'))
 arm_common_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'imx25_pdk.c'))
 arm_common_ss.add(when: 'CONFIG_FSL_IMX31', if_true: files('fsl-imx31.c', 'kzm.c'))
-- 
2.49.0


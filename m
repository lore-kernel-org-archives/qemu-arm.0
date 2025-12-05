Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E675AD33994
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Dec 2025 16:42:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vRYsH-0005ZN-2t; Fri, 05 Dec 2025 11:41:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vRYsF-0005Y1-5M
 for qemu-arm@nongnu.org; Fri, 05 Dec 2025 11:41:39 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vRYsD-0005lv-5Z
 for qemu-arm@nongnu.org; Fri, 05 Dec 2025 11:41:38 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-42e2e08b27eso1032179f8f.1
 for <qemu-arm@nongnu.org>; Fri, 05 Dec 2025 08:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764952895; x=1765557695; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jXbBYub2MS8i04tvqhtIXtF2IbcS7oxTb9sSEv4XHCc=;
 b=nwskXBlB7Ue+un+rNBPEO2PY/9p4kZyHvXB7VV/uQxOGtRkcLGWsrOQ7IgM1KpsOys
 lpulKR1OPyRbj0iKaF5GR4c3ajrM9AzrWkITgvy4v0J8BWmAD5svnmiWVJEkM15IKofX
 qCmNZzXO5PD5HSBAvnsXKwcPbZoMOVNknkrT9p8EifYzc+tSDMO26Jb6TYeuLppJ6NWB
 ud4YLXNDuJ/TOSwnYzstw45wwXOgpOj6Q5uvtIwS+PAy7NlKDiVY+FtaMsn5iwKieEdA
 Khe12NO+8jgHJWh0/r5IxibW4ZpZXAxQFDiRDPX3s6Vx68iLSp1284pDDmRPhNKTZUWJ
 GD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764952895; x=1765557695;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jXbBYub2MS8i04tvqhtIXtF2IbcS7oxTb9sSEv4XHCc=;
 b=T+UVzw7mvASaVzJeRIzX+NQ9Kl49W/jmRkrGMVSbeXoC3tYHovLjpSgnP81oMPFmDd
 YWXl0J4NUXhJrYdZowfMthQF2CENarjxAAF6SPyj/LhdmFxFiCmBvSHHoObI3sRg7lpI
 +G9IJPq8B+e/m/cVmvBa8buHFg2Cd7RaVRSPvx47GroEbYP0TX3lOGkZyfPGL3RgjXrg
 4l+GDVRhIX4xdqCJ/Sq3UDdVxc4Wvs/1p1c2GOj6xrQyd/POqmM1BaVVaKipbzgJn/+1
 vvF/KVfD+rTLCA8uo3CUI8C48j3KXDsGlGT1m4usjnRgQDDSZ9UhQGskO6zIQhRc/tf6
 YFzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY45V5nggChnzwYti0YjNe07thFs+Ni0hfBRzJ4yMPMa2iS0ukJbJfoxC43hPIxPChm8xiG3VuTg==@nongnu.org
X-Gm-Message-State: AOJu0Yz8t+NdH1WbjZBtx5IMlJHsWTvgbFgFxe54DXPp3Nttn8Y8/mRa
 PHXmZSC3pafR0wwhTxQqhLyQeEECCFkTMjGL/dtIKzWqvwlLIPeqfuFemfuPFKkj8mw=
X-Gm-Gg: ASbGnct74LuoYcwv40az21yLX50zgqRP0OFRmYvn5leFBvWMAFNxHdsz2VBmzfA34qi
 i4EcPoIes7cdD4kJgMd3R14vLj+iAUe/aufSRaXO4iacRs7f7JC8eT4DjqCLnNkeiKRD0+DL8N+
 MKjSA3tGIQ0iwrEbhqILOwMJKUz+vkMz9KTaUVTBgTqjdFXKp4GrqZC2VY9niHmXCNLuyam993l
 2SZmifByIN3TYsJWYTQXGYopko97MEca4zM87chzI4pkfx/f4C91FIMrAHnALUnKRrI7lslLIDE
 xXWtlP/715znUMmaKi3g0DdUaye0bikiuIVu1ZKa5/rpE+JhYzobAn9HIYlaPbDX+aBVtIs/6wf
 09t/z3GffT4OaTJJahaW108Qo4rWRzJIFp8SUpfgNVIJ7b1UfiRU1LaJaUHZ8jAZz4X0NvWDTWY
 xlvva20dji64SOADJW9yzGyg==
X-Google-Smtp-Source: AGHT+IHf2FwZnc/OHJ4ZHn3xusttHovu+yJwJSTuCs2ZDPAJDIjSaOyUY/wU0+o1hTxu/5rE5wAAzA==
X-Received: by 2002:a05:6000:40c9:b0:3ec:db13:89e with SMTP id
 ffacd0b85a97d-42f73174445mr11481885f8f.7.1764952895223; 
 Fri, 05 Dec 2025 08:41:35 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbfee71sm9475639f8f.15.2025.12.05.08.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 08:41:34 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4D7B05F915;
 Fri, 05 Dec 2025 16:41:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 devel@lists.libvirt.org (reviewer:Incompatible changes),
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org (open list:ASPEED BMCs)
Subject: [PULL 14/14] aspeed: Deprecate the fby35 machine
Date: Fri,  5 Dec 2025 16:41:25 +0000
Message-ID: <20251205164125.2122504-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251205164125.2122504-1-alex.bennee@linaro.org>
References: <20251205164125.2122504-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Cédric Le Goater <clg@redhat.com>

There are no functional tests for the 'fby35' machine which makes
harder to determine when something becomes deprecated or unused.

The 'fby35' machine was originally added as an example of a multi-SoC
system, with the expectation the models would evolve over time in an
heterogeneous system. This hasn't happened and no public firmware is
available to boot it. It can be replaced by the 'ast2700fc', another
multi-SoC machine based on the newer AST2700 SoCs which are excepted
to receive better support in the future.

Cc: Peter Delevoryas <peter@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@redhat.com>
Message-ID: <20251126102424.927527-1-clg@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 9386cffba26..ac31a2bce42 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -308,13 +308,24 @@ I2C devices connected to the board can be defined via the QEMU command
 line.
 
 Arm ``fp5280g2-bmc`` machine (since 10.2)
-'''''''''''''''''''''''''''''''''''''''''''
+'''''''''''''''''''''''''''''''''''''''''
 
 The ``fp5280g2-bmc`` machine does not rely on any specific device
 models, it can be replaced by the ``ast2500-evb`` machine using the
 ``fmc-model`` option to specify the flash type. The I2C devices
 connected to the board can be defined via the QEMU command line.
 
+Arm ``fby35`` machine (since 10.2)
+''''''''''''''''''''''''''''''''''
+
+The ``fby35`` machine was originally added as an example of a
+multi-SoC system, with the expectation the models would evolve over
+time in an heterogeneous system. This hasn't happened and no public
+firmware is available to boot it. It can be replaced by the
+``ast2700fc``, another multi-SoC machine based on the newer AST2700
+SoCs which are excepted to receive better support in the future.
+
+
 RISC-V default machine option (since 10.0)
 ''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
index 70d3a99d79e..e61a6438fef 100644
--- a/hw/arm/fby35.c
+++ b/hw/arm/fby35.c
@@ -175,6 +175,7 @@ static void fby35_class_init(ObjectClass *oc, const void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Meta Platforms fby35";
+    mc->deprecation_reason = "For a multi-soc machine, use 'ast2700fc' instead";
     mc->init = fby35_init;
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
-- 
2.47.3



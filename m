Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29EDC5DF87
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 13:26:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxPFv-00022G-4v; Fri, 21 Aug 2026 09:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wxPFt-00021x-Nx
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 09:25:57 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wxPFs-0006O7-9v
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 09:25:57 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-47f71156e1aso423806f8f.3
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 06:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787318754; x=1787923554; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7qgF4ndg7sYDk4YXCCPDuz+kgVI3CZtZ6ulD+Vgtriw=;
 b=hFIWdvr9TJ3RaJc/rq5JzLYA/8cXqwOgn9MxYNhIQLfFSQ+071NlkMJcQZSzFxp9mp
 IQHzlILbLma8hD787RQ8HmrtcLqNmCacMIY2P/zEEeEnM+XPqzDS1x/erxGzvqNm6Gpq
 6Gp5XF1VpwpnA+xF/fLAAv/kD57yHTHbANaMNylczOg0tWW7Dg31Y/GQzi1K6Eo78IrN
 eApa7E/fjbPcLvfJGyCHIEujk14v0ZaCqZ6WGJfgRwAPrvV6MkXkp2JpLBh0GLXfQQdR
 JZxcfHM+L9XjiYFSacxG1EKMLx5P/ql4CNTq9XZUFxQRikCxOYdwGp9UC7lFsKAASLgo
 WEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787318754; x=1787923554;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=7qgF4ndg7sYDk4YXCCPDuz+kgVI3CZtZ6ulD+Vgtriw=;
 b=tHcjk3qGiGPyIyn/qVDzFWqU0STwmz1Sjn4Am0B0kNZxRo1nuceZpicbK4JkLspb1b
 Sz54bEmby1XHMiy4bjOiZhTVZF/iC/6lHF5C1pmJUYsdWWuOGJqZyIEZRdwkubsbeBi6
 Rty7rQrXZxTTY8cU13Em7Fhd2G24HxKoGmeaYsgzJaJ3YR7dK+BCcAnrsw6EhsmvVgIH
 9cZPh22M2MinkEdB2O4hzPMtjkRXnbiF87YqeEf3HqHsoAF3KETPJ7JOze6kWAE3XLMM
 wonRGrNPPxpvW7hE4tiSmRC1HWs6wW6MXKHtqcQVwWndEU+bG/rC0uQOmx57Qs7LOjUG
 5hew==
X-Gm-Message-State: AFuF++n13sBI8H7oWMQTu/yBFRQ6ItfWcpOfiZ23ZwKIwq93HyIsa1nz
 CU1YmDPO255qduO/XWeYGyYt8POtltz/IFVge5b4RJxt7dGZnGS9D2TJggeoyyzvQionMatylkb
 qKaC2k9w=
X-Gm-Gg: AR+sD10QrEcdMyejQXO9b1OiiEwQrJlJQsenxwzeTxtgJp1bzOOFcuWrgd+MxOMm16I
 dutKa+7AzVRA3NFNvYlsE4Sxm9I5GRJTaYtDVpgWzz/vRUf4IMRaxikQKnz8fGrRiUcXLqN9FeV
 sOrY81QqWVULXnEVlWPriSko6unKlIYyt15eM6z4hf3l0msiJShAYr0rw2jRuhzNJOUYt/oHkw9
 sTye8OgFRFljjLio7zSBYOiErKJpkTLB4Bf4WZP++EHaWsSOO1Yl0f7Tjy2Q+T2zRYNNbvD47tM
 h0ALT/yzjJrIGo6AdZvjzqG1uTE3t9KW/b+kCZML2+N+BmyigPenFknGM9QDVdBzoqHGKuMXu+s
 A7Wl3frcp6AzKiR18i1M3D5B06+EJa0cg1mGFjAuU+HvbtNkwkEsdNC0nXQLMpWAOx0MwYW7pKN
 5nuZi7TFcOkkasmYG9R8vxfdqkVMSWAqXPL3e4oeLJ9W2NfibG7LiQd/TTl88bdOygK9/5k7WpH
 zFI+sN1jm0LB/2We8MiRQtL7o0e5b7lunJfvY72Ssjqggz+8WB/2xTczMENS7Iir9l3Zg==
X-Received: by 2002:a05:6000:2310:b0:482:a8b1:aa6d with SMTP id
 ffacd0b85a97d-482c0b83793mr9459964f8f.10.1787318754525; 
 Fri, 21 Aug 2026 06:25:54 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b1450e54sm18770327f8f.11.2026.08.21.06.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2026 06:25:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/arm: UNDEF various things for pre-v6T2
Date: Fri, 21 Aug 2026 14:25:47 +0100
Message-ID: <20260821132550.168896-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

We were missing feature checks for various parts of the 16-bit Thumb
encoding space, with the result that we didn't UNDEF when we should
for these on pre-v6T2 CPUs:
 * CBZ/CBNZ
 * IT
 * the "hint space" (which doesn't become NOPs until v6T2)

This patchset fixes up those mistakes so we UNDEF when the hardware
does. M-profile makes this a little more complicated, so the
precise test is different in the three cases.

thanks
-- PMM

Peter Maydell (3):
  target/arm: Make CBZ/CBNZ UNDEF before v6T2
  target/arm: Make IT insn undef when not present
  target/arm: Make Thumb T1 hint space UNDEF before v6T2

 target/arm/tcg/t16.decode  |  3 +++
 target/arm/tcg/translate.c | 37 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)

-- 
2.43.0



Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58832606A33D
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 07:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=C8Tt2mAc
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xPE7o-0002vo-Iu; Fri, 06 Nov 2026 02:12:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1xPE7P-0002jZ-2s
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 02:12:16 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1xPE7M-0005yh-29
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 02:12:09 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-48e10a70540so187451f8f.1
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 23:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793949126; x=1794553926; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=WRji7UmjJy3c4hMRrNh8nVsw1hZiEoPReY28Rg+tBlA=;
 b=C8Tt2mAco1ar7auCzG8ZjnLLxboNjOr8IEF1yZGg3wky5GbkOd3uFQRssb8+CcV4SD
 65Fws7p4zUpB8BIve4IKz7SfmYxcD2tYY5LsyGHDkZKnUl0Bvfg7T6QN87Hgw+zr4XGS
 HL8UD1kSnUaIDd9D4rgFyI5CJGmQ7La7bJPQsFzY7Ee+PcvR4A2MbeoDL8/huh4t0sIX
 /3B67zTOgZuHaIb36/OPb5U9JvcBqN8x22vclhMoLD8KY7kvev66UJw7C6Rvhv1d4ngf
 BfwKhZ8lq3Zm5hsjW6eqCE3+cS6Cbk4Z29mT9hGBEsycHMqIlMRQBnTDPLkIDcyNhOd8
 XNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793949126; x=1794553926;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=WRji7UmjJy3c4hMRrNh8nVsw1hZiEoPReY28Rg+tBlA=;
 b=S5qExbi+W3b7l6BfOxyxbPv4k/LZz1Nb9bWFdkbzhG9bMQSRshooJCO9S9+XYeMrYS
 NTG9ZXruwKQuBpP8YsK75/09v1XEAOqoiNe3KgVXT33O3eINZ/JsGJTllPq/xDFmC/yi
 UIiDgWyrWIu7m4eYF3G0sYy9Acjt+dSqh4gogT14sILQ0S7J1gf7gz63QIu6oBJWxozr
 CskuKeCSfywKXTNESkPvKKX2zZ01czG9AASTIJHwzTe5XJhV81+PH5RxGHh+cjDCp22r
 SHAyfKoypwJEqI/+4yS3MQLapNqUrzxp+kuciAD3Apc/TYHnO0CLsk34nZ89uDtCTXJe
 is+g==
X-Forwarded-Encrypted: i=1;
 AKwUvByYPtRqrHC19mR9uUywfMM/P9ibZWr1xoTa/45CRkkRFAFIf7os9yN4Vkg4/gsefWCm2yhucZFR3A==@nongnu.org
X-Gm-Message-State: APuU4Z/I+2oZaj2biRuat9fJ+eXhb3DxqM40DYLBjMJrDYSKL4n1wbog
 HrcC3JOOEnaTpkAlrAfYj3KQHRi3tdpVsgUhoaM+isIKzQJGN2gsS0FBEzFMwxqVrRs=
X-Gm-Gg: AYBFou1iVRsBGQEuDP0SiwwBfr4m1sSiwWjBJLlu/E65lVl/VHEV8oIvE4rynJgN9Hw
 IwDTQwdrlj3D6tu92ef6iGRvS1CYmqgf/dDxstDlYrGY9HWU3rcKLz+dJURyCsSFCwemqEl6QUo
 70UtBxi05W3Rd2KNC75Cmq4pM0gW6cWflMe+6tnm4+pAc3iEalWVZdWVGpukOIDOy0bgOVm/SlM
 Vm3qRct9pnJtQAl8T3Dpy4R1cxJDSHV9NMAqj25DL74OdVMS1K/rKxMYYflfnnpsqCHYndZI2bD
 qgQUkvfvpvL5m9d8keG74IHrR+HyNM7Wqa5UNUwfImpTavNkYHuYVrqxF5ONCFygtAF4keSJ/m5
 Z+lwcfc2wk/wYuJ9WkEr3V0NOpEVjIlXG+gGJ8w7JDZ+JqqXsnPRuFFI6ioW+zsBO7OTFe5leZg
 3aUAbMvytblvvGb93/G/jjnxqQkEGWfdUa5ApPgudAFhZthxRCsXpFY7X+rePMwGH1iTDJbHOck
 6Qb7TygL/E00wFpZn5DdRZFj5UuVS4+EdHKChN61QAZcCz709GfIPV0VzQ6Q4UkiFCcQUzShJnl
 rLPJabullVaeaZM1SEQARoJmd0lpOTV/OcPFMinwrxX3f26H8rGs99DJ2r9sWmJ1Nzao/+JAg8p
 +IAr5PQz+VPXiIMChZu/iP9GxJb7TLGsyrFlgs6shgdgabHE1Ud+QdqmipKK24hkr+QP+8ahwyW
 LsWbXTJ1DCmb92asqXLMu2CDhZPfQ=
X-Received: by 2002:a05:600d:82f2:b0:4a3:7344:13b4 with SMTP id
 5b1f17b1804b1-4b6df3fd27dmr27010305e9.14.1793949125990; 
 Thu, 05 Nov 2026 23:12:05 -0800 (PST)
Received: from satan.lan ([94.66.192.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b571f46489sm113916495e9.3.2026.11.05.23.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 23:12:05 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v2 0/2] gic: read bpr from property
Date: Fri, 06 Nov 2026 09:11:59 +0200
Message-Id: <20261106-gic_read_bpr_from_property-v2-0-9f096cce4814@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL997WoC/43NQQqDMBCF4avIrJuSRKq2K+9RJEQz0YHWhIlIR
 bx7U0/Q5fcW/9shIRMmeBQ7MK6UKMwZ+lLAMNl5REEuG7TUlVLyJkYaDKN1po9sPIe3iRwi8rI
 J2TTaetdX0peQA5HR0+eMP7vsidISeDu/VvVb/8quSihRY13ede9dqVX7otlyuAYeoTuO4wvCo
 Om+xQAAAA==
X-Change-ID: 20261105-gic_read_bpr_from_property-0882afdb60f3
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1013;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=yEfXko898Vvy3FCDucEdcaVQK3S/O0dbAKvW3BRvMoA=;
 b=owEBbQKS/ZANAwAKAXcpx3B/fgnQAcsmYgBq7X3EAbqwVpGOIVaM5wc5MvQofG80xPGmUCqHX
 iJnVt7RiiKJAjMEAAEKAB0WIQTMXBtORKBW84dwHRB3Kcdwf34J0AUCau19xAAKCRB3Kcdwf34J
 0OlND/4iWfGRfHBvDOYl87mn6gI38bSKNhSGK2+4DKMIMjuc2rBpQThcFMMU+IOR7Z/28hzIdkh
 I4dcJlbSZJtn0WjeqRi4uk4VNRlR0qk46Ezc5cJxWNNHGd8F9zlTkDzzfJl0q4MhR20jUdH5V5B
 FYO0t3KO/uWYvN1uCIG0LiPDHF6pqivoBcOUE02xDjAYJFJBRTrtlUUZLzI8Winkk+9iLO+2NNl
 hmF9YTSHMyZm3ZgsKO7auOPgvcJ/5Jq9yEt8Q6HoFWWCbteffMWbNihcsd0sUZe83+jfFTA0Bel
 a647aX2MJn836uAgGDgB7rPhnV+dmLJvl43dOyqYOvsV51dEr1J+AjxtWXp9t40HkVKjD0gduJg
 OfkSdbOEdMo5o1rvDWt1BiqCAjUphwxOjKokTzFvIa0+J0ChxT1ygylFX266Jd4ZRyDQlPOGSUR
 jnnFAc4D3YTOL0JV53e1UQ1vR9+/aUtydIXg/dAGsCBvQbxzoiSYs2iVklltzukspmt00aqBbHb
 kBL10P8+HFKdOQ9hlBOIZV6vv8fN7w+NmqgP93oayJPSbRA7Ks3vwb1otyBhVhXSBnz/jUotImK
 TXt2icFJ8QZPqEoCMVTdH0/IeoSDHrb1JmqvUhMpcH4XeaNbrmtYdnYqd3ouUesRXwOWCdQfewp
 OszAvBP1ZzBecDw==
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x42b.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Calculate minimum binary point from the num-priority-bits property,
instead of hardcoding it.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
Changes in v2:
- Moved GIC_TARGETLIST_BITS back (thanks Peter)
- Added an additional patch suggested by Peter
- Link to v1: https://lore.kernel.org/qemu-devel/20261105-gic_read_bpr_from_property-v1-1-7e7392bfd321@linaro.org

---
Manos Pitsidianakis (2):
      gicv2: do not hardcode minimum binary point
      hw/intc/arm_gic.c: move num-priority-bits check

 hw/intc/arm_gic.c                | 24 +++++++-----------------
 hw/intc/arm_gic_common.c         | 14 ++++++++++++--
 include/hw/intc/arm_gic.h        |  2 --
 include/hw/intc/arm_gic_common.h | 18 ++++++++++++++++--
 4 files changed, 35 insertions(+), 23 deletions(-)
---
base-commit: f29ccc287a6cfdd51d3a4fd17fbe9af3310a0ac5
change-id: 20261105-gic_read_bpr_from_property-0882afdb60f3

Best regards,
-- 
Manos Pitsidianakis <manos.pitsidianakis@linaro.org>



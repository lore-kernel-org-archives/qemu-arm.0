Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859FACA0EEB
	for <qemu-arm@archiver.kernel.org>; Fri, 22 Aug 2025 13:54:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1upSD9-0005lH-Vz; Fri, 22 Aug 2025 09:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cjchen@igel.co.jp>) id 1upO1K-0005Zh-UC
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 05:25:15 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cjchen@igel.co.jp>) id 1upO1F-00077S-Vs
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 05:25:14 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-24616482efeso7699995ad.1
 for <qemu-arm@nongnu.org>; Fri, 22 Aug 2025 02:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20230601.gappssmtp.com; s=20230601; t=1755854707; x=1756459507;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zCby+eLrg4GAHoTlGaZ+HvxqNUEpTOhGwkTAgVF2XVQ=;
 b=smxz4qOjekaPlYatmjCZX2+1yw+qAm94ZfmUiUPcX/WHVhSgyqKf+by/sMgJkBSeCv
 U+qp4xqfXgCTmXQix+L592Zlb2LwcJDwiUOEdJQ3gcT8FG/sO2ha/7wWxrzEkrQr5f23
 UP+riUrwkxrJLTE1ubbrHwhEZX2LssEd22KLjP24bJmpVjmYvFm1lLCuvKbJamoOirF/
 xLoAbWg4HTQJ8fIShFRkQ7tZhn7OCQeeJPc5LofnQFD9g+uEejzPZaW/kk30zO5E504/
 5dWyQ8RXMo0wVN7IJ0sNrddkST75BpW529zgk41lAfBths9vOMPpWQZbyRmIe3BpKrUE
 7fmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755854707; x=1756459507;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zCby+eLrg4GAHoTlGaZ+HvxqNUEpTOhGwkTAgVF2XVQ=;
 b=ibD7808ZsY6AXAoSaj4X6/s6ChOqVy4aIcnMdzSvoqFxndcg/Lnmg8pFoc3uGNZawB
 Tx6vvKVVZ69QjtIe7hORyoRO4x4efLbzVFHCzwMKef8Bn9FCsoJ/rvFpV++sQtgeFPYs
 SjIVyqyKMq3c9DF5kCkqeREceNILBDCPH4NGD68AQkVHH3u2yFUadLvchq3ACXxZNlHx
 XpSNUHC/uG4Gq0IGI0MjLCRLoGR7Ni2KustRSDXk4QQYvcRo5zoOueRzy3OuTEDiPd/E
 qRz03MdtUA4PxObz+qHYJwCs9z+2GaGyxJLoYe2Pr25iqg9KowAvu9HEsK4RgU+XyIhL
 mM0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZd+hRAT/0s2N9TcrMp0jTrcT/pEqQJyVXBhlHMA+Cs+SZDZX50RDW4ZQNPPa6KH96GWrtRIfAeQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy9DTFORNGzyBeXpfrkyCLPKP/CJEQ/RQrfCDsXtWtYHrfrribz
 QIDUqzcc0sliiGm6vhuKjIPAEJmF6DWvR916SxLG51/qwNgrfyPmoUbx8B+lJ5EcA1vzdE805KR
 iuOYthMo=
X-Gm-Gg: ASbGncvDt+eloOUBU41uZU5zB0QHn8Bm82ahvBZjvo76DilvdGBm2Z3oFjd0Q4eq/G/
 2VRwJY7IVpz47YTrwu17LTRcZ56kCUEU5ChRqdzBzoqisl9CMFcqXO2G6GRQUdRMA5iq3ldBgpU
 d9U8dlaxrHKBt+uZXW49zxVP69ST9fw9OybZtGiBh8m+2O1POjGfMalPlvx0k+3Lq1kxTx4tV9J
 5QNHsMowithOtu+ZUMahi2mhQDmtliyWUKG5mLxzXjhI7gesHBhBiR32otS6ahE/UUvhtKgZRx2
 BHa0GF7v5++185LLu28fRhH539UUhaj/GrDfOcn7y5Lyp9rrZHdcSvqFMOPfoMJiGJe0L//E0Go
 Ak82Hfz87WfOqd3T8l/HLKOBx883gMkTh8g8Ekua/vw==
X-Google-Smtp-Source: AGHT+IF0Xwuu5LZYmRduWk25dRQ4N23vj9IjGYBGoJ9IRke8ciqE9vsRzsdrjU7wgvFYWKAZPSqDoA==
X-Received: by 2002:a17:903:1ac4:b0:240:66ff:b253 with SMTP id
 d9443c01a7336-2462ef93318mr30091655ad.46.1755854707455; 
 Fri, 22 Aug 2025 02:25:07 -0700 (PDT)
Received: from warg.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4c6fb7sm78560215ad.89.2025.08.22.02.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 02:25:07 -0700 (PDT)
From: CJ Chen <cjchen@igel.co.jp>
To: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Jesper Devantier <foss@defmacro.it>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Tomoyuki Hirose <hrstmyk811m@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, CJ Chen <cjchen@igel.co.jp>
Subject: [RFC PATCH v2 1/9] doc/devel/memory.rst: additional explanation for
 unaligned access
Date: Fri, 22 Aug 2025 18:24:02 +0900
Message-Id: <20250822092410.25833-2-cjchen@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250822092410.25833-1-cjchen@igel.co.jp>
References: <20250822092410.25833-1-cjchen@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=cjchen@igel.co.jp; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 22 Aug 2025 09:53:38 -0400
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

Add documentation to clarify that if `.valid.unaligned = true` but
`.impl.unaligned = false`, QEMU’s memory core will automatically split
unaligned guest accesses into multiple aligned accesses. This helps
devices avoid implementing their own unaligned logic, but can be
problematic for devices with side-effect-heavy registers. Also note
that setting `.valid.unaligned = false` together with
`.impl.unaligned = true` is invalid, as it contradicts itself and
will trigger an assertion.

Signed-off-by: CJ Chen <cjchen@igel.co.jp>
Acked-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/memory.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/docs/devel/memory.rst b/docs/devel/memory.rst
index 57fb2aec76..71d7de7ae5 100644
--- a/docs/devel/memory.rst
+++ b/docs/devel/memory.rst
@@ -365,6 +365,24 @@ callbacks are called:
 - .impl.unaligned specifies that the *implementation* supports unaligned
   accesses; if false, unaligned accesses will be emulated by two aligned
   accesses.
+- Additionally, if .valid.unaligned = true but .impl.unaligned = false, the
+  memory core will emulate each unaligned guest access by splitting it into
+  multiple aligned sub-accesses. This ensures that devices which only handle
+  aligned requests do not need to implement unaligned logic themselves. For
+  example, see xhci_cap_ops in hw/usb/hcd-xhci.c: it sets  .valid.unaligned
+  = true so guests can do unaligned reads on the xHCI Capability Registers,
+  while keeping .impl.unaligned = false to rely on the core splitting logic.
+  However, if a device’s registers have side effects on read or write, this
+  extra splitting can introduce undesired behavior. Specifically, for devices
+  whose registers trigger state changes on each read/write, splitting an access
+  can lead to reading or writing bytes beyond the originally requested subrange
+  thereby triggering repeated or otherwise unintended register side effects.
+  In such cases, one should set .valid.unaligned = false to reject unaligned
+  accesses entirely.
+- Conversely, if .valid.unaligned = false but .impl.unaligned = true,
+  that setting is considered invalid; it claims unaligned access is allowed
+  by the implementation yet disallowed for the device. QEMU enforces this with
+  an assertion to prevent contradictory usage.
 
 API Reference
 -------------
-- 
2.25.1



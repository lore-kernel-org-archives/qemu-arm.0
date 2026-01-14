Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CFAD31A25
	for <qemu-arm@archiver.kernel.org>; Wed, 14 Jan 2026 08:35:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfwLi-0008VV-16; Wed, 14 Jan 2026 03:35:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vfwLf-0008V6-BI
 for qemu-arm@nongnu.org; Wed, 14 Jan 2026 03:35:27 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vfwLd-0000VJ-Oq
 for qemu-arm@nongnu.org; Wed, 14 Jan 2026 03:35:27 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-42fbc3056afso4866747f8f.2
 for <qemu-arm@nongnu.org>; Wed, 14 Jan 2026 00:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768379722; x=1768984522; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i8UvDsIKv8ncHB1APuXS4hiPJNqWLucIdun2VF7bmx4=;
 b=hofXTtdOAyhrOgdz63aJnrODWSchZGelP7g04Tkoj030hYo0/BnTP964Mox4Zqr14d
 zGehhoRHkt9ufcth7Q9apXCU9Uw20Wy3HrweIPWhBRITF3JydWQ4AcT22zAWi5q9fPpw
 nDLQcCQnTKds60P1rM6/QPJC+ZPcMYpYoCePmsME42zO+ljb8SpfWnEZJVioiLLJzjua
 hEHv8Z6Ck4aX/hgwl6nYiCqlR18Ttg7bwjUIf0KD9nUzcsoY6e8D47Gz2ItfZFLxtwhI
 zF5q0HbD99EsycaIneoS7bl5Qtd5oR6lPdCvAIR5FsT9zNYZX7iZeRQknqM4HSNbLOQK
 u/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768379722; x=1768984522;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i8UvDsIKv8ncHB1APuXS4hiPJNqWLucIdun2VF7bmx4=;
 b=BPNFGiX8fAVU8wtXfWyKJRAdedatDO1IeFtv0NzQhlRcLHb6X2DBt19zCBKn0zfiWS
 eHrjBKx3Qf9bByqfy+YcNscfF9rXm/st1mRXoslXQJcPhFAO+8Lm0jbmYFIDQnKsO2xk
 vI5UhTkHI53f2DcXQiptox/csjIuUei9Uc+DOuZTl68rmZuT0lnwT2MJCmM3bAXMcsVu
 64SVuq2dfiVGiBdWc5Hpu2j85/qYQovw7FtDM4hFXVppyHLKLKEP/te2bghNmU1keu0+
 9avNlGgMQGhLtMcqUKFoiW1uiamlWMbrTWJuIEIF7rbBA/rJiKyJKcuQ1nD55F4hNjk4
 m8IQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmEdgyWmO+Gzi91DI1rxpdoovuY7iZ/jykfifu15pmv15p2NR9HSFdpGh0S/y8zTo9g6lc5I5t+w==@nongnu.org
X-Gm-Message-State: AOJu0YwPMNfmOXB/HbspNCRYsI/GJkJs2YYTprEkKdGsiuRKwhifahup
 QRCKGJRwdmXED137p5f/PV+nPYhdDMiuGiVIiXOhIGecxZjd1wnnJi/9FAAEQr43NH8=
X-Gm-Gg: AY/fxX5lXgnB//I5fClRwJVthfxWjlG18T4LxUtVm5KZVPw4b7tDJlarCjigMVbnIk/
 uvdIPM9QObezs7WJ771M8jcGjd5HPZ2FTibc9JoMhlBnfgiA+OQ5haT6pdsmOgfXiuCuyetObmf
 baznhMs4YID9oGASccR8oqlqxYGS7kYkwPrsslLqrph/9IRsjrHREjbu1eOHUBXsOyC32DExqHZ
 +IshMjpQQNlOGNTHV0BE1Q3n/d/88Q9A+Wen0Cw/dubaC9LDxy5Mhr6olOl8ZHh6eRfqaPjc6/5
 0Oa7J+AfSJdmC71k7tMA6czclqWX5xE8idWSSNlh5VfQhe0YfwRGacLYyu4UD5rCr8l5ruAQ6Bp
 +kVA1n0UI3wt1I9cSTchDkR+4CF23b+j0n2i1sm0Dg+YNpuZgFnKgGkiRMKfFYhmeJkvH3LkYOq
 +jbJoNaR1VcZIDy6IDJ9iNwkfdgyNV6MakblAVsS82LFpX64E7cKZLXFQkVPwSprSdefTVn4EMl
 41tp/9/YXSbtJ7J4qJaUcY1
X-Received: by 2002:a05:6000:2302:b0:431:2cb:d335 with SMTP id
 ffacd0b85a97d-4342c549c3fmr1560739f8f.34.1768379721705; 
 Wed, 14 Jan 2026 00:35:21 -0800 (PST)
Received: from [127.0.1.1] (ppp-2-86-214-23.home.otenet.gr. [2.86.214.23])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5df9c5sm50121053f8f.22.2026.01.14.00.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 00:35:21 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH 0/2] arm/hvf: Add SME2 support
Date: Wed, 14 Jan 2026 10:35:02 +0200
Message-Id: <20260114-sme2-hvf-v1-0-ce9599596736@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADZVZ2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0MT3eLcVCPdjLI0XUMDU3Mzc0MLS1MjQyWg8oKi1LTMCrBR0bG1tQD
 VLNQKWgAAAA==
X-Change-ID: 20260114-sme2-hvf-105767189521
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 =?utf-8?q?Phil_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1045;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=3xdukIEOCUPtNcBt1H1Mv4dhwzYE4xjPXdIZZf6PcTM=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQnBaMVZJNm1SNzZ2U3d4UlFwRGUrN0xxK2h2NHhWCjhMS3dsdU9SZFlRdEhteTVy
 ZVdKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYVdkVlNBQUt
 DUkIzS2Nkd2YzNEowRVA0RC85MmFhbTFIb05tVkxybVpQSkh5U1oxZHYxdUVvWmxuOERhR1h0RQ
 phK2lleG93N0JJVmVZaUhGUm9BdFBPWTBtVkkvTWg4OU1YU3VNN0RqSjdkakp5N1Y4cnhYaEJaN
 UFMUHBFQWlpCjdFcWwzaHQxbFJpTnNDdXRBaW1vNTl0L2xVN01QRkY4dGVHNmpuZE1TQ2ZITUlK
 dyt3ZWowQ1hHbGd3L3dBU2QKTEQrbnJ2ZDZreHp2VldXN0tpRXVxN3VlZXhRQ0ZLWWo2RExkMmR
 6dkJ3Z0MvVU0vRm04N3dvYXQ1YWJsbzVsLwpvYTducEkvTk1hT1krbHlVSktxUzdkOW1aOFp2dW
 hDektsVHFmWTFjcnVDMm5Qc1lTR2dVT2ZlenlkbWpPcUd2CldZWkk2RUVTdTQxczRzT1Exc2JqK
 ytKSm9UTEtCQmFOV0c1UWlCeHZzRkVCUEs0ZXp2bDdMQTEvVlZSenZxcSsKVjJzWGNBbW85NllM
 Um1XNkxMRXNGLzFNNC9UbkZ6T3R0TG1YaUFhTEpsZndxUkhrbFQxQjhqWWpIY0R3TTczVwo0a1l
 qQXFQbjhmRzZudDRiT2JGRHdkWmhDNkM2Umt4Z1Mzd3RoWk1CQmtmb3NxSktERDdzRkZORHplQU
 I0U1NsCkV0TXB3dStCYngvbDV5YmErd1ZyYVJXdnNPNHdvc1YzK0xvZDVsMitUQkJuc1ZkNGdIZ
 mR3WWJqNG9NQXliTFYKTXBjQ2NMNHY2ZVZranppRmZvZmxPcnJQcFFJN1ZEUHlLUzhNZlNjWlZw
 UGFGdjZMMW05aEliendmZ0NLOWs3dQpNdlVQSDhYcEFxeFAzRTlta3ZPT3NQbHVBN1Zpa2tKYU9
 KWTc3VUo5MlQ2UVlaQ0hHWFFEYk1jcU05R3hrT25rCmpzOTlRQT09Cj00cHg4Ci0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_TRY_3LD=1.999 autolearn=no autolearn_force=no
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

M4/M5 Macs support SME2, and HVF exposes this functionality in its
public API.

Add support for it in QEMU.

This was tested by running an SME2 benchmark from Arm [0]. savevm and
loadvm during the benchmark's run were used to verify migration works.

[0]:
https://learn.arm.com/learning-paths/cross-platform/multiplying-matrices-with-sme2/1-get-started/

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
Manos Pitsidianakis (2):
      hvf/arm: handle FEAT_SME2 migration
      hvf/arm: expose FEAT_SME2 to guest if available

 target/arm/cpu.c            |   4 +-
 target/arm/cpu64.c          |  13 +-
 target/arm/hvf/hvf.c        | 318 ++++++++++++++++++++++++++++++++++++++++++--
 target/arm/hvf/sysreg.c.inc |  10 ++
 target/arm/hvf_arm.h        |  46 +++++++
 target/arm/machine.c        |   2 +-
 6 files changed, 376 insertions(+), 17 deletions(-)
---
base-commit: cf3e71d8fc8ba681266759bb6cb2e45a45983e3e
change-id: 20260114-sme2-hvf-105767189521

--
γαῖα πυρί μιχθήτω



Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E01606A31E
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 14:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=glzsuvTL
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWaaD-0007eX-7l; Thu, 26 Nov 2026 09:36:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xWaa6-0007Z0-TM
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 09:36:15 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xWaa3-0001eo-J3
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 09:36:14 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4bb6c7b6dbdso65606135e9.0
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 06:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795703769; x=1796308569; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=13GD1T40aUPl/To+BZkSLtMp9pchyXRus+oaugKqoHQ=;
 b=glzsuvTL1CoL5djUmO6JawOAjFdBg6ydmYHQmZPiX+JtVSL+Qwh/yCI0YK6dgxSaCY
 zkjSDf/2XYkshgXivyaSX24tKWoRMXXl7cwi1KqJyL7Dhs9mZrTDpY/hfmf/Vp0zaRTm
 fKaFtz75ocpXAJyTP/vpGSwbEIVb1pZjVtlaNc5gvEz6MVApLCbT5V3iZUzK8ELM9FnN
 24HXhhupOVykCFOemyMPwMMSma77hrSWISed+1a+jtT1JDXTnn0kcEgGxzFOL/Jw/Mtm
 AT7iojp72zyScUkysQC/gqJQcbz+/bHHkJWP+WY/ROjZHDBbo7DOE37XdjGRHXgS6FGW
 r8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795703769; x=1796308569;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=13GD1T40aUPl/To+BZkSLtMp9pchyXRus+oaugKqoHQ=;
 b=kY17srVU0fitZWGCmAKR9k48rFLJlhBj5u2YO8cUHpLeXRyCsfEzdmcIDn06Fa69a6
 9g2nwLxnMq2IN9FNzA/KA1kWnMhXEZ5U1bf+zScZ/6vkH9PE/AgkNfTiHWPyvRMcgWgB
 j8UpeSt9sYk/KXiAA1ASIX0okBXsSK3RL2sNIPovCI/SV2jd2kUW8b12fvQolP7z0fTI
 ysHyILNtluHh0mWDYlLFqtF+1sanwSIQ8TcoGjqbbPLM7RfTSJevmwYk3Hrgu5j2kvqd
 e8YjiuahkwUokkki20wPxhi38VRfSnJjPC4IDrr4LcyTSak8Jh2Mv+4fvJ2xMFLvcCzV
 wlqQ==
X-Forwarded-Encrypted: i=1;
 AL+hErFeB3QAM53WfZbqGShP66IdJNeaMIYbjSoss4lmnGCQl+aTCoZj87wFT+OyoqeGaInIiyw0xIkrTA==@nongnu.org
X-Gm-Message-State: APuU4Z8MzWTacJ8A9NW20Zy6O8Nnir+YBy6V4BpNHGtNVlwcuTR3IpLU
 UehOY46gA08Wa8NstrwenmnbAUaLke5+HTGlOY+76Eci4cepgC6qXiHZ2i9JuP9IP60=
X-Gm-Gg: AZFdTZfXtEa2lYgaKxyqS5NHvu1nOXKuLhhs/Q22YPXfE7Fz1rzs+d2paFTYgiLtVbc
 ASrQ4V+Ytc/BAVnZc/mi5IrnaO8+ls9RzMQLLnymf6lYopF2e3393oEeEv0+LlpgG6s67v50ASL
 ihP90u6+1SB+SkK4hw/BF1SSlc2drELIzKOp2aI76Una+WVLUX6Dz5b4In3nddgerF5IRiO2zVH
 y5FXkg5h5Q1jGgLfhEVT13zuCKsMfdPK+tIY89xOMViOiuGiKoXzt08H8dqljHdHncHBZBLNRcn
 hQNEDf3Ri1U8wPjGUCPjVJwG8hKZs72w1zzGcfRV6RK/4T0BUz4SW9mqONa+grReGHt5iJ1Gxzm
 F0okqsbRJvK4qXL99NJjggUa+5dfHLaj8OYbWzNStQmVmtP+5cplMpB/mjcdFh8q5whzaBnBgcT
 PwZNN8Rj8QCN9jd0OKOgXeU0qahWXYGydS4NFc5udJBWE1j2TwpgsOxiNInX5NeNNCsOJOVn54A
 5dWpOdfAY1EFtA293laLrVG8cbcI/N6c9CJ9PsURQlgfHbOhx5AlX45cT2nXdK+7nli0jzJGb4S
 VBhqA40706DsGg8lh8XkTv7NJ4V71Q9hFCXnAH1Bqb1SaMNK9w==
X-Received: by 2002:a05:600c:3b99:b0:4a1:777b:8a12 with SMTP id
 5b1f17b1804b1-4bb8880b984mr497296635e9.14.1795703769269; 
 Thu, 26 Nov 2026 06:36:09 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6a67f204sm49023025f8f.21.2026.11.26.06.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 06:36:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7499A5F874;
 Thu, 26 Nov 2026 14:36:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Zhao Liu <zhao1.liu@intel.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-riscv@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Chao Liu <chao.liu@processmission.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Michael Ellerman <mpe@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Kuan-Wei Chiu <visitorckw@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: [PATCH 0/8] for-11.2: testing, MAINTAINERS and doc fixes (pre-PR)
Date: Thu, 26 Nov 2026 14:35:59 +0000
Message-ID: <20261126143607.2374676-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Just collecting up some bits and pieces to slide into 11.2. Most are
already reviewed but there is a v2 for the virtio doc and the
cpu_io_recompile comment can be dropped if no one looks at it.

Alex.

Alex Bennée (6):
  MAINTAINERS: update Daniel's entries to be consistent
  MAINTAINERS: make LIU's entries consistent
  MAINTAINERS: use consistent capitalisation for Alistair
  MAINTAINERS: update security reporting links
  accel/tcg: update stale comment for cpu_io_recompile
  docs/virtio: add note about virtio-gpu acceleration

Brad Smith (1):
  tests/qtest: remove unused prctl/procctl headers

Marc-André Lureau (1):
  tests/functional: use immutable tuxboot kernel URLs

 MAINTAINERS                                  | 44 ++++++++++----------
 docs/system/devices/virtio/virtio-gpu.rst    | 12 ++++++
 docs/system/security.rst                     |  5 +++
 accel/tcg/translate-all.c                    |  6 ++-
 tests/qtest/libqtest.c                       |  6 ---
 .mailmap                                     |  1 +
 tests/functional/aarch64/test_tuxrun.py      |  4 +-
 tests/functional/riscv64/test_milkv_duo.py   |  4 +-
 tests/functional/riscv64/test_tt_atlantis.py |  2 +-
 tests/functional/riscv64/test_tuxrun.py      |  2 +-
 tests/functional/s390x/test_tuxrun.py        |  4 +-
 tests/functional/x86_64/test_tuxrun.py       |  4 +-
 12 files changed, 53 insertions(+), 41 deletions(-)

-- 
2.47.3



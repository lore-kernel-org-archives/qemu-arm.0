Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447A3C624D7
	for <qemu-arm@archiver.kernel.org>; Thu,  3 Sep 2026 20:51:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2EOH-0000oa-MH; Thu, 03 Sep 2026 16:50:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x2EOF-0000jz-OQ
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 16:50:31 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x2EOD-0002Jy-OV
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 16:50:31 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2d91518a63fso2535735ad.0
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2026 13:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788468628; x=1789073428; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=T5lTCNhnRhCIhS0KcpbpE6Lmcbyn9pliYKCF0OONxjA=;
 b=g8BXuJ93rBrSRlJrMd2DfFvNr6/d+b4vhyH2hfcvekLuQOkHI0XHz6/B41REbRUIpa
 tEX+S1ZzH9psxP1Pb3D0Bskq32On1nDEEI905/I5aVyDDwRrGZlo5i2/rBqLjkoxA/z3
 OGgdN+gx1Vn7pd+1WQkee4HPAy2jIU21LVF+vst3jmyxof1GMZxkU1nGgqegsrtj7Sox
 SPt0B8LGrGW/vTFUBNyg79klO7+6vksGbSvkudNU8kFbOJRquDeCj+sOIEpmJOO7x1On
 X7rZ5Jhu88jXpzmaHxoXbN2ePCgC3xYKy5tLf2Bh8YLRaK9GjCYUkwedk47tVukC4Ldi
 /Osw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788468628; x=1789073428;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=T5lTCNhnRhCIhS0KcpbpE6Lmcbyn9pliYKCF0OONxjA=;
 b=byDqFm5ScmS36NOPWqTOGHTFMoO+NknLF71NIeluXdaVDjK8ZaQIuaZAG5YX/vfj67
 c1ppI9oy6NlRkJA/CrN/EjCotSfCfGc3Kj0dE5HglHP6I/kawMyTVZWMipSZKPOLHSZl
 Y5WefD1njFSahvlb3RNFTUaL9+GYo0h51k+Hb95NQAnA5uF3TaLGGVY2BebQt6nLZTmE
 imKZfT50UKfhdD6dbhHZ5DmHIN0P0MfTYGuxWl20c4miwmUlVk0C7hBkDPhMuh+8dWH4
 jMSaJxzPSiXg1oJgRh5KQPHADpRCo2/vbNdU8V4XK9P4NDjfgIAgiGOfsLtHs3qLO/Y1
 x9yg==
X-Forwarded-Encrypted: i=1;
 AKwUvByJbOeenPSLLcsxaGzR3OY5Cj2IcQ1na0BLGWcpoiJZSSVqjWlANG8ThSOOzHSBTTorTftOIC24+Q==@nongnu.org
X-Gm-Message-State: AFuF++kKyTojyFoizAXIx2EEnst9EzRQqHXaDuJJ2ab2IbSOfPiOi8+o
 F7uZkRcFzwYG+vvlejvCjftO+v8TBunsZ7xZEPsWCQiUoieQBA+kKfbK
X-Gm-Gg: AYBFou1yLmCdBHA2VBjPpa078Wc3cQbjioBG+KII4aU0gxav3Bgcs+P1CkMRbaGhvLj
 6kIOuR0GDXSLRr3iyfT9KUlAfDY1kMNsmATpQDmxQgrzNFUvZEcC3YWxa+ofVqEzMyIi0xubMbu
 8eJrZWxXbRwWlyFKw7EM+iVj+HTozD+i3zYYTsygL3T6L9tNCepjqEwS5IUUGRLllJbwWvqcSFX
 EmDbtO0BfpVaNL8Hl4TCgQbwHXnXDWONHebICwOyQecCyAQ0Lz2ZMEeqYamlDbAKE4Tcj03BXjD
 USDXu1VntHcf4wSYBB2B6WB9HG+oPmgf9CI1/gth6GoIDE+njaihWrOuu8bYLdg/tkl8R7M7FzR
 bB3E7bNNz8x6hqo9ppjcLpf5XLS74zTdnGGMjQ1c8xKmt1+PzEahElpq6Aw+YRiK042RE6oew87
 oAzHDhsfUx28OwXSKGu6fIrcRHLPzi119QL3N9tjvH9LguAGBHChecu4777SXLC66inCQpV3wH/
 8s54oSRZ+UO38YFyQu56g==
X-Received: by 2002:a17:90b:394e:b0:37f:fd1f:d30f with SMTP id
 98e67ed59e1d1-39b26272d76mr1796060a91.12.1788468628318; 
 Thu, 03 Sep 2026 13:50:28 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-3339a534152sm1279679eec.10.2026.09.03.13.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 13:50:27 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Troy Lee <leetroy@gmail.com>, Kane Chen <kane_chen@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Helge Deller <deller@gmx.de>, Kyle Evans <kevans@freebsd.org>,
 Warner Losh <imp@bsdimp.com>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 0/2] qom: pass TargetInfo to is_available
Date: Fri,  4 Sep 2026 04:50:15 +0800
Message-ID: <20260903205018.975-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

TypeInfo.is_available currently has no TargetInfo argument, so QOM
cannot ask a type whether it is available for the selected target
without a wrapper around target_aarch64() or similar. This series
moves target selection into QOM and passes TargetInfo into
is_available.

- Move target_info() from target-info-qom.c into qom/object.c so QOM
  can read the current TargetInfo without a target-info-qom cycle.
  Add target_info_select() to install the TargetInfo once.
  target_info() is NULL until that call. Keep TargetInfo as an
  incomplete type in object.h. User-mode binaries select the sole
  TargetInfo from MODULE_INIT_TARGET_INFO, which now runs before
  MODULE_INIT_QOM.
- Change TypeInfo.is_available to take const TargetInfo *. Add
  target_is_riscv64() and target_is_aarch64() for TypeInfo callbacks.
  Keep target_riscv64() and target_aarch64() as wrappers around the
  current TargetInfo. Point existing ARM machine is_available
  callbacks at target_is_aarch64().

Yonggang Luo (2):
  target-info: move selection into QOM
  qom: pass TargetInfo to is_available

 bsd-user/main.c                 |  1 +
 hw/arm/aspeed_ast27x0-fc.c      |  2 +-
 hw/arm/aspeed_ast27x0_evb.c     |  4 ++--
 hw/arm/raspi.c                  |  4 ++--
 hw/arm/raspi4b.c                |  2 +-
 include/qemu/target-info-impl.h | 13 ++++---------
 include/qemu/target-info-init.h | 18 ++++++++++--------
 include/qemu/target-info.h      | 18 ++++++++++++++++++
 include/qom/object.h            | 26 +++++++++++++++++++++++---
 linux-user/main.c               |  1 +
 qom/object.c                    | 15 ++++++++++++++-
 target-info-qom.c               |  9 +--------
 target-info.c                   | 14 ++++++++++++--
 13 files changed, 90 insertions(+), 37 deletions(-)

-- 
2.52.0.windows.1



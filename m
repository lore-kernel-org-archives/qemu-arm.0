Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B23CA5FCE
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 10:21:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDfom-0003j0-8z; Mon, 05 Oct 2026 06:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmK-0002H9-5W
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:43 -0400
Received: from mail-wr2-x0d.google.com ([2a00:1450:4864:30::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmI-0000wo-F6
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:39 -0400
Received: by mail-wr2-x0d.google.com with SMTP id
 ffacd0b85a97d-48c54d65743so873464f8f.1
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 03:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791195516; x=1791800316; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=07cFrgUM6cjvx6tpFpm8bpJgkAMQMVUlJURJV9H4y9I=;
 b=H4dzUn+eiX/NbdzkOGzgUe/PQTFsq8kAQvTeWzMruFCAewweJpHYj6wL+2PQN1OKyA
 zKz0ZySAc+m+QBJjpRWYP5lKpxjIs1V8+L6KoxDqT5HDCv5BR+9y8ahqlItX0ykN25R/
 +59B4I5XUKej5R4dMTbFdda+wtJrauAxHOuWfItz1zHtr9grHoo5mcoq8I/h8G6BxgMj
 UifEAoL6s8dl4IxrdpynQvviQZWHdgn8CCegLPBUTWP4SMYWXDWf6MvGHI7HhuARDKMA
 91+JrfdWNyU1aTCwrvx6JKCIB+MHY+sNkvkBR7sRTZ7b5SGz65grDFxgRuviQGYCS2Tk
 lD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791195516; x=1791800316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=07cFrgUM6cjvx6tpFpm8bpJgkAMQMVUlJURJV9H4y9I=;
 b=vh93GErHnOUvut9vF9JlGZB7S3ofDKQ9yzlYUicqIyYdjp8vxESireiAv/g42j94KR
 mnG002GXVR1zXf7Bo8rtn4AUyCNz3h8xJjqFeiZNUVzNFN5pRmqZ78AUhGCsr9sUIWXB
 +/XDzlSMdZO6oIX45K/tXLr5jGdPrTltZElSuA49s09FSuEkoZnoUtZx0++6x2PKz7cj
 N7l6hdQOx9/rT+zhQNFwTH+fMsWqdwQurefcqrMa9cj6Md/Fod4Q8DhwGYUi15FlViHl
 C7x95k00iuVgDnMIFQk7LuZz2Yy5dIZmCAJUu2520tE0M3HsXDdkOGT/O6rgD6CWV9V1
 7vaA==
X-Forwarded-Encrypted: i=1;
 AKwUvByJYVy5MwA+c3gKUD3HYCJGmPhu8ZExlgjAiz7mYootKmzVcdx4sfn4Zg5TgKzFvreWRO8dECs1zw==@nongnu.org
X-Gm-Message-State: AFq9FYKN/pJW7Cp0UjJEm138qlwaAwGFrsens99SealicBrT3KP7HvMn
 BUWaqd0IkKez2VLe3FyRwnKAXYaOPxahBiP8qCK9B7gcbXjnp9Npi90M
X-Gm-Gg: AYBFou2u4UWkOpfUiun8bv/jgDSfJTuOASHy8XU00YzAUTiiDulwQr0TvmAWFaJoLsE
 T1RgTf4RNT4aS3FGPT8lHVlI9msvC9Tch/EkIwCofkbhrI/kqVk+dOpc1d4KJ1zuiNjmB8WoGtm
 auj0uGPU5VpO2w0dsO8lLmFeu0ziJ1XIen3qc+TzhRYEQs8V9ornrGVuCL9/bzwT4SuBxJWM8xD
 GRtqEVBD6gHPV9ZdxksGBB9zataT7uDydTs1QCgVKDw4KZQNfYsMLF8pbVZOnavn/ykzn1t+U3j
 LTpyhO7GYLGU82C35rVhNbllAQrPReVbl2CZUhlAze2fLSRdn+dgOiaWf6atfvqyQq3s8zaX9Nq
 L6zCgoze6YigxSn/ljPnQHGzhUwm0jRgJaxWl1C5P1tX+YLAea2V03EOE0ZtJPOlAZUP3p7YU8K
 2297JaXV1icuGmVVYldaF+p1FzaNC+TsrfDJamZO9KXG9m9kYihozzFx0dHkGV7dHHpJktVmwNb
 alxAzvNgQ+cikbayjahrRK2aElsrnvrHGd9Jw==
X-Received: by 2002:a05:6000:2210:b0:48b:1276:72e7 with SMTP id
 ffacd0b85a97d-48b1276737dmr17461108f8f.13.1791195516454; 
 Mon, 05 Oct 2026 03:18:36 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c622ab7b5sm2742111f8f.37.2026.10.05.03.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 03:18:36 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Bin Meng <bin.meng@processmission.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 10/31] hw/arm/mcimx7d-sabre: Have 2 CPUs and 2 GiB of RAM
 by default
Date: Mon,  5 Oct 2026 12:17:37 +0200
Message-ID: <20261005101800.10821-11-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005101800.10821-1-shentey@gmail.com>
References: <20261005101800.10821-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::d;
 envelope-from=shentey@gmail.com; helo=mail-wr2-x0d.google.com
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

Having two CPUs and 1 GiB of RAM matches real hardware. Fix the machine
defaults to make its use more ergonomic and less error-prone.

To reproduce the old default behavior for e.g. migration purposes,
`-smp 1 -m 128M` needs to be passed on the command line.

Reviewed-by: Bin Meng <bin.meng@processmission.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/mcimx7d-sabre.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
index 65fdb19c06..47744e66a4 100644
--- a/hw/arm/mcimx7d-sabre.c
+++ b/hw/arm/mcimx7d-sabre.c
@@ -81,6 +81,8 @@ static void mcimx7d_sabre_machine_init(MachineClass *mc)
     mc->desc = "Freescale i.MX7 DUAL SABRE (Cortex-A7)";
     mc->init = mcimx7d_sabre_init;
     mc->max_cpus = FSL_IMX7_NUM_CPUS;
+    mc->default_cpus = FSL_IMX7_NUM_CPUS;
+    mc->default_ram_size = 2 * GiB;
     mc->default_ram_id = "mcimx7d-sabre.ram";
     mc->auto_create_sdcard = true;
 }
-- 
2.56.0



Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp368081njb;
        Thu, 27 Feb 2025 09:04:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVvnXkcx6vGPjY5/JeseVdAC0kL/akq7nqPae1XaSKx0b2id4nmQddIvQMoGBLsMnKf6gik5I6HWVmQfQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEjvgnE8OwKn/pOWRfFvs2HYrFpuY+ZCr3uStLHyRFmvhy2f5Gml+DHinzQ1FEpE32D7WGq
X-Received: by 2002:a05:620a:470d:b0:7c0:56ba:559 with SMTP id af79cd13be357-7c247fe6b7amr1461611385a.47.1740675842680;
        Thu, 27 Feb 2025 09:04:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740675842; cv=none;
        d=google.com; s=arc-20240605;
        b=CA09n6soMYJa/BUW7Uz2M2Klpwt/SgJlbH27+HPAX20UttJbF8H/DrPrtMHEXdzpoW
         otYvbx4TvTZY3ML2p8WTqNAYKxyk8presv/RVpYIpt3gUg6iNSrD7jSNGFY42ClwqcBe
         0GF3X7WjCAsG33lPzOBTPGIPzrfGe97kOGD1dZwVz4iHnA9RLzV0K6icHVXzynL21JMF
         xa5hARBwlMI2Uaw7FmmMkJq1iFgAC73DWYPwKdEXKxV9XhuHlXb7UVrROEJinmjCqbwT
         PDqiCNAQqvRxOfXdLaI1h8Ezs3gsuLbUoIKx+R5pAlsaVRuX1CMcvjiOPwRKXjK9y+Aw
         vF1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=3eBHAjIfoWoER90J1BI6uWWgCZy3qo5qcX1iHAUzyn4=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=E0jNNBel94BdFsRZmKKmn3a7zaLLDVGwlWaGFZuRo34koSSlnP6E2PC5dgyWXIEi6Y
         8T/dHOFT8Qmvw7oJkXO0xo1Y5n/UGzUu9+DCNMDYPTSsZcpRHmUNQgRbbJ71S30OAmnt
         nujZigo8NNuwnE9MUB0QAZS8GmlH4WhO0V8gmA6lJErSmjlYHzj/+uWs6rtUrZbpA0z6
         SV7yJXrAWF3PyzE03Hb8ocf/2JxGx+PpV9k56rJpVarTPdeOBl6B/P+U1fcKEpsSvhbk
         Pih5a1gSBZ/GHzkVn6hz8fTGPqkLktrFr794DrLsM4EnfDchmr7VxQgV3+bKFxG3ITTe
         XW7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pTx650BF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3749e0278si146724085a.389.2025.02.27.09.04.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 09:04:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pTx650BF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnhId-0007Rw-9O; Thu, 27 Feb 2025 12:03:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnhGV-0005Ch-Bg
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 12:01:43 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnhGL-0002Ks-D1
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 12:01:37 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so739200f8f.0
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2025 09:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740675681; x=1741280481; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=3eBHAjIfoWoER90J1BI6uWWgCZy3qo5qcX1iHAUzyn4=;
 b=pTx650BF88pwURSNtkaW9ihptXo2Zxguy/0qRG3lsf5ZoHtHQh/PTztp0muL/tFNUd
 pdHUXsfZxxjyWQzSbsCwImzn4VW6Gf15rxIX9v3ZOORI/S0FQ1j1RGmTJMyAJA2vv3wx
 G55ffpEIxi23hjgwi/GpGKfAzss5W8J9AybjfvstgHi8GsFUaE7oOdlgW9636Fb013jR
 GLHhd78v7Q84CJDbwijkSr3p7QVjkiQGCAUvegDxFnDvDZjJWAucX3n82hExy+GrD9cD
 DjDcPKAUOmeD1VO1kveyKPQ2p6N1Xa5/DXNPV0of3Ruu9I2SyaP439s0Wi6c59Co89QK
 Um/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740675681; x=1741280481;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3eBHAjIfoWoER90J1BI6uWWgCZy3qo5qcX1iHAUzyn4=;
 b=h7/gpHCpNKOFZRxK0IH9hg2nQBWqhqTOPA5wtt4oLkeEcC3iyWbyZrYxlLrTounLJ0
 MGVwa3Npv76qU35gtZ0TInnPn2CDBxjFRG75XpwTeKWurwjCpoj5mJ0d4L70nI4Bui6U
 f+5R85FOuffjAvFGAr/jsDA+AE4pgmWLo55pavJXLyg8SydkPS0kJ4svbfuBwsU1w22i
 GMCS7v+jQsfTXn5kKjhfpfOa7t9DP+BFVYk8s2BVT+vvgY+0920hP+tTE4plgynHDrcT
 JfqjAHOI6wbZO4tCpmqkQbL2oQpzZkfIDopJ/LafqIP6pScAIFDPEQgUAbcKu8odjlVg
 ZjAA==
X-Gm-Message-State: AOJu0YyuCUS46NsAaONxFH7tsaG1AJ+nfWGW2OVxN0oSf6PKk7Tw9RG9
 jXDDKzha3E67TuTOYF7YvrSyXPOvzt79nHyb/2fO7k1S81UUV0U9eQvBur2V5Oj46pq9K0ILhGA
 o
X-Gm-Gg: ASbGncuQxDD4sh1fhGYdurzXMmAUxg5t0EPeaEo5PgEcTpEnamAteKqEhn5N4YeEZSE
 yZMCscCKMqqvNVdg4ko2PYy71NN19Ysww9CvqLTurb3nZNZzH+hG/2J/xw74vQM3Ubs/7JPBXzQ
 ugLfZtRJ17OCqeeskNdBqm7+pMwr85rW1Zdvs8diuN0nYe43exJVnRjROzESr0EtGoDKYHc6K8L
 bclwRY9ZdrsGMOBHBZJEqWV/Q/57Fjj8U/ZtYzDWPAh9cUuRyfxwsAa/N5Y2lHl+U618ZAI5ILu
 93fTK0fwGJ1ksPzLubew0HL5VToYgWck
X-Received: by 2002:a05:6000:1545:b0:38d:e401:fd61 with SMTP id
 ffacd0b85a97d-390cc63cd3amr10386207f8f.49.1740675680565; 
 Thu, 27 Feb 2025 09:01:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba5871f4sm62747565e9.39.2025.02.27.09.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 09:01:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/5] hw/arm: Remove printf() calls
Date: Thu, 27 Feb 2025 17:01:12 +0000
Message-ID: <20250227170117.1726895-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xvroPerw3P3Y

I noticed while looking at the sx1 functional tests that
the omap1 device emulation code prints to stdout
"omap_clkm_write: clocking scheme set to synchronous scalable"
which the test dutifully captures to its default.log.

Printing this kind of debug or information message to stdout
is definitely not something we do any more; so seeing it
prompted me to clean this up for hw/arm:
 * printf()s for guest errors or unimplemented functionality
   should be qemu_log_mask()
 * printf()s for minor informational things should be
   tracepoints
 * printf() for debug that have been ifdeffed out forever
   could in theory be tracepoints, but I didn't feel it
   worth the effort of conversion in this case: I doubt that
   anybody will be trying to debug this code or that the
   specific handful of debug ifdefs would be what they'll want
   anyway. If anybody ever does need to do debug here, they can
   add the tracepoints that are actually useful to them.

thanks
-- PMM

Peter Maydell (5):
  hw/arm/omap1: Convert raw printfs to qemu_log_mask()
  hw/arm/omap1: Drop ALMDEBUG ifdeffed out code
  hw/arm/omap1: Convert information printfs to tracepoints
  hw/arm/omap_sx1.c: Remove ifdeffed out debug printf
  hw/arm/versatilepb: Convert printfs to LOG_GUEST_ERROR

 hw/arm/omap1.c       | 126 ++++++++++++++++---------------------------
 hw/arm/omap_sx1.c    |   4 --
 hw/arm/versatilepb.c |   7 ++-
 hw/arm/trace-events  |   7 +++
 4 files changed, 57 insertions(+), 87 deletions(-)

-- 
2.43.0


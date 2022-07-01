Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp782095lft;
        Thu, 30 Jun 2022 17:08:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tmTDl8LREwdkXh1uoJ+4RgA0RzOjPhPX0YlHyZXbELghiP4/Ir4TAoQBQx+8YEM36p3psK
X-Received: by 2002:ac8:7d52:0:b0:31d:2828:f with SMTP id h18-20020ac87d52000000b0031d2828000fmr9196211qtb.391.1656634087790;
        Thu, 30 Jun 2022 17:08:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656634087; cv=none;
        d=google.com; s=arc-20160816;
        b=WN3XWkvX5j3wvUgr52ow8Udv+QH/4x8hz4IunXFf293/eVnrFU3vJW3DujqExtRBT4
         9niwFeIAe2kHMXFAR7GHXJFToxhyt3XC11XCs9ZIERxOj09im0Nvwkc5a4RcBFdhXu8J
         ApDkAuwCQIM9h/nitRA5qp6S8WjJdLbgPqa1ZlfPcotUJihkG2NfEKQzJ+892P0gVoKj
         4iN1Fk+EGN4vsGdFmJlOU838I5Vk+zT4b49JsPiOfm/JkZxso2k5DyE5StYGvvvFbn2z
         LDYSVePfPHRvySC3I9Nrb+CxpeMnXQZH4OYvAK3+vwSlg+H+wYB9lRglYsArlRjW6K5s
         7gog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:feedback-id
         :dkim-signature:dkim-signature;
        bh=BvIFAzidGteaZ06hSUEhwXIf2XlkZb7Wrs7BnjpZ1sA=;
        b=dVmtreKR7uUU6FilyeiBcwem01BRD7Y31WmGtoCX4WWP8fHjtClrOmZXAFF/Ra4JG6
         3ZxRgjOh/esZKUls41D126jAzwMbCBqgMmqsJwZNXCZXJG5jTaJk7N3bvUi8W5sJK8PJ
         4MafKqbqx/KW2rCtBGgXlmnhT5tHDQnsyHz/RKctrxSGYfvNUda7WByJ/EeBs21V2Yf8
         SDjKQnHG8P6MgxYUIgn8EHPgw0W60sNHv9SJZtF+f7NqB2W1uwol9wNqtoH19fFhvVMb
         9CyFC8lOYSB3HEqHjKqlVQHujTCwFdHpKZgwr4hgqLqsdhjo/zaoBlowUQAQqEFCoHpy
         DYlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=SKPoagK4;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=hjJUzSRe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bv27-20020a05622a0a1b00b0031d2a40eab8si2655046qtb.358.2022.06.30.17.08.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 17:08:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=SKPoagK4;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=hjJUzSRe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o74Cd-0006Ys-6j
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 20:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o74B7-0006YA-DD; Thu, 30 Jun 2022 20:06:36 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:50875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o74B5-0001JP-G5; Thu, 30 Jun 2022 20:06:33 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 6DA532B05A04;
 Thu, 30 Jun 2022 20:06:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 30 Jun 2022 20:06:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1656633988; x=1656637588; bh=BvIFAzidGteaZ06hSUEhwXIf2
 XlkZb7Wrs7BnjpZ1sA=; b=SKPoagK4wtUGRjXK2xzXOU4pdR0Ht9n+mWpKXQkwU
 OEYpg1n6EbAKFVVJVSL+Key6xvp/OsF/Gt33uZAH0VMhChvl6kiOKBJFR13yoWYn
 3n1ay50J/ZxPhmhdVdEZ0zZXPFr057SGZs0HbGDZ44OH36lIJIpGKFnaygtTBDRs
 6SXVPWFzGULM45FAgnGv0ylIlyjIygu29PigxupkyRwLvD4KUZyUznAJ+RAB5t+E
 b7Pq1W1IBtXamQaTGvVnIspPaAnYFAEgK3dLWxg0ucMJbqKVlgBIq2Bx38TM8kzD
 Kyyp2AW0i5L/pCvA0K3M87a4jDdmVbb0lqgE554UXv1FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=i9e814621.fm2;
 t=1656633988; x=1656637588; bh=BvIFAzidGteaZ06hSUEhwXIf2XlkZb7W
 rs7BnjpZ1sA=; b=hjJUzSReq+JK5Z6f01dCJNknQJHWGW9VTXgEGDPrDXwA7LPF
 C8YXthdTjLI4ag/IMnxL2DwW2VmYRsxdGGga0FvUFtSL/b8iUC3EGoPKGB7gbFN0
 Apch5c8nio+IJy9dn/qiYiml/sVHTTXaURlzr0bLM2dx6A5FmwWO67morW9Um7eT
 LwT8Y2M4vIY1oBm384Siud89WeHOC8Z7eRbe19YI2RXdCfofeSZfuH+70TuEghnu
 ahe4YKmyag6XQFMuTRNDh9+sMfnq+lw3TDmCljbuWcAO7u4OEwBK+h+l/jrIEY0v
 TTGH1j0YL3ZWx3fhC5j+WZI/79vljUZBg2+POw==
X-ME-Sender: <xms:hDq-YuhQ6HoCiUQHUh3JGrcYFFHXjqWGej10wtBgb5Vwn5fxDwRq5Q>
 <xme:hDq-YvD-cBsTFOGxoX5WNhYQ3lLTc525Jk7n0SwyqMdWvURlxVmuaj5PhxLkrDTfz
 7lew5cqJLbxiFtkwqw>
X-ME-Received: <xmr:hDq-YmGEyFD3xFUe7MNyddFTv95Uj63j3mmvuRw42rJONDbPFsSsGARZP4bgkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehvddgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheprfgvthgv
 rhcuffgvlhgvvhhorhihrghsuceomhgvsehpjhgurdguvghvqeenucggtffrrghtthgvrh
 hnpedvtdeghfevtdduhfeiveeiudfhkedtueevveeuvdekueetgeejhfdtudegleeufeen
 ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgvsehpjhgurdguvghv
X-ME-Proxy: <xmx:hDq-YnTvnvhfBY4rTJ0lDsdngNsC_nJ-MxMi6Hg0-OijOaCv-9BKCg>
 <xmx:hDq-YrzwATqKRTJLEeek8deHN9DbwyB3DgBbpbZ-6kr1UrpMTxZGWQ>
 <xmx:hDq-Yl4EU-f6VUG7OK0KqEdzSG52YzqeNGg84OcyybEWuqdIrBo8jw>
 <xmx:hDq-Ym_Zu_oaCtlQyCQ9OA5HAtoKDxXTGh6uXisg88ZaId32ttXOk-eQdxU>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 20:06:27 -0400 (EDT)
From: Peter Delevoryas <me@pjd.dev>
To: 
Cc: qemu-devel@nongnu.org, clg@kaod.org, titusr@google.com, qemu-arm@nongnu.org
Subject: [PATCH 0/3] hw/sensor: Add ISL69259 with IC_DEVICE_ID
Date: Thu, 30 Jun 2022 17:06:23 -0700
Message-Id: <20220701000626.77395-1-me@pjd.dev>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.27; envelope-from=me@pjd.dev;
 helo=wnew2-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cPFKgkmsSqRE

From: Peter Delevoryas <pdel@fb.com>

Resubmitting these patches separately after having included
and partially reviewd them here:

- https://lore.kernel.org/qemu-devel/20220630045133.32251-9-me@pjd.dev/
- https://lore.kernel.org/qemu-devel/20220630045133.32251-10-me@pjd.dev/
- https://lore.kernel.org/qemu-devel/20220630045133.32251-11-me@pjd.dev/

I added Titus's reviewed-by tags, but Cedric still had one outstanding
issue:

- https://lore.kernel.org/qemu-devel/293da11c-dde2-e646-c754-820720c410de@kaod.org/

But Titus had a response to that issue, so we may or may not ignore it:

- https://lore.kernel.org/qemu-devel/CAMvPwGpZZgAd2RHXmvmxfgyTyVGd6Rx+avj=E24NWc0masdc=A@mail.gmail.com/

Changes since then:
- Replaced g_assert_cmphex with g_assert to avoid portability issues.

Thanks,
Peter

Peter Delevoryas (3):
  hw/i2c/pmbus: Add idle state to return 0xff's
  hw/sensor: Add IC_DEVICE_ID to ISL voltage regulators
  hw/sensor: Add Renesas ISL69259 device model

 hw/i2c/pmbus_device.c            |  9 +++++++
 hw/sensor/isl_pmbus_vr.c         | 40 ++++++++++++++++++++++++++++++++
 include/hw/i2c/pmbus_device.h    |  7 ++++++
 include/hw/sensor/isl_pmbus_vr.h |  5 ++++
 4 files changed, 61 insertions(+)

-- 
2.37.0


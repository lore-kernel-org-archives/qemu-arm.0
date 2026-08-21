Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E60AC5DF7D
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 16:36:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxSDO-0003W8-KZ; Fri, 21 Aug 2026 12:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sef1548@gmail.com>) id 1wxSDK-0003Uj-Pv
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 12:35:31 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sef1548@gmail.com>) id 1wxSDH-0007LL-MR
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 12:35:30 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2d049069377so11646775ad.0
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 09:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787330124; x=1787934924; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2wE69ZiUcY/ij7KJ9fbiLkQEQT3Ld/w1YzzobrbfgCc=;
 b=prj4BN0UN5EK/anWMWKlbzDBg+ySMviwHHBY02BA9HGuqstMEaAVd3ahufdxxn3zBh
 VT26MD4uYJFFfL9ZEBTLdNEvoT300mXX3oAe2JROPVdGItLpqe32JFHW3v2DRlYNXt5U
 b1lzQjF+Xichh/6ZSk+k73/lcI74v7M/nPk2ShoYtiqL6PY11m0sg0DNVqxTnM/DqJiv
 HiKBxeuDAJu2p1WMv14In+4GyRWrO3A31VbJxMUH4DG7XbAZ+NC+RA23fm1nhRSSH26n
 pkOexZpOQPObQr/u6Ss0/7U5pWPcDttREIA8eReAgsc9l+/dujkEeBzAwGBo0SKbeHTC
 boEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787330124; x=1787934924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2wE69ZiUcY/ij7KJ9fbiLkQEQT3Ld/w1YzzobrbfgCc=;
 b=kS+1DxOLpT7JGLrZkW/pi4xT8DzSsnQhpLkVyfTq4x4dXQPyIK3yHOkaJJbLNuyH0T
 DUubAOLbwjlHJpEQfidw4QrGZd92axtfaWfhJEkX4xyRmir0V9vjkeFBkkEq+F8+CE4m
 CmVJ7UjvJdVmOwF+VNKPMf6CXb1+sqyMo19fmzh2gtJjv+LKJ+BGM5hzyI2hCpPeA5QB
 LzjUu45J6MYdj/c2gJUd2EUR+y6jYWaKosljXjCWunJh2+8RMHUJw+ZueCkcCSg+qLZ0
 D7mFAWxjEJKGu+Vt0b/nHfzouu9OUOf4bqQXlsmuHmLFF344ZM2KcU8YsoVVo41EhvRx
 ZedA==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro6d9V2HUpkTbz1iqYf5HsV2Esgeqwx9zzfB3XUebYe2zuilTkKYA1wmYpYCJGxhBckmdK0NQrLDw==@nongnu.org
X-Gm-Message-State: AFuF++mw+FyyFP1tH4/uH3JRqnfaWZIiuNaGiY/9kE7QSNAYJvsIZTVE
 Kz/ytPk3OdQfHBF3YUX6cfiY9Mh55OH2XMWGyBxtnpKRH4b/cZc2cfcI
X-Gm-Gg: AR+sD10trDH8jgCa3ip3gvDKUup9+JZheQ3U/ImRnHPkClwmDf3rkwEHgq5TaDt7dLW
 a/9JZRrJNL4g9RXTc9ifujhXyhVETYSW1FsbGeC4MFnbHeuLDbm6TySBOwWo9UuZw5W9x2CuPk8
 +QrWKb9Rw2ob/BChknScEPR276FnM1EsPh+R6EHn+7ITvtAuUDWVJG3UGD1HTMWlambM1J4a8WQ
 5XFjFwG21O1GBa9Bq75RD1wtvE4suKGnzkgnsdbwzK2z0EJxvr0TLPiJLnZcJW02Cc+t+gN2wmV
 zabF9ORz4wbJAyKJ6jhZggDqP2LAd8PdQBD8Xv9kFYnDKMupUUN0x2E/yBlPtGrU7y9DGzcH9cX
 DN0dRxOmBNBNnN5EP3RZRV/iFKQs5NgRU2hLO/IMvsqJXDi9Q6xHI+qtVbvhzqJXV7ZtlcnRAWF
 tqhV2nLGe605mGpMs5oD0xg4U759p3pnAgKFCh7BIJZnPcWDrMszaVWU9vG+BWybPKB8myLgp5E
 xdADvCMSGxeDCsybE3e85O7Zmi0rse/+dLHLOmgay0R7VwO51PjeTE+IcpsEltcCLyhjeK+PIHB
 QmQ5YjYtpoJ4Ew==
X-Received: by 2002:a17:903:2c0c:b0:2d3:78c2:1f19 with SMTP id
 d9443c01a7336-2d64b0270b8mr146787085ad.9.1787330123782; 
 Fri, 21 Aug 2026 09:35:23 -0700 (PDT)
Received: from nickhuang..
 (2001-b400-e2d9-9e95-5d55-4df7-34a1-04d2.emome-ip6.hinet.net.
 [2001:b400:e2d9:9e95:5d55:4df7:34a1:4d2])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d62e3a2713sm21646445ad.58.2026.08.21.09.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2026 09:35:23 -0700 (PDT)
From: Nick Huang <sef1548@gmail.com>
To: wafgo01@gmail.com
Cc: bmeng.cn@gmail.com, farosas@suse.de, pbonzini@redhat.com,
 peter.maydell@linaro.org, philmd@mailo.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 00/14] hw/arm: add TI AM64x SoC and am64-virt
 machine
Date: Fri, 21 Aug 2026 16:35:15 +0000
Message-ID: <20260821163515.12575-1-sef1548@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820124824.618671-1-wafgo01@gmail.com>
References: <20260820124824.618671-1-wafgo01@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=sef1548@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

I think this is a good approach. Thanks for working on this!

Regards,
Nick


Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2678305eja;
        Mon, 6 Nov 2023 03:07:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVoR131hWB9z8aqWIP/ziZd59Yx6SGBSPy8CvI7Bze7K0aUQuZaB9SNEH4UL8ePNWA4xtS
X-Received: by 2002:a05:6870:19:b0:1d6:790f:25a0 with SMTP id a25-20020a056870001900b001d6790f25a0mr30206364oaa.4.1699268877218;
        Mon, 06 Nov 2023 03:07:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699268877; cv=none;
        d=google.com; s=arc-20160816;
        b=GgLzd7EZP30n3ToOAyssPjU4RPKkZ7CPbTiUqKDzvb6eJQaAKvJPVj1JSk0d3ofEy2
         W9rF/d1tcJPGK3gOngWW8RK8up6kXwQ8IQU+5gKVjq7BfMXIXqmZfTqQy2j7EfqbtXbd
         AW2SbLGv5iWzik8lhyOGNrWJqsmH1qsDxJssY4nZNiSsnFyHus9j/XVFkkcQm+r7qscO
         QxngbNb0IvgJZXU47nHvtUdMqGLL+H+nDa22lTP4rD30INX343X7LXP6yfjFYNNqwWTh
         0+xgCBZYahJgUop1I7NDlUxefyhGt0QoiY0VsC0kTP+5CZE44bPkaq4c2tYqoRzd5L5x
         Me8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=/8FQLEYTqFB9Ro3y1RtUGoGmFmjKyGG2i99735loRZ8=;
        fh=l0VZqEXHjAOAoKxAjE4HjirxxtGQta0klXTKiczTXSE=;
        b=aN/UGUsQlMOv+J1QTZfQwYsUqBbpNjBnHpH0I2Vv5IKobhzx9ieTmfeK+6XDlw38Zc
         rqwnOdPEnVndZhx5y8yq+o7TLSWVgRrSL+/sEMopet3ryoAYqmUYFU0qE37Lk6AHAVc4
         8o76OYfDF1uMVIOWH1WIkPxW+Y/5ASQBoSUwdA34L2KqAVa2uFtc8c3gv0/1n2gASZoC
         Um/Q555ifR8t31pRf4hrm9SUrKRxK2gqi9b4WeQO2+236ptydPXXIyPRSWiMPXuwq3rR
         6+T090qbKUZNlk+qUL+byT7R8eh2fGF4775UKViW2eXLXEaGi2SglsHKyvu0ULvLuDNw
         FcOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BwTOngkf;
       spf=pass (google.com: domain of kvm+bounces-704-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-704-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-704-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id a35-20020a631a63000000b005b92b048254si7336153pgm.201.2023.11.06.03.07.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 03:07:57 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-704-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BwTOngkf;
       spf=pass (google.com: domain of kvm+bounces-704-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-704-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BC0F2814A3
	for <alex.bennee@linaro.org>; Mon,  6 Nov 2023 11:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E66AE1EB3D;
	Mon,  6 Nov 2023 11:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BwTOngkf"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95121EB39
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 11:07:41 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 353E5123
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 03:07:40 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-408002b5b9fso32375715e9.3
        for <kvm@vger.kernel.org>; Mon, 06 Nov 2023 03:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699268858; x=1699873658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8FQLEYTqFB9Ro3y1RtUGoGmFmjKyGG2i99735loRZ8=;
        b=BwTOngkflAtW3hPshKdVksO7RjIqhbJRW/QDH5FtEziR7q1SKhNHqQNusFFhbToGfM
         Lt4RtSOvonispD027ST875cyLOa3l/dI21BaNfBEtpMfs9k88i88GtrH5FJl4kDCxtJM
         vwKYrejLqFHlB9D9xTffm+w/XKeC6eYjgpm9ZBdssPUc/jRoyIEjZsvpT9JwYtQZTqTW
         kgw9XOhV1LWaiVWyJ9R09XE50WW6Qng7QK0cOFgMEw9jpz2bJGhN1UAajJi8CL2g6ceW
         ad8GidRUkzi6jpAnMQAaVb9Tr406KaK/pbMImKyFw6sJTfvUP6I/AHyk37MaJJ30urkz
         pDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268858; x=1699873658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8FQLEYTqFB9Ro3y1RtUGoGmFmjKyGG2i99735loRZ8=;
        b=svLCA2vXW+l6MoL0Wt/1N5SB3778+sa4g3jqE916qfTvzCp7VJpwaDMnCQQkH1v/wG
         wqUTMav1qYZ4Ex7P3JHFqKyxGPvJRMcLrv3bahPbPvhGMBKg7MPboTTi/BpC1gKaJxYF
         qaQrBrHagpOlhDk1Zhp78E27iOPzhekdNcyr+ptyHKKNds0Nlq/S5x87d/94Xut3ADXB
         nbGPXQ4Teq2NMgX8eyqTtlgWwjpwwV78ITMACknwTBhhAoXV6LpKseyepjNGdhNjEZXq
         yQcuKMhbl4NvegHHwVFBBDKdtiDVIuicaWxcw1wNq5l99/+PELZU6zonFFl3ibKZICLB
         HYBw==
X-Gm-Message-State: AOJu0YxVxI31Qhz9swDWRsCB72DN+HEhpd6FRTXBDU4J+Y/VnhVgyaQm
	Q6ys/AQ0mkwXa8U70kf9EavmX18T5wF88QvFqDU=
X-Received: by 2002:a5d:6dae:0:b0:32f:7c01:5376 with SMTP id u14-20020a5d6dae000000b0032f7c015376mr22752718wrs.31.1699268858733;
        Mon, 06 Nov 2023 03:07:38 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
        by smtp.gmail.com with ESMTPSA id z13-20020a5d4d0d000000b0031ad5fb5a0fsm9131295wrt.58.2023.11.06.03.07.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Nov 2023 03:07:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 35/60] target/ppc: Prohibit target specific KVM prototypes on user emulation
Date: Mon,  6 Nov 2023 12:03:07 +0100
Message-ID: <20231106110336.358-36-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: jWDuhrUzJB58

None of these target-specific prototypes should be used
by user emulation. Remove their declaration there, so we
get a compile failure if ever used (instead of having to
deal with linker and its possible optimizations, such
dead code removal).

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20231003070427.69621-5-philmd@linaro.org>
---
 target/ppc/kvm_ppc.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
index 6a4dd9c560..1975fb5ee6 100644
--- a/target/ppc/kvm_ppc.h
+++ b/target/ppc/kvm_ppc.h
@@ -13,6 +13,10 @@
 #include "exec/hwaddr.h"
 #include "cpu.h"
 
+#ifdef CONFIG_USER_ONLY
+#error Cannot include kvm_ppc.h from user emulation
+#endif
+
 #ifdef CONFIG_KVM
 
 uint32_t kvmppc_get_tbfreq(void);
-- 
2.41.0


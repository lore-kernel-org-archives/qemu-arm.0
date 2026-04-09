Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7B4F364A3
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 17:53:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAtYf-00080g-12; Thu, 09 Apr 2026 13:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1wAtYd-00080K-4y
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 13:52:47 -0400
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1wAtYZ-0005g6-Qo
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 13:52:46 -0400
Received: by mail-dy1-x132b.google.com with SMTP id
 5a478bee46e88-2ba9c484e5eso1212677eec.1
 for <qemu-arm@nongnu.org>; Thu, 09 Apr 2026 10:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775757161; x=1776361961; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fGB+tosPucGXv7yICD/rFdeFUeaEw2uU78q/MBopIr4=;
 b=sZl1hAxAMJ2MsKDmjjRkYWZwtubAXx/ZUpbfht0IkWmIFDGMlNM/cbTGDaEJzS7FBx
 oCVZDRcaYrP6/Q8FQc5lMiJxE+EmOwka/R9mqADX1eKFCuH9SZV9pbvXIeMoYFowjZzW
 eONdCdBPuXn/qEOTZK3pzHKMYmiTPciUr6/Jh0yOC5aHqpKtQ0ljsFdh308l+sH/ffG5
 5PKZQEtL8N/muVkxyRUUEJwhnGuX2jtwNpsuUFKW1VYFr4vd7jWkLNI7XXDGmFJePEO/
 fhaQccSPZ2KxkYezZ+MIpnAxd8VPEFIO/dBJl39b+mbngU9XP4rfWOhb2LIT8gbhkA/g
 WmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775757161; x=1776361961;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fGB+tosPucGXv7yICD/rFdeFUeaEw2uU78q/MBopIr4=;
 b=OqS6tVQF6r5GXSgPEoOGfCYcJ0GuLtlCEXZIH117k6nMC3Mhs2UvTKa3SuB6GDjT15
 jj3BkPbQVs4+qCw9CVkALTFfWyjamyQOkqAP0wLsWchiH/353/LfKoBYxmALj3au+L9F
 sQYsUcoRG5Y91JK0nGFMCVz87GKcg3H5VTl0YIyM0U42wMtDhCfzt9sTGpl4ZG11CozF
 CnyM6iQlyGExQFwE4k2NqYRt+1Ikl2w8MDGCy2u1Q7BW1isR/SdurOt1ebfMUVlHMGGa
 FrCGJz/dst1dYIVbRNDfnm714cmjUA0Y2Gs3UndVofBnrwXMBhLbX2Aoa/r6PErpK8y2
 yzpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0FV6mkvlTVBtU72jVzBFGemHtpSJLOSXdJIJo9Ec9cK7EzAXM0WwQCpyoZzIbhgxGDkR+488s+g==@nongnu.org
X-Gm-Message-State: AOJu0YwDDsjtrS8NZK+5Y6vvDNfDaWUTdK8FoKl5wlyTMdEtBe1gjxDU
 Td+r2SbZ5hQP7++3OboRkyGgeoSROzT16TlgyY0Mf1jLSAenaZvKFNf8
X-Gm-Gg: AeBDietWq6etJGPA1E5MlSHFlbpSBGK6TPc3aYZBG9hZNxaFjT2z5shZUoawc15yRUD
 c81IzqZKrObniL1Bstz/VcbokLz825ysl2zEDsaizkGD5jCTBE4MaGRox0bNe6vonFJwLvP1UR1
 2uReC3rV1IVvRLOc/yBo8VuprkFnCISH8geOOa3v+Pj1HTZhI+lsIEQlngqOHrcMVCCPCgkP8N7
 3mbsVdn2Xds9MYfI5BPMtebgQP6vRg3nyLXfojXDkriJgKiJU35l5W15KyM5EEsZET4Tyq2Tpjn
 KFtNUCPzgHphVkOSKYeVmmwLScQzxypNsAcHHp32lEKP3QpUK+MprRSXMNBjG/wOWk0eI1eFPtI
 rYjPzFGqtoa61CNTo0ETszKHxCG1E5YXQ9pkdrIqYs73djkBTcTC58YIGtgOQc5kXWqbns6g2lr
 SDxgPGzxpvIiou9CfbZdnRr07QMThheAvQ09HulT8q/2/B/VDWRYbPhw==
X-Received: by 2002:a05:7300:7313:b0:2d2:2314:417f with SMTP id
 5a478bee46e88-2d5888a0888mr19675eec.24.1775757161167; 
 Thu, 09 Apr 2026 10:52:41 -0700 (PDT)
Received: from localhost.localdomain ([143.54.78.183])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2d5632a64easm668106eec.31.2026.04.09.10.52.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 09 Apr 2026 10:52:40 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: Lucas Amaral <lucaaamaral@gmail.com>, qemu-arm@nongnu.org, agraf@csgraf.de,
 peter.maydell@linaro.org, mohamed@unpredictable.fr, alex.bennee@linaro.org
Subject: Re: [PATCH v4 0/3] hvf: map granule abstraction, configurable IPA,
 and MAP_FIXED alignment fix
Date: Thu,  9 Apr 2026 14:52:34 -0300
Message-ID: <20260409175234.40792-1-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260317175744.32469-1-lucaaamaral@gmail.com>
References: <20260317175744.32469-1-lucaaamaral@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132b;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dy1-x132b.google.com
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

Ping.

https://patchew.org/QEMU/20260317175744.32469-1-lucaaamaral@gmail.com/

Mohamed gave Reviewed-by on v2 (nits addressed in v3/v4). Patches still
apply cleanly on current master.

Thanks,
Lucas


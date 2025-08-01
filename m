Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E7AC87FCA
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 19:24:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhvMk-00062k-4O; Fri, 01 Aug 2025 15:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhtju-0006rs-5J
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 13:40:18 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhtjs-0005lY-80
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 13:40:17 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-31f4e49dca0so1994588a91.1
 for <qemu-arm@nongnu.org>; Fri, 01 Aug 2025 10:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754070014; x=1754674814; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y7ndOCk5hpDppQ64y8s+jnXZvyQJzUmSdKKeyb2BrMQ=;
 b=c8QeLmHiBF8jU6G+xNxH8cXs3h4ttT0ZkTK9eJrx7CjfEnhZF/lBbwMUrLExkSHyFd
 R7KaPKP4k6SwWlqjRZwrQVBLTB8SsW4UTkQQ73D1zy+PDe/HTr9Zo7/gpwGBApuQQVp3
 cQXuT1W5ctDV5BZDf+rxyPevIx2F5nBWa+rb4JxR7TFoQ16dsZXPUd+CtY+Lm5n93uNA
 sFMZMzNGUM0UDvs6fxxnAn18ueDjicfg4Wkn+fRedIPH8Op1KmVaC/+AAZR/wI40HGGe
 LvzY5m0IIjiphC+oSJV03BrcAOm2lMGiGEv17G4X0k7H0OHj3ZdgViuKdZRNS86GFFGh
 FNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754070014; x=1754674814;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y7ndOCk5hpDppQ64y8s+jnXZvyQJzUmSdKKeyb2BrMQ=;
 b=M72u3VN5EskutD0BfcMkAnNCokstq71Ne2XEHHa4sdUrXsdWwfd1NgKm50iGIc2S45
 DmyPKZ5D22arTlY19nlPgerHlcaGfIzhZHdkKPEhulOtpBHl77neiRQcKpgOTd1E7ipm
 x8LyvAnc6LI4HvVWd5gkyUlDEA064wbJifvqapMPz9dwAG4J9/izFV/0vkXPM050qrS2
 MkdELsu5fC6AhLNhJqkbCb8XYezOwY+FYXWpCMh6+d9oaGmyNAEuYeHOMA1m7mtVpWiE
 PmHJGVr5TREfPUfzl+4bW/uEqR3D9OIM1lb3djizyLq0eG4TerI8g09wu2sDljvaEtuO
 cJgQ==
X-Gm-Message-State: AOJu0YwXrlCmiRbMks9f0zhtg0NDt0MgbdAV/pgjW5QydzYCzbwZbTHe
 LTTBfFkJ5emt358fSQaghxf/XwlapPunhObeZySbdqJiq9dujbhW25WWLcYAXJl6MRM=
X-Gm-Gg: ASbGnctRFlXin5K6ThPGUo93H7F85l9cZA2XxcA/SGSuvf80ddz5rqLPtPWrqGf4yDP
 9P+nLnh6ykadE4USaWYKJvpySpVFi6MO3x2mKTyHrvRCHcbg5ySx54LRKCcsQqA+nyEahG/DYCp
 hrTqVeFFUncqTt51z/zVHlJ7d0YygykAPF17814k8uqNw02AwrY4IIyby+lJdYwoqqj+1aqKpuz
 SzD7XyOYrlxonXqwDKTaKeJ2aCcaInJPeoY56f25RI0FsDXM2TIscOVBw+bJizc84+42GsocyZd
 yv6WlWsbd6eHDhLGme52g1z29Mes2afx7OBXxqxFTEFU3OsCN5kvdJMHoMv/fCsrVbp7ggE0VZ/
 VLXENlwDv7U7SgEuhLxFmYAJoS184BqsS
X-Google-Smtp-Source: AGHT+IHTb8UgbLZ/Xnk1urV6PNhew3ZNopBBNBKjnVo1MWgwaJgCs0LoIcaYsGPJ+xLfbLjzpsi68Q==
X-Received: by 2002:a17:90b:3c07:b0:31f:7c9:2e66 with SMTP id
 98e67ed59e1d1-321162b517bmr698977a91.28.1754070014032; 
 Fri, 01 Aug 2025 10:40:14 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63da6141sm7972925a91.1.2025.08.01.10.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 10:40:13 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, philmd@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 0/2] single-binary: compile hw/intc/arm* files once
Date: Fri,  1 Aug 2025 10:40:04 -0700
Message-ID: <20250801174006.2466508-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1031.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

We simply compile them as target common code, without moving them to hw/arm.

Pierrick Bouvier (2):
  hw/meson: enter target hw first
  hw/intc: compile some arm related source once

 hw/intc/meson.build |  6 +++---
 hw/meson.build      | 45 +++++++++++++++++++++++----------------------
 2 files changed, 26 insertions(+), 25 deletions(-)

-- 
2.47.2



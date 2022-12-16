Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1731138ejb;
        Fri, 16 Dec 2022 13:50:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsgsKqJEW/8C2hsQEGRogh7FMeqI+f9UEbosZ9TwxR//HnoqdqlhKVHD2XSC9DC9dslrTjL
X-Received: by 2002:ac8:67d6:0:b0:3a5:24ac:a175 with SMTP id r22-20020ac867d6000000b003a524aca175mr1418848qtp.56.1671227451577;
        Fri, 16 Dec 2022 13:50:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671227451; cv=none;
        d=google.com; s=arc-20160816;
        b=CMc3Zzvdo8Py2F61jgfkrkevN+/u0LkMvqb/ZX1bOZoiqfpRbeZpril4Zs8qwCs0b0
         4a1/CTSro/SC6XU3Woa4jG4OHsZ7rJ/XO5s395owaP7bc+XMj1rY1+FYlFxceYzGhNw/
         uXCpS2Xe/b6V2mh17WJKlCA0bWMpxMkSNbevjAvxJmwaT7zNaQBgMVBsgg0QMVDheD3F
         paBw6MLKm9I+OhfmXIds5zVR7o4biOleTOtWv/HinYMwXzdbL1osU+dlQM6b8fc1WrDd
         N1WEW9xyMFfePuR91dvV7hPnY/gUW34mtOXOpuZ09KOkWHRIIv7jxc0N7GfYUGAALPHk
         +8MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=DS1n89zjWFctpH207GLU2vh7nlSlC63ivQwklpEZR0E=;
        b=HHp9kNnJ5UMGExQCvVfNu/yBZcj4k7k8FqTEsMZzvhrNCgYmP1Sibv+s/O5iuNlCYy
         SE/DQa4ZO2B4pjEgA2LzK5ANLIfo41ap66/aJNDRSFP0jgZsPiO++xtK6RxdzjVTe6AH
         TZnxImcbnkJptgVix6vdTIf96DdpDcdHZTdTZ7g+r7axswZi4KLvvWdjCZSjfJDxWSle
         +XaCLf9EG0fjZoDUX2XXTCMmR/x623NgxihLpXP0hOdTbUD6iDiidtTYzzeD2hzvuxl3
         cr+frP0QELm+nCGSBTN5GeuG7H5rC21Myg/l9eLyCZuFGX7Vj5Taxf+DXy8RrXnL1WV+
         N+Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xpU/wbdg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12-20020a05620a284c00b006b9c33a1e8dsi1378179qkp.752.2022.12.16.13.50.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Dec 2022 13:50:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xpU/wbdg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p6IaG-0000SP-Cq; Fri, 16 Dec 2022 16:49:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6IaB-0000Rb-1S
 for qemu-arm@nongnu.org; Fri, 16 Dec 2022 16:49:32 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Ia9-0001fp-0i
 for qemu-arm@nongnu.org; Fri, 16 Dec 2022 16:49:30 -0500
Received: by mail-ej1-x629.google.com with SMTP id tz12so9167861ejc.9
 for <qemu-arm@nongnu.org>; Fri, 16 Dec 2022 13:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DS1n89zjWFctpH207GLU2vh7nlSlC63ivQwklpEZR0E=;
 b=xpU/wbdgnHte2AhnyAwP3OKn6uS3is7+qO7Ebduusq/C2nkmjE3LNJdQ0+MmQgOg9+
 4QNoGspdPL2awxbKTBphW/6UxcLgsYPk8LDs1HaVgfdInz++cVPO1rVNUNDWxYCk3ndE
 ES4IVYSaKTMM1NTcuwyNVzkopelvE5l6S305R7B/YC+AI2Tq3bf4IQtA9TYEr6PHg8I9
 FWyWxJ/IG+awNkj7kMWs5d44DVufyAd9tHyIRX7woaNRNWICR5N9oJnxkQOOW4yCt1kX
 Jd9TSBJXh6tjkaaETUQuhcPbAgGzPjeDZmvkUmtEWP/Gc4Jp2AUIOJjT1Vo8eoH30tVe
 Az6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DS1n89zjWFctpH207GLU2vh7nlSlC63ivQwklpEZR0E=;
 b=GH+x6ZGkUzSGt8SHl/duwuOgsjRIAU1T8YyTVJt4EO8BkMi2yNCNqxQ9I63jCcuDxf
 fqmTLN+64hzS9eu/7bfNywO9ko3f30A7JyZZuudzig4eG6IQz4AgS6TMW5nQDJN4+3SS
 4uXlnynwtgo7KBwydzM0dotJylvtWymp8MGyhQc7wOtyTwa28yAKACSxMf+abbn0tt5l
 4cl5Hht2aljkpC9Zz72onblARc1VDc9anRE2wOaj3O6k5K+DCvtlEtx+LoAX5Zh0v7AN
 LZlG+aO6UwUgdiLMHjqvIWdsy/ax2hld6MMKOsu9+27hZ9x/XAtqBerRzM1y4NmN3e95
 00cw==
X-Gm-Message-State: ANoB5pkBcAvYnGu2HUrPYmOXruvQU/+Ophz4TW+ozjI9xAhTTkUZpDSw
 F+yZAVVSLZ7Sba3+zljVkdvCiQ==
X-Received: by 2002:a17:906:bc8b:b0:7c0:9f6f:6d8 with SMTP id
 lv11-20020a170906bc8b00b007c09f6f06d8mr26104000ejb.2.1671227367539; 
 Fri, 16 Dec 2022 13:49:27 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a17090631c500b007bfc5cbaee8sm1314418ejf.17.2022.12.16.13.49.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 13:49:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/2] hw/arm/smmu-common: Avoid using inlined functions with
 external linkage
Date: Fri, 16 Dec 2022 22:49:22 +0100
Message-Id: <20221216214924.4711-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6SPM1shTJzfI

Avoid inlined functions with external linkage,
convert 'inline' header to 'static inline' in source.

Supersedes: <20221208161152.28976-1-philmd@linaro.org>

Philippe Mathieu-Daudé (2):
  hw/arm/smmu-common: Reduce smmu_inv_notifiers_mr() scope
  hw/arm/smmu-common: Avoid using inlined functions with external
    linkage

 hw/arm/smmu-common.c         | 15 +++++++--------
 include/hw/arm/smmu-common.h |  3 ---
 2 files changed, 7 insertions(+), 11 deletions(-)

-- 
2.38.1


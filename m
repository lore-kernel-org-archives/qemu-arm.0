Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1467913ejb;
        Tue, 14 Feb 2023 09:21:17 -0800 (PST)
X-Google-Smtp-Source: AK7set+UGuRocl9slYWP0fOo88hamjNiy1fGEjfN68+yPQoJjEscB8z1OzHhwLskDIQ2ZoFUj42d
X-Received: by 2002:ad4:5de6:0:b0:56b:ee99:b11 with SMTP id jn6-20020ad45de6000000b0056bee990b11mr5036875qvb.40.1676395277726;
        Tue, 14 Feb 2023 09:21:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676395277; cv=none;
        d=google.com; s=arc-20160816;
        b=yhQdHaypiOGjQumaT0WEXhWXJ0KPgcUDEnGhJ29bDOmAnni9aE9B4lGVziQFxFnS60
         MZg1Q/oW1BdjtONHK/idhu/6J/bmYcnPW5ygA7taT9zRMriOFei45dKnwEGDbj9WxbYC
         l1EwPMK7GjLj4ubLLdvtg+RJTOFT4NWgWKzYfyUCGNbnGkWJTOEhB/Ghqbk9Gi9UKR/C
         LDjA6H5n8Y/1rG8n7CBOPjtxJYukDcgvHOHN89O5OYWDAEVHW5hSOvzgfiIsQiRklccD
         zOhbHmkMZixxfXQrHyPPUMWSvRMC6bN36hku21JezvvVcq2+DJcPGv2iVcL64qMf6nKS
         vNnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=xo1s3tezkxPZTGckGZcvwnxUiQDZL/tT+JHyzRXDrJE=;
        b=1EeQDMWlOzqQCjczZgClkKAaLJYpNeC0qmmuE2zIOSeMNBHG+xOfB6Fm7kFznPmqzh
         HQLmphmDXbmldB5z5X2RURzryTVH+0ddG7f1FLJWY5bBaEdwuf8t4fjhhcB55DpYgEK2
         O6ykI4vtm17rDiC8Vg29coDT6cqTnrY916ZRH5o3E1uJI+tq/vVpSfaoYScJWzVlzTsB
         ZJdsUFaot8c6vNcRfauKiD2mLzzyRoEKGZRCDjb/xYnA07CFVF/t171eHb7KSPMrK+AH
         KdixJuQW1UOOztywVujrW+d/mOMsESnlqkrAlJaSY5/4bP3G6uN3TFZd+umxgRqUUk3g
         vz7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V616EZlA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7-20020a0ce007000000b0056ec16234f8si2608446qvk.350.2023.02.14.09.21.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 09:21:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V616EZlA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyzQ-0006Re-IJ; Tue, 14 Feb 2023 12:21:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pRyzO-00069I-3s
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 12:21:10 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pRyzL-0005e3-OV
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 12:21:09 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so12162842wms.1
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 09:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xo1s3tezkxPZTGckGZcvwnxUiQDZL/tT+JHyzRXDrJE=;
 b=V616EZlAXUlWe05axTV/iIkJ3cTzwJr6e4Hy3sfBpCDOVm01+TsbwfsdS5wBphYHJP
 8Yd7yf46TDCVDZ3vMXhfQL4iXAkuta0KAMiu9p8e7YCf6EWnjp8H2BPL3y/q7m7dAKfR
 2AB7Y9u+WFeowfsHPLLywY5dYPNJ01A2SDIvkkeeeZpkZFyb+Y42EzEeZsGvovI2P8+t
 1j28+iWjIqPBRfGkAsswCvKR41/T1tAv4HXSkYNwYJzfq2mSpbJJVQZgG+s9rpVz9TiB
 yafyx8yE/9k5Pn8kviSZ9HaxZEY1XmrIJreAuPF6ITer+OeZuhb56lrtGI56rmr3N6gZ
 odFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xo1s3tezkxPZTGckGZcvwnxUiQDZL/tT+JHyzRXDrJE=;
 b=WAinA51TaPlWDcwjHK+I0SPcp0KN/iUDnf5B7Sl5cS12MsrJRsl0Pm6g60AYU2lMFd
 4Td5omK4cGFIikMtoh0dz5BpWCiBD4ND7GR9kRB0RAfFOQuykRsIFABhYOLiCPOOlIWR
 nWJm2dbIqI10jtPMu4mZeW+eiYvBGfgb1OsNHmDg5QAfLO4XVY5WMCi55KeZvrjWAHw/
 QDpYmCdr33LMHSbcBHzTPnyU7Ex9QJBRTPX+3lYVJAg2rta9LXz40VOIEDkicuZVzjk8
 HRXK4o9QxhDxbX1+xNjiClXDjh4fC4m/nF0+rYjInLHPhO5qDW2DpegPipGyNbLjFek+
 /KvQ==
X-Gm-Message-State: AO0yUKVBNeW6aP1UrxdgbAZMoiqqb/YdxyOVlSRU7MheACvHHMHECpZy
 3+n46d3uf5z7BFz9sRJKbuMh0A==
X-Received: by 2002:a05:600c:45d2:b0:3df:9858:c02c with SMTP id
 s18-20020a05600c45d200b003df9858c02cmr432707wmo.1.1676395266173; 
 Tue, 14 Feb 2023 09:21:06 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 p24-20020a05600c1d9800b003dd1bd0b915sm20636570wms.22.2023.02.14.09.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 09:21:05 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, ola.hugosson@arm.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 0/2] hw/arm/smmu: Fixes for TTB1
Date: Tue, 14 Feb 2023 17:19:20 +0000
Message-Id: <20230214171921.1917916-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eCcH5X6YXBic

Two small changes to support TTB1. Since [v1] I removed the unused
SMMU_MAX_VA_BITS and added tags, thanks!

[v1] https://lore.kernel.org/qemu-devel/20230210163731.970130-1-jean-philippe@linaro.org/

Jean-Philippe Brucker (2):
  hw/arm/smmu-common: Support 64-bit addresses
  hw/arm/smmu-common: Fix TTB1 handling

 include/hw/arm/smmu-common.h | 2 --
 hw/arm/smmu-common.c         | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

-- 
2.39.0


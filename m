Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp115540njb;
        Thu, 5 Dec 2024 05:20:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUdyYZ+ShhQ60aIWNvoe4zcVAORlXS2uDCwlBin1xLrrSBu3NqkXbt6nblfP5bYXx0CYkEjW3O9z69MzQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFZADBeLl3u8DHcA1oiEwFr6kh46vMQHN8LglP6dNHUPmc9yzwR+ApfpGKUiMiYU/hxUBLp
X-Received: by 2002:ac8:5a4e:0:b0:466:9a2d:7c26 with SMTP id d75a77b69052e-4670c0945b7mr168792521cf.16.1733404837339;
        Thu, 05 Dec 2024 05:20:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733404837; cv=none;
        d=google.com; s=arc-20240605;
        b=ircyqkHFeAZHnUvLk7ZmrOms3sXYYNW4QhagLN3xwUnwkX204JMVLEZE12DVfFgwyk
         1aHgM8wkKu67AdbEFV16G8/KmO9HV3/YNpdnlQGqio0mO9oXoZ/90VGvQEHSoOvlPXMC
         ONC1HVVjgxcWWDUMe0SJkCMK9Fk7Vqg88XgD7/fHtL/PPoi7Id7Onf/XbX/MUovBwL0x
         79//dMxzyVDT55Uy2Kri38i0N98SpUtJAVpOMg7LSCC+2Xjkol2Bqnb9a7TM7H1PH/B9
         +CJYHOAr4Mu2rB3rkn09BKY3zdMtNoHg/damo53Ra1cc5Lkk80KZkWV/c4XRJchKRlII
         oiIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Z2b/MtfBhXM7hhPG03X99pGZ9fBu43omfSIvMRC20Tw=;
        fh=uIl6wBkwb+TFtHrtexJa67OAdOdZ88tAkdP3hQu58dk=;
        b=fUb6zbPzS99NNRx5li9SyRLLXIgAa5hAN/J1qTzo/ziX/T5ByevRGUaHRdoE+OW0zd
         l2oIfsqdlpFvNqhMzDB/DV5Q9TiFLK69KCndaWUR3DL9VcNyU5yOVrkfv7YUusj8jSgT
         b2xTCB1WkVn5xg92YvTg1H7wGscZ2rrwg5Td+4qLBVjKJKgTLCKoH3Go1/GGdrx0HuYg
         8/E9ytMszKC4s1514p6uNE6ZzboRI4o5WDDNESbj3dGlP9d+ytRNiJq9u0U0KnuAYoJx
         g57ekOcugC3/86GZOIKVSvwN0D3ME3+dlrbV1hLIDfLHFklPNAqs4TUJH34qWtPApgmZ
         MS0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ijQk0a35;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46729836df6si16914011cf.517.2024.12.05.05.20.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 05:20:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ijQk0a35;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tJBmJ-0005qo-IV; Thu, 05 Dec 2024 08:20:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tJBmC-0005n2-VR; Thu, 05 Dec 2024 08:20:18 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tJBm7-0002Ql-AI; Thu, 05 Dec 2024 08:20:13 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d0d4a2da4dso1384926a12.1; 
 Thu, 05 Dec 2024 05:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733404807; x=1734009607; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z2b/MtfBhXM7hhPG03X99pGZ9fBu43omfSIvMRC20Tw=;
 b=ijQk0a35mRPUyd7DET2nntTSG2J/CaA+qV6yxS5/5qQIe5q/U6icbK7jnBKPnZ/lFX
 9GwuuMqDZADfKbCtZ9LMyUSMcjizOJ+lsQbzimFVscMdemrjYD3oGQtUmRtjraRVecpE
 XjLfUhfa+nXBCn21lYrzKsnL2B6e48eA3x41UNsEYuZ2IadKgu5OAVki44uYMM+lOd54
 adCxlfiP+cBU1IE9MutppFPFrQ4qIc4boS6KKcN7MqI0YmiQFz7Ex5Xrohiu2edUo36U
 dYUI215W0jT7OKjuhzR/5CApmnLXLxZRKmDuiTHaIkre/U07rYpiH0zx5sDUUPkkLcH+
 8XJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733404807; x=1734009607;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z2b/MtfBhXM7hhPG03X99pGZ9fBu43omfSIvMRC20Tw=;
 b=UXfPO52+kwEZSr3ut14CKC2/4HgVJCkmFbiYfnoFFlAyW8S2tYCri77zs5iVH+lOfb
 P4nBJrjGKrwt7MWqercb3JJ+71Idz5aCz7BmEZJ2rCnwDn9ptJm8eG+tFEfJ1jLeUG+9
 uzn+NCGQtgfs1Kntzfrzy/UodOaIelnz5nRK0wWbdCh02IghVLY0JluQn7Y4bkgiHcAp
 r3pdEzeFSwhkvXsuIO8c72Zw8CEyAHVI1MtBx3QeyyltaBj0PIsccqhnKmqxQmx+dFd9
 lWLcXcSFgAZPIOtVDQA6wpbzCYrgXXDITm4E3qFc6dteiS+r66wGS7IlynkWnBUoOLEN
 dxYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbZYBEoBsrqXwNeHZjvWbajN+xgKJRnnjxtYAKvghh5JHz+2PGkOc0Wcd2j3wulir1War5HB15jQ==@nongnu.org,
 AJvYcCXzXOiy2TPXUlyKU3mIa8O4f9Kj+ZyV8ja84c0lTzPBw94I5TVT4rwOqMXKdMzg6HaP9kQJezwzlpDNNA==@nongnu.org
X-Gm-Message-State: AOJu0YxTdT7p+hkknJdzPaKngh9owKg4FZB4gvB+fYAgtiX/QqZZ4Txu
 AHU+hhDcLFda9Zb274AhCP582lUlo2YCsrrvOltfyyzH+eKza216rkKxwQ==
X-Gm-Gg: ASbGncstHiRcZ4AKKJfS6m6gYQqstEyGqho44+V/nG3AnUDXf2XUdt16DQNDacNA/Es
 CwslmRTOHsVG82vINVfRxf9vjglY9DUQgcdJk5Gas4PDsy/T/aN9JQg226sqwsUpRh0yeU5R5I9
 sz/E4BQLfubuQS6kBXIn3nhJvSLvLh18PxYAn7RV6LFdkzrCLyFoWWgcagUP4urGCXFZT5nGsGx
 FrlwtnvPh+zF/jyNFpS88Oby3ADBqs4qecugjWdaCX13w1Ia4UvpG5vv5hVQSzg5iuzCsTL2Vcq
 DfRt9ZCvm0XaPzpkvlebcDb6rCImUkW7J+M=
X-Received: by 2002:a17:907:75cc:b0:aa6:326a:bcc4 with SMTP id
 a640c23a62f3a-aa6326ad636mr29417566b.1.1733404807135; 
 Thu, 05 Dec 2024 05:20:07 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-054-030-063.78.54.pool.telefonica.de. [78.54.30.63])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa625e92a58sm91959066b.48.2024.12.05.05.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 05:20:06 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Peter Xu <peterx@redhat.com>,
 John Snow <jsnow@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 0/2] AHCI cleanup
Date: Thu,  5 Dec 2024 14:19:35 +0100
Message-ID: <20241205131937.32833-1-shentey@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLY=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: J1WpR3fyahRw

This series fixes some runtime overhead when handling interrupts in AHCISta=
te.=0D
It then extracts the SysBus implementation into a dedicated file for separa=
tion=0D
of concerns.=0D
=0D
v3:=0D
* Remove extra PCI include in ahci-internal.h=0D
* Extract SysBus implementation into dedicated file=0D
=0D
Supersedes: 20241205114453.1848-1-shentey@gmail.com=0D
=0D
Bernhard Beschow (2):=0D
  hw/ide/ahci: Decouple from PCI=0D
  hw/ide/ahci: Extract TYPE_SYSBUS_AHCI into dedicated file=0D
=0D
 hw/ide/ahci-internal.h |   1 -=0D
 include/hw/ide/ahci.h  |   2 -=0D
 hw/ide/ahci-sysbus.c   |  91 +++++++++++++++++++++++++++++++++++=0D
 hw/ide/ahci.c          | 106 ++---------------------------------------=0D
 hw/ide/ich.c           |  17 ++++++-=0D
 hw/arm/Kconfig         |  10 ++--=0D
 hw/ide/Kconfig         |   4 ++=0D
 hw/ide/meson.build     |   1 +=0D
 8 files changed, 121 insertions(+), 111 deletions(-)=0D
 create mode 100644 hw/ide/ahci-sysbus.c=0D
=0D
-- =0D
2.47.1=0D
=0D

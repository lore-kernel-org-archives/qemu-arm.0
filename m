Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1781012lfa;
        Fri, 16 Oct 2020 11:42:19 -0700 (PDT)
X-Received: by 2002:a62:e113:0:b029:152:69aa:6a08 with SMTP id q19-20020a62e1130000b029015269aa6a08mr4954372pfh.14.1602873739536;
        Fri, 16 Oct 2020 11:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602873739; cv=none;
        d=google.com; s=arc-20160816;
        b=RMOOEo9B0TuxG2L7ITbywvkSR8ndEhW5PGQ8jEW9VHBvd6RhraIqGkeI9dLoJ/KfVr
         u3l42jLsLgdGabpb3T3jT4jw/6Kg8+64CV8AlLqbIJP1XY3HzFfmUjxhT+kBzoWjfvWC
         48ptYG68c1lrgaf7/nwFvSv0cos8KPT2qi8spbcRtbms7IcyyTdPfn+j9V0KWxKNPm3X
         R3t8fpnTHT+Stum1LrLH0KeLX2zXwXyhAKRUqyPvfjzMHnvmjv6RR4hFQuYgRoUjhO2A
         y2v4UyNG5NRkWQsj0tH0EinXKrWHYmnwDAC4BTlV5gFKyP0Fe8MHa9GvDd1s/qaGeuLg
         f6lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cq0uFj4EPvaT7XIB2x7QEFAKMyx7fIErYUcL6pVPEzc=;
        b=RLZuOySebld/mYWIxh5Na9FEKcrfQUMwpbJkb3pmskwHnLXGmMe/rf+gYpLDnLRMIt
         sm4WiQKPN2zap8kBih4fZCVA6Ux6me8MFrk4cUdm6uW1so//qNcvaOrVkocI5zMOZBNt
         xA8jJ2gvQPzj7AP8jAPY46wa7Ceh7FGn47kjMRB0zzvTcYvNvgr5DvFy/cUTAeP1Ghd2
         rjx8FncN5Aer4YZu8Zk6C1p+dI7X9iCgktba9XMdOGdxpiBb2Kjan8vu/GZo67+EwDC8
         WZCWgfzVCmahsDmBhg1g6SboCncAivFMH5iMUsbCOfql4qWGOvTpsXixUwvSeWv8jvHu
         0n+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AJg/GSpf";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e2sor1483384pgo.20.2020.10.16.11.42.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Oct 2020 11:42:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AJg/GSpf";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cq0uFj4EPvaT7XIB2x7QEFAKMyx7fIErYUcL6pVPEzc=;
        b=AJg/GSpfwAMptofEmN8Zw5f4rcthuQxJ81zUqSvkfobf0mE1Mqu12+dzUkqRuPBP+Y
         EWqoeZbWR8pMmSJriG2PaLg8DQq/BNdjJOMNZo388vZqsb/jgfG1OXDHnivQuxZgq2qm
         4tzIEGLh/UrfqkFMbJOSj9LeeS1kPlEXIBt+UCpm+x36VQE6awlSxkZstPcZNkBZQZ/B
         J1EMUR8WAzG1WzLgbR224vjBJXpzT34cLCr/njteowlo9FYv5Opd3mECoew3oK5tVD/B
         6vaW8JuModd/7By3W/t8eu4zfoGzuS1BTdoY016rMK6zLKtsgMxMHwamw+0QvETfd9mG
         /5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cq0uFj4EPvaT7XIB2x7QEFAKMyx7fIErYUcL6pVPEzc=;
        b=AmdZtmzCVQ1ff/GbAvzkZXXWdIR5DgjotTnzoZctVomg1rObaV+W0ZpQt2zT1zgw3+
         Zw74+JCoL0xS+zeG08NzGQDNynMsGromAeUsWoVLxkcaSHgdMMUbsf8WNboZTqkMiNKN
         7AiHlG08aVJ24XMSxe5Ec7wjKyTsjPYZqqnm0r4myXKZvvbXvqLz+SkX0fnos58ZMgXF
         I1cTL2EKgN1o+vchLD17BWqwWkikGIyc0IVyAYZVFESx3KX0AaSgCpToThomLAM2wS0Q
         kY3L5hDzS8Rc17eTsMOyklWcTHbjxW+uU9dOJVa5RXXGMUmIQnsbeL80avRHjk110bZD
         RfKQ==
X-Gm-Message-State: AOAM532ahg3hNO4pwoZtpsiau6ermnT3gsQgw0206WIpwJjC933RosD5
	2pHZHZ6cvStu/NakUf209aYkytHp
X-Google-Smtp-Source: ABdhPJwmi2tPKDAF6m3T2YgJNvP1tGgjdNcnLIW71R9qTvkP9PVvOFhpZmQQiYipJhEN8sYoetjQTw==
X-Received: by 2002:a65:6493:: with SMTP id e19mr4219366pgv.276.1602873739069;
        Fri, 16 Oct 2020 11:42:19 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.141.89])
        by smtp.gmail.com with ESMTPSA id c15sm3426011pgg.77.2020.10.16.11.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:42:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v11 06/12] linux-user/elfload: Adjust iteration over phdr
Date: Fri, 16 Oct 2020 11:42:01 -0700
Message-Id: <20201016184207.786698-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016184207.786698-1-richard.henderson@linaro.org>
References: <20201016184207.786698-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 4sAIcRYcHUi5

The second loop uses a loop induction variable, and the first
does not.  Transform the first to match the second, to simplify
a following patch moving code between them.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 290ef70222..210592aa90 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2426,17 +2426,18 @@ static void load_elf_image(const char *image_name, int image_fd,
     loaddr = -1, hiaddr = 0;
     info->alignment = 0;
     for (i = 0; i < ehdr->e_phnum; ++i) {
-        if (phdr[i].p_type == PT_LOAD) {
-            abi_ulong a = phdr[i].p_vaddr - phdr[i].p_offset;
+        struct elf_phdr *eppnt = phdr + i;
+        if (eppnt->p_type == PT_LOAD) {
+            abi_ulong a = eppnt->p_vaddr - eppnt->p_offset;
             if (a < loaddr) {
                 loaddr = a;
             }
-            a = phdr[i].p_vaddr + phdr[i].p_memsz;
+            a = eppnt->p_vaddr + eppnt->p_memsz;
             if (a > hiaddr) {
                 hiaddr = a;
             }
             ++info->nsegs;
-            info->alignment |= phdr[i].p_align;
+            info->alignment |= eppnt->p_align;
         }
     }
 
-- 
2.25.1

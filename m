Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp216451ejc;
        Sat, 14 Jan 2023 08:13:54 -0800 (PST)
X-Received: by 2002:a05:6000:1289:b0:2bd:d812:9465 with SMTP id f9-20020a056000128900b002bdd8129465mr6928396wrx.7.1673712834158;
        Sat, 14 Jan 2023 08:13:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673712834; cv=none;
        d=google.com; s=arc-20160816;
        b=CzZO5xbjT5S/d7U3tid6l8ykrQghXZfz8d/g/jsCf2oRCR0QuR8+UB6pNHBrlzStAf
         b+Plt7A2uqGpxUktVPJ3CdZ0/Ja+Yv9TkiJOh86dlKLxlaLwPWK6xvlAKH/vblDSg5iY
         vEwUMir+Bp/Jp5HwEmD3O3uIBteseDGB+RZUtMfVa0C5E0lns4lGFlBaVYlFbTXlmGpm
         fZ1nlb7MUnZ8XDy9oighbAYshv0YRf/JLMLsOgdIprQ9aniDtOsiPHDN21QZB/S+88O/
         /FBrzEKW4EvO/iNyR8abADdfcxGsssf+nTMsn2T9Wu9Mq82asz8jYiaJFIlHZE5Q9lel
         D33g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=roNn3SpXSMUmx447vswU4kZUnjYahKbuV9DtjkyBlJM=;
        b=0uxKQIWmfS9WE/vXedk5fi9aV8i5zjkHxCm1psbgDQAa2zsnVXFEP3R6PhP/FK06/B
         w7/ohNuy7YfjyZVLDxHuqJHcwSN34Aivapl9CupUP+jqQtQWXtAayvT2duIgjjnbR8w9
         19MWWGhk0Nn6x7jfV+UOP1ObLCADePqeZ4VgxCNKLnRzhfrw7/RyPYqLBpOU/QugGvlw
         xV9uaapIIK1NMVq2DC1L6x0NdmRhcZX9T8oDZFAFSIGvCZSaGYAuXg8pigCaNZkm7kFo
         e5S9kYmr2hSJYvw6+5eCl2zWYrbBFT6h3x70qwaVm7kndrhDH/rOj6fykAhzLQ4jdasF
         fzNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=R1edhttx;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <francesco.cagnin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v4-20020adfc5c4000000b00242075d07a3sor9594356wrg.7.2023.01.14.08.13.53
        (Google Transport Security);
        Sat, 14 Jan 2023 08:13:54 -0800 (PST)
Received-SPF: pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=R1edhttx;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=roNn3SpXSMUmx447vswU4kZUnjYahKbuV9DtjkyBlJM=;
        b=R1edhttxRmW5MGnOPQsODqzst+ujrIYeE1qUoqgVH7ypmUKosxp1NlsomEPtBqudtD
         FthPxl1epjxrjQyT6q5RLLspxyJb1maNdcwQLClnw0VlxdsPkHUA74ajAciIfhh29V8I
         WMmTmvuZJZC64ubkXICyfvQaj93QT1CF2MnHHxXEO7bANt9eXA2GElJktJFpS4jsC3YL
         LXsTQedQtSGh/P+UTDGAx9ykJGl1w2o+gZzpcmY3XoVr4pE6WnKHySqmyRmRJ41nWH68
         mpAkdqi9+3hNYoImi6CvLOKKVXMI2Uh/7XGdEr5uW/kbRTOIKA0rkm1qcEzkMR1a6be+
         o/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=roNn3SpXSMUmx447vswU4kZUnjYahKbuV9DtjkyBlJM=;
        b=q4jUZsvHdU9cM3oP8xZvoeLMqHWzQ/i4pXfgqzr0cDrlJzYkU0/g6bUNRUPMawxSjW
         KQJq8meVRTsxBIcihJSyrzuKCQ6cDsBAMfvWiK54waUjf4gKlHy7leCETqIwcU1oOKkR
         zwEuZ66FYSIt2W/oWwF/4ikFshaoGVEeErQ+pNnLLE1F9Bz2gBWsfAuWgCoWHb4YlTrr
         Du5bc2sjt/h7uy2r3jAYvS9vFObZ8IyHdMJ4I4ZN6wXBQuIo6A15TT2NY0z6NlHBdjU4
         SU+oMNxWaVheRpXM4EFQzctXjrZ/quD85NAfQ/g2ZOP7HSCz8aE+y1PFHmCWO4ImnOiA
         zxbw==
X-Gm-Message-State: AFqh2kq0/NHVyJF19UHoJuffwepuKbmYg9tohXLWjuPomKmvacAv/ow2
	JFcx+v81Kx16gepEb2AzjYc=
X-Google-Smtp-Source: AMrXdXt7SmpRyXNGYqQG44mXxmQdlMc8cbVxZSvTGVccTJ0tIa8yWiCdsxbnVeptCgmE9maJ1Wr63A==
X-Received: by 2002:adf:c70b:0:b0:2bd:ef73:3b6e with SMTP id k11-20020adfc70b000000b002bdef733b6emr2074901wrg.35.1673712833827;
        Sat, 14 Jan 2023 08:13:53 -0800 (PST)
Return-Path: <francesco.cagnin@gmail.com>
Received: from omega.lan (194.46.205.77.rev.sfr.net. [77.205.46.194])
        by smtp.gmail.com with ESMTPSA id y18-20020a5d6152000000b002425be3c9e2sm21330040wrt.60.2023.01.14.08.13.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Jan 2023 08:13:53 -0800 (PST)
From: francesco.cagnin@gmail.com
X-Google-Original-From: fcagnin@quarkslab.com
To: qemu-devel@nongnu.org
Cc: mads@ynddal.dk,
	dirty@apple.com,
	peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	agraf@csgraf.de,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	Francesco Cagnin <fcagnin@quarkslab.com>
Subject: [PATCH v3 3/3] hvf: handle singlestepping over instructions which trigger a VM exit
Date: Sat, 14 Jan 2023 17:13:02 +0100
Message-Id: <20230114161302.94595-4-fcagnin@quarkslab.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114161302.94595-1-fcagnin@quarkslab.com>
References: <20230114161302.94595-1-fcagnin@quarkslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: A48bnSjgxTq2

From: Francesco Cagnin <fcagnin@quarkslab.com>

Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
---
 target/arm/hvf/hvf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index c63e8da6a5..87c531508e 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1807,6 +1807,10 @@ int hvf_vcpu_exec(CPUState *cpu)
         pc += 4;
         r = hv_vcpu_set_reg(cpu->hvf->fd, HV_REG_PC, pc);
         assert_hvf_ok(r);
+
+        if (cpu->singlestep_enabled) {
+            ret = EXCP_DEBUG;
+        }
     }
 
     return ret;
-- 
2.39.0

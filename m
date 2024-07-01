Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1286648njm;
        Mon, 1 Jul 2024 04:03:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUIxe1y39blD4Xz4N9Mi3sdgyXo+LmGluEEW0HWyLKKcNDtRjcICfHiimNMDDKRTm+z8NdoH2vTjA4CHQx2DXUg4upy9E2Y
X-Received: by 2002:a25:70d5:0:b0:dfa:c779:2404 with SMTP id 3f1490d57ef6-e036eb6f75amr5033453276.30.1719831829138;
        Mon, 01 Jul 2024 04:03:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719831829; cv=none;
        d=google.com; s=arc-20160816;
        b=l1VxfDw5VYFgWsc5LCu284J2fBbvJYLf8sJo3EBG1WPHH/UbCs+RrKy9jZH5eXhfkH
         R2EpZJ+UReGcjSDDJqdzGVmb+IUugscIkyFvadzeXb7FX9XpCzYNzCGcLXikV6hqToR/
         1ZwAcsI/NgVQ1pVtolNi3ec8vuGsCTRUO60OPTU/r5diomoJGdI9rlNArJvezGKpM00e
         UeHQc9Xuqha4v6igbnusPSYYwipdPd8r9VTBP9jqKROgcvH3KxOSBeRt+F2Xl3uCE9kW
         UrBtjiBQuH6/pP37lLkWzt+sWYUnMlAVto/k6U30ZALvh2tkw9Ls35N98DW9sVRVHhdj
         rbUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=6TR1HS5bWU2AxlHLeEesw9bRSeiZbSyPpeNrZyRvosE=;
        fh=fDwKwNQXcLk+J+Brc2TMklrJBcFUJLYGqF+6vQXm4Ck=;
        b=0KVgiFN/iuxnxTqKOxkxprZyqFaRoXvvWN2A7+m74IIq6bFHi4Ovp9eQ3jVzcNMCS2
         rRELXOyWxRoUsLKsajeb+635yqC8gp5MdQfnFsjC/S30MQSuGyGQV1cACleFjZ4jUvtk
         bdw9GnlkLlp5R1eZVrkSLC3rN6IpUB83l7mCRVYVVPWGDBW5aZMNOb724gRPRzuielzS
         EL+qUpIEESP95FbhlA5zXqmnPyu6TaTqqaAU1wj2fuM0iWofY8gw7aNEtdFHFZSwrasG
         ID/PGoBpDeuZ4qTxuNhNkD/Dse6QtepyKBM/mevXj93bB5Ed1h5a1NadulsMqwPiBp4a
         Uubw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="CourtC/a";
       spf=pass (google.com: domain of 3fi2czggkc3mjdfjkrwrxffxcv.tfdrcvo.sveevvczerif.fix@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3FI2CZggKC3MjdfjkRWRXffXcV.TfdRcVo.SVeeVVcZeRif.fiX@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3FI2CZggKC3MjdfjkRWRXffXcV.TfdRcVo.SVeeVVcZeRif.fiX@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 3f1490d57ef6-e03629db62fsor3183495276.4.2024.07.01.04.03.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2024 04:03:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3fi2czggkc3mjdfjkrwrxffxcv.tfdrcvo.sveevvczerif.fix@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="CourtC/a";
       spf=pass (google.com: domain of 3fi2czggkc3mjdfjkrwrxffxcv.tfdrcvo.sveevvczerif.fix@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3FI2CZggKC3MjdfjkRWRXffXcV.TfdRcVo.SVeeVVcZeRif.fiX@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719831829; x=1720436629; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6TR1HS5bWU2AxlHLeEesw9bRSeiZbSyPpeNrZyRvosE=;
        b=CourtC/aEZWX8k7ut2XdY9Vy8DkvuLTIVjp7Z/Pp0EHV6aOveAfeyzfjhwd8kQuxyC
         xeKoAXY/IkMGQLcA9qJLNjYEFLusv82APrpYk3m+YZC9Vq4A3DqlOlWzXfBLQ7XXcuZ1
         z+xMHmgMlI3lOBgSHq6BY763oOjHf3qujb7qtWD7NdHhSgf4rmsAeys4sIDn1njzrodX
         JVCGuO8+hoUz9gCfFQVrHPefQomljYkrdmAoZb3ngIYAbv16kuPdD1oO2tumUMwJSEeG
         86Fi6/NzLsmP+yr9vMWl3jnlB+Wr2VyPdm4ZWF4ak+fMmOTdnkB4PtrQu5f9YFx+3Mer
         04Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831829; x=1720436629;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6TR1HS5bWU2AxlHLeEesw9bRSeiZbSyPpeNrZyRvosE=;
        b=dPfZs7JQgUTKepu2R2lYtNgl3YO9Yo58qI3Zx0s/kBiLU7LTIxpt69y18U6EkisLfX
         hlkvy2GH2fQrzBurEgHUMspKFQ51mzBWZMQTkSDanDIyGkvC5MHJ5+llWha1o/bZdhOm
         /3UvBm3eAt2i6G6E5GEBKarnbLMriekw53/gNLevcgkRmKhRciMkOuj4XNdszd5D6i34
         8ulA2ScMoJEaX+WC9o3enN4JgWcFF/f5O3XEBgqIB3BBRooQyoeEHv+btSbMmt3iDO31
         jj+64UwlzPO/sDRS3uoBUW+m3LP6G2TPmAZwB5xOLQDmDJbtBf1VKnW8ZKNVcjVaG7FF
         hZwg==
X-Forwarded-Encrypted: i=1; AJvYcCXhYOKFGTcl4XLeTctzgWR2769u7XDwIzdry0tr5t9oftGjUKrdt7yH2OOKSkGj2eNma7yGD//PCkXl4h1/NvMF0coYhwz9
X-Gm-Message-State: AOJu0Yw9X3SokEXrxfHlNf7cd6R2Y9Rf976zPUhC3ns4lx3EXa0E0D2A
	F3oQn5Ogp1N3IirK8a3VBR4cNJyPNJ1JZthLXBysjd3ZaRIImfNCjeuq4v0FiqUdgqTjWfie1C+
	XKrIJVB7/dw==
X-Google-Smtp-Source: AGHT+IGVML7+woJDQJX7i+rDLaTenKLiX9jbgODjdeZvesO9hvvTUdn/HObsiOXs3fIFdg3+lF6FxyYdnqVR1A==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a25:dc90:0:b0:df7:9ac4:f1b2 with SMTP id
 3f1490d57ef6-e036eb485eemr148053276.5.1719831828787; Mon, 01 Jul 2024
 04:03:48 -0700 (PDT)
Date: Mon,  1 Jul 2024 11:02:40 +0000
In-Reply-To: <20240701110241.2005222-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240701110241.2005222-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240701110241.2005222-19-smostafa@google.com>
Subject: [PATCH v4 18/19] hw/arm/smmuv3: Advertise S2FWB
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: vHdBeyZcybBZ

QEMU doesn's support memory attributes, so FWB is NOP, this
might change in the future if memory attributre would be supported.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 807f26f2da..88378e83dd 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -287,6 +287,14 @@ static void smmuv3_init_regs(SMMUv3State *s)
     if (FIELD_EX32(s->idr[0], IDR0, S2P)) {
         /* XNX is a stage-2-specific feature */
         s->idr[3] = FIELD_DP32(s->idr[3], IDR3, XNX, 1);
+        if (FIELD_EX32(s->idr[0], IDR0, S1P)) {
+            /*
+             * QEMU doesn's support memory attributes, so FWB is NOP, this
+             * might change in the future if memory attributre would be
+             * supported.
+             */
+           s->idr[3] = FIELD_DP32(s->idr[3], IDR3, FWB, 1);
+        }
     }
     s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
     s->idr[3] = FIELD_DP32(s->idr[3], IDR3, BBML, 2);
-- 
2.45.2.803.g4e1b14247a-goog

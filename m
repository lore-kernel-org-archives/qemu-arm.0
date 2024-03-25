Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp597625ejj;
        Mon, 25 Mar 2024 03:15:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXIiHzWUfXjYzigrSm9KE5uuNhPQvm1RP5MJ4WxuMoIEc9rLP/iWNXhnYzemfUg1KV7H7W3bLnTJUPdKpChIvfSRTJLmmB5
X-Received: by 2002:a5b:590:0:b0:dcc:7b05:4cbb with SMTP id l16-20020a5b0590000000b00dcc7b054cbbmr4363526ybp.31.1711361724804;
        Mon, 25 Mar 2024 03:15:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711361724; cv=none;
        d=google.com; s=arc-20160816;
        b=dl6NgwAa1pn5npdE1yVFdjgdMNVyMYVozcvzH23r3TPV4yJ4lXB7rCbSXp4DoQmvNM
         WskQetlsyGY0aeypd+bTGCyWuVZmBKR7+NrJd7NaG2pXYaDaTSOTdXJao9PpZQnJ6tMd
         YLhADnza0fPv5WyajnPgLkTpOYlJjrHypoCeJjLiVk2mh2TzEtwjEzeh29vNTkM+PZHX
         9CkEsUTtaS3TyFACCPaRmQQluTv0N1DLlpCAtucI2qLW4kg6OfgfARCXyTalvhLQQWF+
         pwnr6Tt9JcaknhbtDWVZT7NHgpTEfoNd7ip7atFzYCnZvd10mlqxEl7lLTSV7yfUkZet
         tkVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=Pgj4os1SqHzkjhNT3JzTDAWYrp8eBAK4lfJx+p+vw/w=;
        fh=P9bmHWLUE5R0kRz0XREImA9/KSaBxiccU82ZQamuAKo=;
        b=an9+X1ryPm3v2c5LqodldzKydUQyd9lVtjWTevJq9JlrxdwVMjev99MQ4Qp7nPzLfw
         AkPPqOMlF+aaoQ0WK3ay2jDTqqdWjdHU6f376yrkrpXXObRCGqaoQdWgXMWNlf8eCCW2
         c2wCjdgIBit7AcGETqU0OR936yShkjtc2PTDglSclP2cxzuTAkWsF5h9MYISepNCtgON
         OPpdrig+38WSUxuf1H7pkfDlb71+cld1NTkM9PMcJLfJ6ffAuJ5PISk81dl8cpYxvE0B
         tLC5TIOBy3eooRNKD2RsB3XgRA0kha6jA1Ls7Q3q4dAu66sM0+mvD93YkM+fkxcrgKJz
         x+wA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=iZtTBgxF;
       spf=pass (google.com: domain of 3ve4bzggkc5uhbdhiz4z5dd5a3.1dbza3m.03cc33a7czgd.dg5@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3vE4BZggKC5UHBDHIz4z5DD5A3.1DBzA3M.03CC33A7CzGD.DG5@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3vE4BZggKC5UHBDHIz4z5DD5A3.1DBzA3M.03CC33A7CzGD.DG5@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id k21-20020a25b295000000b00dc726f981f3sor2322847ybj.19.2024.03.25.03.15.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Mar 2024 03:15:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3ve4bzggkc5uhbdhiz4z5dd5a3.1dbza3m.03cc33a7czgd.dg5@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=iZtTBgxF;
       spf=pass (google.com: domain of 3ve4bzggkc5uhbdhiz4z5dd5a3.1dbza3m.03cc33a7czgd.dg5@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3vE4BZggKC5UHBDHIz4z5DD5A3.1DBzA3M.03CC33A7CzGD.DG5@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711361724; x=1711966524; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pgj4os1SqHzkjhNT3JzTDAWYrp8eBAK4lfJx+p+vw/w=;
        b=iZtTBgxFrNGt22dpzYuN3oyFidC6eY8X2dyCgcCDDO2CfnQeSL3qUjnybfhOZq5evi
         GXthEhuD+GuwxRGPh6Sht/2fZtpzBh+fxVLpktjco+jyKZNBwyeRzGQJcbbZGFd66M/2
         l0Q/wBBO+0qPHTPvjkiYUD/C5cqUp2YvQL/KCTRAejza6ImkA6DpmBs/fXOrVYl9gp7w
         mmmUZmVps6hq1GVpDlz1XU7iIIDFGI2+KwPqOMsYtfwROTH/ufDMxQBKY9dzNM5lMXSQ
         9j9E/uPZx13sJQe8k3RdrngXFXnH4TOniFeltxaLCN+PIXPL0Yfb38Y6ExztFtKLG17A
         bEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711361724; x=1711966524;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pgj4os1SqHzkjhNT3JzTDAWYrp8eBAK4lfJx+p+vw/w=;
        b=abZ4FHxyDjPPFQUSjcmGHAtMmf6ivt258pixRg36xZ9ZfApgYIQikJStpxmxnfEKYQ
         LnX209ACKClLu5rJtaUZYqe1qg3Wr2xaEmaAJeuT6YSI3Wf2w+N/UmQU04WFV1w0SoYB
         EMOSd6OIw+9q412atuzZrxFMFbvBkIB4pOVA9bvqtDEA7DPzpLri5DRGnxUwUmOI/cJQ
         z1RvGn3LUt6pXDmz0mf6w+Hq5R8ZHsKGswhxaO/QCJBJZIl4oh5wssz1uVdqVQ/QqJ5O
         6nsCySYTyUjOY+sbxFvUi2o9V6hscQoWUXaVKeRkRYPmPd/dGEuI6v6AQ1iq8OXgtrXy
         KS2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXS9xBOhh8/DTqJ4FzrJMRlSJ2bX1Wd9FpdJyvHv/m+iiwrCI9aJ59inrI0gLdK6pgi3UuClJX5FNBV4Zn42dQACC8BPPAz
X-Gm-Message-State: AOJu0YzPh1Xg5d0x4JHKYYzx98A6aPE+sNRW36NS75TAImcqYpVBBJND
	KwVw5dX5unNqCXrQrC+I73ChEkF8P/Lg4+yLQD/C0tYy7sa9sR+3cupbLJJWwGmQRruCdsFv38+
	lOHZMXAKQxg==
X-Google-Smtp-Source: AGHT+IGeoxZ4yGEl/vm/NkDRjH551nWZHf5000vrg0V+z0lFm2Vja1vkx62O+nhZvbHtxs0E0r6mzR2+Ic5pCA==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:100a:b0:dc6:ff2b:7e1b with SMTP
 id w10-20020a056902100a00b00dc6ff2b7e1bmr2119524ybt.4.1711361724447; Mon, 25
 Mar 2024 03:15:24 -0700 (PDT)
Date: Mon, 25 Mar 2024 10:14:05 +0000
In-Reply-To: <20240325101442.1306300-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240325101442.1306300-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Message-ID: <20240325101442.1306300-10-smostafa@google.com>
Subject: [RFC PATCH 09/12] hw/arm/smmuv3: Advertise S2FWB
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: Aftvz/JKByom

QEMU doesn's support memory attributes, so FWB is NOP, this
might change in the future if memory attributre would be supported.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index e5373f4cfe..288e7cf1ae 100644
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
2.44.0.396.g6e790dbe36-goog

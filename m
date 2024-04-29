Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp1931870ejb;
        Sun, 28 Apr 2024 20:25:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX4yxtDw6eFE5oyTBocMT9js+6DM+Ygt1UPNFwLVJJ6Fjna2HMS6tXqNo527XXvvECyfJbJvmWnDiwAYFdMjGMuJj4Y6quB
X-Received: by 2002:a05:690c:6d09:b0:619:c995:143a with SMTP id iv9-20020a05690c6d0900b00619c995143amr12192297ywb.12.1714361107923;
        Sun, 28 Apr 2024 20:25:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714361107; cv=none;
        d=google.com; s=arc-20160816;
        b=T5ENY4aun5IpdEtZL63VATR0wfRsOb8cqCdFfOhZbCyWWrMGxe/e3GwJo1aFiqTU0S
         1C41B1V4/AGPbOfxhyFwdM1A//O1J8QXGEIEYhpD0zlYfwxwlON9qhGUWTOM4i5kgmkm
         Vqf10TP4md0klYWkPbGlLN4MHHkerD5WfOpBnK1PfJWTp6G6fX0RxrJUSZo5TgDh0RPt
         G+7wZeF7Baf6MZZbh9GfYmiu71v0PTzdqM116n5xkESZhWfTguR7hLcqdYka5g0w/49g
         17YMDoLydpAIZurP57qwUyODGw++YI0LPQ0I9VsxjYnDktBf0HXWIo0GFgGXh+wvOAtV
         zJnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=q94uWS1YQXHoDg0rgHPsnmyBhsFRL1jhexQXc24g9Qw=;
        fh=fYlVbS5nSO3lGlkXrwNs3/TxVNVmdGb3ASgXCy8loTI=;
        b=O/p1baet/nNI4PrjfSWxvH2neI0bbC6q6qivBny2YiNjDISgZ9wYoAenKFCuZoTD1u
         2AKhHqnp4rWdzeMpRVJP9Dby8GikZrN4j6EV1Zq37lmMMiOs4eOivNguMjcs/3npPWrq
         LdO426+LTZdPoUjVOYfVS2kDVLJrM3u4/4xUe0FFLuq+VJUN6wZNw4YKj/K8tIySVCQG
         GxCJylQvuqVY4zgkNYu1gbom3nRBCwuO2E7t/7wJOmlAU22msWNxxbmiiTQPJ2HVghsO
         UgoY4uvTvamtgPHqJp8D+AV09kh62NmgPhvWqwpI6mkEpYtSmvXx+BUCZTv/MwmQbyWB
         ACew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=MLt4X8HR;
       spf=pass (google.com: domain of 3exmvzggkcy4cwycdkpkqyyqvo.mywkvoh.loxxoovsxkby.ybq@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3ExMvZggKCy4cWYcdKPKQYYQVO.MYWKVOh.LOXXOOVSXKbY.YbQ@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3ExMvZggKCy4cWYcdKPKQYYQVO.MYWKVOh.LOXXOOVSXKbY.YbQ@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id i66-20020a0ddf45000000b0061ae516ca85sor9161746ywe.9.2024.04.28.20.25.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 28 Apr 2024 20:25:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3exmvzggkcy4cwycdkpkqyyqvo.mywkvoh.loxxoovsxkby.ybq@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=MLt4X8HR;
       spf=pass (google.com: domain of 3exmvzggkcy4cwycdkpkqyyqvo.mywkvoh.loxxoovsxkby.ybq@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3ExMvZggKCy4cWYcdKPKQYYQVO.MYWKVOh.LOXXOOVSXKbY.YbQ@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714361107; x=1714965907; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q94uWS1YQXHoDg0rgHPsnmyBhsFRL1jhexQXc24g9Qw=;
        b=MLt4X8HRyS+wT2lEZWd9pKMMVXWnvetvC1mlQ/I94y9jSuuvexRck/1iXHMIjPOThW
         P/XfUWVerZ+O0Ele1MA/I4iDTntflnH5/ODWATfXzFmSSfXMs0BTDVkJfCS48JY2D6Mm
         1yhR1ogfF0Yyx8GSXJhtYb4dvUfSp9+JRTnJmuxp7r8E0FH1EfctWQai3KYb5xGHrooT
         XF0Go2D89F4sldajSFy9kWGRM/PS2Wuwbe/Lfla0d5AFTE/TnZjlGw9YDyDbkC+t65Ct
         KZIyS39vsTlTg3cGakV7i+o2fJyrcakPY5kGZwAsrdD5Deta0gJqV5f9PccUPKMz8UON
         QbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714361107; x=1714965907;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q94uWS1YQXHoDg0rgHPsnmyBhsFRL1jhexQXc24g9Qw=;
        b=jTToqtIZy/h1+0RL58ygAr6y1eAYcgv91XGsYkycUfs7XFpxGbfShPas17XWmeYfpq
         nYBp9HpfT8/sc8rPFGJ7emTr5Trcy6MtOjA2qljCXI7wfWCS5y0ETLXrXbuSewZ/zPsY
         j+ktYU5AVXwnwwYiymAumDJdDNkX8Vouz5LsgwQk82C5uicwGDl3sF31pH3i4Ip7vMxB
         KQHZXd7ALCYt7r0ZqRiA+2DgOS5GjAQhhi3i0lgu1Bfvfqe7KO59fYy/tYNwWDbka+M9
         LoubekJpqrBw2iIUaE/FnZtuNU2sC4T/QneWEHogVe2V4hA9DuYeMblbMltYtAS8TqSE
         0cvg==
X-Forwarded-Encrypted: i=1; AJvYcCWfMKLSeBu3usTFMgM0YoGIKurKLi5Ks66vB8XOFUKorkjbhDva1XtrffvEwYHJIlYPU+bYR2vbxcn/Ob0Arnd6B7h9ckfP
X-Gm-Message-State: AOJu0YwYiQ5HVR93C8IdrX0Hr/O+/PGZfHkDJc4YoVOxt33iHq8ZRvFv
	VDOhjD0mgFnfsF9qw8AoinPrSwR+XMCvPic97AJgpQJAXidhAscl1lLQJaJnDSUEhuzrBkroqMr
	ra84LcfjW1A==
X-Google-Smtp-Source: AGHT+IFzjdp0ZFh+5foz0mnbvtgE1awhtYue+fJ/8/OHkDVv5HMZ11PEbTlWGFgZAJns8v0t5tc1xyQJL4Xp0w==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:1006:b0:dcd:3a37:65 with SMTP id
 w6-20020a056902100600b00dcd3a370065mr988183ybt.7.1714361107332; Sun, 28 Apr
 2024 20:25:07 -0700 (PDT)
Date: Mon, 29 Apr 2024 03:23:59 +0000
In-Reply-To: <20240429032403.74910-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240429032403.74910-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240429032403.74910-16-smostafa@google.com>
Subject: [RFC PATCH v3 15/18] hw/arm/smmuv3: Advertise S2FWB
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: ypqDqw54Cq+l

QEMU doesn's support memory attributes, so FWB is NOP, this
might change in the future if memory attributre would be supported.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 88f6473d33..8a11e41144 100644
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
2.44.0.769.g3c40516874-goog

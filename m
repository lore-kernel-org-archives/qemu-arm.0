Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1293848ejh;
        Mon, 8 Apr 2024 07:09:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWkeDID/iwlFstKqznWF2UFXJb9Q8TSsqk1/ZD4173FPfxgBs7ctfyR/Qdi8jnToZRl5yjwKId5QknnKWy/LOqBrG9Oht6n
X-Received: by 2002:a25:c1c3:0:b0:dca:a3e8:a25a with SMTP id r186-20020a25c1c3000000b00dcaa3e8a25amr6621291ybf.62.1712585363655;
        Mon, 08 Apr 2024 07:09:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712585363; cv=none;
        d=google.com; s=arc-20160816;
        b=srmA15ZQlyG9FVZh5xPDZAhjAR1HluSyuxHiuN96gcCQ/abzACS9v8+dMXp54IozN8
         H90bHAS67fUUW4Iu4z20Mz/rKtdL0i1ZgpQG2MqkoO/JyD75l8PFk7nkQvJoqkdivPcO
         PHwwhoypxj1sFcG8GnbKoIcli3qhiO9vihqvGz1WFkR5kroVXXFKxGt3/jKPGZKuMKVB
         BWUzxXqLxS6DgNukTrUliSe8lFT6sssauVnuugh0DAKPEYsF0Su5gSROmXb3+otTtkE6
         sVEBBVg6A1nPYBdEDMd3M5pKb/A9MVBUyVA9NQ2GfwrrWjPbvHH+DK+UrDSAfmzEBJCp
         eoHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=0jpBzRSOQx0YT4byKXmmxUIsTrpT0wYz9PuDCeBDXM4=;
        fh=ea/EMzqSiTlA2JbNrLFoLds43r7kwFMoIKficfNpEt8=;
        b=D29cuj5U87UhcRtUN2B115O6P5ErcplwwZyJq1Fx9BoMJIhqmZCNFNrueoiFvvBpv6
         G1p84KYs3XYkjOPVlboco3z0GYBwpB1Gu8/+n1Q4nATLGH/VAGXXUc+dmdxiP/nEPi49
         YhjnqI0fJrljH181tBekCLC6dZyh98wxnkjw7DBYiiqBlsPMd4R1XlQowvNtU16X9gwU
         HtWvSeyhgPjQhoNFXibOajcflQ3sXEW9hfeKmRmCuuHcaR689iNuOin/OjJk9hQgsH6E
         bF5FPKIMOI74vWQSOel07q9CRkiX+mou49CbwQgArJuI5QnB38rbx/Rxb2DcH0ADJPwS
         qjjQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=wI3xFii5;
       spf=pass (google.com: domain of 3k_otzggkcxa82489qvqw44w1u.s42q1ud.ru33uu1y3q74.47w@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3k_oTZggKCxA82489qvqw44w1u.s42q1uD.ru33uu1y3q74.47w@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3k_oTZggKCxA82489qvqw44w1u.s42q1uD.ru33uu1y3q74.47w@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id fs2-20020a0569020c0200b00dcd9eeda376sor4671390ybb.3.2024.04.08.07.09.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 08 Apr 2024 07:09:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3k_otzggkcxa82489qvqw44w1u.s42q1ud.ru33uu1y3q74.47w@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=wI3xFii5;
       spf=pass (google.com: domain of 3k_otzggkcxa82489qvqw44w1u.s42q1ud.ru33uu1y3q74.47w@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3k_oTZggKCxA82489qvqw44w1u.s42q1uD.ru33uu1y3q74.47w@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712585363; x=1713190163; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0jpBzRSOQx0YT4byKXmmxUIsTrpT0wYz9PuDCeBDXM4=;
        b=wI3xFii5nJWaEcDlCBvKyMKudDMTAqVgSn296VUGE5n23WYxOOkGEyyGf4VeBiwo3d
         P+mmAznubZY3s5Y8prwoz7IGhPnxuFmjMBlIv/r6Qnplk6FaHHjrH3nidiKn4LRnXMP4
         5z2QpBODf1Lw46siZrJbl2l7eoLje3IwPnG8Nq1LI7awz5VufTSlDFPB+9D2J/hmPo6v
         wjaynhfV1JJztdoKORSxG2umxB4lpSpp3gs5AcwjCGAO8tg0gtKYnv8W7kmQSIco7M0H
         XG8+t5sfKXHfZXiDY4cNW6sH77rVOkgb04ZjxOW0fGip9UMwIpO64fnauydU+SKtfzXe
         3d6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712585363; x=1713190163;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0jpBzRSOQx0YT4byKXmmxUIsTrpT0wYz9PuDCeBDXM4=;
        b=QrRO7f9TNNp3RBPyLHqINArOjE5dui1/wdYsJxa8gNa23iWs0OkwVr0Fk3jdqcxlnm
         eEfMh43Y3ubnoG8cFJx7My0NyiFKS1iATUvxRilQtARL9rwzf2rqlDiWc+raWwCYofAp
         SBo2n+Tw6376I71Yba9ecvcxQ2bW4qjNDUs0gAJhHwNPHYmXkcd0wN/IXtpUHG1f9uGQ
         IclHnTTMnLMZ67gJOqm9EFXc37WlcFKMSVMRKuH30YgqG9r6y0RAlM7ftR9WDpf35A2v
         bF6KYeB8nkWuyTRB9QpFFWfFTb0LMdff35xzBT3NhH0A5B+eW+LGlCR7pox37r01zoNJ
         cxsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFvPVhmJ22eBZc0XOQvadGL+cGhhTfs6y0yRk+Pr7I1DUCY2KzEsrhaI+bTaJqYGoFu/274bg2j3dm5Swy1MWK69RYIp0X
X-Gm-Message-State: AOJu0YzlW62X3/MjVSw6cHDUodmoxs9s/XW1W7qpSPneRKQyr9hf6SFN
	Kmtrqsxtk1Tf5ddkwpklvoiKqR/BPS+qsEgplxZTlVH7gb5tsQ2D5UB5qybwFMvGK7tET8yFDPr
	REfTrRLOXPA==
X-Google-Smtp-Source: AGHT+IETEqKhx61slYVxF7Pmd96UxbP3g7TDyMwnYPIU/731Btbxiehx4b3mA0OOTFEN8/03TH4D/djrSRoB+Q==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:154c:b0:dc2:2e5c:a21d with SMTP
 id r12-20020a056902154c00b00dc22e5ca21dmr3387695ybu.6.1712585363249; Mon, 08
 Apr 2024 07:09:23 -0700 (PDT)
Date: Mon,  8 Apr 2024 14:08:15 +0000
In-Reply-To: <20240408140818.3799590-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240408140818.3799590-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240408140818.3799590-11-smostafa@google.com>
Subject: [RFC PATCH v2 10/13] hw/arm/smmuv3: Advertise S2FWB
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: SH6HB6FQxW/T

QEMU doesn's support memory attributes, so FWB is NOP, this
might change in the future if memory attributre would be supported.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index da47411410..0e367c70ad 100644
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
2.44.0.478.gd926399ef9-goog

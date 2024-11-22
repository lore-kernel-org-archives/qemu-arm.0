Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5748625njc;
        Fri, 22 Nov 2024 14:52:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWcU+xyxUXhKPObGA5vuXyLvBgCHDQRHLyhzVC2E2UGmDTOkFoOrVrLXuO9nzgljmQRxOmaxjkN7UCkRQ==@linaro.org
X-Received: by 2002:a17:902:e881:b0:20c:cd23:449d with SMTP id d9443c01a7336-2129f28a264mr63698095ad.46.1732315931209;
        Fri, 22 Nov 2024 14:52:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732315931; cv=none;
        d=google.com; s=arc-20240605;
        b=Y+Rh2cdUbwtT2qWArnbTxDx+aPSjlkyU3BChJK4L41v/4o9begNmg5+GTMfqqiQdFM
         JO5GOLptxuEOh4tdu8SHJ8btqMaaVolfRfczB/s5LiertKmzKB5sJRfg8UeBdToE/RWi
         4Q1JC2894+tFqnZ2my2mFQQYuItKlIWm8/5PQeKHTk/JP2BMEQAALqVIyXXBrNupTf4n
         givlVqMF+DaX58Xd12AuwvFdHEkG8FERR1Lnjy1lf/gp15kMEoRIIB+2RMF1iCstETEF
         4bOLs8HutDVW8jal+JzGuu7A6MelVXFtS+huH9SF3sCsXcRXf6iXZ4glgNcTVoI2M7SG
         Heuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jh2KAOoXCu+5HX1Ub1qOT8gx+CtOclpTuzbQi0PzGg4=;
        fh=/P3oeMFj4HuK7PO8tmG8Lc0ixMxCczWRjPlS2GV8Wpg=;
        b=AMqrsynTOzcOpPATQiXCPrsaoiePyrUMwosQy7QwCguincjAfF7qIWOfJbpW+dSrEA
         XJh3IaynI3KmdwyxSUB+ajZazH7XzewkxmCTRjYsHtnuVfw21Kq6czdu5kXzBzkBa2i3
         j4Uxcr8gXwrHHD23UsW/3xXTE4eewuWksWrkSxDQTQlf/dQNf5gRImGXdGgnE0zkHYZT
         ksbjePt1fQz9xB4pSPwmwqS+nPDpD84tX7ZQ5yQGeGwxopP/07DDVzzOrTu9D0bE53XB
         Xt3ovaZj5SSy7M0uZVLkfF4F5RD/GuEVNmQRPpHGv25NZH5x3cdRWVArGixdIbqAY9j+
         fTlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mcDqKnF2;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2129dc3db92sor19983515ad.6.2024.11.22.14.52.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 22 Nov 2024 14:52:11 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mcDqKnF2;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732315931; x=1732920731; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jh2KAOoXCu+5HX1Ub1qOT8gx+CtOclpTuzbQi0PzGg4=;
        b=mcDqKnF21XwpG3a500Sn9QxTaHYmNx66EuscAFIbBRSor+PruMG4bf6Xi0fwg24xUy
         olFnweTgDx/sO7J3D2nYd6Ot21aAJzP8cwYG3N0PFMkt0C21zLJUwBt5q0+TY9txB6kf
         juMeGnN5E5btKaxdX+kceEpeZOq9EX01v0K0riVxuLdW4u+uqmpw6vTJlNiqpcD9UmTd
         nnGYPnsT45wUtyFUqEzRaBLNok48i1ETLGNIa+emdXCKvMsLHSBj6eLILy+9moVPcQRU
         sYgl9nPfhTT0QCwvH1Pa5AmsJySVBSzFAjhRBHybolNhwlX3P1XafmwBk/yxB09SpsEW
         pLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732315931; x=1732920731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jh2KAOoXCu+5HX1Ub1qOT8gx+CtOclpTuzbQi0PzGg4=;
        b=Gv3zSYRSboxO9B7T1l+cVdw8Bs7CnlGOxZCasUuvmIjsMuPljuCbJ9jUBjmBGxDL1Q
         OMndoKQmWWIP6zgux1LnS1dSvj9zTdjbk8yMcKF6/8Xz75iEXd6/wEL2JAJQaHk6A6FB
         KbeQW46Iyr4CElNS7tdm934aGtd66yStXSSyWII9H6KIu2KSiryGrPwjZH1HAJbe4UzH
         8b5de6w6TTH8LPRtKRjp2tH22bhlabRxPlI9373EfVLOuu4ohmQqgWRtsVc7LLv1g7G1
         MPWmxMeT+GQAreZSsm4g2hhRBiiwAFL23UO+LFcaudYBEy386GrNkfFrgz3vFs/X2yen
         4+7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvjtz5u/LrdqjE8JxsQ74bY2lKnjDVlemHwgqGsOCUjNEd+usEnsAQJ+0Jot4fh4Sdj45yDKK0xhf8cg==@linaro.org
X-Gm-Message-State: AOJu0YzhlNRBnScIAVrLE+5Bh2rDxJHMHziCYblgTob1k+RWPeUBkHNo
	d6909i4gSjDuKYt4bcxtVrdyAhKlB8gsQZOx2iVevt85JLs+63l7huN1MxdJu4RLlw==
X-Gm-Gg: ASbGnctUrvnRjqVHnLhzPjrmZX0Ljur9a0xqT/ZgPrGmxbdz8UCFTSP70mqgOrSL6iq
	Sn3/KMqGLwoU2pEQ28THvhtY/udhGxiQ3A2ltFXs6VWhbjlv435ylsg+rREvF0ObMj3uXY/EWt7
	NV3SCFBN+yNcxgeWnWrunUvO60q+FKuvJhjZKVpxvv9wbUJ+OobJQOC5dANuNzeiHK2fDK4ykOY
	uyqgUQw0z15TkZHqjg+AWkykIszV/aVmwl1csGNxi8T7N2blOLvKWqNOZ28AgLon/caNY6TOx0c
	SWaX6L4/42dhzg==
X-Google-Smtp-Source: AGHT+IEStFLEesM8Tyny8zetwIImMe0p2S2LbXrloI6mTqNFP2JV71CJkaDyZ5xgR6NMmGCl+BTq1w==
X-Received: by 2002:a17:902:f78f:b0:212:4835:10a with SMTP id d9443c01a7336-2129f24ca1dmr68367355ad.34.1732315930828;
        Fri, 22 Nov 2024 14:52:10 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc1539fsm21450335ad.192.2024.11.22.14.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:52:10 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	alex.bennee@linaro.org,
	Steven Lee <steven_lee@aspeedtech.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Troy Lee <leetroy@gmail.com>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 07/12] docs/system/arm/fby35: update link to product page
Date: Fri, 22 Nov 2024 14:50:44 -0800
Message-Id: <20241122225049.1617774-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
References: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Dw+8cJoieREs

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/system/arm/fby35.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/arm/fby35.rst b/docs/system/arm/fby35.rst
index 742b887d44c..bf6da6baa2a 100644
--- a/docs/system/arm/fby35.rst
+++ b/docs/system/arm/fby35.rst
@@ -12,7 +12,7 @@ include various compute accelerators (video, inferencing, etc). At the moment,
 only the first server slot's BIC is included.
 
 Yosemite v3.5 is itself a sled which fits into a 40U chassis, and 3 sleds
-can be fit into a chassis. See `here <https://www.opencompute.org/products/423/wiwynn-yosemite-v3-server>`__
+can be fit into a chassis. See `here <https://www.opencompute.org/products-chiplets/237/wiwynn-yosemite-v3-server>`__
 for an example.
 
 In this generation, the BMC is an AST2600 and each BIC is an AST1030. The BMC
-- 
2.39.5

Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp349331lft;
        Fri, 8 Jul 2022 08:47:47 -0700 (PDT)
X-Received: by 2002:a17:903:120c:b0:167:8847:21f2 with SMTP id l12-20020a170903120c00b00167884721f2mr4248969plh.11.1657295266992;
        Fri, 08 Jul 2022 08:47:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657295266; cv=none;
        d=google.com; s=arc-20160816;
        b=uXhmDYAwmGTmBeesoLYeK23jutg4catFdIC8RwM9NkG8CgbErjrdp8Vs16zmd5KVHM
         +HvtYJIomBmZFvhdiUwWD0Xiq4ZxsZphZ/8pi4OM4GIbo7rLCYVZ1cSbiBROsl/XruZe
         y0jIb8g8uPoikmFwJ69kahD6cjabK/EX0neM5Hf+VYiSNEhKkucRI8L1nk6KMWnykgYd
         nVJ3d8sr4z3YLGhET4L6kSFMyLq7RYEG7ZkIk98RrVfPmwc1Mr+CC4/aiowpiqYgrwzO
         yDlgZUorYX3BgLm+mg7qFXXpXT/fXh08icgtVkMb65wWPa5xgoM1ymZLKnnUeHIkVNMV
         d18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9LHt//Kp5lBRa8NZxlYvTpSA0XqF6ZFwISz/AY+ddgg=;
        b=kpF9kbx3kUFdpO3V+VTw6YJfmSVgXNX4H/KLv1Yc7ApBItB8s1fF59ledKh8kOWPEn
         g9THBfxk9AQlO7GioHGyC8nWGIlnRxNx16jrHnWfU2siX0BJKnVK8N75uXSS8xklZ/Ro
         dv4K/EWpfQ1b3Uj8cBg3pBmmA99jCsy6Siux4BpjPnM8X+1BQuea3yVa4yoq5tnRRuU2
         WpxxkM9aDKhniTa2POtw4Y57fSVEkxYb/yaa+dOlGFgiz7suf6W0aKYOs7LfZgmqa98o
         qLDapEhTQk8DUC0AF2ORxMd+ZxGqg4F6seyo2osdmya6Cwk2Mm6SvdF+tVbVItKmaJIB
         0KMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a+kDYS9+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p8-20020a170902ebc800b0016792ff04c1sor7208844plg.108.2022.07.08.08.47.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 08 Jul 2022 08:47:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a+kDYS9+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9LHt//Kp5lBRa8NZxlYvTpSA0XqF6ZFwISz/AY+ddgg=;
        b=a+kDYS9+DDHnlujQ7FveWMcc1yZAsL2DMiepCLOj9kTLof9Fswmv4XC1B8lbk9k2Ag
         R3ycjYLibZttVRN/ZePK4C54n9w70W7XHhGqMtf9IqY9eniBI6ZHgN7nF5YKhzlpZOsZ
         HFG/w6xyplbq9ZmzDHgciliaRw5Z94u+nr0WMuZVjHtOllIN1cAwE/Fbg6qEXc4JY6EG
         wJ5vdw+9M26p+2askJ4dhzQT43dbE95yyP3kLmR3WbsVwkymLja5ABtDDoUMOzdLAvxJ
         Axk4dxITK2xUrLYEtl9pC328plrYaDrkxglrUPuzmnPlkXmyZcBeDJxsPXUnGyDM+Q7f
         CEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9LHt//Kp5lBRa8NZxlYvTpSA0XqF6ZFwISz/AY+ddgg=;
        b=Kiay2Ga2EEsJxcHUyLK9F1O/996ZKvMyGDKC1tkYBRUC1RX4Vm+dz3hlm/R38Ta3gL
         AEtguCS2QUdgrDMfGejY/sxMqyGhcL4/1Dl8q1FcyNC0jJcNSMgAt6+gwOyokY2y77Yv
         ZoSTnt8DnN8n2lnnCinvc+vCZQ3KjTv4w675vkmd5O9ZMniajsv8dzd+IpWGRPxDuJjr
         RXRK9DZWjbkn/fMOKjnpbxPnY+a3fPXPGz7ZUTSmSnQZ4seV1+tINOrdcRsiCFzGAYjh
         ONKVL0ctny5r57uXcMJwTRWu7KhhASL5egfQNaoGwUcwPecGcwVy9iFNZy4ZVvnSiv4K
         BtTA==
X-Gm-Message-State: AJIora/jg5bGIlsg6Bh3aiCovtOlY1FtH3x6YlLna+TN9vaeG/8qUJHW
	uF64gMwrBP9lzoe9ZGAr1mVbN/hg
X-Google-Smtp-Source: AGRyM1uT4OC6xz8W9op2T7Io1cZkbK7wrttdWF8bBOd/+GQaCN+Sla7dW0IyYAZ2CRHOuacL7NIvgg==
X-Received: by 2002:a17:903:2445:b0:16a:32da:cc9 with SMTP id l5-20020a170903244500b0016a32da0cc9mr4237591pls.148.1657295266402;
        Fri, 08 Jul 2022 08:47:46 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([122.255.60.245])
        by smtp.gmail.com with ESMTPSA id y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 08:47:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v4 12/29] Simplify syncing with master
Date: Fri,  8 Jul 2022 21:16:43 +0530
Message-Id: <20220708154700.18682-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: D//ctsif8uFv

Do not pass status like RES_BAD_IO from apprentice to master.
This means that when master reports i/o error that we know it
came from master; the apprentice will report its own i/o error.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 reginfo.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/reginfo.c b/reginfo.c
index c37c5df..31bc699 100644
--- a/reginfo.c
+++ b/reginfo.c
@@ -90,10 +90,9 @@ RisuResult recv_and_compare_register_info(void *uc)
     }
 
     if (header.risu_op != op) {
-        /* We are out of sync */
-        res = RES_BAD_IO;
-        respond(res);
-        return res;
+        /* We are out of sync.  Tell master to exit. */
+        respond(RES_END);
+        return RES_BAD_IO;
     }
 
     /* send OK for the header */
@@ -115,7 +114,7 @@ RisuResult recv_and_compare_register_info(void *uc)
         } else if (op == OP_TESTEND) {
             res = RES_END;
         }
-        respond(res);
+        respond(res == RES_OK ? RES_OK : RES_END);
         break;
     case OP_SETMEMBLOCK:
         memblock = (void *)(uintptr_t)get_reginfo_paramreg(&apprentice_ri);
@@ -133,7 +132,7 @@ RisuResult recv_and_compare_register_info(void *uc)
             /* memory mismatch */
             res = RES_MISMATCH;
         }
-        respond(res);
+        respond(res == RES_OK ? RES_OK : RES_END);
         break;
     default:
         abort();
-- 
2.34.1

Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp368031njb;
        Thu, 27 Feb 2025 09:04:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVPe1t0rlGpOpNT98F6FjZrsW8gF26pUD1vEv0WMfVYZ3VBTPgteSLCm1/7b3XDTd1Dc5MLsdsNbHMj8g==@linaro.org
X-Google-Smtp-Source: AGHT+IFazmEuoMYYJlsjqcDBV+uAJC9Kl0eRNP4aJ0BSJihCWQrG7rfLNOb1Z69JO3llVvtmh1Jt
X-Received: by 2002:a05:620a:404a:b0:7c0:a0ba:2029 with SMTP id af79cd13be357-7c247fcbc16mr1402243085a.40.1740675839971;
        Thu, 27 Feb 2025 09:03:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740675839; cv=none;
        d=google.com; s=arc-20240605;
        b=ODE5xxoe17fxvaZsgJPZO3tS2UaMGiiaSveqEYXf43oS1N7ni2R8puX+HzUReiIBOB
         jnaSH78Uigz5KjPPShDalyyBVZlq5HQs3fhhnEQpr7xob21KfpHqM5TZsXue5bhB9iVv
         sbFwyJDE1Tt4veEKPBD2jrL1NmJIlH6RIjyYRtpxGUcj/3KbdFbP/bhuEAik2osGWCms
         67stS5DlGCdKsGgrIbqqJz2Y6PFZwmkiChGQ1vZNHIiGaYQd6obIcBqbMhGXHuXixaqg
         3BmtyP8zxZju7O5t5nmbz/TfOf4gObaUK7hpmGY5yNLlDzdUqfKEdyfelNcY0AKrsIQu
         4yqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=v8PhnXMjZeodBD0z3UBX0mp4g/I3gCrKUSNVDYtiv1E=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=S5yo0mPdm8JXux3NrlpyDNtrSRS7XOqYGG2u+AdpjSoPAAkIimYhelkTAVEWgj9ToK
         ApVNcGxopZLOUv3Lmigy11/LoiwfXTZTccvAi3Uy87g9Njne8X24dU1NW3moeXkA8QlL
         uoTD6F6tQDCDy8nccYGUJ8h6tNmVzObAW3VJZU1m26BEWxnJZDRLYzrNEZKVIXhh/LPa
         7zTfSOQRwyq3KT4SiEF/CKp0u/cv7PnuwM1IkFg2ZFHywPedMQdZcZwz72mrnYkIwo9I
         8R6iHKky1E+gEMlj/ASSKCNdAZJHMkKJROjN73vs+g/Fn53L4b75fVCwjLHeyWgJxxJj
         BQXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oD81KmF9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c378db3ed5si153783085a.620.2025.02.27.09.03.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 09:03:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oD81KmF9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnhId-0007Ts-NS; Thu, 27 Feb 2025 12:03:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnhGX-0005D3-G6
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 12:01:44 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnhGQ-0002LT-Ts
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 12:01:40 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-439a1e8ba83so12036845e9.3
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2025 09:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740675685; x=1741280485; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=v8PhnXMjZeodBD0z3UBX0mp4g/I3gCrKUSNVDYtiv1E=;
 b=oD81KmF9HL6Spe13KPVjNgRCcy/WvNPUhBJ/tGNnktaeawEPR6u9LriSpQBJ1OKW7u
 7cRO+phn9Vjtgc2I+olNaIIA7Je+p/lQUunNJDjk7wMRz5DIA3w7ZWdYwfxAFNHoZTM6
 5iuah0vTQdBgKln6bYCiCqjriihkNMCXIwvrl16U+tlYjjojswxUMY/K1CMUA/yQCt3d
 0JiqBIAn7ZJRZNpqx7IPCU+3gVfw56KBKuxJQ+q5wvZbyu907u9AlI+XjJLVFqUi3EJc
 tOjDOdF8eG68qH2IB6/SVTLgX+O+0FRqeQ+H5prSLN24jbSdrN1PDS2JHaHx8NhAMwU+
 0NxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740675685; x=1741280485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v8PhnXMjZeodBD0z3UBX0mp4g/I3gCrKUSNVDYtiv1E=;
 b=CH1RmJz9ElbaDcIEdq325SiQTpf829lj7EAzpcfVxHqaVoEjwI0Z1ocjjWy+5pged2
 RYPcs+m9qrX8N4EkBvYUCvyPz3rSe9z6sAD6r0/JunOQ/PLILPdCQe0eBSaodUnuHHBP
 lgAho0OagvM4wjVbSvAdiJBSbl1IUuRhGkSTJgdmkcyVZGTHMHYK/AFysdEuSNw61WxK
 WmvQEicqIUks7Mb77eyGFa7Q0e5q57X42QWhZKG1G0wC1aUfOgceosp3CpQwhJ9mCC7y
 p6QuX2yvQy7WTCaDDBxDSAGQ0Q366lDwkLZCyHrkZDQfKb6EduARkdZvJGN0MFP0QZq5
 d3Qw==
X-Gm-Message-State: AOJu0Yw8WThqbQQuqZlihILve4y2aqkeH5fPt1p4K1q6FkF4a5e8Ucnt
 fvIWbMF0G+bkhrYRUmqhRWiZxuOhPyTFVMlM0M50mT24c7cIXq6OEZF8SUVvIq9Ware0zN5a3cL
 l
X-Gm-Gg: ASbGncv8xIcvAi0gS0bw1UJmGv4vGkUuxEThSiaJO+EhTeiLiOw/0gdDJ7DjzW5Leuj
 7L6TDA40Kq+VJa0LyF76ZNoPgsFsl7c89W1zIaAK1uqqE4iP3QZjtELGZ5ubFoKDpzJQV6AkwVQ
 PZeQ/uP1xGwUODxlR7PcbL5oU0f/Op6K/wnpN5q8q+1YiwFQNh7/5KTNfRCugik/fFDiWHofoDV
 VIeqaWd9hCbh0G49xf9BM0h19YaIXoodDJGEhPTE6/QqowNq908OjWZdVzNVRajw0dPTAt/89nb
 V/l1/zY3mRSlEaboU28ti8fSLmfVs1z6
X-Received: by 2002:a05:600c:4687:b0:439:9aca:3285 with SMTP id
 5b1f17b1804b1-439b6ad5cbfmr199130035e9.6.1740675684699; 
 Thu, 27 Feb 2025 09:01:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba5871f4sm62747565e9.39.2025.02.27.09.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 09:01:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/5] hw/arm/omap_sx1.c: Remove ifdeffed out debug printf
Date: Thu, 27 Feb 2025 17:01:16 +0000
Message-ID: <20250227170117.1726895-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227170117.1726895-1-peter.maydell@linaro.org>
References: <20250227170117.1726895-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vauV9PaDWHVw

Remove an ifdeffed out debug printf from the static_write() function in
omap_sx1.c. In theory we could turn this into a tracepoint, but for
code this old it doesn't seem worthwhile. We can add tracepoints if
and when we have a reason to debug something.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/omap_sx1.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index c6b0bed0796..24b40431832 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -76,10 +76,6 @@ static uint64_t static_read(void *opaque, hwaddr offset,
 static void static_write(void *opaque, hwaddr offset,
                          uint64_t value, unsigned size)
 {
-#ifdef SPY
-    printf("%s: value %" PRIx64 " %u bytes written at 0x%x\n",
-                    __func__, value, size, (int)offset);
-#endif
 }
 
 static const MemoryRegionOps static_ops = {
-- 
2.43.0


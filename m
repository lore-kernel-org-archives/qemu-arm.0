Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp3193040lfi;
        Mon, 30 Mar 2020 14:04:26 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvMXuaYd+DQlN7fuqspOg+f4hJNaA+RH9EJ/bAKRGu49EpU1oMPQCb/qBIyZEoZy8TSdLeE
X-Received: by 2002:ad4:5642:: with SMTP id bl2mr14069091qvb.11.1585602266082;
        Mon, 30 Mar 2020 14:04:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585602266; cv=none;
        d=google.com; s=arc-20160816;
        b=c+3mZGy7lCEjDigZ69H3XSnT7zTZIykPpceRI/92IECfirEEmT9tj0Ypau24D3T7gq
         Tz+DKpAJH6Qjv95lj6x7ROMAo7CPOZhZW7g+2uUFiChLwc6FFXVDpV05HI60g6LAAdg1
         J3vMq+SbdzXwC+uG53zVIZ0aQ4uSjZgBxCjg1lHWUAnJRrkkFxfeH0uEozUcUwTaxEER
         b3cNOXBPnD5/UzDzedPl+MJi5Tpadfz3GG7B6JKpqz1Swl9G9FU68eQVfXQLXgeRGMDw
         RJE4gMI0seASvWry2DBKg14x87jnLeCuZ7IpTUxWiKA0Vs/aAmjSwAFbCd3W8EMTTqqv
         uQsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WqiXoh1J9BtTrhWN+j6OnxXdf1TSrsiVrhfZHgXBlRg=;
        b=zHzggnm+CWMbc15Y973x4mR+9VVttLNMGjdsqsymaccqjayAUIJ5XbD+Qb5vjhIfjA
         czqJLHqYXOYXDfrovENiGlAFrZzVhZfBA9gP8mpwAZjzdBgLa4TDN36/6ht5bmLzzqwB
         kOQ9UbxDRmscThfKL4Ct2agn5J5L9EUsmt+essr9/Z2W1OdygIw4m6wep2EeSbgTZIEi
         +u41BLd+G3/zlmRNGRHVHykHbwshjpfl+9dZO5nqJhv/10O/SN466gJ4MdRot5FfVD+D
         GsPe4/xRmgpUyMxzUkBiqLaDdAuTJIqH13vCdUNPs7fTzPtE4+WOW1JelwYL5zOMn21K
         bweA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WkaCBPWd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p207si8898447qke.250.2020.03.30.14.04.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Mar 2020 14:04:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WkaCBPWd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJ1a5-0006YT-Bs
	for alex.bennee@linaro.org; Mon, 30 Mar 2020 17:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40520)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jJ1Zn-0006Xf-7F
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 17:04:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jJ1Zl-0002fX-Uz
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 17:04:07 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:35831)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jJ1Zl-0002eH-Pd
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 17:04:05 -0400
Received: by mail-wm1-x343.google.com with SMTP id i19so387683wmb.0
 for <qemu-arm@nongnu.org>; Mon, 30 Mar 2020 14:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WqiXoh1J9BtTrhWN+j6OnxXdf1TSrsiVrhfZHgXBlRg=;
 b=WkaCBPWdeWkGfQl3m6Ac54Yce0SfMAhgkIU6+WnBNE2YJfT/UrJshpd0XXTYg8vdK+
 wReBJ++ZYJGPBw++tT2TBa1BPxeiFteVJMpbHKmClijog2Ol4sXixnoJ5OAtlc9atpcc
 FyrC2icPeCzojsiXuT2nZJr3aejx41j2efLKzSO0+54JED89HLG5A0K59UbMSBtym1jc
 2icoqOJm2YW2u2No5oNASK5swu9HkAGRNqO0SY0CGy2Vl3OnQMbzd5Hc1EJdTrttcDyL
 GcpcJMD7sanLy/socn1E6PSH1KAySmWhJnkhDa9WRN2yfZnOJVmp2zI3ll3OXo15INqb
 yj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WqiXoh1J9BtTrhWN+j6OnxXdf1TSrsiVrhfZHgXBlRg=;
 b=mKnQVNSEfCySWgBlFfttEcPg8MF87MFIGmUEF7JhoxYN7LdCdWIrbYvHnemcqUxZ78
 8M+2e44a6E6mUv5UtdbrTDvqK4lJ6mKnziC75AmlnjixoPv7oVoveDO1XZSdFHcdOuCI
 44e0bRj+rL2b4l5Ntre6Mr3rDhiSH0TWSer6CNy5hL0sRZHzffPRm0YwUNDHViG6Ok3c
 JvJ1ZquqJt981Rp4XXQknLXGnYn7q+jEFdFdV+H9kEcGBNlL4Hzq9N0gRJFlv0tUB9rl
 Le1WxijlnVrpDwl0AduJ0+hU2yLuZTT2djW8yimz4uhaPNqYlutzK2FxSM476rjRQsbs
 A9jA==
X-Gm-Message-State: ANhLgQ2bivtepgs/xO/kGNwZVdksjOgIgAaZMZq2DQOa7ph7UC84W23D
 btLSzjAgR7TAYUcqUFR1yv4UJ2VEgfatfw==
X-Received: by 2002:a05:600c:da:: with SMTP id
 u26mr1213739wmm.117.1585602244471; 
 Mon, 30 Mar 2020 14:04:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p21sm1012700wma.0.2020.03.30.14.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 14:04:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/4] target/arm: Use enum constant in get_phys_addr_lpae() call
Date: Mon, 30 Mar 2020 22:03:58 +0100
Message-Id: <20200330210400.11724-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200330210400.11724-1-peter.maydell@linaro.org>
References: <20200330210400.11724-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PpuQiDtHcFgP

The access_type argument to get_phys_addr_lpae() is an MMUAccessType;
use the enum constant MMU_DATA_LOAD rather than a literal 0 when we
call it in S1_ptw_translate().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a0b3082aad9..25439bf6fd9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10035,8 +10035,9 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             pcacheattrs = &cacheattrs;
         }
 
-        ret = get_phys_addr_lpae(env, addr, 0, ARMMMUIdx_Stage2, &s2pa,
-                                 &txattrs, &s2prot, &s2size, fi, pcacheattrs);
+        ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, ARMMMUIdx_Stage2,
+                                 &s2pa, &txattrs, &s2prot, &s2size, fi,
+                                 pcacheattrs);
         if (ret) {
             assert(fi->type != ARMFault_None);
             fi->s2addr = addr;
-- 
2.20.1


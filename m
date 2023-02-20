Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2706486ejb;
        Mon, 20 Feb 2023 15:27:13 -0800 (PST)
X-Google-Smtp-Source: AK7set/YMlPeMl0p2PlW4MGuWvGdCKewy9d+jbd6fltFd/U5GiDWfYtLfDsm5vjrVpdrxa2a99OR
X-Received: by 2002:ac8:7d0f:0:b0:3ab:2a7f:83e4 with SMTP id g15-20020ac87d0f000000b003ab2a7f83e4mr19963277qtb.35.1676935633355;
        Mon, 20 Feb 2023 15:27:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676935633; cv=none;
        d=google.com; s=arc-20160816;
        b=WeGiAg7WsqETDcCb46BN+9hDSTrO9i1pPz8jwzugNRrtfQYBLzeldvdMHKLVPejmW3
         97HlvlcFjbTTJs0dcNppT3q+UAD30nfTJ4F4IDLaY2tN/O0X2JbsUbrYa4UlQTiRGt7z
         aJsF1qBa4k6AOZdDEHqWVW/YslsYwOXOOZZrCM2Qxihb4WeBPnBhzKrA2L8LfIsO3NMQ
         Vdm/aXVR+AAri7xEy9E/2NeNLlaxZK8GdADdoxowVDeLAgJGuUBEZ/upuojJxtTG9aFT
         h2jnX7KyQ0GxrucHsvqnOorpN7M9bYHfXcNoxs6eKPol7YDWrdG9B7CVeVjiAmvBS6dt
         CrmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mH7WMawWeBvYR6Z0Haoxdyec8KWtOPSKDJkaIsK10I4=;
        b=GZ++kSBi/qOKVlcbz24pNUcO8yNth0ZQFjUwtRqZ8K45Fww2dd1LzXnd3/F2S1cGZ3
         vG5n//RQKri6oQcVn39+8AJ8vv9GJxy7K5QHZW/uYzYA1rnMeEihaHKFmp3d3wsf9vxm
         /YLCBknSfSYJnK4bcUjoHlFUwZT7kLUWsS+KF4jWCzbu6TEO/p+qFdoguk4Qv6y+2+iq
         ecyu6ZEpXBRSt3WELhqNSHb9iIUh15zmbDrbhpH8s9m+OLWNdr32ScShMHT8YsB3+n/0
         TZvI7ohS4UA58qI2zRjwWI6zTUmugmiUXHFRcfmSFMbVXMdk77veZ1Q7FO/GFGNXdttA
         KnzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nvVlE274;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5-20020a05622a170500b003b9db24c4d9si11461326qtk.55.2023.02.20.15.27.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 15:27:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nvVlE274;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUFYP-0003jQ-MR; Mon, 20 Feb 2023 18:26:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYO-0003hw-Lc
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:26:40 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYN-0000JH-2g
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:26:40 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 co23-20020a17090afe9700b002341fadc370so2882841pjb.1
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 15:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mH7WMawWeBvYR6Z0Haoxdyec8KWtOPSKDJkaIsK10I4=;
 b=nvVlE274/tK3ExBcRxUCRMfxZtDgtaXLidNuM/h88+aFHH42rv7txuXLvJPi9QU3wp
 ST3DgC+FuSc9yh1ld89cVh8o5MzK4ChA+tekjIZtUTZMgjePQEXcsVExbfOk3wkgPjR6
 szfXtyxk6/gBYsYUgJhNnK74rj5n2OMRlsp2ByKYR3+j4/3oYY3a33LB5HlZfmd7CttQ
 E19d0y8QLxc+Fn6AGFhR5OgB395ccd2I0JvbuZ+yg5OjyDEIqzQow16l2Sgu/dW6gC9+
 NDl6gvlS0FYXm5FpT++5WMa/v32hP4GbcesMDaNh/Zv5vsQj2dfTAMasFn6EBUjGaEgU
 ev0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mH7WMawWeBvYR6Z0Haoxdyec8KWtOPSKDJkaIsK10I4=;
 b=vmWlAdjG/wBpo96v+qu/WHrhzle0DOknqEa1uVYlSJPFYslstH/mXEX5ExEzLXmTio
 4CQbaLIn9e55PeqH4ieUt19Ev5GWLe/fDTGeXjlylAqVSB934IWRBGA6aO1ky1ZoWIyy
 00qPucHqr9qtH/X3UGqR/qGGDwyUAJQIxRrnMM6NcMmI5gQOhwKIBZUPXRs8n5acgmfc
 Z1YkvZR2H3eplOwocrnZ9L5yUvQSkP/9C9qdx+mF9EnJ0np87M/EyLeq2VF/WtVrFxY5
 0p3Uyd8djTCwcf18RiXbq4+xYp15UAJPiQY1e7Q7UAq9GdLGIxgKAzGlFZYzqn+PS3wz
 dPbA==
X-Gm-Message-State: AO0yUKWSIl4/JQf3lej6RDF/WTuQikUx0n0GeexmHADLPK6GiYW/olQ3
 O8yu6XO6n2LT00FjHtSeuVLlQw==
X-Received: by 2002:a17:903:2808:b0:19a:ea48:730c with SMTP id
 kp8-20020a170903280800b0019aea48730cmr1919079plb.46.1676935597252; 
 Mon, 20 Feb 2023 15:26:37 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:26:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 04/21] target/arm: SCR_EL3.NS may be RES1
Date: Mon, 20 Feb 2023 13:26:09 -1000
Message-Id: <20230220232626.429947-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220232626.429947-1-richard.henderson@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: AQpaAnmSMbCf

With RME, SEL2 must also be present to support secure state.
The NS bit is RES1 if SEL2 is not present.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 42d94e0904..2ebca3e2b6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1856,6 +1856,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         }
         if (cpu_isar_feature(aa64_sel2, cpu)) {
             valid_mask |= SCR_EEL2;
+        } else if (cpu_isar_feature(aa64_rme, cpu)) {
+            /* With RME and without SEL2, NS is RES1 (R_GSWWH, I_DJJQJ). */
+            value |= SCR_NS;
         }
         if (cpu_isar_feature(aa64_mte, cpu)) {
             valid_mask |= SCR_ATA;
-- 
2.34.1


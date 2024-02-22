Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp218730eja;
        Thu, 22 Feb 2024 04:55:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVT3K8cz/E65OYItf0BvzgenZt/6MinqU8cHrxAoFhfHveM0yo+aS2vA5FU6pZrZ5V6EeUke1gWll7q9CpULKvgOgdem7VU
X-Google-Smtp-Source: AGHT+IHlS/a0PFNJ23z3bugqUZ6SYYI2hJ5v1Q5uTsPLOsgoypmahqq4du6+veqE6/CZm/YPUI/g
X-Received: by 2002:a05:6214:529a:b0:68f:634d:4433 with SMTP id kj26-20020a056214529a00b0068f634d4433mr14814509qvb.31.1708606554313;
        Thu, 22 Feb 2024 04:55:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708606554; cv=none;
        d=google.com; s=arc-20160816;
        b=EHM7tUoYtevsOFDCws++UC3IevD/wrqv/+mTVrOY+Fqgs36hUubTCyVMuxTunJmA0m
         hxh9tv3KClNxQ0A9WqiJfd7e19ePjOjb6KulHUBh3OPta4iUo11o05T1dxRcg2CsPNmx
         GBYiVwhJrY9PFDtCzRwUxOlZ44GVg2ekfFeDlgwekC6CltaLUWX5S6xSOmtZKaXvSnpo
         d9vI4fJXyGMbB092VEJJdMqSXhjMn8jA/Ul9c/1u/X0AAS/2Py2gZrWPubEXj5aYEyGx
         TO5PyUdt0j+4BsYatMw5s/hfEOFPgkZL5eNSb5x9HmWNItgmxYCl1kPgfJVFy2ZqZfSn
         vYjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sTbUaEgNgo7IbUetOjGywYbHIYWFMzt0Rp2Y/fJHQw4=;
        fh=S0VSofkT5PDLJi36qRkgp30cY5dqz1BP93ot+25ZE2Y=;
        b=yWjrlT3Fx/aZbEIwpzobSUqNeTsYmZu7pFGd3CnjX0GYhCsdRKWWttiGVtNXooq/Y3
         s8CMakFNyyjadHzY5W2ekHQNZGBVtmC22qKqmKnOat0GDHaVfdPUWnEI/1PybAd3ioSo
         AeEJtM8pJDJsuX1oxjYOVxhhgsDhri942m6j8JKGuZS0KHoSyzv2IuBWEOZXBVZUUwJv
         W5h9d1Olz5KeW4/jgUQ0XKkA+XWaxnpOWzUIWmA8TlPeaEVAlF/CwE9H+847oWjDtW88
         /k9zqm3QoYyy1Q7kejHydk9wKkmKyvWrXP4rYfM67lb+kUClxe6DV18uM6B9epUgDqZo
         G9Qw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fFek2Rt8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gu12-20020a056214260c00b0068fc7e637d2si443200qvb.264.2024.02.22.04.55.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 04:55:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fFek2Rt8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rd8c9-00063S-DL; Thu, 22 Feb 2024 07:55:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rd8bq-0005z5-Sk
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 07:55:33 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rd8bp-0004ka-3H
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 07:55:30 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41272d42207so17108765e9.2
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 04:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708606526; x=1709211326; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sTbUaEgNgo7IbUetOjGywYbHIYWFMzt0Rp2Y/fJHQw4=;
 b=fFek2Rt8y+7XcwctElbLG9CYv1Rz+85hP4Ev8syfC6g9XZjNm4wu8/9sRizbWHuF56
 b4qd3UD6J2jK/Afi6p5SFpaqhNtCMSiCp8LN9OP4pJRHG4OBUuo4+zrecnY6EKIcv8Dt
 zcIpoySsCpfh1D6pH8W2NuQ+zobvKbvlQQpaH+9E7kYMwUyhs9oSl0pW8Oaey5bhjRJG
 jHmjaZuN5FsmYkCXrhvg9T4vNQXjm8hELlvBEJZe9YnsdInyjjG9tLE5UopdP2S85Ung
 747ldvVdQYZVsS1i9iaXx4iAoYUd4BjKAPUaO3FahjmndFygfCqGTIc2nlLCXcu45nUA
 x/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708606526; x=1709211326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sTbUaEgNgo7IbUetOjGywYbHIYWFMzt0Rp2Y/fJHQw4=;
 b=jmzVN/qgkHa0H8IGUrfACP/7vvuiHlfuJ8ChVJOE/HhffVALKCs6GOv/FYDBw9Sgcf
 DjfbTKHgMV4kS4B0oMCq3xCqOP1qdZS4wzv0ZM+w72+EMKQ54WLk/CsFvwf98XOZwHoK
 2kesYffw42XAjLKijCgy5wNP3CIqlV26AX590hp6FL42Vo6hWc0MwFUBJggWCEwaCO/O
 n1qZGJYt3Xe7beFhk4VJ2W2r96otP046fQPynrusGSq/hHX0tH3dWVJ8EUN4JetVZkw3
 YcTxUsYB9F8BQKUWlUQJWzFd1hj69ptPZ/g5GIW8pyYV1a5jGX2F0jrlnA9orshpD1Ts
 YUiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw6gyFHcX4SYwI7+/ws5Lww5AcNkJJeeYBYobDhzeUaq7R9qj/JQXjLtH8+tLtufDLjrmyKZXb6/N8D8c5o3/+RJvH
X-Gm-Message-State: AOJu0Yxv3Min/ghtn7g9Tpi152TBHTHVRTWDRfP32M9EPp23wRpNrfAz
 A0QwfSpYAh3SO2AFOZ02LUrRomA+cOsEvxjHAa6SNzmOI2KJQ184QQ0EAHt6Oe4=
X-Received: by 2002:a05:600c:21d8:b0:411:e398:ca7a with SMTP id
 x24-20020a05600c21d800b00411e398ca7amr16491946wmj.39.1708606526348; 
 Thu, 22 Feb 2024 04:55:26 -0800 (PST)
Received: from m1x-phil.lan ([176.187.211.34])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a5d59c1000000b0033d9c5c5557sm944138wry.15.2024.02.22.04.55.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Feb 2024 04:55:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>
Subject: [PULL 07/32] hw/ppc/spapr_cpu: Use qdev_is_realized() instead of QOM
 API
Date: Thu, 22 Feb 2024 13:55:09 +0100
Message-ID: <20240222125517.67131-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240222125517.67131-1-philmd@linaro.org>
References: <20240222125517.67131-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: +Ihruh7FsoQq

Prefer QDev API for QDev objects, avoid the underlying QOM layer.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Message-Id: <20240216110313.17039-4-philmd@linaro.org>
---
 hw/ppc/spapr_cpu_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 0c0fb3f1b0..40b7c52f7f 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -245,8 +245,7 @@ static void spapr_cpu_core_unrealize(DeviceState *dev)
              * spapr_cpu_core_realize(), make sure we only unrealize
              * vCPUs that have already been realized.
              */
-            if (object_property_get_bool(OBJECT(sc->threads[i]), "realized",
-                                         &error_abort)) {
+            if (qdev_is_realized(DEVICE(sc->threads[i]))) {
                 spapr_unrealize_vcpu(sc->threads[i], sc);
             }
             spapr_delete_vcpu(sc->threads[i]);
-- 
2.41.0


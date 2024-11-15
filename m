Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp1070293njc;
        Fri, 15 Nov 2024 08:04:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXDxaHLFVGKoVb7g6WjGNCeKC5D2Yv5fthDSBX+9Bdu4i0ma09qdjX7S7tZI+4K4/fph3Xuf7aHnfQAXQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEPsGADAoQsMFg8pGJO/lCigeQjkJrdvWRfHyv0SFfc0g2J1MJMDJJ9i5c2HmaYKq36X6ly
X-Received: by 2002:a05:6402:50d3:b0:5cf:707f:a123 with SMTP id 4fb4d7f45d1cf-5cf8fc1406bmr2595283a12.5.1731686675197;
        Fri, 15 Nov 2024 08:04:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731686675; cv=none;
        d=google.com; s=arc-20240605;
        b=e8Yl+7mS2CeZ8dMURB8kthukSMSX6+lTfNXlXxsQXuFxcwrEjnFm6ahiTSpA617muz
         EqHD+84mAH3aex38l9E+6DO9t45aGYTUq1gGAbibZhmtcaS/GcmZqAk4oXbAsj9E4UDi
         EpV+GbdwyUBVa2UvBhmoHAmx/z3GifiI7k7vjpG9ZQJKIhjaLSHoen1OOON2swOn1Byv
         2O0++QP1cVF1aJ30monbJXe33E2Fs4zjqPmjHbTRpQCdg6m5GJypnKB+Xf0BLxFmJ7un
         3H0X76ViggQnPaVay6P/smnwUVhS3gJL+It/rhPFFFUaqe4XG/hMC3M/BiA48GWksfpL
         oPHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=HYD6Oh0snMVDE5n3YbBrC3LNYted9IIM3hf4WZIwNL0=;
        fh=bTtjrP8VSvfvZZLs35T7oWqHVRazx2QBBF4sLU/b80E=;
        b=cGryqmZOmBBLcjdIqmgTWHqWncQ/AzoAs2ZxruM9pgla/J3g+aanUOeWJXhdROsuDY
         2iTQKKCVGdjxjiXX8iF5X28cxP3zL5Avo5YtkdcGGyc3diAe7Kk6HiibTCdOKdL7XQAE
         60JzmgvRYTEaM3TlwWTSp7/wpIm3nDxeiyjlJROiyiGIgvCBJNdNHBqwFt4pRt6uUZYZ
         P8bmw4EgQy/QcdaW0lHW5k4geo80b5+hglo1/kDRqWI9MY3TT6UkDkBCZKxtM/CP9sVk
         jjdyNPqygXXrl0+zP0MSrp/wUAqbABLs3/7mnheK2OPf23d5slWWWOWmAC34ZkArAcHc
         T34Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=zohZPZKn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5cf8b768477si1397936a12.92.2024.11.15.08.04.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Nov 2024 08:04:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=zohZPZKn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tByne-0004Dm-8f; Fri, 15 Nov 2024 11:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <35HA3ZwYKCOMWTVZJMLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--roqueh.bounces.google.com>)
 id 1tBynW-0004Bo-Ug
 for qemu-arm@nongnu.org; Fri, 15 Nov 2024 11:03:52 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <35HA3ZwYKCOMWTVZJMLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--roqueh.bounces.google.com>)
 id 1tBynV-000436-Hm
 for qemu-arm@nongnu.org; Fri, 15 Nov 2024 11:03:50 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6e59dc7df64so20684267b3.1
 for <qemu-arm@nongnu.org>; Fri, 15 Nov 2024 08:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731686628; x=1732291428; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=HYD6Oh0snMVDE5n3YbBrC3LNYted9IIM3hf4WZIwNL0=;
 b=zohZPZKnNTrQAHnADcLT4Gwtuika1F0DtHV40zSXw2qhTHwYQd6p4Ivr4Dd69kWgG6
 vpU/aRTahD1jcwg9hstK5QQU10RkphuB+IOdBNfb0+pvC/QGzqu6ebjBTSMxBkpZ2FtD
 LxHvGvUwqYZVbDL2jGbgWW5yynaF/gQoaBMivVGd6ZubWN4R6yadBq3q83lX63sasa4T
 hUSpAGY6FW7qTWqghTlcf6zAN/IVnfbxdMV1QrNbks3bo89EQwPPsDWc1WWNnOagLOts
 rupNCbsj3J3sXvyb+IqPwPlwx9oSzQK3QuFUYodaDsZrRmZDz6+KOq/GNIaJjWQ3IhXm
 P8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731686628; x=1732291428;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HYD6Oh0snMVDE5n3YbBrC3LNYted9IIM3hf4WZIwNL0=;
 b=rIn1hphPjanRua92ajeuNxH/bStTu1ipi+stl+WvEUQp67yXZg8LrpX1UpfUqWoOVs
 mTWlldrQPBhHlxAVT+ylMh28HUcYip5VbK+zxpBVK7jZztUoG3tbZvFakeN4bdHPeFkR
 8UsPuFQgMgtMlanlgbZn6W6TGkftvURVN5RqTsh89iezwdvV5IpIO9iDMOnP08w1akgV
 PM/UzRiutq78NhcHnpE0MXS2iwhFgxI4IBnvAgHJHNYUvYIR+9wviFurzoKpNiWEYZhc
 trTNrQTpXSR6a3/x2O23NHtdNGl2V2Ng8B4fSuXP8X5F7j8CJrXd5sEox0QK4xa63Q7f
 yIkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTwt2aREzziIElv6rGFk+ajIH6xKegbwlTAOTr+mNDuGs90rWaa70xNSdmRGDeu9slKarTq/HsXw==@nongnu.org
X-Gm-Message-State: AOJu0YyiY6qCRyuwkVxkjFgOk97Iw2d3Fgg45iHAXPev6PcFtC0ZEFVq
 HlSbgnOpaCTBw+owFgWObJC5tFfXc2L2/cUmo7HB1DX/KN/A6sag59qByt5ctDefoUVUd5Yt0GO
 o8Q==
X-Received: from roqueh.c.googlers.com ([fda3:e722:ac3:cc00:4e:3bc9:ac1c:1ab])
 (user=roqueh job=sendgmr) by 2002:a05:690c:9003:b0:6ee:3f39:493e
 with SMTP id
 00721157ae682-6ee3f394c55mr592627b3.5.1731686628131; Fri, 15 Nov 2024
 08:03:48 -0800 (PST)
Date: Fri, 15 Nov 2024 16:03:27 +0000
In-Reply-To: <20241115160328.1650269-1-roqueh@google.com>
Mime-Version: 1.0
References: <20241115160328.1650269-1-roqueh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241115160328.1650269-5-roqueh@google.com>
Subject: [PATCH 4/5] tests/qtest/cmsdk-apb-watchdog-test: Don't abort on
 assertion failure
From: Roque Arcudia Hernandez <roqueh@google.com>
To: peter.maydell@linaro.org, farosas@suse.de, lvivier@redhat.com, 
 slongfield@google.com, komlodi@google.com, pbonzini@redhat.com, 
 venture@google.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Roque Arcudia Hernandez <roqueh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=35HA3ZwYKCOMWTVZJMLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--roqueh.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: hamLZoxoDi7I

Currently the watchdog test has a behavior in which the first test
assertion that fails will make the test abort making it impossible to
see the result of other tests:

 # ERROR:../tests/qtest/cmsdk-apb-watchdog-test.c:87:test_watchdog:
 assertion failed ...
 Bail out!
 Aborted

Changing the behavior in order to let the test finish other tests and
report the ones that pass and fail:

 # ERROR:../tests/qtest/cmsdk-apb-watchdog-test.c:101:test_watchdog:
 assertion failed ...
 not ok 1 /arm/cmsdk-apb-watchdog/watchdog

Signed-off-by: Roque Arcudia Hernandez <roqueh@google.com>
---
 tests/qtest/cmsdk-apb-watchdog-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/cmsdk-apb-watchdog-test.c b/tests/qtest/cmsdk-apb-watchdog-test.c
index bdf6cfa256..fe535a553c 100644
--- a/tests/qtest/cmsdk-apb-watchdog-test.c
+++ b/tests/qtest/cmsdk-apb-watchdog-test.c
@@ -164,6 +164,7 @@ int main(int argc, char **argv)
     int r;
 
     g_test_init(&argc, &argv, NULL);
+    g_test_set_nonfatal_assertions();
 
     if (qtest_has_machine(machine_info[MACHINE_LM3S811EVB].machine)) {
         qtest_add_data_func("/cmsdk-apb-watchdog/watchdog",
-- 
2.47.0.338.g60cca15819-goog


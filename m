Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1704929ejb;
        Mon, 23 Oct 2023 16:48:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5n88S41VWcmgBMt7JZULf1L25SXQjYOJvepCkUu73UWcf33M3YSK3UTB4IZbiQm/LY5hh
X-Received: by 2002:a05:6214:29c9:b0:66d:9f6e:ab4d with SMTP id gh9-20020a05621429c900b0066d9f6eab4dmr10728723qvb.14.1698104881473;
        Mon, 23 Oct 2023 16:48:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698104881; cv=none;
        d=google.com; s=arc-20160816;
        b=tp0MrAUiEET4NNZtnqrQ+UbStp5gAD6YkT6Yy8Yqwyercp4jPCqYBGPKFiFkLz3t9Z
         e4a7zAEW9vtJiN8kU7BXA8vezI4opt/kWKySgKcS4OjkwUfVYx+NgQ9SxJ+ZeQdMNNad
         V216B2G4mpeM9x5A5Uj5QaHC2bTPjGi46OwPmNNVettIE99TnaxivH/DYQIoT0kHFZGt
         yfvJ9qJM/FR3kbrjbfsVgvYned9ANHDBqHvCkvybQ5Pu7/YnlDi0En/0QLy9W32mp5mV
         qSIiCXs7oWqAQdReyT/CQewt1oSrzWH15fnkaZnsh3ZWKH8MSK9ZwJQlujQQWL21mPH7
         eWDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=i3S/ucLUb2EnGxNEuiqhEsJ4HDduUunH8ndOA8IP8mU=;
        fh=qxi5+ERGt2rtfdIuwivhWXSnjn4OAApmB1wsy27Klq0=;
        b=g41EDlhZ85wcQL1pC/mXHxmJ+xe80pBze/c1qw4sXt2K61qkqu517i1+niXEFGj5iL
         /RBMtDfor8aAm6Y2yvR4NoiLXAA+jN7JMpybEAJnFi0UJqQbRtp8UnwFvaL3JVwgSvLQ
         vncMIT4Zuehrz/rQIoCsFovcDJf16jF5FubCr2TpT8VvdrGRXS7goOfQhIQi00+gv+ht
         2OHBDCrEYFDeS23UUUo4wFdhGWXzZVzkGQxLrQKhUe/TKb20U/dfz/cE64sZBXJVlTiu
         DRpMvEqBqYn5qwgcog+1ifi/vz73a1x1e8Y0wptB5IoyMVuNRLKwnmyEo/Y+B1kyRx+U
         nQRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=zh2wS9vo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12-20020a056214184c00b0066d6afd0beesi6256467qvy.45.2023.10.23.16.48.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 16:48:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=zh2wS9vo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qv4dZ-0002ti-5r; Mon, 23 Oct 2023 19:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3-AU3ZQYKCBEAzAB98x55x2v.t537v3B-r83454x4B.58x@flex--titusr.bounces.google.com>)
 id 1qv4dY-0002t0-9H
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 19:47:08 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3-AU3ZQYKCBEAzAB98x55x2v.t537v3B-r83454x4B.58x@flex--titusr.bounces.google.com>)
 id 1qv4dV-0002p4-VN
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 19:47:08 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5a7fb3f311bso52307107b3.2
 for <qemu-arm@nongnu.org>; Mon, 23 Oct 2023 16:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1698104825; x=1698709625; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=i3S/ucLUb2EnGxNEuiqhEsJ4HDduUunH8ndOA8IP8mU=;
 b=zh2wS9vog9psef1WyMHgQ5/kFub43Bg4nWpN6UCjbPqcdY7g1p1JOVX0wx391NxLEG
 TATTcx7OAVbpxzq3zdPMb5Kf7IIYE1AZ/+oowpXMVFwzlEWmpe4zrSUA+fXbev6duEwd
 5+Zx/UXQcpaZIleBnN7v9zqsNEc4WeNhKwAGLcPIXHyvzs98D5g3s+t3RCb1T3TXxl+d
 t/XGaStB7ckh8TunNIWFH5StdncPi9geRRBDFYRGWQZcyCoVYeO52qoWLDCpFGzcrymT
 ewyUnrxgiPqI11o3a4m/tRRTS/NoGQzJeYdBIff7vX9PY2KD6sEj99DR6hAjsqwdnQqd
 oHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698104825; x=1698709625;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i3S/ucLUb2EnGxNEuiqhEsJ4HDduUunH8ndOA8IP8mU=;
 b=OXExwCdc7ZmkvFFpsLNDVFLkT/2TK+f34zJr+/nNIxi17D5TVI2DPtYT4drLwVhp4G
 E0vuWmToGSHOuQ2tZSp00u5jitWvPRwgYgxC5zIfP/FF0OR+WFm25E7NUe56CpWaX2Vt
 1JLCvGHJupoX5C+YdgL+MWtk9zmP4wXNS32JRmO190UWjE3EAWvrbF1VHDlIEZMtrToZ
 S7daOpTsMJrmlflNyKbOFmDh0n62nccRyPv01oIJLQku1KtACE7sZHUxFPIzXVVVFRy3
 Ih9r2RKJCdkQavSIHdNAdFbkRwl52cGlcAkuTR9q+BWhFLxWH9B/R6GwlxvFQe40Jvn2
 3IKg==
X-Gm-Message-State: AOJu0YyskZs3C0dgZOzXo8wjOVmq6zJqVGm4eJ5s3dVBEhIHUt+oY3Vm
 15d207kMPKgibZVfxF9vjzhToqZjwS4=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a81:9150:0:b0:592:7bc7:b304 with SMTP id
 i77-20020a819150000000b005927bc7b304mr229293ywg.8.1698104824868; Mon, 23 Oct
 2023 16:47:04 -0700 (PDT)
Date: Mon, 23 Oct 2023 23:46:46 +0000
In-Reply-To: <20231023-staging-pmbus-v3-v4-0-07a8cb7cd20a@google.com>
Mime-Version: 1.0
References: <20231023-staging-pmbus-v3-v4-0-07a8cb7cd20a@google.com>
X-Developer-Key: i=titusr@google.com; a=openpgp;
 fpr=228BD42BAD6A2BCD3865AEA6C41200175CD21E30
X-Developer-Signature: v=1; a=openpgp-sha256; l=923; i=titusr@google.com;
 h=from:subject:message-id; bh=F4m2MZ4pwdghWvz/7slFyNSaLFtYH8k3ZV6OH4454yM=;
 b=owEB7QES/pANAwAKAcQSABdc0h4wAcsmYgBlNwXv+QWP7q7WWM4S6eFZaUTPqOaKKAKE2UGBE
 SztF6QPQBSJAbMEAAEKAB0WIQQii9QrrWorzThlrqbEEgAXXNIeMAUCZTcF7wAKCRDEEgAXXNIe
 MFQTC/0dgaa2odAP+quGOBcpc+CEWqAuKpIrSJLIQP+EA7A1y6Wuz99yLdB/FKUgxHMV3570IMB
 P3u2YEq567vNdD331VzjhzYvtNbXVZWnRMqmw+nmZPvyrPK9CiTfnW9cLp0CgoSMIM2SAs6mLLp
 tSOXYD//4cM4IMvjzv3ckwU98S/51ig1ZOdC4nkPE93tNvmhJNLo6+bLpzPOnLiJ768fMFNxFl/
 yw7bdU20JFCQcMA1TEu51fQfaKl/veD9KSYf/QnVfkHOCEP5lkzuDGd+thhmLC7zFIu1x1kLt65
 DjDDgpMn3b254F2zjoUa5qhYE6Uz2UCprIc0tVN1pxKw7BOPm/CM/oJiT5QUsfP8llGenZMJVQI
 ZodC7DmgxcNAmOW29Z6L6siS1Z1O5WoBJAUR68Uyb65OvTGvLuy6mN1eBr3NUsOwinCEZV3mQU/
 wA43Lo+2P4hWrcskGvMyQc+8Yv8DHQhh/8QCRP/46M6+DcRbronmVM50M+WcWXvYLg0+Y=
X-Mailer: b4 0.12.2
Message-ID: <20231023-staging-pmbus-v3-v4-7-07a8cb7cd20a@google.com>
Subject: [PATCH v4 7/8] hw/i2c: pmbus: immediately clear faults on request
From: titusr@google.com
To: philmd@linaro.org, minyard@acm.org
Cc: Titus Rwantare <titusr@google.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3-AU3ZQYKCBEAzAB98x55x2v.t537v3B-r83454x4B.58x@flex--titusr.bounces.google.com;
 helo=mail-yw1-x1149.google.com
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
X-TUID: h+CDKHCYfq6M

The probing process of the generic pmbus driver generates
faults to determine if functions are available. These faults
were not always cleared resulting in probe failures.

Reviewed-by: Patrick Venture <venture@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/pmbus_device.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 3bce39e84e..481e158380 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -1244,6 +1244,11 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
     pmdev->in_buf = buf;
 
     pmdev->code = buf[0]; /* PMBus command code */
+
+    if (pmdev->code == PMBUS_CLEAR_FAULTS) {
+        pmbus_clear_faults(pmdev);
+    }
+
     if (len == 1) { /* Single length writes are command codes only */
         return 0;
     }

-- 
2.42.0.758.gaed0368e0e-goog


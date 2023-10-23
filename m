Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1544029ejb;
        Mon, 23 Oct 2023 11:09:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTUF5uj1YbbhB2dFwlTzjduqDXELMQBWtjrgp6TSznkt3bryoyl0TAFMwQIc+7u0rUm5rv
X-Received: by 2002:ad4:5ba9:0:b0:66d:ab63:b7 with SMTP id 9-20020ad45ba9000000b0066dab6300b7mr8442977qvq.60.1698084598615;
        Mon, 23 Oct 2023 11:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698084598; cv=none;
        d=google.com; s=arc-20160816;
        b=TxqzeC2rJCRY4KYQ/p5Ouk4X99wpHV3omE6Z0dLf4peZeLu4KSszKQN2wTv2zsnssN
         jSxf94lZumKLGzUvg8su3cl9dJv+EYfFc+81C3H5x07L42YG7w6f5tRWXbqiHLXuBf3B
         6jVBVWX86JY9UT2Exc3PCUpufuTpUHlyHUia0UunXYBNnfZVjkldi+oxAAnTjAPX1ouC
         ABk4+TmRCAJD1PzXyKiyLjl9LY/uxXUPWRaXLN/gKcn1PSHSIgzk0RMsZKY36IAJfJ/B
         YNnFFpE4SRsR95ge4ffQN3iuEXQpgDlrJTS2QL9uj4DQG/X0uvqVskQ1sReiG5XiiK+1
         fAoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=1bEPckvIqK5pjR+MT9VQ4mF1aQy7+KJPepfi6dVmWBY=;
        fh=ASJNXHrqAlWhOEXnZ6MRvcr9Ijshryz/6JFRvY2XO1s=;
        b=XjtFksUv6N5Lb5sWevJ1IE7NWt/5enUcWY/vGdkuHbbXZEX8o1hbtfE7Rp3bJ1sHQo
         uHZPnxkJaRGdd0DsIYg49HcgC0O5LxZR7+eeClXsx3UrsYTXZkCLZWQTUhBM+5MaUPa8
         dmFBz3URWZEi+VjtVD3Ed6Hfa5VaicxiNHIVbGmc125pyh0fxJM5nY0aDwtJ4D2QwadK
         RYrPUdAcWXQBXEULEU6OG/1PHgfa9/IGxuxdg7eV3NobDWOR8NKPDlDe3l0V8EvwPp7s
         jW542xbZPDLPvpToHjh6cZgLdG1D9c1NRrZ2pE4WeSrbQ5zzf1oqLdbLqlnarNHlsiRd
         jykQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=A5RRpWml;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id om31-20020a0562143d9f00b0066d1bae232esi6155131qvb.203.2023.10.23.11.09.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 11:09:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=A5RRpWml;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1quzMU-0005Oi-RZ; Mon, 23 Oct 2023 14:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3wrY2ZQYKCjsqfqrpodlldib.Zljnbjr-absbiklkdkr.lod@flex--titusr.bounces.google.com>)
 id 1quzMT-0005Nv-Ao
 for qemu-devel@nongnu.org; Mon, 23 Oct 2023 14:09:09 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3wrY2ZQYKCjsqfqrpodlldib.Zljnbjr-absbiklkdkr.lod@flex--titusr.bounces.google.com>)
 id 1quzMR-0006xs-C9
 for qemu-devel@nongnu.org; Mon, 23 Oct 2023 14:09:09 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5a7d1816bccso49163587b3.1
 for <qemu-devel@nongnu.org>; Mon, 23 Oct 2023 11:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1698084546; x=1698689346; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=1bEPckvIqK5pjR+MT9VQ4mF1aQy7+KJPepfi6dVmWBY=;
 b=A5RRpWmlfhBP58eBgg7uqoyj56PJZmcAzRTaaUH/mpWOdiJ4xpe/MtuM8HVSja6zQj
 Kc/OYmRDtW/b1zwysTcNocNRJ6w1vv8tF5OQuLV4s1J41SrDwHRJgtACkKj/+aYMbWJs
 9IOrbZWDzZXO+GwBRWeQhnYQHwy/4TNNNZkuIHFqgWjYSAteKbnMZzd8YKF+QxOMQIjP
 lGSmyHoCgTbl5LinCmElzI16Jqnl/LMOrB7QXZWHDBkfEh3MVNBKEPqGe1RnZ0u2WRIP
 T5iXAj5eNNdEI9VTq8HJSOBSd8Qb17gdjPp6BXEnQf9YJV6Lot4NSkbmV/w4VX4pMB9V
 h23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698084546; x=1698689346;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1bEPckvIqK5pjR+MT9VQ4mF1aQy7+KJPepfi6dVmWBY=;
 b=cYoni5/gd74h2arOfgTQVUW5Br0PDIOuCCOzGsHlj5F9OAlCd4fhcZBzW/jvlbDDDP
 UXBMsuDaV4PsXINpFdPenmYDiQsxU2KIVPqjP8n3QG6FEJirYoZmA6A80qkEMwu5oviw
 bnL8QXUgiqr4f9magjw7jwoaMWdTtdQ6mGWFqC1IjIuiLmQVsMQ173458RydOmeKc4gA
 PDmD8IBJvceHgbHfUde31bOU2s190jdyHaZ1+eFnUIedEG6s+pje6XKMtUSBpf12PwpP
 W1eF0C3iwT+gbe1WtYO4j1VLNY2hFpafGt7sJZvdJDA2IXVyTZY4jNruhFxOk8JbHup6
 4s8Q==
X-Gm-Message-State: AOJu0YyrypvwgjSHAtVnWZmMkwT8BLkWenvjdsff9q8Ull+4NJa1PUxv
 EJHsEcHudIHs9jdj1PA2sFVvwX5t/aQ=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a81:92c4:0:b0:57a:118a:f31 with SMTP id
 j187-20020a8192c4000000b0057a118a0f31mr220754ywg.7.1698084546023; Mon, 23 Oct
 2023 11:09:06 -0700 (PDT)
Date: Mon, 23 Oct 2023 18:08:33 +0000
In-Reply-To: <20231023180837.91785-1-titusr@google.com>
Mime-Version: 1.0
References: <20231023180837.91785-1-titusr@google.com>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
Message-ID: <20231023180837.91785-5-titusr@google.com>
Subject: [PATCH v3 4/8] hw/i2c: pmbus: add VCAP register
From: Titus Rwantare <titusr@google.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org, minyard@acm.org, 
 philmd@linaro.org
Cc: Titus Rwantare <titusr@google.com>, Benjamin Streb <bstreb@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3wrY2ZQYKCjsqfqrpodlldib.Zljnbjr-absbiklkdkr.lod@flex--titusr.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zhczFpW8cT6u

VCAP is a register for devices with energy storage capacitors.

Reviewed-by: Benjamin Streb <bstreb@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/pmbus_device.c         | 8 ++++++++
 include/hw/i2c/pmbus_device.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index c1d8c93056..3bce39e84e 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -906,6 +906,14 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
         }
         break;
 
+    case PMBUS_READ_VCAP:                 /* Read-Only word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VCAP) {
+            pmbus_send16(pmdev, pmdev->pages[index].read_vcap);
+        } else {
+            goto passthough;
+        }
+        break;
+
     case PMBUS_READ_VOUT:                 /* Read-Only word */
         if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
             pmbus_send16(pmdev, pmdev->pages[index].read_vout);
diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index ad431bdc7c..f195c11384 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -243,6 +243,7 @@ OBJECT_DECLARE_TYPE(PMBusDevice, PMBusDeviceClass,
 #define PB_HAS_VIN_RATING          BIT_ULL(13)
 #define PB_HAS_VOUT_RATING         BIT_ULL(14)
 #define PB_HAS_VOUT_MODE           BIT_ULL(15)
+#define PB_HAS_VCAP                BIT_ULL(16)
 #define PB_HAS_IOUT                BIT_ULL(21)
 #define PB_HAS_IIN                 BIT_ULL(22)
 #define PB_HAS_IOUT_RATING         BIT_ULL(23)
-- 
2.42.0.758.gaed0368e0e-goog


Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp281477ejb;
        Thu, 30 Mar 2023 17:09:25 -0700 (PDT)
X-Google-Smtp-Source: AK7set/Z0ahNgqqI1pKaG6ODALmZvR52X5tZa0+w5IX4kbllHxvskGRbG+wMjP83BfnqUtiamSLc
X-Received: by 2002:ac8:5744:0:b0:3d6:dca:f0df with SMTP id 4-20020ac85744000000b003d60dcaf0dfmr38147182qtx.66.1680221364991;
        Thu, 30 Mar 2023 17:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680221364; cv=none;
        d=google.com; s=arc-20160816;
        b=XNLwjRCuI1KgFJLn0hrTGsM79jSQJgwxMaxfos/UXHl4dId6O33un2ZILVIqArNRZu
         vHMxzwJQslkRPfkU9KQGjf6XXgHBX4+T0MzJZdI0dmYCyO84JgxOagmYetQAqsp90j8k
         WxckVHYfKo4Ldr1lSNsAVB+LOeLNdqW3Kk37esOHr5HgYJh8uQeFUJygTLR8Eahyl2I/
         +Qqiq3jwZJVicFKie+FpsA52mGVsGO2Q4ciuwyHhkGTdpormL0wgRxDxFRXFhDXOL9Uh
         V+a+MIoS69tYRzNbn6catbBK3YACsee6TQy+SITFocGFEnQq/HOqdBq86qFm1AX+a9YS
         lUww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=6MwfbHdxuIOtH0NAbW8vcKKizTpZOCl4cwXr1Kj34SU=;
        b=Hs0B63ZrTQ7X8rpFsT1Ak5kYWI97sut8CJQrPHF4eL+K75vU6e89srjr4KRyie3h8F
         aczW19/Uzyf6p7XOQgWwuNrDofp58HisNf7y543MRYlx899x+ItYVJ5Lkm8r98cDySxw
         KOY40Dudmt5niCNT5r4zVwx3IdMNibql9o3o71Oy1CsxBC81l6ngcpBGW5Ir3+fMKQ05
         4iC6nrR+pXF0hbuRR6DJLJd3aIW3PoQV7Zwp/Z0WN8bNgUS+GTXMcJaq0i8DZL8+a47j
         BbqZxKQZTms8IjcFC0F29egiQiafmzUCQ9+fhNHqyaLOvhDvG4dKh1LIiEjW7nu014lO
         SVuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Xoqaedza;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq9-20020a05620a468900b007469f8af763si580658qkb.558.2023.03.30.17.09.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Mar 2023 17:09:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Xoqaedza;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pi2KC-0007F6-Ar; Thu, 30 Mar 2023 20:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3hiQmZAYKCI8C1CDBAz77z4x.v759x5D-tA5676z6D.7Az@flex--titusr.bounces.google.com>)
 id 1pi2K8-0007BL-IE
 for qemu-arm@nongnu.org; Thu, 30 Mar 2023 20:08:57 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3hiQmZAYKCI8C1CDBAz77z4x.v759x5D-tA5676z6D.7Az@flex--titusr.bounces.google.com>)
 id 1pi2K5-0005q2-So
 for qemu-arm@nongnu.org; Thu, 30 Mar 2023 20:08:56 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 e186-20020a2537c3000000b00b72501acf50so20552656yba.20
 for <qemu-arm@nongnu.org>; Thu, 30 Mar 2023 17:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680221319;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=6MwfbHdxuIOtH0NAbW8vcKKizTpZOCl4cwXr1Kj34SU=;
 b=XoqaedzahbGh+jdb0RPj/l7LmuvLGh5OLjY9N8gJSQDQZreoS1iqM+GU5+rk4StbyZ
 FCcD+RcCcFpAChkpL+8M9qivd6zPiw8U3R56U6YLNzqLRB5Xx2bkGOVM1yjbLF8bXu3k
 btALCziXrptWhtHJeJG9W10VkxyTpQPJlGI1H9T5VK3YqwqaN7ZRX9dnNux0gM2s/pj4
 PdVCxund3TjIOd4Gx+bH9gQ+ci3f4LSxW9Zo9SDvQzofryNRW+LvQnlGNGtdMPIFqTK8
 xOXIENr52JTgebC3fAWnr85AedJca+xCliAMrxG9ll+rtRpl0lusEXe4pV5oem3uqAiP
 sKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680221319;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6MwfbHdxuIOtH0NAbW8vcKKizTpZOCl4cwXr1Kj34SU=;
 b=K4nm3MPCOtmatmnT7twBsUp30Mok8ztK9UKHd5Dn/gaDrqO6qELaJLOU5xUBs8xYhy
 mAMlir09ikWh3/OmwkYjhyKvqy3yieDmqreEeDX5Y7dpWgWzXPrf58XNYAgOUg8v03P2
 0s9FBi67rODnI5Qm3LOIjaf25wtd3o+3L1+2ZZDQohcYWSN0w7I+MDB27eH3VwpBDKEb
 2ISES1viVaKPHVYNZGqKPtepBlDhQEPCpFovM9a4kxmIRcav8r6iqGD5nc9xu78HmO3R
 y1O8D5xix2/GAUWDAy0oz9VZ6zK73Wlal2Jd8AKe5o8NO6+prEXeaAZTFjb6W2LlxQ7a
 7LMA==
X-Gm-Message-State: AAQBX9fwFaPaIRxedPZc0lQxwN3SXUJGB43Wttp2+WzeZdf8ABgc59jJ
 qGn4ia6Ppjm/5/nugZpCTj/0ydeEdzU=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a05:6902:168d:b0:98e:6280:90e7 with SMTP id
 bx13-20020a056902168d00b0098e628090e7mr16740002ybb.13.1680221318928; Thu, 30
 Mar 2023 17:08:38 -0700 (PDT)
Date: Fri, 31 Mar 2023 00:07:54 +0000
In-Reply-To: <20230331000756.1712787-1-titusr@google.com>
Mime-Version: 1.0
References: <20230331000756.1712787-1-titusr@google.com>
X-Mailer: git-send-email 2.40.0.423.gd6c402a77b-goog
Message-ID: <20230331000756.1712787-6-titusr@google.com>
Subject: [PATCH 5/7] hw/i2c: pmbus: add VCAP register
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>, Benjamin Streb <bstreb@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3hiQmZAYKCI8C1CDBAz77z4x.v759x5D-tA5676z6D.7Az@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: PCUn2eIzDv7s

VCAP is a register for devices with energy storage capacitors.

Reviewed-by: Benjamin Streb <bstreb@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/pmbus_device.c         | 8 ++++++++
 include/hw/i2c/pmbus_device.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 18e629eaac..ef0314a913 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -903,6 +903,14 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
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
2.40.0.423.gd6c402a77b-goog


Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1543632ejb;
        Mon, 23 Oct 2023 11:09:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQD7CtgqkfgOZXrDCiq2KVF46iXjwygtQY9V4v8sqhpqAQHlZW3eHQ4LuXBGEX/f3ZRahY
X-Received: by 2002:a05:600c:474b:b0:408:53d4:52dd with SMTP id w11-20020a05600c474b00b0040853d452ddmr7339065wmo.22.1698084565041;
        Mon, 23 Oct 2023 11:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698084565; cv=none;
        d=google.com; s=arc-20160816;
        b=kvzMC/iiXF9cxwCzhX8v0pvA4AjKG81cl4u+6eWsVnLSgsc4Ub8wYfWTbjmwGc+lom
         8ITtawfk8yFUUoycUPh0SOKsD9r/yV0AKjDPTlfyE0jFgTehGNcT5jdKF8yQ/4Z2F9Y7
         57rZS+cUR5Sid9MyisRpeOc7mixd+XLQp879Bsa3UP20JCFeDelfrR1mj0iThDgAn31S
         SSjr1hdJMySx7/x7xrQQqFWPxltu8qQlZQ0rWhpdkegGSKr3+oALlEvSaUshLZo37GJk
         iTU8A5ABbEV42zPQqOCYeBzq5vz0OaLJ1VnL69ER8qeWT43KMhBstpyzUDvE7TxML+Yx
         U0Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=KbV14A8alfaUICvgPRLDukMHo/7m/lBZ+95cv/4vjS0=;
        fh=q4lL/uJQlrYuciyVDC1dM88wZO52S7lbF1hOqFxq0Bk=;
        b=iQNHH6gxhnBUwM59aLW6xSTLOW6coBfr7MvhIcETM+XvB2DHKdx+gQ6VvnOsZL5TRx
         mxbtOTvEBAAbe8XVUVXdEbwMwPfOSIRYHrj6vslplghSlZ3pSDBYAAir33RenviUGttB
         8pzjytkcL3CSVXcnPUQQyl4RqKFzFshcK1NaAwIdb0AlfPKe9iLTJQ/OyWC54NjG+zj3
         OOzewJ6JVgbGupk1YRtyneMaa+WWMpkM700bmCSyW4ijoMpiOaCt+0s0LwTB/23S/Htf
         TT+kDN9W7PO0/XTVS+EtCC4CBjpBbqAGIFyp9r1L+CcyqTyL1Ldtk0YYXg4P+tid3VoO
         t5MA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=rK+ya0Hs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p9-20020a05600c1d8900b0040547fd0c06si8436428wms.80.2023.10.23.11.09.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 11:09:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=rK+ya0Hs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1quzMU-0005Oh-RD; Mon, 23 Oct 2023 14:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3wLY2ZQYKCjkodopnmbjjbgZ.XjhlZhp-YZqZgijibip.jmb@flex--titusr.bounces.google.com>)
 id 1quzMS-0005Nd-QF
 for qemu-devel@nongnu.org; Mon, 23 Oct 2023 14:09:08 -0400
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3wLY2ZQYKCjkodopnmbjjbgZ.XjhlZhp-YZqZgijibip.jmb@flex--titusr.bounces.google.com>)
 id 1quzMR-0006wy-6t
 for qemu-devel@nongnu.org; Mon, 23 Oct 2023 14:09:08 -0400
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5a839b31a0dso70400437b3.0
 for <qemu-devel@nongnu.org>; Mon, 23 Oct 2023 11:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1698084544; x=1698689344; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=KbV14A8alfaUICvgPRLDukMHo/7m/lBZ+95cv/4vjS0=;
 b=rK+ya0Hsvjna+X0keynGni/1hOBAKfos88oacPZtgX5CLiRdcXEqXT0pkeNsXa/8n1
 XvASqW25ISpd5fIixXD4HYH/dKiKCyzHZQGI7H5PMcFLA+qo95mqn3kwvbTcET1A6+/M
 Z5JQfikEpwlM11d1ICjByTUCPwl3wpPs6Sr29q2GSd2rMvyvCznePmOHrr8KfzHoz5EG
 bcUzuseqcf4WA9Ujp3GtPXj/GjdSOW/9JTzR00QJRBWUdA1pPp3ofT2VhDWZRwrF7xYO
 J5LYLsHfoJyHOGWu/v9tX6eSjY4+FUGaSXgBOv6YWamB3SQpTpDS5QOmyJHPFey5XwM8
 63xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698084544; x=1698689344;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KbV14A8alfaUICvgPRLDukMHo/7m/lBZ+95cv/4vjS0=;
 b=k0he9NcqhnXPKihR68VsqnQV8Ry9B5fTShnwViUHoLhylMwkNYsCdIfb89eEBWdVna
 xKKd8ucefSFtVxeyF8P+BUUtBeN7NSRLGHhVSjxZJedm+RJocbCPEYXWeZHmP3xX+Jxo
 8aTxteJe2PhK/aTm0qkNmXvbUnjEcIGhPsNMR6DRFQCWXXozUsauBgisl+xtORBUuP/U
 NUgxGnwU1Y3cqUb5U/rFobIqX99fFflg3UTjpZfwaTdq4ZBxMCrUYKgWCUhnd3t/Jb1j
 9BhIm016Kk+crzj8mPJXeO9auXRvB5BGmH5TOD5foms2cZ3MsZ1IWFecjQxfj2BVx2HN
 T25A==
X-Gm-Message-State: AOJu0YzTlzpl026Blq5nZigUyUfTJBaOXvtAURgEbMJMkFOVOzZEZP0a
 PAZdfIf+o1/D5EIXm3t9mzBO70RRsUg=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a81:6cc3:0:b0:5a7:a98a:4af0 with SMTP id
 h186-20020a816cc3000000b005a7a98a4af0mr220029ywc.3.1698084544085; Mon, 23 Oct
 2023 11:09:04 -0700 (PDT)
Date: Mon, 23 Oct 2023 18:08:31 +0000
In-Reply-To: <20231023180837.91785-1-titusr@google.com>
Mime-Version: 1.0
References: <20231023180837.91785-1-titusr@google.com>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
Message-ID: <20231023180837.91785-3-titusr@google.com>
Subject: [PATCH v3 2/8] hw/i2c: pmbus: add vout mode bitfields
From: Titus Rwantare <titusr@google.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org, minyard@acm.org, 
 philmd@linaro.org
Cc: Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3wLY2ZQYKCjkodopnmbjjbgZ.XjhlZhp-YZqZgijibip.jmb@flex--titusr.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: p9nnr2YrUE30

The VOUT_MODE command is described in the PMBus Specification,
Part II, Ver 1.3 Section 8.3

VOUT_MODE has a three bit mode and 4 bit parameter, the three bit
mode determines whether voltages are formatted as uint16, uint16,
VID, and Direct modes. VID and Direct modes use the remaining 5 bits
to scale the voltage readings.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 include/hw/i2c/pmbus_device.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index 7dc00cc4d9..2e95164aa1 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -444,6 +444,14 @@ typedef struct PMBusCoefficients {
     int32_t R;     /* exponent */
 } PMBusCoefficients;
 
+/**
+ * VOUT_Mode bit fields
+ */
+typedef struct PMBusVoutMode {
+    uint8_t  mode:3;
+    int8_t   exp:5;
+} PMBusVoutMode;
+
 /**
  * Convert sensor values to direct mode format
  *
-- 
2.42.0.758.gaed0368e0e-goog


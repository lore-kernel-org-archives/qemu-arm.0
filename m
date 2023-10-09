Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1857645ejb;
        Mon, 9 Oct 2023 03:05:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVNCenDU/D36HvkxQRgWIv2oj9KNx+YC+pZDmTxZG1lkx58gCaejM54V24KLfXP+0hvLpf
X-Received: by 2002:a25:5d05:0:b0:d8b:1407:f61d with SMTP id r5-20020a255d05000000b00d8b1407f61dmr13166190ybb.26.1696845934355;
        Mon, 09 Oct 2023 03:05:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696845934; cv=none;
        d=google.com; s=arc-20160816;
        b=dRbBo+4woIrWjyVCcPo26SShN1Qx8O4q1aMAmnTZiPYAk8FbmNiA/uEb2HJdu2ytBG
         psKCJUI7sYrwvQ9TAtB8TpoIGyJXZVMeuA0z9HXGrVDKBwoELfzndJTspcfCGe1csgpu
         mUongo5YJW5WAzoazIG0mj/9v96+oN23E+Tvx1Mi1FocKeP7FjFsOC4TGeE02D2cT5d2
         80UOXfsyPmsQ4azrdOGjuqKH7jeX4eh6RcCYoaDVd0DqOvbbGXj1y7OvpxfmkAeogXeY
         wWfuNyUFPc3CdVXfLSyRM6MvnhQwEkW65mV9Z3GPjWlv+GfwjnnMyHrpAJhWOkXJ3V1y
         MwWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CcautlB5vSVFo4vMCX8wZDEeLw5WS31TyE81+hqdwZU=;
        fh=+UA/OvAzPt1sCt0A7U0kURxgTxGl33GhvbTVlpu8K7o=;
        b=e2lRF0YZmgk2tLhobqyUhBr1ys5Gn2paBRpygHpBEQDuZlGlfcmfSucO5zwbDoNx0W
         /bVBKtu0+9BBU4C3Ac4ioOk4TheJ0m5vKPID9dwc6URk8syCtFhq/B5sZ0vQKyPONClr
         MdPYadI3mYzfAw1gjd7vHFKUSC9rrG5Vt+NoJDbazBvWxrFy+rBi4IQLu0YWSjkqRaba
         yh/VGsL8fiKAURCrWnGnmQKtdYRAKqTi0FZ5qDWwWwIGGDaaxrs0DefE9s8tD0Jq61gN
         R9/9otD3FWhPYrCrUqeN/ktvbJtkQ5cjuzqxI6CZpAfomw+h0zIah/FO0CvwtGWB2HdA
         OQyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LqiENubT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i10-20020a0cf38a000000b006581f67af02si5810009qvk.400.2023.10.09.03.05.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Oct 2023 03:05:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LqiENubT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qpn71-0003Qw-Qo; Mon, 09 Oct 2023 06:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qpn6h-0003A8-My
 for qemu-arm@nongnu.org; Mon, 09 Oct 2023 06:03:25 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qpn6a-0000AJ-Fb
 for qemu-arm@nongnu.org; Mon, 09 Oct 2023 06:03:18 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4064867903cso43236805e9.2
 for <qemu-arm@nongnu.org>; Mon, 09 Oct 2023 03:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696845792; x=1697450592; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CcautlB5vSVFo4vMCX8wZDEeLw5WS31TyE81+hqdwZU=;
 b=LqiENubTzJbwxZmhmbciLJv3+8ZiwzmAevxrBHFuBtw9bQtm4bV8KQdaLtQpTaZwvP
 cI3kBPm6NRqHGc7t13QEv7WrZDYcsXDOYnvmW77HVHwVi8gpxwyy2T3i5rUcf9zvM8Za
 9dGrpeA0enPcuDbMi+Yh44/bmyrQAuMvKnNDKJlapdWNatvVQjpoF/G1Y6Z6Zw9Q6gpz
 cgi7jK15DWKpeOQOA053Uv3FSMzFhd7q/UqKJASSMJvoPKMV3jX7dVhGX5mr5Hleq1qd
 VzNLpGeU8tJqMCvDyXw6WMKB6nZ9SBbhuYlxURI0dBoIa4zvhrg+NQNr4vlOMrUnqqi9
 MbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696845792; x=1697450592;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CcautlB5vSVFo4vMCX8wZDEeLw5WS31TyE81+hqdwZU=;
 b=foYrUW7NZfhVClnMdLuxNWEIXABvv+4BeDNz86k0NNXqyWBV0yLlY9c9ujlVuE4Sjx
 MsIQ+XDieLC/W+MmeKRSIC/VSMycgiTu3cZLw8h0rYdqaBXkPApGn1oWrw21/5uoxttS
 EgwxjnTp7uoNu20j7xpNxnG4E/YEugyLyWp0pOThugCTR9yifwf/NbO4IhTFfqS4Mzku
 fuIEGp/LvhuIhvc60fkKgLBCgsokdHHbUNxzKwjv0vVb3PMSb6dajnlm71EX7Bgvfe+s
 wHPfPQkKJAYPg4Qm6to8Sf8QWnYD/DmPInZtsqKpWvgLsq1Kaa3PlQwEbGB67V765yB2
 8Bjg==
X-Gm-Message-State: AOJu0YzQcaowfgHoExmNLe4lkwsVAfS5tfTLUPr5H9h/W4h5hbNxxwcT
 ubw+yemRp/clO53Slc6TSqNqWQ==
X-Received: by 2002:a05:600c:2191:b0:405:36a0:108f with SMTP id
 e17-20020a05600c219100b0040536a0108fmr14034470wme.41.1696845791966; 
 Mon, 09 Oct 2023 03:03:11 -0700 (PDT)
Received: from m1x-phil.lan (thr44-h01-176-170-217-185.dsl.sta.abo.bbox.fr.
 [176.170.217.185]) by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c3b9000b0040684abb623sm13067525wms.24.2023.10.09.03.03.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Oct 2023 03:03:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Alberto Garcia <berto@igalia.com>,
 Hao Wu <wuhaotsh@google.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Tyrone Ting <kfting@nuvoton.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/10] tests/virtio-scsi: Clean up global variable shadowing
Date: Mon,  9 Oct 2023 12:02:44 +0200
Message-ID: <20231009100251.56019-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009100251.56019-1-philmd@linaro.org>
References: <20231009100251.56019-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: slJDEiWb+EaL

Rename the (unused) 'allow' argument, following the pattern
used by the other tests in this file. This fixes:

  tests/qtest/virtio-scsi-test.c:159:61: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
  static void hotplug(void *obj, void *data, QGuestAllocator *alloc)
                                                              ^
  tests/qtest/virtio-scsi-test.c:37:25: note: previous declaration is here
  static QGuestAllocator *alloc;
                          ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/virtio-scsi-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/virtio-scsi-test.c b/tests/qtest/virtio-scsi-test.c
index ceaa7f2415..db10d572d0 100644
--- a/tests/qtest/virtio-scsi-test.c
+++ b/tests/qtest/virtio-scsi-test.c
@@ -156,7 +156,7 @@ static QVirtioSCSIQueues *qvirtio_scsi_init(QVirtioDevice *dev)
     return vs;
 }
 
-static void hotplug(void *obj, void *data, QGuestAllocator *alloc)
+static void hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QTestState *qts = global_qtest;
 
-- 
2.41.0


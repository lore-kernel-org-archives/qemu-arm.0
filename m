Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp3991088ejv;
        Tue, 2 Apr 2024 07:28:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWwB0+FaF3zfLIyAGNxQ6O9DmCnsY4Qm2btim7s8Arh2o1I0PySQ+tr2fZd8ZmkXcv3nCJGc1uBc85FWzhzpckWQQx0o5Qw
X-Google-Smtp-Source: AGHT+IHNPBgBTSF7et/iwnqnLEkXmlHVamN2qE4MJNsH//UG9EQ4Sx23KE/CDZR8DSMwH7koQrgx
X-Received: by 2002:a05:6808:1455:b0:3c3:de07:3bdf with SMTP id x21-20020a056808145500b003c3de073bdfmr17478710oiv.1.1712068104838;
        Tue, 02 Apr 2024 07:28:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712068104; cv=none;
        d=google.com; s=arc-20160816;
        b=IyqX1DoPbv37qxLqG+FVegumu+JuV3nrOxWh6JNPyncNE1NObR8IwFZJhpfIxrgI+T
         leu+++JvyvegGUHqDFCC+V8EXuqx6ND5CGKtOtj9tTS/NVav/ALbK9gAon1pDwt173lO
         /kM7c6ARXDaQIeDDOeON7W5JdccWqyJaz58NPaL699JFO8dywuZJJfK3VGlTTqOTV3Oq
         b4fCNRaDz5G8+dQ2IILT/GZQRs53+Hdyuzrv5Cx93m7ryVcL0mDbnZbbAxzorpo16lSg
         vip1ZKu+co4EcV8xKlLu5djz9UpS53zbo/o5XYR3OfohcwR9x8/fcLCysq5GaAi4jDZn
         OqTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7qcHH+OAhHv5oWHUpWK7YMWCpNLvO0BPFhkfbb/3C2c=;
        fh=5iKRsLWnxXX6gQOG4gdAvoi4xSWWi+UHEfGVqgqjeZI=;
        b=ApvksuByW7Ccg2GQ9+0pHgMb577LFuhvuktsPuqYiQqLoLQK66M+v/emg0h2i6f0DT
         sk7rD+Z0Y/vprQderba19Gi9Gy2CYoAd16mnZDV3NynS3u59a4oOqLRVS+u/TB8f/nYj
         WB3eyn2tWgPtYasV1LfOeya4EviF8I1Z7chachJpwRcJetb/QbTRmj8qmj9o06Tb3X2/
         KMb9dJECUqyabxPpz1fFed4+dfdpaiMx9jMDnXZkzw+pYywA+PDZPeV5HdsQhJPFv6De
         Wql4J7elurLT/e5NsNj6RtsvxT5bADLI3asFQFMKtBs2dUfbTJWEfgdLJ8I/hUdF9Q0/
         sqZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hskFWnFB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12-20020a05620a088c00b0078a03225bb7si11827501qka.84.2024.04.02.07.28.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2024 07:28:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hskFWnFB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrf5A-0001sS-2D; Tue, 02 Apr 2024 10:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrf56-0001lC-Lb
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 10:25:44 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrf54-000064-Du
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 10:25:43 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33ff53528ceso3778730f8f.0
 for <qemu-arm@nongnu.org>; Tue, 02 Apr 2024 07:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712067941; x=1712672741; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7qcHH+OAhHv5oWHUpWK7YMWCpNLvO0BPFhkfbb/3C2c=;
 b=hskFWnFBvkFPy8nFb1IeN2z+snIZBvs3k3PXE7OJ4wIUl+Cnl6LUze7nB3D9SRIFIm
 TvDcv0Tk64fLxcqiDjo6DZzaB3eE+XLqVayJdJBwdJWlEZXxm01tQQLXNL6P/57cw2Pv
 eaYwOpzuw4NgqHLbgKbUrCGMZ6y0Nj+XcxAY1oUhyA0k9moSoscOlATq9SjFrjGfKOuS
 MZpPFwGEI4lW+Vhsd680XjrAnWX5zj/mUD7N1U8bwTuIeR8OzBJPvjBRZiWWnZ0uj3NM
 fs1SNIjjgJ6XqhGQ9KqJ3gpRjMgOnxH3ZwB2ZEVsIgKi0Vc45AMkijSuWjZ9RmszWkUP
 rF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712067941; x=1712672741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7qcHH+OAhHv5oWHUpWK7YMWCpNLvO0BPFhkfbb/3C2c=;
 b=ndXxz/mO4Lu/yuCCte0MSM4HuQYMuEqqFjvUDpAocX5k+TX3w6JcGmdwM2Ae+CZDN+
 J7YaKbo+ezhnQY6hUuDR6lWKkqLzMaDpt76vVcCNkOH/6wykjz+XQ+rFNkBF2I6KlYmP
 BeydyzRLS0NCHp0AWKSzU/Msrm42aZhGnd113ka28rfPAZVyXB4FC6P4BIS2QpBiHu7d
 vCMsIPIPojSMHmObfe5Mj7rM3jQUH5/snl7q+jia2E06FLlyORrikAd5aY60WDTpZdPC
 MTdqBdmunrCBXB8OL9JEn+dOUy7h13wNR3suEBc0rWKqIho/qeMjQV9ynA0uyHsFvPd2
 JvRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3Dr6EyLJP9WWE8AulPPY7ov7NFpolFMkdaPt92cFGdSEQCq+gFC9tbp+FqdI+J7B7ba7KrUR29oxinrz+BPuENKgc
X-Gm-Message-State: AOJu0YwuS4n2x9mry7V8/gzGNT/2+fknYRqZvqBjqVs9iZuzx6df0X7Y
 R/Sh3zdXpB109BJDu+tr4/1pZpn0/VbwP7Q/53crnRgEAOpgZLMVaiVOTr8Pjp8=
X-Received: by 2002:adf:ca8b:0:b0:33e:7719:325d with SMTP id
 r11-20020adfca8b000000b0033e7719325dmr7135610wrh.2.1712067941079; 
 Tue, 02 Apr 2024 07:25:41 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.202.91])
 by smtp.gmail.com with ESMTPSA id
 az15-20020adfe18f000000b0034335f13570sm12328862wrb.116.2024.04.02.07.25.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Apr 2024 07:25:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fiona Ebner <f.ebner@proxmox.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 10/15] block: Remove unnecessary NULL check in
 bdrv_pad_request()
Date: Tue,  2 Apr 2024 16:24:25 +0200
Message-ID: <20240402142431.70700-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240402142431.70700-1-philmd@linaro.org>
References: <20240402142431.70700-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: 4VTfCCZSWwV6

From: Kevin Wolf <kwolf@redhat.com>

Coverity complains that the check introduced in commit 3f934817 suggests
that qiov could be NULL and we dereference it before reaching the check.
In fact, all of the callers pass a non-NULL pointer, so just remove the
misleading check.

Resolves: Coverity CID 1542668
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Fiona Ebner <f.ebner@proxmox.com>
Message-ID: <20240327192750.204197-1-kwolf@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 block/io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/io.c b/block/io.c
index 395bea3bac..7217cf811b 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1730,7 +1730,7 @@ static int bdrv_pad_request(BlockDriverState *bs,
      * For prefetching in stream_populate(), no qiov is passed along, because
      * only copy-on-read matters.
      */
-    if (qiov && *qiov) {
+    if (*qiov) {
         sliced_iov = qemu_iovec_slice(*qiov, *qiov_offset, *bytes,
                                       &sliced_head, &sliced_tail,
                                       &sliced_niov);
-- 
2.41.0


Received: by 2002:a17:906:14cc:b0:9b2:89ee:1eb8 with SMTP id y12csp70517ejc;
        Wed, 4 Oct 2023 21:54:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1mntBisy6QhPG16IiFoLRT8TpNbcOL1vPdsZw8Eohiq+bSeGW4aiJUcnPSK3ifaDZHWhi
X-Received: by 2002:a05:622a:349:b0:412:3d25:9019 with SMTP id r9-20020a05622a034900b004123d259019mr2145208qtw.6.1696481649614;
        Wed, 04 Oct 2023 21:54:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696481649; cv=none;
        d=google.com; s=arc-20160816;
        b=QUVSO3m0RhIip6cCZOspjQK+ayu2b6+c5/S+Pn1DLvCvM2P7/AkE1+ltc9O1bjsZKT
         PMgc9bfT0kJjZEvWuZSYtsZL31nZl2B/pE+22JoVdB9P1B9jYhU9eIKpzUtEGng3pRdy
         TCVw2goP/oJ2d5Ffv0Ryr6qbyrcLhBCgGg2yvqUg7XvaoLfrzT1ETW7R4Zlt2jhPWo1Y
         fRJ7hxFw2UWlNMwo66B4NaiJ92ugKmZ/HHa4Ia39OEJv9cmwAJhIpql1C7J7d6ojgKpn
         flqCPbMPDC0a41LwBjLnlRcK4FR+Y1Pp9d6c1iY6bJCg6TAYw5bu1vxsMQ9yzoSK77HY
         a3Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iUgMeUD+upV2LccJ26enpy7uECYexY6ww0G/2qJYl+4=;
        fh=hQC7qgxuI1C+CoTC+aPjdtvWzX3JHmASdQZJ5g3QVcM=;
        b=OdToGvPT7PCrwT6DE9NYp8AJGWyxaSCzvL7VofoxjPL3ayAEK2I1hJErvEbUJPUrPf
         sz7bbF3Ka/AjBRUYwLyIsqzMZ7kh+a7E6kK9GZtaAANdXE/918qhqXZG6Q5DypCoRI1V
         1thgNZ70cf0y57aKPG6tkTVhtxmBYiZFmlXQBeG354AQK4uezo0mD3uu46eR0icEel1A
         oYRtSYV4cTgf8bcHIg2qRARUZYDFy2F6jZf/RF29yy12LDfgqwD3iJa3pCndVlQ+1bW0
         74qSzw1r4n3CWXhpu0qB2ivPCRS+4Jeedgm6SCvLp72vToiHCfJ4ENEyRaDtikqzy9F2
         d9fQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NVXIzMMk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20-20020ac87d14000000b003f4ecb4085bsi426080qtb.289.2023.10.04.21.54.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 21:54:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NVXIzMMk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qoGKS-0005Qt-QB; Thu, 05 Oct 2023 00:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qoGKL-0005Hu-5x
 for qemu-devel@nongnu.org; Thu, 05 Oct 2023 00:51:11 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qoGKG-0005SE-M7
 for qemu-devel@nongnu.org; Thu, 05 Oct 2023 00:51:08 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40651a72807so5064525e9.1
 for <qemu-devel@nongnu.org>; Wed, 04 Oct 2023 21:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696481458; x=1697086258; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iUgMeUD+upV2LccJ26enpy7uECYexY6ww0G/2qJYl+4=;
 b=NVXIzMMkYtI5F0kODpz6zRRwRgIUY7oPA57T9Fof+f3N0dV+PHUSe4J4k1/E0H8oda
 zCoJH4j74mYudNfMq9N3uKAu72Uny/lV0UDTgwI6AjKkEvWk3tskWLcr0YKw5yjz9sNT
 K0wbN2Bde7TO/1h6dW243sssc9H65PoU0kKOrns9GcoSecGa/EvqoWbzNPZWQUl/fF9k
 sPdNcmCnk6dTwrRmRnDEItaUkh40Su4RTZBKm6nSnuVV+IBn1LoULqulG0Kz4cPb02H2
 52wBUsQi/qfciRz++neVuSZlS1Iy/ElQe0T7hw0fE8EvtPcVm6/ob9uJbYAVkofKp9oz
 HNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696481458; x=1697086258;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iUgMeUD+upV2LccJ26enpy7uECYexY6ww0G/2qJYl+4=;
 b=isG+8TuaQ1dnokCYMZvHUuHdwpsQz2Yf2Qe2R42c/YGyiFsoQcQwu09iYwT6GWjjGZ
 OIHQ8lrV0EtHlmWSl+4RlYexe2rsU5IVXVsdp4aJcajlMZVdsw9k/al60AAHyx6UcGj0
 V1/Dhh7vu4EyBnaEEC2WQ8ymlTOk/bd7fgEC3tJxJ2odrfhz5oWWMYLQ1mUrgkUX/LFq
 yg8y/khz27s3Bm6Cq1a1OqTvIW6qycDzCrSqR1mO/35OlkZDzA5nD7dYzIQ1cQ2k02mz
 rm0MuNhpTOAQ4voDQ4QMLtmeeR5xGtAGHR5fTCjtNgb9GrfzvEtYihAvKmalAwDHURZL
 +eMg==
X-Gm-Message-State: AOJu0YxXFnSYm4WQmPEvFuQIgMWQ01zfANEm2y/RnQilFFfsUtJBSxBG
 TGs/PT6KncvKFRMG633tMzdVKVpK0y50kgP8ZsA=
X-Received: by 2002:a5d:4d8e:0:b0:324:7bdd:678e with SMTP id
 b14-20020a5d4d8e000000b003247bdd678emr3802256wru.60.1696481457809; 
 Wed, 04 Oct 2023 21:50:57 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-211-120.dsl.sta.abo.bbox.fr.
 [176.171.211.120]) by smtp.gmail.com with ESMTPSA id
 o6-20020a5d58c6000000b0031aef72a021sm746323wrf.86.2023.10.04.21.50.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 21:50:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 02/22] qapi: Inline and remove QERR_DEVICE_HAS_NO_MEDIUM
 definition
Date: Thu,  5 Oct 2023 06:50:19 +0200
Message-ID: <20231005045041.52649-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005045041.52649-1-philmd@linaro.org>
References: <20231005045041.52649-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: kqq516Bk8J4q

Address the comment added in commit 4629ed1e98
("qerror: Finally unused, clean up"), from 2015:

  /*
   * These macros will go away, please don't use
   * in new code, and do not add new ones!
   */

Mechanical transformation using sed, manually
removing the definition in include/qapi/qmp/qerror.h.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qapi/qmp/qerror.h | 3 ---
 block/snapshot.c          | 4 ++--
 blockdev.c                | 2 +-
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
index 1a9c2d3502..168177bcd7 100644
--- a/include/qapi/qmp/qerror.h
+++ b/include/qapi/qmp/qerror.h
@@ -17,9 +17,6 @@
  * add new ones!
  */
 
-#define QERR_DEVICE_HAS_NO_MEDIUM \
-    "Device '%s' has no medium"
-
 #define QERR_DEVICE_IN_USE \
     "Device '%s' is in use"
 
diff --git a/block/snapshot.c b/block/snapshot.c
index b86b5b24ad..eb43e957e1 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -345,7 +345,7 @@ int bdrv_snapshot_delete(BlockDriverState *bs,
     GLOBAL_STATE_CODE();
 
     if (!drv) {
-        error_setg(errp, QERR_DEVICE_HAS_NO_MEDIUM, bdrv_get_device_name(bs));
+        error_setg(errp, "Device '%s' has no medium", bdrv_get_device_name(bs));
         return -ENOMEDIUM;
     }
     if (!snapshot_id && !name) {
@@ -420,7 +420,7 @@ int bdrv_snapshot_load_tmp(BlockDriverState *bs,
     GLOBAL_STATE_CODE();
 
     if (!drv) {
-        error_setg(errp, QERR_DEVICE_HAS_NO_MEDIUM, bdrv_get_device_name(bs));
+        error_setg(errp, "Device '%s' has no medium", bdrv_get_device_name(bs));
         return -ENOMEDIUM;
     }
     if (!snapshot_id && !name) {
diff --git a/blockdev.c b/blockdev.c
index 325b7a3bef..e5617faf0f 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1422,7 +1422,7 @@ static void external_snapshot_action(TransactionAction *action,
     bdrv_drained_begin(state->old_bs);
 
     if (!bdrv_is_inserted(state->old_bs)) {
-        error_setg(errp, QERR_DEVICE_HAS_NO_MEDIUM, device);
+        error_setg(errp, "Device '%s' has no medium", device);
         goto out;
     }
 
-- 
2.41.0


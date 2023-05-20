Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp276258ejb;
        Sat, 20 May 2023 09:28:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5EeXMrEBTSs7SlR5uRKXN2r4rK/U3PKik6HVtEOV1mnYyQc2EkTslpj1lMDbKoGSAS3mwo
X-Received: by 2002:ac8:7dc2:0:b0:3f5:6ce:ad0e with SMTP id c2-20020ac87dc2000000b003f506cead0emr10651133qte.8.1684600090186;
        Sat, 20 May 2023 09:28:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684600090; cv=none;
        d=google.com; s=arc-20160816;
        b=HPqZQLBBcZVnrzz60Q7tu1fZ0eP3EFSuHx/YOEOps3Y8dySDLZ3UWPHwIxXmcTSiaQ
         pP7o365waYDU7kkQmUlncvvZLD1Jh329sDww2yRoCFU1WrhgQ/4NAwMBHTDY5pZTMuyX
         Nr9zpLoCeH419FgV7lS9FteDWXLt1aAe7pZidkN69RIIR8LZf0G+HccKFMVKkY6ok2SN
         O4GQbRx+my4zF9f6E/u29Na1SWcxhrSmCYP7iPn4MOnnsW9joXpLIWfj1jtL3XAENYJ5
         Tqi+Nv77t8u8bKDugksfWhitxjr9WrXtzL1TTkVlM55UqIy1gKEmI8BKlEsgZdW4IOdj
         crkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1XkUZP/KXpryW+1SxKnXlwtBsZlj1WR79DzIRZIAO0I=;
        b=Vj43nMAhdoksNOdvpD4rrSXdKuQYlPNjx5GTQq/vpxPQy5B+KxTZS1wkYXvpf+x63q
         cYELp+HLpTtPXmfNYGdD6iFXlBPqQ5fa/kJJShCHa+nS5nSDiRsoq6bnnq98V5X50i5R
         87yW+UZKdcQC1hE/6EAoEH1yXgwHX2b0PXbv6xd90cK/2Z9KhMVGcBpVgTI2wUEGOZ86
         7cCvd826JStxpYfrRvsQhTYxH7tOkBB9MFiTRDJODlJeRBWasgHugVMd+VWjesHfSEEH
         TnBYfW1oOMnOZ7UXDV2zVF7lDWk57acYm4DqevWz2fMfdFfWoHXaXXCYHSBw0yjEx2Ru
         tCuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uqxdT0BK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o7-20020a05622a008700b003f4e4c15f87si1335756qtw.92.2023.05.20.09.28.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 May 2023 09:28:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uqxdT0BK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q0PQ8-0003eg-Ht; Sat, 20 May 2023 12:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PQ3-0003dw-7o
 for qemu-devel@nongnu.org; Sat, 20 May 2023 12:26:59 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PPy-00038c-UA
 for qemu-devel@nongnu.org; Sat, 20 May 2023 12:26:56 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-5208be24dcbso3065035a12.1
 for <qemu-devel@nongnu.org>; Sat, 20 May 2023 09:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684600012; x=1687192012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1XkUZP/KXpryW+1SxKnXlwtBsZlj1WR79DzIRZIAO0I=;
 b=uqxdT0BKeHFvCuoLSxdqKCOjb59ZE4mFfez8SEtlk82WI5VZTZlJzVFA87O4a75Or1
 YJ/YCdF8IqcytWVL/yefxXyCG39NCSqdCHZdD0srTslid0vSx9A2MVmWvzO+DsiCpTVl
 o+DMHgWOp22AbEfUJJytFG317SXiNDdwSw4nP4s+IEqjWrx7+NFTloPiqNzRFPLbP+KI
 fyM2Vnc0Zef9e/BVFoskpGjo33DyOEYmUjo/nmIguhX91HWIWE1Yv/z3z2Wiu64tZ9QQ
 Zl+7AeJCOR3XFrOLtLY70KKzZOvBPXoGiyxHd6uCNSLVqcjvlwd2bj35g+UFsy/7MCgQ
 XLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684600012; x=1687192012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1XkUZP/KXpryW+1SxKnXlwtBsZlj1WR79DzIRZIAO0I=;
 b=DzBShK8evrrOcD00rulmyUeNF38U2jZ5NzHDpr6lkaYUAFczP8hwJJHkto5kZYxViw
 Dc8NZgT8KpDw7OcF6c70e5SEeWksoFW+RUZs8ZshwJSTpY+U+0HW0SXoR5vx0ZfdAzqj
 ASqB6btvm/4rQ2b2kR8ULPZCmdQl9L+cswUX7CRPWfLXWHT3BveUtR4SQ6r2cL8cUXYw
 A9lZmgx9O18dpk3FYQMQEE5svar6WeOtm+Fqo5DeaUyt+sX69POt6oqsIHqWOmvlc8+R
 ivjw5Sl1sd8krQQJvj6yh31Y5lIej7O+o1mOS0M19wdBS+ywXFUZQqTQiCWdHjTBfni3
 v8AQ==
X-Gm-Message-State: AC+VfDyI5s1YWM7oFg1vVuuEd9lEDuyE6owTTtiLL2l0s1ANxu9XU0e4
 Hl3gE2xcLBVPTnHhj9bETlfCYOGloZGBzxpHiII=
X-Received: by 2002:a17:902:f807:b0:1ad:e5e6:6c30 with SMTP id
 ix7-20020a170902f80700b001ade5e66c30mr5851307plb.44.1684600012633; 
 Sat, 20 May 2023 09:26:52 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:d078:d94e:cb2b:a055])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b001a5260a6e6csm1697104plh.206.2023.05.20.09.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 09:26:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Juan Quintela <quintela@redhat.com>
Subject: [PATCH 08/27] migration: Build migration_files once
Date: Sat, 20 May 2023 09:26:15 -0700
Message-Id: <20230520162634.3991009-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230520162634.3991009-1-richard.henderson@linaro.org>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: wnU8bFX8UI7h

The items in migration_files are built for libmigration and included
info softmmu_ss from there; no need to also include them directly.

Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 migration/meson.build | 1 -
 1 file changed, 1 deletion(-)

diff --git a/migration/meson.build b/migration/meson.build
index a8e01e70ae..8ba6e420fe 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -8,7 +8,6 @@ migration_files = files(
   'qemu-file.c',
   'yank_functions.c',
 )
-softmmu_ss.add(migration_files)
 
 softmmu_ss.add(files(
   'block-dirty-bitmap.c',
-- 
2.34.1


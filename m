Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C1A606A32F
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 19:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qjDRaRAC
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIt1V-0000o8-P7; Mon, 19 Oct 2026 15:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xIt0z-0000T4-A6
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 15:27:22 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xIt0u-000346-LO
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 15:27:19 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-48b060ec084so1685471f8f.0
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 12:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792438032; x=1793042832; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=KAs40TV+PDaQglwa6v2de1/yb9nyml5tfy5LFR8T1zU=;
 b=qjDRaRACU3HuNb20T5R2XkJQ7hTKXWY250ZS1zoLMpv5qKhLu87Z/lt1v8GCLB9o88
 Y/arQlaGVw7w1XKMxiP5+5TzZJz8qVDC4qFhQGSKTjz3EoNwXXG0CUC6JpXYfwir3pQM
 qaBGoy/piyaRGtlGK1/JlAFD7LHmwH1nyWUvyBbpoqK6apg43i0YdUIqHfBXyvfIn0JK
 KFmmHzRxIjAMla0Sm3hJpSMiTd6pFegVhjAe3uBEsw6jl9HMgZKnd/5S7/RDSRHZW9nh
 uF8WtuLbHQeieTRQMFJhnBzcUYC78CW4P+3Z2l/Xt9rZHQLYuQxKekfQ6SlavVJUEA3T
 CP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792438032; x=1793042832;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=KAs40TV+PDaQglwa6v2de1/yb9nyml5tfy5LFR8T1zU=;
 b=B/L0LW6sBBthzI367GfNZE16mQ+tw+7ZE6AuXH9DE6x1sXkcZCOSYsrLs1sXHw7YKk
 HTke6app2OUu3pudWhYf+/v9CW38NXHG3+1JNzSxQX4JplIBnE4vpu1tp7ZA5nPtbHsm
 iS2WyrCj1eYQ8xpX9vCLcRDRBcNAfob4HL++K2KcHOadVUJIABRxYKCRYkMUaeNiNXb1
 5wPkJV+P9EpDkv2v1Xynv6tq47sB2ntblAQLaDEuuhq6NqfNm3L6lcFo5tiHoDNObFe/
 u4nyKIjioq9Rb4ETOfMhaPW/Owas/z0eyGvQIJSE82f8hnst713fAPnjb6H/4X+v25vO
 G0xQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxzPyCR9GU7fYOJUi2KJaMaNhjQYsfldLWNQyUCnVHhEwMZ5K9WTdxlAtGeqevlTAfJT97ML+J0tQ==@nongnu.org
X-Gm-Message-State: AFq9FYLNVn1jUAul90SEWjuANYGDUHWFOqiC/A8129I4e8JxPWWpGVV7
 S0MGL1d2+o6udxnyo+kpIqqCJuA4ZlMKjC6DX9ks+bgrMvCE7Ije4PWCUwOvWGTZKAE=
X-Gm-Gg: AYBFou3PTToOcnT5/AVY+yLy2oO55T5U/0Yo9UnottTq3xY/OMCSRyJ+q2w/T35sQYe
 UQikXkQWbEM2JX/oHFfDZIQxrVqIZrb05XOtrFE/awoxEGY+9wdGKiNU6nBmk3wCNt6+LYDG7Wd
 siqKtd6367urdzfgENZbFFqkZVr1ggdGMiCkZ6RuGBgk1Uf0NPbGV/ZD5KS2Zj5KTmZ2RAFw9XQ
 aVsOARGY98ybpFa1XW2t+mbYorOHmntcsgNBFQy9Or7jFoJF3GM+U9yOwGpP2mRwtqaRv9xj9bY
 M8juQ9QuPkuTXV3NpQkBBa2yEl2zNehP8k53T3/wvxWCf4Xdv0b/QRq0wP0fTCebxFOW/S8Wa39
 DV+OjlPjGQ6MIg0d3lm/teHPmgIMtYfWd+Ugm4mhoM7SNPZTIX9qW12iM8mwoWK93BuQvNiCSlg
 O0tT75R6SQ+WGklmLUUx9RNp8Ie0r8zk7KnOkfIjykdTCOmkOcLV7JlC1NOE2rHBXw4YL0yA==
X-Received: by 2002:a5d:674a:0:b0:488:8850:50ec with SMTP id
 ffacd0b85a97d-48e07fa9800mr12906407f8f.46.1792438031204; 
 Mon, 19 Oct 2026 12:27:11 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e1d830e91sm818569f8f.54.2026.10.19.12.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 12:27:05 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4A7C65F9E2;
 Mon, 19 Oct 2026 20:27:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <th.huth+qemu@posteo.eu>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Keith Busch <kbusch@kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Ani Sinha <anisinha@redhat.com>, Anders Roxell <anders.roxell@linaro.org>,
 qemu-arm@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Brad Smith <brad@comstyle.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Klaus Jensen <its@irrelevant.dk>, John Snow <jsnow@redhat.com>
Subject: [PATCH v3 03/19] .dir-locals: include QEMU code in PYTHONPATH
Date: Mon, 19 Oct 2026 20:26:48 +0100
Message-ID: <20261019192704.3220373-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019192704.3220373-1-alex.bennee@linaro.org>
References: <20261019192704.3220373-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When editing python code the linters tools have a hard time with our
imports as they can't be found. To ease this we can expand a
PYTHONPATH in .dir-locals so at least Emacs users can have less
warnings in their editor.

I still get complaints from python-mypy about missing library stubs
that mean it can't do proper type analysis though.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-ID: <20260930163050.426737-1-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .dir-locals.el | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/.dir-locals.el b/.dir-locals.el
index 3ac0cfc6f0d..51871619422 100644
--- a/.dir-locals.el
+++ b/.dir-locals.el
@@ -1,2 +1,8 @@
 ((c-mode . ((c-file-style . "stroustrup")
-	    (indent-tabs-mode . nil))))
+	    (indent-tabs-mode . nil)))
+ (python-mode .
+              ((eval . (when-let* ((root (locate-dominating-file default-directory ".dir-locals.el")))
+                         (setq-local process-environment (copy-sequence process-environment))
+                         (setenv "PYTHONPATH"
+                                 (concat (expand-file-name "python" root) ":"
+                                         (expand-file-name "tests/functional" root))))))))
-- 
2.47.3



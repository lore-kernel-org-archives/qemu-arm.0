Received: by 2002:a17:906:14cc:b0:9b2:89ee:1eb8 with SMTP id y12csp70501ejc;
        Wed, 4 Oct 2023 21:54:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdoxUWO8mURKeJc1gLhqKmsLter9ZtkuwIJCtMXRYGh6RlE5BSCL5kS8fXxgKZXfcSbvys
X-Received: by 2002:ac8:5987:0:b0:417:b45b:84c7 with SMTP id e7-20020ac85987000000b00417b45b84c7mr5234233qte.19.1696481646143;
        Wed, 04 Oct 2023 21:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696481646; cv=none;
        d=google.com; s=arc-20160816;
        b=R4qkkGSw+LMqV5SMR1sLdS1HQNE2jaHJ9hmVb5nguQnNL6r0ummNM/bOCPe0cJJff+
         zlaqg94HcjaF7YQM2h5NId/5c1dxIWKtCg7zhv/Wqqcjf0ntbUwb2fqScFqOa+A3wSMu
         lmUTH2HhNouhEdqcvHB/iRl/nlqxrvrKjbA/l6XrPGnbE9w9YXup8FA8ZR6yzquv99+S
         C8obW8q4B/PFN9QwquoGN0E2ZzC8xZS1QFbOI8Rvc3fbMyqyaR3trEWWDU5eZ6pCpLdV
         wh1d/fSQxt5Awb776SyKaoeVkFodbZ+GXyVNlVyz8oW36z1uu7V5DKco0jpugEjvgrdB
         diNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1Q3iLFdosYlx+ShI5rJfNC7P4KhR6Nf8wUwiWyt6XeA=;
        fh=f/1l33s7qhTIbw99Jc6KpxmMb7npFzisdUwydpQPn0k=;
        b=eN6A1m47iXzXHP3viZD+xVuY78w6uqmS9E/wa3/cJqXqmTDjKEA7KHYFXvxFRbB7JU
         tNxahgve6FoBzxnIOEiz3ypzRqzioDu60bKB5rm1Oh+WUmfqbIqo2h0RC93X+TSQYSxT
         gv69FNrJWIJ2b6wfojc2pEpJblXHwI/I2A6NI2L3cbuM9EMwMqQKmxMPhqmVore2QbjS
         5nsMfUQfy16tfP4omlH9e+9LhOeI6Jyb6i6qOzyM5nwj2ApmnIAq3aRNIkG3uJDv84Dq
         1lmlZA2OWwF4mJIt1L7weUva5+p+U1FelaoPSsNc63XyYWmz0EOs0W2w4a0q7KR0eDfw
         PJbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H+A25NBo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5-20020a05622a144500b0041805d11ac3si419791qtx.657.2023.10.04.21.54.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 21:54:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H+A25NBo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qoGL2-0006Gt-5b; Thu, 05 Oct 2023 00:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qoGKz-0006CT-Oy
 for qemu-arm@nongnu.org; Thu, 05 Oct 2023 00:51:49 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qoGKv-0005ct-J1
 for qemu-arm@nongnu.org; Thu, 05 Oct 2023 00:51:48 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4054f790190so5170245e9.2
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 21:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696481503; x=1697086303; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Q3iLFdosYlx+ShI5rJfNC7P4KhR6Nf8wUwiWyt6XeA=;
 b=H+A25NBo2FF5cwFv8OKP4DsgoB7kFOUO9kiwYXkMt/rQhOnuNDXBUz8cELE20XRIT8
 EEfees+PCBeObtoQmSuyZMfOctA9gVIgtwcy70A78Dmo4RHoE13oqULD+tnkWt7KO4zC
 yQAWYHkmCdYuzYVFLUggWHn6/mfBzu0JTrYeR4YxYmArUkF0UDCeUHyLJ15wuCjFBIn8
 zsMpZeBcw7usPuU12GywVXXkKsWRudLqFwSWLYWflY2Ys00el7yh0B3nrHdFNel1fraK
 yo51bRruFlIQRFgu3a6pttPpcR3vJTTNMOJS+TMLHOzYGllQVYmc0Ub7MuxAsWFyX1br
 4PUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696481503; x=1697086303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Q3iLFdosYlx+ShI5rJfNC7P4KhR6Nf8wUwiWyt6XeA=;
 b=v8MezMSErjJyW5+YyqrLoKHNr+4UxBX7+PoRMvQ7Q2r3lq1BPNXP77+lnpUaayJ7+K
 fd74LHX2nUHuJ/beSLFdOz7TWqxRZBvHCk5vC/+W2gZLwTVMltWhG0/B2Es0mzvw3Bzv
 f9nD59DBRdCoshUgMkxlc+qtI6yIUHyLbOoxvBirsW0j+VF64sh6KYl7Cf3NK2pphGu4
 +5ruH6ehrN8l4bcaSDq/tHAxxyZRykjjirjMbuCy1LADxZUOg9MBn3ApzPENMh3rf95x
 VPHwDRu6FIct1Brdj0Sx4oOk/3Y3qafONR02T9L+chIVCzJYkYhx2hsWtCO37NnQlUcE
 8O5A==
X-Gm-Message-State: AOJu0YxZRd1DmNLMuvJNvpmdtLpaJ/5qjM6rBnr7LyVKEiTM3pLIppJa
 ttuNVqSMcpS6z2lQZL5JOYkoBw==
X-Received: by 2002:a5d:6942:0:b0:31d:c9a1:c538 with SMTP id
 r2-20020a5d6942000000b0031dc9a1c538mr3547086wrw.35.1696481503012; 
 Wed, 04 Oct 2023 21:51:43 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-211-120.dsl.sta.abo.bbox.fr.
 [176.171.211.120]) by smtp.gmail.com with ESMTPSA id
 u17-20020adfed51000000b003197efd1e7bsm734982wro.114.2023.10.04.21.51.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 21:51:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Michael Roth <michael.roth@amd.com>
Subject: [PATCH v2 09/22] qapi: Inline and remove QERR_INVALID_PARAMETER_TYPE
 definition
Date: Thu,  5 Oct 2023 06:50:26 +0200
Message-ID: <20231005045041.52649-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005045041.52649-1-philmd@linaro.org>
References: <20231005045041.52649-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: xajVBY2UWSGB

Address the comment added in commit 4629ed1e98
("qerror: Finally unused, clean up"), from 2015:

  /*
   * These macros will go away, please don't use
   * in new code, and do not add new ones!
   */

Manual changes (escaping the format in qapi/visit.py).
Remove the definition in include/qapi/qmp/qerror.h.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qapi/qmp/qerror.h | 3 ---
 qom/object.c              | 3 ++-
 scripts/qapi/visit.py     | 4 ++--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
index 63ab775dc5..b723830eff 100644
--- a/include/qapi/qmp/qerror.h
+++ b/include/qapi/qmp/qerror.h
@@ -17,9 +17,6 @@
  * add new ones!
  */
 
-#define QERR_INVALID_PARAMETER_TYPE \
-    "Invalid parameter type for '%s', expected: %s"
-
 #define QERR_INVALID_PARAMETER_VALUE \
     "Parameter '%s' expects %s"
 
diff --git a/qom/object.c b/qom/object.c
index 890fa0a106..eea61a5068 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1855,7 +1855,8 @@ static Object *object_resolve_link(Object *obj, const char *name,
     } else if (!target) {
         target = object_resolve_path(path, &ambiguous);
         if (target || ambiguous) {
-            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, name, target_type);
+            error_setg(errp, "Invalid parameter type for '%s', expected: %s",
+                             name, target_type);
         } else {
             error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
                       "Device '%s' not found", path);
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index c56ea4d724..4b4a442383 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -278,8 +278,8 @@ def gen_visit_alternate(name: str, variants: QAPISchemaVariants) -> str:
         abort();
     default:
         assert(visit_is_input(v));
-        error_setg(errp, QERR_INVALID_PARAMETER_TYPE, name ? name : "null",
-                   "%(name)s");
+        error_setg(errp, "Invalid parameter type for '%%s', expected: %(name)s",
+                         name ? name : "null");
         /* Avoid passing invalid *obj to qapi_free_%(c_name)s() */
         g_free(*obj);
         *obj = NULL;
-- 
2.41.0


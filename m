Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp384312ejb;
        Thu, 2 Feb 2023 05:41:55 -0800 (PST)
X-Google-Smtp-Source: AK7set+taWyJhrOko1Q/z3Ro4MZjiYNZ4zebNfcwMZPqqqmEKvGTpuIJyV7KWpdnhyWzzZMN8dSY
X-Received: by 2002:a05:6214:268e:b0:53b:aa54:4ef1 with SMTP id gm14-20020a056214268e00b0053baa544ef1mr13401696qvb.32.1675345315119;
        Thu, 02 Feb 2023 05:41:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675345315; cv=none;
        d=google.com; s=arc-20160816;
        b=NgrdS+zVm8d114POzKAflWt9BfoM+F/SZV8sCNvpUslMHQNvz7DTMa1SuQQ7vRZ+S+
         lUeytaoXCS2pUYzgr63z7fe2fMbU7NGow2FfwBdPoez/r5eXfGvI2nGWk6o38++Di/it
         rW8yJrqKDrTFxWduPLdiEGutDZwBFlGwNzIF4kpjBZ06i1AS5hUlhPc7M9f1waUeT50l
         4R26RvDf+viQFhGQUCExwq4S1SrEz2FTTqaY+2CLfJFrl+rnyzXaPWZLOqbSLTyzOcK9
         pUogUUg7M2rdLJbVAUQAkUtVsH269NUiMX2+iRFLZ+6mJPzxtY1e3SU7aCm/1zqQgukH
         oiIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JbMoxwj+zgwPdfuywdpJJJLGjOOBALP8/iUd0T+artE=;
        b=mBOnYCG4C5otNVWrus3tslFraARB0AwhkFirhElzqI4OFixYcdVn1EiTivRlxt94W2
         uROwrAtAA3wGsnC1s2Id6EmYOhLEP3iT2wjegYZKOoKrNhsLaU7GJTcAsnXgnC2ioe6a
         0u+NYCn4+bLMCMhIr+OMt4bMPXr7GBVrrejJXiuBGhch7wudJdq0vbvju46YiV2c9cgZ
         Xtwlaq0XHgGIMR3Ik4Zj9WGfkCO3SeVXkHwsnI9iyYugd2CHjzoQBnaAp2S69d9oFAyM
         DJiZTcdwpjvXOTClOK1EXNov+YTz1kG4Ca2mC0KLNqbRygK6IlYmVyxzbJ8c2HeUhBFd
         WgkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="DN/DlZX2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jo25-20020a056214501900b0049905897ce1si196868qvb.42.2023.02.02.05.41.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Feb 2023 05:41:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="DN/DlZX2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNZnu-0005hZ-SG; Thu, 02 Feb 2023 08:39:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNZnh-0005SV-S6
 for qemu-arm@nongnu.org; Thu, 02 Feb 2023 08:38:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNZna-00087L-AY
 for qemu-arm@nongnu.org; Thu, 02 Feb 2023 08:38:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675345121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JbMoxwj+zgwPdfuywdpJJJLGjOOBALP8/iUd0T+artE=;
 b=DN/DlZX2sMr8dsjybO3A8r+OrGPkporstrzPkBVwYo7ogprC2XEOjHd4LC6VcCLFOv+mKw
 6HbXAhjCCEJWcyBRUdkvCVJuu+nqnAcfT9zArBfi1Qvu0pw5Gl77DxKpZNjaQ7LxwgYqPV
 09E7jap4QH3VWc6+y2FyuKRRIymXh0A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-ZVqQh0SWMc-BpBkDZN1bpA-1; Thu, 02 Feb 2023 08:38:38 -0500
X-MC-Unique: ZVqQh0SWMc-BpBkDZN1bpA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF0C488F4D2;
 Thu,  2 Feb 2023 13:38:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FDDF2027011;
 Thu,  2 Feb 2023 13:38:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BD62721E6A25; Thu,  2 Feb 2023 14:38:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com, philmd@linaro.org,
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v6 06/20] crypto: Clean up includes
Date: Thu,  2 Feb 2023 14:38:16 +0100
Message-Id: <20230202133830.2152150-7-armbru@redhat.com>
In-Reply-To: <20230202133830.2152150-1-armbru@redhat.com>
References: <20230202133830.2152150-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: 10Ge+1NH8XNC

This commit was created with scripts/clean-includes.

All .c should include qemu/osdep.h first.  The script performs three
related cleanups:

* Ensure .c files include qemu/osdep.h first.
* Including it in a .h is redundant, since the .c  already includes
  it.  Drop such inclusions.
* Likewise, including headers qemu/osdep.h includes is redundant.
  Drop these, too.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 crypto/block-luks-priv.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/crypto/block-luks-priv.h b/crypto/block-luks-priv.h
index dc2dd14e52..8fc967afcb 100644
--- a/crypto/block-luks-priv.h
+++ b/crypto/block-luks-priv.h
@@ -18,7 +18,6 @@
  *
  */
 
-#include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/bswap.h"
 
-- 
2.39.0


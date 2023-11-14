Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2408190ejc;
        Tue, 14 Nov 2023 15:57:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYg223y0Pqfr2dT8hKX3IMEBJttVYex3EHa9fxZObmzIYd3UykaOC+yF8CEqDAeYBnAptN
X-Received: by 2002:ac8:4e8a:0:b0:417:934e:ade with SMTP id 10-20020ac84e8a000000b00417934e0ademr4248011qtp.15.1700006271127;
        Tue, 14 Nov 2023 15:57:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700006271; cv=none;
        d=google.com; s=arc-20160816;
        b=Nlfq1G04URoALHcDuSNqPAX/bPRzSQlW5RL1jDAO8GrOWE01uYEYRCssGvxuPw6UQa
         eulL0eLsTJ1fSdzeP5ID8G62jOla1Qz5XCXSKOjcPEC0uVp9m/g515xheN+TOGX1rdP4
         dUMFKl/NAP06Yqf37T/xALuTSmRvPnEdfDLpYIap767IpYtAwHfRkrBMnA3m4YbUTxES
         zmuHUERI5mb/u+xbCLfXZeXh2UsRwGibN83hPLi0UqXfMeKP+Wb2pAzW0+b7n16SUess
         uk4WVFKoWUDhJCnXGmiPETC1by8JB3ULFuiQKexjyFIAtNNV6JwGhO9b+D1JJonRfAGn
         bHTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fAEKFsnvxg6qMTnNDpGnLRRSZq8eMGOmCV91a2WmeRM=;
        fh=/T6xqUCWHJxCL2odTXkl490KMICJmjWwCPOs7M5ODd4=;
        b=dvf0WEFNlXRd0sdQcejw+8vwbSkCg3Z6741OM7sTjiXgf6xNVo0fGl/cmTlhiwHv55
         yZM7XHBCxZaR+FG8jZiY0SULNha2fEC2iLLy9J/gb3wqskTpcReHunpqUzxVrjbtJAyd
         WZI690bdKMHnEnOAhOzrvJzxR+HCvTgrATxTK/Hv9szVZdCLDJkPg7n5R8Gxy7uFLofz
         CsLpOxSq/KQ03VkyQlEuq4xplvfz7ODkQJ7oLI4JERKOrIy+fAgb+cIsR9oQ35KTcI6C
         Da26iGTgm3EJFfz8brdh5/jsTE4U2DYo/+iMwiNgYHiyyTBMx4nLKUVwzOb43roTzUIU
         aI8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="iP/yUmgY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t16-20020ac85890000000b0041b940923d7si8267615qta.261.2023.11.14.15.57.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 15:57:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="iP/yUmgY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r33Hb-00081R-DL; Tue, 14 Nov 2023 18:57:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33HX-000805-VP
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 18:57:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33HU-0006lz-26
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 18:57:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fAEKFsnvxg6qMTnNDpGnLRRSZq8eMGOmCV91a2WmeRM=;
 b=iP/yUmgYGIsKiGB+g24BVxICze88ENHW72sLSd/aoUAt+QNINwiIbvrgJoW953/eqNH9d2
 DwtL9xkw7+HErkeLa+K5MDY4b+7ko0J1AuBGeyd0PIT07mQeoVx09ClTjUmnMd2NYr+3bF
 FPUiKGoMVHYp5Eg9r9xVK5R2N+qatYk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-aGwmbNiuOS2K-hn9yFnC6w-1; Tue, 14 Nov 2023 18:57:14 -0500
X-MC-Unique: aGwmbNiuOS2K-hn9yFnC6w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7189185A781;
 Tue, 14 Nov 2023 23:57:12 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44E62C15885;
 Tue, 14 Nov 2023 23:57:00 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 philmd@linaro.org, b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, laurent@vivier.eu,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com, edgar.iglesias@gmail.com,
 bcain@quicinc.com, gaosong@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
Subject: [PATCH v5 01/31] target/alpha: Remove 'ev67' CPU class
Date: Wed, 15 Nov 2023 09:55:58 +1000
Message-ID: <20231114235628.534334-2-gshan@redhat.com>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
References: <20231114235628.534334-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: XL1G6bUYFqCY

'ev67' CPU class will be returned to match everything, which makes
no sense as mentioned in the comments. Remove the logic to fall
back to 'ev67' CPU class to match everything.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/alpha/cpu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 39cf841b3e..91fe8ae095 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -141,11 +141,8 @@ static ObjectClass *alpha_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(ALPHA_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-
-    /* TODO: remove match everything nonsense */
-    if (!oc || object_class_is_abstract(oc)) {
-        /* Default to ev67; no reason not to emulate insns by default. */
-        oc = object_class_by_name(ALPHA_CPU_TYPE_NAME("ev67"));
+    if (!oc || !object_class_dynamic_cast(oc, TYPE_ALPHA_CPU)) {
+        return NULL;
     }
 
     return oc;
-- 
2.41.0


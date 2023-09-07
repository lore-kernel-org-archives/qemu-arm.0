Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp3154009ejb;
        Wed, 6 Sep 2023 17:41:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOFKV+mnUaMSzEUocKl1/senXqpNGSXeZDFRahezh/FC9aoA/MI3GliSHGj/5aJUfu92G8
X-Received: by 2002:a05:622a:24d:b0:40f:d929:dcd1 with SMTP id c13-20020a05622a024d00b0040fd929dcd1mr20610706qtx.28.1694047312875;
        Wed, 06 Sep 2023 17:41:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694047312; cv=none;
        d=google.com; s=arc-20160816;
        b=tEr0wkcutjisGJG+K8KSn+x7n7Or4zKLeo+2jl4wMaGbLRBExnURl2UqRvW3inC1p8
         eUEeQmDatYtrbzQatTb4S4STfFUvr0qP5692KChRZiuBsdSv/ua9k/Dqg5LRSFF7f2IS
         Gpr054AeNbOtw+jl8bu/nV859j0X9POpfzWMKNtFvUoVB49Gl7k0T6ISorlYzkaJg5cK
         8V0M1bPyTBIbAGIheHsq5UBOVvk7ydYXdkj2WqNmamxtb3sUuDHWb0euA4/y9oG4Dm+2
         PSAtiaVzSYQOSQOali2KOrPAVHObXAI/RNTitSz8D4ATkZq/oHILQt31sAeQGj6wjQ7B
         UcLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/vWVkYgULP0h+02DVPDXSOT/vXHXt4bKPV5PzTnyskA=;
        fh=kk2WWDSe9SCzWyjzequbgooYc9A8PDm7nTb22zWaiac=;
        b=yr6nNDTrdjPTb35UlBHelfpiLJjN/tuM0fY1pbEx76s/wpba7Agfe56v46mZrW3W1v
         UjRlqaHrY8ph+1+faekzwhe9O7Nk3wztwaVsrhdMDcVC7QjAxj97L28Rif/k0PcSL62K
         ZsaP9tSISTSj8ZUF3G45YREQ6H9V9zjaR6OkgvD5/Cs2Rg/xInSm7VnRtzZI+FHUh/Cq
         a/imwCK+k1dBBGYRV31Z8ajaclDd1o0hyhK3mdNsZH2xa6RD4eVONbNHHynV/I0yrxyn
         r8dLQW3DoRXkLqxL1FaLq5gMAL9uOLWUq6R87yWmNo4p3X5ZNfYr3cHxFJ7h0YuvhUja
         G8SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hSFPSpyK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17-20020a05622a171100b0041362b38fdcsi10490202qtk.756.2023.09.06.17.41.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Sep 2023 17:41:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hSFPSpyK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qe35g-00084X-At; Wed, 06 Sep 2023 20:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe35T-0007b0-OX
 for qemu-devel@nongnu.org; Wed, 06 Sep 2023 20:41:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe35R-00027r-Ib
 for qemu-devel@nongnu.org; Wed, 06 Sep 2023 20:41:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694047292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/vWVkYgULP0h+02DVPDXSOT/vXHXt4bKPV5PzTnyskA=;
 b=hSFPSpyKX9hfOU0kK+bvw6BiwVTbBxM5ZKsBOmDFjIgQS5ysFGIY15oGVDRfHyjLJVcyFV
 4+m5BF4HGhZBxXXRuwr7bVRERry538rNVBrONkc36zp/NTh9ng7+RZUwNzMpzk2705Zmq4
 YV5pm7PKyF+wbOoepfyGIVMGHT8fdvo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-686-ysTBpFEhNxKr8d7nSIcCeA-1; Wed, 06 Sep 2023 20:41:27 -0400
X-MC-Unique: ysTBpFEhNxKr8d7nSIcCeA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F9F6802A6E;
 Thu,  7 Sep 2023 00:41:25 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAAB0C03295;
 Thu,  7 Sep 2023 00:41:09 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, imp@bsdimp.com, kevans@freebsd.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, mrolnik@gmail.com, edgar.iglesias@gmail.com,
 bcain@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com, chenhuacai@kernel.org, crwulff@gmail.com,
 marex@denx.de, shorne@gmail.com, clg@kaod.org, david@gibson.dropbear.id.au,
 groug@kaod.org, npiggin@gmail.com, ysato@users.sourceforge.jp,
 david@redhat.com, thuth@redhat.com, iii@linux.ibm.com,
 mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com,
 kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v3 18/32] target/sparc: Improve sparc_cpu_class_by_name()
Date: Thu,  7 Sep 2023 10:35:39 +1000
Message-ID: <20230907003553.1636896-19-gshan@redhat.com>
In-Reply-To: <20230907003553.1636896-1-gshan@redhat.com>
References: <20230907003553.1636896-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: BCwWzBIDSRtS

Improve sparc_cpu_class_by_name() by validating @oc, to ensure it's
child of TYPE_SPARC_CPU since it's possible for other types of classes
to have TYPE_SPARC_CPU as the suffix of their type names.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/sparc/cpu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 130ab8f578..20417707da 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -745,7 +745,12 @@ static ObjectClass *sparc_cpu_class_by_name(const char *cpu_model)
     typename = sparc_cpu_type_name(cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    return oc;
+    if (object_class_dynamic_cast(oc, TYPE_SPARC_CPU) &&
+        !object_class_is_abstract(oc)) {
+        return oc;
+    }
+
+    return NULL;
 }
 
 static void sparc_cpu_realizefn(DeviceState *dev, Error **errp)
-- 
2.41.0


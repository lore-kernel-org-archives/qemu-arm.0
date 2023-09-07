Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp3152196ejb;
        Wed, 6 Sep 2023 17:37:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg82vmXx/DsftKnULK+DxseF8ebnnoFsq1y37Xigtc4IB0lsdVrHAFGm1JMboKyOKvTKmP
X-Received: by 2002:a0c:b21c:0:b0:64f:455f:7cc6 with SMTP id x28-20020a0cb21c000000b0064f455f7cc6mr18437621qvd.33.1694047071418;
        Wed, 06 Sep 2023 17:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694047071; cv=none;
        d=google.com; s=arc-20160816;
        b=By8DnM91/n1yjtvr9SwGoNeZzKXTb1SWxhpvyWUgu/JgcuU7PdACKTIvrjxey4OEcn
         eM4WpE+tx5nHW1JVtfFRW6rq30YryMk5lYrF8BcnfZN9HlHxQXbtdTfo0wGWV4FP1n+9
         h2+ziMNTpgq0nVIyyNpfTOQwHLRGfvU7PANv9FSJKUQ26fpIytfpDfr3AOrubpbcEtZA
         mQL8bEO2tghzg+y0aLHRsiZvOkoizVNGvDuHNYV97T2KJT8oaPz6BvQcT/VlNY+UR+Eo
         q+jsymGK7mp61OywzWSFD/wtobs9YdZzuOl7LhPrh6kAZqT8jJyPigc5oTz4NOPhRLPv
         2o5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lB1uzP9CsqNjBibnN3g5fI5OvOgpkT0w+TvI2UwaiTA=;
        fh=kk2WWDSe9SCzWyjzequbgooYc9A8PDm7nTb22zWaiac=;
        b=vSmeGHUUGRaHu+O7ByS9kpExAglQ5z6G15Lw44pY9fbNhf0QOHjUcotd8tKOlP3u5t
         lSspYF1GyFQpT3qSbqsBA6KJLMc99+Me79HL1FxYz2GNN2+clanlEq4MLOd3yE30C7ri
         Bxf3pq/vUz8kemyZUqEzo+uGUsjXVEOyhTjdMwTB5nVAwHl3UF9KTTNtbkfExmJ/cIko
         zCNFnYpqWe9vAlNIHJwYk/mThmoW/JgblO2SWpeHgXVNCwRUf79JninE8M3DjDBOuITs
         OLomL/BD4KNAAlJgc6gukzwqJs0u2vB6/RnODosALdGs+be2lz2126SOnOFWKSZ4FVR0
         neVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="NA2bf1/f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14-20020a0cf04e000000b0064f92d24501si10649087qvl.155.2023.09.06.17.37.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Sep 2023 17:37:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="NA2bf1/f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qe31W-0002mq-Ow; Wed, 06 Sep 2023 20:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe31G-0002dD-DC
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 20:37:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe31A-0000gP-Bf
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 20:37:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694047027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lB1uzP9CsqNjBibnN3g5fI5OvOgpkT0w+TvI2UwaiTA=;
 b=NA2bf1/fAD5G6LbWM+fCAQC/iyR6gE4RSXIbEu+xHswmIYO+zud7YqE/UewBa6raEy8tUj
 YS/Hi2ZtgKKZsrzZfdYD8Dibb7iiNC7mrXnD4ewr2x+w+ZB70y1Z24j/xAUnO/GY0DMar4
 HDHcLvtQPyiXFcsZJwwe2jB1MkIl1T8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-Do-5f9q4MzaB1CPDFASiuQ-1; Wed, 06 Sep 2023 20:37:04 -0400
X-MC-Unique: Do-5f9q4MzaB1CPDFASiuQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD4911008139;
 Thu,  7 Sep 2023 00:37:01 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1342FC03295;
 Thu,  7 Sep 2023 00:36:46 +0000 (UTC)
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
Subject: [PATCH v3 02/32] target/alpha: Use generic helper to show CPU model
 names
Date: Thu,  7 Sep 2023 10:35:23 +1000
Message-ID: <20230907003553.1636896-3-gshan@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: +T3HU2gvPDwt

For target/alpha, the CPU type name can be: (1) the combination of
the CPU model name and suffix; (2) same to the CPU model name; (3)
pre-defined aliases. It's correct to show the CPU model name for (1)
or the CPU type name for (2) in cpu_list() because both of them can
be resolved by alpha_cpu_class_by_name() successfully.

Lets follow (1) to show the CPU model names, with the suffix stripped.
With this, the output is compabitle with all of most cases.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/alpha/cpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 270ae787b1..9e15c3245b 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -89,9 +89,11 @@ static void alpha_cpu_realizefn(DeviceState *dev, Error **errp)
 
 static void alpha_cpu_list_entry(gpointer data, gpointer user_data)
 {
-    ObjectClass *oc = data;
+    const char *typename = object_class_get_name(OBJECT_CLASS(data));
+    char *model = cpu_model_from_type(typename);
 
-    qemu_printf("  %s\n", object_class_get_name(oc));
+    qemu_printf("  %s\n", model);
+    g_free(model);
 }
 
 void alpha_cpu_list(void)
-- 
2.41.0


Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp3154664ejb;
        Wed, 6 Sep 2023 17:43:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIrP2S13KBUesXCM8FuGhvQC6L0TaJxJuqvjZSQgqleMf62Nw3+NGTcnkRTO02WHaxntzz
X-Received: by 2002:ac8:5906:0:b0:40e:6f1:3d38 with SMTP id 6-20020ac85906000000b0040e06f13d38mr23208390qty.8.1694047396513;
        Wed, 06 Sep 2023 17:43:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694047396; cv=none;
        d=google.com; s=arc-20160816;
        b=h6EtAS3UhGz04dyTIu/sqTTaV009NOkPKElZnXkTnBGaFuotKU58UI7/UG4Izh3+w3
         ZHse9s7HIbLPw0Ax2n6JxX188YpN8R24Cv4OryO69Mq3mwuULT3GP7oO/6uMATBM7mRM
         ZG8sDdasTWLa1KLcg2A/LiOrx5/oL5Fb8T1BE0H1N/Qkho5yyQi6X7GDVO3cZgVQpQ6O
         6OiiafGcGDj2PpnlmAmmyd4NOInSlfWELWDCjdcvs/X30gcr9MhWyMOcYZmOT7CeLwC6
         wJwBnYJ/AKRLjyBt72UxiFIvl6z/hBeemPs8JIO2ce40X6rJuojUolzEj1sL0ESpJ7Km
         GnRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pnSz/8cyRI48YJhDh5d2vE9I/oV3xyth5/WcFSl4q1o=;
        fh=kk2WWDSe9SCzWyjzequbgooYc9A8PDm7nTb22zWaiac=;
        b=b/Qq0staK2Qs0/CM/BpFDvK1wP7Hd/HugZKekFrV7g5O39QJa9IOuPn44Z/7x3C6eU
         o9BNsYC3PoXVSlrEwHPJGeFJVmey9UyI3F/5UjV4tAgF2+xhFprojVBEAnirCxud9ezg
         +3SAjYQz1hZkCvwNqENBp/p0PEr/tIjeNf/DUOjh69MOUNpHQE0U/Cl6oxkjHnnCimNr
         so6BNjsdu75r4SdJmSdvL8dgg9e3TKGxkRS8ZdKRZoiMbZ0hM1fiznAvFKpVrcCDJade
         bqQk8X6KzMDLvy2MEXAltsE5KrclY9BQhd3QAaBdGkpCXtQ3Tf0LY/9Zvue7QuXLt8Ey
         GVew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FHRZ9t9c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2-20020ac87e82000000b0040d3e5c0d0dsi10602300qtj.377.2023.09.06.17.43.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Sep 2023 17:43:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FHRZ9t9c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qe36s-00050L-Os; Wed, 06 Sep 2023 20:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe36o-0004kD-5j
 for qemu-devel@nongnu.org; Wed, 06 Sep 2023 20:42:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe36g-0002bQ-1T
 for qemu-devel@nongnu.org; Wed, 06 Sep 2023 20:42:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694047369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pnSz/8cyRI48YJhDh5d2vE9I/oV3xyth5/WcFSl4q1o=;
 b=FHRZ9t9cL5BznWfh6y1v2FhAnIkZ+0zQKJyBWYm7/YH3zJMer+Rq54u4cXquG2tZXCimpE
 5W0UQyemCdAqSx8scnPJOQ0+cqTCds8yD/HhtiNDaI6ARnkf8f4EAAmZyb/FDItt9+BADk
 BvH+NO6lFWcOrrQEw/jMwiBFDXlTTro=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-0Dg-S1TDMauDwau5eE1D_Q-1; Wed, 06 Sep 2023 20:42:45 -0400
X-MC-Unique: 0Dg-S1TDMauDwau5eE1D_Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D201C3C1014A;
 Thu,  7 Sep 2023 00:42:42 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 20246C03295;
 Thu,  7 Sep 2023 00:42:27 +0000 (UTC)
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
Subject: [PATCH v3 23/32] Mark cpu_list() supported on all targets
Date: Thu,  7 Sep 2023 10:35:44 +1000
Message-ID: <20230907003553.1636896-24-gshan@redhat.com>
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
X-TUID: TJUHGQaZcFqg

Remove the false conditions and comments since cpu_list() has been
supported on all targets.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 bsd-user/main.c | 3 ---
 cpu.c           | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index f913cb55a7..3a2d84f14b 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -378,10 +378,7 @@ int main(int argc, char **argv)
         } else if (!strcmp(r, "cpu")) {
             cpu_model = argv[optind++];
             if (is_help_option(cpu_model)) {
-                /* XXX: implement xxx_cpu_list for targets that still miss it */
-#if defined(cpu_list)
                 cpu_list();
-#endif
                 exit(1);
             }
         } else if (!strcmp(r, "B")) {
diff --git a/cpu.c b/cpu.c
index a19e33ff96..01bff086f8 100644
--- a/cpu.c
+++ b/cpu.c
@@ -302,10 +302,7 @@ char *cpu_model_from_type(const char *typename)
 
 void list_cpus(void)
 {
-    /* XXX: implement xxx_cpu_list for targets that still miss it */
-#if defined(cpu_list)
     cpu_list();
-#endif
 }
 
 #if defined(CONFIG_USER_ONLY)
-- 
2.41.0


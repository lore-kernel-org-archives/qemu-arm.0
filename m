Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2539619ejc;
        Fri, 24 Feb 2023 22:38:00 -0800 (PST)
X-Google-Smtp-Source: AK7set9kZxTAz4TNxG/gi6FHZkYB5Pi+9uTU0f2cglv0oj+hsH8EvtGAaO+ETlNpRq55sL5J3JiO
X-Received: by 2002:ac8:5c46:0:b0:3bc:f954:3257 with SMTP id j6-20020ac85c46000000b003bcf9543257mr32050633qtj.35.1677307079991;
        Fri, 24 Feb 2023 22:37:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677307079; cv=none;
        d=google.com; s=arc-20160816;
        b=CzAG6VvdGGo7HnBRqo/LLcsmjt7DV38hzFqc6P6zmArvckawv5nWoNKZFsY5ftfSag
         WOgWrEqaU9r652hJZ1gG9RYMvylARzL4FwtgBoJoi2Sob3FlQS662Afo9zBJP8185WID
         pYBKe90tWvxJyVFRgBftMSur7fNNMD7fcsDGKLKMuZ9kDu1V6fXZjCp+RDazYUMgH16e
         g08NmRTMNwn9E1OU8nzts62a3QBn30Y2+B/y35eqvASDbnfgl8GNj5C5jCdHdydYEibh
         O014J2+f1gev8gMZa32+DAt3VNqXdQtbPx2IYMpkAIzp1egkxapMzUw9J9trgWgS6EWz
         QkdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OcGg8UwD1oAse3CxtUrhYuooopXoY1Ay8EyEOaaEFCY=;
        b=marCwqtEB84iGNxTEBjMzWom2+M9stxIFQAyYz1c60lPm6jOYDLQnYLFhZn4W5efza
         uvknGCE/72xI1GmkdsnzLrIulj7hJ82qoj7clBS0GmMSbxrQdF4F4ysRIPmn236qhOd7
         t9ecFLpun0RjXyLIT0OuWVmUAJruQa8x0M07D0lYI+UEtu92piGNo0TZs0kjehePKGGG
         n+/SyRzLsZfpNH96NEKtI3tztcq9fuNRmfNf7TRNNFFF55xCYnwVZATNOi5PDbzbdIQw
         g/LA1GXgA0rSu1NBEhD3W+vocVpx/H6GYbESWdfwIorMVkKNcJICUJrbYdSH3qHYK7+o
         clPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U2QMTCcj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id do31-20020a05620a2b1f00b006eedaa4cd2asi1048569qkb.570.2023.02.24.22.37.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Feb 2023 22:37:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U2QMTCcj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVoBY-0000iB-FK; Sat, 25 Feb 2023 01:37:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pVoBU-0000g7-JM
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 01:37:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pVoBS-0002rf-7S
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 01:37:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677307045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OcGg8UwD1oAse3CxtUrhYuooopXoY1Ay8EyEOaaEFCY=;
 b=U2QMTCcjXxNQLlcWYPu1lhvQTQXHeXmvG/L6eF6RaUTUO77sHaWdu58CmmKLOF27O4Oz0w
 j4ieqXravmsQiWxtppLspAmN/4dg7A6/5EBoP4IcuNJxvwoxkOxlvisENll57Fjp1Ke4F+
 Wcg0GXgRTbZXwRujU4wbygnQPzOOAC4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-bctDuSKxOZ-5Pk91YuTzuw-1; Sat, 25 Feb 2023 01:37:21 -0500
X-MC-Unique: bctDuSKxOZ-5Pk91YuTzuw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92B96811E6E;
 Sat, 25 Feb 2023 06:37:20 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-20.bne.redhat.com [10.64.54.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 073CC40C945A;
 Sat, 25 Feb 2023 06:37:11 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, yihyu@redhat.com, ajones@ventanamicro.com,
 berrange@redhat.com, dbarboza@ventanamicro.com, shan.gavin@gmail.com
Subject: [PATCH v3 3/3] hw/riscv: Validate cluster and NUMA node boundary
Date: Sat, 25 Feb 2023 14:35:27 +0800
Message-Id: <20230225063527.281479-4-gshan@redhat.com>
In-Reply-To: <20230225063527.281479-1-gshan@redhat.com>
References: <20230225063527.281479-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: vIJezKhBkEZc

There are two RISCV machines where NUMA is aware: 'virt' and 'spike'.
Both of them are required to follow cluster-NUMA-node boundary. To
enable the validation to warn about the irregular configuration where
multiple CPUs in one cluster has been associated with multiple NUMA
nodes.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/riscv/spike.c | 2 ++
 hw/riscv/virt.c  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index cc3f6dac17..b09b993634 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -357,6 +357,8 @@ static void spike_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
     mc->numa_mem_supported = true;
+    /* platform instead of architectural choice */
+    mc->cpu_cluster_has_numa_boundary = true;
     mc->default_ram_id = "riscv.spike.ram";
 }
 
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b81081c70b..e5bb168169 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1636,6 +1636,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
     mc->numa_mem_supported = true;
+    /* platform instead of architectural choice */
+    mc->cpu_cluster_has_numa_boundary = true;
     mc->default_ram_id = "riscv_virt_board.ram";
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
-- 
2.23.0


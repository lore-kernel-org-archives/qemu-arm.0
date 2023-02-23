Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp476069ejc;
        Thu, 23 Feb 2023 00:16:02 -0800 (PST)
X-Google-Smtp-Source: AK7set8pMV7lixdYKcsYPF9SjnwIpVv/dpXvH+7+TUSf4Nibk/JQprhNjZHHOr/gpHTID3vQMEx6
X-Received: by 2002:a05:622a:14cc:b0:3bf:a01f:6f50 with SMTP id u12-20020a05622a14cc00b003bfa01f6f50mr18261892qtx.52.1677140161876;
        Thu, 23 Feb 2023 00:16:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677140161; cv=none;
        d=google.com; s=arc-20160816;
        b=B31/bt4kiXZOht4gZTRPGGfmhKWZZEJ2SzF/xfUJL00CjEpmhxbExrkws6CIaT0wyi
         81bT6lGJicwDVckRVabNfgX+BiLo8S2EsLIOq2oEuaVV7mKATVMALCQ+fnFM+rMLXfNL
         n9RZGeHm2OANf/5uKWGIcXtF/w3XCr9QTPWVnChla9LjXGvEaslkt75g7JOCTak3te0j
         POGUnQXbeMJ4iLnxZixlIXJeTOuIW55sGI6dBwFYofumN7vhDTfBs4Q+5qYEggZfohJT
         iq5bMUit2EGW1MbF1sKAMZBEzw8b2oxSNp4ueXEfkycCsbTpjL6jAkPaIfKpUykBYCMC
         2a+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oNyUfcVHvjIdcGuv0SDWxC/qdUhNx/+4Mut0H2LduDQ=;
        b=a3q8BjSkyWPQXNafLYG7rSE2bRhUSi3fBrKxrj+s253/mkyLkZO3yvVb6sT7FCArFx
         GU4zkX+jvnFSEScly42Z/Y+/UaqS2kvsJ0Uf7+33F/pBIVfVXeA8scLWb1BuWTqitYbG
         VEwsygg0COChW1lsNQUIv40KeyPoZZuj4877pPPPKQJj2Py10MvYo1dpIKvnLt5Cd9P7
         JhwCaPiYkShgZzJhMfRSQAy56SiXW54HpK4FuvoGIPfUhIfnYIh3ttxtXdUew6d+3K2v
         RErJH55vmSfkED2t04aAp2ZyQvgjyQ58clO8KEXhhnCf694/I4ZLFT1IRvXXcI2TzpUy
         k3rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aqjmfCLQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14-20020a05622a000e00b003b642524e7csi3087283qtw.560.2023.02.23.00.16.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 00:16:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aqjmfCLQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pV6kn-0003hs-Dw; Thu, 23 Feb 2023 03:15:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pV6kl-0003eT-L7
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 03:14:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pV6kk-0001IG-7q
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 03:14:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677140097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oNyUfcVHvjIdcGuv0SDWxC/qdUhNx/+4Mut0H2LduDQ=;
 b=aqjmfCLQ5vVeXNSzgV/xc4kX9rU+0lDBErxE4jp09+ODQaEc2LyISy93A5FgmgknWL0i+V
 AA4g2UPBNrvM2qksYBih+XZ2ODsiEfPa6VbA6U4CkfAfKDgM65021zaw1p9KxKcLN4vENb
 zbgc2CLGbboHNhNhHqsl4HXsQocPw4g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-qCV7yt1kP0qz9Kpqr53kjQ-1; Thu, 23 Feb 2023 03:14:53 -0500
X-MC-Unique: qCV7yt1kP0qz9Kpqr53kjQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 636CA857A88;
 Thu, 23 Feb 2023 08:14:52 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-168.bne.redhat.com [10.64.54.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFDBC440DE;
 Thu, 23 Feb 2023 08:14:44 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, yihyu@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v2 4/4] hw/riscv: Validate socket and NUMA node boundary
Date: Thu, 23 Feb 2023 16:14:01 +0800
Message-Id: <20230223081401.248835-5-gshan@redhat.com>
In-Reply-To: <20230223081401.248835-1-gshan@redhat.com>
References: <20230223081401.248835-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
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
X-TUID: 4j8N1/H8Qs0D

There are two RISCV machines where NUMA is aware: 'virt' and 'spike'.
Both of them are required to follow socket-NUMA-node boundary. To
enable the validation to reject incorrect configuration.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/riscv/spike.c | 1 +
 hw/riscv/virt.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index cc3f6dac17..fba0cbec29 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -342,6 +342,7 @@ static void spike_board_init(MachineState *machine)
 
 static void spike_machine_instance_init(Object *obj)
 {
+    set_numa_socket_boundary(MACHINE(obj));
 }
 
 static void spike_machine_class_init(ObjectClass *oc, void *data)
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b81081c70b..ed79becb96 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1521,6 +1521,7 @@ static void virt_machine_init(MachineState *machine)
 
 static void virt_machine_instance_init(Object *obj)
 {
+    set_numa_socket_boundary(MACHINE(obj));
 }
 
 static char *virt_get_aia_guests(Object *obj, Error **errp)
-- 
2.23.0


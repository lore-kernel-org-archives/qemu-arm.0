Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1431602lfg;
        Sat, 15 May 2021 10:43:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzs5AEyLsJjnjHtUuFYjlDv/2yC5+1Sc/ljd4zhxBgq/Vv/3e640UYAN1IPpcVHBLeNxxdg
X-Received: by 2002:a05:6e02:1d15:: with SMTP id i21mr1892938ila.2.1621100638701;
        Sat, 15 May 2021 10:43:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621100638; cv=none;
        d=google.com; s=arc-20160816;
        b=Qh4NLLYs0uwFGZbQsY/b2E0sVVk11CpFiCm7tSxc91FOrC1G8BoqOBytp+fiERgKhA
         uVitxkF9cq5lAwbTvYBv+Xdtt7BpCzu5af5QdT8GI0m0IPZWbAIuS/6Ww2LK3S8RYmaG
         XGpMihGo2PQJYn1qLMVmbMpfW+BDIyft5/BdEYpCKCknt52lFE56Z3rf3Qx+xPRYUMy8
         BTpaZZW1EPm5XrpWrCHh3EhrkRPL578l5GUYxr3g4E3hgY0LG5WUqaA+1C4UHgS5lhX+
         LzrG7+jtwh97mQ6gDAqxyDoabKdyCy5+HVDncsYcKc5JEUqIzGiXGWd+Q5eEFlN5vEnP
         L34Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=j4+TVOwKdNAqEwx0iSQEx6F6DQNpYYiD4MSDoIPJ8ns=;
        b=n+tJp9LgCplSqNAEhA69xpepOc1jW160dtCZ0Mc2edyThJwunaiJa/R1c/OQAAz0sI
         ihnEM8CowdiHzYZn4G1xWkaaW1IgQ0Nqa9G75nnX7qCHRP5+QlweWBAKca3Wi+K8Q64Y
         gJgh+H3GjuEeJshuPJ166cKeP/SOyQMmPIvKnrOx0TaGi4f1/veL45qJ8dlh+4dKWDK3
         ouwZ5bhGo2vN4HdZHlWaP7XfqX6sxRpNNcShSAhWUBrd+UtYrIlW2std8ykD/RrPYoVg
         wCLPnEgIapNsjHby38f3czyw6rs1RZmLfzUUPPqvoHeFBF6KKLSp7/mFFL8PGJMg7uJy
         IQ1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=C1y5DnAt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si12701246ilv.33.2021.05.15.10.43.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 May 2021 10:43:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=C1y5DnAt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhyKU-0003op-2b
	for alex.bennee@linaro.org; Sat, 15 May 2021 13:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEj-0000r6-5q
 for qemu-arm@nongnu.org; Sat, 15 May 2021 13:38:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEf-0006MC-Ea
 for qemu-arm@nongnu.org; Sat, 15 May 2021 13:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j4+TVOwKdNAqEwx0iSQEx6F6DQNpYYiD4MSDoIPJ8ns=;
 b=C1y5DnAt2Jit4pcFE1rQFAK+D5SmsB7CrEXGZZKR3Nta2vx0NBsM1G75YArD+G/FOk4d1u
 Jqyh7LmZ9E3r66s+OqL4ERQiIKAmxusqEpAXt95tj4CbV+83WLdHu9BJDCEcm313D5v1l2
 ngX/jHGdXiPk5eN3QhhsbDzr0IbQBM0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-hSa0rPC_OFqUuHl8imWYsw-1; Sat, 15 May 2021 13:37:55 -0400
X-MC-Unique: hSa0rPC_OFqUuHl8imWYsw-1
Received: by mail-wm1-f69.google.com with SMTP id
 l15-20020a1ced0f0000b029017140e7436dso454570wmh.2
 for <qemu-arm@nongnu.org>; Sat, 15 May 2021 10:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j4+TVOwKdNAqEwx0iSQEx6F6DQNpYYiD4MSDoIPJ8ns=;
 b=R+AMkkwWOjqB35YsfdCubbMxkDxUZvhJJLt3avSYKr11SVismt1rqqB4g6HwB6jgDC
 38p9O4CopMZijhSGc1H0suNneYYtlKsixwO1zun6445ihOLL4cK91VV4JkzPUvN+7krG
 vz+b8TBkbnVbjyi7GUoUEadTgvdgtd2/OsRQJPONaG2OfvUcGD/bTtnWtoVPyTum4DIA
 C/VaQuT9My8RmY0dEE0RGyAOhjlDHaS464JBwhxJLRq7yW9hQSDzTtmvYsxjpj3NcpmC
 iFej7uHUqC+bBxkLQZ5tHcX4PMdW3ia52avO/zwXz41+ux85GCBPdnWzbBlXnW9LJZIb
 QMdA==
X-Gm-Message-State: AOAM531/6hy5vQnW3PfR3zUMO6mMAqg1nZpydH96H2nZLZjv1JBfLsWo
 rRprb+iRVkyZU4Dae0dq4+ZCrdfI7xOGabVS/IVE1GfXjVgtJ76d9KW6dsuOm+bJF86UzQt639+
 8heuTfEMWn892
X-Received: by 2002:a05:6000:508:: with SMTP id
 a8mr65107206wrf.315.1621100272292; 
 Sat, 15 May 2021 10:37:52 -0700 (PDT)
X-Received: by 2002:a05:6000:508:: with SMTP id
 a8mr65107196wrf.315.1621100272196; 
 Sat, 15 May 2021 10:37:52 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id x16sm10269543wrp.6.2021.05.15.10.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:37:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/12] hw/riscv/Kconfig: Restrict NUMA to Virt & Spike
 machines
Date: Sat, 15 May 2021 19:37:11 +0200
Message-Id: <20210515173716.358295-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210515173716.358295-1-philmd@redhat.com>
References: <20210515173716.358295-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WOO+NF2YHCMr

Only the Virt and Spike machines use NUMA. Add a RISCV_NUMA Kconfig
symbol and only have these machines select it. Adapt the Meson file
to only built it if required.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/riscv/Kconfig     | 5 +++++
 hw/riscv/meson.build | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 86957ec7b06..0590f443fdf 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -1,3 +1,6 @@
+config RISCV_NUMA
+    bool
+
 config IBEX
     bool
 
@@ -34,6 +37,7 @@ config RISCV_VIRT
     imply PCI_DEVICES
     imply VIRTIO_VGA
     imply TEST_DEVICES
+    select RISCV_NUMA
     select GOLDFISH_RTC
     select MSI_NONBROKEN
     select PCI
@@ -74,6 +78,7 @@ config SIFIVE_U
 
 config SPIKE
     bool
+    select RISCV_NUMA
     select HTIF
     select MSI_NONBROKEN
     select SIFIVE_CLINT
diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index a97454661c0..ab6cae57eae 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -1,6 +1,6 @@
 riscv_ss = ss.source_set()
 riscv_ss.add(files('boot.c'), fdt)
-riscv_ss.add(files('numa.c'))
+riscv_ss.add(when: 'CONFIG_RISCV_NUMA', if_true: files('numa.c'))
 riscv_ss.add(files('riscv_hart.c'))
 riscv_ss.add(when: 'CONFIG_OPENTITAN', if_true: files('opentitan.c'))
 riscv_ss.add(when: 'CONFIG_RISCV_VIRT', if_true: files('virt.c'))
-- 
2.26.3


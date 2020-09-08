Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp393310lfq;
        Tue, 8 Sep 2020 01:14:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDpDy9jCYKvhNjqa1an7zO6PwVq4CNLv0y+SMpV82KkdcXK3nhGQZfxmWrlcpCp8Xe35tw
X-Received: by 2002:a25:3f83:: with SMTP id m125mr31780003yba.324.1599552851292;
        Tue, 08 Sep 2020 01:14:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599552851; cv=none;
        d=google.com; s=arc-20160816;
        b=pfaqjELf6DLNrPzq62p5dCfXANwlRGTBukU3+k4VxM2bTXQsFfHQqRAyLdISSJsZ+Q
         UUYhTzEfALvD2Wly7U1xV+zXMQFZ4Hc7klC2oN06TKszdjCRyvWSVWaqXN5iH8H1l9DU
         6f2GsfDh2s69sfcGxxQ2q3WnRmerWLJDVo382pD3Hkiplgg0aRa+h6MlyeJieAx1Qx21
         qm2Gpu8i62WcmEFi9Xlki37UmXrdvnZU1pNZLc54CzTdgLPLUcHpxM8P4KnVTpoaNABk
         enC063LV8hm4n5/3s7GgEp7txPHQq2LLT5Sf4lJF27/Fj3iejH+GJzhdljpn22klTXE+
         0pLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vE/7atJFFNMf4U1vrclSfvdzLU1YHOKY7LV5LqTlxi8=;
        b=VYoLVs83Gfo2tORytcUqoQK16Nl8AswHhphDtG6IYvD5k/4z1hDMu8VqhoaF7TfbGm
         oKAq1b+TZydMv6VUtL+3Gil1oJC+FHX2vQDta9NWNT7io9ZXlDhiB6ud388dPLvDw7+S
         GQlci2UYKAOnsy4PY6k6WcsOLs4rS8mKfVQ7Wx5LquXKhHaia3bVzhRdB9GvcKXtPHwl
         ZtzA2YODn3CJEED54Dsf4kBwrjbHBn0GbdeZBaFj4tMC0hr1v2XxlBdcWyoT+NAQYdA8
         GjUJfMZpCDcfIybJfjod/CPkWgl5+d7jfvxNXVUt/IefHTe2ozfPS7Kb6igwESigxLPR
         Yp5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Vocityjn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x31si22075222ybd.297.2020.09.08.01.14.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 01:14:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Vocityjn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFYlW-0006FT-Ji
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 04:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFYlD-0005hq-8l
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 04:13:51 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:35158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFYlA-0000RM-GX
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 04:13:50 -0400
Received: by mail-pf1-x42d.google.com with SMTP id o68so10336495pfg.2
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2020 01:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vE/7atJFFNMf4U1vrclSfvdzLU1YHOKY7LV5LqTlxi8=;
 b=VocityjnqEGnIw5Y2AYa4Mi3SdhHy79dxnKzkUvZOM3vl7gT5anhbUd7cycj60/iE0
 6f2hlHJShVjmzBv+n3TXzmCqSVFvW8Ws85vsg7NF7wBIAFsScW6WmZDXxG5++h6jeYD5
 PVvv10jusCN39YEBm2w9NRUyB0d4FhFxwCn0249CoBRNN5+Iy3Xr3VcDA8mAg8MFzUfs
 Ofn1W4F1TvYngP2zQAAATdHYm9gTw4hEkAG6GFoGyOu+Y5+9q89WKfbjf8ugQzNYzuOQ
 ZPBLcvk9KeVMxZaykqJ+/0DEMNhKE0BRwGaQrXmTDCHwIsR14gRiHf6GfOA/wLQJtaVj
 T8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vE/7atJFFNMf4U1vrclSfvdzLU1YHOKY7LV5LqTlxi8=;
 b=c6w/rYbaZuV9Lb36yTWs4nWuxnFeknA+JiAbfkowbW7jouy+gA9Ikkh40doQkjEelb
 Nb6ulPjdAAMFIRDdieT4rixQd3FNOGXAwhkw6jtFFTI3QUMhq7IcKtgwLVF4XgKFyVEX
 gwwJlGP3jxjZfLZfttyMyOv5Gq2UtiFTUY+iK+aIAy3W5bYr1UW+ztyOPpjdfdAXbtRf
 0dGiR0u4d/kGkaEKJSW93pn/enkN8MCitwZKxwhM+RBK+Lm4k8TcP+p9YINykvZRAw8E
 TELLAsJoK3XzYSwsMxu90fvWW+JUvPNr/42T1dUroemaMQS0D+aDl8qUwU9ipfEFLtRN
 Vxpw==
X-Gm-Message-State: AOAM533BKYZt/5ejPhxYV1EBqUAu5qeqF1XFSF1fJyhdd75g60nsHc3a
 8DpL8h7LJkHHuEVTW1VfeOak
X-Received: by 2002:a63:d409:: with SMTP id a9mr18751991pgh.312.1599552827222; 
 Tue, 08 Sep 2020 01:13:47 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id m190sm16934788pfm.184.2020.09.08.01.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 01:13:46 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [PATCH v2 04/12] target/arm: spe: Only enable SPE from 5.2 compat
 machines.
Date: Tue,  8 Sep 2020 08:13:22 +0000
Message-Id: <7ed8b1ff7a61132c6520f87213c61784ab0c331b.1599549462.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1599549462.git.haibo.xu@linaro.org>
References: <cover.1599549462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=haibo.xu@linaro.org; helo=mail-pf1-x42d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d24K2XaJmQYt

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 hw/arm/virt.c         | 7 +++++++
 include/hw/arm/virt.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index acf9bfbece..3f6d26c531 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1830,6 +1830,10 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, "pmu", false, NULL);
         }
 
+        if (vmc->no_spe && object_property_find(cpuobj, "spe", NULL)) {
+            object_property_set_bool(cpuobj, "spe", false, NULL);
+        }
+
         if (object_property_find(cpuobj, "reset-cbar", NULL)) {
             object_property_set_int(cpuobj, "reset-cbar",
                                     vms->memmap[VIRT_CPUPERIPHS].base,
@@ -2553,8 +2557,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(5, 2)
 
 static void virt_machine_5_1_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_5_2_options(mc);
     compat_props_add(mc->compat_props, hw_compat_5_1, hw_compat_5_1_len);
+    vmc->no_spe = true;
 }
 DEFINE_VIRT_MACHINE(5, 1)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index dff67e1bef..72c269aaa5 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -126,6 +126,7 @@ typedef struct {
     bool no_ged;   /* Machines < 4.2 has no support for ACPI GED device */
     bool kvm_no_adjvtime;
     bool acpi_expose_flash;
+    bool no_spe;
 } VirtMachineClass;
 
 typedef struct {
-- 
2.17.1


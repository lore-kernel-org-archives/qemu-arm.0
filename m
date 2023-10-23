Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1475236ejb;
        Mon, 23 Oct 2023 09:16:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+ksZ3K2JGXFp+yWMomKy8r0T6Kc0Hy6RfnEINLWyj4X0CKgVILi3Bw5cziiwrUwUJtopr
X-Received: by 2002:a05:620a:4410:b0:779:e2bd:2ea6 with SMTP id v16-20020a05620a441000b00779e2bd2ea6mr1761193qkp.43.1698077785588;
        Mon, 23 Oct 2023 09:16:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698077785; cv=none;
        d=google.com; s=arc-20160816;
        b=nZDJeGu9BepmzUHRyASmXgrEpI83lWIQiLhdszFNVZ/oXJVKKWTLHEd0VsbZBYOASJ
         NXXRQvyp9ioHjm4YuL7zHde5oS7ah0u6GOPVxW5TykfG+zWX8qv4Rj8z/WN01FJNw70p
         SaE03tKgoscRHHXh/ZgUmmweWGQ/9Bsc+XxpHERUhqqvbDuOPpBfyOmXLXFi1ei/oUii
         L/VgsT6WcxxsziZycW4Cv4gnphM7VN4CzoZZkJQs8Xe/Uith9drsF35MdOcqqmlYAi0x
         kdnWlUZbWgiP9gVqGg4a3bmm8VXH/QuJk3bEf/z11Z3h0RuYRf5mOH8uLoppH0x5tTbz
         MHiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NpxMMC0Od/uz08PSmYxq/ROkgKU67AYMrN/Jii7P8Qg=;
        fh=55V10LP5MT2YC3CMmeD8ox5TQv4iI1rYZzQqEc55Dnw=;
        b=cum+gjRToDYeLP8CBDh32V57SigIgeAsYGKx1xFW6G8MMiPsH3BI2rmH/3kk+sHkSh
         IUVqW2WgjQJWoxOnzXXBJvC8hJPXF6wVA/Y5/phVbS+gr0zuztKSWpYOIARSXXCd3bLY
         WdJgWwAd6pNO/yHQC/ssB+1lucVzUOWY8oQCxrzQW30SbtlUHHL4m1JQkvvI5tezgXSj
         j17fle3ESHuTD5Xek1y+DxWYQg0m5xxDm2fzVR9XpO7bvdciByHdA8dMXMLCj8bECk6b
         SIfRK7xNO1ZrS7PddyNimmosvnjZas4mIXatiiWfPQ3BxO4Q2vpBUTTnm4lD2Re7zUmP
         RDIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JEpH9h3h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q3-20020a05620a024300b00775c336a1bbsi5476524qkn.112.2023.10.23.09.16.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 09:16:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JEpH9h3h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quxak-0005Sr-IJ; Mon, 23 Oct 2023 12:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1quxad-0005Iu-4v
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 12:15:40 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1quxaa-0002ea-VP
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 12:15:38 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40839807e82so20306275e9.0
 for <qemu-arm@nongnu.org>; Mon, 23 Oct 2023 09:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698077735; x=1698682535; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NpxMMC0Od/uz08PSmYxq/ROkgKU67AYMrN/Jii7P8Qg=;
 b=JEpH9h3h/yzupxI2706NEeeGMHHXBVKDUbay2vARUGzZ6v1x5GuSHqVIWXwXQxBAHe
 oC34OZFjwR+0WsYNe2c9cQpumsOyIRZ9j33FQZIDJ9P36V3DnZlCocgQeCcsiF7HELsr
 69SQZBZBqx+pNhmsoUAiWtD/JjXtRefvU3b1vq7dhP36VFVUIRpQH7yc69q6YCTd5BQ3
 XvbrgkpXUHSeFH88VYgSxzUE4Sq33hqrGBnXLTT6+7/e7LzrkooOZXxglfoZWznJ60KY
 nqFDJ7IodVR5EN/ZlQg8dG5DDhSbi63grPCvnJlElpIUy8+iFei+Ke3x+8MJIRVmESiv
 74dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698077735; x=1698682535;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NpxMMC0Od/uz08PSmYxq/ROkgKU67AYMrN/Jii7P8Qg=;
 b=mLHdnbrTxi6tjHOTExGCZMTSD7TJaMuYJrPZwRVI/SxrcRIszUomzl/JZwZJwp2eJE
 V1O+hdCSRuA8rJACzW/rUykJE0qA1ObRQOY27xkuDONG51S3WTtOLj9tEPa4q/4L6w2z
 RP0jCFdxQ9SM5/eRtQnv1NIxPp38DLHzKIrKOu04+XF8Wij92PfjN5XlfeEo9Au2seFS
 JCUOi5Pdc2PHkjeUbzu4x7ZCAIvocW1EL2VK0aqqitqVH+V2mXYdLAu6IAbUzJxQa/CD
 wdUQLL3RKh2VKCbWokbRp6WxWYX31LL1bzJ3v10gRuepyXgnH+d9VhsK4Kid1sq4cqbT
 OSVA==
X-Gm-Message-State: AOJu0YwT/lqn88AxtvR5r3T0ZcVt65VZO2N6KDuAmHXjpQQN+ynbM5FF
 +AO0RrKM9n0fxkpaouCxETfSGTr5OxeXbO6FgsA=
X-Received: by 2002:a05:600c:4c21:b0:401:c717:ec6d with SMTP id
 d33-20020a05600c4c2100b00401c717ec6dmr12663856wmp.15.1698077735330; 
 Mon, 23 Oct 2023 09:15:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a05600c2e4c00b0040648217f4fsm14460597wmf.39.2023.10.23.09.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 09:15:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Axel Heider <axel.heider@hensoldt.net>, Laszlo Ersek <lersek@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 1/3] hw/arm/virt: Add serial aliases in DTB
Date: Mon, 23 Oct 2023 17:15:30 +0100
Message-Id: <20231023161532.2729084-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023161532.2729084-1-peter.maydell@linaro.org>
References: <20231023161532.2729084-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: /4OrG1ppAwSs

If there is more than one UART in the DTB, then there is no guarantee
on which order a guest is supposed to initialise them.  The standard
solution to this is "serialN" entries in the "/aliases" node of the
dtb which give the nodename of the UARTs.

At the moment we only have two UARTs in the DTB when one is for
the Secure world and one for the Non-Secure world, so this isn't
really a problem. However if we want to add a second NS UART we'll
need the aliases to ensure guests pick the right one.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 529f1c089c0..b714ff1c03d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -280,6 +280,8 @@ static void create_fdt(VirtMachineState *vms)
         }
     }
 
+    qemu_fdt_add_subnode(fdt, "/aliases");
+
     /* Clock node, for the benefit of the UART. The kernel device tree
      * binding documentation claims the PL011 node clock properties are
      * optional but in practice if you omit them the kernel refuses to
@@ -889,7 +891,9 @@ static void create_uart(const VirtMachineState *vms, int uart,
 
     if (uart == VIRT_UART) {
         qemu_fdt_setprop_string(ms->fdt, "/chosen", "stdout-path", nodename);
+        qemu_fdt_setprop_string(ms->fdt, "/aliases", "serial0", nodename);
     } else {
+        qemu_fdt_setprop_string(ms->fdt, "/aliases", "serial1", nodename);
         /* Mark as not usable by the normal world */
         qemu_fdt_setprop_string(ms->fdt, nodename, "status", "disabled");
         qemu_fdt_setprop_string(ms->fdt, nodename, "secure-status", "okay");
-- 
2.34.1


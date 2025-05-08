Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp429749njb;
        Thu, 8 May 2025 06:41:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxbYoUA/Q5rv9kku0GaTVTmkJHGoEzkY+I7XHFVil19EMaLeLkUTXD+l94CvKkh+9oeWmw/ml8mrwe3A==@linaro.org
X-Google-Smtp-Source: AGHT+IFZeqgD8yaBAd33SxMEojH4WuEg+xCBnLLRvSTucI3NY9H5ZZ8cCkdQ01TlclkTSphOkFzu
X-Received: by 2002:a05:620a:4050:b0:7c0:a1c8:1db3 with SMTP id af79cd13be357-7ccf995e8cbmr513528985a.11.1746711707552;
        Thu, 08 May 2025 06:41:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746711707; cv=none;
        d=google.com; s=arc-20240605;
        b=DztxtqbkGXsILtAr7arZDonMu+txZRCx9Q1lIr8TpmKe4nav1LpXETZpyVWHSM38cO
         g8ye1lfYCZf7w1b7/2ZGdhgpeAVgCDXNJsocNJBPT/08eF8GEEnIdJtTyNmkSeA8KmO7
         t+SB99DhDSVuLqqum5mwulyJ+oYcriwjRRBM0RCqOizu8bcFZAY+sa+u9C8YXvgLwOp6
         xnrxZ2RhsZMc2H0qlvUuYYCoqRQXk85MvOe50GxS4UxRQ0uTlYy+F2fPz15qVqvjTFiQ
         sLYZAbRLkk9Rd4lBuoXgcvemnmv9i4EeG5WGt7tzwO5x4QVNROOHeB6Lf03V9SgSRZcT
         BniQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sqRI2bUWFL/LTWDPgHwj3plQ/Zek5ug5WOQHcPBpHVI=;
        fh=uSSdbRjOZAzbRXFCsA2rhdrbOUV1nVOimVF8xojjsuQ=;
        b=DTR0DSFT7QBcjivW5IJDGYVnwMQ8L4GHXH3j/aIb1vrNMaSYiXzF8GaFHjxG7iheDv
         IOKArd32o1e/axiLm081RdzPT621plbxJIMNcjhSdp40LqkJgrYt0T3S9vUN0fk3s6m+
         Ca5WINrjhNm8Nua7FobINYlNXZ4HnNLU30XbIFleNOm8/mQRPm1zKNbMO7lbezqUf+y0
         i83uXbH9CHiJ0DofdXIQW+Q8o0i/SAS1KxCrvwEOMiZHhBa13HcJoogee8XXOpaIzXxf
         pwcClE4b5qxDH1/Cw/aMa8xWak8jV+yyl1qBT4gRt1McTMR7MnS9x1bzZqD6g3NKfaFH
         6PvQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B8ixyavl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7caf75e0d46si474881485a.610.2025.05.08.06.41.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 06:41:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B8ixyavl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uD1VP-0001n5-VE; Thu, 08 May 2025 09:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1VO-0001kf-8p
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:41:42 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1VM-0004c8-Cq
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:41:41 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-b1fcb97d209so1917637a12.1
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 06:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746711698; x=1747316498; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sqRI2bUWFL/LTWDPgHwj3plQ/Zek5ug5WOQHcPBpHVI=;
 b=B8ixyavlGVNn72GR+ktMu1GI2RNoKl/1jZ1zZkglyjs17bGIsRbg+NttK7ZHtd7nUK
 AB/IrubSQfetl1ZqZwY/SQlpucNwlQ2zqWxDpI9PIEGRbUrlifB+m5G1C9sh16dhNiNI
 EF0Y4D/1anaDp7kdnsyle7pAqDsnMD3y7VPDDB/+zEHpgsURfrINdArM5Krxujk6eo+b
 rX+lsUZ/T3zYaQ1+PUQDc41ITDlcjewADM4H6yQCjNhzYoFpKbQ6mu0hOsS9BS5rJ/b9
 bw8FOGexKfSXSqbKiohMpBLHW/Oa2kjgkgsQz2oFc12LaDSOaul+P3H/Ss+Gay0TAQUv
 reTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746711698; x=1747316498;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sqRI2bUWFL/LTWDPgHwj3plQ/Zek5ug5WOQHcPBpHVI=;
 b=CDl+1nQwOXjZS4hWjc3DUN5EQA7iVeBvE/JjG6vU9FycM1znCGP33fwOiys00wHviH
 7KIISLUnYPcf5m9RKjJZ5YqHZlytQn7WlupBc7CfkxFr1/WjZbZalE4p6zlFKVoXrZ+Y
 s4vF4RtHVd0n5n4nTjhyGr69y5wy3T2wd49+n6a3D90lO5A4ApXHWGY4LasmK5cG3esg
 dmmPW+iHBtISRdRWrjhNwkSgr6np9Y5dE8yIKazNxyhCQWH/eyGGqgwyC74D5N2Wbtkp
 AWiozis3FbRGY9rrN7Ac8UUaEMzIlYXAH5N+TrlVdVKAYtjF5dgk46YyF5KiNG+68Q2M
 kqfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBSYxmqaN3auPvqB2du/e5cwXfeUzwMXO7u801G/j/vL977pCqz7tOT4y2nutzB+N9GdKv/NkKgQ==@nongnu.org
X-Gm-Message-State: AOJu0YzEDZhmNQuu2uxqdlowqcH80WvFohDeedhTB46bO1RIqjYGoXUJ
 vSEyWC6KH6wcQ/6jF3ae4BAwAbr5jDRRuAsp0ZsyyefIs3MRlUv5rT8OC7kwhWI=
X-Gm-Gg: ASbGncuprGWRzjwzUvLnfmbQaRvRRXnei5PXDLElRXqSek6ENQjymGBXFUk7iRIQV4p
 XYAIdBGh5wCwFjfZ5PlMr5/XcTsdTMHubSzBfVcVZVSk1hcKbYAIdbFR4GexCZ1+xUYAoFi6aq7
 np3fStjnF65noQEhzQF7/XziDTNaLXHG5w5HXwytekBkjNosb0YrJTyQtLNry9wr8ndoIfhbT+W
 iX1nC7hGxDXVHjVLU+gAMq17y1veDq1waQGhMFcsQ0YtpRNpt9RGC/XjuLJhWxKes29XDV8mLA/
 kgqp9U089i80QmSOkbBvWbqj9qFIVIsyLqJVKTPFNmvf5w3cVn4BCHbuOLGZ2ZkHdZDkIonCs3V
 50gFJiySKq4VV8KM=
X-Received: by 2002:a17:902:c94f:b0:215:a303:24e9 with SMTP id
 d9443c01a7336-22e846a2ab2mr48657765ad.3.1746711698591; 
 Thu, 08 May 2025 06:41:38 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e766dffefsm24985605ad.33.2025.05.08.06.41.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 May 2025 06:41:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yi Liu <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>,
 Zhao Liu <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>,
 Helge Deller <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 15/27] hw/core/machine: Remove hw_compat_2_6[] array
Date: Thu,  8 May 2025 15:35:38 +0200
Message-ID: <20250508133550.81391-16-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250508133550.81391-1-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=philmd@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: sBPuarYKAaqD

The hw_compat_2_6[] array was only used by the pc-q35-2.6 and
pc-i440fx-2.6 machines, which got removed. Remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/boards.h | 3 ---
 hw/core/machine.c   | 8 --------
 2 files changed, 11 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 5f1a0fb7e28..a881db8e7d6 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -841,7 +841,4 @@ extern const size_t hw_compat_2_8_len;
 extern GlobalProperty hw_compat_2_7[];
 extern const size_t hw_compat_2_7_len;
 
-extern GlobalProperty hw_compat_2_6[];
-extern const size_t hw_compat_2_6_len;
-
 #endif
diff --git a/hw/core/machine.c b/hw/core/machine.c
index e7001bf92cd..ce98820f277 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -275,14 +275,6 @@ GlobalProperty hw_compat_2_7[] = {
 };
 const size_t hw_compat_2_7_len = G_N_ELEMENTS(hw_compat_2_7);
 
-GlobalProperty hw_compat_2_6[] = {
-    { "virtio-mmio", "format_transport_address", "off" },
-    /* Optional because not all virtio-pci devices support legacy mode */
-    { "virtio-pci", "disable-modern", "on",  .optional = true },
-    { "virtio-pci", "disable-legacy", "off", .optional = true },
-};
-const size_t hw_compat_2_6_len = G_N_ELEMENTS(hw_compat_2_6);
-
 MachineState *current_machine;
 
 static char *machine_get_kernel(Object *obj, Error **errp)
-- 
2.47.1


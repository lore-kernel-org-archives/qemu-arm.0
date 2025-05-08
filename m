Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp431212njb;
        Thu, 8 May 2025 06:44:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXday9wgxudwDLPCiA6U0PSxy7QElrSUMPaSUQjNj3cpJZ44KAox1vsOBsSIR090EpOKPPUWxj8jF9sMg==@linaro.org
X-Google-Smtp-Source: AGHT+IGAN33qMUo7717XpcERxTT5Gf3D3X1Iqs9bvVJO4CzozbA7REwkiF1r85n4XwK3McJSNX91
X-Received: by 2002:a05:6214:19c4:b0:6ee:ba58:e099 with SMTP id 6a1803df08f44-6f54c3bf6a9mr57662596d6.15.1746711847945;
        Thu, 08 May 2025 06:44:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746711847; cv=none;
        d=google.com; s=arc-20240605;
        b=laIBOhG7zCVP5RwRZJf1/mqgjDX8JUA0NeSHlNfWozd8P98G81Xvu5RtLJJzlxMpUy
         OR7lWszj9J6fVwxdpUwYS5S3G9cBF115EK099FXhj52WMpp7fPt9a8xQDa63RhiVBB7h
         +lp15pLp+50az1NJlZIHVYoLNb/wJXL/KP6tBsVlB86ZZF4a17BsarwOfKHe7VPibqWY
         Zp3z1lK6OSBztrdKG7EfuI3yEgSki8kGu0Y4DBCW+BJc1SBayiYg9TozSvtPFe9QlgSE
         OqlgkqyrmlO+jnwYYjvc8q7lJjF0Tika1mThdNFcLw66XTQdXOb8/yAolr2tnNYlrmM5
         S1uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Iz56OqXDxt7nqC4LwA+a7OYiuZlEyLYttSp20fJi6+I=;
        fh=PljYxAxw+KxHaUywsSZCIrcNQtsl/oBFgbF0hBJBuRI=;
        b=CpKJr4BYjgJYJdf2Dc1+2LRZ87GiN8cLHxTZ3EQXIGtpm0YZ1w6Zkus2f5cULXEu3+
         xnApYT1japwnAZ8KO2+MS9cKyWvzYvnqLDkUiP6bv8y0JiZnkCUCbGEyuTINnFukKXHB
         8Yb4A1FtyigYovm+GpCs3/kPvpqOgUDoqQ0EwA0f53P0wO0bgF8LpW2WaX5ra65BhiTI
         27D87pab3Sa/bwXbxpD3UzOFJVDHn2dT6cD/kZA9f94bFHqmnZkOYM6Mi8IcUBvt5BGA
         BFMgduLVQK6aDzvxHZodMhrNOhKilMjCw03cbayamcXIuZZbPozTLaM4Bng9rBUcHPjQ
         hQpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RYMclTj9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f542919a62si43298966d6.487.2025.05.08.06.44.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 06:44:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RYMclTj9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uD1Xb-0007gT-E3; Thu, 08 May 2025 09:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1XZ-0007XU-08
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:43:57 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1XW-0004uC-L5
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:43:56 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-736c3e7b390so954876b3a.2
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 06:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746711832; x=1747316632; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iz56OqXDxt7nqC4LwA+a7OYiuZlEyLYttSp20fJi6+I=;
 b=RYMclTj9lOI1cUlMD3feG4ufuIXaaBlvI0giA9qYKpOCsUval6rcNOdTDHw8tC23RP
 d8J0PTMhRaie4r6CEVA/osf2C8RzHcKs1Rl5bQ8heX/vXh+EoW9DTqTVajkDt17Gw4E/
 nXDVGIX3QGR+xYFYa0P/PDObQYf/ZPqzEP6sYe+sZtJucVJT2o17ALVBVmWC8wff7lXJ
 VJDlZ3xKQAvI+R/jxb7Zq51gvYsj7Keg9B8eWr1woVvvNCMB73xnukJakGZhEKCaqMD8
 CpZ3mYMjQ9DNg4fdvshJTpXa+DWz3Alkylx56utGoxZjTmQqLww9yFZqt80XVQrbJydg
 951w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746711832; x=1747316632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iz56OqXDxt7nqC4LwA+a7OYiuZlEyLYttSp20fJi6+I=;
 b=qmK+Y6IwLimjyTGG9zykzSRoRfjuSayZVd0AZzySFesm6pPIEEn751ELP+Ajwmydqk
 CrVnEwtDQnFXHs1Ae421nUAgKFAEda4T20SD6PDDlQvC7oashnohufeOvI2oyZylYeWP
 B4yGqNa0igHg23MnVK/UQAG5ph/OvVTKfL8LiU+LHnKYS4a0rQadnochXNWm8p6TfaEf
 jAn9X5kdWf6/vIY80JX3LZQR1/AyQedyUV4X4taAtaIe+JcOH0tPWGDneSO7eWfsmQaL
 dGGOx1Dwfoypat+P++cBm/Gfae4+csQ08crsrpMoVTG0fKv751d0c7NHOjrBt8mYuR2H
 /riw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbBL/odnrr+rafSFUC1KZX0ng6emW/0gm+E3S929gJHHq7Odblgf+8EXbJp8rj1C8TNkyGgLxUnA==@nongnu.org
X-Gm-Message-State: AOJu0YyQP+ZNklMGBkBxzY7rIGxTfIQ4mRfsEwnYww1P/j/cDjTBZ5WK
 QoihWL3cY6s6iabJo29cgDczcrjtdBmbYyLpgp//a4q6uESVcwWhd8F0luayB7U=
X-Gm-Gg: ASbGnctJUTOPJkvcZyDBzwKsDZxjIUE1wS3h+X7nMFgIr8B5MM8gqHEy28O13c1qjKF
 stvGd60/siXLVe7B1oC1I3POHMYQ3s/V00aCloTEVkvH7GoNy6nIqgJzbcEIU50CXiLn+omGjWO
 sAu29XSSuitMEkTwpSJRiluslynis4OtxYxTME3Sa7uNVacdI17mpLb6/4xnN7co26d8OiX4beB
 wuH7LXLIEeFDpyVy1HQZpGtKw2dnbDCu8SV6x0zX012FwmFnXoo9wtSJNdcqICwM4zWgI2hjgvp
 Vi7TelR7zfmZLhS7gvJB0qb+6J9q1PGEgW7wdfgaKYAPjDSTLKGscyVFb5McY3WIDhOXEzCvCbB
 eoLyxH8aqdBc4mIc=
X-Received: by 2002:a05:6a00:418d:b0:736:4e0a:7e82 with SMTP id
 d2e1a72fcca58-740a99ab539mr4600433b3a.10.1746711832328; 
 Thu, 08 May 2025 06:43:52 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7405902154dsm13751300b3a.90.2025.05.08.06.43.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 May 2025 06:43:51 -0700 (PDT)
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
Subject: [PATCH v4 21/27] hw/audio/pcspk: Remove PCSpkState::migrate field
Date: Thu,  8 May 2025 15:35:44 +0200
Message-ID: <20250508133550.81391-22-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250508133550.81391-1-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-pf1-x434.google.com
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
X-TUID: dLkWzSYhNp2Y

The PCSpkState::migrate boolean was only set in the
pc_compat_2_7[] array, via the 'migrate=off' property.
We removed all machines using that array, lets remove
that property, simplifying vmstate_spk[].

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/audio/pcspk.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/audio/pcspk.c b/hw/audio/pcspk.c
index a419161b5b1..0e83ba0bf73 100644
--- a/hw/audio/pcspk.c
+++ b/hw/audio/pcspk.c
@@ -56,7 +56,6 @@ struct PCSpkState {
     unsigned int play_pos;
     uint8_t data_on;
     uint8_t dummy_refresh_clock;
-    bool migrate;
 };
 
 static const char *s_spk = "pcspk";
@@ -196,18 +195,10 @@ static void pcspk_realizefn(DeviceState *dev, Error **errp)
     pcspk_state = s;
 }
 
-static bool migrate_needed(void *opaque)
-{
-    PCSpkState *s = opaque;
-
-    return s->migrate;
-}
-
 static const VMStateDescription vmstate_spk = {
     .name = "pcspk",
     .version_id = 1,
     .minimum_version_id = 1,
-    .needed = migrate_needed,
     .fields = (const VMStateField[]) {
         VMSTATE_UINT8(data_on, PCSpkState),
         VMSTATE_UINT8(dummy_refresh_clock, PCSpkState),
@@ -218,7 +209,6 @@ static const VMStateDescription vmstate_spk = {
 static const Property pcspk_properties[] = {
     DEFINE_AUDIO_PROPERTIES(PCSpkState, card),
     DEFINE_PROP_UINT32("iobase", PCSpkState, iobase,  0x61),
-    DEFINE_PROP_BOOL("migrate", PCSpkState, migrate,  true),
 };
 
 static void pcspk_class_initfn(ObjectClass *klass, const void *data)
-- 
2.47.1


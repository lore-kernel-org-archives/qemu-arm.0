Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9391C61DC7
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 18:43:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzIau-00080H-UV; Wed, 26 Aug 2026 14:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wzIah-0007WL-7N
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 14:43:16 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1wzIad-0002IN-70
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 14:43:14 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-39647184c73so185190a91.1
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 11:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787769790; x=1788374590; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=esiIQQ8j+uvEVKSy2+ZWdGzm2PcDAqeU44dys6a2Fmc=;
 b=LaHV+3ospoSnq2nPSuxnZN4wkZBxGzcDJzGalw3kA9oDC4eULJieufGH06Mahiw+YA
 0pLy14MJsPO3ZcCjkuJw3eb9XGPCvjVBE8bxK48udEHwLbveoTOhHDrzDq5QCPZanBKi
 J6gm203u2bv/RdhW8H6ENlIg3HrHPkFajvYtBGvmKCR/j0cFVp4GK3oJZUUF241UwC1F
 qw+lXEBrlyb1H+OOP0bbu1k+0YPz5vzrQbb5a2c16Bpj1sTd8r5/oxtYKNzJlBwZYxH8
 unzu8DKYNRU3VeeRbc3vq8W3lLwuAOb1FzO41jd4P/l7UBnY2maE5lQBZwXc0DARCWcq
 /lRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787769790; x=1788374590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=esiIQQ8j+uvEVKSy2+ZWdGzm2PcDAqeU44dys6a2Fmc=;
 b=gU+0U0SahLiVI2cnTdoTcFKR0+MP+wbOPr8Hkayp+dWIGG/De37EtPbbk+75VR9837
 VhxZRg2eQ/gUUKBmduVif6Vyx/fuHRXLn3WvqLtlBTZTg+vCkFiDzp7FRnduq73VWMCY
 CUB6nHEMOoO2EQTv0x7fURof8YsfEn2/QR2w8u7u30ppai7+FcfDYxYgTDP5EAGDCGnL
 M6SDRonFM7/QA7sZ+IYE8Zdbd9X26XDH2m4CZlXJAjPaeL0qA3Kg+rDae8N5TBKN86C1
 W7Gxixc4M/r1VLCt0YsPg6qoBagQWoBkarMYvAVLp4tmY6b5WeKtxHw4hFyWuUwigRFC
 qe6Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RqnFfCS5M8k9ezb1XxK7N9DT4X1p+CCVtMTMZkM3A0Es6wPF6YTJz2FDi5Kekx2MNlempApZLkR4Q==@nongnu.org
X-Gm-Message-State: AFuF++mZzz00XCqmdjeaK8hEy0jpgLvUR/7W6dWVvp0gcDboEEI5XAjV
 KDHbbeU2n49ul1LyKpfd7yCvmrkXTf5jcKo73PmUIgmjUASmUiDD2J2C
X-Gm-Gg: AR+sD12QbyUt7/CbUtamEoztl+g6r340i3SxA4hil3QnOI/69iUt3FX2aJlvZXgWitb
 iIQ9J8g3uT2NDnfdjQq+dJ8Je5cjxW2Pr9VGkqAv1+dykp8ZZjnX20gEFt3UzhwAbD5IC3j3qJa
 6txXGbDcy+NNPJMaorZrqlbCfNt/RFwaPdthbCThDgm8QtWnUgn+ff/b4N9azEnTRd6QnHhhdGg
 F1/6zrClCNGtb+u/ZjD/sdSYEGWx3MxauBJw9Dn/QSpRky5pJv5CT1HYz4oIYucctNXhh3+Y81s
 YxTPw8IwhlKk1N8PdI9HQCGS/zl7qnw+Z/PS4QsZKjq7pMmqbBUFgQnxciIUCGW2r1d4LQ/1Zjx
 FLMSFo2FJkXBlfj4Gyyu9r1EMaCxFySdpQEbBCXT8cYX1LnRuLN70pTszHk02/1xg7/YflT1h4q
 iVNCovFW8LrAkuj6x2T5w6NlZc4iH7yHm29vivH1X+wtFZLdgyawT3DRyqlcgCfgz9ITefBfl1k
 XCCl4Z8mNbt/VUIjwLGvg==
X-Received: by 2002:a17:90b:3811:b0:37e:1620:dabc with SMTP id
 98e67ed59e1d1-3969b7e33acmr1328049a91.0.1787769789662; 
 Wed, 26 Aug 2026 11:43:09 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-3283d60c291sm17681846eec.6.2026.08.26.11.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 11:43:07 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-riscv@nongnu.org,
 Song Gao <17746591750@163.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-ppc@nongnu.org,
 Xianglai Li <lixianglai@loongson.cn>, David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Bibo Mao <maobibo@loongson.cn>,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alexander Bulekov <alxndr@bu.edu>, Chao Liu <chao.liu@processmission.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Glenn Miles <milesg@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Ani Sinha <anisinha@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v2 03/13] hw/arm/virt: register TYPE_TARGET_SPECIFIC on the
 abstract parent
Date: Thu, 27 Aug 2026 02:42:17 +0800
Message-ID: <20260826184229.1145-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260826184229.1145-1-luoyonggang@gmail.com>
References: <20260826184229.1145-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hide the ARM virt machine when the selected target is not ARM in a
combined qemu-system binary. Versioned virt types already implement
TYPE_TARGET_SPECIFIC; register it on the abstract parent as well.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index daba9af79f1..c2ace7706f1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -4161,6 +4161,7 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
+    TARGET_SPECIFIC_CLASS(oc)->is_available = target_base_arm;
     mc->init = machvirt_init;
     /* Start with max_cpus set to 512, which is the maximum supported by KVM.
      * The value may be reduced later when we have more information about the
@@ -4431,6 +4432,7 @@ static const TypeInfo virt_machine_info = {
     .instance_finalize = virt_instance_finalize,
     .interfaces = (const InterfaceInfo[]) {
          { TYPE_HOTPLUG_HANDLER },
+         { TYPE_TARGET_SPECIFIC },
          { }
     },
 };
-- 
2.52.0.windows.1



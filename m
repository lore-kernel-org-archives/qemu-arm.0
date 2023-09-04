Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1452491ejb;
        Mon, 4 Sep 2023 09:28:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOJqm9hdDHzH7ibI/PkRwpBPAhEOTz4H+vWNy09gWH2Z1OKOHMypcHm4QcuW3cPD4JyW9Z
X-Received: by 2002:a67:e9ce:0:b0:44e:8773:8c72 with SMTP id q14-20020a67e9ce000000b0044e87738c72mr9090428vso.0.1693844935506;
        Mon, 04 Sep 2023 09:28:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693844935; cv=none;
        d=google.com; s=arc-20160816;
        b=kbO8JBBX64RHbf7yW6IItPZGMPH0LV/SffG2FRqXv5dn+PvSS9PTxzeHEa2dE2+1C5
         Bm3jPP+550GryLirgKh5HrI2kQNKajjDtwlJw6kgt8e47DzFWpsFFZ3lWz2pnKSjGdNu
         HSUCG3u/tyRtyiQbT8O45PAcqwcsDqlK60DRNYAbiTQvf+uHH9bvhiYM/uhSE6nJwBXM
         oSqA/A6BSfBFuP0w81rCOAN4f3sUgGRSka6KgsBwHjRJvjDZH0tWMhS8vLJxf9S+AyN6
         9lDXTzsiRQL2lDeVIIeTYg1jt2TyBPSx4Rn3R1RtDyDM+IROkoRyjl1XAut+Nyu3t1kE
         ehGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wMO9Sabs/iEDm+ChlLb7bnpjmC8D0WEcPQCXeXeTl7Y=;
        fh=a2o6Hwk52K8cqkKDPy4SEyN55IX2FdSHH2hiw24QO6c=;
        b=LtBq4sAp5GBADSt7rltcjW1hGNS8nl8QaEFkA+QSffiqYdVEuAu9zBc0bRJ6ngcOyy
         D52D1YUMSxT96+bBxYIx5EJO3xfIrBlCAv70NncmxIZNLI0shnhV6/GmBD/bXgnLPemq
         da4FQa6GyFJcFGx2lsXRpj80CxbKIsPoCeWAUan3q+PUvuShxm9NsjWhvm5W5RB3m5XZ
         BihXEoDBS9ohWxB1KJMRAVUPzdpWd7ODjT54ybi3MBGPkjRcxpBQhXcc4v3AH7a9dze8
         RkSUxnTRiSc+LPXT3ayTV5EknBSzzOwivIbYnU3/q6QbmK3akIxQtaC738fzPc4vbb6U
         FLkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yD0J6cbO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j4-20020a0cf504000000b0064f508d74c1si6500787qvm.541.2023.09.04.09.28.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 09:28:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yD0J6cbO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdCRL-0001yA-OF; Mon, 04 Sep 2023 12:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCRI-0001s9-5E
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:28:36 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCRF-0002Ii-UP
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:28:35 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2bcc14ea414so25339191fa.0
 for <qemu-arm@nongnu.org>; Mon, 04 Sep 2023 09:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693844912; x=1694449712; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wMO9Sabs/iEDm+ChlLb7bnpjmC8D0WEcPQCXeXeTl7Y=;
 b=yD0J6cbO1z/x2ouypxEh1jeG8paBFqI4kD5dngU9ByViGXxjB2HQpu4iEVMd0kc9Ay
 TJ7zdmD4PO7W/sEF97e7TCkqG7Q9+9+RgW1gyH65aKoC5h9G2FfGvA9vAHI9pAMgXdpv
 FM4ke3VDhNauxI5E1hI3AgH0jGGRlhB6Oc/omd+Ug1Kw8mBohGi1hBMVaeEBOKu6eytS
 4oUFQALjmjWZ3DdHYZbtK6bT/kqDiIdKsQC0xgyJhEtGxrJRVaDPqnmoG7Zsfgn1jC5Q
 YIENWQCkMfhnAuWj3OgFifjxo7LBcBjYcxOJWsxXJ9Wuz1KAdaIH+EjNVfErXfN8bxB8
 8JgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693844912; x=1694449712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wMO9Sabs/iEDm+ChlLb7bnpjmC8D0WEcPQCXeXeTl7Y=;
 b=jtrb1yMOe72mKhc+r/oOG9imlQbGt1S0X/YwtEZgDWlp7wnybSyNoakjcOjwbudgs4
 VCPzTVkC27pglTI1t+zOPvZfB6kRgqxWf9NZMZUszqj7Cg8dhUtBVB3nYmIEmHo6duKd
 8qKlVVscYeO0dc5XTiYF4u9M9KvVZkonYaZRDESeUXQfm2Oi0z76mJ3YzBH3p5R7SiBV
 eddLqinssQyIrNdpt0oqxS0W6Hsrdko0QiGAkH+22HMrrlujJZU90r8W/XlKwZIoJxo3
 SPAFTNa3mByKFKdE7vcBaPR03gh+7GGLCZkjIFSGyJ/yxEs7Y/aKIRrL7o2j1O5GlgZf
 +4Bg==
X-Gm-Message-State: AOJu0YwsLLI3c4cAFfBW1nMt387H68CYP0NVUY0ns+l81Y3BPWHuNrmC
 njRiLIhwXdNzGZcPHzUAzp+3sA==
X-Received: by 2002:a05:6512:b08:b0:4fe:279b:7603 with SMTP id
 w8-20020a0565120b0800b004fe279b7603mr8729519lfu.14.1693844912164; 
 Mon, 04 Sep 2023 09:28:32 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 d17-20020aa7ce11000000b00522572f323dsm6000348edv.16.2023.09.04.09.28.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Sep 2023 09:28:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH 1/3] hw/core/machine: Clean up local variable shadowing
Date: Mon,  4 Sep 2023 18:28:22 +0200
Message-ID: <20230904162824.85385-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904162824.85385-1-philmd@linaro.org>
References: <20230904162824.85385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x234.google.com
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
X-TUID: pgbqm175q9/Y

Fix:

  hw/core/machine.c: In function ‘machine_initfn’:
  hw/core/machine.c:1081:17: warning: declaration of ‘obj’ shadows a parameter [-Wshadow=compatible-local]
   1081 |         Object *obj = OBJECT(ms);
        |                 ^~~
  hw/core/machine.c:1065:36: note: shadowed declaration is here
   1065 | static void machine_initfn(Object *obj)
        |                            ~~~~~~~~^~~

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/machine.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index da699cf4e1..7adc3d4e13 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1078,8 +1078,6 @@ static void machine_initfn(Object *obj)
     ms->maxram_size = mc->default_ram_size;
 
     if (mc->nvdimm_supported) {
-        Object *obj = OBJECT(ms);
-
         ms->nvdimms_state = g_new0(NVDIMMState, 1);
         object_property_add_bool(obj, "nvdimm",
                                  machine_get_nvdimm, machine_set_nvdimm);
-- 
2.41.0


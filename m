Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp136262ejc;
        Mon, 22 Jan 2024 22:40:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfsvSRhOOV/3FDaGvTYAhNiVo2MM7SnWBTKG7xwBJT3o0dmdmXqcHDfrTQ1cn4cO2IQKzC
X-Received: by 2002:a05:620a:2442:b0:783:2e5b:1fdc with SMTP id h2-20020a05620a244200b007832e5b1fdcmr7456522qkn.154.1705992025716;
        Mon, 22 Jan 2024 22:40:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705992025; cv=none;
        d=google.com; s=arc-20160816;
        b=Tp+Smmwj9cOspIQKqWAEtL/6x0k1inh3JSGumVT5BkbyDf9WMD8ig11fCYaC4Mje0Q
         UBgSdU4VBnWT6CzIh4/r/j/Xjk5OHut+AZcce4hcss55mOxjzcB9NFS3Dzt9R/ia271l
         DbObMygKErFmXNKyUnv23anMQAB5cYNGu9C3g+M1hofeEpuuTGHxCUaReJMp5zwQ55VA
         XeJRiw1+1kSo+AitGSenSSXKxRqH1RzBYzJ4ggyuxypaJLsEkt6NArj9zG/E2fv1IYtr
         T3s2s8NGMVa/hsNM91sTo8w3O4zlADNGxKpVLFg/D+3dG0llW9G7KnKY7ClQJtXokQ2G
         m0ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ONN8zUFU0/kjuTx5JtjFzfx6OgyKBiCsAIN6XbeS+GY=;
        fh=HVoLZTw5hlqqes9L9DSbvdhxOE62q72aEHLq82QYnRw=;
        b=PO/GJM7pQZ3Ub+mYl5W1gSzh7l9K18aFtJgccvonR/ew3NBozy06pKoGEFO1X/k830
         F6oeRBr++6lcZ4ubQ4QrDftL5FqPLL4/LmeU4bALU/Ejea3J6+TyUF9dtXD5oXU1tOuf
         AOXwI2dBiGm41SFPYcpnxrxqFYhHssuCEJLFRWch5em1+NQv6Yw/J2MBJPqDrkoqGQgZ
         aaa62rwgpwQbbOzuRYCl+Yl3zSHtv3iIlvVo9g2gPkE6M4hTMjf+rgGTjNT3JyaZS+Bd
         8w4J9iYW/st4q+hqqPbj0Ob5asXHgdBPa+KyK5fIRHFMhRX0qohi3fmx9nnhNd3sn/T9
         OLxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ONb2HzlN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p20-20020a05622a049400b0042a2ec106dfsi7411690qtx.669.2024.01.22.22.40.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jan 2024 22:40:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ONb2HzlN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rSARY-00044X-0U; Tue, 23 Jan 2024 01:39:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSARW-0003y2-06
 for qemu-devel@nongnu.org; Tue, 23 Jan 2024 01:39:30 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSARU-00087N-H9
 for qemu-devel@nongnu.org; Tue, 23 Jan 2024 01:39:29 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-55a3a875f7fso4285060a12.3
 for <qemu-devel@nongnu.org>; Mon, 22 Jan 2024 22:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705991967; x=1706596767; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ONN8zUFU0/kjuTx5JtjFzfx6OgyKBiCsAIN6XbeS+GY=;
 b=ONb2HzlNHOnMwe8CIcIOp+2+6v0KJjzMp3PFIZxST/a2YGw+W5WYkrHL/459iAXDzV
 qAn3knJSniTpzncKDhCLNyEbhKwcNuW8IrZK3dcPWqQdDs+iTeOym4U6MVYee23sm45/
 8ZcBYeknWSzngARyjiS2ArsmM0z53HOz/Ew0lM3BUqUL5Sm/q2+Bq7bog5BApJK7BZ45
 Jvb+SnQVsmEcIXQ43tTh4Fs69srMfkparCDQrgv0q8ff8XDs6Ne9VuO03HovEwPIYwm4
 5ejPG9WwyAKQ2DauN1mx8c5SXAl3rFUX0QCelVD1oAU+ycmSPiyKD7NmxjojTth89aPr
 S48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705991967; x=1706596767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ONN8zUFU0/kjuTx5JtjFzfx6OgyKBiCsAIN6XbeS+GY=;
 b=OmB73safn8WWz+LfcK1vVNVng9634c15PWDZVlikFRqaKqK/f9UpGRv7KHR9WeGKN6
 KFl97tpg2s0CZudgnamkyivO1zn4khPVWIw2VHqgLnKReovukpE9hh44NLEYBADKNyZg
 WuTQhGuA99jixhqdZ+chi27KVqU0c3vsF2fOZTlMvV/ANUWjkMReQO2usLXJuG86rV0s
 rEPi9Z/cdyo5n/vbOZWo+mEgJnRHrCYArS0VM+dHqRx0KbwINeS/sFU2OllyKlIJjaLi
 At07GPxAGjCQI+Z/VTtKmyDQQkcltaH3B0nrFV3NTJcxCESvV55rlAWs0K6Gf5QoUyk6
 RuHw==
X-Gm-Message-State: AOJu0YyX7XQdfwFtXX/gvtdBQBIFCkskTz78kk4dGlRR8eL2fxc6H7KO
 +xLQnKlwWpxAvR75mK509k0mszZle1qGqvtmPpK5CSu3/AiUlfnmlb8AkHYntswkGAvdH9ODzyL
 q8Ns=
X-Received: by 2002:a17:906:d52:b0:a30:b7a5:c34e with SMTP id
 r18-20020a1709060d5200b00a30b7a5c34emr276658ejh.17.1705991966915; 
 Mon, 22 Jan 2024 22:39:26 -0800 (PST)
Received: from m1x-phil.lan ([176.187.194.78])
 by smtp.gmail.com with ESMTPSA id
 bt16-20020a170906b15000b00a2ada87f6a1sm14122434ejb.90.2024.01.22.22.39.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 22 Jan 2024 22:39:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Gavin Shan <gshan@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 7/8] hw/arm/aspeed/1030: Check for CPU types in
 machine_run_board_init()
Date: Tue, 23 Jan 2024 07:38:41 +0100
Message-ID: <20240123063842.35255-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240123063842.35255-1-philmd@linaro.org>
References: <20240123063842.35255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: /nLORNQGeI7I

Restrict MachineClass::valid_cpu_types[] to the single
valid CPU type.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 393c97d55e..62d08899d8 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1162,6 +1162,11 @@ static const char * const ast2600_a3_valid_cpu_types[] = {
     NULL
 };
 
+static const char * const ast1030_a1_valid_cpu_types[] = {
+    ARM_CPU_TYPE_NAME("cortex-m4"), /* TODO cortex-m4f */
+    NULL
+};
+
 static void aspeed_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1613,6 +1618,7 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
     AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
 
     mc->desc = "Aspeed AST1030 MiniBMC (Cortex-M4)";
+    mc->valid_cpu_types = ast1030_a1_valid_cpu_types;
     amc->soc_name = "ast1030-a1";
     amc->hw_strap1 = 0;
     amc->hw_strap2 = 0;
-- 
2.41.0


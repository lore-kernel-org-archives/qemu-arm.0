Received: by 2002:a17:906:2499:b0:a38:6d10:c5dd with SMTP id e25csp379152ejb;
        Tue, 13 Feb 2024 00:13:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGo0RZTw2qdtOBqag3eSQvFDlcDfgK932i0vx/U4s6odEUhCMx/hNBm90GHzD3LlpRuf88R
X-Received: by 2002:a05:620a:1647:b0:785:d921:41a1 with SMTP id c7-20020a05620a164700b00785d92141a1mr3706589qko.70.1707812038689;
        Tue, 13 Feb 2024 00:13:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707812038; cv=none;
        d=google.com; s=arc-20160816;
        b=rZY4EJsVaShqEu3U23GtiuP+4EM7k5hb92lsuDYQKZ3bfc7RV8iucDczRRXwj5sTgh
         +Wmv2doAipkcOxp5Lcebs6fjbdRNwfIooJa92Y9wTpFjCRHsjJAq9FDWB/f17rWPIx2L
         r1Yfxu3nC9/gzAH1w7jiLByD8jnkj865S+VJ8FEHudopDtqa2MKRyk1ZarNYWyzOs501
         cPabSG8jsdfpEtRt5VIhAnu7/+/GWbiU1Dbdvkoj8JS5EY6hBdOTkhMY3k5h2b3Rl/so
         t7bU9TYRx7u5CMKq4isTZjtuTWfMxMY64sw6ejrcKHA184AyWahtDc8Ke7CxIPFHWaQ+
         JkUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=24s0na+x6T/s2HoEAp3AWZgaRuEgOsYG8hssre/glwc=;
        fh=zTfkCOnJxk9NUDbdOMAWBB/mjs5Sp0GsflZvPgqtOrU=;
        b=xSfyrt8S75ZjupeCcUaH+9GUr6BQqmqPgkjjwQbfyq9BIArHX28zaCI3vGA2NQFkR0
         A8zGh/y1bsGn7oMduaiTHPhoCgKC7e5Vu6xDsxu+do7pOqTgzek171VmeRViRyjnjGG6
         vDExpKnBCv/zHG4NZPQ/9oXzyRlmgWpdPI4XH3ChoQoU4HOpLQ5i6dRhgHMkwkJXcdNv
         55Uv4XNDL+ujarI7/DF6wtKw30ualwqJunCQZfulrPRZ1Z3vSIa38buKpQEZ5Ko4CUOG
         RkD67o9SkKxq7OVpGlh18wmsa/t2nXQLadyvAZ5aQHyIHtWH0a6IB/28FJ/K1AiM3Bqe
         pa7A==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Q/u3Zh66";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCXq3Kfgz07xZWynTHcTvRloOcQhJV15wkC5EotlE8tH/uJLAqTGXRtdXElr6O3N82HrHyWZmFujSDJASru+nMcnrs+lfNmj
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ee6-20020a05620a800600b00786e8836d3esi2826275qkb.673.2024.02.13.00.13.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 00:13:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Q/u3Zh66";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rZnto-0000QJ-MU; Tue, 13 Feb 2024 03:12:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZntn-0000Pc-3O
 for qemu-devel@nongnu.org; Tue, 13 Feb 2024 03:12:15 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZntk-0000ij-O6
 for qemu-devel@nongnu.org; Tue, 13 Feb 2024 03:12:14 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-411c863c1c6so659165e9.0
 for <qemu-devel@nongnu.org>; Tue, 13 Feb 2024 00:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707811931; x=1708416731; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=24s0na+x6T/s2HoEAp3AWZgaRuEgOsYG8hssre/glwc=;
 b=Q/u3Zh66GkrQFROPvonglXEhBYDpcWS0IvRW+qbtXdAPCwuSIkPn5WZto8DHo5AYV9
 Dr00HH0zHcKp0k600R4w6GHF6z9oDcgU3mlzsh5fOGmdt+GV0esqQIfHYV1pYQsr2nfk
 kbrmaUrXiltKxbTHjwYwLC60UD10C6t34m1g97nBwtnGbD6EuI7iwzBRhvKzARa4MHYJ
 k5RIU7/5YugBxrgJSZzS1iZkocEzuAYXtvcEU0fR2jXHG0+gZEgjo1RUYKd/SqsmDBgn
 ywN/X/NQKXVqaPMcGwyNbwdxFoCTBCwXMdeusv9IMhnDNBqx4uH78aduxCfDsFrO62Hd
 L26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707811931; x=1708416731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=24s0na+x6T/s2HoEAp3AWZgaRuEgOsYG8hssre/glwc=;
 b=wBZMhLwrdue+ZT2SxxkhGf/TRGaWnN1gC9+4lXq1cxUT56GEz0hSXY+fOPNRjpQMEA
 TSejgldJx3ViJEsva+XqswPYl/kKCmJOImhDjCvYQjzQk0gN93pJo6TK7tq46PydAMlM
 xMqcMbs+iC4s5lfafQY6uhzPYCyl0F5D+DfneQg6QrSacITc8m6N1/7NFuCh9WsTjCoV
 +H2sfg05W8fNcD9UzoDTFBsUFW+5BaqfsB1hly3KSv4se5GTX7NwsGRDQlJssi0xMZYe
 O6Pa0c+yzVt1VcYGFqxBeW2XQqad7dmsZsKvJabWGQQNA9l2ATB2ZUmFWXtD9McoxqWl
 oxVg==
X-Gm-Message-State: AOJu0YxTkxVhYCrGqzImeOP42JjgG7FwVgBd+5yxR/mzgtyQRnAKZgAg
 S12c01e+AnHH+ZDl7uiYr0sBKJ9zosDy2xSRMbRZMdzXQ0ndpUHnDGYzAbi5j6fypNl0OqFH3oZ
 p
X-Received: by 2002:a05:600c:5204:b0:410:6d23:dd6e with SMTP id
 fb4-20020a05600c520400b004106d23dd6emr7631551wmb.13.1707811931188; 
 Tue, 13 Feb 2024 00:12:11 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVZr/ZZeRsWJDXNqVUnG1h8mN8q7pav7jiHUq5Sbzq6SN7ZE6G5TekGAv4tT8asPRzo6QMZkXT1B+5Yg+UDWov94084c8aEZCDqqR67jWd3trdEhurssUi+a4RIDfyr8UpSzffOh35dPcDEk7DoEXTPYxtorIDqWvQPmqALWIgAW8aV4DyqUk9MijO6iMGX6huWbQC4tq7LaGDEdId1Vi5FkdVagchaOiPiDV4BW7SIpo1QQVj2gUS5+afBkiWmyCNsJinyQwvZiwHAaxcXimVavj3ApMg=
Received: from m1x-phil.lan ([176.176.128.243])
 by smtp.gmail.com with ESMTPSA id
 fc9-20020a05600c524900b00410727c315fsm10857739wmb.16.2024.02.13.00.12.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Feb 2024 00:12:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/9] hw/i386/q35: Use DEVICE() cast macro with PCIDevice object
Date: Tue, 13 Feb 2024 09:11:52 +0100
Message-ID: <20240213081201.78951-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240213081201.78951-1-philmd@linaro.org>
References: <20240213081201.78951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: vo9GU/oEoNJH

QDev API provides the DEVICE() macro to access the
'qdev' parent field of the PCIDevice structure.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc_q35.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 7ca3f465e0..33a4413708 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -309,8 +309,8 @@ static void pc_q35_init(MachineState *machine)
                                                PCI_DEVFN(ICH9_SATA1_DEV,
                                                          ICH9_SATA1_FUNC),
                                                "ich9-ahci");
-        idebus[0] = qdev_get_child_bus(&ahci->qdev, "ide.0");
-        idebus[1] = qdev_get_child_bus(&ahci->qdev, "ide.1");
+        idebus[0] = qdev_get_child_bus(DEVICE(ahci), "ide.0");
+        idebus[1] = qdev_get_child_bus(DEVICE(ahci), "ide.1");
         g_assert(MAX_SATA_PORTS == ahci_get_num_ports(ahci));
         ide_drive_get(hd, ahci_get_num_ports(ahci));
         ahci_ide_create_devs(ahci, hd);
-- 
2.41.0


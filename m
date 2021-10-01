Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1521473lfp;
        Fri, 1 Oct 2021 11:05:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPQOIghuMv9x4x8pgtC6bmVPEaPL+IySm0KiZQMStCTgoBTaK1ZfPMawJ29TeRCBqRKm8E
X-Received: by 2002:adf:a347:: with SMTP id d7mr6068749wrb.139.1633111549141;
        Fri, 01 Oct 2021 11:05:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633111549; cv=none;
        d=google.com; s=arc-20160816;
        b=pj2fKVEF3Nd0YPqbyjpcJXupspRt3PGye9jEHI3QWqoiI56RGnEkEC7SxtH+wV72Ej
         OttfCENx3V8pum8Qwzw4J9NaWzeUpBlq60GEkB4QiKpioolSh+kg1DwMlasVHTKpa3df
         NkrxQQxts3XrNiN+2pplBUT/bcCiYGk2CV+16Vo6sB+45jzWdEXka2MJTtnV33FIALUE
         gQai6Tc5DDb3KrfflQJe6LGFroj1Lz+t+AWJrWhvI8PCR5hl7xySlWLFeeUPnZBnxBgO
         IUjYW02KcfBYCf1ZW7wW4xQN7qS2S2m6JZXHHCKAEZqi81iMAupv+YOC848F4suk+qtq
         2i2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=tUzjz0DaQh9V/E1AtSG5a0bXdcLZdXoyXVjvZ0SiJck=;
        b=OQyxQwKqrBfwJFVm1hKqdqaci/yAaOggC+CpXeNIfIo2z1RliCsXcvVd5EjXQpCXu/
         UvUlnh5jw9VGad57GWwhZHspLEDhKZ1Nfv7FKlotZQ6qDfE23wUAWMBXB7BhN7HYSYQN
         figA8aUg3QHmtzauhNLVOChFzQdBm1FgEtRFSx7p0+UxvbP/ErH6MdjZoQTwi7X3+v0o
         62kE22h6TV+Kxahb4ATfvc97Xf933FLU23Op+i64zzKH7pxkZ7hoRW+LosSgBeycFs9J
         fPGkmgE48yZ9buHp1WD7PwzuhXD4X+cJG9Tm0VuDEGe/+/L7heTCvBu6or77y7DWSK/x
         kk3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MO+jKaoK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b7si6923372wrh.246.2021.10.01.11.05.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 11:05:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MO+jKaoK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mWMuq-0003El-5x
	for alex.bennee@linaro.org; Fri, 01 Oct 2021 14:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUM-0000aZ-Rb
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 13:38:28 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUI-0000mG-3w
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 13:38:25 -0400
Received: by mail-wr1-x42a.google.com with SMTP id m22so11191624wrb.0
 for <qemu-arm@nongnu.org>; Fri, 01 Oct 2021 10:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tUzjz0DaQh9V/E1AtSG5a0bXdcLZdXoyXVjvZ0SiJck=;
 b=MO+jKaoKkcl7asXlV2R94xYOsojNok9L8O4LdbJRGQQjI95dY/K2EZQTtgwCvPTISO
 PEINhcax2ZEddVDNjMuELT6omHNg8pcAe0GVZaLSgm+KPoxQI8Ou6mw+VqqIPZDVQA31
 LZAFMgpCy/lw81KqKc+Umuyp8MrDFqaOYOsnUfEl7cgZywqPTMjk1tLMOc29VIyM2ELn
 yDXPJ7+bo8zgoHC+u9STNs8Jr3u9RTkvIieJ6dgErAS5iJNxrnBAeklPC76jgrlq8ZTL
 cqAexzm19CR8K4ANE1VRxpRCNJohNHS7Igc1vjLfNggBwNycW0ZodWpXlXmDWLpVjojE
 4KVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tUzjz0DaQh9V/E1AtSG5a0bXdcLZdXoyXVjvZ0SiJck=;
 b=rn3wj9Q63nDRM7eAC0zRi5DPWcyXaXqZcp5JwOfTvEpPWU9XSZuB0GyohcEM/yooRQ
 InHzv4hi7Gmod9wMkLGdKuqeiXxT1PZ6znCLtEshwKJ3KPF7Keq0SBQjaHDamd1PxPrz
 xr5O3Jqv4ZQi1v/ALig1JwDTrxH3sx6N2djG6TooOqGCF8cnRnGWPo4562LSaOkcY2CL
 feZGbYD/kXTmLlOny/fX2ynj3QZskSjvhkiVGgsIEj0YXUGcDBZKe35h/qEuHYupqkaV
 2XKHrtybsleMQ7Z4bNqSePdx7uXQx+z+GxAUuP8DEPc2PgtnH/KwD3kx5OwHuG1k+9K9
 ifjQ==
X-Gm-Message-State: AOAM533tQMvudD1zNjyY5VM5+4VdmZUTnMwdd4VPBi44LR0eBI9EVcKi
 4inATR4X8ledXu0qXVwbD+sfig==
X-Received: by 2002:adf:e742:: with SMTP id c2mr13997124wrn.18.1633109899187; 
 Fri, 01 Oct 2021 10:38:19 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k9sm6186592wrz.22.2021.10.01.10.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:38:18 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v4 08/11] tests/acpi: allow updates of VIOT expected data files
Date: Fri,  1 Oct 2021 18:33:56 +0100
Message-Id: <20211001173358.863017-9-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001173358.863017-1-jean-philippe@linaro.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 marcel.apfelbaum@gmail.com, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dUS0ndwfUHfl

Create empty data files and allow updates for the upcoming VIOT tests.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
 tests/data/acpi/q35/DSDT.viot               | 0
 tests/data/acpi/q35/VIOT.viot               | 0
 tests/data/acpi/virt/VIOT                   | 0
 4 files changed, 3 insertions(+)
 create mode 100644 tests/data/acpi/q35/DSDT.viot
 create mode 100644 tests/data/acpi/q35/VIOT.viot
 create mode 100644 tests/data/acpi/virt/VIOT

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..29b5b1eabc 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,4 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/VIOT",
+"tests/data/acpi/q35/DSDT.viot",
+"tests/data/acpi/q35/VIOT.viot",
diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/VIOT.viot b/tests/data/acpi/q35/VIOT.viot
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/VIOT b/tests/data/acpi/virt/VIOT
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.33.0


Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp749429lfp;
        Tue, 14 Sep 2021 07:42:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiDCxoGsN+UvW2NL1d2wVcR4ytyFAyYi2ymAVJmXkcHrk+Fv8l0xnH1pSM7fxxNlrDa272
X-Received: by 2002:a67:441:: with SMTP id 62mr9792732vse.54.1631630524018;
        Tue, 14 Sep 2021 07:42:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631630524; cv=none;
        d=google.com; s=arc-20160816;
        b=NSdEVQGHv9Mcqws36Imn7szU8YDo/XVWXMwwo7Gs5Whrb587wzelRVeqF4/gNEk5je
         QtqoD5fJaAGezbUXwyylGzi5D6++BLyQi8nCIIZfGP8W7UuMT3qdWIxQJ7xxUGftPLep
         978x5voyGGzTQSNbNYio1zVBr2mzyyqQCp4s5H3m8NwaRJtHQny7vzI7dcbKA2mrRGqv
         LNGjeJKGUPR26ItpVSY/TwcVrT8E14KxF01iPT8FkYl43lw0bJ48kYEO99vVvVr3R9AY
         dxMpNbrRI5NdyT5PGsjN4pzVX7EgCt2fUiTiptyAGIM5BYGppiC0SWgm1GwRiZlQSuPk
         O6rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=tUzjz0DaQh9V/E1AtSG5a0bXdcLZdXoyXVjvZ0SiJck=;
        b=LHs+686aTadAeOfo1kHY3fpkNAN/HhSRVEGpejwaBrg0BSgAfVOFtOpG+NggeCBerl
         /fK/CCkQfu6WnOuKwCuDrsgbC3t2Y5+iWJ9iWiteLnzshinUzTrunVXRbLXpvHTiriPK
         d63Z4WwbPqhBCdEqkYGzm2k7DTWMQjtqe1NuqB6yL/82lP5YSgBzPJiyE8rWdbqe14X2
         j1ZxxwLguUQ3FVroYuOuZZlmDZLMZs2xRMQame8URk26EHfhhDItAfybk9uVzEDqO2bf
         SR3X9YVT1/dGe+JzZE2aRtr1RYPAc61o3iCBS+eLj4N3eXOuK0sqEJywlNi+Bp/Kzq9H
         +peA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fK0YxSDi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10si3801752uab.198.2021.09.14.07.42.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 07:42:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fK0YxSDi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQ9dL-0000Lw-7c
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 10:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MX-0006Fi-Dn
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:45 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:37458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MP-0005Qk-BW
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:41 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso2268153wmb.2
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 07:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tUzjz0DaQh9V/E1AtSG5a0bXdcLZdXoyXVjvZ0SiJck=;
 b=fK0YxSDiCHrTwUEMTdSyk6J/gIKTUzJFHCKPj8JVl1isshp4DPQ1QP+jlnH7qpcMD2
 IQqOxl2R4E3GV7gGjDclIbV2PzY9Bicqb2bpSK3fmZaaBwDZ95MU5BiOSU39g7KKoD+m
 FFxBhvGQWPcZo0KGwK3TNfJ4r8MWGkE8BoPKpsd8DcJY0P1V0uot2JPdAulze3m1TFl7
 J6otwAy3GkPbMRXZZ4moNNItExSQrK95vrM59JOtNxYAOHoojddO10Z8r+4sOqJA2MaU
 NV5oLDUSvwPZohL9/RwVVg48PZXPDF9yeMN6Ms/xFjjS0oifzeDzB30QKjslg3LvZGkU
 Vz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tUzjz0DaQh9V/E1AtSG5a0bXdcLZdXoyXVjvZ0SiJck=;
 b=uzCB25nxpySZ+VBc8hGBoN7BMtBrxIXaEj1Krqfw0W94BImTHMrhJnlfoFHT4kC1ZQ
 /dz3FPBz2p9rvWlkGJVzjZhvO2wrmWK6Rva/Fbm2rCKSEETmSKlGTWQ17yhggy0F7Rst
 2IniyldjedzWX7rlFsSnHu+JsoWI21dHG6MptcHznkvOXXXcO6FSJXLtAJbjVw+En18X
 vtPmUIgWlCmxnFt1UvY70TSrZuhzW8S0FFQ+mZgtN9aHLj1f+IWmdfN8F2qRpfGluheh
 9lGfuOpBm2XCkVOu4UR8i/3hMAqpDEemXwj8cMvnKr1a3707SZQ8XTB6jAc4wbKhgSAD
 6Fug==
X-Gm-Message-State: AOAM531FRYr+InP8uElb8G+FseighWVPNudr2e9FD2g/Ld6WIfwoYqXP
 XpfhUtiQwdgujBvJ99rPCBH+eA==
X-Received: by 2002:a1c:a942:: with SMTP id s63mr2489571wme.45.1631629467420; 
 Tue, 14 Sep 2021 07:24:27 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k6sm184252wmo.37.2021.09.14.07.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 07:24:27 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v3 06/10] tests/acpi: allow updates of VIOT expected data files
Date: Tue, 14 Sep 2021 15:20:01 +0100
Message-Id: <20210914142004.2433568-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914142004.2433568-1-jean-philippe@linaro.org>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fXdt3tboDAWI

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


Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1550338lfk;
        Fri, 10 Dec 2021 09:09:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxq5g4OCTxyMQ/AqPrX2OsFU14+AGzwQ4wGZ7Ckg+PuweshDhVr8SEZ5GkbzyS62RTzkHSI
X-Received: by 2002:a05:600c:4e02:: with SMTP id b2mr18061538wmq.105.1639156168111;
        Fri, 10 Dec 2021 09:09:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639156168; cv=none;
        d=google.com; s=arc-20160816;
        b=Gx0sqWIzCxs8U7mbAgnY7AzTMtIKZa8MeJ/WlR8P3RZVYDDnOPh7S4HPdiLcXGMBad
         c6vB7YNb8iAo5TcivBAHwHmbV+vDl4Ryg8OoC/5D8mhtQu0YOGFVw/D8uexnWXKmlEb2
         wO9b2QVhE2mG3R68NYxEiyQXGyHo3AJ39wiils6W0bG/o5qVmM/qjuuRKQX/tfs6Z0sS
         qvwsvCm1Vrr6OyBfP0P0n0cxm4iCfj9g/YHFbJoT0LrNKqzPJkvCyiiun80piVVu26sY
         /o9nnXCWyNB8OgMyO8xnDiMz6MAv7lYzbe38MK2UyWPKt5yvgtgWGX+vgRPt8NYyq4/D
         1dzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xA+b4YSvWdX/w+5WGD2ZykAzUJbBu1kLdHNwHXJDTcc=;
        b=WgJELcNwsjlZ4VH/UCeKFGLxbgAK7qkjm027CmZZi/d22jBFSYp8zPrpBg4qI4hNEp
         BJnpnHYTAaDWoyYAapTHyzwCpU8IHtqM4MapsQPrtD4DH11nrt2rMjdCJx98rxrA7fek
         cZ4pROCyQmPEourDkl93BZkWMp49gCkZ8fGd+licZdJzRS+S71XD+TC0bEIjXJWX84Ge
         t4lnbMqPLao5CobyATCW23Iv5Rd8CuRefgb1kcUO58B8OeKXCibRpZSPvlic2xhAtO12
         8XuAG12GeGnSmCx7yr4RPXg+eAtTTEODvl+CmXVaBFin3YVB5tFk6ENliJkuRLJcxsCE
         ZBUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rRNLfYZ8;
       spf=none (google.com: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org does not designate permitted sender hosts) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5si168854wru.1047.2021.12.10.09.09.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Dec 2021 09:09:28 -0800 (PST)
Received-SPF: none (google.com: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org does not designate permitted sender hosts) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rRNLfYZ8;
       spf=none (google.com: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org does not designate permitted sender hosts) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mvjOh-0003bT-Ay
	for alex.bennee@linaro.org; Fri, 10 Dec 2021 12:09:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLT-0005qk-En
 for qemu-arm@nongnu.org; Fri, 10 Dec 2021 12:06:07 -0500
Received: from [2a00:1450:4864:20::52a] (port=43782
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLO-0006T4-5q
 for qemu-arm@nongnu.org; Fri, 10 Dec 2021 12:06:06 -0500
Received: by mail-ed1-x52a.google.com with SMTP id o20so32377225eds.10
 for <qemu-arm@nongnu.org>; Fri, 10 Dec 2021 09:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xA+b4YSvWdX/w+5WGD2ZykAzUJbBu1kLdHNwHXJDTcc=;
 b=rRNLfYZ8N+H3Bmco19njhMhPnZ4mG1SmtU9MgG1dUJhba5eiWoaU2kekGmcsaVd0V0
 C5TDitUuro1u5rpQHlYHe+FOYAilME9GwbUtrr1XgZ0nt3b5OPXjw1AkVfHm8TM+RQ4n
 sAsymWdg+Q7wrIB9sGoqzLFZK53/37M3NHhPYycTrpokas4i1wY7kQbP79ZtT6/peVGu
 taVakdRJmx0CqQI38YC1cAQHfm6weBd55pkzGRJ35e7/33lp9Z+3lP+mXeoxvAX6LyRV
 jLdbADl2b36Uxx0BFy+eKleQ86ind4mdcNCuFmGYpRKd4yhmBh0g9KcreqJ3cbMyBYil
 fHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xA+b4YSvWdX/w+5WGD2ZykAzUJbBu1kLdHNwHXJDTcc=;
 b=fTbyH/iKPJ7ViGYOe2yapO+kVzjfbZkHltwpOKIBIbiqpZWL5wF/InqvLoXpSoB5JH
 YwjzAPhKAILlZuGUqs0KXtEPnYKkhQ4TcMXXJTjc+8pTNWTgQfiY+Tmsobfcmw+eHTI+
 yQvXj79EgUzVfmgTEU+gyYT8mwMEVIAKerpjvOhbbAnzivnoF8mTkOYH035h+kYIxSCz
 qx9s6Buzg+dEsBCeGOKZQ1c7aw/gtBFTFr/KSQVtgTToD5sElFCXh0KR+ZBWgNnOt9S+
 EyIFplx64MCrOhQZZnI/D3VMpiNIgXjZcTIZanAtZJeLZSI7sqaxdMz4q0wXApsYTSB0
 ycKA==
X-Gm-Message-State: AOAM5337ROjZxFUyL+OwdBCjyR1RaJ96iN+sg0IFgeqKnJuCdkY0kc+5
 Tld93rsjz0EccIB0QvDLi4lwEQ==
X-Received: by 2002:a17:906:619:: with SMTP id
 s25mr25336986ejb.237.1639155960394; 
 Fri, 10 Dec 2021 09:06:00 -0800 (PST)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id x7sm1860661edd.28.2021.12.10.09.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 09:05:59 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com, imammedo@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com
Subject: [PATCH v7 5/8] tests/acpi: allow updates of VIOT expected data files
Date: Fri, 10 Dec 2021 17:04:13 +0000
Message-Id: <20211210170415.583179-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211210170415.583179-1-jean-philippe@linaro.org>
References: <20211210170415.583179-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: ani@anisinha.ca, eric.auger@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Jean-Philippe Brucker <jean-philippe@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N8b/PMxN0gGv

Create empty data files and allow updates for the upcoming VIOT tests.

Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
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
2.34.1


Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3007575lfg;
        Mon, 3 May 2021 14:12:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpP1qmGStNF00uOviIj8Mrn5YTmy1M8Kg4wBNfmNsZ+0UQRyVUD6JmNQpuov7nSgRRoNIH
X-Received: by 2002:a17:907:3da4:: with SMTP id he36mr6576238ejc.308.1620076325254;
        Mon, 03 May 2021 14:12:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620076325; cv=none;
        d=google.com; s=arc-20160816;
        b=T92NWvWjMeXKH47X3DHIQvhThWGyWsbfxCAm0o056MK1DYbGuJ/CAfHQVfIVOLM1LH
         BthqTlt7kBC6YIqU6bhsvgH+Ql05Fxz79E5uZIEXWLbjI5YKtODwfQPmalXUitJqHphy
         N75+hN0AMM3BdZHcvLaPzlBkfJDmWnfMrzQxkLbhsu8N7jA450mKl+yw3e+s721rmGrE
         eFQsI/S7d/Whyi+u4wMLqA22xG9tbW+V4G+sgJ511jgOyXdniRhFusxSWQbvyeRrnx9k
         FgjF3/xOBLFt+fQSeDXSnpyyAuoRt3xOAIzkbyKqdc2DI7RrZQodwqLS7ehoNKAsrntk
         1Mbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=55DSOQd/Ti/CUKuyk0Cp1QnVj2/mT8NrttR0T4lOw2k=;
        b=kQSyxiah0iYpHU6M4JO9djxmUmhaE5X98sQX4rLBNl8v8c6A9unhD7w9qsHorBZarJ
         kPm9riWgihLcYMRJjXbEZJFbdGVtilT0FB2lgLll96nbs2zm3YftR6ViWcrdHsZLIKh1
         J9jwx7ha1NycdwFkI0+HoNqFLdPfcB0nL5ohjtmkup585uvyo682jyYFRwklxqOD9Faf
         ymw++BgPKoTpQ2aywuxR/RrfHphda5uSxtIevZEMUCapzFhoBQk8DQRyeNClN67j9bQw
         4rtjt2qSvImTmUzgF3F3h/EYTd8i9VzF13Bx+hYYG8IF42eSC+jeWDP02LFBnUGOogG/
         Hk2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bfKtwi4N;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id p8si12105631edj.611.2021.05.03.14.12.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 May 2021 14:12:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bfKtwi4N;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620076324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=55DSOQd/Ti/CUKuyk0Cp1QnVj2/mT8NrttR0T4lOw2k=;
	b=bfKtwi4NrPMD+I5GlFkTUXtKLiB53i6HuB84BHp5MlMqeC6TYZicjytaMJA6LTv4K7eRum
	cK++I5rXqYdWF8xuQpOC+9RqPzYvH6mYRJ2b0ZEppAMVY0zAxlnVBNjqI46DqZICcGeEtM
	UE937E3tF7Gdc87UMeOISBm5aPsXcvo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-RKZ5OR7CPyevSgBN3-PjAQ-1; Mon, 03 May 2021 17:11:19 -0400
X-MC-Unique: RKZ5OR7CPyevSgBN3-PjAQ-1
Received: by mail-wr1-f70.google.com with SMTP id 4-20020adf80040000b029010cab735fdeso4646165wrk.14
        for <alex.bennee@linaro.org>; Mon, 03 May 2021 14:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=55DSOQd/Ti/CUKuyk0Cp1QnVj2/mT8NrttR0T4lOw2k=;
        b=VW9YTnRHpGz7iEBdTvHDIkfI+R2o7PzHdwgcTy+1dMRQe7gGZgwXj/h0NqXWDzhtue
         CxGinjxpK4ADfn/iHgtlNf615qCTB7Lfz4jo2GT0NVMaz9ApBSrnnhPkf5ydgG//tHWS
         XnYNfu2r3pUpNXMieD00q5YuvSR4axSiSmtLUKgyhI+3apshSzmyyLC91tPHWZP0yNR7
         6Y6dPmt4mK3ARgMzAp2T+1eU/YXRE5QYJqs32VAqVlfjnq+0d6TvZbV9+lpLFgaNhJ9G
         YRXzJykW6ClPeypdYYu437Tl40dotRsdQnCV4/LWZYOxqcDbhxMhEk2hhRYw/VSKwaq4
         tW+Q==
X-Gm-Message-State: AOAM5321PNwzylAM7RIvkb+2knFbG7EhxaRL1EsI6CRh9rSRNJdTitdI
	iFY1JQUJNCVoHsjKguquxcKrJRoz1Jgr9un0gy+FnXHHpyaDsYmYGGVhzXtiYQePmiK8+ZduKYO
	G7hI2qpK2wd6wFiNH
X-Received: by 2002:a5d:590a:: with SMTP id v10mr27356364wrd.306.1620076278575;
        Mon, 03 May 2021 14:11:18 -0700 (PDT)
X-Received: by 2002:a5d:590a:: with SMTP id v10mr27356350wrd.306.1620076278480;
        Mon, 03 May 2021 14:11:18 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
        by smtp.gmail.com with ESMTPSA id y5sm721079wmj.25.2021.05.03.14.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 14:11:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v6 11/12] qtest/bios-tables-test: Make test build-independent from accelerator
Date: Mon,  3 May 2021 23:10:19 +0200
Message-Id: <20210503211020.894589-12-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503211020.894589-1-philmd@redhat.com>
References: <20210503211020.894589-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DCb9U2j25diS

Now than we can probe if the TCG accelerator is available
at runtime with a QMP command, do it once at the beginning
and only register the tests we can run.
We can then replace the #ifdef'ry by an assertion.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v5 had:
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

v6 is simplified and keeps the same logic, however since
it is different, I'm not keeping the R-b tags.
---
 tests/qtest/bios-tables-test.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index ad877baeb1b..762d154b340 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -97,6 +97,7 @@ typedef struct {
     QTestState *qts;
 } test_data;
 
+static bool tcg_accel_available;
 static char disk[] = "tests/acpi-test-disk-XXXXXX";
 static const char *data_dir = "tests/data/acpi";
 #ifdef CONFIG_IASL
@@ -718,12 +719,7 @@ static void test_acpi_one(const char *params, test_data *data)
     char *args;
     bool use_uefi = data->uefi_fl1 && data->uefi_fl2;
 
-#ifndef CONFIG_TCG
-    if (data->tcg_only) {
-        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
-        return;
-    }
-#endif /* CONFIG_TCG */
+    assert(!data->tcg_only || tcg_accel_available);
 
     args = test_acpi_create_args(data, params, use_uefi);
     data->qts = qtest_init(args);
@@ -1506,6 +1502,8 @@ int main(int argc, char *argv[])
 
     g_test_init(&argc, &argv, NULL);
 
+    tcg_accel_available = qtest_has_accel("tcg");
+
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         ret = boot_sector_init(disk);
         if (ret) {
@@ -1554,10 +1552,10 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc);
         qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2);
         qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
-        if (strcmp(arch, "x86_64") == 0) {
+        if (strcmp(arch, "x86_64") == 0 && tcg_accel_available) {
             qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
         }
-    } else if (strcmp(arch, "aarch64") == 0) {
+    } else if (strcmp(arch, "aarch64") == 0 && tcg_accel_available) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
         qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
-- 
2.26.3

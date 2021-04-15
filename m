Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp693049lfr;
        Thu, 15 Apr 2021 09:40:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcKWyYtIRHNmc4TJqNFBfdpXftxMdKvn5okXFsteSUbNXQElXhPj8Ugd/iEnpnMgMhxN1l
X-Received: by 2002:a5e:9b06:: with SMTP id j6mr103714iok.117.1618504819583;
        Thu, 15 Apr 2021 09:40:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618504819; cv=none;
        d=google.com; s=arc-20160816;
        b=g2mpnYuUlMWPriKldlrbh3xNHvJNLFAHJvrpX2ehDc4keKtKNa+gVSGK+H8Xo/Eq1E
         9WRXyrBKsCoAy8MjxFfuZhe5Q32JyA+slLjLbULnBQBpyUEtDEvQTqsAlWjOEki6ZDVO
         URf9IaYVLMSHoYtd6XpqGXnmUU066JaxZwGHzSfOBzsp12hjtWqrhenbgeh8+x0F4mJc
         aDJEZlzaZG8eaObQqjtZM366cCVGxvXeDGn/VZvnFXF41Brme5J/PbxPF4e3fsfp/3Tp
         X0Hkf+NKjaz0dGRKfFr9So6VwlrzEcXqsNBQzljrtsmRDUU5SirmORl45ZZBtYB38TEI
         PFXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0xuLjWIAItsNJigm6O/64309pXXRrcZWKCiQ1igybp0=;
        b=Q6BmpGdOKYx2H42S2gwhk+DPya3R/DeeoV7GN6RT7571/UmY0eyjP+lXSyHARMKIdZ
         TcgOu1YtlOl4JlLfBJNPelf5gwke8rxsoAibjoXaferFXcIKFFsoGqVNBSwK3EjwexML
         rH77WxYk9UUCWqsUNHmm/MZad+LKEi7RcerPRKdOnCyi8bP1iuaPIJOFYdivk9LXFQry
         PCL7Vzcryky6lvC3SUT8Kf78Nl+nrK4YevLgjD2wXm+VEBLeK8j+3zjMVGdhh5KgetKa
         UbMDIDrmhTqB76dkUYpZSFQ06SJ/F0bmWSf9aya7/j4euQ7vunpSdWvLvnllfEBJc1DE
         OS9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="iBYx/+S/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m22si561364jat.1.2021.04.15.09.40.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 09:40:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="iBYx/+S/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lX52Q-0007H8-RR
	for alex.bennee@linaro.org; Thu, 15 Apr 2021 12:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4w4-0003Mi-6d
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 12:33:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4w2-0006Dh-1c
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 12:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618504420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0xuLjWIAItsNJigm6O/64309pXXRrcZWKCiQ1igybp0=;
 b=iBYx/+S/do5qxcjpPA6jZ1Ki+r6ZCHlOoPXdrNhmfSMMRnLSToDAR0jOgYh0EAmOEH5a7z
 hcGswja3YfQdrStwMON+zwny/Sgd76d8/bed18T+xCJ8K5hXWtWR1YF/xd2muuZxyhUOyj
 DPzsWBC32Ze0GsVZXX3o0ZNDpSPTr90=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-us_f_95KOU2MLQySYaGoAg-1; Thu, 15 Apr 2021 12:33:38 -0400
X-MC-Unique: us_f_95KOU2MLQySYaGoAg-1
Received: by mail-wr1-f72.google.com with SMTP id
 v2-20020a0560001622b0290106e28f8af8so460958wrb.9
 for <qemu-arm@nongnu.org>; Thu, 15 Apr 2021 09:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0xuLjWIAItsNJigm6O/64309pXXRrcZWKCiQ1igybp0=;
 b=jXxglf/16tVcoi3zVqqTzDe98rweFK7R6L+4pfO8rRCNhuwFW4DitPSOdWgV8p9RKi
 0P9KAQc+1h/1q1VpFgeXJIMQ/96PtKFaZUb76Lrv80SM3Opu0suWud3CZ8ECj12mQ+mw
 +7PdwD7AT88bCbD8wh7IBHsyFHoNto8M68DMUxKhgBZZqG3K6Byh5JppsG8Vq08g7kRq
 Uaei0mnodhdiOr4is2uY+VhYJkDbsaep4RWSkpozWjpWM4MGlB7mxzMoWyAikk6E339y
 QmfVQxIbxQkPRh5//1xpi4NZRxYgmnEX4oW+50TvykAOHnx+xjZ04dRWuwHWKkLES6jM
 xnLg==
X-Gm-Message-State: AOAM531PCLBaEXnxACeqI+4yzX43m3S+Hir5Uk/tIn77+rhtqzhG0VqR
 s4++fmhK79FRXp0evkr5A7aochTB7bPQK+Y9Lnmz8NV7RLit586w8icTbhnT6FfvTr9G3yLsYcN
 o7RP8sRMhv5Ki
X-Received: by 2002:a7b:c357:: with SMTP id l23mr3995284wmj.152.1618504417587; 
 Thu, 15 Apr 2021 09:33:37 -0700 (PDT)
X-Received: by 2002:a7b:c357:: with SMTP id l23mr3995264wmj.152.1618504417479; 
 Thu, 15 Apr 2021 09:33:37 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id g132sm3769616wmg.42.2021.04.15.09.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 09:33:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/12] qtest/arm-cpu-features: Restrict
 sve_tests_sve_off_kvm test to KVM
Date: Thu, 15 Apr 2021 18:32:57 +0200
Message-Id: <20210415163304.4120052-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415163304.4120052-1-philmd@redhat.com>
References: <20210415163304.4120052-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gzN1E5KST+l1

The sve_tests_sve_off_kvm() test is KVM specific.
Only run it if KVM is available.

Suggested-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 7f4b2521277..66300c3bc20 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -604,6 +604,8 @@ int main(int argc, char **argv)
     if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("kvm")) {
         qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
                             NULL, test_query_cpu_model_expansion_kvm);
+        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
+                            NULL, sve_tests_sve_off_kvm);
     }
 
     if (g_str_equal(qtest_get_arch(), "aarch64")) {
@@ -611,8 +613,6 @@ int main(int argc, char **argv)
                             NULL, sve_tests_sve_max_vq_8);
         qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-off",
                             NULL, sve_tests_sve_off);
-        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
-                            NULL, sve_tests_sve_off_kvm);
     }
 
     return g_test_run();
-- 
2.26.3


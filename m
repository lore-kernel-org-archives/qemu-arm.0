Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp451054lfg;
        Fri, 7 May 2021 07:43:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzz/0pj/xXb6ZIFLcDZ6IMsufzzhzhcYtjVWq4spUn8A07KKTCoHHVhCDGYxePoRI6okXu0
X-Received: by 2002:aa7:dad7:: with SMTP id x23mr11918556eds.86.1620398616091;
        Fri, 07 May 2021 07:43:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620398616; cv=none;
        d=google.com; s=arc-20160816;
        b=Vb2ZsZkqJaj7B4smhuDmQX9xH4EzTfhsh7dBCVXG2DZjQvDDUsZn0sh84x+KzLs6Ab
         jjml9tYJQ50PYC4C3TkaSlVm3h7Leg1Csu84kQO+K7/8jqzo9sQXaEsQGm5CITbJagLn
         w5yPHniq8hq3IIP3188K9wbaZR9/ZOWawsb+AQAlkTPMUC3Fv0BVC9lAK1kQwuA53Hvt
         wkPClszfAVW8WMluJSeyz9AjVDFFcKFcdhmVjgjzilBFaAdtdQXCTaI4k2atHuOQXA15
         y8MXZtNysL9pd+mmWEjJbkmi1hZguXaL8Zfa9lB0aTWV3GA59KNGrMPqINMnPzCo/4cc
         nfAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=q+bUpux/oO0InwS7O+3v+yDI8KzcveNX4OlpMmGvtIA=;
        b=j5yPB5xj6gUX1p/XUVzuLm5sn+mAxK/Y4BHZmtyQWJujIpIiXbhLlMsHL1YpundK74
         8X0or6h7kpn4UeCmwG3tAwUhWJQmFKAb4sAWtdhJQRvqN8tGXc4xQDfMrG6R8KybjH/p
         6c1DCyNDC+ee65gdFFw/z98V2tq5pE6TKJBdGjuZEKGdkk6D85/8S427NMww323ru6EZ
         7/VjbPc5CiMhN9dRMs4zh3l3VeqzQHtr01qG5f0nXBHqjC+KxFKk4towaIrV0xDIgjNo
         GGbgJ68G2d3az7RxGaBDhaqaf6EB1f39EFjd5dpC3H0yYd1dN1vjsLSrNKnS9JC8wnr1
         SG9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dha872s5;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id c23si5001752ejk.382.2021.05.07.07.43.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 07:43:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dha872s5;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620398615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q+bUpux/oO0InwS7O+3v+yDI8KzcveNX4OlpMmGvtIA=;
	b=Dha872s5YLhGxcdon0ZCmrGesBTGsT9kAr8yuOEK+7ZJFdG+eGoQ6gtbGl5iOXT9mPC1RF
	e9q1uafZlic31NYTVocfjyISMeyk7nnkmqZ6z2eweXgH3Zrhmxo4cg/DsRJlY5ybFLlGBh
	KSkYKc7axsRadtaRxmzLUfJM5g21Nyw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-dauRGijoP7SmLpmLUghRWQ-1; Fri, 07 May 2021 10:43:33 -0400
X-MC-Unique: dauRGijoP7SmLpmLUghRWQ-1
Received: by mail-wr1-f70.google.com with SMTP id r12-20020adfc10c0000b029010d83323601so3662769wre.22
        for <alex.bennee@linaro.org>; Fri, 07 May 2021 07:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q+bUpux/oO0InwS7O+3v+yDI8KzcveNX4OlpMmGvtIA=;
        b=Etjpp0TJRfIHhuFhN8bV5tHsA6qgRLVWJ1EuHtahL9iaRJWDKyacJLYVK5S8QytuAJ
         U/YK2+bPKCAgoABWuoiwyxI0D84f52kn89d3iF/jCJG9bbsGGLeshvVcOvLFGblh/ugt
         QhTVc38pllyf7ZizRvuS78dn270pbSyc+2XnuRXA77BZ5kIXzkULZeABj1qZ5X3OeibR
         8lzizGtsQ8ybVqUgyKDMJf1mM9zUpZFP0FJqs+0pH95UcoDkPq69ZQGFddRuxF/T30mW
         UKl9JD3SGudNSwk8w8Uri8RnZPPzikdQxBwRlzBNfM/hiSlGoPuvs1RnOQX1nN67mbf1
         8QKw==
X-Gm-Message-State: AOAM531YAD3bIjODKEHgAKKkhtnqqDDDRikqvrIrLhOs8AAlnXp5/1t3
	6KjS+rP87L8CLBRZjo0UAJJZSKlQfrfvsx02C/WN/LikoFUbsMWcyB0lYFAZwfsghISwpwC/d86
	0Ntqae2XY1L4Z0o4I
X-Received: by 2002:a05:600c:89a:: with SMTP id l26mr21147114wmp.18.1620398612168;
        Fri, 07 May 2021 07:43:32 -0700 (PDT)
X-Received: by 2002:a05:600c:89a:: with SMTP id l26mr21147100wmp.18.1620398611969;
        Fri, 07 May 2021 07:43:31 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id f7sm10176565wrg.34.2021.05.07.07.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 07:43:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 03/17] linux-user/syscall: Replace alloca() by g_try_new()
Date: Fri,  7 May 2021 16:43:01 +0200
Message-Id: <20210507144315.1994337-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210507144315.1994337-1-philmd@redhat.com>
References: <20210507144315.1994337-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: K+QU9MGEbfs7

The ALLOCA(3) man-page mentions its "use is discouraged".

Use autofree heap allocation instead (returning ENOMEM on failure).

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 linux-user/syscall.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 95d79ddc437..08ab4cee805 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -11417,10 +11417,12 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         {
             int gidsetsize = arg1;
             target_id *target_grouplist;
-            gid_t *grouplist;
+            g_autofree gid_t *grouplist = g_try_new(gid_t, gidsetsize);
             int i;
 
-            grouplist = alloca(gidsetsize * sizeof(gid_t));
+            if (!grouplist) {
+                return -TARGET_ENOMEM;
+            }
             ret = get_errno(getgroups(gidsetsize, grouplist));
             if (gidsetsize == 0)
                 return ret;
@@ -11438,10 +11440,13 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         {
             int gidsetsize = arg1;
             target_id *target_grouplist;
-            gid_t *grouplist = NULL;
+            g_autofree gid_t *grouplist = NULL;
             int i;
             if (gidsetsize) {
-                grouplist = alloca(gidsetsize * sizeof(gid_t));
+                grouplist = g_try_new(gid_t, gidsetsize);
+                if (!grouplist) {
+                    return -TARGET_ENOMEM;
+                }
                 target_grouplist = lock_user(VERIFY_READ, arg2, gidsetsize * sizeof(target_id), 1);
                 if (!target_grouplist) {
                     return -TARGET_EFAULT;
@@ -11736,10 +11741,12 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         {
             int gidsetsize = arg1;
             uint32_t *target_grouplist;
-            gid_t *grouplist;
+            g_autofree gid_t *grouplist = g_try_new(gid_t, gidsetsize);
             int i;
 
-            grouplist = alloca(gidsetsize * sizeof(gid_t));
+            if (!grouplist) {
+                return -TARGET_ENOMEM;
+            }
             ret = get_errno(getgroups(gidsetsize, grouplist));
             if (gidsetsize == 0)
                 return ret;
@@ -11760,10 +11767,12 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         {
             int gidsetsize = arg1;
             uint32_t *target_grouplist;
-            gid_t *grouplist;
+            g_autofree gid_t *grouplist = g_try_new(gid_t, gidsetsize);
             int i;
 
-            grouplist = alloca(gidsetsize * sizeof(gid_t));
+            if (!grouplist) {
+                return -TARGET_ENOMEM;
+            }
             target_grouplist = lock_user(VERIFY_READ, arg2, gidsetsize * 4, 1);
             if (!target_grouplist) {
                 return -TARGET_EFAULT;
-- 
2.26.3

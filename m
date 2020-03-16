Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp250162lfe;
        Mon, 16 Mar 2020 09:07:13 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuE8/RtZAqhzWLFm0XkgRvgVP0i1wXiE5V+VxsF6AJCklNggCP2kFgyx7Y+pnvoll5phuZ1
X-Received: by 2002:a25:55c4:: with SMTP id j187mr409621ybb.67.1584374833020;
        Mon, 16 Mar 2020 09:07:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584374833; cv=none;
        d=google.com; s=arc-20160816;
        b=wLmXhTRTB4Z9jGWXXpZ2WPMS/uTy725sXVHDU+ChbLrAIcYdhQoH5Sd+AswdUv2jCe
         i9y05cgpH6wSewHyf+0D9Ag6FeTkGiP8/Vt/rcm4lbaVlJNZ024cwv+Iqf8php4N1fRJ
         HcECNCj3oSISqXXicRkT41jQb/xajLT0TC09yGWj+x9+41AOajaBgkhVJ4mmW1fF1UTs
         OabTVBTGkbUbuqbQTrb5mneHifUW4MZmUEaiEa0tclCDpKyyHAlxvrnjZ9Trg6uBfiO/
         Wu58v5ANOqbOzPjl2Kgk7PFm8BVaruPxybK3Vr/iVdgYAuEiu0p/OX+0pc5y8z7kmJHe
         zREg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Qw8ssmMAy8/C4B18gVc/ltfDqHgs0GK3VzA8PNnWZBA=;
        b=KCmNPGztuH1Is1NdCB3J57RI6PlBpXc6Y8GIrcv4vBzeNrDU5UmBJxs0I1hsBDT6RO
         JohESVM9WjgnoYA2wLaJuIRwiwqVKUCo3rcvEprfPp6DwhhJKw80JF7+xC7Tud3obPkm
         vqlnwcPP9LR2/2rQ2Qe2KXJ5ZMIywf7xZBOAssF4jQEr+3zFZelwKIyRh7pRViE8Mtcq
         A+Uy1Mqkf0cvkBM2Xyi4T9JjVmSrcMs7tYqiTH3sWAuU6Ysi13H6n6gBH9tsjFnM3Ozh
         8gLxMxCLaqgImoNROdOMG1t08PNilKDeC16ZOLPBTZrubLftRJiVOjpCvXjIfN8Ocu4R
         Sslg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CMdua+mK;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [63.128.21.74])
        by mx.google.com with ESMTPS id m83si158908ybc.21.2020.03.16.09.07.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2020 09:07:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) client-ip=63.128.21.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CMdua+mK;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584374832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qw8ssmMAy8/C4B18gVc/ltfDqHgs0GK3VzA8PNnWZBA=;
	b=CMdua+mKrhZMXwrWR7/AD00HHEZCuwpwIgQiVpscMp0ca+FiqCi+K0+xvZBY90BkFhJDnZ
	ja4PQpr+5x/dE39ukeVXnVAKJs9S8fQRu+fRuzorYGsfpD4iAG0feU1DU7+Aui6Z1ef8JH
	SUc8oPgJEbQC0xa/59fsBsoGBHJUSLg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-T_NlEJv7O02eL-MbrBaq1w-1; Mon, 16 Mar 2020 12:07:09 -0400
X-MC-Unique: T_NlEJv7O02eL-MbrBaq1w-1
Received: by mail-ed1-f70.google.com with SMTP id n11so15713762edi.5
        for <alex.bennee@linaro.org>; Mon, 16 Mar 2020 09:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ro+HCuhG/U1g3lYErsu/yY3mato6cTL6YgdKcF/Jx28=;
        b=cI61torfYkav/QbEa5mjdJ7uk1CCQQ1aOrsx6co2plFWuzIijjX7uOz9GsYjMVurEx
         PlqjrKlx9SPen84060oNot6ho0NGO39syb512LbjZMMrvDxzemfr0Y8yzb/AFFhprpHz
         WuNFt6GiDjXWitNCXmGJGjQ4KmtxSonsx4O1T9NL1L3qfUPfmlYEuCcFmsGTWCqUr5DB
         lcOg2x6gfJoAcBa9PyAdXg5Of61QvEzLpDFgwHPWcL5iS0UdNnxO7Qn7QVa5nT2y+AGC
         8R4u5XyxdOXyio/uueAYOYgvz67wpxolTMZInLadu75Wa+npi2m3FsRN8DoPYb6hc5dr
         e9dw==
X-Gm-Message-State: ANhLgQ3LogcIhH8GDk9z6zkyHrSgSCXz4U9P1G4jgPu0VZWAhqUNLkg5
	PdVnjztlfwMRocJXiHTSw3EDxTUw6cKgF1xze5ZG4fRXc8vkTtGAbd2wgvK8fYtApdSMMz0/dCf
	MzQvV+jwxupL1BSOq
X-Received: by 2002:a17:906:33d0:: with SMTP id w16mr19391051eja.257.1584374825492;
        Mon, 16 Mar 2020 09:07:05 -0700 (PDT)
X-Received: by 2002:a17:906:33d0:: with SMTP id w16mr19391034eja.257.1584374825290;
        Mon, 16 Mar 2020 09:07:05 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id 31sm14913edc.26.2020.03.16.09.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 09:07:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 05/19] target/arm: Restrict Virtualization Host Extensions instructions to TCG
Date: Mon, 16 Mar 2020 17:06:20 +0100
Message-Id: <20200316160634.3386-6-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316160634.3386-1-philmd@redhat.com>
References: <20200316160634.3386-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 0VGfFjbdeMtN

Under KVM the ARMv8.1-VHE instruction will trap.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/helper.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a5280c091b..ce6778283d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2897,16 +2897,6 @@ static void gt_virt_ctl_write(CPUARMState *env, cons=
t ARMCPRegInfo *ri,
     gt_ctl_write(env, ri, GTIMER_VIRT, value);
 }
=20
-static void gt_cntvoff_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                              uint64_t value)
-{
-    ARMCPU *cpu =3D env_archcpu(env);
-
-    trace_arm_gt_cntvoff_write(value);
-    raw_write(env, ri, value);
-    gt_recalc_timer(cpu, GTIMER_VIRT);
-}
-
 static uint64_t gt_virt_redir_cval_read(CPUARMState *env,
                                         const ARMCPRegInfo *ri)
 {
@@ -2949,6 +2939,17 @@ static void gt_virt_redir_ctl_write(CPUARMState *env=
, const ARMCPRegInfo *ri,
     gt_ctl_write(env, ri, timeridx, value);
 }
=20
+#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
+static void gt_cntvoff_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    ARMCPU *cpu =3D env_archcpu(env);
+
+    trace_arm_gt_cntvoff_write(value);
+    raw_write(env, ri, value);
+    gt_recalc_timer(cpu, GTIMER_VIRT);
+}
+
 static void gt_hyp_timer_reset(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     gt_timer_reset(env, ri, GTIMER_HYP);
@@ -2976,6 +2977,7 @@ static void gt_hyp_ctl_write(CPUARMState *env, const =
ARMCPRegInfo *ri,
 {
     gt_ctl_write(env, ri, GTIMER_HYP, value);
 }
+#endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
=20
 static void gt_sec_timer_reset(CPUARMState *env, const ARMCPRegInfo *ri)
 {
--=20
2.21.1

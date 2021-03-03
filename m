Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5580387lfg;
        Wed, 3 Mar 2021 10:27:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9xRzAD8Svf0LdQMDMuOMB5VDPhk1pi31XLbxqa2dX46jfteqdAl4qVnp1eeQWfYd9GINP
X-Received: by 2002:a6b:c881:: with SMTP id y123mr399402iof.152.1614796042974;
        Wed, 03 Mar 2021 10:27:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614796042; cv=none;
        d=google.com; s=arc-20160816;
        b=zJbfoEteyHE3PV8jzlbwJB/ldYRE18Fe5eenjmTlfr8SeBPfPKSsQCWtimk2UZaabY
         PgNxkrLDPHXxmwqdImK9YTsqIfBafLXtnh66J89DlaolTFmK52o/fPTwBQnhCyUiTKdN
         NNC8KSA7GP4BWwROjN8JI18gfDEC5IDkaZYUgGAdZ7tLxrKp1018IJYixBrNHq+6KLqC
         +kcHVpYUt4TekmdYSna1Nb+vGDdGOPuaJx0xIUkVXRTBS3lmKTsmWHRA5AuCvCrEl2u+
         3Ynic/TUZfAGyjwUYWKeEg9KaVkMr9MYwDplaiRyYa4ODK5WeF9fvE2hhMQony1rogOO
         Iz3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=d+d/MBqh7nLsyh5fOlU8/TcU9o+BUbPZsFEks8VNenw=;
        b=Sha30Gug41DAaT9Lb52JT1knU3beTnaFq0fSKvR/jkf8Tp+orsYa4mX3NehucmIawP
         NMy2hAj/CQbEfWtZ2OO/7vj8L+cXUAh+P6s9/8GxQfVCNOdRn7am7uY0pY+h7clOWJvS
         e/pxt3CgGflPTEhmLHxMeRHN50mcJxxoIRP6X152wci/8FAuXiTJs3Xs0LP1KdnnvhYt
         Wy3B/lMs5enR1VJqUkYiFFvLroAGhfx2ScAOWfcdynU110+OwdpkWSfIpwIq5W5N7rPK
         JkE03tm//2UB7WQgCH4jAkBGSMrTmjOgVPq3JHiGdZTX1AWWaKUb9u/VtC6eNzQa5eUz
         v4pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GzI6C4Cv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k11si22188182ilu.146.2021.03.03.10.27.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 10:27:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GzI6C4Cv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHWDS-0004UG-9P
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 13:27:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW9S-0005h3-W4
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 13:23:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW9R-0000e5-8Y
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 13:23:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d+d/MBqh7nLsyh5fOlU8/TcU9o+BUbPZsFEks8VNenw=;
 b=GzI6C4Cvsc/uzKqojbgkkOx7lG84W1PnvcKN3CNzl+VHGduN/6qzMRgZvgE2WoabQUWA1z
 2jzir/JlKH2kMzfUiOmmgHKreY5K1ytNAnK+jWSbeQzdZ3ci6zhW3TbaKA6axS4k8QjMpW
 Hnk7McH7i+2ze43e1tHoiJUrmv4oO7s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-EYO-yth3M0SQSLzB3Qgk7Q-1; Wed, 03 Mar 2021 13:23:07 -0500
X-MC-Unique: EYO-yth3M0SQSLzB3Qgk7Q-1
Received: by mail-wr1-f72.google.com with SMTP id g5so13094473wrd.22
 for <qemu-arm@nongnu.org>; Wed, 03 Mar 2021 10:23:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d+d/MBqh7nLsyh5fOlU8/TcU9o+BUbPZsFEks8VNenw=;
 b=sZ/iwHOPfiCG6/tXKIyXYr896QKzwqBTZHq5F2ncmyP6KcKMpO8/6XtOOKiehuyHIp
 e5vS9J1lOr1GznJkJIARw8GlKYGEL7KD0kQLMt/k/GWOszsWdw1ioMyb1j2ap04MEJv4
 ABNiQZsv8xkhbqLZKIoqD/BK8egQ3Vw/ShFSZZNHX81pXaNaoBj/2eYvTAXwqAQOFk0V
 fXtoxJtq0orMHCUU6gtYc6WGEsgks6QlGY8zK3rfD8tDtXtvzJ6iJEej9mevXQZVwR2G
 B76noz1zSCXBU17gH512Ts5tao4qpBbqph9TeuZFMJCK2EFDSBZ3lkhCYBPK8ja4xvaW
 WgTg==
X-Gm-Message-State: AOAM530mHOne8RzAXwVCjD3/XhTIt7vwvgAqmVJduTh58/ikLFfeO1dt
 A44WyZ9lKY3+hKadwdZSIBOsLpZ1bGj3i06uMnObbsAeiDLLou1djQbjYl+P5PHijllCPm5fpN1
 yhCF/i/13iglW
X-Received: by 2002:adf:a2cf:: with SMTP id t15mr14838wra.250.1614795786894;
 Wed, 03 Mar 2021 10:23:06 -0800 (PST)
X-Received: by 2002:adf:a2cf:: with SMTP id t15mr14791wra.250.1614795786594;
 Wed, 03 Mar 2021 10:23:06 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a3sm33245959wrt.68.2021.03.03.10.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:23:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 07/19] accel/whpx: Rename struct whpx_vcpu ->
 AccelvCPUState
Date: Wed,  3 Mar 2021 19:22:07 +0100
Message-Id: <20210303182219.1631042-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303182219.1631042-1-philmd@redhat.com>
References: <20210303182219.1631042-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qPdFTiWbC872

The current 'struct whpx_vcpu' contains the vCPU fields
specific to the WHPX accelerator. Rename it as AccelvCPUState.
We keep the 'whpx_vcpu' typedef to reduce the amount of code
changed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/whpx/whpx-all.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 6469e388b6d..f0b3266114d 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -148,9 +148,9 @@ struct whpx_register_set {
     WHV_REGISTER_VALUE values[RTL_NUMBER_OF(whpx_register_names)];
 };
 
-typedef struct whpx_vcpu whpx_vcpu;
+typedef struct AccelvCPUState whpx_vcpu;
 
-struct whpx_vcpu {
+struct AccelvCPUState {
     WHV_EMULATOR_HANDLE emulator;
     bool window_registered;
     bool interruptable;
-- 
2.26.2


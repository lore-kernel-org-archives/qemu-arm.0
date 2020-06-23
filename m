Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3983999lfm;
        Tue, 23 Jun 2020 03:51:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZwe2g3ErlX2raWclUnHMuHKM8VdgE33P+XkbxWcSwAyKqjhoX4iPrLXR2qYfiy2+zzqtY
X-Received: by 2002:a17:906:b6d1:: with SMTP id ec17mr15914662ejb.486.1592909482978;
        Tue, 23 Jun 2020 03:51:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592909482; cv=none;
        d=google.com; s=arc-20160816;
        b=k0hwWVDWIHJfrlarmx2sj37fAEE9BPCGB7sE3FCKULArU18uJZ39wT3lSUgk1J893k
         tdcVmjKkIeXGVcYQCDRcCsMNzQYbdAvj+rQspYwrO8cziRjFQX7Gez6hug8F1tJ2yNiW
         P35ruQi2KZHbgkn7mXIunimGvFDyFDq3VgbdDwpKT2gaDeTn3F+ysnuF17U9/XTeMNwB
         lXXqE7VND5NzGDnkwJZpxT2W/rfVurCu2YauEw9tpebySOmtDdhiMv9oZ+hHNHUIHqJ2
         H2NCH/akR3GDq5sjxwi51Zjdog2/+S16llIwbYB7NE13tfoZdWoRwgHvh1RkmISqCmPB
         886Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=HfdDklJm7xq7V0EjioTwWRWt93bUpNOFzkHuwwNGVEE=;
        b=GJ4k5jnw864LluDgEa8h/d7M6KMt9emXL/bKC3jyBkH8Cw8kml173+3ryicVuXENnm
         +LyTQkDCW+ZGzhogdHC48y9YqvWxF21/CMN5n0+tbNqFecxpqoWO/FVVvyo1o/RpDMAh
         EuffRS0Ldg7D/geR6/7BlTpwy/Teusowk2vAIMVlUQdmX6sfP2u37R71czbGGnN5vjqP
         H10NWmfZD7TirLWiGGOpRLh+djdnp71RwTKtXswY+4rP6AoMKDuXzbfNBt0n4eyrxpOd
         lajZgvgOeYufpvvgldn04bAYHlI4n7f6ps+MpWfVXK+89JjCQi1zQG+/UXd45/YeTQRU
         3s3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WoTyA9r7;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id nh7si10369109ejb.155.2020.06.23.03.51.22;
        Tue, 23 Jun 2020 03:51:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WoTyA9r7;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732274AbgFWKvW (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 23 Jun 2020 06:51:22 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:21698 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732254AbgFWKvQ (ORCPT
        <rfc822;kvm@vger.kernel.org>); Tue, 23 Jun 2020 06:51:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592909475;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:  content-type:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HfdDklJm7xq7V0EjioTwWRWt93bUpNOFzkHuwwNGVEE=;
        b=WoTyA9r7uLfEilHBz+fpdwN8EH7vzxqrL0d+Mv67D7e58sZhUE0HFft2uT9E+q5VAKtIb+
        mNO/yX1xODK89ExmnGM0rRd44Plgb0S7gkD4h4g0mk242VkJ2pkKEcWjGgAZLtyem5GSNf
        8c59iLPMSfJW2c2vlUk0tYc0LqhnQoE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-6PE5JuuAObWiCp-9pq954A-1; Tue, 23 Jun 2020 06:51:13 -0400
X-MC-Unique: 6PE5JuuAObWiCp-9pq954A-1
Received: by mail-wm1-f72.google.com with SMTP id l2so3486737wmi.2
        for <kvm@vger.kernel.org>; Tue, 23 Jun 2020 03:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HfdDklJm7xq7V0EjioTwWRWt93bUpNOFzkHuwwNGVEE=;
        b=dmpUGaTJYjX4SkKff0eBXeVM3rTvQtIVILd2qBlx0KT9UfwZShuXiaUFyM6X9MTxFW
         GpjKJChtaat/ZnQqdeH+tT+O+Zb4hg+Rf1WpSJ4VPZ9xYtSUO0i+YUD4zkIC6Xobnk/x
         aIg5GovXEkkJTzGZPAIHtn1e+8TQX4VTHCrphSvvfBeQ5UEYn9wuGeQ2Acv9KbteD10m
         iijUyz0wRwaAq8IXv/nbQi7tEvyUgu3GWe5Ct3Waz76tqJ8kq2q/BrEOtPlGXOb4HXBU
         XDFYz7lBwwuugLlYfzkh7ZEUa3u7O97T7R9kE2nNIfZz9npjRB7fhoOfwkBp5ymKbcEX
         bZ1w==
X-Gm-Message-State: AOAM532JHERPH1/a6lE2g324r8Xf+YhsHR8yKaU4gzwSuYoQBfo2gXQP
        3KAaHaF3gpBTcceyro91rc8oEGL16tmMyiujClkbDZmPm7X7dac+1//v7slUaX7mlRtEATC75KG
        k2qDXKzONkfn9
X-Received: by 2002:adf:f889:: with SMTP id u9mr26631714wrp.149.1592909472558;
        Tue, 23 Jun 2020 03:51:12 -0700 (PDT)
X-Received: by 2002:adf:f889:: with SMTP id u9mr26631685wrp.149.1592909472348;
        Tue, 23 Jun 2020 03:51:12 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net. [83.51.162.1])
        by smtp.gmail.com with ESMTPSA id p13sm11583726wrn.0.2020.06.23.03.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 03:51:11 -0700 (PDT)
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To:     qemu-devel@nongnu.org
Cc:     Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        David Hildenbrand <david@redhat.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Richard Henderson <rth@twiddle.net>, qemu-s390x@nongnu.org,
        David Gibson <david@gibson.dropbear.id.au>,
        Peter Maydell <peter.maydell@linaro.org>,
        Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>, qemu-arm@nongnu.org,
        Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Thomas Huth <thuth@redhat.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 3/7] accel/kvm: Simplify kvm_check_extension_list()
Date:   Tue, 23 Jun 2020 12:50:48 +0200
Message-Id: <20200623105052.1700-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200623105052.1700-1-philmd@redhat.com>
References: <20200623105052.1700-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: cKEv2vwly4AY

The KVMState* argument is now unused, drop it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 accel/kvm/kvm-all.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index b6b39b0e92..afd14492a0 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1088,7 +1088,7 @@ static int kvm_check_many_ioeventfds(void)
 }
 
 static const KVMCapabilityInfo *
-kvm_check_extension_list(KVMState *s, const KVMCapabilityInfo *list)
+kvm_check_extension_list(const KVMCapabilityInfo *list)
 {
     while (list->name) {
         if (!kvm_check_extension(list->value)) {
@@ -2104,10 +2104,10 @@ static int kvm_init(MachineState *ms)
         nc++;
     }
 
-    missing_cap = kvm_check_extension_list(s, kvm_required_capabilites);
+    missing_cap = kvm_check_extension_list(kvm_required_capabilites);
     if (!missing_cap) {
         missing_cap =
-            kvm_check_extension_list(s, kvm_arch_required_capabilities);
+            kvm_check_extension_list(kvm_arch_required_capabilities);
     }
     if (missing_cap) {
         ret = -EINVAL;
-- 
2.21.3

Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp8409265ejc;
        Thu, 2 Mar 2023 08:31:15 -0800 (PST)
X-Google-Smtp-Source: AK7set9PerKmGSqlRWfS7WoqXXrbMW6GsQK2hebCSHch1VCqQcjGBz/wArt5c0s8pd5EPl6BftMJ
X-Received: by 2002:a05:6214:20c4:b0:56e:a88f:70ef with SMTP id 4-20020a05621420c400b0056ea88f70efmr22966181qve.23.1677774675435;
        Thu, 02 Mar 2023 08:31:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677774675; cv=none;
        d=google.com; s=arc-20160816;
        b=uttjpiPvO/3ybPv3ckLScrkTjBHa0q6fgXhlABl2q2VRqewhoW9xud132Q5c83+1B9
         PXbpK+KJLiGkYRGmuE/EipA2loauP6F3gcjvhlJwY/oxAH0uZpRdBx6dLO4xf/hzC269
         fNmeu6kSwrZSra25xczNMG+hHmSpVLDI09C7rsCYwDiTC+YMYrUxHGAXu6fShFOWaH/K
         n/i8SiOAmcKM6xDrLgxPhHbgUGaAs6FKzjQ+EI7KPumdn+BKuB2bQJa0bPHNVrf+8QjY
         eEjMNFKLmNPsCYJn8cCl86/ib0aJRH4BGtSwLGA5KDWobD3Afr8xwQPi5Wu/ziEQotGG
         u3hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mrgkRdNE+AcdsZ+zHYLBFAXiQu5tjayM7At8EKmQNNc=;
        b=SM6wAKeGWBem+Dhv7qiR6U8GOqj0YhtJYodP8ukmYxuQAMEpyk2MVDj8fe4wwc+ypM
         jgpSH8q8Kkwx2DEbQzKUsK8BOk4ON90YMgloM250V8ob+OBFRz+8ptDuA6RlgAPwsqlZ
         UJ02WVjfBJkgAhbA687r/RXmP51LspL9idtNMOrsgH38PmSGNW+a/cgCwYscZZ3rYXz7
         KhOv/+J70rlVoYm5rdeTf3vxia7BBDbXauW8NfIsyzcz1Qsq+68XPIncq054nyKvouiM
         jmOxmKZTAG1RXSg7phs90GhuEjhyHCl+bSAfKFy0bIqvvGgFUoPi1CXbZ1iYUa2bTcaS
         6B1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J+8NCMDx;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id c145-20020a379a97000000b0071d9bff7703si13300084qke.329.2023.03.02.08.31.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 08:31:15 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J+8NCMDx;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677774675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mrgkRdNE+AcdsZ+zHYLBFAXiQu5tjayM7At8EKmQNNc=;
	b=J+8NCMDx7Z4vDSmg+MQcdvTF71JD4DNVbxV39lEBh6cyxMdfbXMUncK9VkdO5C7K5LoITO
	JyMAiqRJwlo1uci4MIBuwjaDPwA7krp0/rH3wehFS4HWgBWxIyCWG3xVje1J1IFEXM2mrn
	zWQLVyhU+hmV6Mp7K9Jmr5pUFhh5qX0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-YDXKNcPTNsmtB1atJEVCHg-1; Thu, 02 Mar 2023 11:31:13 -0500
X-MC-Unique: YDXKNcPTNsmtB1atJEVCHg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25DA51C04349;
	Thu,  2 Mar 2023 16:31:13 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D9A7440B3F12;
	Thu,  2 Mar 2023 16:31:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Daniel Berrange <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>
Subject: [PATCH v2 1/6] docs/about/deprecated: Deprecate the qemu-system-i386 binary
Date: Thu,  2 Mar 2023 17:31:01 +0100
Message-Id: <20230302163106.465559-2-thuth@redhat.com>
In-Reply-To: <20230302163106.465559-1-thuth@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: RjzLUqK+fCO9

Hardly anybody really requires the i386 binary anymore, since the
qemu-system-x86_64 binary is a proper superset. So let's deprecate
the 32-bit variant now, so that we can finally stop wasting our time
and CI minutes with this.

With regards to 32-bit KVM support in the x86 Linux kernel,
the developers confirmed that they do not need a recent
qemu-system-i386 binary here:

 https://lore.kernel.org/kvm/Y%2ffkTs5ajFy0hP1U@google.com/

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 15084f7bea..11700adac9 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -34,6 +34,18 @@ deprecating the build option and no longer defend it in CI. The
 ``--enable-gcov`` build option remains for analysis test case
 coverage.
 
+``qemu-system-i386`` binary (since 8.0)
+'''''''''''''''''''''''''''''''''''''''
+
+The ``qemu-system-i386`` binary was mainly useful for running with KVM
+on 32-bit x86 hosts, but most Linux distributions already removed their
+support for 32-bit x86 kernels, so hardly anybody still needs this. The
+``qemu-system-x86_64`` binary is a proper superset and can be used to
+run 32-bit guests by selecting a 32-bit CPU model, including KVM support
+on x86_64 hosts. Thus users are recommended to reconfigure their systems
+to use the ``qemu-system-x86_64`` binary instead.
+
+
 System emulator command line arguments
 --------------------------------------
 
-- 
2.31.1

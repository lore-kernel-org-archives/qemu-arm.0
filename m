Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp744116ejb;
        Wed, 6 Mar 2024 12:35:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUfpsUy1gslczwy8bSLukt8uxSErUniB6H1+6nOKEPqKFo/dM/OOwoXjmc2fTgY0PWey7cP8ViihZs10XKnYIshEfJe+5ll
X-Google-Smtp-Source: AGHT+IGQc2J7Ab5RPg4qFPpGWSM0LsDkL8l44RSaL6qoxcA7FT+2WEs04Zy8hMtiddFYjM+humHH
X-Received: by 2002:a05:6214:51a:b0:68f:e7c6:a48a with SMTP id px26-20020a056214051a00b0068fe7c6a48amr6409870qvb.58.1709757343286;
        Wed, 06 Mar 2024 12:35:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709757343; cv=none;
        d=google.com; s=arc-20160816;
        b=turPzGns/8QrDI25BtlzmVLyx8p7jbPt936ATENkkJRdgeRx/ujzZSTReH2Nt1gvkR
         vmpG+4rzs8qRVI45OEJEwU9YBZ9i2QIcIltMUc6kv0PHbi1Mi6+sOqrLcOSWv1B158If
         lMksUIZv3yjkEnsg04OsV7fdxNsR1/wq7qvh25ork/VFFbWH4AdrfsQEax0QM9vbYekJ
         6co3B+EGLPBZi3nIXxapDWU6vnPiY25t0WlsuQ5LLM+lV2FS4k5n9e/wfMI3cqxW5z6p
         83x5PlanA+bysg8/u8F5lFXCezHP1MsNQVQyHC9BLeADExC0sDhv+fl+2346AGv4O9oa
         a46w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qNjqP63Eeycrewa8Jj4wem7P+RbfIAVckxR+16X/ZBA=;
        fh=RVuuaU7Ghp1omAcM/aHHQKcSvJxs+IjfJSTvOY2eDr8=;
        b=BxV+eveosl7zAhbElwix+mCnUZhQkfj1dfwteythY47eEvMt9N27t0KQQacfK3fc3Z
         58/7OTazTQ2UZXVmhRg4etWgNjyXA/so+Rhx7G9/catG9iSOX29ZGFjNU5NCGR275+uL
         jBksbhXxrUPHbGpyS7NldzNQW7h/j7/yuv971qmQZ8tEO4Mi+BPRZPCNM9TQYrWyY5uW
         3biHjLpoVo+Ruk9TP+6mv8Vr7O9YIjFg7m2wHeL51WXR/MSbXj560vPAhBY66Nx8Ccmd
         OUsi/1XToChURhem4Lfg6j4M20+IgmRnY75uylHRJVKwdN34LNmY9swzBKoerWxvjbJJ
         2Tgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F+j1icV9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qo9-20020a056214590900b0068f8c14f14esi15111896qvb.570.2024.03.06.12.35.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2024 12:35:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F+j1icV9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rhxyX-0004fB-7S; Wed, 06 Mar 2024 15:34:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhxyD-0004Ru-KG
 for qemu-devel@nongnu.org; Wed, 06 Mar 2024 15:34:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhxyB-0001rl-Am
 for qemu-devel@nongnu.org; Wed, 06 Mar 2024 15:34:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709757270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qNjqP63Eeycrewa8Jj4wem7P+RbfIAVckxR+16X/ZBA=;
 b=F+j1icV96U2IAQ26hHyWMcMDjR0izQFcNTAcz/Lkj+zRxp9PxGZ52ZgCl2ywr56qLgzTUL
 /Zbv3QJMc3wkSY9OjvUsHEn4ynsyzT4lISFYLnz2WDPsBMqHIhEwdIyRgEz5Ku44M0TLF/
 ignUzm0tWL/NWhZAn899/bGnotB6Hj0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-XYM0yGA2Pz-HuEishwvWgw-1; Wed, 06 Mar 2024 15:34:29 -0500
X-MC-Unique: XYM0yGA2Pz-HuEishwvWgw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7144B85A58C;
 Wed,  6 Mar 2024 20:34:28 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0AEF637F6;
 Wed,  6 Mar 2024 20:34:24 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 imammedo@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [PATCH v7 9/9] qemu-options.hx: Document the virtio-iommu-pci aw-bits
 option
Date: Wed,  6 Mar 2024 21:32:48 +0100
Message-ID: <20240306203348.65776-10-eric.auger@redhat.com>
In-Reply-To: <20240306203348.65776-1-eric.auger@redhat.com>
References: <20240306203348.65776-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.365,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nzbC4ZuoM2Fp

Document the new aw-bits option.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>

---

v4 -> v5
- tweek the aw-bits option description according to Cédric's
  suggestion
---
 qemu-options.hx | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index 757df3eac0..87959ede08 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1180,6 +1180,9 @@ SRST
         This decides the default granule to be be exposed by the
         virtio-iommu. If host, the granule matches the host page size.
 
+    ``aw-bits=val`` (val between 32 and 64, default depends on machine)
+        This decides the address width of IOVA address space. It defaults
+
 ERST
 
 DEF("name", HAS_ARG, QEMU_OPTION_name,
-- 
2.41.0


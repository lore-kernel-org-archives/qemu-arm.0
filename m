Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp29251ejb;
        Tue, 5 Mar 2024 10:08:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXqrOA0V8t8NP62JJqnngOL7VzQhZxFIE4A5lohbYdOHQWOQDctSGWaeKd1ljegzy3rD5cDMRT7WrzhK0vgNxmRajCxJfVr
X-Google-Smtp-Source: AGHT+IFuOrJgrIMwlfj1zIQ4O4fBuczDcVoR/WdjBr/tkqTgD471b6LQATkf/CZ9qm4+Tra8k1yj
X-Received: by 2002:a05:6870:c391:b0:21e:8afd:65d0 with SMTP id g17-20020a056870c39100b0021e8afd65d0mr2726322oao.52.1709662125070;
        Tue, 05 Mar 2024 10:08:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709662125; cv=none;
        d=google.com; s=arc-20160816;
        b=lKFfofaaHkogr+TAkl8M/CEtDCJ6GHJZADGFP6+9R3BmGbC1MB0k3sDzCAbC3b7QeU
         c31oqdsmpF2Du8HEQytZpmz+JO8ENHrwdrEwBE32zkvcB0MRC8EA7Z5U10W7YGeFDUjt
         pCCw1pk4ulKd18022lu1d8Nd3gkjZP8TgxHXnGSark8pKe1+eW3VSJs18rxLjuVmVtUz
         +5GqB0CDdY+T7LdRONPME78U8RApnPrnFd1BYuvhFKyIOEYfJUbJE/Dlfu2V+pQy+DpD
         CqVnycKq9HtcHJGA/JED5e+qauumeXYgf0+PlLbTQ0tIXxSkmmJGhT2QhLfmsa4eOB7K
         /w/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qNjqP63Eeycrewa8Jj4wem7P+RbfIAVckxR+16X/ZBA=;
        fh=RVuuaU7Ghp1omAcM/aHHQKcSvJxs+IjfJSTvOY2eDr8=;
        b=nEiTkKOhBK28BlPagEjNgilQqZTKSta3tLZjb79cCCLgvMPJBveZ0Gy9CQjZqOIQu4
         b3eRpmv2OYIPXbL3BcAtIVxOpLBRTRd6N6n1rKv4+BhWyFDhhT8LJFT5Z+Bc9ECGyqYD
         pLYF3b1ZMBe524i25vZOY80VXqlNwzLlHO8/S0f7cUGy+tU4RE9m5sctprsX69BBMVZW
         dBdqdY8bt05T9l6lZqVNT5Uz1vAz8okLncsIveT8dNm3PRk4+yoOfdyTwHG0JAl97p1j
         4RCnfZlrQpH/UnUJybpzqseKs7fJTmtAwtuLCb2xmYHB73Ff//TvAEoG/dJhBTbMohD2
         u/vw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h6xxeM2U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10-20020a05622a14ca00b0042ea8a596fasi12817722qtx.171.2024.03.05.10.08.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 10:08:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h6xxeM2U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhZD9-0002D8-Cl; Tue, 05 Mar 2024 13:08:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhZD8-0002CT-7L
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 13:08:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhZD6-0000Ad-N7
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 13:08:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709662096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qNjqP63Eeycrewa8Jj4wem7P+RbfIAVckxR+16X/ZBA=;
 b=h6xxeM2UtAzD05DhCBbG+tfVH5az4tb6o6TyhetWaiQmP0ZKXwJ4lnKukFes2FsF+3bV+z
 gMLrjq2DTluEYbzPHsNugNKv3V4uDZaJdixifWYvWQwrekIGq15Gv2VUnv3ytonO9juqZU
 UApbWYs3z5GksQU/3P8Q2oHuMlaOGkE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-680--aDaVVGoM8KqUElj3ow_JA-1; Tue,
 05 Mar 2024 13:08:15 -0500
X-MC-Unique: -aDaVVGoM8KqUElj3ow_JA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EF433C0244F;
 Tue,  5 Mar 2024 18:08:14 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 277F0C041F1;
 Tue,  5 Mar 2024 18:08:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 imammedo@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [PATCH v6 9/9] qemu-options.hx: Document the virtio-iommu-pci aw-bits
 option
Date: Tue,  5 Mar 2024 19:06:27 +0100
Message-ID: <20240305180734.48515-10-eric.auger@redhat.com>
In-Reply-To: <20240305180734.48515-1-eric.auger@redhat.com>
References: <20240305180734.48515-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YraoZ+EdnRuK

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


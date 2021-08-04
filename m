Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp3529673lff;
        Wed, 4 Aug 2021 07:38:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSgWhW9gjvc4LviTF9Z8i9doJvUY5qe/Mwydao7gv+MRMqZJIiWuwYJC7P1fPbxzPq9hv3
X-Received: by 2002:a50:ae02:: with SMTP id c2mr6239edd.307.1628087937713;
        Wed, 04 Aug 2021 07:38:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628087937; cv=none;
        d=google.com; s=arc-20160816;
        b=esvjU/CfrTDx/pG7sLvFrTiC1rbqTby01qVW6jBlto/LU/mnERUks9Dwlo9wIeqQpP
         QSTncVqdFz3oxKjrpHgbHcuwjeb2aUeSkzovD3ifwCQ8ztAp4PJq4E8bi5K1wwVBDHFe
         0U1+8cwg5IMKGm6NN0mPeaXQjO4o6ucEfXu13PubbRi5V5FZuomA5uepJRKyxgoN8u2o
         q0Uno2PqHQ/WfHhXOi4LyjwaMc5h+u89iSZzApEPVHsk7HNtVMRDXHYuf06T/1zso4c5
         p+wTRinAhBlfqDa5MjFbKmkozeBrIN/PocIT1EfV6PywL+4YG0tqmVB15Tn/RpLOtNlj
         nt6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ID4eJKeFCU1jDGWPcFugCiGy48N8LXMFzyV7irsSVfI=;
        b=BaBC2ioA6BuGQbNWL5y2Hn8DkZV/I/Ol4MOVhPpUYJXqHhKphUctJTCl78tvqzqadL
         JjGf72MWN0V+TgmsnzHKm3jDYYLBLMxJd0orTdj3fGd6eHVppS+m7nGBRfA2Z+WB4BRt
         jzFt3gBWr4V5mis3AFHqqK+NsXmthpGOm/mnfQ/X/NMtqHF/pnHYfgnwlSPve3JxTE1c
         XEvuwU3pUUOUTS5ciGF8gNRiPosIf2I+yObt3xeQkaewRZijwFMaZd8qVyNvbTAlTlgF
         stuLV9dbtacStXc8vTPm/648y4Mr8bVeyfApLIQ7uQvITKeCFAFCc98zKQTIdFi7mCcP
         s8lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W+XSRM1s;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id x16si2271818eju.572.2021.08.04.07.38.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Aug 2021 07:38:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W+XSRM1s;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628087936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ID4eJKeFCU1jDGWPcFugCiGy48N8LXMFzyV7irsSVfI=;
	b=W+XSRM1s63grKs819Ix8rSAaQwK1jczGxrFoOfL1Ph7sEbslKKBjF7ky5BNG/B8Xjr81lJ
	YzX/+8M1fQ6tgR1WSdvlUG7vNOUmM93xORsB5kXxIwYe4dvph0FI1BKnGbtQvl0m+I3CwK
	0L0YFYrRrc0MuByztOQoX/wRqvHnuZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-nJsJhA5FPLml8IiI4V9Hzw-1; Wed, 04 Aug 2021 10:38:55 -0400
X-MC-Unique: nJsJhA5FPLml8IiI4V9Hzw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D6B587D546;
	Wed,  4 Aug 2021 14:38:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0C6C10016F2;
	Wed,  4 Aug 2021 14:38:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 445EC1800987; Wed,  4 Aug 2021 16:38:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Cornelia Huck <cohuck@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 2/7] tcg/module: move hmp.c to tcg module
Date: Wed,  4 Aug 2021 16:38:21 +0200
Message-Id: <20210804143826.3402872-3-kraxel@redhat.com>
In-Reply-To: <20210804143826.3402872-1-kraxel@redhat.com>
References: <20210804143826.3402872-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: MDP4oiqve6Zs

One little step in moving more code to the tcg modules.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 accel/tcg/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index 137a1a44cc0a..d4df7681a811 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -15,7 +15,6 @@ specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
   'cputlb.c',
-  'hmp.c',
 ))
 
 tcg_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
@@ -23,4 +22,5 @@ tcg_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
   'tcg-accel-ops-mttcg.c',
   'tcg-accel-ops-icount.c',
   'tcg-accel-ops-rr.c',
+  'hmp.c',
 ))
-- 
2.31.1

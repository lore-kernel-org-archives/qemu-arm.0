Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp3529715lff;
        Wed, 4 Aug 2021 07:39:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDY8L0qPMubMglp6QDK+5ZTvDNZk1hK6ttEUdH7JleSZmllWyNd0C5FCbdjEP/vaeT9hNu
X-Received: by 2002:aa7:c956:: with SMTP id h22mr49205edt.378.1628087940916;
        Wed, 04 Aug 2021 07:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628087940; cv=none;
        d=google.com; s=arc-20160816;
        b=jVp3pXqi1KwQ0Ia/PCMdfSEuwqwA8+ea8JPFhMFQ0rsxRgenXWJp6PU7wBNSFk8Iaw
         /wmzNCxVsnNzf09qbLZi44Xa7ovruxLW688qtdzu2mf7x6F3/MAvopKkp1VoY0xvZJKD
         +1qO6YJpXdFybILrYory3Bv0fm1n5/BP1t59wmhwJP+fQNHfCT/GKp6IL4t9EDRXf6kY
         vQeTFAsqoUg6XSPisJqsSRS4aZYxJXSU+3e404vb5U0tQoeiyfdgvyqJ+i2as4ccRYh3
         F/ewgoRxWb29QfTPzjSPZgF73SttTdhJWz2CX6usPtkqOhtZyCpfL/kbRusAXBtUXtj5
         vAKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8U1SKWGw1xnNDqeRXwc1VsK0/bxw++iEeSSjki5yPZk=;
        b=yrjJC/29y0gCYjs+SNM2Dj3sRCbSygy6wAf/5iMvT84bYPxS14CfdvYHHx5NEDFghA
         WCADQFA1abVgw/3KsiaL8d6szgN0lm/84g9q3e1GM9r+jBYwXsl/ENLXH4yVQK6mHejt
         bpSZucaSxKHhX7irSrE/wav76O8xSC+MuR/Pao4uONjttlApvF3Z+5lKDVJUGuu+yky+
         75T96RMWLE7rMgeLZofmLvme8UUjh/xowTt6CvwT/k/wnYbOSjmyyEWueu+9AraElrZI
         ofCVY832Ix/5abvG1waAJ43A0bw+kbeRzdTFNz/byZHFJUKkgc+q7ebmKq48ceiEV5Jh
         R/cQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QVY/s/E5";
       spf=pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id s5si2204515ejd.706.2021.08.04.07.39.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Aug 2021 07:39:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QVY/s/E5";
       spf=pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628087939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8U1SKWGw1xnNDqeRXwc1VsK0/bxw++iEeSSjki5yPZk=;
	b=QVY/s/E5lwry8ME9mZBPjf4HS8QxgOEhEF3Zsr/UrssIM50IoNpHXjK2zEinTlYe8Cjn6M
	Vl1VMQJpwwoKmMH3/l2qoOL4k2SSbzxN7s1Iu+uPUiKve0XvFNttzZcz+odq+tFXbVPIhN
	bdPgh0v3LZzJLVhM3GsHyYAQbyZzHWY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-8TVPUFbYNkuiPFlePgtLUw-1; Wed, 04 Aug 2021 10:38:58 -0400
X-MC-Unique: 8TVPUFbYNkuiPFlePgtLUw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6519B194092E;
	Wed,  4 Aug 2021 14:38:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEB96177C0;
	Wed,  4 Aug 2021 14:38:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 500361800989; Wed,  4 Aug 2021 16:38:26 +0200 (CEST)
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
Subject: [PATCH 3/7] tcg/module: move cpu-exec-common.c from tcg_ss to specific_ss
Date: Wed,  4 Aug 2021 16:38:22 +0200
Message-Id: <20210804143826.3402872-4-kraxel@redhat.com>
In-Reply-To: <20210804143826.3402872-1-kraxel@redhat.com>
References: <20210804143826.3402872-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: 3Ae475giUHzH

That will build cpu-exec-common.c into core qemu.
Moves tcg_allowed variable and some small glue functions.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 accel/tcg/meson.build | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index d4df7681a811..c1ee9dcaed1f 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -1,7 +1,10 @@
+specific_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'cpu-exec-common.c',
+))
+
 tcg_ss = ss.source_set()
 tcg_ss.add(files(
   'tcg-all.c',
-  'cpu-exec-common.c',
   'cpu-exec.c',
   'tcg-runtime-gvec.c',
   'tcg-runtime.c',
-- 
2.31.1

Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3378919ejx;
        Mon, 5 Dec 2022 01:55:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6sTXvWn1ut9/FtAEWdrh9pVH7jh03ppOUSP5xhC9eAnZq42mZlC2iKD9IIkTvye49NvBUX
X-Received: by 2002:a37:f516:0:b0:6fa:118:11dd with SMTP id l22-20020a37f516000000b006fa011811ddmr55277050qkk.586.1670234136967;
        Mon, 05 Dec 2022 01:55:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234136; cv=none;
        d=google.com; s=arc-20160816;
        b=NV1dlw+obhqyrX2BL8zfI5AckNysD6R2YEZryTZNchjRC4sZbg93ix6JBrTPp1lo6c
         E1H3pche4Cqll0eQDZsz/D619+mHHdo41OKwdEUQuO7yd3Fb+/NP4KcidmuHonodMSVo
         AbO08OwUxY2pI6Twl2h2FCDZ19tMGVqQTR/hu4qYORteXJq3OmOkaq442X5uYMk8Iujx
         nutMU6GzuEtoglQH1JfQIpL2H2fOGo9vWerzlCagzqPCRkh6F/XOxsMFgOQFlPrMWaN1
         yps4wlJqshLe6YYeWZVrxKQeubWjxujnmgXlM3yOIdiYGJ6FKxRydqDOHZ9Bj8wN6GoD
         Wk3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aiobRrH5ClQFSfmidcrKrBSPHcQQg1qrQq8dbdWq9lo=;
        b=MsE7U5lqDBKfSctymA3b751yiW7trUl/XXgyCmhiYzddan0zL1t8v5z6ON7rYWhdUf
         PIK7w21Q9kb62Ul7hGfApObNHFbeO4+2+iPiSIGLNwXl10RHSvhvkbYPl9vX2slB5Eh1
         Ib3whdz4wuNvfnBFPVIE9bzteEUQIQDnSpSxqxyZ3dY4q5T+RzvB6y+XTz6vuLGsOWkx
         i2HX96UqP9+4pQfwRLPNU+pNURHtIrplVYY8vD9JEqYBxkHLzSdRcxcqYUK+K3S0x0dC
         nH+UP93BMxYW8RSw4IBPVOIn9C9u/3zcIU4qh3sMUf1VJkZe9IyitafdZZu7FatvOpcm
         9dmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PIbHABTO;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id s11-20020a05620a29cb00b006f9992da256si8281809qkp.83.2022.12.05.01.55.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:55:36 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PIbHABTO;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aiobRrH5ClQFSfmidcrKrBSPHcQQg1qrQq8dbdWq9lo=;
	b=PIbHABTOXsALpiDEyf/GdSIrOBv875Sk72467+A+DqZzsijTI75ucLgrRSS5xoc+OjXgFd
	Ul5AtNelNCVTsRLkLbwJetfe0u/fhBeeepU+YnX8Pb4gaRrtQ+blLZVl0wujQRMKBqOvVb
	DnRfZxuEdi7oTUy0HhKjLXbBnpKxqXI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-kTo15hjpPJme7FVTO3yDcQ-1; Mon, 05 Dec 2022 04:55:33 -0500
X-MC-Unique: kTo15hjpPJme7FVTO3yDcQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A589C3C0F66F;
	Mon,  5 Dec 2022 09:55:31 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 632442166B2A;
	Mon,  5 Dec 2022 09:55:24 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>,
	Thomas Huth <huth@tuxfamily.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Raphael Norwitz <raphael.norwitz@nutanix.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	virtio-fs@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	qemu-block@nongnu.org,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Thomas Huth <thuth@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Jason Wang <jasowang@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	qemu-s390x@nongnu.org,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Klaus Jensen <its@irrelevant.dk>,
	John Snow <jsnow@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	qemu-trivial@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 22/51] target/i386: allow MMX instructions with CR4.OSFXSR=0
Date: Mon,  5 Dec 2022 10:51:59 +0100
Message-Id: <20221205095228.1314-23-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: SsX6lhYlcbOy

From: Paolo Bonzini <pbonzini@redhat.com>

MMX state is saved/restored by FSAVE/FRSTOR so the instructions are
not illegal opcodes even if CR4.OSFXSR=0.  Make sure that validate_vex
takes into account the prefix and only checks HF_OSFXSR_MASK in the
presence of an SSE instruction.

Fixes: 20581aadec5e ("target/i386: validate VEX prefixes via the instructions' exception classes", 2022-10-18)
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1350
Reported-by: Helge Konetzka (@hejko on gitlab.com)
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index e4878b967f..80c579164f 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -1488,7 +1488,8 @@ static bool validate_vex(DisasContext *s, X86DecodedInsn *decode)
             if (!(s->flags & HF_AVX_EN_MASK)) {
                 goto illegal;
             }
-        } else {
+        } else if (e->special != X86_SPECIAL_MMX ||
+                   (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ | PREFIX_DATA))) {
             if (!(s->flags & HF_OSFXSR_MASK)) {
                 goto illegal;
             }
-- 
2.38.1

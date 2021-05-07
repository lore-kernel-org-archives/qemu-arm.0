Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp451836lfg;
        Fri, 7 May 2021 07:44:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSdPkjW07dVbb7qCVGTEzKXLz8kQ9jRKXbrZw4eObK3dBZnyqzhHNi82Z2aWDvrBvowds2
X-Received: by 2002:a50:cd4e:: with SMTP id d14mr1177150edj.165.1620398681082;
        Fri, 07 May 2021 07:44:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620398681; cv=none;
        d=google.com; s=arc-20160816;
        b=uPFt8XeQqugX8sYZ2e01Aq/S4kwnIy9/itz+4L6Ng0QLcw3DQYZxvvmH1GgEH3Bb4f
         i8Ytk2Xub992zpgt6of6UYUTInFYaEYTJKq8uURN79/bL53MMVTnEtvkKBLC3VTGdbRH
         BtthJQeL+zRYjtnUOsyrw3nLGVcM47qMlPBn7rCJrNCTKtKrHzBIkeu3tEJ4XEQoS3Kb
         LyN4OOtolD6RH12PAhN4SUpEfpmSNYPsGyi0LoLEmKwmvFeRoSgRKVTO72PPef0pBp0Z
         ekgLe90skgnpZgvHcFFOVEJVNZSFn9AUT3gIFNjcbNQTt2ra/ULkrp+Sjiw8CZcOCQi1
         jNzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZhnR5sl6IQkPWyz310rG2u37bBKdYZca+FWR4sH4smk=;
        b=lsVvK7lMy0jar+wIXUsbPTznE0YYSxazCW/xa6D9Ousa4KU6ccYu8Kmg7orV72ObEU
         idcG7CqXZ2w+jNxGSMXe39nIVu5cKnl0E8LNeVuZpKP7n2P625z+6uwRER804WKIVNGg
         fUhkHyOcLjIV2ZLs8z69xH9QHy/69vnVXoC5YMVWne9OT55Rb+O2p35nhb1SMUlHK/hv
         xnKRF+JE9htHXbbgyS1xWXHHAtBUygxtVg5IWzYeQTHUYWzlgKAyT5+dVBQzviK/g3ja
         RwaVu76YgWyD0L2ovOEo43XNfjfnAIl/dzBHWaqu/1B9u8tblf9IKrvPzni408F+n5B9
         h5Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=b+lmaPB1;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id v4si5687546ejy.176.2021.05.07.07.44.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 07:44:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=b+lmaPB1;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620398680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZhnR5sl6IQkPWyz310rG2u37bBKdYZca+FWR4sH4smk=;
	b=b+lmaPB1mIOv6vsS5qpY+naTHzrYqavCja3GAJVzhVzDXSIIUuYZ3+Br9n5gmwN3wquORh
	R1aHq/Cagw2mRdgxPqzdg/8juBvhYYGEPvFV6aJ8wMYcDTLYPF+5Co33KdOvE11jdOHNRN
	/7pzKTOoWmnf+DR9GuXOP7DozqljlHQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-IRlHvKSbPLuLEhIffN2d1w-1; Fri, 07 May 2021 10:44:36 -0400
X-MC-Unique: IRlHvKSbPLuLEhIffN2d1w-1
Received: by mail-wr1-f70.google.com with SMTP id 4-20020adf91840000b029010d9c088599so3698387wri.10
        for <alex.bennee@linaro.org>; Fri, 07 May 2021 07:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZhnR5sl6IQkPWyz310rG2u37bBKdYZca+FWR4sH4smk=;
        b=j5kGOitxFhOg13rkdOXeQGieCdBF8Tfyxtm7n1SeKZVF/uLgSOwz+1+1DgNqFnCFQy
         IIeXS/NLV8M4dWkUdP0O1V/uHIwivr0iVwvjfyylWZr8pzFb6VWZ7spwyUe8uFx3hhcL
         1xx8kcyBzEzNjXl2J52FwX+5F6lJIOmljIFMVhq6u7qTZqaxOHQ5GuAMDjCO6mosiu9n
         pRN7oyoYOVnJaFny5R7leaMtOtKLap6g785nQqI/14UOaL08shgtlIMKkoOg5O3PQmKY
         0RSyhdrTYN9KVzwUqVkSvRK105R9eOcENgNxaeNP+6O8na6nY2vSgHc/3gLy+wYDo+y/
         bYNg==
X-Gm-Message-State: AOAM531kU3qghej6dqAKrb0yES5+r6rbn0VddPiVvf8DhUZpoo/V9tF/
	1BBeujYcSUJ9gVkr5046g5lvo8Ykv/11IwMGBIIJBZfsGWJu/l2XGpthGZTnizNia/AnBcTsTnk
	/iHo+Bo7O+DojbzTe
X-Received: by 2002:a5d:6981:: with SMTP id g1mr12599747wru.426.1620398675119;
        Fri, 07 May 2021 07:44:35 -0700 (PDT)
X-Received: by 2002:a5d:6981:: with SMTP id g1mr12599729wru.426.1620398674953;
        Fri, 07 May 2021 07:44:34 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id v21sm13520162wml.5.2021.05.07.07.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 07:44:34 -0700 (PDT)
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
Subject: [PATCH v3 16/17] configure: Prohibit alloca() by using -Walloca CPPFLAG
Date: Fri,  7 May 2021 16:43:14 +0200
Message-Id: <20210507144315.1994337-17-philmd@redhat.com>
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
X-TUID: M6udCRyag7Q3

Now that we removed all alloca() calls in the repository, add the
-Walloca CPPFLAG to trigger a build failure if such stack allocation
is used.

Rationale: The ALLOCA(3) man-page mentions its "use is discouraged".

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
As there is an alloca() call in libslirp, this patch is pending
on the following libslirp patch to be merged:
https://lists.freedesktop.org/archives/slirp/2021-May/000150.html
(and the submodule updated).
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 4f374b48890..67cb6d5421c 100755
--- a/configure
+++ b/configure
@@ -552,7 +552,7 @@ ARFLAGS="${ARFLAGS-rv}"
 # provides these semantics.)
 QEMU_CFLAGS="-fno-strict-aliasing -fno-common -fwrapv $QEMU_CFLAGS"
 QEMU_CFLAGS="-Wundef -Wwrite-strings -Wmissing-prototypes $QEMU_CFLAGS"
-QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls $QEMU_CFLAGS"
+QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls -Walloca $QEMU_CFLAGS"
 QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"
 
 # Flags that are needed during configure but later taken care of by Meson
-- 
2.26.3

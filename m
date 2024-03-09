Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp368212ejc;
        Sat, 9 Mar 2024 11:24:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUmoycjPd7vWEVgXZ2p2ZPfJrepZK91rqfnw9xkcKMeaQBgjU35JCd8jwrBUKmZhc5iGPB1PbzH7uYYJ2LIoeuIbeuXSTFo
X-Received: by 2002:a17:907:c28b:b0:a46:bb:c4e3 with SMTP id tk11-20020a170907c28b00b00a4600bbc4e3mr1825049ejc.32.1710012274227;
        Sat, 09 Mar 2024 11:24:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012274; cv=none;
        d=google.com; s=arc-20160816;
        b=rvXvSOi/avW2PMF9RF60db0vAK0C/mZOr/ukLoi96uWmUk8UEhXrIJPnLcMrxJQD2k
         fp4cR62Qjo+ZCOy62JmANJ7nsduy1kcj/tJ39kzHTiyTW//YhAhQFAngWEPLtQqpsNHE
         htUgqgjAixatvAQqWowOUbNJOqZ08roul6LLPgC+0GczY7qq4chh1YFpb1ZfvQZSIPg/
         mrajWOP+sWZMaJAum38G7oSBGnDkiSmc+ocabP3YaWdYWCgUK02oRz2neXi5ZvgJ76h2
         4pssXmxhvfX2tKIX7dGbBWgoe6pOEGw9/y0mKxzoQh62nwm6e0nYjhw3KHOaLRdx52jy
         aUMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=b9ZBcWCorweFf+2JD84jMS2xk8ntDrtFmiyqB/cRtXw=;
        fh=cPqexobV7ZNRaBbz/bmbFNsfb1Wznghrw6yXaRjtHMs=;
        b=c+HIL9dNv6BEf3ZyFeiA9pMCeiEBtt+SSKbaEmjuCMHYSrb/ggp6fNYSq4HM2Ddx/r
         dJTQYPYx+OZumfLqqawgQZMmRkIr/KXBBrt9eTzapOirHQe1bvi/WhUpst2/AEIgDVZV
         XTR/y9pttWTwUKggM0Y3MaJggPwW4dP43rVJjAR601eJmXt0JSKf64WNX3lMDLBWWxuR
         HLULQlwWUjrjrbTG/h/AWFmaecAzc4Rh6RcDrm7/L7SDRshEFk7jTXdSDsVKCDeM66bU
         zRft0rXk0H3dlr9DGW3SGO+Uj7ObqWpSXJtGodG+zT1sN8GgKY85pdEoYJueLNGVVY9C
         H2cA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=keBUPMWa;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jj12-20020a170907984c00b00a45c8cba56esor500971ejc.15.2024.03.09.11.24.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 09 Mar 2024 11:24:34 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=keBUPMWa;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710012274; x=1710617074; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9ZBcWCorweFf+2JD84jMS2xk8ntDrtFmiyqB/cRtXw=;
        b=keBUPMWaBQ6fwDCCtZ3esM7TJaDX52E6kf4rrHtfGN7CyC8hotCmiO/j0Nj6kG8ZN1
         ySV7mwAbKj8M/ZHPPz2joPhOEETz6hmA/QRyUEN+SOd3FIQOE70LEcrGVKqCnDeU7ZSf
         H0HgDYwcquBnqhqUYLmgcy5Wyw92kb0wwwFLK9JVYH97ypFQToQPee4ZP7mzZgxRL/1L
         OiTpTziABYoCXqwRDVfZ5QGMngVhpWUGYr2PcflH7lo4Cm03w8RUZPry2xYsaTLWnhRs
         W9P532K24L3FbrdxLEeehHLrk4pWWBQ9pAIcJ4GEKGmf1GYP76vvHFWvBTrJmSVjwtzz
         Wswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710012274; x=1710617074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9ZBcWCorweFf+2JD84jMS2xk8ntDrtFmiyqB/cRtXw=;
        b=rbOAZqqrPhi8Ix1eNCT0/NkhARQudmJaCiq85xXKMUSWR0Z0Hksxa+AlEVi475bUF0
         kLC8FE8DIR4afZdKG7jFIzv6J4QYYqN9TiR6xxt23bVFEii7udoHdOHTr8Z2ti2ycm9Y
         4bm4+0oe6lKYmvioEjzM7wwDaH96WixChNbwPoCWl/S7es683krJ5xJm8FvDAbDYF/fq
         U9+rVoGzlBev/CpOEBaCbqAxnhp+lt6SwFbZIRVXDJFoMtftNjICdpwsN/C+pzCJBmHl
         WHqa0wdjk+m52KcgEoI5wkSBLkUs2NxpfeG5bzaZnGetjwchElYwD4utjRfHGjLK9j+g
         gfRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1J9ulgRUyeOxAV3xV64sBUY6PMDPzTDGvLnWddw+xyQ2QlqF8/mFyXyqbiTW+cDDw3BsdNzrZATTvVzgp3MZW6nSZwe7K
X-Gm-Message-State: AOJu0YxCArM+UDz7unaxPvKWqvMXzRFjWWSmnez+AIKi0EtdNsI+EiKo
	exg4EMujbT46hgDk9yqyHc1vRzRxKvOvB5vaqTHGdp8xo/Y/XP7YMPlEovBJ3CzGVQ==
X-Google-Smtp-Source: AGHT+IHgEf1VoGYbP8PX+uBQFBOrcqcJuu3+uWJK8B0gZBS4Ndlr4ufNHMEDWth1nZW5Ltal/PnjAQ==
X-Received: by 2002:a17:906:9c8e:b0:a43:b50d:1074 with SMTP id fj14-20020a1709069c8e00b00a43b50d1074mr1601200ejc.23.1710012273937;
        Sat, 09 Mar 2024 11:24:33 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.181.237])
        by smtp.gmail.com with ESMTPSA id gh16-20020a170906e09000b00a45380dfd09sm1168535ejb.105.2024.03.09.11.24.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 09 Mar 2024 11:24:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Bui Quang Minh <minhquangbui99@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PULL 23/43] hw/intc/apic: fix memory leak
Date: Sat,  9 Mar 2024 20:21:50 +0100
Message-ID: <20240309192213.23420-24-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: prRB54Ql49Vq

From: Paolo Bonzini <pbonzini@redhat.com>

deliver_bitmask is allocated on the heap in apic_deliver(), but there
are many paths in the function that return before the corresponding
g_free() is reached.  Fix this by switching to g_autofree and, while at
it, also switch to g_new.  Do the same in apic_deliver_irq() as well
for consistency.

Fixes: b5ee0468e9d ("apic: add support for x2APIC mode", 2024-02-14)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bui Quang Minh <minhquangbui99@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-ID: <20240304224133.267640-1-pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/apic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index 1d887d66b8..4186c57b34 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -291,14 +291,13 @@ static void apic_deliver_irq(uint32_t dest, uint8_t dest_mode,
                              uint8_t delivery_mode, uint8_t vector_num,
                              uint8_t trigger_mode)
 {
-    uint32_t *deliver_bitmask = g_malloc(max_apic_words * sizeof(uint32_t));
+    g_autofree uint32_t *deliver_bitmask = g_new(uint32_t, max_apic_words);
 
     trace_apic_deliver_irq(dest, dest_mode, delivery_mode, vector_num,
                            trigger_mode);
 
     apic_get_delivery_bitmask(deliver_bitmask, dest, dest_mode);
     apic_bus_deliver(deliver_bitmask, delivery_mode, vector_num, trigger_mode);
-    g_free(deliver_bitmask);
 }
 
 bool is_x2apic_mode(DeviceState *dev)
@@ -662,7 +661,7 @@ static void apic_deliver(DeviceState *dev, uint32_t dest, uint8_t dest_mode,
     APICCommonState *s = APIC(dev);
     APICCommonState *apic_iter;
     uint32_t deliver_bitmask_size = max_apic_words * sizeof(uint32_t);
-    uint32_t *deliver_bitmask = g_malloc(deliver_bitmask_size);
+    g_autofree uint32_t *deliver_bitmask = g_new(uint32_t, max_apic_words);
     uint32_t current_apic_id;
 
     if (is_x2apic_mode(dev)) {
@@ -708,7 +707,6 @@ static void apic_deliver(DeviceState *dev, uint32_t dest, uint8_t dest_mode,
     }
 
     apic_bus_deliver(deliver_bitmask, delivery_mode, vector_num, trigger_mode);
-    g_free(deliver_bitmask);
 }
 
 static bool apic_check_pic(APICCommonState *s)
-- 
2.41.0

Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422678nji;
        Thu, 12 Sep 2024 00:40:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMnVjDw9hWj5UhFIQWRHcs+6aww9qr6BQXfVG1/o0HMTnIoxNe9s3MDnjT1BWD/xMmq5acAOIaCFpuHA==@linaro.org
X-Received: by 2002:a05:6a00:1790:b0:70d:1dcf:e2a5 with SMTP id d2e1a72fcca58-719260656f1mr3856233b3a.3.1726126822872;
        Thu, 12 Sep 2024 00:40:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126822; cv=none;
        d=google.com; s=arc-20160816;
        b=ZP1tQzuO2qN8G5WXW3h1JAj/tWuPZlpMpTYfOF2CUzIrR9zosTaDPTNoGxDOZDXmOt
         h1OHcQOYr8A6sEtfhq6mm7tBMXW00dZzO/DhPy0Gy15lQJhm549dmc44u/qpxv+BPcD/
         ILNCL7fSDqLMcwmF9js++2vKGt1wwJTvCp2OGzaaXbLQAF6C5cfAKiKkLVlAGEsc7eJN
         hitPlsOmueWfiOe5qypTYR7Cw2NfRtWjq4I+Yz8eP3y8W6dzXne37LqPSIii65ayjsT4
         1RmDzpNO9LGXHVPJFGE1+Jh26O0lE2LxfeVPKA9jNX0xanw3NyXsoeffz23HZo8FGsUf
         Z6Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MAqUDAXH2RLxvOYkCD7ynjvzkI7+hLAzyNaEnllXZKU=;
        fh=rhhGgaxtS31IVlPlNInCxChqTbJOMj/EHN/5ljTnNLU=;
        b=sfpPpJsfn3otQRfQLqts4LLH1yyofKTHgpFYrZ/X+eVQwgKrgYeh4/p/PEF5lGexlO
         cEcT69hX8hwIUYyu2zLcx9eTVuCeiBmVE8fygSPO/gunBVPIOMrhaoGWpaYcq/bc3Hit
         eMKpvTk59CEHAvoU6o400ExnyoMCyEqsmegxVHE/aMgHv03xRMSLy4mEFpK3ana9PiLw
         3tpa7FwavsYkWG2FwErcFAa4L8T17AqeMEJDDbfD/FvqWKgrmE1QpJnTmMsJYh3dBPcH
         sw0xY2R0A6iSAsENgbyWXa0hWKXEi6xHH2TY2sSvDPCRydZvm/hEREC4hQwTc+kCncvv
         w+zA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JU7VuyYo;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e57d8324sor9494152b3a.0.2024.09.12.00.40.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:40:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JU7VuyYo;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126822; x=1726731622; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAqUDAXH2RLxvOYkCD7ynjvzkI7+hLAzyNaEnllXZKU=;
        b=JU7VuyYo7xDiQ8mpkwCFQMbvXYJO6TCcNq8A4JRaneyIgPbl88ZSHMlOLhqankKTDh
         6XK8wJNHCQniT18ah0xxLV8AN3kSP21+UEuDgVbWg6pRsPaoT7VcOai3ByWxIozdZVhY
         f+78IlRKnGzT2NKinhL8DH5d0jnHZP3FZpxZNGK4abaNFETPfb0q5yS0XARrpNZcLMEx
         apQ6SInbmqpOc8AnQjjmEGvKVRgtFLPd9UOaemOsztMjASyBrxdFjo0wJLn58MI9RBg7
         zJaMDGpLrv8PZT7GiAebgGGaXQyNWYeozbIBJ6FIoWowrPzjwKSUcqYvhdN1s7Od4md5
         d9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126822; x=1726731622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MAqUDAXH2RLxvOYkCD7ynjvzkI7+hLAzyNaEnllXZKU=;
        b=RIqvp8n4jC8q595WvjmeAYc6z+kVdEjwKKujfK/DILiAVjKNkVOatIetLRfHW2A4WJ
         bMgpFSSQDKDdc28tUKv0BeLSLqVByWECQSmvXzE7toDXBkhAdKrr/33rkilWN6wvCMT3
         m430YbsAiwu/MuNs92oq2iLlarLgIa3Fdc9D63l+E6TnmKsXxqzhtq85TCy8jzDtxRza
         ym9jSmvQHZvkMHWLMZOgt6srei8NOpjuYvwb5lyruP7WEyd0YivpTUaeOf42gJZeo9T0
         s+sbH+6ok0iO4i/2HGi161QF6RNLQ7J5XfWdofJmXl5xjQzba9GRI3tH6MnKaCS+Gse2
         LxcA==
X-Forwarded-Encrypted: i=1; AJvYcCUL4fwrLVGs6MS67G2lSWd3QI1IwnJgj8s0jWvYGGIcbwgbfuzqFgZn/xRv4pDN3YZrxK0//5pjcf9yyw==@linaro.org
X-Gm-Message-State: AOJu0YwZrqot+kusCZmyW4xcCa74Q+AM84KB1OWCLQ0ZIrO1eH5NX63+
	of6xBJ2VJ1EUJncwzMxsDpeJ8HH0mDwr3NpDkidM0NLhO6fZ+34IvKzVIUuduK7iPZFcQq6Y20l
	dxhsApUo4jas=
X-Google-Smtp-Source: AGHT+IE8CKjJgw0N7WrqC34he8rsJ6HMZ4DWnrxVglrTgBMS33CPmFB26J4BB54F9WE+apv1XwnjUQ==
X-Received: by 2002:a05:6a21:3982:b0:1cf:2931:727f with SMTP id adf61e73a8af0-1cf75f005demr2867169637.18.1726126822148;
        Thu, 12 Sep 2024 00:40:22 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:40:21 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Klaus Jensen <its@irrelevant.dk>,
	WANG Xuerui <git@xen0n.name>,
	Halil Pasic <pasic@linux.ibm.com>,
	Rob Herring <robh@kernel.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Corey Minyard <minyard@acm.org>,
	Keith Busch <kbusch@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jesper Devantier <foss@defmacro.it>,
	Hyman Huang <yong.huang@smartx.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-s390x@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	qemu-riscv@nongnu.org,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	kvm@vger.kernel.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Peter Xu <peterx@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Eric Farman <farman@linux.ibm.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	qemu-block@nongnu.org,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Eduardo Habkost <eduardo@habkost.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	Fam Zheng <fam@euphon.net>,
	Weiwei Li <liwei1518@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 21/48] migration: replace assert(false) with g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:38:54 -0700
Message-Id: <20240912073921.453203-22-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Zesv1M3nT8FH

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 migration/dirtyrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 1d9db812990..c03b13b624f 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -228,7 +228,7 @@ static int time_unit_to_power(TimeUnit time_unit)
     case TIME_UNIT_MILLISECOND:
         return -3;
     default:
-        assert(false); /* unreachable */
+        g_assert_not_reached();
         return 0;
     }
 }
-- 
2.39.2

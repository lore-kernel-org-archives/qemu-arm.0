Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161295njg;
        Wed, 18 Sep 2024 21:47:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXeFXIXU6ZqfTfp/CoST7iHEZtMqmefIKGKn9yANn0/6/XYTEhYXIEuNOshS1VeQe8FcZ6C/3FnQQEfvQ==@linaro.org
X-Received: by 2002:a05:6a00:2393:b0:718:dc55:728a with SMTP id d2e1a72fcca58-7192607f65amr35550579b3a.8.1726721221214;
        Wed, 18 Sep 2024 21:47:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721221; cv=none;
        d=google.com; s=arc-20160816;
        b=dvAP0GSIJd9QokASqhM8IlpJBYUX7RwAAcTpDCM1UntBC5cwxWS2lRkUAm+DZ/UanU
         8KSja7MEMAOv2Qsm4D74T7JNLjE/YN84iE/ta5ShhQqSAWcgH1KFij2wSM14QdovLAA3
         +aSE1da1QbZaJ6fg+f4E/UH7IF99TjGzBox84HPidUP8w0Q9G23PEeKDQ10HayCBaslx
         1u6OEbFkAv9pg8vU+bw8oEydpJcTl3rA/VobJQIqVEwe1DLV0Y909ICaltvHKC5vNIwS
         Czndfcpa1dHEH0C/iU8P4SI1TQi330Xt76xMvdU1+8F/kisP+t1GcSweCSccsQgv2KLe
         gaiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mQ5w0lQctWZKvW76VfUVnQRwnSRhyDW+QKlbN5pvMwc=;
        fh=TiKwoOhj9Vuq7ah8SgJW/EZklLsPdt6fsEa7/uG7J6M=;
        b=WciqI/tjhqUT0IRabnwjlFd/RoYIxF6YbptD7IuDQFLzW7YADH5XBo1N/AmVTc0MPD
         TXpdXv0YpmEhXngOPugJbmMG3gwyd5D4kcYJZNmctglegTuB6smnmnfZ2DKCGygd+Okf
         o9LySMQzKNlx6Bwr12lP+OhbVoqJ1eB7AbA/3N5piGRHVQcGbAA4SESl2iPlskzvXCsy
         a+PYYLrh1E2gf2O9Km+PslCuRZ0sCt/mKNTcfpAiI29vyTRd81mtE3YMwEKZDFhNTSsI
         rvw6pWHRXTs4AUJP4plythEN5xSDKbGYFY1QifL402WxttMBRIbMyw+hTbGrUs7JqKZO
         UzAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rLUA/jna";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71944ab9a10sor8837377b3a.6.2024.09.18.21.47.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rLUA/jna";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721221; x=1727326021; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQ5w0lQctWZKvW76VfUVnQRwnSRhyDW+QKlbN5pvMwc=;
        b=rLUA/jnanr0pYMB0XToeSYglz7GEoiBAXLNhue/fLHNcxtSs+B/8b4bzGPSmlTkM3r
         wZ7aEW7go2gXW5UsoWYmyRXss4TNSSq5KWIhl5H0LZCNo3ZUyPpjee3fSclibVCn5i2K
         WAWhwRpiOHfTonp9wHae4y2FiFurJjzXtfx11UkbPHcwg4/eZOVfN33HcQNyehmssLvI
         /loxggqUgtEOM2+r/s02CkYWEmJklXk5+6VgTo0zigL+CRe40O98OEyUf3OT7gcaekNJ
         gwhw4uMF1l6HJRR0KBMXvTDxJZgSTMP+BbnXDDkeqfe/utTvPRzMEuxvWnjSkmS0sOCS
         +d/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721221; x=1727326021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQ5w0lQctWZKvW76VfUVnQRwnSRhyDW+QKlbN5pvMwc=;
        b=b838n+cOQmyy9aZYw7/1trGPffgVIEg5nh+96tZdKMay/kXUQ6zew9Xx87VLiN8xiI
         8x4iyL12O6RxefUcT8+XAde0/GL5wVeKrcFPrq6vUOTm7KWH+/i2P9Gmkd0iYDjzhTlO
         8RVEV3sIJplUlIaVZ8IfVHyawpKo6A3PeV83dc87o2jE9r81RUz7zW9zIzFK3UwwhVna
         l30k1Boz35ImaMQWrnypCBpZWtgUm1vHnJ4lvamQlnNIESueRbYk8W9Ra/U4o9kZjVhy
         sg/l19YwZ6CdTaLfbhr3hCDVHztcWH6OmEATpSBLTx4RnPeXxRqoGMKvUQ1gJC3Xu1Tg
         qDcw==
X-Forwarded-Encrypted: i=1; AJvYcCXA5F9szy13O12nzZE5jaycKUfc+6Cr2cjSBOPt9kf2h/LzgbyZPnzxvdZJA0gd83jeU9pcg+9tnf+f+Q==@linaro.org
X-Gm-Message-State: AOJu0Ywvs3Y6TXulIPNaef6yPgqqUGhTGmqC2byYW57mKn+s6Clf54mW
	szY8J3wCquJmTPnYeWzfBj2qqVxtPS+35IHUDR0TOtDslqyV3hp3sMRlfz9+5HKDKw==
X-Google-Smtp-Source: AGHT+IEAmbhCRhYWmctGVCjASbSM7CCQw3PaPgr2ecmIRqDI7EbS/ir9wSwBUY/hOvsMNKhE4LWwDw==
X-Received: by 2002:a05:6a00:2e9a:b0:719:1df4:9d02 with SMTP id d2e1a72fcca58-719262069f1mr36784043b3a.25.1726721220565;
        Wed, 18 Sep 2024 21:47:00 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:00 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Hyman Huang <yong.huang@smartx.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	kvm@vger.kernel.org,
	Bin Meng <bmeng.cn@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	qemu-s390x@nongnu.org,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Klaus Jensen <its@irrelevant.dk>,
	Corey Minyard <minyard@acm.org>,
	Laurent Vivier <laurent@vivier.eu>,
	WANG Xuerui <git@xen0n.name>,
	Thomas Huth <thuth@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Ani Sinha <anisinha@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Fam Zheng <fam@euphon.net>,
	Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Keith Busch <kbusch@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-riscv@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Jason Wang <jasowang@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-arm@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-block@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	Weiwei Li <liwei1518@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Yanan Wang <wangyanan55@huawei.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Jesper Devantier <foss@defmacro.it>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 07/34] block: replace assert(false) with g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:14 -0700
Message-Id: <20240919044641.386068-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ZH3bBIhDpK+R

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 block/qcow2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index dd359d241b7..803ca73a2ff 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5299,7 +5299,7 @@ qcow2_get_specific_info(BlockDriverState *bs, Error **errp)
     } else {
         /* if this assertion fails, this probably means a new version was
          * added without having it covered here */
-        assert(false);
+        g_assert_not_reached();
     }
 
     if (encrypt_info) {
-- 
2.39.5

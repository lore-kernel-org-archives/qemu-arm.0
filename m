Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161540njg;
        Wed, 18 Sep 2024 21:47:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXk/zEwOXuQMSnsw6CGx1ih3liQn70RjZTrw4AAmMKK/iB//4FQ5Ia5EDUYIyVpkQ/iYQMmobPkXlKR4A==@linaro.org
X-Received: by 2002:a05:6a00:2e11:b0:710:bd4b:8b96 with SMTP id d2e1a72fcca58-719262077e3mr37713959b3a.28.1726721270285;
        Wed, 18 Sep 2024 21:47:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721270; cv=none;
        d=google.com; s=arc-20160816;
        b=SlzDIzQfer7ju034qlCWVP1LHyNjcOilw2zsJUBx8yEN8dlM1XlmMB+234MuHOJIxI
         EBxOeCXJ5MEQie64HRlqqTqF95+eapkln1DypHA2lMHsorcdt+QEpHgn0nIFr8dTHLrN
         yftG1+k/PmxzPXeM5S+X1l7yLbDMqXJVbd1byQiAUdx2TRCmi176HLlwTxMnHaEggJFw
         ZHnZQ+dqe0fPabefDUY+AlFsM28SRNFNaxHX7+HZ8DnQcayi9VgJ7JctkNWjaH5mTlBW
         UHv+M/r+ghi76QQoDSoiHJWqoBnkggRzQTx+SQmLFTwymZu3CD52VMhLUfs98c/gJUQo
         rT0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wsHCjwrGb9kFALwWqgq3B+HDSbUQOfqxzvxaIUK0xNk=;
        fh=7loXh5YCBoEhKv/MGEMs9Wru8rtzwAomApvPXdlF9I4=;
        b=LR9itzmtOj/noOY5w+UVjYN+UOETYK/ZZMQjcjDvkI2IfiuI4ZHsF5l52nfwLeyIi9
         SJf9MDTAkfO86kv931CsyY4sHM7PGy0wU0gHiDgNnqZ9NpyBY09c2m9/FESskRvbDgZt
         FWRdYr1UyufWPzL/c/lOKDqf6T/1z43wS5WDw5zywQEK7qxgnIh7IObwflU+KDMCU2U8
         6gJGGsgi5eQ3vv50ywpaerFKo0AMy7GqQZDKPphNNzhiL+cN0I1rcc5LPvFlkxdH/LtX
         F4Zwrc37lKGSxBI58ORY7yucswWDyMKmsIjeLIso07XzH25V3wg7Eq3wh+1sH8xDPWkx
         SnMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=os7cop65;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71944a95877sor8791333b3a.3.2024.09.18.21.47.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=os7cop65;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721270; x=1727326070; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsHCjwrGb9kFALwWqgq3B+HDSbUQOfqxzvxaIUK0xNk=;
        b=os7cop65rr2T7WQ8r/ALpH88xi/9Z3surfcowsgqij0pLpPGdIDgGi8jpxKW2Ga6xD
         cNLKyl84if5J5IAsK8zjfe2oY6MmqRjm6mBe1ZQEk4Ujx436XhSE/yP5p/m+0lAQCIV8
         1q6AmBSq3i3UGz1i77TUkH27n5delkPi1zT4gaXrJ0KFKtvCHlceEjLGvlUbyxWcsUZY
         cNfX8qZShPF5B/eb12yeZspEm3/d+Yg6cvegmjsOQc2gJ5ONArXbrEVU9KYwTNu/7zme
         +NO7i6baz6PzugMM7aDiNX8vj6AADWRSWlXDaQ29hpK7UHDlYvzwWkQbhrKiZiC37mYh
         V1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721270; x=1727326070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsHCjwrGb9kFALwWqgq3B+HDSbUQOfqxzvxaIUK0xNk=;
        b=u15YSdZXwbUqYMlJAXrDRiVF48ks3R6z0XxJqCvWyeJxJllHL34Ixh/gkOq4MTjFhM
         Ae4Nhv2CVNW1vYg5DEewpYvERkOTJKtKf5VP2KzZob3tOwWY8ljCrBlQPSIJCPpxUj4b
         WnYchKDgYfpMK7ul8LqKdTMB1nmtDlycOlRkIxYE7Bss7x4ZP2Lo1+3YLLIv7WQ0k6Qu
         Cp3mXHNgWE/hKoxFIj21/uHY/4o6VqxZ0sbTa8iUT2O2lzNk1wn/KPAztGTmxrT60zdW
         HxwVRScD8pqE/Ly0+FXQesfx7dGHLXT9ILjUMMkZONb2eAllQat/DeylFnwXFnETuLGZ
         osrw==
X-Forwarded-Encrypted: i=1; AJvYcCU6BJH4H6IkpUm4ZdKB4RvG0ThNWrSoy+5/KsSBWl9QrHWZWPiYfGYeZHvF0ZvxcePyG+KbRhHFyz6QtQ==@linaro.org
X-Gm-Message-State: AOJu0YzgD71OxBveZNXn8W0CZJl0M2RtW5HguQBr4qa9GSSJwoOtX7vO
	MQpHIEwBqcoK8oEhHlcdVyrDRAOsn86XzVKOAAaj6xYihrIpahpDVXzKd4YPzh1axw==
X-Google-Smtp-Source: AGHT+IGSEJfg9NiDwsfGQNgMzoJXvgeBnRfAVLKv9CjCjZDAdI9sAnhanA6KRSoF6muQ/s1OmrvU9A==
X-Received: by 2002:a05:6a20:cf8e:b0:1d2:bcba:70b7 with SMTP id adf61e73a8af0-1d2bcba78c6mr22172622637.27.1726721269821;
        Wed, 18 Sep 2024 21:47:49 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:49 -0700 (PDT)
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
Subject: [PATCH v3 32/34] qom: remove return after g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:39 -0700
Message-Id: <20240919044641.386068-33-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: tgIpEJAwwVN1

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 qom/object.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/qom/object.c b/qom/object.c
index 157a45c5f8b..28c5b66eab5 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -2079,7 +2079,6 @@ const char *object_get_canonical_path_component(const Object *obj)
 
     /* obj had a parent but was not a child, should never happen */
     g_assert_not_reached();
-    return NULL;
 }
 
 char *object_get_canonical_path(const Object *obj)
-- 
2.39.5

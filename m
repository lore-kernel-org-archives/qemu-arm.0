Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3178763njc;
        Wed, 16 Apr 2025 01:15:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:1145:b0:736:546c:eb69 with SMTP id d2e1a72fcca58-73c267003b0mr1290544b3a.9.1744791327293;
        Wed, 16 Apr 2025 01:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744791327; cv=none;
        d=google.com; s=arc-20240605;
        b=Oa3gOyBz1rsUXJz8NROs4r+/6s7akb4hqJr0QRcpLRSFz3/A9tf9+qcEdK76mKFZ27
         Am7I61ppiOxKIf87fP4InGXScya69/kDc+CIFi0JCVQyvA0oXpq+c4pZjDDPcpIo4GGW
         hTUEasxRl02Fifbf8T+Km7iIg6sL8Qko7VYrHE6CdI33mgSBjFYN8MTxbE8S12yKYBBb
         8b8C+3kFgO/rCMmPdPBAF7OT65sC7ffwfL5M/1BtPGFtfXA/82pYSFAJ+PnVcNy6Q8dZ
         muR/Eo6avLK5J2eVK7AvSlpiSTAKBufAND+zEvNmfoued/q25WuS+MZNLN3NdcjKVild
         zb0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=54fvmwWjMs9r9UxnEGWRIsjHuD2f1lQSXGzb4EteMDc=;
        fh=iIcKkcVW+x17Cl/+1nawm6B0ZKyVDf17jhsCP2IC00o=;
        b=kWMMWsd9BVUBC4cHG6AEibI156WleqRU+a0vLhbH+l3ZwrKafVLrJDSfCL3y769Tvf
         25KfyGdfBVo9NASDvSjKcYhgwdXOuKkISNNuWruY9O/UKi+aiYBPsLjId+yT888I/qp1
         tNXwTDKH0SEREdKp3b+DFQS8etwoU4mSufWFDp6PwslRyPNJwjCrBjArd4kGzcJ3QP/a
         uahKVcOpAZsCHLlTkf/TKHtsJiApw2BRAhG6vEDX8URnp2zEkYEPgaUXgy4oxH2bCajA
         7MOWD42hYsPuqTtPn9a8ZLQySrMXFg6uFzlkaFvwpmFvw29SBTk//V5cYyFlvlzX0j2V
         yJOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=NxItWKmM;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73bb1d44a06sor13750748b3a.2.2025.04.16.01.15.27
        (Google Transport Security);
        Wed, 16 Apr 2025 01:15:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=NxItWKmM;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791327; x=1745396127; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54fvmwWjMs9r9UxnEGWRIsjHuD2f1lQSXGzb4EteMDc=;
        b=NxItWKmMMdQCBjhL/nx5MZgxmT3EOLbCEYp9dCaFiXFPIES+SxWruJUB9m0KMa69A4
         liKm+HQZ02igL5E0hE2Gd0rzxpHbq7BVP0eiw3hLLBP9z7HDT03516PBT17UutXBKojE
         6962R9gV2glE55HpcKwv8WOw6ZK2rikuCGd+SRuifyewkeG9LLOGbwoc8ILy4KWXGyMJ
         1qpEE3kIORBu6nhWbGEvKi62mdnrmrXpWugn1T1i5gi1y2UI5fEZHhsDxcopj86uz2ln
         V8XbIjO2JbQpi1bTEs+hM7YAYnSJ3c/IvqdQ5hIM733qWMHTyyETDCWj3g/+Zu6b/2he
         GZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791327; x=1745396127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54fvmwWjMs9r9UxnEGWRIsjHuD2f1lQSXGzb4EteMDc=;
        b=OfHHljdGrBP7kIUFyoaP7OIWp5omuHjlNlWxAoB1E8gPxRW9XM447yZVCp+TpMwB6Y
         /3W8Kyy0DuU0D9nVFRycjM7QEekBhc7Uu8irnLAKlLnmIez1F+9K2swqVdafDQbuyzy6
         R9fvpxH3NdOPL1Xh9yHMCZ7dsSIRoXLDbVFNjya2X2zuLA3klCvKabERvxCQzcdCwq9n
         tBtmzHw0X0mNH1HgnCRS33kztiBAYc/9dMjBMwNs/jC+CRWoeUXdsZLvXj10hWj2y4DJ
         6rWxviss6XdC3ojn9GY1kRRH56Y2TLDaq5V7NnbQn7Y9XcEhaI81DBSnUun/yua1272r
         c0lw==
X-Forwarded-Encrypted: i=1; AJvYcCU/tajliERHhcFvCJOwBb8kj0LxPMSkaJLyayHvhZA4/PP1RQRqZ7RnjG0xqVBTtNxHORlg2xA92JGOZiZs@linaro.org, AJvYcCVBiXNTXfyDWGnqUGP4PAQC675cy9kQhKwWAkCYy9BxvPWRcBr0GLT603UvmuydP3R4bd1W88in@linaro.org, AJvYcCWAgHLp5scQI3/9YSlmwRYekaMGeCWaIgCSlMXlxiDxOrHjruPLThvHDW0jQbPYQwA9+wpLjK1CwF4IFdv1qj0Biw==@linaro.org, AJvYcCXYAX5sU9hInJunxGzBJLRlEuS+ZehoL0y8YM6vbp6zQFqfHeq9UetTUh7EsM4Xq/CMBnaPtUel7fe8ieWl9tUOqKM=@linaro.org
X-Gm-Message-State: AOJu0Yx0ozmQo8EnZNSOCWB2NO2hjh7fnXsVxe8+C6de1UYU1Pcmyg00
	SUU0204TCtAYBFNjP6Dm7slLh5P06ysq3BByDqOXfXjVOLlFsOZrKFdkF0CE
X-Gm-Gg: ASbGncs4efITji1UV1gHA+M9jbox809vLDgl3X807MdlRX5fgsVi03cB4v4TGsyMsxz
	dnXq6c8ty09kPspHegn1FLTR3HE9L5sdHfb8GYD4+8v89emWODMyjVPop2GTOHkg/fW2YIsWDQT
	7co3eCOlleh5IflwMdGzCB1/R56dd29qe7ua3rFccbBGNyLrgIJUS3oBGe2mrqvvhn3WXd0/nKA
	r2Dt7p+HTW1tUXmIA5ZWcCR9mJxH1c64lu94SEFA3iXFYJB72Fu6bW/P5ninTqq9Zm9ifjzP+jr
	QZ33Rp0N9SfX1GngTJ+a/+7WK91WZWntP1mLj19alfslbRYyxIy4iKLkUdKx0JnZ4ZxB
X-Google-Smtp-Source: AGHT+IFsEp+s42sEcYEFipg6DWWv1zGm/h/cH9AFZLSWq7fBYiIxmgXiSE9RfWArjeKLVvHcyDiDpA==
X-Received: by 2002:a05:6a00:198c:b0:736:a638:7f9e with SMTP id d2e1a72fcca58-73c26700979mr1705820b3a.8.1744791326551;
        Wed, 16 Apr 2025 01:15:26 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:ee5a:e672:7d4c:d43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3263sm9839445b3a.38.2025.04.16.01.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:15:25 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 03/19] system/vl.c: Fix type conflict of GLib function pointers
Date: Wed, 16 Apr 2025 17:14:08 +0900
Message-Id: <b7e0092e8e7157ae659e32e8ec0e54b778cc1909.1744787186.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744787186.git.ktokunaga.mail@gmail.com>
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: xGi2+udgXg6H

On emscripten, function pointer casts can cause function call failure.
This commit fixes the function definition to match to the type of the
function call using g_slist_sort_with_data.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 system/vl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/system/vl.c b/system/vl.c
index ec93988a03..8d89394b45 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1523,7 +1523,7 @@ static bool debugcon_parse(const char *devname, Error **errp)
     return true;
 }
 
-static gint machine_class_cmp(gconstpointer a, gconstpointer b)
+static gint machine_class_cmp(gconstpointer a, gconstpointer b, gpointer d)
 {
     const MachineClass *mc1 = a, *mc2 = b;
     int res;
@@ -1573,7 +1573,7 @@ static void machine_help_func(const QDict *qdict)
     }
 
     printf("Supported machines are:\n");
-    machines = g_slist_sort(machines, machine_class_cmp);
+    machines = g_slist_sort_with_data(machines, machine_class_cmp, NULL);
     for (el = machines; el; el = el->next) {
         MachineClass *mc = el->data;
         if (mc->alias) {
-- 
2.25.1

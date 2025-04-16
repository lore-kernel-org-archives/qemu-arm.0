Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3179070njc;
        Wed, 16 Apr 2025 01:16:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:391b:b0:734:26c6:26d3 with SMTP id d2e1a72fcca58-73c26d39553mr1503834b3a.5.1744791365464;
        Wed, 16 Apr 2025 01:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744791365; cv=none;
        d=google.com; s=arc-20240605;
        b=CcOV/uptQ6BszP8QwCM7pyDxUdr8krd5FynopV5dciD1c8hXlYHq1JgKsXOPmftWh6
         zomRd3l5I0cGalQiPdJLlofsE/ALwrjP/YTJamRoQ8zWikJsqkrLlzWaibE5lJkFHrlL
         6ptg3yzZORJOX7l26WnYGo7AEL5Y0nKPmqNRugihys9kGBXkwi4iVVPMDhU/5XbdLJ+x
         cAPstOzzuqMUqqM44TZa1nzhtA52uqlB8dQSas1nTj8Aw0WntKyNbX2u4HlgQEwrmUJl
         ZFlNbgZsRJbDFr39H87Z5eTSZhu6D07W2dz+wXv3fUpureC5tLiWv0Gi1ruT5O8tQ1tq
         slGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9eM0jw4nOu+oWx9X+qy9FQBh8QDUlsZEwEq7XZqMA8s=;
        fh=ukJ7HZBDWzKKprDKbm4M8/sqnMVe7xVrWaqGKpa6v5E=;
        b=D2kuJFE/G1TJNGeY+00/xV0s1pa3al4Spk1oe6t5hL8USalvKZ92SpbuTi0cxUW4NG
         hu8tfqTjpni38LWeVYIByKDPmp0O2bxTVxjRUjAUs0oRBHmZ8ds62oiOWYzkruHXMDBH
         y546/3uyswVQHW5c75Qrqay1kg0SstJniAgkh+I48hEhrvxRRuz5CQWWYx34s9ZDoux5
         ubd5W0OVfGBHCA8htKsMewbLEQaxv5CEgahHT0soXc6Y0q/fWg3Cc/p2We4FmUJHc3hi
         a8+Z1qMj9KL8ImcimfFh72cK/10xzWqHQT9+sripDAAplHcBKTGxfIlCWuUPM8bHr9Ye
         68Ow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=dpJKM2Gy;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73c2257802asor710160b3a.6.2025.04.16.01.16.05
        (Google Transport Security);
        Wed, 16 Apr 2025 01:16:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=dpJKM2Gy;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791365; x=1745396165; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9eM0jw4nOu+oWx9X+qy9FQBh8QDUlsZEwEq7XZqMA8s=;
        b=dpJKM2GyoH+j8hMO43iXPzunLee1k70CJFqxHyc8pjr9gR2dC+h9zNpaX5tk0nxUzD
         NTuNQgNWeuvgPQcejJQn1Gk4Nf/zgX+0Vl0ufdp8oRP+RcHe4K/0jNkYtginsrz3696e
         QvS1PelnVDcvu3oCPR70Xf57iXZIJS2p08a8/P0DG2uvXeutZq5+m8kFhts5vvJ3dQ13
         rNWncNBCPvxoU+vlWIqrpOl5E21Mcrjx45JcgFB5JDsqve/9iBtA+VpU6CNlIIvH1UY8
         fGWyCYuX/snwI+ppbNgwblHPVQq2lZsofc8wuqfHhFOQhnpD4evoCJt8IViyXV+7nK2i
         iC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791365; x=1745396165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9eM0jw4nOu+oWx9X+qy9FQBh8QDUlsZEwEq7XZqMA8s=;
        b=M9eRRUk7nYxOmXGuqJa6mCj+XDlSSElXK3Zl79g4ozvYcAa71mdQ5z3JdI+7nvZOU9
         mbXhmsAllnU0zK3Pi5r6eJqc9cd91y7xxAZM6hUS3b7DLGp0J6e6qqaJFIn8I1cTXYST
         59zwtM8/AHBlbVlaoI18v2YLuMmbApe3DjUNK8gQEon4SrRZTyJDZia9KW1fqmmummT1
         WPxpex4NhaV7thDYkYgeAk3PMmf45StqNOzCJvKuB9V0cPkPcQAUcV/6xkXzvHhXFWnR
         MpOr/NcoVLFjHjoYMvOFUfNnL2jkoVfB2bKKdcWWoaJI87zTbEzGzGZPPe2DtQYzKqWc
         ih0w==
X-Forwarded-Encrypted: i=1; AJvYcCUx2wMdWF9htfMPjM1Tew7YVgT5v66syO1OQS6ZFbIE1fm0y+nY44MZ+fPWMf8syQeu+NlzLR2DOM85e0QLkpO9MA==@linaro.org, AJvYcCVhPVJw3aL/r815JYwRD5iGyf3CL7R7Z6eieI6ivHbEjruZU678D8jJ7RVenMvvJFfJEDUMe/97X1xaZInfS9GspP4=@linaro.org, AJvYcCWOIK0V4h2nq6SOqoyHFDFdcWiXlSVqybmvW4n5XknpX8JVErlnvJZwpVrAh50Wd9mRLe6rOAFl3/ODvl+g@linaro.org, AJvYcCWOsAzka4Y5cxIZUGJUwHBclFV00Ok0eLm8frUG7ls40CTaawV2aSJgyKG8J2pRb2jzxl6n1N4v@linaro.org
X-Gm-Message-State: AOJu0YxEtsDzgIiNUQWgzfwf1lP9Ajsl//HgYUZ7rbPPGawzmDUaD5MN
	nrQ0K144K9A9ZZz4o736a9SGPEu+hrNi7fKbGKfCeP+lZN7D/G6F
X-Gm-Gg: ASbGnct5FdQSjd55/+0EwhmhkdnhDFcZaKOAccuxx8aQX9gmYg4ND6qlcPG/nzVIbbr
	mm7xGUsHi2RpEPyduqB7eofoaMmBnHYrXsb8aQfXvCjA74FvkbuyXE8HtrYtgubtKHHvFpJxm/F
	cbV5GAnmSTB/xBaH9DqemI2KfOmCKt99JLiR9VhDY71K3WfQAlGUiE7V96Br7KTh+AfrMQgUez7
	P75wG1sDXntbryP0atgC9Kv0EiMm1nFIxYUfx5yoMLWcFDACuX+5mHGvUSyMEtECIAclXx/Q6QV
	PO9xme32B2JX8oUwyMGWtPf8DIapcjJi9uGh6YEXv5rKlAqxFRp60RRooA==
X-Google-Smtp-Source: AGHT+IHuXOMzEgeut1wt/ioMVDm9sPvMSsSZ72Ps6KyQRsi/9QtAQ22BiRbOpCSbljETerW1LR+dBA==
X-Received: by 2002:aa7:8890:0:b0:728:f21b:ce4c with SMTP id d2e1a72fcca58-73c26d3939bmr1349443b3a.5.1744791364649;
        Wed, 16 Apr 2025 01:16:04 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:ee5a:e672:7d4c:d43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3263sm9839445b3a.38.2025.04.16.01.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:16:04 -0700 (PDT)
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
Subject: [PATCH 08/19] target/ppc: Fix type conflict of GLib function pointers
Date: Wed, 16 Apr 2025 17:14:13 +0900
Message-Id: <f94cc2339befd094e6180d876e3098880cce2dfb.1744787186.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744787186.git.ktokunaga.mail@gmail.com>
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: lU27S28vBbUB

On emscripten, function pointer casts can cause function call failure.
This commit fixes the function definition to match to the type of the
function call using g_slist_sort_with_data.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 target/ppc/cpu_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index f81cb680fc..f03e48ba31 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7115,7 +7115,7 @@ PowerPCCPUClass *ppc_cpu_get_family_class(PowerPCCPUClass *pcc)
 }
 
 /* Sort by PVR, ordering special case "host" last. */
-static gint ppc_cpu_list_compare(gconstpointer a, gconstpointer b)
+static gint ppc_cpu_list_compare(gconstpointer a, gconstpointer b, gpointer d)
 {
     ObjectClass *oc_a = (ObjectClass *)a;
     ObjectClass *oc_b = (ObjectClass *)b;
@@ -7183,7 +7183,7 @@ void ppc_cpu_list(void)
 
     qemu_printf("Available CPUs:\n");
     list = object_class_get_list(TYPE_POWERPC_CPU, false);
-    list = g_slist_sort(list, ppc_cpu_list_compare);
+    list = g_slist_sort_with_data(list, ppc_cpu_list_compare, NULL);
     g_slist_foreach(list, ppc_cpu_list_entry, NULL);
     g_slist_free(list);
 
-- 
2.25.1

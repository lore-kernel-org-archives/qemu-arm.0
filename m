Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5783367njd;
        Sun, 27 Apr 2025 23:40:05 -0700 (PDT)
X-Received: by 2002:a17:903:1946:b0:224:584:6eef with SMTP id d9443c01a7336-22dc6a54623mr119700445ad.41.1745822405000;
        Sun, 27 Apr 2025 23:40:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745822404; cv=none;
        d=google.com; s=arc-20240605;
        b=YMjLl3UyUm4tqV7y66KhuVvOYS0NmsdQKs/6QaJOGuWHPO3jjhhw+GxGbBye4pBnTC
         VUcnOUWqqxh4NKTZblYS8hmQF6T4ZM1NOUWWp8lSFnIobPa77aWYQiTM3KVt16dzqr7+
         GOLLz4v7Vmh6zjxXhFkWRgx/VycOu8K8ET6qG8PrMgrSxKs81URK4hFFH1inNJrM/Zag
         6GkoUq0pfzqxBJB8rHGzMfsBWX/eK+sR+E2Nnw13fnrAyCmp2RGy2cw5INBnxByQW7Gr
         6mGv3uNkP/mVGWdRYDolOXlR7YCedS3ODCtl/yfa+Cd3S/78grDNPPk8OqC8Ud4dHD7e
         oi5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Rhl7SgHNqhrCHuC+4o7PMjllPHDODH7BlNYtz7qPS2E=;
        fh=THZj4pn8hNbqw+xSAAL9ZOy2nb4HVxWt2TwpSj8HhZw=;
        b=i1O0xKquXa076rleWB8sGaVIs6n3n265M9klNh8eI5cncXSVnZhYVwjE7C0/RDerKs
         3JTqcKG0qbm2F4nPu42JMASuJwpt3v3BnJMsFd361eZz2TAK7iKFFoGJbyDXyuLaXs80
         tVn/7jwIO6Mr/XvczdN4tDaGMVbY3l7sqpSaWkQ8E62Jn6sqX5kMQCIEt60J/8+5J3Wp
         sjwe4Jc0NeLB7inWZf1vPC8vCgzR8nKaVCps5xOPpEKz8k+dbkiJ1nv5uCez63TCV4BT
         oU0IqOpV3Mowxa5oHTqXuDPDHHj9txHXbM1bUL4OH7ShfAPhItW1mH0Yrcvp6/U8UNsU
         aLQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=iZWAe4o7;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db4dc950bsor57763495ad.5.2025.04.27.23.40.04
        (Google Transport Security);
        Sun, 27 Apr 2025 23:40:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=iZWAe4o7;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745822404; x=1746427204; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rhl7SgHNqhrCHuC+4o7PMjllPHDODH7BlNYtz7qPS2E=;
        b=iZWAe4o7u9frad40EKsgIi4b2dLcxBaNkgn8qc8wXPNG0Rt+klA8AkaypFeFxOXZY6
         JrC6tg0t0vIRbPW6mbK7yeF60FYlchH3WuomQTRckYo/+GGpGBh45oRjep8bDWQBBND1
         V5feoM/jpAjqQ5oVtzJ1s/JtS8w89ftcg6VA0HbfKr1DZ0IZyIKfuTs9zL+AHisRHarV
         yZnRvRADzCKVvQAiVlaqyCmqY9D6UOjLlgZ1rGmqpD0QgWiUg8SeCLuqeuzMzJMOX+12
         5eelXIH/5r7IspRgBTuq0f5y0y0oZhi0aJWI3jRA+e+oDufs4mMV2zFBT4zelAeMOt5S
         WElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745822404; x=1746427204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rhl7SgHNqhrCHuC+4o7PMjllPHDODH7BlNYtz7qPS2E=;
        b=oqNDoCpRHuykg3K50cueLtjQrypbzCzbF+QSbUishA+nB2WgRaI+9Ytg23BGrJydRI
         /FjxFJHyKLZsMwtUIIqe9+Q48On/P/QNXYt4cQiIY8lNnYdr2BKbylloY2N+Bete4N82
         oZtbNk5C0ZVu1Gn00VKMilMY6WjXbK+NHuzL196LFvPzZnKeRQHuRDakjQdiB2yM6YJy
         76xqm0aCiYyhdahrDyFCpA0O1772AqTMTsgkAsz/WURS3hoL5v8mFAFhas9uEqwAshWT
         11ykdF5AqNZgaBtpJAZEZIj1P3E3ZZe9Q16A6Qt31Q5+EFHEei+F91nk8TSz6J4gVNU2
         MFAg==
X-Forwarded-Encrypted: i=1; AJvYcCU125LM2zpo0NKk4rpNlK4Sv3paRswSFE9tewsmo8caAfnQYRlpdjxNGAa+HQ0zUQ+WpuP02fGRQnn/lBBo@linaro.org, AJvYcCVo+cRTEofhl9E54VOVhjHyrxOBp+m8M4lthgaFr4hYnU3rO1p1oA/xHrc5F35c51T///Wz6rKf@linaro.org, AJvYcCWVPnC6DcChpx9DZW2VMzo/IrOyzRfX+gZTRIQw0ClIL9rBnOPJX5OsU4QS4Hsp2rdkgN+YncYImbRIsLy+nPdPmg==@linaro.org, AJvYcCWc1DqBZhgIdmAP5Gk1P00H46p+d7uNY/MLyZzvHwXp/kJ8hZ3or5tBg6TUx+wqAO0JLGocoUVDZi4SHcjFP621cok=@linaro.org
X-Gm-Message-State: AOJu0YyyQ7602WJ1smfnfv7KwgA6Dn8dFJ9N+mzabY3Wfp9ngFcdyY8J
	vCzAw9w2+xcvLGnfSq4ZamPLd+4cMWnW/sy78eubiD1hoOZ3L8+3
X-Gm-Gg: ASbGncthmYSOFUkitpaNvaOfcZWkYYRsTdUbM3aY360X9VkF7Txxf5w13Ag9m18uqhS
	B39McJD8CXb1VGy+RHNO1n9NhujsnDKrB4L5msilT7jPARQrp5Knx/KxcyKKNyMMuaF5cTH5Tlc
	cCaLVh1VcoWL/0Pnj8JwtMmbBmOKKBjFdG60n+zdyo5EPEDT4VvWkJtAcxGXgy4M0xA9MDZeCMA
	jZAN+TrbkLMqrPZMHMtoq4QrnWEPEADVOMGu8UNMl2g2drktkd8T6zwRnD1Ss2SgeFfZlDbCGmJ
	7kyv/rNp6578x8OUyGug6DMIr3Utr/evfXnrww==
X-Google-Smtp-Source: AGHT+IH/pQr1HaXwwQxOTF+dfkdY/KSrS7j//yGwNz7f9oTgv4VQET1V0+fOtfXBRUasDaFSRlC3hw==
X-Received: by 2002:a17:902:d492:b0:224:26f2:97d6 with SMTP id d9443c01a7336-22dc6a09a5cmr123343665ad.28.1745822404369;
        Sun, 27 Apr 2025 23:40:04 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:bcb:2cf3:f1b5:b7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe328sm74721215ad.88.2025.04.27.23.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 23:40:03 -0700 (PDT)
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
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v3 03/20] system/vl.c: Fix type conflict of GLib function pointers
Date: Mon, 28 Apr 2025 15:38:52 +0900
Message-ID: <1349103c97e4cdccfe58ecf8fef4408f9b9a9900.1745820062.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745820062.git.ktokunaga.mail@gmail.com>
References: <cover.1745820062.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZDx2iH/9GeJF

On Emscripten, function pointer casts can result in runtime failures due to
strict function signature checks. This affects the use of g_list_sort and
g_slist_sort, which internally perform function pointer casts that are not
supported by Emscripten. To avoid these issues, g_list_sort_with_data and
g_slist_sort_with_data should be used instead, as they do not rely on
function pointer casting.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 system/vl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

V3:
- This commit is included in this series sololy to ensure successful
  builds. It has already been picked up by a pull request, so please ignore
  it.

diff --git a/system/vl.c b/system/vl.c
index c17945c493..4ab2001df7 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1524,7 +1524,7 @@ static bool debugcon_parse(const char *devname, Error **errp)
     return true;
 }
 
-static gint machine_class_cmp(gconstpointer a, gconstpointer b)
+static gint machine_class_cmp(gconstpointer a, gconstpointer b, gpointer d)
 {
     const MachineClass *mc1 = a, *mc2 = b;
     int res;
@@ -1574,7 +1574,7 @@ static void machine_help_func(const QDict *qdict)
     }
 
     printf("Supported machines are:\n");
-    machines = g_slist_sort(machines, machine_class_cmp);
+    machines = g_slist_sort_with_data(machines, machine_class_cmp, NULL);
     for (el = machines; el; el = el->next) {
         MachineClass *mc = el->data;
         if (mc->alias) {
-- 
2.43.0

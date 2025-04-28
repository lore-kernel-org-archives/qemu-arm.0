Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5783766njd;
        Sun, 27 Apr 2025 23:41:15 -0700 (PDT)
X-Received: by 2002:a17:903:1b27:b0:224:255b:c92e with SMTP id d9443c01a7336-22dc69f836cmr114837605ad.3.1745822475581;
        Sun, 27 Apr 2025 23:41:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745822475; cv=none;
        d=google.com; s=arc-20240605;
        b=eVd4CQz44r7MXPf8wVc+Zq4I7nIrT4DzCTqGKJd1qKgxfGW/myZ9H96BcEs7knJWW8
         gmAhYrqFg/7YMhclqk5Y0t5k3Urfl2lGDBsy4/I6oN0rgqa55ECgzqjFjgz5lgRJlg0b
         ghMStWPDUXv2DNjyFJaOfMRwi65h+rdE/TWqHsSYndpNp5pD4EMNCUulzHHA3Huea8IH
         j8R2JSYxUpRwp6BSQSFlzgl5tDqleNm+8ZHvYxf90ZcQdBMEQDeEjL/A00EH0Lz6acvz
         eNPyo6Tj+C8vIU7MUCRrjaxxQzJAoAwPyR0WWn+arZPlzBWS0D688kWfhEBFhacygmwR
         sGiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3dFmBLtca5z+k4npQ+vmJi+va4ESRCI4ZS1XYe4MkFk=;
        fh=E521fOiIvk0/OI311ZHLg43jXELqf8yvWxJPSfQdKsc=;
        b=RKF8rLumZyN6GCncge2+tgS0lLivaIFyqNzOImV1LhR43HPyCrvAB3VRI1Ha5WblPc
         kVUlsimF1R2u88KQc5/pRtKQ4AONgSjEoHE4VEYTQkB4UbdkjpnsNhRY5w+4GTsXU3P3
         MUP8PGCT4QDer9m7HbD16W9IlsI8Yv1Vu6ltp9oSgi/IjP1iGOMoouKcZMqP2oANBZj2
         Y0W9nXUDF6S1GxTfWVf/LGXhGwWavnoFmUazgsrRpjng4qr+2e7M1/0fEuMND3yhLnFK
         z3bRgd1xHFTxRqVBrs8g8KVgKPNJEB8mbV5qg0HWuG/qKlfqCs8+tOxbEi3GVbkRI7Lj
         r0Bg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ecSImBFl;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db4ddf752sor71568415ad.5.2025.04.27.23.41.15
        (Google Transport Security);
        Sun, 27 Apr 2025 23:41:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ecSImBFl;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745822475; x=1746427275; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dFmBLtca5z+k4npQ+vmJi+va4ESRCI4ZS1XYe4MkFk=;
        b=ecSImBFlv8IvLJ4p6Vta/DNWIjmXp3A17VGHg8GKRGnDJvSJYAyP6xxM+G/jZDrppC
         Ng58oTQWvianQ9JwH0olLu18J5na1CD2Kf9PGOeAZ4c3v4SwZLuoB1rBVFdLJBO9CkpZ
         KWAKfGaqDmsw8AnySibSkZ6hj6+qoSX+YExa8DtkScrh107Kls/zMyf80D/J8ZpCyCdF
         yXU3cImB/UsSYsSTXFm+OoCUAxdzxckJj3amix7nCiyrrZLcClfKdnLy5nVTQefRs1EF
         kAP97fEvmpy0Xf0Z0aB6cEC0uz88uEPVlNYjnIRQLu0A0fnXGteTL6KmdRvUiMantIyd
         yRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745822475; x=1746427275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dFmBLtca5z+k4npQ+vmJi+va4ESRCI4ZS1XYe4MkFk=;
        b=c427+iVxtzz0b5BPAOTTRQ/yKvEqHaMOMZHhQPEHZXTpGJHpTfjxjT2qL86OsGkclK
         0CD2Yr3TuNehDMS+JfKhK9Sq8ebSgZ7IWNhcAatiBWrSp0IyWe47Jn+MOAAePmjZgh6c
         Qjjgd5bRQQ55y/Wv38HnV3pM0DH65LxprsgCD1pTZz7HeJuthOhJ+4IYjwdY0pB/AMUV
         +KYqvxoIbWLiB3c5AKBs0NT429IDU25C2BXKBCNQ5Ci5VLcYUE0oyGVlryMG5yinZy/r
         DI3ys5+20CFrUho2Sl0yIfnJG0rNPyiBQLdk8j6kIE1U/aN9YT3n1+MZ2XX2jxHDmRzH
         q5Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUsxTlRbSAaNKfMXtdOj6ThrZJ7Pe1asl6MRhxWBdoGjG/xlIXeyTUO4rjFT0A/fKVap5R76KyanHu0BjA85b3jjQ==@linaro.org, AJvYcCWQcnYuuGS2I+CVOfscYQF0EdDKk7Ojd9vE1vtNyr4JzPM/N3yvN99WCylO7LzPADGR7jJAs4ta@linaro.org, AJvYcCWY1xOPFTTcUzCNAMbD/UBMK5QN8mau3hXo/UXo+615pAqhuRGKEZEDVDwUlXHcT+57+0OL6z7EsB9GyjETa9SV+L8=@linaro.org, AJvYcCXVfuU+DpTAaqXuOjXa8PfEFTwlkC3GoiVWuLp10ydDI32a4QGm3Lpkqet4sl7YE95pjZSxh5JO/eDkXHmk@linaro.org
X-Gm-Message-State: AOJu0YyLViEWjqjep+wNFnJ7kuWZLR71bmJA9+6OSUE8Nsq6Axj+whYo
	H/Vhc7647yS6ZwXAl6MUQDbt4LJYfQNPfjZUYCyVWLaVar+oSNP7
X-Gm-Gg: ASbGncuic7ZsZ8vptXKVkM3oz7eVfyaSxGz47+Z62PNwuVpJQZGekBI36gLdWTfhurx
	vGWF5mBmGmjB8t0X4+qT9X5aGNh4daStAllXG++6/KAib6oza7EYcwG8We7YYbdKVZLJNo8cQiK
	rTtphdyxOte7DGeM5Zbdx6m9E2lZ9iO2tWT0I9TGCJLQDQVTsswsEzWcyhA6rwA7BYMjxTUV7dh
	LiArbA6M1uuEwWgP3eiOdgwzxT6Bck0y0mpuergbEZwto2jxK88h3K6N51N4Or2Iu/qrVgT37Zb
	BoPgZ90OZQspIvKQVrHGgo+Tx4vLoJJ3MQd+2A==
X-Google-Smtp-Source: AGHT+IEV7b6RfMBnPMMkbl7l51hr/9768Z1MTLBGWF6csH0hrlzffpn8bp/f0CJci2DJqbriCeykBg==
X-Received: by 2002:a17:902:c945:b0:223:fabd:4f76 with SMTP id d9443c01a7336-22dc6a17d6cmr108623535ad.30.1745822474870;
        Sun, 27 Apr 2025 23:41:14 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:bcb:2cf3:f1b5:b7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe328sm74721215ad.88.2025.04.27.23.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 23:41:14 -0700 (PDT)
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
Subject: [PATCH v3 12/20] block: Add including of ioctl header for Emscripten build
Date: Mon, 28 Apr 2025 15:39:01 +0900
Message-ID: <49b6ecdbd23ff83e3f191ef8a9f7cc2feeaea43f.1745820062.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745820062.git.ktokunaga.mail@gmail.com>
References: <cover.1745820062.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: V56emotLbCnf

Including <sys/ioctl.h> is still required on Emscripten, just like on other
platforms, to make the ioctl function available.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/file-posix.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index 56d1972d15..69257c0891 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -110,6 +110,10 @@
 #include <sys/diskslice.h>
 #endif
 
+#ifdef EMSCRIPTEN
+#include <sys/ioctl.h>
+#endif
+
 /* OS X does not have O_DSYNC */
 #ifndef O_DSYNC
 #ifdef O_SYNC
-- 
2.43.0

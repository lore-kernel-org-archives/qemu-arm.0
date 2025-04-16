Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3179202njc;
        Wed, 16 Apr 2025 01:16:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:2ea7:b0:736:5f75:4a44 with SMTP id d2e1a72fcca58-73c267ead61mr1509702b3a.22.1744791380881;
        Wed, 16 Apr 2025 01:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744791380; cv=none;
        d=google.com; s=arc-20240605;
        b=JRw/FICXm7yTBe2xx8XTMJqyt9BBzd/xNKp5Kbq0sGM/Gj5uqhkz0t4h8doU0EjF0O
         h1ab15XQYjmSV5nOrQhobD9oUCdBrQEkF81JQRPRGnHVRGAwf9qlpAGcdaDGSfThuwWB
         c1Q66cDeigh+pc6gOjcBxD8U7hFD8Lx+IHV5wOzpa2UFfv6S6mZgbnH6c5fLYi12+CUo
         tL6ymnTpNATZkC4kBHab6YJQJPRAH39XaSmXtNidsEHsiuu9xoNrepWMebb0S/t3JwG0
         RC1Myw2fat9DvahtekWUTv35YmEL0GRe7ZbDEUU3VxgSdEnnnRMp/N1rmz9tmWaKx3R1
         H+/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=SASE3XTeg/hH1Bv2p0ymNoIDo1zAKPv9dOqsCm+H98Y=;
        fh=Wr6T6L0BSIYImohJ+0YWio4sfitEKC84Q0kNnkZT0Xw=;
        b=YZqjdblGvQ9vUj6qzrkBAo0/y1gkp6dYFAaiK+GAZA/xpKYssdE0YJTH7dyT36W/Zk
         8tMoT9Z7s0uH1KC0Wbmss9QdHFcxd1Yus+FXkVsIrld1gcpZejkZOqEZnikbPCn2WOur
         aivAJTVubKky14g38wZWBzRxV1TxRVB8h65vR6sO1MEyrROwjL0SZAns4yYYYeUiu+Cg
         p8c+lrUmZ70gSiovlRTZ50LeUECOEaoxfTVJSMKnaKhwLA/Fz/eBlvIY6gfIb92r8zQw
         iux9xDeNmgx4ZkhVbfL3GnHe3t4VjLZCGOCS0D6LDlKdwLF4BEGnDXGB6dW5W+tsbOz0
         CJBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=gUbl7vH9;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73bb1e33d22sor9422073b3a.6.2025.04.16.01.16.20
        (Google Transport Security);
        Wed, 16 Apr 2025 01:16:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=gUbl7vH9;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791380; x=1745396180; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SASE3XTeg/hH1Bv2p0ymNoIDo1zAKPv9dOqsCm+H98Y=;
        b=gUbl7vH9zP60088OevlvTaB1BXtJO8mrFrGUMXGYSU3oBY9XMJD63d53yJ7RMJ+Wqt
         LgtY9O1wX+OgMF2FzEE0NdXnT6ZtiR5PCJijZEg9+V6YSutVn4Q7gen8+ING90aO9Lcc
         TGtETKkqZUGeJUXJJoCDwzo1ldpppkDnj8nV8EKhIbE/oqydHHc9fVVlBZxMNDtrv8if
         LofpNWJhEzvjpdI9Wx5rj6G7hemneVb9H70I3hpfYCGPBn/iZW5P+5tw2qT2Zq5lK+O6
         Y6/4gwk1avRoY997ao6vte9hVOGgNHQ3G77wBpJfRHaQtc772YX5eiodBAhgyKxFj4td
         b50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791380; x=1745396180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SASE3XTeg/hH1Bv2p0ymNoIDo1zAKPv9dOqsCm+H98Y=;
        b=DP1AaQp67eNsJxoa1ZZVBQgR360y/nuNh5WKmST9UE+QCFfvwmEQZQ3zfG+ci0BWoO
         NzJAH+iqNbIyoKz7n8sd6vbshkBvO++IgCH18gFk5GNWW25i5kdXwLWIJ6ht6yyNtZj7
         2uN75YC008OaQTfZOM4jYm7Fc7ok0kaXUwbIqg1fIxhjwD32zpF28fuDvqmYcmznCsFV
         gMubWSzLndDR3E1HRqc2jb59c6qkPm+I/WI1DKPWGvj3oNun8nwzl8YGOH1tDH50KIFa
         zdv9Qqff9UbWwgMzogveTF0cR5LI0g7m3bgoFUokxCrmH1TVBj37ex30oseREczuASwt
         0Pqw==
X-Forwarded-Encrypted: i=1; AJvYcCW8nRNJj5n1xzR4Py2yK8zABektROQ9ccyHNSPkgd2AQenct6I2glvCIyDqOsas5FPb0rej+kIc@linaro.org, AJvYcCWI3p8GrFuowDO3LJaliP/gsyTxBmqqNt65EipPkN00PQaBDbWhSKqRiXZDrI8PufnnfijRiT8aDwUl1kOAG5qE8A==@linaro.org, AJvYcCXHVG07w3pzv9zoOlwqPd/Cs70kWj03X8wRIJ+jlCZOg4UhYmzaeieWCHtt/+B4pHS2vTm5kKrGrFehanK2@linaro.org, AJvYcCXY/hnjpsBoW6YFVlUnz7YgbYiqFCD53Shqgdg9JopmDnmFjkNmM9ciJVZ/sJ6M6SE8OkzdweaB/1FWyfy6Q0o9FmA=@linaro.org
X-Gm-Message-State: AOJu0Yx5l3Ss1BsPCdRBMOwMw42WxlTqhwZbaihbhSytGZ7eFRloqflD
	rD8zBBJFwMflTYW5xR+tkqBsbr0wyHJv9lzwwTpc5rJG82BcEbJq
X-Gm-Gg: ASbGncvYrsgZKwGQVvJZTGwx6XYzkZtL+UDOe+BqB1b4VrbbKRYLqMrIg9GLjajVXka
	WG/VemUoKlk2kzBO7TqztpB6dmrgv95lWwzPBb7tXe3PdGvSO+8U2ASGMPrN/RBMwUX/JK8GVym
	90brCBKyQufxuFhWTNusD/ExivS4wGL0n5mXeIvhgtr7PICx4Aw4uGfUL0LTSMZrrNGC7dw8g3j
	wb7ixeU9Kj33vgeOhztAiKxmzDQvKaTXeyMY00Wnipf6o6hheNmJll7CufYmgmSyxeJnNAZ20Uj
	skpcGOsQuiN+mqolOxL8D+xuUEfNFf7+U+tgmA2zvarM+Zxoxi1Xv0hijQ==
X-Google-Smtp-Source: AGHT+IGZVnR6iExg3SaeGbXovRMHfu4V9AyLUD1Bp7HiSc7H8Bjv2sq7p9nu4P9mJ0RjhTJsAOhTYQ==
X-Received: by 2002:a05:6a21:150b:b0:1f5:97c3:41b9 with SMTP id adf61e73a8af0-203b3e4ffe2mr1258840637.5.1744791380301;
        Wed, 16 Apr 2025 01:16:20 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:ee5a:e672:7d4c:d43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3263sm9839445b3a.38.2025.04.16.01.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:16:19 -0700 (PDT)
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
Subject: [PATCH 10/19] include/glib-compat.h: Poison g_list_sort and g_slist_sort
Date: Wed, 16 Apr 2025 17:14:15 +0900
Message-Id: <f6e0e42ae3491564478929e412991c2a16ee3539.1744787186.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744787186.git.ktokunaga.mail@gmail.com>
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Tk4owziwwW5u

On emscripten, function pointer casts can cause function call
failure. g_list_sort and g_slist_sort performs this internally so can't be
used on Emscripten. Instead, g_list_sort_with_data and
g_slist_sort_with_data should be used.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 include/glib-compat.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/glib-compat.h b/include/glib-compat.h
index 86be439ba0..e441b396ef 100644
--- a/include/glib-compat.h
+++ b/include/glib-compat.h
@@ -36,6 +36,12 @@
 #include <pwd.h>
 #endif
 
+/* These functions perform function pointer casts which can cause function call
+ * failure on Emscripten. Use g_slist_sort_with_data and g_list_sort_with_data
+ * insted of these functions.
+ */
+#pragma GCC poison g_slist_sort g_list_sort
+
 /*
  * Note that because of the GLIB_VERSION_MAX_ALLOWED constant above, allowing
  * use of functions from newer GLib via this compat header needs a little
-- 
2.25.1

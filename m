Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2136683njd;
        Mon, 21 Apr 2025 22:28:43 -0700 (PDT)
X-Received: by 2002:a17:903:19cc:b0:224:24d5:f20a with SMTP id d9443c01a7336-22c53620caamr221125335ad.48.1745299722922;
        Mon, 21 Apr 2025 22:28:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745299722; cv=none;
        d=google.com; s=arc-20240605;
        b=bOOg2LdgtBlyaQrhBKluQNx96QYpLFz+y8AlHl3U7+T6YBpYGMqfWNYdOs2gg43VCb
         BzsP+uF6cEDMco7fkbsfjCYG1jAlbanze7WKR1UPjGpnVp1cDu0J8yD1kfk04ZriR18f
         s+EnHv2f/QGOIMBkkulPIitO3jQIMdyTC41Oja9M2yL+fF1Cli+TT5zhQTZz/+cxAx4Z
         1dLczIY3jDUhf+Jgfn6RX3VvZgDwwUxc15HuXqbk6Tn9gmhaIPf/IvYV+2kPHmPpdWSa
         vdsrtZ964uRPJdSA/UvtZJTCgXRKRT6UjPcehFxTP1ForORzMAb7bl94/l0oUeE1VwEe
         ZCBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hr9XXQB6Zuvd+iKttpiqSUP78igtxru6uVhXXPY7Q/k=;
        fh=DI8b5Rl1pH0ZkB0K+2/sXW1KM8Gxth5vKxW8B6QHXzY=;
        b=K1DG1Gry2ju+6v5BEIVJHH8Dz3y7kfKFswS03NDzEwo7n0KGO0KIJUwub2Z0wwPscI
         gPGa3jma+Irjpy5ZZ1guquPam5wiz0P2QKix2Wkr/+694B1kmjv/Hz/glLUWNohkGbL/
         WP90eaM2mciaCd5EsFkUKKjKMDl1t+F67/R4AoOuksV5/t0l+/LLK5E/dj9AHjZuTU7i
         gWZYj+AquB4TOpicHy4yq2cAyMbX02nxT+VIJqJIInzYMszGO5JXb9I3ns0KOAg17TSc
         vmWE0iarzeskFFR8DGffQydK0Sj3RPVor8fWIgM79vcFwBhMyjp4CQb+WfcRX/Mlg0FT
         OEOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=H0xpURhm;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22c50d7ba82sor73625485ad.16.2025.04.21.22.28.42
        (Google Transport Security);
        Mon, 21 Apr 2025 22:28:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=H0xpURhm;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745299722; x=1745904522; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hr9XXQB6Zuvd+iKttpiqSUP78igtxru6uVhXXPY7Q/k=;
        b=H0xpURhmw381rTWCWmz3ADcEZuXAHzzyICqskPygJpSwsglGbT/iFPBXSLzAnBijS7
         YiH2MwqHYx0nbjZnu8JJ/hT4xQZHRqA5Pqx6z8pKDKbwx+PQSMiWubWduBXGfVyc8BKR
         HBuKSc/DncOf5uoy2Vmr7jvyqRAdRpJl9va2qdzzZns+g4rCH0dMGbpWQJFRbLF9Lu0W
         CWHy6zprbqUCBvfuD+3uWz6LxN17RZIrYzjAWj0Vu40E5FUdC6khU9pwckX7lBE0CScZ
         4j4GfPfnlPCOGaKeaUQdvjjFscHrJktLldrST7FLja0f9RLKODVzq/ow/j9yl+YThrCA
         Otqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745299722; x=1745904522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hr9XXQB6Zuvd+iKttpiqSUP78igtxru6uVhXXPY7Q/k=;
        b=UPr7+yA7QwUuvZmiCRhTeE7y0AyrCdBkKe4TZ5TLwwYy667CvB7NEBNiYh3EwAr4ln
         VQHQ0Aij76bYgTEmF2IdZwymr1HdksXLLUOXznJOWc+qSniBdTYH8wOg2OE8bUPZ7xsZ
         U8yg4vCcYKGs1pdoUCL1Z+TR2oUlrXMoW78AivKD24qMKlIU0ktBMbiWNUboNTbnLD1M
         VLgfzJXD7IXwRM4G0H+49Mpv9mLLU6DI8xPMs8cK7DUT8kVze2bFxBbsp6M92AWUdK83
         8w03d2Umvy1NwwMnu29i0rQ8B4QUfQr48SsbCtDzW6GdNJ/KsPt8eDa/YyoxFEhKS8SE
         CJBA==
X-Forwarded-Encrypted: i=1; AJvYcCU39zlNrVGYuybbWjvjCzUpGq6ITxSbwS4uJIvjXRFBLeNXxeQKOzm3NjDjd90/nuOuwVgOuLyK@linaro.org, AJvYcCVSXrrX6AmOwVkvnARNQ5aQgfJFlAKrYdP4WxdKriJdzl9KQqhxuAubJMkc3q4S9c7HilOEUB5/QyjPnlpD5iLS8A==@linaro.org, AJvYcCW9X6eG9OW7FvIYmViYuu6GJbsczeMm8rGnTgLwHgl4ICwewKqnsGW9SAPU6EzBV0cs7n48WvI8K5Pknz4g+Lssy2Q=@linaro.org, AJvYcCWDOELsyQBOvebfI7TiBFZO1tVsCkevwNGlX/6ya30+3f1HiewYljRB86H5J2IpPm3YIbCeyo7iGtfIwapj@linaro.org
X-Gm-Message-State: AOJu0YwIhmvC3CfggxtDgNFUZJ+2OdYNNL+NT35mShTZIM346uiopeCv
	rM+M+NKLOeeV0C0BzvXvn5oafi4OfwFzVL+tNRZl+a1gggPMgf6O
X-Gm-Gg: ASbGncsfURs01RKprHVR0QJkFDwF4UXKLoEZzR0K/mh1CDRPBeQ3GP0sn8WJLalaDtR
	wJmzynpF2NHVe1njkOxBQyRcHTGLmV5bBn5jGPLxqqXiqOwlsollHlVv7REP/1o9QfPKswT1Z7n
	Kjbg7+qtZgDN7aQHKhhF6EzSOyRW8YoNhzOm1T5XtRkTn+Yes2/6WIZ/7rc+lA2gm9VS+nMF79E
	S/habMXepf+GNY0znFs0jFKfhQqx5RcOmw8N6tnEeJuESm6FW4UCduCs/kILjN8OK9mESUwbyBb
	p8LBoDh7g2dBzwX2KHN3LTqfjM0LgNuagck34Q9Zub97Xjv+qR88DQ+SNoxDx34Jp4C0qg==
X-Google-Smtp-Source: AGHT+IFEW2NT+cAzggJEpQL3dt6BcmbrJbdC6ZiC0A9EVoOH3QZflzMIs4u+eWmxfq5VVr0igUgIOg==
X-Received: by 2002:a17:903:1b67:b0:223:377f:9795 with SMTP id d9443c01a7336-22c530bbe9emr210573765ad.0.1745299722329;
        Mon, 21 Apr 2025 22:28:42 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:e142:4a4f:1ebb:3ca4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4483sm75692085ad.118.2025.04.21.22.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 22:28:41 -0700 (PDT)
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
Subject: [PATCH v2 05/20] target/i386/cpu.c: Fix type conflict of GLib function pointers
Date: Tue, 22 Apr 2025 14:27:09 +0900
Message-Id: <98cee904084f66762b6ef9fca4248f1c8c995d3b.1745295397.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745295397.git.ktokunaga.mail@gmail.com>
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: AIjv2o9MWmV+

On Emscripten, function pointer casts can result in runtime failures due to
strict function signature checks. This affects the use of g_list_sort and
g_slist_sort, which internally perform function pointer casts that are not
supported by Emscripten. To avoid these issues, g_list_sort_with_data and
g_slist_sort_with_data should be used instead, as they do not rely on
function pointer casting.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 target/i386/cpu.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

V2:
- Updated the commit message to explicitly explain that function pointer
  casts are performed internally by GLib.

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 1b64ceaaba..2c494e4b0b 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6226,7 +6226,7 @@ static void listflags(GList *features)
 }
 
 /* Sort alphabetically by type name, respecting X86CPUClass::ordering. */
-static gint x86_cpu_list_compare(gconstpointer a, gconstpointer b)
+static gint x86_cpu_list_compare(gconstpointer a, gconstpointer b, gpointer d)
 {
     ObjectClass *class_a = (ObjectClass *)a;
     ObjectClass *class_b = (ObjectClass *)b;
@@ -6247,7 +6247,7 @@ static gint x86_cpu_list_compare(gconstpointer a, gconstpointer b)
 static GSList *get_sorted_cpu_model_list(void)
 {
     GSList *list = object_class_get_list(TYPE_X86_CPU, false);
-    list = g_slist_sort(list, x86_cpu_list_compare);
+    list = g_slist_sort_with_data(list, x86_cpu_list_compare, NULL);
     return list;
 }
 
@@ -6304,6 +6304,11 @@ static void x86_cpu_list_entry(gpointer data, gpointer user_data)
     qemu_printf("  %-20s  %s\n", name, desc);
 }
 
+static gint strcmp_wrap(gconstpointer a, gconstpointer b, gpointer d)
+{
+    return strcmp(a, b);
+}
+
 /* list available CPU models and flags */
 void x86_cpu_list(void)
 {
@@ -6326,7 +6331,7 @@ void x86_cpu_list(void)
         }
     }
 
-    names = g_list_sort(names, (GCompareFunc)strcmp);
+    names = g_list_sort_with_data(names, strcmp_wrap, NULL);
 
     qemu_printf("\nRecognized CPUID flags:\n");
     listflags(names);
-- 
2.25.1

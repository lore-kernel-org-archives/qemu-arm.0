Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2136639njd;
        Mon, 21 Apr 2025 22:28:35 -0700 (PDT)
X-Received: by 2002:a17:903:3d0c:b0:220:ff82:1c60 with SMTP id d9443c01a7336-22c50cfa84fmr239054055ad.14.1745299714962;
        Mon, 21 Apr 2025 22:28:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745299714; cv=none;
        d=google.com; s=arc-20240605;
        b=ZZmlCERJt2wNZcr68PjvAXYAR0f62R1Ee8yqbCllGbbVuDW8oN0yKAuPkCQmJ4Qdgo
         u77FNQcD42uDzPdMaSnsNX/qeC4t3YJju5LLqjcIeT/bhaNGMkEjAvG4b+DN2B4K1mtC
         ERTIuiEIoC9btxgAgyvFVMpOvYYZ2xHmQdbsnSyiK36tpo5ZdeZUZYqALjkG/CrSBbUJ
         oKVNIyyg6P1LuivP7BJ5qkRsMHQ1QkI3QtXOOfUlP84szUC5B5owQWwT5xIHQKbi6lYP
         TggeLMc088A3ih3oImxmCgxVfi7ifAEaNIgyYQOH7Hcb7DgzsfpHdKHFigVljR45wvS2
         l1Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gefJdCUJSQLppbT4glOadpiD7A44LdH0heN3S2uo/nk=;
        fh=DJfKixpi62s7mimuOaIeH3XNKmiiC51x0ihcHMfHFB4=;
        b=OFb4FLfcab/2pIiCVq1m7TR440CFpEzOnJtETnlesvX06EbVbHouakfR+ztIhFUY1Z
         rXBTooroKzJ78HjcaA8lMt1LTwzZIoB4I/ys/dZ72zRv9YdSvyPPEyp45Eb7Od325XHr
         5cgw8A0mgpmdG5Wi7QuuqovXqv+kKfQZS2WpPkNkZdBN347PVtc3leC3Ycihtp9DrHPg
         HI6PxkZUv1/EJScVaUZVjaFgXFy4j4hhhiQKu/RBrTdrW7J2oQb7MlN6JZcywqUVdVVV
         jdXGWXxbQC6ms2b1q8ajRLM8dxLpe6psXsKizuLf5HVjV7I5Tj/1FWiJkevxnX3B8qqw
         Oycw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=AKOsPs5y;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22c50a76984sor45284435ad.0.2025.04.21.22.28.34
        (Google Transport Security);
        Mon, 21 Apr 2025 22:28:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=AKOsPs5y;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745299714; x=1745904514; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gefJdCUJSQLppbT4glOadpiD7A44LdH0heN3S2uo/nk=;
        b=AKOsPs5ywHQGeUReswLF4Gk0kJVIoDcluIVEfo8DXTA0lfeCxuGvjBYVTqFlhIgI/8
         1VmPCi8LPbb7k23viePYBZ25kZ1OxWOufT31XVngycwZWPOUOzbArypUk7qGjG1Y/1kb
         6Gyql5KNjgiFlxPSsE/JTD2Kd5lajf4RLP/PiKkL1qYgnxcAtmli/HOJqJz9+OCpPxEJ
         tvu71qshrOEcddBK7hN4BTsQJH+da/yPRLjWV7l+YsGtM47WO1kqIo/JY2h5ZBBwj9dq
         jMXypVf4ptRSR2F0MzZm2vmFfgzoQuaVKn2ga3v0231rIilBP855FiQnRHcdcDKzhrLI
         f4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745299714; x=1745904514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gefJdCUJSQLppbT4glOadpiD7A44LdH0heN3S2uo/nk=;
        b=F9MLbB2TGEtuUyyZ17ai83Gsu4qxIYM0RdDt2qn4aYHBqK5T+sYDIx+Yps7vpAQ0cI
         gfP0L8RkTBKk5mHOFOriQ+PtIQshbpNevKQoNF0jp79ulhh2LSnslH80YviGk41QTJTk
         sdQoylzUfKunk7MEDiny7nYqDLXuVZn75jPaEuNh6EU/tBhFZOJOtbaW3I7sUcXj65zG
         DCk3OkUFJYNKbvepr3lS7vqwytyzi5MOztfskgKeb9kn1I8OAQA78PJm+2fsnryGyev3
         /a8TILm925WySAjNvgFSuylmcbewLyD2DeOq/vJJ/1CzGX6UBYedlI26RSKOY5weZaAX
         pdkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2yvJprTtNOk0fXUzeeZ/uxsaNU5GgTRnsvbahZI84Lf/22oyGcthOm7XaHf1bptbNrNUVpQQLGKSeTuRaw5mV8n0=@linaro.org, AJvYcCV2A6sWnm7SKmRXXo0bQ5JlI2km2ErA2Iy3/tIKyp84gedJKoMrYoxbCvV4NsQ4ywchWYMqA13b@linaro.org, AJvYcCVoo8tcRLcmm4uxjMczzuRGpcdWKat3sDorgkyqKLHEq/XdJ5BI2EgQeIHFpXnpVz+MdPaeimRXNqmh27nPhsmc4A==@linaro.org, AJvYcCXyYaLsKmrs6Xthb4bYzsnTqXdVweHpdwlnJJ7zchyCFUIo8k0i9kz92RS+KtBT/Dg1BwXj5b+SDqCCx8k4@linaro.org
X-Gm-Message-State: AOJu0YywpTxtXgzvAVRwCakCocPTpNRgiGZNJKv88VO2meowxGc0mVJ3
	Jdem/NJSqZgRCJpGPiNYDycCIRdlYgVfzGuHHPNFMTcrE8oV6L4c
X-Gm-Gg: ASbGncvl+U7Ws7umwkjw/lL8REZ6TOBIc6hPqVVDHkDK31HPuWpPZ//KvarUsjptVJU
	EUAS4NCGG758fW6kbZDa9STwIQTXNITM7MQk0TNiAXj67d6BBKCnnSz7xio/SxA6Te23TG8YJGX
	D4thraoJ2Bz0wG9oJjCYPD7ZML3VYiUeWtQMeizBBiBgNlbGXMVMG8OpWfTJmYbI3UNgVnrLKe2
	cp0Uy3qcks/3C0J0nut7M/u3BNy4Cwr2hYQflUZDAy0OVOYPdyjc6zDXE+/S9Ss2GEYI621ekmt
	9W4DzDZ/m/tLxcFflKgDh7Yq1FCUTGb56fv1lem7Cx8+awNc6IEgni9dznE=
X-Google-Smtp-Source: AGHT+IGVYb84wyPd+77TwHY4qOu4PjCNVs7VMfmGdBcJLq1yY+ZnLAJVW3AbGcK0d3SEFuBDPWyZaw==
X-Received: by 2002:a17:902:e884:b0:221:89e6:ccb6 with SMTP id d9443c01a7336-22c53f17338mr213065555ad.25.1745299714132;
        Mon, 21 Apr 2025 22:28:34 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:e142:4a4f:1ebb:3ca4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4483sm75692085ad.118.2025.04.21.22.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 22:28:33 -0700 (PDT)
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
Subject: [PATCH v2 04/20] target/arm/helper.c: Fix type conflict of GLib function pointers
Date: Tue, 22 Apr 2025 14:27:08 +0900
Message-Id: <01b21c849b459660453eb905d12ff0da4c65f53c.1745295397.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745295397.git.ktokunaga.mail@gmail.com>
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 9pp9QX5BmGIO

On Emscripten, function pointer casts can result in runtime failures due to
strict function signature checks. This affects the use of g_list_sort and
g_slist_sort, which internally perform function pointer casts that are not
supported by Emscripten. To avoid these issues, g_list_sort_with_data and
g_slist_sort_with_data should be used instead, as they do not rely on
function pointer casting.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

V2:
- Updated the commit message to explicitly explain that function pointer
  casts are performed internally by GLib.

diff --git a/target/arm/helper.c b/target/arm/helper.c
index bb445e30cd..05793a6c97 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -220,7 +220,7 @@ static void count_cpreg(gpointer key, gpointer opaque)
     }
 }
 
-static gint cpreg_key_compare(gconstpointer a, gconstpointer b)
+static gint cpreg_key_compare(gconstpointer a, gconstpointer b, void *d)
 {
     uint64_t aidx = cpreg_to_kvm_id((uintptr_t)a);
     uint64_t bidx = cpreg_to_kvm_id((uintptr_t)b);
@@ -244,7 +244,7 @@ void init_cpreg_list(ARMCPU *cpu)
     int arraylen;
 
     keys = g_hash_table_get_keys(cpu->cp_regs);
-    keys = g_list_sort(keys, cpreg_key_compare);
+    keys = g_list_sort_with_data(keys, cpreg_key_compare, NULL);
 
     cpu->cpreg_array_len = 0;
 
-- 
2.25.1

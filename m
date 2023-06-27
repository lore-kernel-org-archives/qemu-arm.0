Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1515736ejx;
        Tue, 27 Jun 2023 09:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687882023; x=1690474023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwYXISrmUwYEeEBYbvf+rC+BgUtqy99AwD9pTl/rVpc=;
        b=LIJa8T/zlasl7a+2JlP0u6PEaw3nKQzMEaYwVuJjnL7qMpS3ibTjBE0Yu5buCy9Y8I
         gGQv72WZReSg2PR6g94UQAlAZQbucKAAMEmHYmZqsl87TuaPlkngR4u5mW3xDQFwSTTV
         YGt2bxvchx7aYR8z1CAyT5JZHO2gWEjH3VrXVfX3Sm/1GPymmdpJzB36Q2f50f5fi1dk
         0cKeKzOpXc61qPtQHlYyocaMc3YeQSAbbUJ6HZ9yNMaeY4IYmXGDyTZ49Y0NoATX6gl9
         9PrO/ZG1XC/UCl+DApg0KuPQRCYWZU/FrKyP/FVykDBcb3pu2/Lp1ARDZ19OwMppSCRY
         Kl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687882023; x=1690474023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwYXISrmUwYEeEBYbvf+rC+BgUtqy99AwD9pTl/rVpc=;
        b=Vtqqh4HOLTtHUPBd+A97vzLyZb15JHGwnim6M7Qr4mBgt0q3NYdyxJH1RyF/q8A1Co
         /ybJUmUy/Pg/z0QE5JYGVxJ00ua6vdO4L2LYRQTWNNb59kXQwEnhL7Zo0Z3L6HXvUOP1
         m30EOihHsoUt+CjSx+Fn0MjW0MEYi4GGlWBOkAPG5v0u8oJEqg8Fv6sWTdMDXRgncw82
         wvkzoXRdCgCT6nokQo0WSXBZq6rBUPA2UdQtII8AiQoR4y6iZ9BuiCs4q/K9bmLw7DN+
         NxVX8BMYCvxvgfdKZexVkN0HvDctVDxcWzMXOr8oj9o9AKoRyoT6UjXpEkYHrcZg+Y0e
         +8aA==
X-Google-Smtp-Source: ACHHUZ5ha1PZ85+cv5ooNAcB86Dkb9AZ2ZLxhBNifBBAcOCOh3NkNsxLj6wWYf0DRgL2E6ea/4w9hg==
X-Received: by 2002:a05:6000:42:b0:313:e2c4:7bc2 with SMTP id k2-20020a056000004200b00313e2c47bc2mr9321794wrx.53.1687882023743;
        Tue, 27 Jun 2023 09:07:03 -0700 (PDT)
Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id s7-20020adfeb07000000b0030ae901bc54sm10780158wrn.62.2023.06.27.09.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 09:07:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7154C1FFC1;
	Tue, 27 Jun 2023 17:07:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>,
	Leonardo Bras <leobras@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Bandan Das <bsd@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Juan Quintela <quintela@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexander Bulekov <alxndr@bu.edu>
Subject: [PATCH v3 06/36] qemu-keymap: properly check return from xkb_keymap_mod_get_index
Date: Tue, 27 Jun 2023 17:06:30 +0100
Message-Id: <20230627160700.2955547-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627160700.2955547-1-alex.bennee@linaro.org>
References: <20230627160700.2955547-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WSQaWqfgXPoI

We can return XKB_MOD_INVALID for AltGr which rightly gets flagged by
sanitisers as an overly wide shift attempt. Properly check the return
type and leave the bitmap as zero in that case. Tested output before
and after is unchanged with the gb and ara keymaps.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 qemu-keymap.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/qemu-keymap.c b/qemu-keymap.c
index 229866e004..8c80f7a4ed 100644
--- a/qemu-keymap.c
+++ b/qemu-keymap.c
@@ -140,6 +140,18 @@ static void usage(FILE *out)
             names.options ?: "-");
 }
 
+static xkb_mod_mask_t get_mod(struct xkb_keymap *map, const char *name)
+{
+    xkb_mod_index_t mod;
+    xkb_mod_mask_t mask = 0;
+
+    mod = xkb_keymap_mod_get_index(map, name);
+    if (mod != XKB_MOD_INVALID) {
+        mask = (1 << mod);
+    }
+    return mask;
+}
+
 int main(int argc, char *argv[])
 {
     struct xkb_context *ctx;
@@ -215,14 +227,10 @@ int main(int argc, char *argv[])
                 mod, xkb_keymap_mod_get_name(map, mod));
     }
 
-    mod = xkb_keymap_mod_get_index(map, "Shift");
-    shift = (1 << mod);
-    mod = xkb_keymap_mod_get_index(map, "Control");
-    ctrl = (1 << mod);
-    mod = xkb_keymap_mod_get_index(map, "AltGr");
-    altgr = (1 << mod);
-    mod = xkb_keymap_mod_get_index(map, "NumLock");
-    numlock = (1 << mod);
+    shift = get_mod(map, "Shift");
+    ctrl = get_mod(map, "Control");
+    altgr = get_mod(map, "AltGr");
+    numlock = get_mod(map, "NumLock");
 
     state = xkb_state_new(map);
     xkb_keymap_key_for_each(map, walk_map, state);
-- 
2.39.2

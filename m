Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422847nji;
        Thu, 12 Sep 2024 00:40:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXYHroxQHuYig4hFi5it8vLsu/CB6GxUN6pIoaGe+lCiaGpTmOHsYPeWWda4dgFZOFihivmRKygSpLZkA==@linaro.org
X-Received: by 2002:a05:6808:23d0:b0:3e0:3c99:dc73 with SMTP id 5614622812f47-3e071abb01fmr1363661b6e.19.1726126856624;
        Thu, 12 Sep 2024 00:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126856; cv=none;
        d=google.com; s=arc-20160816;
        b=htTbwrNak67RSAljNJOlXyB8uC0ohiXco22EQR/dxCugs7v9re39h9fCc8DJGVqmOY
         04193CtwzcYl8sCQMx6Xdv5cjMWnZftucxXkMJIMnoC5fxUlw29McmD9yyzr0o4hDCpS
         xgP/sdXff1jUfLqFCDmV5h9dKJnrH8PsHuGNirD2wv8Sr8qYdKdALXSIcHyN/LAHDk/2
         OL9pRFY65ikBWfQp/isSVuU1edWdBi5GJRoF1xrR85MYsn1jRMWfwfLR1+qSZprHn0uM
         VDBCDvmII8vhVTTlHJpOnRJbtgqc8GdPboyLfY8jRP5B+eezUgl421fiNpQgQEIbqBLW
         /FOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BNLX5DGEYX2WSxoAnBw7IllFC2g6NKBNnAohuS36caw=;
        fh=7g/yPqRSy6OXAhHlglZwFUdznNzC3d9ch2L5l8x4HMQ=;
        b=0xXH6a2Lw4hh+YzHlavMg1u4SbjKXQgHxtnMLB14XDmMJJOpxAQdxYfrXDjQe9F0bL
         MB4V3RYcjpBIKNbGb4buvZVxBMEYtLPmD23xabRy8mCo+bv4l3GL3VMAqW7FkGhTzUn+
         CxhmoWxENnI9XX2GkSY4WWV/XeljFK+YYgoe71zVkmnuvkZaHpUlKPSd5x6YlkuNY/ed
         Fu/DIE//oHyVO1w04Py9ZqiydPDdH46XmO7WEDpT0MM80pw0racm4vnavYZsUdivEOYt
         +FlAkXV8bzqHnlgH5tRmkGGmqUL2ey1/PPDC5oB85EbiNw77huVnRUVWLxFmyb536hUS
         ru9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tddZ8TkX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3e039929334sor5226446b6e.3.2024.09.12.00.40.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:40:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tddZ8TkX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126856; x=1726731656; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNLX5DGEYX2WSxoAnBw7IllFC2g6NKBNnAohuS36caw=;
        b=tddZ8TkX2JBl8wtWokUoZShCGMkIIiQ23cwEOiR3Bf0S6pgK6wzcBZvOQqyjZwsIJc
         SPiHYCP6CRhdAvTecQoei1SNRbm4Nj6izGumYcOG07L1xF0v2ghLbhKhSXqwXPZmMatS
         X6Q726m+awqjyKg2aRhyCmveAVKj5E6AojjEoQOhMsyJqhOnmZP7INGMZAeSLYz2efSV
         92/l0Si6aLTuhgYimVEqoGz+AW235T8GXWJFOWNDS3l9TiXKMmGh7wbNlH6ycUiUguxa
         y5tOgSiq9ALB7ILdCW9GvtDuVxH8Q711kOoLL7xCKBGABKpm8bQWq8OVTca463cts2Gc
         9yzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126856; x=1726731656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNLX5DGEYX2WSxoAnBw7IllFC2g6NKBNnAohuS36caw=;
        b=RKzhg2ydwU3AE1JL82j907WGwryuSF1/mSQrnONUyuV1w1TvT8WFNd/WVAVjPS+pvt
         uPnMAHU25lmI4xGHjccPvWlWsN6eQAv8wY/NryXmzgrCXiye+GXmzVdy6qsBBw479mmv
         9m3tfvePMoRoG39qnTSQd/bcph9fUvvgAo+JDc4BFj9MsIOXcD/dQvLmOh6i3RcLYFa9
         xVyhOil3Hms+a8rUSwdVYcFUuFf4/4UgZBeoUGx7rWjZ+GhaV0XO41Ts5lIYvOyIhp3z
         PUbNK1flu1RakSnUGQhwkqsHF84a3By8Jivy40tDqZXZ6Dgf9rZ6iEJXHoS8iMXoSASc
         NdkA==
X-Forwarded-Encrypted: i=1; AJvYcCWI8wZq89ETR0qjyIVuFasAC28Pldb2ieCuEutMFM0I0z3oPcxxuW93gFuJhme61sQefCVp0W8ilxfAkw==@linaro.org
X-Gm-Message-State: AOJu0YxZai8oAQT7qSgIvOv9xRsvbxgId/6g09suYpwQjuh6OslnnqYk
	gGWkY+0pdT2Lp7W2WHyO5wEpNqGjPO27xlSBS9fIRvkE9h5Vo8pomVXBbD8hJW3jgg==
X-Google-Smtp-Source: AGHT+IH+4KhzlZ0oxHJ+Uh2bqKlcjrz6JC7PesfrNFsLZGD4kro1D7yoRsRe4Wd9oo4If8anPJmXNQ==
X-Received: by 2002:a05:6808:d52:b0:3e0:4aa3:73a4 with SMTP id 5614622812f47-3e071ab4fd3mr991972b6e.16.1726126856074;
        Thu, 12 Sep 2024 00:40:56 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:40:55 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Klaus Jensen <its@irrelevant.dk>,
	WANG Xuerui <git@xen0n.name>,
	Halil Pasic <pasic@linux.ibm.com>,
	Rob Herring <robh@kernel.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Corey Minyard <minyard@acm.org>,
	Keith Busch <kbusch@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jesper Devantier <foss@defmacro.it>,
	Hyman Huang <yong.huang@smartx.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-s390x@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	qemu-riscv@nongnu.org,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	kvm@vger.kernel.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Peter Xu <peterx@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Eric Farman <farman@linux.ibm.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	qemu-block@nongnu.org,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Eduardo Habkost <eduardo@habkost.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	Fam Zheng <fam@euphon.net>,
	Weiwei Li <liwei1518@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 34/48] target/riscv: remove break after g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:39:07 -0700
Message-Id: <20240912073921.453203-35-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: n/fGd9s/zK7Q

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/riscv/monitor.c                  | 1 -
 target/riscv/insn_trans/trans_rvv.c.inc | 2 --
 2 files changed, 3 deletions(-)

diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
index f5b1ffe6c3e..100005ea4e9 100644
--- a/target/riscv/monitor.c
+++ b/target/riscv/monitor.c
@@ -184,7 +184,6 @@ static void mem_info_svxx(Monitor *mon, CPUArchState *env)
         break;
     default:
         g_assert_not_reached();
-        break;
     }
 
     /* calculate virtual address bits */
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 3a3896ba06c..f8928c44a8b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3172,7 +3172,6 @@ static void load_element(TCGv_i64 dest, TCGv_ptr base,
         break;
     default:
         g_assert_not_reached();
-        break;
     }
 }
 
@@ -3257,7 +3256,6 @@ static void store_element(TCGv_i64 val, TCGv_ptr base,
         break;
     default:
         g_assert_not_reached();
-        break;
     }
 }
 
-- 
2.39.2

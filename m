Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422455nji;
        Thu, 12 Sep 2024 00:39:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVOxM0aG0/ypugU4lcmIw2TfPaYAZDO3gCNJy3Z2J1e0SO3Y6dB8aU0TtCcxFCUXmWk/3P/8h485nxW+Q==@linaro.org
X-Received: by 2002:a05:6a00:3d14:b0:70d:2a1b:422c with SMTP id d2e1a72fcca58-719263ea9d0mr3189392b3a.7.1726126772051;
        Thu, 12 Sep 2024 00:39:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126772; cv=none;
        d=google.com; s=arc-20160816;
        b=0wFoue7U7BwVKR7Ll/YDPczWtmYAw9VdS5UDpJEmEQlO8VVcnoVCNw/xklR/DZNE2H
         xsIBdWmpmWBate7HsOojHv0iiFFTytr9GQAqGPxpmb3NljTp+EnE2Zqt3atIYLFguGoI
         hyfB+i9A6ginAnybQxt3Z2acPpN/ebKn7l2CgfsN+jr+rXMLejD6NfDbp4/9n/Lkb1QM
         Ag8FXVN4D386h2NFWAItRO4g5TT6BwL920N/u2r8AdE4XRWNALCM0tzZf51bS4cvEueC
         JCmgUwtrR5NJM/qkpEWfobUPN7BZ7JY1j0qR9ZSOaFyixa3suw6xbuf6x4J6MHP6iVba
         sCcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WKzkwMvjulowmVZuCJWvk+8fDxucMHovajiMFoHCRQg=;
        fh=EVs/Xwltt4qTbizaCcmKl99m7r0P9JuBIrzty4OzDV8=;
        b=nuREpFr2ONeSR067xbnhZkiHKZ1/idw+pcX6sRB+1FEzwzcf6AMXMwCAUvnHIawjKw
         FhhEy3i/Le/1mqnxNWLiasFK8tTqaiA4+E6KDnYccE3xV00rS525FzwCjJTBfvABDA+D
         zzOBYa7asTg587hcC7vJYSeUT7MIW4pWY915Rn9cO6HXIb57TXRdehd27kFGxRJvMwS9
         zg2p9yP6GyzrOqUH4I/0JkzrQq9eCTAG9DTjS7pB5ntZerrlaGmWW32c9wK6C4Cop/UG
         gKc8StWQKTDRJt1aH7N3eV/bmp1edcLhErzfSYqtJZ21P/CiAcqMUbR2QoHHbR8SXqj2
         jSdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xdla5LQj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e5829c07sor5488629b3a.6.2024.09.12.00.39.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:39:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xdla5LQj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126771; x=1726731571; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKzkwMvjulowmVZuCJWvk+8fDxucMHovajiMFoHCRQg=;
        b=Xdla5LQjQLYSEn7BdJ9BJ6i6lw9A0iG59DDHGVfZqj8SZan3wp094xJCTEl/d1Toy8
         YSmS7H1YrfCkCXoPHj+DQwUDNcIbUb0H1zdojS+tGnla28Wzx8/lz0/Zaa/zFjWzfKxT
         dfEQjDAk/kZDqgWUKOf0VWuX9lrQP6iWqLmkLEF+4LVwQG7C5hX/xo/oHIVayavMGm2W
         WDxQm7+Wq3RkaUmC+fiTY6C4f9QkrgVhpyDYyHa7XU7zkjqD74fma9JyqPHTRVqSWGlZ
         kluIttLtDlwIOqqfwf0H0UzwNdhW5SMKZdO5S9DF4IjArVgCStSuVZs2KO6ij/jGP1Oq
         lpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126771; x=1726731571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKzkwMvjulowmVZuCJWvk+8fDxucMHovajiMFoHCRQg=;
        b=Ew8m4NiLU67g/WfsrBHj6WF9wN677P/QQlYR/IVuJvu5J1s5cQh4tCC8jbcUI1/0Qm
         eKHthoGBvmOcLCu9BENyEWR5IRAS1qCqp2aiNIT1d8rsiY4Lh+TdOL9LdZ7HTfhDwliQ
         Otczjh9YUrb/2RBQ9IAG6Cf8ay8prB7FnuIhzk4y4KfrNv7e5UHyoo46iUEj2iXUBhca
         ZbFLb5lxzfA7uatZETtI/4D6nKLtDy+soihiTYFIb0f3ZPyEHQXKylfeLTuixD3xcCTs
         B/tT5Wn8U3XIm/Jci9UaoUcUWgUz1uWSn6ztFcSrwxjHtz9DCtju8E25leDiuXGOKZT2
         gDTw==
X-Forwarded-Encrypted: i=1; AJvYcCWR3JlpPbXJlxdUKzExHXJmz1fJ49OhOF1VcghlspRcxtjCYUX/4B98Y9QfnPxtkYyDaXMB8lqWBdiMWQ==@linaro.org
X-Gm-Message-State: AOJu0Yz0Z1p8r/zORm3LC4XJMCTDGx/5QXIq2d82Lf4FhHDXTfSmBimS
	fKzBtbfyQOD3WYGsW3quonEQgtN7P6qD14Ba2ittM3n3JnpChRPpQID3UqDnIgrGzQ==
X-Google-Smtp-Source: AGHT+IFV73zYW1Waxu/aZZ0kavyu0j3iUea6gq5xe8cf1PrugnTCL4VeCsbqhbUloiuceag0jwjTVg==
X-Received: by 2002:a05:6a00:1803:b0:717:9743:e4fb with SMTP id d2e1a72fcca58-71926456829mr2983283b3a.14.1726126771431;
        Thu, 12 Sep 2024 00:39:31 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:39:30 -0700 (PDT)
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
Subject: [PATCH v2 02/48] hw/acpi: replace assert(0) with g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:38:35 -0700
Message-Id: <20240912073921.453203-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: DPin0qLMbh4H

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/acpi/aml-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 6d4517cfbe3..006c506a375 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -534,7 +534,7 @@ void aml_append(Aml *parent_ctx, Aml *child)
     case AML_NO_OPCODE:
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
         break;
     }
     build_append_array(parent_ctx->buf, buf);
-- 
2.39.2

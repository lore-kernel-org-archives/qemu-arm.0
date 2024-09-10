Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444319njb;
        Tue, 10 Sep 2024 15:16:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU5xIjmIlMgqNKb6Obs8Rjn2HmDKl8bB8Sc0fbGZY2NQKE9VUGsBUEQ1mmgRgL7sL8fhDjvasGF75X26Q==@linaro.org
X-Received: by 2002:a05:6a21:320b:b0:1cf:2bb8:f38b with SMTP id adf61e73a8af0-1cf5e19abf6mr2950335637.38.1726006576392;
        Tue, 10 Sep 2024 15:16:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006576; cv=none;
        d=google.com; s=arc-20160816;
        b=IpML7ONzplfkbAU390aFYFdNgX9Wt96JUqO9bTjHLEpT2FzrwcrDFh/Jy9PPxujoyW
         UPJKpVu2Kvzy0ArQ0fPgcl4W/9P6LfWJVbPKVDyM2bCeRRX/YDpBVzz004QbAdJCxiJ6
         lfBD2Quf+4HvTA8Nu8H9gSnAhjUyqg0ooDHR8iv66lUDpPeuhfmSVk/SPzZHg4Gb4SAl
         hSXaFzq7oMM/uXB8FAfP34zuaWrs2gQ9woOm2c6Zw6l1gTRU7CJ1uvevHIdLAQkn1k/n
         IluiYdU4W9jn5hf9gvOjmWSX+ZkzVQAh3MRM+8XXjBQbj7WaZRaYt6e9acwTn0258kCz
         qgzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BIrX6LSYcWKQ7NWgVt5fl+kpf/h4MdU5BhontmNSP2g=;
        fh=oG4N9arTXvQWrcrwJOqW9kJGApH3CA+lmib/hjLIfRs=;
        b=ZwEKktKj/aqaRL3xGzFkl9bqjNhT+brA9PLpLvzauxQphV1T9YROCR2ZmPCMLin3Ot
         PWZIBQn9yRFlMEkCGDGy22tdryOgvvxKIScdZHQy4JJS2XAsvNbI2yoh/iYi/heAJBA3
         TXm1dRaJqyThjn5f6IyCD+Wa0XvJkhp3zhwgv5cA5P4Yp1vSr263C/p2YLw2JC0dxMWF
         gpf860rYaKzo4E/qA5AyajslB7mZ6ZLzcoenELlh3wjqnqky0CWTeKkXyxjoUaG7b5uT
         E8phgHyKz6GyCKKE82tbOb5vTXDTNyIQlu3FCbyZn7E6VykznQPrOOi2kNiOnSxb5BQF
         tDFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OkwHFF6x;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e598c942sor4222517b3a.12.2024.09.10.15.16.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:16:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OkwHFF6x;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006576; x=1726611376; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIrX6LSYcWKQ7NWgVt5fl+kpf/h4MdU5BhontmNSP2g=;
        b=OkwHFF6xBmNoeIi3Tmqt5eh+/EnrK6IQFEhoxbIAVbRP9NVKAWm/H+z5xeDdwlzTzN
         Sv/pYN6u5TuoIcG728qwHf3E2ingEwHsE/81/2/Vp6YyDUcb7VNeChlnqLCXMjY+/M52
         8DBnd7mMMPGOjzUT2glvxCbDOPG8IatyD1Wy8O/DNSs7wf6+p/uaa12pIyZzln50YARO
         jx09wKRHJhdIYLlFwzUXFMnbwuRuoDjco+5p9y+FAaCzyeFozsg+tSGr8kZTZmf7svBQ
         AeIIibPVA+9gEPUhrctkVJD3ZDN47xlUwa155EZ2LCpmkpfCSF0Qqx3ATdTJlvbSpYQE
         ylLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006576; x=1726611376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIrX6LSYcWKQ7NWgVt5fl+kpf/h4MdU5BhontmNSP2g=;
        b=PQn9Ao6vR3B0GQVu43/qoSKv9r6EjZqvheqAKNaZnqXJD+rrfqy3uOSWyD7tAcsHL1
         FYaG3OdmMAQ53FNWhlT1D1LlCcmAMkHt0s10TAIN9RGErrPFDMR/nL8N2uzvp99cLxqp
         YOvmQSsYlzIgYnlv2tAG6Z5LhXsJqOKc1MFyApc3IGTeEpiPk1Wbyj5jKBLpPRSJhBKJ
         uHY4c3JqPkzbUe/a3Gk9QjlfSVG2jsFW4HUbZCsquRcw6vILq2UD7SGraYEbFo4vJMqp
         mSIZF9Kj3y4mTVk3S4xMxjOD9lyNp2FuNZgQrY1+GRyiZIc4n9AGftGUJbbr+kn/uIV0
         ICiw==
X-Forwarded-Encrypted: i=1; AJvYcCUawN2hhdugkUE8fQkZMKxcwFu6c+zxoWNw3gAR8Zu2pZmufr4JpaGM+gQn+B3ILocjgTL0iKWM33mbxw==@linaro.org
X-Gm-Message-State: AOJu0Yy6rdfJ86oK8hg/qfDtBBHDPt3KCwpusENuP6E6RInbWR4/9CNh
	fgbEEpjhjOUK8N9/ZMTrt1kxpWWAxgvKxG0mSL5n6SMrCr3FMcBl9pen+Pic3iXR8A==
X-Google-Smtp-Source: AGHT+IEi6PPXSaCo/MzwCiwcFBkPDWeKr8hyR+jrhEtygwmYUnxCgU5X+xKQ+1rCwoEBFzE8VZ/xcQ==
X-Received: by 2002:aa7:8883:0:b0:714:2069:d917 with SMTP id d2e1a72fcca58-718d5f0fcccmr19299081b3a.25.1726006575824;
        Tue, 10 Sep 2024 15:16:15 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:16:15 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Corey Minyard <minyard@acm.org>,
	Eric Farman <farman@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	WANG Xuerui <git@xen0n.name>,
	Hyman Huang <yong.huang@smartx.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-riscv@nongnu.org,
	Ani Sinha <anisinha@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Jesper Devantier <foss@defmacro.it>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	qemu-s390x@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Laurent Vivier <lvivier@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-block@nongnu.org,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Helge Deller <deller@gmx.de>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Xu <peterx@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Klaus Jensen <its@irrelevant.dk>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Jason Wang <jasowang@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 02/39] hw/acpi: replace assert(0) with g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:29 -0700
Message-Id: <20240910221606.1817478-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: NBGBSpPNxDda

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

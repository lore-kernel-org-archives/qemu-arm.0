Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444584njb;
        Tue, 10 Sep 2024 15:17:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVkI5EaX2Qsmz63GViSH6J2hBY6VN/oFyl87zS3KEiaNSCuAMPubDSnjByl/omFyatPQVgu/SmOqZcD+g==@linaro.org
X-Received: by 2002:a05:6a21:1644:b0:1cf:53fc:cfec with SMTP id adf61e73a8af0-1cf62cc2137mr1629947637.12.1726006620777;
        Tue, 10 Sep 2024 15:17:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006620; cv=none;
        d=google.com; s=arc-20160816;
        b=NCcNUn4CMqYeRRQA0rvtIOetZpP/jXgtBkj2IcD9IsJ5pZhsHBoX5XEuBNc2uPNLU/
         Y3NQS78jqTF8VsJnhS/AnwmYljuDJg2QGVFuoXoz2csP3P3oN44PFFj7UglSlhjA35ue
         s0C4LdZvd/OsRWM4KAHgyUMvb81RycUAdXMyg1gvJQplYiccsFLMXsiLgvzW2FcIA75H
         Qh8DjB/dRH4YkWq9ywIO2JrJzL5E0IHhxO0eLwX7tn+bYBGuAPiEDGGjSVRSZcPqL/w4
         Z0TrbQ0kQEXOEarnCdExYnChlpZAMi4mKLho8UcO8fqmQwz078+K0T8LEo9rKpsNrBNV
         Essw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KGbjDOKJ1fKYY1uGWKFY9+QMWL7t/3O1ImqR91k5f0Q=;
        fh=sZ/Au5+2mf+Exwu5xJxZkoJWzx3hv0dm/XPvG2XQ8QE=;
        b=s3VKjh6qxx1FJYKDbY+QBhHkM10C3VdDkHFKLVBsBJAJssNmYKOBcu7QJyy5UBfFns
         H9Z611lEXPjhsGsT/Y3KaW6RPxBMShLqk+x1c1o2PRGk7o+x0d+IPDzsx4Usmo37y0as
         oAkAiQrpFykJb/VuMZKFEDp/YegGmeaKd6xeeS0x82xjUx/CtinHiwwWafWXrzBiEky3
         pwkTfuU26jeaU1mrCoKAkdfy4BFwnK6/Vn6kbUaGb7B3NsPbyOuWtpcQB8USyMca16tG
         z+YIi4NzjxkhOUcge01bZ5CaBISDw6oQvl8LC3/a8SIUkdaSM+KXHfJ4aKZW6kejsi6c
         ATBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bcAJTg5d;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e598dff5sor6446671b3a.11.2024.09.10.15.17.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:17:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bcAJTg5d;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006620; x=1726611420; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGbjDOKJ1fKYY1uGWKFY9+QMWL7t/3O1ImqR91k5f0Q=;
        b=bcAJTg5dXOFqi7Ti/hJKcT9OroZtyxpcGJW1tEFOfXrE85qJDj7RmuRNgpPHbX3Fz+
         uVrGV9tfS4pWEovKy4cwoOrYmm7Ts/GH4zJIFFnGL9gl1bqOi7UmdE6OV33aUAatCLYC
         mIwwit6vAiltiUps0oGSAE7NTDX5kKGUi24P3ZPaVTv4QPXqr5bbO2J4KGmIB05zUTqw
         uatpB9AyA2bwTL1hWSKlUbSbPKbrkvfQivm/FjqZ65qb08i/8Ni+sox/FP2lyDi9izq4
         VMMEXbPoR6tNeM28tEchQ7/1SHQtW3CGepD3D08SUbk4RtEK5v0+9Yi78G/89HzILjYM
         Lt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006620; x=1726611420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGbjDOKJ1fKYY1uGWKFY9+QMWL7t/3O1ImqR91k5f0Q=;
        b=kDInEluwwMYsyHY1GUAy3HvUxv+kfZDRMtazyw//xPorYzJwAkyYYdn7uLxbX15t5V
         L9bgnHaZpxLYQtaG0/bAElLiCCIn0PkTUvBRI+VO3N1pIQxwLfxOcANUZkez9sLljmgs
         p6oesStmzZTUMdf5Az1YloKx7Xclpz3v+NDOG50O8vtgab9pAaTfI/5+NKVj6GNp8B77
         vbntWUzQTsRJ19VXzuRR0xjxwPjRLqqrhNfIGX94sWyI10kEpZcnrt8KY6dWhPXK2oYb
         aAx956adR4kD0/9xaRLmmW0IaYpT79exc9T92BDX51J/crbtK1nRuyXoqe2dB2lsIr68
         EMBg==
X-Forwarded-Encrypted: i=1; AJvYcCXcG7vrDjX7yax6XVJuceAUlawQhFJyaq5KevgO2rduSs3HwKerY4de6Uj5fWvCjxT+F7PpsYaD6zXAkg==@linaro.org
X-Gm-Message-State: AOJu0Yx1Sgr9zyc1XW8AsiYyEfjNMOI4REziPdY/3xYR4ThKBdOOfOBW
	lSksRvIibibozXhNkAk6da6I4te9JlDOcB2bZvUeAqZqdyssI3AaGq4S/hYsmxbHQg==
X-Google-Smtp-Source: AGHT+IEmi5bmB0qNS+mpiVKXRllZgpf/ZuOjLIu6c1N2HyHg/D6mILGOlbKUYizy2HbzFdbDzqq34Q==
X-Received: by 2002:a05:6a21:38a:b0:1cf:397f:b69 with SMTP id adf61e73a8af0-1cf62cc1d32mr1586618637.13.1726006620331;
        Tue, 10 Sep 2024 15:17:00 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:16:59 -0700 (PDT)
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
Subject: [PATCH 21/39] migration: replace assert(false) with g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:48 -0700
Message-Id: <20240910221606.1817478-22-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: mUYaC8NEaq+2

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 migration/dirtyrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 1d9db812990..a28c07327e8 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -228,7 +228,7 @@ static int time_unit_to_power(TimeUnit time_unit)
     case TIME_UNIT_MILLISECOND:
         return -3;
     default:
-        assert(false); /* unreachable */
+        g_assert_not_reached(); /* unreachable */
         return 0;
     }
 }
-- 
2.39.2

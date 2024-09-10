Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444902njb;
        Tue, 10 Sep 2024 15:18:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWffOhw/hOzLGRB9hHwiVSoPHEvcXiz114nKfPB9VMQ2cQL43oV3SB5bniYFGr/EQh4MLTKxIm8oixMFQ==@linaro.org
X-Received: by 2002:a05:6a21:58d:b0:1cf:334d:ffae with SMTP id adf61e73a8af0-1cf5e1571cfmr2665974637.32.1726006684201;
        Tue, 10 Sep 2024 15:18:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006684; cv=none;
        d=google.com; s=arc-20160816;
        b=GBRlx97o99ekpBWMIdmYLohfhDTPnftEB67tDOrlAL0ELTwbCwyuT8YzbU1fktmweO
         g8q9xXJbxjn8pHgn5fiI2tLym2AVB0xi1YVQu0Q/HqztJw044R68quZLCOYNCaBUqt/q
         jtyt52G7DpZve8EmkEOYR5ODL+13CXGwwXHsBbvC+YUtAd+yVwPtZUp1jniy09ZdnkAf
         PUW7+31ar2VxQNrbZGW/Xsb64MtUSSjWu2Ghd5j6t+afsJojd94t157GTI+g8S5Tg9Zj
         MURoB/JSyZrKksXAnrUbTpVdOX5Sv/NVmxPu0GkrqgRvLGvHSzI8bNTxUAGSYOM+JhhN
         noqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HVlIH0vLGwHmaRGMFANFNOikFJyMD1Z2/NyDN944UZ0=;
        fh=XBM30Aoh+z8IHr50wDFua0xOaLxiTjjHq9ilUzCEQUM=;
        b=bhaIpiYHt4My4KupkCTz0CI8+uLd2UM7LvebwVZtiJKZYYf79Xs7tYI6fAS4eVFG0y
         LWMmFj7AzAZmLvoU2x289qrQO1iXNfGKDMCKYzB9aRwyOREBclHetyBPaM8Sl4IyawCi
         RgWvSu/OTwhP8ZTpY+Mia+VPQpRn0zK1eXPTtwkQnHzomj8jeDXXkhHp+1Hl9uJ6e70O
         sz5r4FhyHNG2EgWTyXWpmH6Gy0fCtwmn+3hGN/vJrD4k9NABFHFC2CwEPyDBgd0Zm/HL
         iGxLe8RU4AXD0pUp2hgyCcVIpZwC3sg72o5Eo5u0O+N1ONWJ1pN03LdK7jAK0pyDg7YZ
         htQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eUGBAoxS;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7d823cf3ccasor2556252a12.4.2024.09.10.15.18.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:18:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eUGBAoxS;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006684; x=1726611484; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVlIH0vLGwHmaRGMFANFNOikFJyMD1Z2/NyDN944UZ0=;
        b=eUGBAoxSo8dXAWv2JbXJyqBVBReBPmeInRmox1BzlJj6ZkIV5flU+Tn5T9VZbyvVa1
         vVge7f1KvUtXPRS/Ji9f7meDbRcQT23RZmCV/2+6aF34qyAkZrS9sQzNDqf/Jc0MSjUc
         zV3eXFXnQj6JwI8WsQlmUTshAVNlA0wjK0xAnUao4xK3qqkg5jen0NDwFw6sxZ7mSraI
         KznH2Zxbs7CoCFkz7locNA4595z5kEOqfANL24TxEiQHB4hdfmpubPFSwQh40Z2JkFMV
         i8itMLpmIQyM9xtcbk1W7xc+L7lgAkerrPfQIONcV1rPfw++jheCph4ebzQJWnEuVUEN
         0nQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006684; x=1726611484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HVlIH0vLGwHmaRGMFANFNOikFJyMD1Z2/NyDN944UZ0=;
        b=PQ9MIHSGtvTacgzg3N5ZAxUrlEHhuf6Z6EO1KMSYdx2AcSmkBZUmSSYyCnuymP0fhD
         XoPS0fLB7+e9/ugFLLmV9/e1x6DXtkwQuOa4UGkpoqqBGXtqRR3yw8rtNcGo1qDepJs0
         t0qunlhghq5fglYnzarjU+6pBH+ITCkQIL7ucEjv9RQ9nw+kOsq4Pq+89Oh7/2D3H9Jx
         cGdepgfG5NMAP93xQzqEzBu15NvN+vzmKhUUe0N4c8I8RC7o4UXTC4Va5J1pjR1KJd1l
         yEqEm9RRanO34iYLQA4Z7GBxdyi6X+U6PpSQ9sr5lFLSxdBNANpcUODY236nUvKB65oC
         yXyw==
X-Forwarded-Encrypted: i=1; AJvYcCUywvZwwQU7jgEW8zWCbPcg9l/EjyOlxX0oTUgGncgXf56UPAvo7dxycIFqoY2Xnzx4CUhT7mCFVvJQjw==@linaro.org
X-Gm-Message-State: AOJu0YxwXNpLFo1VM5DiESpkh5UfNxM1NfjWCJqRiyNSGw+dFFWuyrq2
	V/m2yVf60G/bSq9FYtJEIkWBCgrISsvpLN55uO3cfwWI1WlPfyd1jXuOHnP+z32kdg==
X-Google-Smtp-Source: AGHT+IGmxzzneUTyXUzTC7HDyLbhq6XrgpPzar4wgVhFnulO1e/5MM9gmR+Gi+k9UlOi7JBGbi98dA==
X-Received: by 2002:a05:6a21:4a4b:b0:1cf:2df6:453f with SMTP id adf61e73a8af0-1cf5de0ef4cmr3537960637.0.1726006683723;
        Tue, 10 Sep 2024 15:18:03 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:18:03 -0700 (PDT)
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
Subject: [PATCH 35/39] tests/qtest: remove break after g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:16:02 -0700
Message-Id: <20240910221606.1817478-36-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: R3U1bnJ7VLaD

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 tests/qtest/migration-helpers.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/qtest/migration-helpers.c b/tests/qtest/migration-helpers.c
index a43d180c807..00259338833 100644
--- a/tests/qtest/migration-helpers.c
+++ b/tests/qtest/migration-helpers.c
@@ -76,7 +76,6 @@ static QDict *SocketAddress_to_qdict(SocketAddress *addr)
         break;
     default:
         g_assert_not_reached();
-        break;
     }
 
     return dict;
-- 
2.39.2

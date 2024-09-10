Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444482njb;
        Tue, 10 Sep 2024 15:16:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXz02//iO0dA0VuSdyQkdQ5wwkd0FsjXfgPBCq3SObLJi4FKjOM3QBzi+UdBlGdWIFxWe8JxmcEBzmQYw==@linaro.org
X-Received: by 2002:a05:6a00:2d92:b0:714:228d:e9f2 with SMTP id d2e1a72fcca58-71907e98bdfmr7420261b3a.3.1726006601306;
        Tue, 10 Sep 2024 15:16:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006601; cv=none;
        d=google.com; s=arc-20160816;
        b=xFXl6H935gubeDg6JVkCdQHd6o1vcz7i91IRG07erIyOnGYzzRwqKbcROuSI8dfGQ1
         tDcDKvF0yx/nPYNr1BiZK707q77b7XPr458N/rXuBTUn66tE9O+cWZ3sOk3+VFAqulqX
         pVMLqnluKut6kxMwAYtgD62ljvbbPMlaE9smv9kfo4akugvPnlf66GPAlgQHvs1Mj6UK
         lVvyZtsu8lllURcZ/Rb6rWBHuDQbIgB4zwPgOvAgsh+CQ6hdCs2sXazYH9U2SL3KDfc0
         ebWP9txd4+5/qif2uzxrB5/NqgoY7Kq+LLsT2uSBzCI+yz73lbwVNukn0SNReTXxjczS
         74ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tK8yXM1iDeE54P3xeT7FLI43fZ41GyYVDWl++WFS7uI=;
        fh=q0Pj4UNySPSYKsKiwLV40xmJVfZXOjltYXtNC6YK+b8=;
        b=gF0jPmn+s1fij6C+ADrvCRc0nTbG1RnEJjN05pLVe88ZxbghoqRhYJde4+GyVJ3jy7
         JbEZ94dfzfMrpfcvh4V5T336Nmygrr2cVUwd7IaIvLWbwdNovITJ44Sdxyeyvb3dsHVM
         mdd0kEwmNr5836r1ReUML2QQvd5vN+/9ZxsZZOVWkEBO34m4YJJWMuugeBRvLGWTAFpu
         y1aAdhbrmF2H5XU7aV8K//qrKGpnfIY7Lk5fTiArM63Ch9ZL4S8mj6Y7X94N++BYlhsz
         DVyg3Lmqti9fJq4WswwBDOaHky30UgsU3dYf3jn/j9G5JvUHo1PQC9T/PmT0FD1mICog
         6sDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mxf1tiUT;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e57cea70sor4185470b3a.3.2024.09.10.15.16.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:16:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mxf1tiUT;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006601; x=1726611401; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tK8yXM1iDeE54P3xeT7FLI43fZ41GyYVDWl++WFS7uI=;
        b=Mxf1tiUTmGF0Mstmsinw6YIRIvGtk9OkQOoGu3RZqo814/jtxaiAHZ+JLajT/UbYh0
         LPw3gUerWraTkfZ9S+PZLU4jvrQLiFu5yU7LWikemT8N0P2E2nmguwT0JnkG+yANspzQ
         wdlsUOILuobmJ4CFYIdyR+Egybh688c8KZ5hH3jx+1mWgccnkxLdlATEi6scqV0/DK0/
         JbvqF8Vxi6pJYns2Nz467vast9R6x2giMaMcW9ddjbtTqFs+F75UKxmlLi0h0GQRMPbO
         H+kRIF0UMKXrJVIOqXDuEgcM+nMMHdd3ijLdisnDXJifDKYcTXg1t4bOkEtanwy12omv
         f5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006601; x=1726611401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tK8yXM1iDeE54P3xeT7FLI43fZ41GyYVDWl++WFS7uI=;
        b=HgG/1erMcEJ+LlLjHtbcrtXq8qezy0oIhIGA+gPF+yVC/Bdg6x9FxgkU4DzLBbZBqb
         uVtNEUG/S8IlJHwRpptVzufFPwAuVGepUZttyBbW+yguTfXHjDFQ9gyXf6j7acp/Cess
         fiGH2lQEnvr5V6m0FsZdTD/eTgDzWPw/VefDw29YDDlb44hQMgFw7rbrolfS2n2ERjXu
         ciSqmspQdc16pmrggGtCKnjdNlnDdDQzcXk3FGkY6vCZoAGfMFtuxlGTlrAAxnHFHoUv
         hgRqqi55EcLQ6VZvkJPW+Krp/k8UNTDGQFjW2OWxDaO8G1sMrh9i7EDHo/JabpcB6+aj
         jk8g==
X-Forwarded-Encrypted: i=1; AJvYcCWQ/UPKwEon63EFnnaCQHGR5U7TuCfM9HbmXxCRHtNNHrPBZdUTxgk7sEymJlQHBYAz+ColStFgOrr5IA==@linaro.org
X-Gm-Message-State: AOJu0Yw5nnZ3Bb4xfIhYlSouiJ+0PEvAPBpCmvPqNVtmbi9Cu0rTgYHB
	CMD0MEflOPcvkhy0Q58EOytK6x8PyH+qw5VOgXe/8BPsd6USFG8968q1BvPqI0Zz6A==
X-Google-Smtp-Source: AGHT+IHBeJSCPLVgyC868IAgFwwRmLEKo/giNhof2aXBBMvErXgNAwTCgjauJtLdTsaN9WD8c9bHhg==
X-Received: by 2002:a05:6a21:398d:b0:1cf:3816:d104 with SMTP id adf61e73a8af0-1cf5e3cf5d6mr4003930637.3.1726006600863;
        Tue, 10 Sep 2024 15:16:40 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:16:40 -0700 (PDT)
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
Subject: [PATCH 13/39] tests/unit: replace assert(0) with g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:40 -0700
Message-Id: <20240910221606.1817478-14-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 9uJs0IR2wffs

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 tests/unit/test-xs-node.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/unit/test-xs-node.c b/tests/unit/test-xs-node.c
index ac94e7ed6c2..2f447a73fb8 100644
--- a/tests/unit/test-xs-node.c
+++ b/tests/unit/test-xs-node.c
@@ -212,7 +212,7 @@ static void compare_tx(gpointer key, gpointer val, gpointer opaque)
         printf("Comparison failure in TX %u after serdes:\n", tx_id);
         dump_ref("Original", t1->root, 0);
         dump_ref("Deserialised", t2->root, 0);
-        g_assert(0);
+        g_assert_not_reached();
     }
     g_assert(t1->nr_nodes == t2->nr_nodes);
 }
@@ -257,7 +257,7 @@ static void check_serdes(XenstoreImplState *s)
         printf("Comparison failure in main tree after serdes:\n");
         dump_ref("Original", s->root, 0);
         dump_ref("Deserialised", s2->root, 0);
-        g_assert(0);
+        g_assert_not_reached();
     }
 
     nr_transactions1 = g_hash_table_size(s->transactions);
-- 
2.39.2

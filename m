Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444598njb;
        Tue, 10 Sep 2024 15:17:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX4XNXj/xJeJOKQFdIB/gmyfX8gJT+4zqthKdw6TLsQrRWkJ34PctDQqWp3B5d1njdEKE0FhJOXBsf1wQ==@linaro.org
X-Received: by 2002:a05:6a20:d503:b0:1cf:305c:675c with SMTP id adf61e73a8af0-1cf5e033153mr3051684637.8.1726006623115;
        Tue, 10 Sep 2024 15:17:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006623; cv=none;
        d=google.com; s=arc-20160816;
        b=ZhhQJ7mBuRpBAMQiWhbWUt4Oyfd+fm3eQ0vGoX+0j++yOKme2xac1UTxcaLFHxFbtz
         GsANXV5lmr+WNYx4wohCi6RVZXMbqTcH3C4zZ10Y3m3v7gvfNlFKOztpJY0YpqwnBlo/
         NrUHonFy7hqTaILKbCWezfBaKNZ6PL9OmJnQaWK3s7+22d40BBzxN8PXZr4izV2LN2Tu
         O0lq5CTdX3knVg0GhdXVl+JHnZ+phRvpaeg5RybOwuzSUGdZP7HZEjARg0K56WGm9cYd
         B7CsO5jsf9b6J5d8ucAGIEIx+zPIQNXgH4kkH5MTB31TAD8175PxmM+BUF8xBA9MuC/f
         lN6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7oh25CxvFbaGetIeF8ZGKIaTcgg654mKr0Hk3ECIvo8=;
        fh=EEXGKTe9oJqlWkU5GD0w9WoTbM7HiSeygrssXZGioR0=;
        b=WxFMyJnKqFgYYRk6DGHD+wrJUFdjgUQi/dee5RP0LBMNitR8Qhj2N0JPMWsVtV+n+O
         4qSaeADGUATpLIPm5tD7lTB1BHwEmbP9gz202CjTUePu4gcSOj0j8xSKthGZ3CnHQ40u
         jSaatBLj0w/a3l4OsjXAGCl8K7dKublJniViAUfJX7QLDV0hYOy3pfwkvoy4g6fcqllF
         FtrFBQB12MNaaZ3tyDOgvKvDgu0v6OeZ5nPcgl9ilWj2/TZeDP576bGpB7HE6gcfL11e
         67SuvLYOWegJ6jMSehMF+2Rphq5Vl5DfI1r3pqBHBNYnjnf/s4QAP7evi5gW1li8dWza
         Phbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fl8WSWhd;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e598fdecsor4167577b3a.12.2024.09.10.15.17.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:17:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fl8WSWhd;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006623; x=1726611423; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oh25CxvFbaGetIeF8ZGKIaTcgg654mKr0Hk3ECIvo8=;
        b=fl8WSWhdhg+GiTTRP4Rs9O3wHsHLbqAcVZQUw3hdVqCxXk4Wv0thYJvo9yhn3/LgiI
         VAjZoHD77m/2yTx4W8gd2TVgqLkuhbQIj8Q20JB8htETsVFCRhvfJNQxy4MWr5AKucqO
         GJ09XPM/NV/JD9aTI2Ec0csnS+p5rqMupMwrYow99rZBn/Sk3hWIRO3KBYn1/5+vBKYX
         dtHhiIaOZooAbXQsSmYbE+FRXWzLsPEWk1a2R+G8D0wXXi3KUgQ0C4Bc0P30hrlhp12P
         HY9LfXfSOo+H2g64zCqpb3uTh6KxAS8FhhxJ+zrcVsvrvaMnG8ivXNCOUPQw+n4OtGpS
         ZL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006623; x=1726611423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7oh25CxvFbaGetIeF8ZGKIaTcgg654mKr0Hk3ECIvo8=;
        b=SHDat/6O8BATgFSerDR3HHpEJsoTpqm8dXi1W7StjxWohDT4HaMHPKXu6WrygGCw5M
         Pdvj7oOj/5sYwphyek//wsqHOmAwv4Q9nmt0TCppsAtv2ykVZJLU+iuwd5QYG5rHNioV
         FKtIsuW7kzmjIlVAnnW7xjFw5mb0TDWeLBmtWiTIXz4FbsLfmiJADyhZmk3F5VQLE7bD
         4dUyNkQsdpfOWbW78ZBVmb2CT/CLhjXNIM7Yi7vZTAjTrI3XU7bcsoKVubp+StRKbTqj
         hPhHuk30eGeOHFYqkE+npPVlJjieZfjg657tvZRXzUA2iIVwo8AfXnK5p3VbMquziaQf
         Ldxg==
X-Forwarded-Encrypted: i=1; AJvYcCWTp52VulonG7deniO8Ip8ri1ALrqrKjqa/ab3aic3Zd10dkKTrNm2G2G+wNALFZF79iJ5BU0E0T+Td7w==@linaro.org
X-Gm-Message-State: AOJu0YwlfCI7kCRa4pS8lnyPAH/frHUNty7AWriV7PUGM4PH4N+oxF4u
	BsHrtaPZDE7nQSBPMiP9ZtAmv4rC9P/v4q3JYUxlQoLNbpxhO+Zz1l7PPUbEkR2ilA==
X-Google-Smtp-Source: AGHT+IENKO5MwL+nWqP2QL7ZggohAMhCWhPKSiwX+PHvrBh02mVemU/5A9wLas0m1Pzm50xYKxp9XA==
X-Received: by 2002:a05:6a00:66e1:b0:714:3acb:9d4b with SMTP id d2e1a72fcca58-718d5ee03c7mr14772194b3a.18.1726006622546;
        Tue, 10 Sep 2024 15:17:02 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:17:02 -0700 (PDT)
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
Subject: [PATCH 22/39] target/i386/kvm: replace assert(false) with g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:49 -0700
Message-Id: <20240910221606.1817478-23-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: +kXHlPRQrhVA

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/i386/kvm/kvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 2fa88ef1e37..308b0e1cb37 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5770,7 +5770,7 @@ static int kvm_handle_rdmsr(X86CPU *cpu, struct kvm_run *run)
         }
     }
 
-    assert(false);
+    g_assert_not_reached();
 }
 
 static int kvm_handle_wrmsr(X86CPU *cpu, struct kvm_run *run)
@@ -5789,7 +5789,7 @@ static int kvm_handle_wrmsr(X86CPU *cpu, struct kvm_run *run)
         }
     }
 
-    assert(false);
+    g_assert_not_reached();
 }
 
 static bool has_sgx_provisioning;
-- 
2.39.2

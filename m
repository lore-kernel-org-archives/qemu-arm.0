Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp582238nji;
        Thu, 12 Sep 2024 09:12:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d91:b0:70e:a42e:3417 with SMTP id d2e1a72fcca58-7192607ff73mr4992866b3a.10.1726157527496;
        Thu, 12 Sep 2024 09:12:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726157527; cv=none;
        d=google.com; s=arc-20160816;
        b=mT9F1cVLecjarQT4sI1jBIMJK9W8pkiP+3KGBvFrd4QJan+Cxmn4hETBOsqfQsh+pP
         m2CDLFLpA9hfUOjGW0lMz0StY27oDByR65FPV5/9IWz2Ql1F/CvMQYMaVVyAPmvLB0Wb
         PGIWxpKwy1aZJScYdrJ6Jee9RIjbLxAt41Q+ZP69bl/h3dx6vcWaNKemgzgt/IM3h6td
         huorVUu/jZNPWEG4+RVXSMRZUphLVe7uMUS3vt26+ppg6kyqfOvLkZPyswl5xHoemKbV
         JZOBdWPVTI75NcWVMfkPexJvCwtO9eQ2NHtESPWt7vMsO1sRYcUkctscusSWMbR5VWwY
         VUpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qewOobu1vObZbuzJ+iuWYysDqS1YnBarNPQM9eHAdiY=;
        fh=ujiE8HSy6YTG7a3Z7CGLGec891YtQfFM1W/0TkY2zUo=;
        b=eOLriJmHaNcZbTq/AOARoNNffp+C9jbmXPXg7Z1IHtmjo+reRcB8mWkGiwPo3odLWV
         GfsVXcdWhJWGQs6mQCEzKhdW6H56sxSIiADNw2uMEtFG3iKp5CQ8Pbmco6e9qe0qBBfC
         rqX9Y7o79lEvQxuaMy1QzDVFD5SoD/BK+mdnIu4qT6NLdYyqF6h+xTA8jxgdJOCdKebS
         mVnVy7ukOI7fNiUVwA2toZqr5hu4J83zU9vKbH8v5JRkA/Zjrqb6rjD+mQoF78oax1ZN
         5AKGKVyAvafYArsHmXVlJ9+9MAb2MhCQLkqD1+O+h1g4tyswS0bhk8zhiJzpqWLg4hVT
         NOVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VuwKXK7S;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7d82692c62dsor4467742a12.10.2024.09.12.09.12.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 09:12:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VuwKXK7S;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726157527; x=1726762327; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qewOobu1vObZbuzJ+iuWYysDqS1YnBarNPQM9eHAdiY=;
        b=VuwKXK7SpeQyn5SjGQkBNP0OYAmIHK9zkB8VZPLarGYcmC3cylHmEf959V8RcXNini
         dYAsTyLn8pPCSNCCsiP9wI7iVnvUNMy+0Jd/cZYGGobN7I+jvJZ4JzRmUXYvwpiiXAUb
         K99s4bHdN4UZkx5NKCwIS9bRhHzVfDGiDCfQcnXyFhrMjFIr81jr9gsCElzW0Ra8LlZK
         F+WsfhP0NYuCvcROvFcak+WGo4KeSDSR0YIw1q+enJglXbsDO/MAcEueGS7is/1aj8j2
         sWPG0MNYZ6auqikVvrWGpzUY5SUIa0WMCApcs7cyDJKARivg2NI0Ky28QiXUnoSIRe/U
         DYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726157527; x=1726762327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qewOobu1vObZbuzJ+iuWYysDqS1YnBarNPQM9eHAdiY=;
        b=ugmDGwLvwxo9IUm1MfMuSe5xgHC6xHugE7WkCVkZnxRdhFk88Mrb59vTX7NGO4MPEq
         yn+l80PGpNyEyhZNzS+ouzsVkAjOc4BmSgvALpQZrwYHACmV3oPW4+GsIPOY+rwFBLg8
         QFaLtuU7bT0lWX4fJgWKHxiJMaLzutVFsFQGyhAZTY262O1YzIUh2ILVvA1xDJDNQn4G
         FnZCIDPXCxQ9BdDxtXBYfVxi6bTjZitnnHW8rrrdFWHrM46teTM0T/fswnfM6CdjkwF3
         yz6K8+SZGNoxN9HddiDEpdxvz/4eEhlYYHkyxVmtuo4MvKFsjBR+7bQOl1yKZrWpkTkj
         GCPA==
X-Gm-Message-State: AOJu0YztqafEwyF8Du1NZlsKDTzfV3CVgIlAWjowp4x5NxNOKQzqe9mP
	n6V1Ca5TDCNuO7LE24z9vXAAGgfj/xMGlf71YjI8YOWFXj/3vx9HxiAFIS3lIwCPWg==
X-Google-Smtp-Source: AGHT+IGfJHrcD4FeIRzLtjG1yF8QBxXB5+wVdXyMPyemp6yKvRgw1X8BWW7xKjm04CE0VvSJxj+cTg==
X-Received: by 2002:a17:90a:2f64:b0:2d3:ce76:4af2 with SMTP id 98e67ed59e1d1-2db9ffee48amr3456585a91.18.1726157526967;
        Thu, 12 Sep 2024 09:12:06 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db0419aab4sm10868139a91.15.2024.09.12.09.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 09:12:06 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Weiwei Li <liwei1518@gmail.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	qemu-s390x@nongnu.org,
	Michael Rolnik <mrolnik@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	kvm@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>,
	qemu-riscv@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Fabiano Rosas <farosas@suse.de>,
	Eduardo Habkost <eduardo@habkost.net>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>,
	Hyman Huang <yong.huang@smartx.com>,
	Rob Herring <robh@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Jesper Devantier <foss@defmacro.it>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Fam Zheng <fam@euphon.net>,
	Klaus Jensen <its@irrelevant.dk>,
	Keith Busch <kbusch@kernel.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	qemu-ppc@nongnu.org,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	WANG Xuerui <git@xen0n.name>,
	Laurent Vivier <lvivier@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Ani Sinha <anisinha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Corey Minyard <minyard@acm.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 45/48] qobject: remove return after g_assert_not_reached()
Date: Thu, 12 Sep 2024 09:11:47 -0700
Message-Id: <20240912161150.483515-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912161150.483515-1-pierrick.bouvier@linaro.org>
References: <20240912161150.483515-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Rax/5VUrAPmu

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 qobject/qnum.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/qobject/qnum.c b/qobject/qnum.c
index 2138b563a9f..dd8ea495655 100644
--- a/qobject/qnum.c
+++ b/qobject/qnum.c
@@ -86,7 +86,6 @@ bool qnum_get_try_int(const QNum *qn, int64_t *val)
     }
 
     g_assert_not_reached();
-    return false;
 }
 
 /**
@@ -124,7 +123,6 @@ bool qnum_get_try_uint(const QNum *qn, uint64_t *val)
     }
 
     g_assert_not_reached();
-    return false;
 }
 
 /**
@@ -157,7 +155,6 @@ double qnum_get_double(QNum *qn)
     }
 
     g_assert_not_reached();
-    return 0.0;
 }
 
 char *qnum_to_string(QNum *qn)
@@ -173,7 +170,6 @@ char *qnum_to_string(QNum *qn)
     }
 
     g_assert_not_reached();
-    return NULL;
 }
 
 /**
-- 
2.39.2

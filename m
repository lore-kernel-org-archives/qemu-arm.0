Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444426njb;
        Tue, 10 Sep 2024 15:16:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMtqtpi1dBFi2Rpd5NMgZBVs9nzY9mpUghupHVv7D7ggKTWzBgDg9OyV6bUFniIiQ3+DEEi/Xb4s7zfA==@linaro.org
X-Received: by 2002:a05:6a21:9d83:b0:1c4:f0e0:9ec with SMTP id adf61e73a8af0-1cf62cbee66mr1475424637.20.1726006594683;
        Tue, 10 Sep 2024 15:16:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006594; cv=none;
        d=google.com; s=arc-20160816;
        b=T5yM6xaNilvZdl3y4ogbCJpAybW4cSOLeHFaoeCmvImVGFPAHgDMwP1W56i1FGBVpf
         1bZ8nJD/uLQIwaYDsl+EVUxwwo3ubP+GPMYxX9y5D4ULPQNBb5tdxFMLYtcEVRQpJucU
         G08SlgUj8td85CcvmOVrW6Z5SI317jS9ff/IjLkNKvJas1gZk14tpu3OgyWwVdEcLsDC
         LuvdFsFdAd75CKcR6XY/xwR/yL1mfmu0S6CQ/rAuZipuEVFdWbmXfAux7T2SfUuzf9Cd
         LUlXRnKZOinGgcOJdAkH0tIoQ+0P74YbiLlHbLR5MvM2qsVqhht+juKED5Lnbww0F2Ci
         OpVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kX/5mXkAZg/T7UoQ7ZiM27KDnvioZeAa7JGin+VRbgw=;
        fh=s2DImei7nuBk+CID/ZcfEIN6rkxxxqnwO0UAMmX1KWE=;
        b=VAEr6lEDkt7ZuFbd0rtaLnJOyqDJoj9Ezb8nX4qSIyiqmVM61QJp4Yw4/bQUHjRCri
         mvLMsdQSo0qxA41CbreZtHSC4ZexJe2WHU2auG6KXJhCLPLXUQa/+YwTimhvqMSMRvcI
         RH8dq5qoJWu8XPo/+vSB6LOKW/5vmfSQvRmfr7cHEX3YSczNiAi7NlqLdEjSLF6k0WFh
         nwY7OpexLNEmD86JGSOop8B+5e1FSA0ZpiV5NMNLc7wJO2XToX+Bqyp7eK3YEb0MA5vG
         IiseUX+3cOZLWQ+uoswlLhBuncjMGc2zJBwrqoGT7Lg9+xWEaKiuM99FBYDrIpb+4EAi
         TzUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kp4xXkuG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e58acd85sor4331384b3a.2.2024.09.10.15.16.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:16:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kp4xXkuG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006594; x=1726611394; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kX/5mXkAZg/T7UoQ7ZiM27KDnvioZeAa7JGin+VRbgw=;
        b=Kp4xXkuG7wSVWZBKP1ol+kovPuGVHkgfeK6+H2U31VLd1sIn9hitG4nwXa7k7cPMp1
         0w/oGBSQER9RqGYVzyo7I7i6csd2enf4JDclFElcLpqFvoOjrrK7yViruACOeKjEcWKz
         nqG4zsn5XXkCrkbG81mJIvv0XMb03I6ljIUqLy1d3j1eMzsMsNpYJ3gn5M2Ug57sOOuj
         1ftE70HsfARpVvjPmTF1XTMx29HSRfHD6r2vPn5btTjnffFhb1lsW3BRN9foCJ3rCxRs
         1yDDEnxNATLhyDy15g0Bdbvx5PCL92Gu2kXlQ6CWkpBWuuYFxtCnUGa3rau9yZ0WnQrn
         tMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006594; x=1726611394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kX/5mXkAZg/T7UoQ7ZiM27KDnvioZeAa7JGin+VRbgw=;
        b=O+ZIC7ivX63FMDcO4iJb72Fh892cCrzTe5/au+qPKjDWDFT2DuqJspZSRVz1EolZO7
         jIx8EO0ncRAMPb3NEy2PmxN+1veFKCAc3Qo7sUkV6sJoxHrmUVEq4c310oKsgEa+TFKP
         UJa8LWKzoq3Kaj41cyQ7Z/hoC12ETxQ3rVxNrY4LnzlmWuhQgsMWsKfd9ijF2F7gqOwU
         b9S9ocBd1os1yz55NEM4wVOw7Qfj4mTRGU/oYEe7afDdwUU1qxZ8oj9x588uUGf9kKgV
         4XwMLZQvAyKLSaaPLDqxQOFCKl5cYgFc2EydK/Y9CCpeVuz2J/2IIx6aneXXMpNrLgir
         i0nw==
X-Forwarded-Encrypted: i=1; AJvYcCV7BTY3Hm+wZH3YlcKpDILBKIhiklVMb6Hx9FCnrs1SzSwu+iDjBNXutQjqktdS6d8dE99vDP8i3FQkaA==@linaro.org
X-Gm-Message-State: AOJu0YwCZzyCG43kAzNSBZhbeKIphy9iBYZ10dNQq28FphC/NXMFnHZg
	esh5y3vM+CuU7wl0I/Xo0u3NvDlSpwhD66TZG+ZGXkgdSDjye6Wa7uLzi4MwCIp5RQ==
X-Google-Smtp-Source: AGHT+IFH48rM5zeGac+OC8ccWI5NmVtaDHDVn5dEo6JbJqidSyB3SpDh1xyjFSfF49d06KaSKXm8oQ==
X-Received: by 2002:a05:6a21:458b:b0:1c8:a5ba:d2ba with SMTP id adf61e73a8af0-1cf62cdaf9cmr1582093637.22.1726006594141;
        Tue, 10 Sep 2024 15:16:34 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:16:33 -0700 (PDT)
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
Subject: [PATCH 10/39] system: replace assert(0) with g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:37 -0700
Message-Id: <20240910221606.1817478-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: A/sr05lATEjB

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 system/rtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/rtc.c b/system/rtc.c
index dc44576686e..216d2aee3ae 100644
--- a/system/rtc.c
+++ b/system/rtc.c
@@ -62,7 +62,7 @@ static time_t qemu_ref_timedate(QEMUClockType clock)
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
     return value;
 }
-- 
2.39.2

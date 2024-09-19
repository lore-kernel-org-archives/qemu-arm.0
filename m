Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161371njg;
        Wed, 18 Sep 2024 21:47:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZ1AhRTWQMuJkb47R3X9QypcbrNJ/hkmXQNHd4ShndKgntFJjBU28tO2477ucwmr4hY1JV5Ozhikya4Q==@linaro.org
X-Received: by 2002:a05:6a21:9206:b0:1be:c3c1:7be8 with SMTP id adf61e73a8af0-1cf75f3b4bcmr32273553637.26.1726721238269;
        Wed, 18 Sep 2024 21:47:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721238; cv=none;
        d=google.com; s=arc-20160816;
        b=P2iGM4e64LH+3Mc2UkpSnd3sDwI0iCFrPe75y2fTj+xm4bvXV6AzauhDbFNd8BYg/8
         r48AXxI0N836ecVvBrQijXqGvB05aU/gVGrIGUT/GvNropULMdzAacpXNo1+FV6GDikx
         7KBn5HCAB1kMYFeYORfapzxv007rqQffWwXvQSdu1CBt5wO3rgSJYZnMckPlyf0rUU/S
         TKftpk6vSdyRSBiaeFx+eogZyk3cANUfC7JBoTD7uJEw9UN0Pp7dtKRc+tw/XG3rdY0w
         B7pfOvZzlZB3qallbd33G9WV9AF/MvpGs+iZZA1+eCc2M1DLY3QMKBP8vwDCmCOuRFXY
         ly8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3PbYSPAJ6rnlNnfP+6+lqxv7ue/rw4dEH/6Q+9usd0U=;
        fh=26VOEFMpBHZK/myUVPjm6/hAJHsjnNhFgKcDF3WOuOw=;
        b=kfk1kpG5O36xNPpcntpBjUiPKgwGytP0/ugKwQyLWQWGN7xPU7SLBdmnDjt4ipWw3/
         oW5gX8SZbHlFtW1IlRBMFw48t/0Ms4PNz/JsC+GuFOavg97/vv/pY45BOVrcaFSnX+ri
         vc089J3jgrfPlTUi+VcF/FarOdn6xOZ1Ur2Yuj0KYjbRaSycxAAC1PJGMx8QlpnKgydk
         AyU3m5Btz7115S38me8oQy0H0H1XpXZQTHayT2vH6TpoNcN5EPbITnz4HyLnuPMli0+L
         r1F7tn+kg5DwMtVfl7ElyH0lOK45YsIy0YsiUf6xkrFbmtuKIx1EC28dpfRjCej+yJhd
         Y7rA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OOyJmwWK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-719449b10fdsor7149581b3a.0.2024.09.18.21.47.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OOyJmwWK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721238; x=1727326038; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PbYSPAJ6rnlNnfP+6+lqxv7ue/rw4dEH/6Q+9usd0U=;
        b=OOyJmwWKCE4m9FUarurBY2wWkYZue4lPZ12YPHEwJ9Xo2dPpZA8kxDK5EUJsmIfiR6
         7NA79j1htlV/t6+wS/QRaQb3gf3Wwmk2sIrDZL0IrBoZ3h3lRsESjkJJMXAuTyL/VjLQ
         SIQc6x7TkVg4AmYiRHiFdXKwyWjgvWXS1jzGW0mFCPBSufbfYEaODf9yBFmcGvgrki7r
         ZjoB4fIrrQC/rURY1Fd0EMloB45kG/9hB6P1nTz0Ax0bxVkxmixPyrtBOiHNJ8MHLJKs
         vUxk8Ma+iQuYWI/ODQAK1lCXL9DTjweDxrkfl+Ka0ritk319jfMhTpZSOI4NqMIxMHuG
         58KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721238; x=1727326038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PbYSPAJ6rnlNnfP+6+lqxv7ue/rw4dEH/6Q+9usd0U=;
        b=esIXA6MvyMOXXs4GONzq2gBXqLODvbBh3GEcs8sND8foQUv2hfkIVzMOtyPBmqHztl
         JRfBoJTEMVvGgwfFpfrTM/3L8cS5GuHZ3PU9IB8xHFlgG0kW1HY9XVyaKtODnhfpjjTw
         JqSjhu3OIvKIBPGqAA9kkrSFsHi6uhz0OybTVhj2KFmDZHveVjfsi+fYLjje2upkkGmV
         4QNCvZklb1jf+HeJfalITB8+Yi91fXyZwO3K8NiLkZuSdphN/K2axP3pjztDCi2vArJx
         Re77ur8sYKxWvFr85/2Dz4Wms2PyMT09FFV1/XoXa3c5lE7Waf1UkUaH7uaIlfWUhTPA
         BrZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF1viVAYeSuKAXu/+AsH3NccfE6rNxNKDn5PdJ4DNo1PDJTWUdItm4zAay3mJtaLqg+swqer/kBcujmA==@linaro.org
X-Gm-Message-State: AOJu0Yx8xrrz1EhBqmHMSKBc4Ip9CCaSXarD5GI23Jp3pLeXr++Wa9AF
	84OboF8e4FveTrW8s0DNVvHrsm53ykxr5ModO/pHGYGs+tSRj+mw1ZG8sDz0ZCfD+w==
X-Google-Smtp-Source: AGHT+IF3mDmH9rpxImg7I9ZiTJydkdGhhv3x9u+IP9aPf7aanW6JNd2XCY8CeZpnshOcXFIkUiIf+g==
X-Received: by 2002:a05:6a20:43a0:b0:1d2:e8f6:7e6 with SMTP id adf61e73a8af0-1d2e8f60a4bmr8759330637.13.1726721237824;
        Wed, 18 Sep 2024 21:47:17 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:17 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Hyman Huang <yong.huang@smartx.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	kvm@vger.kernel.org,
	Bin Meng <bmeng.cn@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	qemu-s390x@nongnu.org,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Klaus Jensen <its@irrelevant.dk>,
	Corey Minyard <minyard@acm.org>,
	Laurent Vivier <laurent@vivier.eu>,
	WANG Xuerui <git@xen0n.name>,
	Thomas Huth <thuth@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Ani Sinha <anisinha@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Fam Zheng <fam@euphon.net>,
	Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Keith Busch <kbusch@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-riscv@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Jason Wang <jasowang@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-arm@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-block@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	Weiwei Li <liwei1518@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Yanan Wang <wangyanan55@huawei.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Jesper Devantier <foss@defmacro.it>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 16/34] block: remove break after g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:23 -0700
Message-Id: <20240919044641.386068-17-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: cjjk1Jip6NaJ

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 block/ssh.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/ssh.c b/block/ssh.c
index 27d582e0e3d..871e1d47534 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -474,7 +474,6 @@ static int check_host_key(BDRVSSHState *s, SshHostKeyCheck *hkc, Error **errp)
                                        errp);
         }
         g_assert_not_reached();
-        break;
     case SSH_HOST_KEY_CHECK_MODE_KNOWN_HOSTS:
         return check_host_key_knownhosts(s, errp);
     default:
-- 
2.39.5

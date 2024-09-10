Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444370njb;
        Tue, 10 Sep 2024 15:16:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWbSlFrGLgVdQleFDERy3uZio9/lXEqR1O+lRwgetx2BtTxTl0/oyjc08mCGr7cdYjWZJK3i+jeUchtrA==@linaro.org
X-Received: by 2002:a05:6a00:9166:b0:717:8f4b:afd6 with SMTP id d2e1a72fcca58-71916e9847dmr1129658b3a.20.1726006585314;
        Tue, 10 Sep 2024 15:16:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006585; cv=none;
        d=google.com; s=arc-20160816;
        b=ylEu64FemalBsq+WZvVtLQxQmgAphy02ubd6sE16ghgWtqGD4Og0+LWQOb+WLZkxDW
         P6vquPWsNbvlsQfg+D/0HXw/tErnvseEss8DYxfxdEEPgLkaPYzFGhUDLItqNpK1MmRA
         MzZg7X4B9/rU7tzpHdLrq6wChg/5czUjSuenMkyhVXk/0ryEMuM5Tc3MvU1WGKZcoG7c
         lmDFVw1ZEIYMDIPHZSLKoy3PJ6XzUk9/iTeiiCGO09eVxgdmVL6PE0YSRJmqNaf9mJ7J
         cBmoduKCt1Ez1Y0E8bL9/4DUeX9DFewt3FLaTxOwiKz8l/HYGYLJDDvG4Q8GfDzGsI0o
         ZmcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=puqvVpFKVlVCK3CqflCQnP9TK7q5f0hM5PCb/iix3yg=;
        fh=/Ad6e8xYWDOmiY1BF0k71nZBN79TjkVg0pdKxQQEk/w=;
        b=ldUUfFGJuYDSBh0mD+g75LxhceyO53vwlW5E3n4LSZnOzmowvLJujFV0oYAdjdiH/A
         QZuDulO4odKYyQ8Tv6g/CPpcdt5yswf2GpO78wk0g7V32xTYfFmt0nV4l9ZuxYoRJKPO
         POqeEkonaS23ORUg2UeGxVzw3YL5MMeI15Clb6fiDiAsKEVvzODo9l3yl3oehMepKKlW
         XHeR07k5Xtjq7vYSzrp+V0yU6dUWmwawIXJIpWoegd4MngDk2gaOWnwAF9mZhoVduWhS
         Nls+9Y7SXkL47Jpx7ZbDPDtJieMBLme4IPl01CYigzGrMFqCQgwBjayUMpkd8aheQElY
         vM+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SDNNp5K6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e598fef8sor5299062b3a.12.2024.09.10.15.16.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:16:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SDNNp5K6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006585; x=1726611385; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puqvVpFKVlVCK3CqflCQnP9TK7q5f0hM5PCb/iix3yg=;
        b=SDNNp5K6DuYTs2mSouPD314T5iYJ05FuRzosiAAd7Z57hw4YgYOWhoVwKxcPqy90C3
         y3OBswrbcDstm51gIxamgE8YeJ3cJs/gdEsl9x9H82AhlfqFtpQReaJPIOdBMyhKXg9b
         oxnTGbaIH/goYp1Z86FgQLlcbPjw1NkN1P1sxfNFCMlrfJZcZ+GFC31bAd4ngHEwT2YS
         07d1vSkhcu6SgeUIywX5IrMu51pvQuVELSj/mMUnF4iZU7u2kQpFnxUK7lFwAv52vwpq
         +fOwIBqZyGEkUvnisncEttLjJWFAQ1VVZveHh9KdeedGt31tZYkqNt+Toc3Yewl+jLy7
         7fMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006585; x=1726611385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puqvVpFKVlVCK3CqflCQnP9TK7q5f0hM5PCb/iix3yg=;
        b=QVHO7D8A2l+UnGLjTZMzcwLGzOeaQciSXky9nelXsAuzoiLrigjBMX6QXGh6ei5mLT
         VP3x9Npxjt/GQPFBZvOZYND7piZ40j3bfDEz/ai2Gx0C5dGqhztR3AMnzFY8aArM4kcE
         IQsoFfXSqeaSk9W/DdNTEguX93EVkFlCnwgOVLhxmGGNzWCE1ogCJdw+8RYAJoPQdILS
         km09mfn7NlFQSArVLB4emVKWuSJRv043e+QxS/DOGQyaMfurF2FNHXoVhKZab4WNzTzL
         JdEp2miHyWRrFl3j6rqzXpD88Kloq94ADWKkyGwssLuHcpGTn0wndekss1SWDx/CNJmc
         U2Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWG007lMj1Nut2x1797+XYtLDR1l/E2npO0K2e18UH0FnI4/38rjU+MeFDq+zZ2ZAF3Q6VaZ+Qet55Cag==@linaro.org
X-Gm-Message-State: AOJu0Yyh+18zJgYMvUqu0LBuxQxDgIA+LTYsAIBs456BJctVZkQkg3Tq
	ii1qhxP99hoLhP/mLFcoCoP1S/sTDpFqbA0L1r1JmtLZMUdGgRmW7R8cV6PrDEfnww==
X-Google-Smtp-Source: AGHT+IHIvrzvH/+9jVryyqHImeYb4fOhg81YBUc0CfmQo7SIWh/8KSDCX9LvH03UUnVz/fF8OPBLeg==
X-Received: by 2002:a05:6a00:8586:b0:717:8aaf:43be with SMTP id d2e1a72fcca58-71916baea16mr1226278b3a.0.1726006584757;
        Tue, 10 Sep 2024 15:16:24 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:16:24 -0700 (PDT)
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
Subject: [PATCH 06/39] hw/net: replace assert(0) with g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:33 -0700
Message-Id: <20240910221606.1817478-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /Yc5txx+rY6T

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/net/i82596.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/i82596.c b/hw/net/i82596.c
index 6cc8292a65a..cd416a00ffa 100644
--- a/hw/net/i82596.c
+++ b/hw/net/i82596.c
@@ -282,7 +282,7 @@ static void command_loop(I82596State *s)
         case CmdDump:
         case CmdDiagnose:
             printf("FIXME Command %d !!\n", cmd & 7);
-            assert(0);
+            g_assert_not_reached();
         }
 
         /* update status */
-- 
2.39.2

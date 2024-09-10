Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444656njb;
        Tue, 10 Sep 2024 15:17:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWOWJZLHM87wXH0Pah0Qb1p+Hi+MZLuP7X20X+inXptNBjtykp3EdLhOV1WwCtUH69m4v/wbmv7IUHdMw==@linaro.org
X-Received: by 2002:a05:6a21:4a4b:b0:1cf:4ad8:83bc with SMTP id adf61e73a8af0-1cf5e19e20cmr3431442637.31.1726006634316;
        Tue, 10 Sep 2024 15:17:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006634; cv=none;
        d=google.com; s=arc-20160816;
        b=ZeAfr1Lw+BEXUuEgk52bF9CDd/VPUC+/gzWcRSBK9TQcNzRaFhxCQEJaX4bDFbMMsY
         JDECjSklLTWE0I5jo4H08bekE0ltYN+j+U3/Aipll1QGXeNzM/VaZfCu4OflCvJJKVPN
         LkZRgwCnv7MxTByUsHoySbsx+ffSwzEtIrERkWJr9snptxn+EnVx5PhfLoKbPyicuyrn
         5j/eKJJeLA6vHkja+FigTisznp79FzeE/4Uo8aYj2ZX3fDeQkCm1yfkLy7XXQnu8hxwR
         k1pUVJuQsUHJHRa5t1z70ESbY7R1IWpZioaX/FSib7uGBZPUaz8foZoQpu0oko4LIQEx
         H4bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4ywE7aBllZLgmnJKdHtMZdYUoug1zQm9p/Yk1hU0pi0=;
        fh=cDtq35cZxmkuWtFrKNkyzlJwJ6oYehpYFWt/kEQtaSw=;
        b=jgpNAanwG9qV4Z9gBkYEXj0N/HHDn82l4u0JWr0Hcev99Pl5m+XQXB2VXZWzp33DFd
         cFUI9VutuXEstYzZkfUWtMgvKRLNnO6ml9LY4UJxfealsHzJ1DXTL46aUWwwnV2N3vzz
         QKWzkLpXJs8udArLcJY/zIQqRSepoZfBjl3LZaXfWhxSWDffmZAF5JAGB19T0488b9wq
         t1O8EOXp9Fz0ynCKmfU2CAjFAPP7FVSbcfx5osBr9tQBsvHg5agmqXkG1YfUoZ+YnX/f
         bu8jXCf3uJd1T/JHqL/QSswd1Rf+mjiwpyfiPFlsc50HyKZK/FiFyydalUuO1YzaYKJo
         452g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rsEJl1Q+;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e596f0ecsor6473207b3a.7.2024.09.10.15.17.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:17:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rsEJl1Q+;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006634; x=1726611434; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ywE7aBllZLgmnJKdHtMZdYUoug1zQm9p/Yk1hU0pi0=;
        b=rsEJl1Q+3cGSscEn4Ncpbz46OrUZXaxFJKtZ7FDckggh6FglPPEBPjEL2WxH9aAIvu
         Y6fHvRLgeEHQWimhz+iDn4MOG2Wz/OcQF0sRMj1KakZGB1Rkd398smm9XhKdoamlKVFh
         ePJCvBdEc8jm1OkJ6e1WxQZxawxC9ybKePFir4PIlflL90eOLzCAAWD8m22DKKFUyIAg
         1OVUaUg4wTZex4LOuAUAiTD6GC1rlxkDaQJb8rkcmupwJVgZ6gDKtD/j/UEKIBQmWYbj
         vwSL7E74mq7qxKWUVAso5Sk+y+29AozpnT0mMyJGnxyuB5OCN7AtByk7vP5C+RRgs5XV
         R6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006634; x=1726611434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ywE7aBllZLgmnJKdHtMZdYUoug1zQm9p/Yk1hU0pi0=;
        b=oy8KjjWF8AoQyetEwrBxgy67MfzmxDv/32fgv06BL8+HZSIUhkoamWQANwnhfSpLcd
         XsTrLFgENyBq+1tCo0gdlsCHDqPKn3ZkRpLzQEBHp/khnSbfBqjTrYNnhsQrGKzeg4BP
         SewTq+AosnobXRrjIhSadebV4Mrh5TGMTm7fGGcWa3+YEOVmyqDiGCyhWIiNn8uAspH/
         vtXQS5uFXWV71WJKl/doQhGhH4rzYSz2nfg4NUZk9ts7ODgCGriAVHu4Dg7dmdVppHem
         S5g5Md+ubJzlDlbr9wViERrQs7mcPmWDjpO9NzHmXp33FfmjumcTXGrZ4jJI+zMYgiL9
         7Y6w==
X-Forwarded-Encrypted: i=1; AJvYcCVqhgQ+9oyIEAded6ojx8wEr6yOvoSPCe841UXawBFD3ZtPNrm158vyr1QHT4pgOHTF+gcGTDGzhRTOkA==@linaro.org
X-Gm-Message-State: AOJu0YxFoVPRwO/5e1Awh+bcYQEgNbuYUkDToZh6Pz1Fkz9XeZPSB901
	nakDyt1Z0WqvuCZIZEPMTyizd9xdLec6D37qPodNYjXdvvZw7L8Ip16lF5qrirGrbg==
X-Google-Smtp-Source: AGHT+IHHTIm661dnrLfProZH8rQf+m5V0dPJUbPuYgsdXc/eGTx4AE4PeGXzkYEx7p3OoHgG+hD8nw==
X-Received: by 2002:a05:6a20:e68d:b0:1cf:32d1:46d with SMTP id adf61e73a8af0-1cf5e19e225mr3167109637.32.1726006633892;
        Tue, 10 Sep 2024 15:17:13 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:17:13 -0700 (PDT)
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
Subject: [PATCH 27/39] hw/gpio: remove break after g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:54 -0700
Message-Id: <20240910221606.1817478-28-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 774qpTIdkjKu

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/gpio/nrf51_gpio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/gpio/nrf51_gpio.c b/hw/gpio/nrf51_gpio.c
index ffc7dff7964..f259be651e1 100644
--- a/hw/gpio/nrf51_gpio.c
+++ b/hw/gpio/nrf51_gpio.c
@@ -40,7 +40,6 @@ static bool is_connected(uint32_t config, uint32_t level)
         break;
     default:
         g_assert_not_reached();
-        break;
     }
 
     return state;
-- 
2.39.2

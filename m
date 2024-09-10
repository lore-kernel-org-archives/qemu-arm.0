Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444643njb;
        Tue, 10 Sep 2024 15:17:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWuFY6foVPCh6Qe3OBRquo+IUnM65k31ce2EvvA5y23HMUeyv5N2l14rCTMLKifde6RzmIxK9WluiSFww==@linaro.org
X-Received: by 2002:a05:6a00:8c2:b0:718:da4e:5577 with SMTP id d2e1a72fcca58-718da4e562bmr15998393b3a.14.1726006632206;
        Tue, 10 Sep 2024 15:17:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006632; cv=none;
        d=google.com; s=arc-20160816;
        b=pRoWdyNSDNqj+3wZ84QHnYDwJvJ50+b+GyS72uX3Bx2jIEG479cT0GJEYiZr5vBSS6
         W885fGdPYeJVlwzim9aTICk99mN/j7IfOexLjGPxj7T6MNv5GDK3Z6fj0QMpQfn2kj+y
         apqkAkeXPEsNoWxS3Fr3mLk6zGut8V1dcOWRM9NBshITTDG+cPeH+zwJWrU96Tr9eoJU
         FD2c+e26IkbXVB1yv6c5l5UlfcDmv2vZLqytkiRnZQzHWEVw21cDh6ABavwo5VUpEHmb
         dcTXAadamG/h87LCpggkqvgptS7v93sul/akWlj5Vj4DXeG1Ta51AdJGbeBHpDUXYNYi
         Bl1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FxBBj8XHDZxd3pwPDQhaFTyzR1JvVS6yl60rcPuU8DE=;
        fh=YG44SPwnGmBPciEVsXj93yNi8yGYTnGBNDe19JLbR3k=;
        b=IVPF21HRhNbfdB2VRsg4v2Gf3n14dZWgpByG8Ssz0OveZslD9KXafY1OCqyKruDtbY
         J3JsAvtAp9RSr69y1UhUB03Bqbi/1Uh07QXwWFfLAo1GzUqrUkJtDwEM8Qok6kinS3J9
         9b4xlD1cs/XsFVawqZvGKODLLR5ikHww0znDcJfBBveBGSlNjgzB/j9yewfKDd7Lv4xx
         Q736OiPjU8n4nX+zVBA4qGzGJ7j1hTGK96Cjr1PDJvFEIokV35eQ/Jn/xJMA/mnegLYZ
         ykdRWG8nvu67lo4siPyLbo707IJ1ltQ0boBn5TJYnrNn66U7HKVYagXzYxHYdc2WOueZ
         cq9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fBHTuBOw;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e59738dasor3823885b3a.8.2024.09.10.15.17.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:17:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fBHTuBOw;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006632; x=1726611432; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxBBj8XHDZxd3pwPDQhaFTyzR1JvVS6yl60rcPuU8DE=;
        b=fBHTuBOwMSOLlzijt4fgGDOOZYQGM+rDuUfdrm8ll1qoLeWT+cAcrXWCfUkBIXEB3u
         NhaJdBDMPXzduJoVrXVXFb510DPeuJYo57wU9Jbw/ZzAZFtrUG0VSPz7nPosMlBtp0Ia
         4AgUt8K/6xjYX7BShH+/VT5L39jCUsNQOCo5+SzYI8rj0MK0lKIMeekcs8ZbnogGfdC3
         NfXVOlMtB9pC6vogOg8qx7DKwC+/e/4ADDWCqGXEbsxKpG+13PON9l1INehgsd43q9wC
         8h0amo9EVm0GUY1BwwVYOyZjYYyRaavNgyNrdUADg8hZA36j7c0OliJEevFD/3NmrpS5
         RSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006632; x=1726611432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FxBBj8XHDZxd3pwPDQhaFTyzR1JvVS6yl60rcPuU8DE=;
        b=rS024KIgmxpPx9FnLadtXVz8cc2RfGb3Zj/0VW/cdEIvghNhOpd15f0bM+QhStNwuP
         q/JVSAsMOC7GkJjbsTcMuF4P3UOp/gv3HLqpSRtleUZnyMFQq7MqZiXvlB49EU8xsqMV
         yAUmpShY7iVBR1NsWOCoosydQEyLbmAGdqga2cWSCM0Su45yQPp2Z0FZVwj8wiMP+FQ9
         YY8fUj1+chfcOTOudh1XVe3Yxoz/vPrNKsQ3tTg9wa6EySESIEkvIP27SzZs2WOQnkAs
         5MFIUrHY9MNmligeDEdzfeovYBtaKXP+71w6AJfX8Fj93cI4iLeI5sWVLhrJ8TF8PLC3
         7Rrg==
X-Forwarded-Encrypted: i=1; AJvYcCV55CU/pWKtIYjsndvx+KN99bKiqhkyOqBMd73lEQ9QtbB9zon+4yFg8QtL83v/b5xMzuGMZYWocRZ0Pg==@linaro.org
X-Gm-Message-State: AOJu0YzJGy9bxaov4cfAJDjvs7UPZ9Z2p1NbBAdom5jGiXVqyROeLvz+
	MtpkVMbhDDVr/SA5u3En5L3J1b4yC1xLwIYIUFjTdRaesUBCK812lbGLNzsitNZS8g==
X-Google-Smtp-Source: AGHT+IEXiP34uTnzQwoBvPtoZRfRUyfMSCqJ2GA6SrTzN26OOJqSvbL/tMxUKioN4UZqgJtB4WHk9Q==
X-Received: by 2002:aa7:88c8:0:b0:714:2fd0:357a with SMTP id d2e1a72fcca58-718d5e20a52mr15181026b3a.11.1726006631633;
        Tue, 10 Sep 2024 15:17:11 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:17:11 -0700 (PDT)
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
Subject: [PATCH 26/39] hw/acpi: remove break after g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:53 -0700
Message-Id: <20240910221606.1817478-27-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: OEzgEQkIj+7M

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/acpi/aml-build.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 006c506a375..34e0ddbde87 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -535,7 +535,6 @@ void aml_append(Aml *parent_ctx, Aml *child)
         break;
     default:
         g_assert_not_reached();
-        break;
     }
     build_append_array(parent_ctx->buf, buf);
     build_free_array(buf);
-- 
2.39.2

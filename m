Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444805njb;
        Tue, 10 Sep 2024 15:17:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVt4bkwlS4VlbeK7k6je8S0ag827lVVPVGAM9T44ZBkg8cMY1gxckoBl6xBjJkiWU4p6RwsKd91UvPWRA==@linaro.org
X-Received: by 2002:a05:6a20:cd0e:b0:1cf:31b6:18dd with SMTP id adf61e73a8af0-1cf5e1b2989mr3532261637.40.1726006668071;
        Tue, 10 Sep 2024 15:17:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006668; cv=none;
        d=google.com; s=arc-20160816;
        b=EgAnrfBhYnLQBonxlU72sCZ76nABga4OOv+zNmDGlXHndTRKsJKfmlQ0nG7Na13geh
         YsMU6eLn9Zlb+yzVHWX7NyMP1rIfYoGsKnXS3U+yl+UPYyHmcyufLczk3+KNL8ZJbzAc
         rPwKhxJoAGZDpTzgMcu9GjQkUu0V3+htetvFa2n/WISxoCOIYVbs0oEhgxrR9yucdgJ7
         IOz1HrzV0QXzSyRV8O4hBpGcrQY6nDf02o35ivmvvKDGAFn+GBB2/jm6Tsd0M1SCdqAK
         na08EojiY7PLLTIRmYpQsuWBa2IeB4EzZ0gJxGLQIz/GxcmFv5NdvECsKf3Msod0TCEJ
         MnKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=pwL33KJkM4Q6sZhv70DYnj8c/5K/FMceLOUvjv0df2Q=;
        fh=oNgVkD8l16Q18RceyWbcW7EucbTIPyIg2FLntNFVCgE=;
        b=tJ1BWfVHHgFs5cG/rEKDM2R0uzHdwsbmRlVjUdHw8/y/CURPN0/xRBC08y62W0o61p
         qgsFFxu2lJnQobu8l3XbN/gFmKujhUEyDF/zR0t3nt2A5HU4+W2CDhJSZVV3z1ul30/j
         K5kN5A13uGpThRYWc8fdZaRZMlQBK6sHE7jktAcoPQhmw+qgkqKuvZUKwEHXQYkr6aLB
         0+0Ym834YaBNMl+tyx2W52svFh4Ey4imJQvZsaXeEdLnecxWs2NNjK1tJo799CQ3PtVw
         9zatSzf9YwECtai1hp0uAdBizXZSbtVsxteegMszCEAhEGPOHOZTYeDi+TaNpFocUpYq
         bpFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nDvDZPtC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e596eecasor3327106b3a.8.2024.09.10.15.17.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:17:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nDvDZPtC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006667; x=1726611467; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwL33KJkM4Q6sZhv70DYnj8c/5K/FMceLOUvjv0df2Q=;
        b=nDvDZPtCB0p+gtJvEY7UT0bk3Sqsueih/62D0qeSy+5KhxW/LnPEci1ec9TzRjB7+7
         EjCfBwmJgt00DNFXAXv67uZroeuZgXZzw7uwhKfzqg94MzXURA8e7o8qF2Ji/hTrC64e
         CeT1aw4pIQEdkkZD9NjyotsDVH/n4gjnrYnhwEver3Bm3nH1tcOeBkI4MIl6DUObj2Ci
         16WFvcKBLlUaP9Up7rQ19Gbyb00JeimABT3iMwlD6Hmh6dUi6av886U9MWA0bdPPC8q2
         gXbNQGSRDjTKLBk6NXFV3BL3T+yx0kfhzPxqMy84+eyjnkLZGY/SToRmhILwljiPaquw
         w0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006667; x=1726611467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwL33KJkM4Q6sZhv70DYnj8c/5K/FMceLOUvjv0df2Q=;
        b=bLqhSl9LQwYFT0hEKA3Sd1aD8eO3LucBffyyr/UrtfkxKu7tH3V6NPX0874VZtucrj
         lEmOmYf+snzhn1MBdWQJY5BNNYFd/vhbSX3iOAKr0w9i58REUmsAOJlzuiHtHkh7dWfT
         g7h4zuXo444PpsHBuTx8lAW2UVDamUVVzXddgvXMwu1CKNdvgerYwxis5IIPUVRLMCyD
         DpFDGufMBUSkYcUrQJIgwJfwInJrP7M3mH6S0DRe7v2tmQHbiOO72d7AIX8ilowy/Ige
         H23nyfpMTbSmLFMs6q8R3KqdWL75lNkpOTWqT3V/NYyBUqiLF0A/72aax/I9Ke8jbqY3
         4yRw==
X-Forwarded-Encrypted: i=1; AJvYcCUpw0X/+IdEkzFXd48fs+DsSCJwl/ezioSB69umNVj+eCuFzCVZ0bEPWBpGOAnLs26lJGftxOK8Xt0MsA==@linaro.org
X-Gm-Message-State: AOJu0YzfXnMcKJlBK6Mmfg/Sg+3p/YRDGieOc0XA0KaAp2OteWp2E3BP
	v3ovn0M/K7CdYItK0E/tvpamYONFkvfmHKFrKG9V6wvjBvd1Vn+6t+xhUqw4nDH+Zg==
X-Google-Smtp-Source: AGHT+IGLJQ5enOtPE13aQ+/NIdbH6s0S5HLwnq2JQ7qsPrp+J14Xh+TVi3Hmr9X9Sr+7gsTyHm2Dpg==
X-Received: by 2002:a05:6a21:9d91:b0:1cf:3201:c3ad with SMTP id adf61e73a8af0-1cf5e1c8112mr3689026637.49.1726006667581;
        Tue, 10 Sep 2024 15:17:47 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:17:47 -0700 (PDT)
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
Subject: [PATCH 29/39] hw/net: remove break after g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:56 -0700
Message-Id: <20240910221606.1817478-30-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: IUmv56PgUiP5

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/net/net_rx_pkt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/net/net_rx_pkt.c b/hw/net/net_rx_pkt.c
index 6b9c4c9559d..0ea87344745 100644
--- a/hw/net/net_rx_pkt.c
+++ b/hw/net/net_rx_pkt.c
@@ -376,7 +376,6 @@ net_rx_pkt_calc_rss_hash(struct NetRxPkt *pkt,
         break;
     default:
         g_assert_not_reached();
-        break;
     }
 
     net_toeplitz_key_init(&key_data, key);
-- 
2.39.2

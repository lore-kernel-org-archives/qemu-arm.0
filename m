Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444510njb;
        Tue, 10 Sep 2024 15:16:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVV71IHCWLEYX1f9HwafOwMcgNY8YnSvhHJPqI9UAAFKP0XmYmvl5G/B7Yx8N1ZKr07ro8BjKulk59RJg==@linaro.org
X-Received: by 2002:a05:6a21:a343:b0:1cf:2218:1be6 with SMTP id adf61e73a8af0-1cf5e1cdacemr2732303637.50.1726006606026;
        Tue, 10 Sep 2024 15:16:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006606; cv=none;
        d=google.com; s=arc-20160816;
        b=QbKTVJUskrlbSh3xGpGOvsfNDmC81iqYfgLB0pyddvEo1pz++TLkjxobpsoSK/aPKr
         B7Rt9foZORWzN52kLhfB3abL/kMll5WtjtNCGcao7uBPnvuiOSsgfYHlks4zzBvlCapd
         LEoyyV+rSB5v2NQkAhwjuykpAKj7/GEL6QV+uEy8lEzhelKWgoM2FVQfItw2yTcoJiAO
         59GO5dedk1Eh5rQtIMZLs5XCdHMMe1UEcukmqmI4V+/+HUabSeoTWJhabc3DLEfZenHD
         CruJijSA1gXrsuFxSZajnpkNM/WOGYFBZyN3Mk6bV6NquiICW9XeVaBf6HX+rvR5uK+S
         WhbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zaOeMd8XzZwIKO+BVAeDQHacTyR7MUVICUu2Groumoc=;
        fh=BlXNtwdtX0ZWXx+KNOg5uQ6wBv//ohEZph0o364L2ZI=;
        b=JDuJFqgrGSzdbRuQLd9nGyTKGmp+wSDNPGULnum+nVhFmSTSNKg3N3knrL9Jx1FmDL
         w7awtRJaNptNImBwlXZYTzAg6BwjnxLjQlhQUitm7WDJ3wz2L2+ZFQHCB2HwsWcQksZX
         eK/2/k6ray6Q3G7dkz1fJ/KydcdK7rJAP6DeERikti4Rv+eqCWiTo0R4Ahvmjr1J/0Zf
         b1PGD3bH3AL+uTYOP/7HF3nWhGWEtK0PwcBqOWDNjHgGXxG6Cwm19i0UYwbHbdFqYMS4
         PbO4S1Fc6OiW6iybuhvVUih7DokGmbmonFS4A+aN6Gsrcs3CiqexxEBKF02+95i0aJ5h
         GhJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sn8s1qEQ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e58d03cdsor7089598b3a.5.2024.09.10.15.16.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:16:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sn8s1qEQ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006605; x=1726611405; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zaOeMd8XzZwIKO+BVAeDQHacTyR7MUVICUu2Groumoc=;
        b=Sn8s1qEQiymbpwcdppeIyuH3mK4HPX6Hb/IrpMAdgFVsfnsQwDZVOeflvxSK+UELLJ
         PBN+FZfecwpW9o3kZ8Ah+/rd/fOr58E2BYcChMa1qxoMAW08Lqkr4VLaZDBRbKnWX9PX
         jg8q2DOWawE14P7AO7+AKoCzRxHvSSH6MbDjUfFvrRkHTeY+4gcnwcbOu56Cqr/9uBWn
         L2bNP74HVGu1ABcgPraLZCBvPT1BE8G+nXndLy9vtb8aFcVsAkHk+dE+Uf0IqJMq2YpQ
         tNR3WKuqgIjX5N+Y9mcop3T11i5VdTgDQGvGqioWk/KOsUUthX6yqsTehbSew9cMCrPn
         iHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006605; x=1726611405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zaOeMd8XzZwIKO+BVAeDQHacTyR7MUVICUu2Groumoc=;
        b=W/paj3HrZ3lq/h3zArgkuSIaDZFFODiWK9VUMMWncd09IfbQR9FBqB6hVgd03bShML
         CzmKwvlodJJCmUR9weekBCpDR8R8p131hKWXjc4NBpiXveltRnVFF3o6uW50yghrI4pb
         mTUkms/vBUOdie5e3yPWnu7Hg4dv93L8ZXGiGfeLssWcSOYoJyxgu1A9gqkpArvMbELy
         /7CChAejIetftNwvSlbHWesTSCmMNqcialNQK0yX38xA4ACi23NBSt3Ofe3FW4d1gr7X
         P1WdfO438IOLgxEFDlZbW0JQQ7D8Hd5o9wFR6tlc8kKEQ6zkInl82Ons1yyqwgk5bcwj
         /g5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWBCl19W+Zs1rWV4zVGkwvdvJAPIewgT0j/3W1dgsK7G2HyRpfmGpeIkSdMg7+jiPOTBVhcqAOCGutPcg==@linaro.org
X-Gm-Message-State: AOJu0YxhYizI6mhM5s67R7S6TZ8bkq39s+eRzEmJ35ZsG1tTBbn13Pfn
	CLsr9i/wCwK1R68l/dzvjbHVJzlPsUpPeysStyXvdIcHH8myj5+mrSNJQlp+rKrOew==
X-Google-Smtp-Source: AGHT+IGXdkrxhCzNyeQ+oPHQ9x0IFNSkeXfls9xHWi0Sicojf8vp5qG1xhcR8cFIxRHQi1oprvgqcw==
X-Received: by 2002:a05:6a00:390e:b0:714:1ca1:7134 with SMTP id d2e1a72fcca58-718d5ee3ed9mr21940217b3a.18.1726006605401;
        Tue, 10 Sep 2024 15:16:45 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:16:44 -0700 (PDT)
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
Subject: [PATCH 15/39] block: replace assert(false) with g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:42 -0700
Message-Id: <20240910221606.1817478-16-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: BMi0MNy2pr6b

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 block/qcow2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 70b19730a39..bdc6337826f 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5299,7 +5299,7 @@ qcow2_get_specific_info(BlockDriverState *bs, Error **errp)
     } else {
         /* if this assertion fails, this probably means a new version was
          * added without having it covered here */
-        assert(false);
+        g_assert_not_reached();
     }
 
     if (encrypt_info) {
-- 
2.39.2

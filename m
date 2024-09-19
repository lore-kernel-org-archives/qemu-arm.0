Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161422njg;
        Wed, 18 Sep 2024 21:47:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVKWTmkO8rkB0zOXiMTzfULSpqkOtBEEpc2AURhUA5vYD4rXSzMhntcDW6UbTQ0sYcV4iT97Gu3FQz3LQ==@linaro.org
X-Received: by 2002:a05:6a00:993:b0:714:157a:bfc7 with SMTP id d2e1a72fcca58-71926084bb4mr35516615b3a.15.1726721248351;
        Wed, 18 Sep 2024 21:47:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721248; cv=none;
        d=google.com; s=arc-20160816;
        b=MVrgQicfZIz4AoBtuqetk5jdY2mpi5eSOx6f8jaEPh6aVGSNiIjaranq95iMuNfKnq
         dy+3eqWQItnodfe8r+hU0IPBlMieizQXqZ/UqM0olyl+MBTqwqXre+8LJ8XNy+rhyIPt
         dtxBYk1nG+rNsFe98fql5Dp6oV+wh7xRloHxx5WOw7WpK9SjstfN2w+KcIAFoMGdI6ax
         qOcBmdxVlWR/Mru4vLbTshAoDllfG3v9aC4f3Q5Wa6hrBCMtzcoDKS1h849bViaqxzuK
         NMcQZKiAgCCV0wh7anDfba4GDosOO6fs4WDYKpIC3JDCPA8VHtXzoO9JnEUzb7DW8Ti0
         mgqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fOTDlymCoYoChOB3X8FuVGmcdRWIYVQOru1+/fCCr8A=;
        fh=w2v16Jl67XpASfWTe7B8YXr7j3caolSItDFvnUkQ894=;
        b=OgnuBnzxLR9EyvSfrVLR77H8ygPgR1vw39w84NYflY7cFBJ+HeA8xCDKME4dgQSM60
         B8s2GKM7BOcd/xtu/gvlf2PO09Bdz2WFa/Wg9rZFhW4dJL/DQ451QtrmMaUSJ+2CuB4z
         j7gOz93rcNvPbG3U7oiy8x2SVntoMxSKzFAG7LU+I+CGwtNS8zbnesSdqzOv3TJgilFI
         qw1/ZZiNP3SjwRLkEhgVeycmIKQjFQnpoE+oYkghUEktSrl8toTxmLIWiuwHt4VC7QLL
         YahoUFFFahG7O10Zo2PfxOpoKIAoKeOg5T2X2/mXza8BsdOzIqJnR6uNRGQj+5CvcCOw
         cS7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mhHFQ9BA;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71944b8356csor7263129b3a.7.2024.09.18.21.47.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mhHFQ9BA;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721248; x=1727326048; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOTDlymCoYoChOB3X8FuVGmcdRWIYVQOru1+/fCCr8A=;
        b=mhHFQ9BA5fdysQufGpT1v9dbUSks3ix3S9wKUpzE22gxuaH17YDVz5SeMLwhXVpGhW
         O+IrmJNe4oxoztzF5MtM7rDvpdUfZnPpRO6zkZBjInOTgOitYvnigEpQh6ypQUg14lyi
         Cgea/WR9llOaEWejxvwyYRle9Qfjqxyz5IC8ckDJJ7wH03ohjDTb/EkrT/z/GYQ1wF+V
         rBO2UTV9hc7uQVIyZR2SM5LQlRQ+f3ZRhKE6g/lvakZxwDkcx/RBM0uSfZoagP+hs8Z7
         8Z7t2KTB6EivaHVK34QWZIfzRynyd7SJ3ZFd/hsEpb4Qyg1UWutA31/M/aiHBsjQ2dBR
         dZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721248; x=1727326048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOTDlymCoYoChOB3X8FuVGmcdRWIYVQOru1+/fCCr8A=;
        b=tvtGXSuO/45MMbNuxKznjom9CQzdbvDcFoUop0i3ncmsmjKBmGEMd1nPCBRAHChF16
         ziBkygAviMxUa2yIXIZkq7uzJC+AdQHjb86+iXrt5E/FVkWh6h8iCM/6fcVMXnaq0uG7
         rvrg0MT2LbmpAM0QEEAOk+UBdeWg/+ILwgk9HC121WOZ0mflBpEbXN9C0joEmHQyW6Z/
         9AHa3Dj6H3kFNDBA91sj/vY34nv435bhX3YhMRRVeN0B7W0NXefZClRRTaP2FEFaTpFr
         aAUfKbltirts0twyNXSxNv5irgCgFbdTdYOYLY+TMqG+bUUO73cZvlMCjnfO+bB6Zrnz
         JOkg==
X-Forwarded-Encrypted: i=1; AJvYcCVKBIkYg9UXU5m+XjYO558yX2EJHqJtqP1Xrk9r2If4YLgoOP65FNXu2Eo3TigA9PGulsOm42bRi3If/Q==@linaro.org
X-Gm-Message-State: AOJu0YwAI9RvJO6pkreRvP7e02904Y3lQYqz6BQws47hJ3FS5RecQTnu
	34DvVLSvh80ZM7CyelKXvitC63g+cJiGkMIwGHMuS1XzQFY1FDpb4YRkUW3Iv1ubUg==
X-Google-Smtp-Source: AGHT+IF4VdR408ElGh9vDAVjdbcMP3qqXEsAp/0wcOEvsQ0+y71/UwITZuPKa7pIAYx77zAYCo1WvA==
X-Received: by 2002:a05:6a21:2d86:b0:1cf:5437:e768 with SMTP id adf61e73a8af0-1cf75d7fe57mr34834771637.7.1726721247872;
        Wed, 18 Sep 2024 21:47:27 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:27 -0700 (PDT)
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
Subject: [PATCH v3 21/34] target/arm: remove break after g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:28 -0700
Message-Id: <20240919044641.386068-22-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: YvJ0MwiM+Qdj

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/hyp_gdbstub.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/hyp_gdbstub.c b/target/arm/hyp_gdbstub.c
index f120d55caab..1e861263b3d 100644
--- a/target/arm/hyp_gdbstub.c
+++ b/target/arm/hyp_gdbstub.c
@@ -158,7 +158,6 @@ int insert_hw_watchpoint(target_ulong addr, target_ulong len, int type)
         break;
     default:
         g_assert_not_reached();
-        break;
     }
     if (len <= 8) {
         /* we align the address and set the bits in BAS */
-- 
2.39.5

Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444622njb;
        Tue, 10 Sep 2024 15:17:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSpRolqLOOl68pFHcrx+JM0xSmCPon+ATQ/T1dYNzYBoTleqIso4Svsv/u7NgKjmQis1Q0hOSh4lNRYA==@linaro.org
X-Received: by 2002:a05:6a00:4b0f:b0:705:9a28:aa04 with SMTP id d2e1a72fcca58-718d5f008a6mr17799740b3a.23.1726006629913;
        Tue, 10 Sep 2024 15:17:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006629; cv=none;
        d=google.com; s=arc-20160816;
        b=Dq69og55Gv1FwAzeCWKwzVgNL8sI8ZG/1unR8zoPrk8RLXUH5uirHgdpjdZ3fAQH91
         gKtJjcWMNwo+/yeJXkLx2e4iQbrBFc2D93Gx+6gulr9UXyra/Tq0UhhnWzDHtyuvtqCl
         O031Gkp/DNiDjZtySX0fgxZ5Rif/2P6TSqQQ2+Sfx9nlHzLxCEjCfkk3QaX/nj4pI2iC
         76qaPdGMbv0H4OZ2CQNF6ra5I1e8jQL9mYUBkHmIJq9xyEvPDGR5K+1glnONhNqjqCU0
         qhtSVOSTg+zq8Efpp73k9UYshG+0EZNfo7xjGMZfWCHDANjggj5CL/PrJlNBcpNTCwCg
         huHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RCGVOkz/BgjMXg0ik5e1jthdc26fdQDBLF+1lu12foY=;
        fh=AuC8cwNZv2s8Z/JCIwN/rFm5xYL/BRIz/UFPbqRCewo=;
        b=BXadlrYWzP+BrHVkYIeAEaPSAzIwo71mWdPGPWV64VmIrWycAkItC1apJdyxYww1wp
         qV4g/FXcb4/H18x8tJASN+lERxjbv8chcCkwkaCuUixvu7Sjih73NJYp1VzHzBxhtd2i
         LG/S3XX5Vir+TQDarNiqQZj64KJBTjFqOJVeGIjwCYMWSBs3/ltAQ/cfjBEMxhE782YN
         pzcx+cWF2n/5LsPbZf0kylj9EXEYjX4tv2wsE2gXuB3mocA+7eLTqWuJE1D67Z4ESDZC
         d8+HoV9cSHV4taejreG4VUSRRILC85nwaf30NPI+0vgAKbG7VA49giahd8VlqHS5J4zh
         Pg6g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nuPmQ3Fh;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e58d60e0sor3836319b3a.5.2024.09.10.15.17.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:17:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nuPmQ3Fh;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006629; x=1726611429; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCGVOkz/BgjMXg0ik5e1jthdc26fdQDBLF+1lu12foY=;
        b=nuPmQ3Fhwkfpug/7jaTvXvGfpmQpG4xbkehmTeJuCQA65iBneQuqdsPY17ZGDSBiSO
         6JTOAnpDjwiJJwWxFkA5ipmTOnCw3kydIVZKMG65hgo5h4auUHleZkBtcwabZBzqGo+F
         0GcAYsA89uahN7vIGl2zM4FOBfK90Bl+B9Hjyccg6O+Z44Y10V6/MRhMxGkik1IxhbLV
         AL+AGOZqheH7ER7zOgvhDofx97a1rzdXT919WIhYFRPLckQT4skk1pPEe0eYA72UlKnA
         3W6+i1WGGWr30/KnwCb1jWfMdeAKMK+cq9cpyDZFnmojfK++mB5j6wwJ+NoNHVYuruqA
         Iqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006629; x=1726611429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCGVOkz/BgjMXg0ik5e1jthdc26fdQDBLF+1lu12foY=;
        b=jqys8vjCU+gKx0l2HYD1W5XmBy0ORCl1FkfRXPGotAYo6Q6/5qhzh93b2DxoW3SWIQ
         2GrgBHyY1NcMV3WkXTWP9zh+vmFOkpcIuVDPvPniq1uuaeocT5LDGgnbOk67vvgxylzG
         So4MlgixMUTC2tg9eiVvEnGpuxgIp39AFB5CNdwnpNOcwiQyjsQJdGjMvXEMubtvDpmM
         Q4dIW3NBOD57SA0OCYN4Bfi5DJCEemN9zU/aB2uwdC30ADR06H7JUXW+0HiLjpB40Lxz
         fMp/FmSMQ4PpUwGVCpshHfwDZ1RzCTWrBz41RYqm//SdRjrFyhnjmnOoVgWlvCA4J6hL
         +2IA==
X-Forwarded-Encrypted: i=1; AJvYcCVnFE8Znb9/Mrdje4c+34AQvjvEZI3yaI60/pTyyNoBeeo4bUdegToiA0BwrD0vDmr70QV5eUxbGo8qMQ==@linaro.org
X-Gm-Message-State: AOJu0Yzl/VjK/FQSY735Q7tloC7z9z40GfjnPUvAqXn/K+kGTF0Die+W
	xY1OYRw3j8OCys+rfyThAcVdi0EtaHdnt3oZmbzcAPuuC4lY7x6VBl5F+ITY+aN0cQ==
X-Google-Smtp-Source: AGHT+IGi72IfaYUiCGQt7lWSGV2AP/QNzvbmyXN6XQj5zV/aN0oGXhyf4mxvjQxKuaGQQoLA5lFr1g==
X-Received: by 2002:a05:6a21:6e41:b0:1cf:5437:e768 with SMTP id adf61e73a8af0-1cf5e03316emr3202667637.7.1726006629425;
        Tue, 10 Sep 2024 15:17:09 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:17:09 -0700 (PDT)
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
Subject: [PATCH 25/39] block: remove break after g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:52 -0700
Message-Id: <20240910221606.1817478-26-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: N0+gzLUak23x

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
2.39.2

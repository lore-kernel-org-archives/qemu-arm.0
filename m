Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422516nji;
        Thu, 12 Sep 2024 00:39:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUS6PbwXvauDNQHni8KoyB+6/COU6xLLHCbfUjE9SStplEq6IdBMWVXuxNhq7e1ARBFYoCFZJ7bhU140Q==@linaro.org
X-Received: by 2002:a05:6a20:c799:b0:1cf:479e:70bb with SMTP id adf61e73a8af0-1cf7624396emr3240789637.36.1726126782632;
        Thu, 12 Sep 2024 00:39:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126782; cv=none;
        d=google.com; s=arc-20160816;
        b=kJZuZUEiSL9FK58ZMTdlGgsfuW3ZNX/JbkuYrCBIwKfdsNZbc56ciSKXofyGaCJVPg
         3Ylxhedvfjot3C8hFEsLr6JEesPWVe6vX7kJyQU7XCjKudBpmnP4OIcaOqcPxSSOoFzO
         2Wx7YTvrLsJ6FB0O48D7ciNZXEs1w+O5xWwbVe56scIgFgYbV5h8dvDVwvPIcyOOQXMX
         DevJZGb49idx2bYJ7ldkclezq0dpb107ApyCbvhQkglY+B7/xEJIEbY8+Hy8cp+IXaAR
         eNne+4fr9LopnpzRyjut/S687uNfmYdaMiRC6CE23OUGZCqEukZoOURPMR6edeZ/uNie
         Pl6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=L7GDoQxngJ1TTnmtNF1SclRiQsQ/Y8kkCXT3xVb7e1A=;
        fh=32vEaJbVtvgzKXJkrnqxP6Ck4/6/gPnI/Oi/q9JuG1M=;
        b=lM27RKqJanHi9ZdFc4rFPIZGi9BQ6YCdoX+EJOXov7MV5OL7bXHvVmwJLeUAZ66c+x
         bl9kqdSlR74FOeUZlzlvywoDuGFeqbFQUXwuIe2tY81KQdlLgxoiXeFcufI6YJt6+0wt
         290mdLQe3VrfsBibAxuWojBDU1o0XtOChfcW3cdfRi6v/qAlaqK3+c7ibYijPYuakDRh
         GYUNiSqdcV25p0LL37eETDF+AlMIpuMf4mP8EihNaQgGuC9moLkPEAVaEUKdqUrvPdbi
         ppAe1JC2vwFRWndYRsvXgKGvtkHgiJ3THu0FJtfJyMZxGnu0qK0L5Mym4OcWmTgB7xKi
         AvlA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WLVZvW97;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7db053889b4sor2374563a12.4.2024.09.12.00.39.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:39:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WLVZvW97;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126782; x=1726731582; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7GDoQxngJ1TTnmtNF1SclRiQsQ/Y8kkCXT3xVb7e1A=;
        b=WLVZvW9736NEPrwof7UEr5eEetUIG3ldjG+STjZObZ0KA94EjBYqG2PNnOItWdUKSJ
         Bax2puafCBocp8RmsMYHJaZ6RhsB1NjNvZoKblRywt3vaMqSmgS+GrwVm/hCOy0DLk3U
         QFiz3UTCIVNyQwOLvVjdASBJgdkni4MYkHRQKWCk5SUYaNCcnjf40G48pq7+zEIJhSRi
         sNakt5iJGA8OxI0fngU+56JMR86uMYvHiVAfd1F3Zz6CJIQsDgVjnJYo4a0MRJKAcVZG
         lbmuQqxFK3DaiJTOzeeqIr56fWzzQH5qOPviSrPPGPoBmy6MkK36mB+F1bVpJDLUAGLH
         a8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126782; x=1726731582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L7GDoQxngJ1TTnmtNF1SclRiQsQ/Y8kkCXT3xVb7e1A=;
        b=jmdOdvEca0OW4pOlDh0j5Y45/H1p1UMA5cs1KvDU0+Gj9Rq0KaJEnGEZQIa/bTkPAX
         uMWTPOfJ9QKhMa9sCaRt8X8u34nOm/x8l3ayhfBrnEzdgRPoq9EoahAGTPXDCNWc2HZ7
         qiTBYG06momazVEjzsglymDboIm8FWDUqNQQlkyNTaAML61aYfIdSWO5d4+bCB+jcMKL
         4DgnlR21o8nHRx6vEIWJdg7924FGZ4on7riLQB5QunH2mYKUHrnfSc9AenNHl3puOGvX
         HhslyBW1E446kMZPQaT0WwwfVcEjk9gmlx/oZaHaGYtSHct4b0r8XvKA3/YyVxu4yzrn
         s1Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVXxKolI9xYrNwSB73Cif1GEq4uiLKzMc3f8957iR7drxr+JEg1QEPcQSCs4Z5kK3I4AcYTj6twxboOwA==@linaro.org
X-Gm-Message-State: AOJu0Yw7ymKsnm+Oq1wLz8SIpmuWcnJJWA+CLUDJHzwhly8MniwzUsYh
	+kC1jCtBonTlwPtbINC2Ti45xEs9P6j4e4iZc8MTOUaunPB5HiCD2hBnz1uVQ01Xkg==
X-Google-Smtp-Source: AGHT+IH3UrYHsROVRFhqbmUT73S4ww9ZnrBNKPSzdT/xlKGzi9rQl1GCamlShW6aVRW6SwwZUuf8fw==
X-Received: by 2002:a05:6a20:7b07:b0:1cf:d746:22d0 with SMTP id adf61e73a8af0-1cfd7463553mr949162637.1.1726126782141;
        Thu, 12 Sep 2024 00:39:42 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:39:41 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Klaus Jensen <its@irrelevant.dk>,
	WANG Xuerui <git@xen0n.name>,
	Halil Pasic <pasic@linux.ibm.com>,
	Rob Herring <robh@kernel.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Corey Minyard <minyard@acm.org>,
	Keith Busch <kbusch@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jesper Devantier <foss@defmacro.it>,
	Hyman Huang <yong.huang@smartx.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-s390x@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	qemu-riscv@nongnu.org,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	kvm@vger.kernel.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Peter Xu <peterx@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Eric Farman <farman@linux.ibm.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	qemu-block@nongnu.org,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Eduardo Habkost <eduardo@habkost.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	Fam Zheng <fam@euphon.net>,
	Weiwei Li <liwei1518@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 06/48] hw/net: replace assert(0) with g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:38:39 -0700
Message-Id: <20240912073921.453203-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: wsYKrl0tQAjN

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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

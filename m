Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5783562njd;
        Sun, 27 Apr 2025 23:40:36 -0700 (PDT)
X-Received: by 2002:a17:902:f689:b0:224:d72:920d with SMTP id d9443c01a7336-22dc6a5442bmr104157405ad.37.1745822436475;
        Sun, 27 Apr 2025 23:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745822436; cv=none;
        d=google.com; s=arc-20240605;
        b=HyqQAr1Y19nVCm3spzBSVDobM1ztdwDYPeNX4YXX6fMmM/ODSy4njNEOfGyj6u0hjO
         mtnCoO1ShnrGoiHI5zDVoD2TAWWTsCSJ/IYSzGz29Hj/4KGGHKPD8HUfhJS+6lbaOwJU
         aHIOHqoEeto7TkJVztJTu1rKwWqVbkmrwVonc6IZ2XcaS2jmg6RZjL9NQlIj2DH0D8PM
         s6V5HnrGlIArK+gtlcLjiGv08BGczoRLhYcc8dpyvX4bupEFva7C0miSm+GJoG/ah2Pi
         GJOt1sQGtsvrgX15QCTkOk02lohFQ7J3L72Ywd/yNTQZBjJ35nhnC3zQvxerRZuLEZjH
         aKIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5KG3ys+zAj0YETOqmeP7cGbdHvPb7QsrrfQymJd8O+8=;
        fh=V34gtG7MuHH8D+duG6OPSb5Tv+aOZFzf0qLG9K4hQjA=;
        b=WwznofrMukjn3jDiw/Nu2hJsD7lLivyILvT2DKYO+7sEutlLhknV5m7J3rgRM1Aco9
         vGOBGeZQeZMvqqBO6kqns53ZjQOJ9Vm8mlrrEOfJ9M2jFzKNFFgr8cb1JtxvjDiA1q1z
         wdP60UGxm/OzUpxRRqUmcmzH0rGSFAexufTc9qG6VqJ73hVepwFYORJwRMYiMKEzsuxF
         QL9vA6rwwr6MvB6GSFII9weH2Hi046CkcMIIsb1BjGfjbgDgGdAb+CvNbgmiJgAuui8i
         zCZoHKXQxJ0ixnFKrxnmXFwdcRVV0w7VVe6U/cZcwIVJXPVjk1+PUr3Lp3WxrDQRaEH8
         g2yg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=UXXdYIEM;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db4e15386sor49034125ad.10.2025.04.27.23.40.36
        (Google Transport Security);
        Sun, 27 Apr 2025 23:40:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=UXXdYIEM;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745822436; x=1746427236; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KG3ys+zAj0YETOqmeP7cGbdHvPb7QsrrfQymJd8O+8=;
        b=UXXdYIEMtdhoxNod621X9dUa764KjtjIwxhqnR9JPmaw9GwEtofw4e46zwmakHXZJv
         ZGBfJZ3NNd0CgFmbDGpVTpSYf9t5c+01y5vV4DYNcRseP58E0XY+AzserR64ELwkTPIx
         OLQYQulA6eafG/RxE9qw4vNl/A44A3AyDdFoDQV3sONj0j+CI+ALvQose/pCTNuMkRTh
         0bSAOSzYxzWU2vxdTNAIpH+s1jFcvYOf0NVpJfLAV5OGyw+TtkMu6HJwoi+X8kfQfn+T
         W3dEheyATiMmmuo94jR/nZ1W49v1MYQzqRaezlgpCgJ4Zzpzj1XUKkrk0dAEN8F7jdP0
         koBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745822436; x=1746427236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KG3ys+zAj0YETOqmeP7cGbdHvPb7QsrrfQymJd8O+8=;
        b=foEldQ+FAD3fueGH8v9Q+Q+Gnra/1iUr+v9o1pLRkPyizLGSjqALFanB4PgsQNQFCG
         utHfqSA3nPtgF8PTbJdjQ/BYhSmw0Nr51Zw4MnG6A1uBaanSzXqVQQ9OeUYeFk5nK/OW
         cZik506Hgq6hYPRsLsqL8c3yOrS1n3Z3QYxV/t2XzsPEZcXC8reWsKBFekHjzsEo3AS3
         cMoL+IMlrTZ4ytCcvk0UgRVbh89oGeJY8IIBxgD7IBHfCgS5FjXTSKbo/CzKx7CUV5FP
         HHiTa2QS5jhAMAuIY+RL2ldeQaY/B9PdoUcdpnA4cYofqdMSqBj+ryb+YyN0MtaNnw2x
         Er4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAXCrmehV66lN2TImb6El+FEfJDxaHBBDe5GA4nqkx+NRgnO5aMmprrbClxTHfsNmEga9xXw5T@linaro.org, AJvYcCUi3Er169vIAmIKxfMnApyTL+WfKJ26Z8QMgT+o6izkXoe2iLgvEPAT2ThR/7wYZejy3S/wb4uIJXVDE/DbqSjACg==@linaro.org, AJvYcCVp0fH+hWUE0axYWIgvbn1WJLea5haltbKSR0cqB/RzLioq141KqByk8K/op6hjGcvP2lDvVxcpPbuToNjUKK3UBdc=@linaro.org, AJvYcCWShfo+Iim2yIwljpmjyqXoPnmi8lZbG8OfHPplAxv6O82VxTZSh8zoAR2eTsPH3oykZCG9x57SduXv3QcZ@linaro.org
X-Gm-Message-State: AOJu0YwmV37KnVkVqpix6DkbxlgkmRr3Mc3msEBJjdHZXi1ChqZrrwCT
	WJHB2CSuyryyczW4QUSZleIDer8fg75VdQyYny/R9Qc3TRvPc7u6
X-Gm-Gg: ASbGncv7hc6tXqermDeERicpY5fgfwK44YnZ/p8kvTcoObHRGPahAPwrsPt0H3nCxqK
	tmldf8lcRF+gSOJLUIlhs36CJkpX2cbBcDbVkfPmpVYgWJ8SYDzqP30jsvosNkQ/QM/qG2sKwtT
	7mrAJuX23yGGC6QqLi/4L2LuUqNPJqCLnNqKII8lN4UCxkBZ2kXcLIoeRSnR8uZ/V2jAOZ4KW96
	ybs3bMKAWSPi5q7sCG9n3lai00L87IoDjzc98klthwkfKRO6MsGMRc30AT6KyHsWKv36NvQKGeB
	iCiq+VwV0+9L/UaBIKfzzCA1NzN3iu2RpFovpQ==
X-Google-Smtp-Source: AGHT+IFwGC6KPL901dNt4Pvf1ez+6eS9Jh4yCu/CPGqZj0aBAx1/EXuIDBkRhG8Nw3jpPT3vkP9g7Q==
X-Received: by 2002:a17:903:189:b0:224:18bb:44c2 with SMTP id d9443c01a7336-22dc69efad8mr95438035ad.6.1745822435857;
        Sun, 27 Apr 2025 23:40:35 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:bcb:2cf3:f1b5:b7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe328sm74721215ad.88.2025.04.27.23.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 23:40:35 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v3 07/20] hw/net/can: Fix type conflict of GLib function pointers
Date: Mon, 28 Apr 2025 15:38:56 +0900
Message-ID: <937d1feaa739a8f5be8d55084231f085ac9553b2.1745820062.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745820062.git.ktokunaga.mail@gmail.com>
References: <cover.1745820062.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HuH/WpamLdRj

On Emscripten, function pointer casts can result in runtime failures due to
strict function signature checks. This affects the use of g_list_sort and
g_slist_sort, which internally perform function pointer casts that are not
supported by Emscripten. To avoid these issues, g_list_sort_with_data and
g_slist_sort_with_data should be used instead, as they do not rely on
function pointer casting.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Francisco Iglesias <francisco.iglesias@amd.com>
---
 hw/net/can/xlnx-versal-canfd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

V3:
- This commit is included in this series sololy to ensure successful
  builds. It has already been picked up by a pull request, so please ignore
  it.

diff --git a/hw/net/can/xlnx-versal-canfd.c b/hw/net/can/xlnx-versal-canfd.c
index b5a4a4af7e..bafe50f5a7 100644
--- a/hw/net/can/xlnx-versal-canfd.c
+++ b/hw/net/can/xlnx-versal-canfd.c
@@ -1278,7 +1278,7 @@ static void tx_fifo_stamp(XlnxVersalCANFDState *s, uint32_t tb0_regid)
     }
 }
 
-static gint g_cmp_ids(gconstpointer data1, gconstpointer data2)
+static gint g_cmp_ids(gconstpointer data1, gconstpointer data2, gpointer d)
 {
     tx_ready_reg_info *tx_reg_1 = (tx_ready_reg_info *) data1;
     tx_ready_reg_info *tx_reg_2 = (tx_ready_reg_info *) data2;
@@ -1316,7 +1316,7 @@ static GSList *prepare_tx_data(XlnxVersalCANFDState *s)
             temp->can_id = s->regs[reg_num];
             temp->reg_num = reg_num;
             list = g_slist_prepend(list, temp);
-            list = g_slist_sort(list, g_cmp_ids);
+            list = g_slist_sort_with_data(list, g_cmp_ids, NULL);
         }
 
         reg_ready >>= 1;
-- 
2.43.0

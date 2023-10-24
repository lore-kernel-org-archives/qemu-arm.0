Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2040636ejb;
        Tue, 24 Oct 2023 06:18:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9iLLKrvv5AHrA0V0HZ7nB8D4VSsWsSVhBO5EGwVfqWyrV6U1z+6YREQpQ/i7BsCsarOcQ
X-Received: by 2002:a05:620a:f0b:b0:773:bf62:b274 with SMTP id v11-20020a05620a0f0b00b00773bf62b274mr13106356qkl.61.1698153481546;
        Tue, 24 Oct 2023 06:18:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698153481; cv=none;
        d=google.com; s=arc-20160816;
        b=rBh7xMF3JU58cJHLI+1O6ilDGz+DfljO2AWbs+3Tu//2bex4XyMzK6BxHRw6oEa3Qk
         tGBPqiCWTYnKhf6LShcntJl3F2eT9H4cg/J6nZ4/uH0e/6Nfis5PC5Msqp9gfP3/yuWl
         2DJtx87y1zrTub6N/kL4fo+3AGekP3b3j5uOxWywpkzJHbyFifXPx9uzB7AgjfutrjzW
         qa5Av5utscgnNM9eflguWP5Y8kxh3WuEqdC+J9ABBAIPaqzYZ+c5ZLJIpRcW61I1vkRE
         MfRNgLDETuQ8X2QUAo6/svL1wq6v7f4VfspkS4124Gu6aRGnlpkXBFlWsU9XA1AH4Wo9
         CkVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=12UW4S7DwReY5i7WbgLvv6myQHnsED050vB3pRolHAs=;
        fh=e9feSw8SSOtT/dgZZLe6uilVOFwjb0itHlOwuVUfZns=;
        b=J8S2IdigWAGeWBntr11u1c/ez1wvXkthRgsiDKUIfccDfTO6EV4E4TVqISlBNY1rAX
         Ftfv63rF71p8Q+emz15njEzmnyFoz/D196m96kShIcEIkGedi0HeCDZ0TB9wZ+K7Z+/z
         VJ21Iz6IPXqf+chs2JLndk4tlGlEzzw1e4YDeajlcEWrQwbNHcS+dzRgot4bB/1O5dnN
         PdpBzsUuXA07uesXPftyPAyfTsd0m4ABmoPW8iXngXrY7OKV//GrpdHH7Gk+YYfEqhWM
         RHVkbXbsCofppPHYro/UXHXoLh5lj/XFNUn2Dkea3b/j9iVXlz2AT80C9R81PvwSapbg
         z5Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dV0KKvIy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e1-20020a05620a014100b007740f66ad68si6634752qkn.314.2023.10.24.06.18.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 06:18:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dV0KKvIy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvHGk-0003WS-CZ; Tue, 24 Oct 2023 09:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHGQ-0002N4-1m
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 09:16:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHGM-0001sn-5x
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 09:16:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698153361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=12UW4S7DwReY5i7WbgLvv6myQHnsED050vB3pRolHAs=;
 b=dV0KKvIyuKjflh68vdwWTIvXjvOGvyuEnYQzNjG5EMrfK+vIqmI4C/8ryBYXrIADaNgWhy
 29P6yj/o/jTqsSEU/5s53UqhuCKdRpCes4qLyabsTwiSH7LZ+wn+Kxy2yu6DGSaXjoegzZ
 2/5LCDmRs3W1CUOyetj8uQyOpiInUIo=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-541-YRUdb2dENQ6nkuSypCmt8g-1; Tue,
 24 Oct 2023 09:15:55 -0400
X-MC-Unique: YRUdb2dENQ6nkuSypCmt8g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 287423813F2E;
 Tue, 24 Oct 2023 13:15:54 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 763D11C060AE;
 Tue, 24 Oct 2023 13:15:47 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Corey Minyard <minyard@acm.org>, Li Zhijian <lizhijian@fujitsu.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Kevin Wolf <kwolf@redhat.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 libvir-list@redhat.com, Stefan Weil <sw@weilnetz.de>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Fam Zheng <fam@euphon.net>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Eric Farman <farman@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org
Subject: [PULL 24/39] migration: set file error on subsection loading
Date: Tue, 24 Oct 2023 15:12:50 +0200
Message-ID: <20231024131305.87468-25-quintela@redhat.com>
In-Reply-To: <20231024131305.87468-1-quintela@redhat.com>
References: <20231024131305.87468-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: I5N+FDYgTPdc

From: Marc-André Lureau <marcandre.lureau@redhat.com>

commit 13cde50889237 ("vmstate: Return error in case of error") sets
QemuFile error to stop reading from it and report to the caller (checked
by unit tests). We should do the same on subsection loading error.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231024084043.2926316-8-marcandre.lureau@redhat.com>
---
 migration/vmstate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/migration/vmstate.c b/migration/vmstate.c
index 16e33a5d34..9c36803c8a 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -179,6 +179,7 @@ int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
     assert(field->flags == VMS_END);
     ret = vmstate_subsection_load(f, vmsd, opaque);
     if (ret != 0) {
+        qemu_file_set_error(f, ret);
         return ret;
     }
     if (vmsd->post_load) {
-- 
2.41.0


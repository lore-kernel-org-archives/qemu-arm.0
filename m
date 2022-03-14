Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2242751lfo;
        Mon, 14 Mar 2022 09:01:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxD568joRP4Mvmm9V6lYsvhXEepqbIjciajlXG8Ie/n6WKTsPb5c698Hty+qNBxKUnPtrse
X-Received: by 2002:a17:907:7f0c:b0:6db:bb97:97df with SMTP id qf12-20020a1709077f0c00b006dbbb9797dfmr9317151ejc.59.1647273677408;
        Mon, 14 Mar 2022 09:01:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647273677; cv=none;
        d=google.com; s=arc-20160816;
        b=lFonDOVo+ND5I1RJTNTbom3H/0tVTRAkMYrWe5fPAUbOdAYsCag0nBofMsdZzVkEoS
         wyo7OUGOkGReXq55CLnBgio+uwLh2e0LmZlPNlyX7F1xCFK0kXYlV3rlSO/izirzIT6l
         TfndWKDDyfg1MCzkncNzPgdrevI4ODO1BpdkiaX4XmEn1/uhqq+6oTJttymEWZ5JrIRU
         +1wLwK+evMdQDPbBiLtAMwRqq5CnjS2Kmejma+WRzhbzicR11i5/w/9rA0WWtIk10VWJ
         FGFWhsFqQhUGIMV4GxeflaXi7481Zc2aGJzieCgaGEQ3BGupIZwPFO0Ffu6vq2Rn/6Ns
         SlkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=489E4pWkjEIWhUhrxb8XebOf0gy71B5KdIis0MfEsAQ=;
        b=i0VSbo6409ilc5BKU0/sRO3NO29Jdxp/uMjfAMhtxeDH/tFk+HXS51ckXf1YMqq50L
         HBqCQ48uN4hn0UwthMmp0tboAdtD2oeL0aaDxQUMzipQjW/ilRT6FwcvR33BQ0KMci9Z
         m0AOfwHsa/JDVUZabkecWxl2HzrrRQEROFBD02kiQ2Sgl6hlZQPrj/Juzy+XFDDshJBW
         XmQwSLKPJMfVoHFKQH/gxg61kcfFudIrikBmctrPg8ItKaINI7vYiLD6V2QozgrSJnfS
         JX3N4uoe5oheudq6KAA13qVagdLAyIW0J+5JMuX3MR9i1FkjfRRofA0J9dAFJ4jlOeIl
         0lkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GUNZ9U5f;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id g13-20020aa7c84d000000b0041677b1a65csi11667191edt.111.2022.03.14.09.01.17;
        Mon, 14 Mar 2022 09:01:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GUNZ9U5f;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242868AbiCNQCZ (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 3 others); Mon, 14 Mar 2022 12:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233379AbiCNQCY (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 14 Mar 2022 12:02:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A606E42EF3
        for <kvm@vger.kernel.org>; Mon, 14 Mar 2022 09:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647273673;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=489E4pWkjEIWhUhrxb8XebOf0gy71B5KdIis0MfEsAQ=;
        b=GUNZ9U5f+ffpggUaqF1keSlrInfFEw7D66zbNg8RDpXspLK8wFOwz+0PuX92v/c79uBVGR
        pXA516hvZA4AlgLmUe/z4t7x/qIXl3uCcd63FTZLJCLpgyqHe+lyftw48ekTBpROPIQx9f
        YQ22UEzaUGGRuCBFSFMw9eNMzB4IslQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-05t2AQIEP6KHd27o8N0DyQ-1; Mon, 14 Mar 2022 12:01:10 -0400
X-MC-Unique: 05t2AQIEP6KHd27o8N0DyQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46BB285A5A8;
        Mon, 14 Mar 2022 16:01:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id C90A5C44AE6;
        Mon, 14 Mar 2022 16:01:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
        id A56DA21D1F55; Mon, 14 Mar 2022 17:01:08 +0100 (CET)
From:   Markus Armbruster <armbru@redhat.com>
To:     qemu-devel@nongnu.org
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Christian Schoenebeck <qemu_oss@crudebyte.com>,
        "Gonglei (Arei)" <arei.gonglei@huawei.com>,
        =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Ani Sinha <ani@anisinha.ca>,
        Laurent Vivier <lvivier@redhat.com>,
        Amit Shah <amit@kernel.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Paul Durrant <paul@xen.org>,
        =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Corey Minyard <cminyard@mvista.com>,
        Patrick Venture <venture@google.com>,
        Eduardo Habkost <eduardo@habkost.net>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
        =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
        Daniel Henrique Barboza <danielhb413@gmail.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Greg Kurz <groug@kaod.org>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        Jean-Christophe Dubois <jcd@tribudubois.net>,
        Keith Busch <kbusch@kernel.org>,
        Klaus Jensen <its@irrelevant.dk>,
        Yuval Shaia <yuval.shaia.ml@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabien Chouteau <chouteau@adacore.com>,
        KONRAD Frederic <frederic.konrad@adacore.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Eric Auger <eric.auger@redhat.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Juan Quintela <quintela@redhat.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Konstantin Kostiuk <kkostiuk@redhat.com>,
        Michael Roth <michael.roth@amd.com>,
        =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
        Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        David Hildenbrand <david@redhat.com>,
        Wenchao Wang <wenchao.wang@intel.com>,
        Colin Xu <colin.xu@intel.com>,
        Kamil Rytarowski <kamil@netbsd.org>,
        Reinoud Zandijk <reinoud@netbsd.org>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>,
        Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
        John Snow <jsnow@redhat.com>, kvm@vger.kernel.org,
        qemu-arm@nongnu.org, xen-devel@lists.xenproject.org,
        qemu-ppc@nongnu.org, qemu-block@nongnu.org, haxm-team@intel.com,
        qemu-s390x@nongnu.org
Subject: [PATCH 1/3] scripts/coccinelle: New use-g_new-etc.cocci
Date:   Mon, 14 Mar 2022 17:01:06 +0100
Message-Id: <20220314160108.1440470-2-armbru@redhat.com>
In-Reply-To: <20220314160108.1440470-1-armbru@redhat.com>
References: <20220314160108.1440470-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: w1nQmuf2j0q6

This is the semantic patch from commit b45c03f585 "arm: Use g_new() &
friends where that makes obvious sense".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/coccinelle/use-g_new-etc.cocci | 75 ++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 scripts/coccinelle/use-g_new-etc.cocci

diff --git a/scripts/coccinelle/use-g_new-etc.cocci b/scripts/coccinelle/use-g_new-etc.cocci
new file mode 100644
index 0000000000..e2280e93b3
--- /dev/null
+++ b/scripts/coccinelle/use-g_new-etc.cocci
@@ -0,0 +1,75 @@
+// Use g_new() & friends where that makes obvious sense
+@@
+type T;
+@@
+-g_malloc(sizeof(T))
++g_new(T, 1)
+@@
+type T;
+@@
+-g_try_malloc(sizeof(T))
++g_try_new(T, 1)
+@@
+type T;
+@@
+-g_malloc0(sizeof(T))
++g_new0(T, 1)
+@@
+type T;
+@@
+-g_try_malloc0(sizeof(T))
++g_try_new0(T, 1)
+@@
+type T;
+expression n;
+@@
+-g_malloc(sizeof(T) * (n))
++g_new(T, n)
+@@
+type T;
+expression n;
+@@
+-g_try_malloc(sizeof(T) * (n))
++g_try_new(T, n)
+@@
+type T;
+expression n;
+@@
+-g_malloc0(sizeof(T) * (n))
++g_new0(T, n)
+@@
+type T;
+expression n;
+@@
+-g_try_malloc0(sizeof(T) * (n))
++g_try_new0(T, n)
+@@
+type T;
+expression p, n;
+@@
+-g_realloc(p, sizeof(T) * (n))
++g_renew(T, p, n)
+@@
+type T;
+expression p, n;
+@@
+-g_try_realloc(p, sizeof(T) * (n))
++g_try_renew(T, p, n)
+@@
+type T;
+expression n;
+@@
+-(T *)g_new(T, n)
++g_new(T, n)
+@@
+type T;
+expression n;
+@@
+-(T *)g_new0(T, n)
++g_new0(T, n)
+@@
+type T;
+expression p, n;
+@@
+-(T *)g_renew(T, p, n)
++g_renew(T, p, n)
-- 
2.35.1

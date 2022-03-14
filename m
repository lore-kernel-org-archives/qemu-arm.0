Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2242779lfo;
        Mon, 14 Mar 2022 09:01:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzeAuxtd/+wpoS4il2MusCqbqy4q+vMsTna5nDdIW06ywZmCRE4StUtw0dlZl/Z4xOl+2e
X-Received: by 2002:aa7:c946:0:b0:416:226f:f8a6 with SMTP id h6-20020aa7c946000000b00416226ff8a6mr21169179edt.360.1647273678984;
        Mon, 14 Mar 2022 09:01:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647273678; cv=none;
        d=google.com; s=arc-20160816;
        b=RTnJufbpv0CQ2ZCMCnlVeLy5RScMHGiFmc1JVkdgFJXTTwlug+SKgnC+/yo6vgkkOP
         ohPpiqZbdMGT5tpco3Y+ajCqV8ntgpBWQ5TY5Sm4NuS4FMjwy+5DY8ilicuatXI//uRH
         ff5Tfwu82zl6nkf74VqKyTxj0igwaESItTjvLdFNXkqJyvyD41IUD1RIr6+YuGxDoouq
         LNR/enAK6WnrkkuL1aTZ58y0c56EgfCXi4GyMg8ghfK+g2CRlg96HIA6dxr74qucFJ/O
         FKMUhRn+SO+WcDZSPzvAL2BhQVP24QdTs3szsdT1H674JOa686o8Pskb2nJ7POE5QDeA
         zN+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=jyh5Aky+XmxKXch9GhHyv+ocJ1z/NmLUE6mIW6ga0GM=;
        b=R9ccy74JgyOphscEfMa8xJMNS/byiBoNgQOVGq11A9lT19IBf/b7GBDH7XTGYiqdv+
         VBI7IUNusk0QIdoMFRInR7vAuqXXwRWOpugrlH5QNK2vmhOXzMOShKLsmTQeUVTVKvIQ
         il/Jb3e8ZoHLOySBbLDWitZ+TOABm1JSOzLZODPgQlVeJDkra/igA/ksGWF6ABuUdbTu
         epYMnsoZDubzXfbTONyO81eY6cH5faCAEbwVWWZSboyrj8FZbkzhLJOb8TnGRff2Qiom
         elfkI+SQHjdhPwVyCutKoQfkiR5LGOequhqeoWo63Pb4HU8YYCYHpjaNtIkrjCHltW7Q
         nzrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="aiB3/zYV";
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id g13-20020aa7c84d000000b0041677b1a65csi11667191edt.111.2022.03.14.09.01.18;
        Mon, 14 Mar 2022 09:01:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="aiB3/zYV";
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242876AbiCNQC1 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 3 others); Mon, 14 Mar 2022 12:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242872AbiCNQC0 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 14 Mar 2022 12:02:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 09FAF42EF3
        for <kvm@vger.kernel.org>; Mon, 14 Mar 2022 09:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647273675;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jyh5Aky+XmxKXch9GhHyv+ocJ1z/NmLUE6mIW6ga0GM=;
        b=aiB3/zYVb2gYl8zYe42n6SzD2CZrr7o+FvvBNShQ4clhLKv0PznIyXBxWIhMQrqqtJRXjV
        kNF1/bpLp7aeb0WmQAoxVaD364FLMCyjGKd9lLWIWfIxiJGNLfMyPmkx2JjzvPKhRa7DZa
        JXMNz3E+A2KFAXRwBk/NuzF8YWjs8Co=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-91cMx_V_PQuCB7mRz3I6xQ-1; Mon, 14 Mar 2022 12:01:12 -0400
X-MC-Unique: 91cMx_V_PQuCB7mRz3I6xQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90DB2811E76;
        Mon, 14 Mar 2022 16:01:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F5E7404C31B;
        Mon, 14 Mar 2022 16:01:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
        id AA31321D1F58; Mon, 14 Mar 2022 17:01:08 +0100 (CET)
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
Subject: [PATCH 2/3] 9pfs: Use g_new() & friends where that makes obvious sense
Date:   Mon, 14 Mar 2022 17:01:07 +0100
Message-Id: <20220314160108.1440470-3-armbru@redhat.com>
In-Reply-To: <20220314160108.1440470-1-armbru@redhat.com>
References: <20220314160108.1440470-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: DHuGj7M2tl0A

g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
for two reasons.  One, it catches multiplication overflowing size_t.
Two, it returns T * rather than void *, which lets the compiler catch
more type errors.

This commit only touches allocations with size arguments of the form
sizeof(T).

Patch created mechanically with:

    $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
	     --macro-file scripts/cocci-macro-file.h FILES...

Except this uncovers a typing error:

    ../hw/9pfs/9p.c:855:13: warning: incompatible pointer types assigning to 'QpfEntry *' from 'QppEntry *' [-Wincompatible-pointer-types]
	    val = g_new0(QppEntry, 1);
		^ ~~~~~~~~~~~~~~~~~~~
    1 warning generated.

Harmless, because QppEntry is larger than QpfEntry.  Fix to allocate a
QpfEntry instead.

Cc: Greg Kurz <groug@kaod.org>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/9pfs/9p-proxy.c           | 2 +-
 hw/9pfs/9p-synth.c           | 4 ++--
 hw/9pfs/9p.c                 | 8 ++++----
 hw/9pfs/codir.c              | 6 +++---
 tests/qtest/virtio-9p-test.c | 4 ++--
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
index 8b4b5cf7dc..4c5e0fc217 100644
--- a/hw/9pfs/9p-proxy.c
+++ b/hw/9pfs/9p-proxy.c
@@ -1187,7 +1187,7 @@ static int proxy_parse_opts(QemuOpts *opts, FsDriverEntry *fs, Error **errp)
 
 static int proxy_init(FsContext *ctx, Error **errp)
 {
-    V9fsProxy *proxy = g_malloc(sizeof(V9fsProxy));
+    V9fsProxy *proxy = g_new(V9fsProxy, 1);
     int sock_id;
 
     if (ctx->export_flags & V9FS_PROXY_SOCK_NAME) {
diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index b3080e415b..d99d263985 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -49,7 +49,7 @@ static V9fsSynthNode *v9fs_add_dir_node(V9fsSynthNode *parent, int mode,
 
     /* Add directory type and remove write bits */
     mode = ((mode & 0777) | S_IFDIR) & ~(S_IWUSR | S_IWGRP | S_IWOTH);
-    node = g_malloc0(sizeof(V9fsSynthNode));
+    node = g_new0(V9fsSynthNode, 1);
     if (attr) {
         /* We are adding .. or . entries */
         node->attr = attr;
@@ -128,7 +128,7 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, int mode,
     }
     /* Add file type and remove write bits */
     mode = ((mode & 0777) | S_IFREG);
-    node = g_malloc0(sizeof(V9fsSynthNode));
+    node = g_new0(V9fsSynthNode, 1);
     node->attr         = &node->actual_attr;
     node->attr->inode  = synth_node_count++;
     node->attr->nlink  = 1;
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index a6d6b3f835..8e9d4aea73 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -324,7 +324,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t fid)
             return NULL;
         }
     }
-    f = g_malloc0(sizeof(V9fsFidState));
+    f = g_new0(V9fsFidState, 1);
     f->fid = fid;
     f->fid_type = P9_FID_NONE;
     f->ref = 1;
@@ -804,7 +804,7 @@ static int qid_inode_prefix_hash_bits(V9fsPDU *pdu, dev_t dev)
 
     val = qht_lookup(&pdu->s->qpd_table, &lookup, hash);
     if (!val) {
-        val = g_malloc0(sizeof(QpdEntry));
+        val = g_new0(QpdEntry, 1);
         *val = lookup;
         affix = affixForIndex(pdu->s->qp_affix_next);
         val->prefix_bits = affix.bits;
@@ -852,7 +852,7 @@ static int qid_path_fullmap(V9fsPDU *pdu, const struct stat *stbuf,
             return -ENFILE;
         }
 
-        val = g_malloc0(sizeof(QppEntry));
+        val = g_new0(QpfEntry, 1);
         *val = lookup;
 
         /* new unique inode and device combo */
@@ -928,7 +928,7 @@ static int qid_path_suffixmap(V9fsPDU *pdu, const struct stat *stbuf,
             return -ENFILE;
         }
 
-        val = g_malloc0(sizeof(QppEntry));
+        val = g_new0(QppEntry, 1);
         *val = lookup;
 
         /* new unique inode affix and device combo */
diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
index 75148bc985..93ba44fb75 100644
--- a/hw/9pfs/codir.c
+++ b/hw/9pfs/codir.c
@@ -141,9 +141,9 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
 
         /* append next node to result chain */
         if (!e) {
-            *entries = e = g_malloc0(sizeof(V9fsDirEnt));
+            *entries = e = g_new0(V9fsDirEnt, 1);
         } else {
-            e = e->next = g_malloc0(sizeof(V9fsDirEnt));
+            e = e->next = g_new0(V9fsDirEnt, 1);
         }
         e->dent = qemu_dirent_dup(dent);
 
@@ -163,7 +163,7 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
                 break;
             }
 
-            e->st = g_malloc0(sizeof(struct stat));
+            e->st = g_new0(struct stat, 1);
             memcpy(e->st, &stbuf, sizeof(struct stat));
         }
 
diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 01ca076afe..e28c71bd8f 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -468,12 +468,12 @@ static void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
          togo -= 13 + 8 + 1 + 2 + slen, ++n)
     {
         if (!e) {
-            e = g_malloc(sizeof(struct V9fsDirent));
+            e = g_new(struct V9fsDirent, 1);
             if (entries) {
                 *entries = e;
             }
         } else {
-            e = e->next = g_malloc(sizeof(struct V9fsDirent));
+            e = e->next = g_new(struct V9fsDirent, 1);
         }
         e->next = NULL;
         /* qid[13] offset[8] type[1] name[s] */
-- 
2.35.1

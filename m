Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1027330ejb;
        Thu, 19 Oct 2023 23:59:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHG6I6S6FadjVjDVqKbQxrJm3wG0yPfpH9uyxf+/apck4uRY0lOcq78hsadewdhvnVTwT9+
X-Received: by 2002:a17:90a:7066:b0:27d:2ecd:6a23 with SMTP id f93-20020a17090a706600b0027d2ecd6a23mr982902pjk.14.1697785147059;
        Thu, 19 Oct 2023 23:59:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697785147; cv=none;
        d=google.com; s=arc-20160816;
        b=Vsu2ek9ZBkwTuFRR3w5685FdmFhdzsP+37h6IXtabIHiSDVCqrr2dr+55G0KFh9TxG
         yW+J3mZhG2ZcCeXCsx0+95f/++9Sl/mRsISH1GklK7UWxU67J4t1XUF4tT3zIPX51iNJ
         DDNMR5qA/20fusXQ/kWMGpxmSIcXjTHweTMTx0ipknT+JX2yGnbSncSktX+5HxLu1HCZ
         MI74plBlMTjL6I5IYweLMNYrFgoGSd9WAbUpkxXnktRq7tlHaz540t+dQ0WhogGRP68G
         tIClo8kVCnl9kafHNbCaflQMXpxTJcrISKcY3tDiQZ2nhk6XngiK9XTZ5DtnW4MJdp1+
         +MTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=ptt25UpSG4SGs9AzU+y2uMaUodSAfWpLkKmV1ixjEv4=;
        fh=fTjRJWWf32rfQWm8ROIsswmsB54Y1g6a+adPg1wBxPA=;
        b=xfJDx5M+m2iFBWJLl4i4fvKtTtgr457SAjughLctfeTQHqlYrjGj6Pyk+HsrSolvjl
         Nxkqryivz2n5SBqwnh6m53V8oSgw/V5vyNVRi5BAtI6YjMSlDpMOPtIYDptsJtwm31Jd
         vJRnu5f3oyIKfEEp0trMeto4MbNwT0fDsnsUNYmfZgo+CSxxEd3w2rQMSG60PmtR6nKv
         CbLUjXYY95vYCxzBt5N6LxB1gufkoOWzNTE6bTIS5orKqPmHczJnWVISCpCvH4aTqIei
         07fl9WiFr+fheR6fRj+Vcr5r2TSHsTVmdVBE4DlnOJdAwoj6ppl7j6kNBYiIwDFoFuD7
         BYPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SFSCUXMW;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.37 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from snail.vger.email (snail.vger.email. [23.128.96.37])
        by mx.google.com with ESMTPS id na10-20020a17090b4c0a00b0026cab818aa2si4078365pjb.100.2023.10.19.23.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 23:59:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.37 as permitted sender) client-ip=23.128.96.37;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SFSCUXMW;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.37 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from out1.vger.email (depot.vger.email [IPv6:2620:137:e000::3:0])
	by snail.vger.email (Postfix) with ESMTP id 832DA805F0BB;
	Thu, 19 Oct 2023 23:59:06 -0700 (PDT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.10 at snail.vger.email
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376347AbjJTG6u (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Fri, 20 Oct 2023 02:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376317AbjJTG6s (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 20 Oct 2023 02:58:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF461A3
        for <kvm@vger.kernel.org>; Thu, 19 Oct 2023 23:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697785091;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ptt25UpSG4SGs9AzU+y2uMaUodSAfWpLkKmV1ixjEv4=;
        b=SFSCUXMWVU32Vwokj4xrd9SqkXsWNYeStMqU7s/AQ1jov2/HE6XntRwbCSMymX8Cb5ra3u
        72gbvmAPLpriz6t3V6UPQ0ZnVhkWXAknZ0Sajmf/r4cur7OfBcugw5BBP6bDOaSumSq+pO
        NRrwMqNvWVZqqbtrxmNp4xLAcHLboV4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-n1qWBceSOyyk8xMFkJd1-w-1; Fri, 20 Oct 2023 02:58:08 -0400
X-MC-Unique: n1qWBceSOyyk8xMFkJd1-w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 531E13C108CF;
        Fri, 20 Oct 2023 06:58:07 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 63C3725C0;
        Fri, 20 Oct 2023 06:58:00 +0000 (UTC)
From:   Juan Quintela <quintela@redhat.com>
To:     qemu-devel@nongnu.org
Cc:     qemu-s390x@nongnu.org,
        =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        "Denis V. Lunev" <den@openvz.org>,
        Juan Quintela <quintela@redhat.com>,
        Fam Zheng <fam@euphon.net>, kvm@vger.kernel.org,
        Harsh Prateek Bora <harshpb@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Eric Farman <farman@linux.ibm.com>,
        Kevin Wolf <kwolf@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Jagannathan Raman <jag.raman@oracle.com>, qemu-arm@nongnu.org,
        Alex Williamson <alex.williamson@redhat.com>,
        Reinoud Zandijk <reinoud@netbsd.org>,
        Thomas Huth <thuth@redhat.com>,
        =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Elena Ufimtseva <elena.ufimtseva@oracle.com>,
        qemu-ppc@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
        Stefan Berger <stefanb@linux.vnet.ibm.com>,
        Stefan Weil <sw@weilnetz.de>, Peter Xu <peterx@redhat.com>,
        Christian Schoenebeck <qemu_oss@crudebyte.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Jeff Cody <codyprime@gmail.com>,
        Laurent Vivier <lvivier@redhat.com>,
        Hanna Reitz <hreitz@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Leonardo Bras <leobras@redhat.com>,
        Fabiano Rosas <farosas@suse.de>,
        Daniel Henrique Barboza <danielhb413@gmail.com>,
        Greg Kurz <groug@kaod.org>, qemu-block@nongnu.org
Subject: [PULL 01/17] tests/qtest/migration-test: Disable the analyze-migration.py test on s390x
Date:   Fri, 20 Oct 2023 08:57:35 +0200
Message-ID: <20231020065751.26047-2-quintela@redhat.com>
In-Reply-To: <20231020065751.26047-1-quintela@redhat.com>
References: <20231020065751.26047-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.6.4 (snail.vger.email [0.0.0.0]); Thu, 19 Oct 2023 23:59:06 -0700 (PDT)
X-TUID: CBCtrIcmb/uF

From: Thomas Huth <thuth@redhat.com>

The analyze-migration.py script fails on s390x hosts:

 Traceback (most recent call last):
   File "scripts/analyze-migration.py", line 662, in <module>
     dump.read(dump_memory = args.memory)
   File "scripts/analyze-migration.py", line 596, in read
     classdesc = self.section_classes[section_key]
 KeyError: ('s390-storage_attributes', 0)

It obviously never has been adapted to s390x yet, so until this
has been done, disable this test on s390x.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231018091239.164452-1-thuth@redhat.com>
---
 tests/qtest/migration-test.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index e1c110537b..241b409857 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -3034,7 +3034,9 @@ int main(int argc, char **argv)
 
     qtest_add_func("/migration/bad_dest", test_baddest);
 #ifndef _WIN32
-    qtest_add_func("/migration/analyze-script", test_analyze_script);
+    if (!g_str_equal(arch, "s390x")) {
+        qtest_add_func("/migration/analyze-script", test_analyze_script);
+    }
 #endif
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
     qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
-- 
2.41.0

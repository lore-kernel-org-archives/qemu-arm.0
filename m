Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3216485ejb;
        Tue, 21 Feb 2023 04:49:00 -0800 (PST)
X-Google-Smtp-Source: AK7set+4b+/vR/13tfIyfvTEcZCAmc/Zx0Ei+zUYb+gJI0GOpe3+lkWpgypcsNBWyuDNpLJUCZ37
X-Received: by 2002:a05:6214:262f:b0:56b:ec30:67eb with SMTP id gv15-20020a056214262f00b0056bec3067ebmr10074824qvb.39.1676983740440;
        Tue, 21 Feb 2023 04:49:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676983740; cv=none;
        d=google.com; s=arc-20160816;
        b=maiPj6ixKUVrbTjaBZPWkfB51HRk0h1Ur6i2RvcSFApNBVt2/5iHN6Q0SuRiEyNX/d
         H3ZrcA+gRoOWn6vhfSVy/cRqEskqsRyoQL47AjJ092HBGN8qq5MwHOn8JkPc6sdCWdF6
         rEB/JPWinkqNMgbzRNbPdbuxe5Qh1ZMdN0GSwn4CcYwF6TD/4KFHsTV8XbQyzKk27kRs
         1H4Ijyid36xt6V+RU79GgBHXuYmF2YBwjYPxklX8jaalGqRz1RVXEnyZgyEv5rCOsQx+
         ltDTKktvmcmwHu1InEzsdgcgPo9QPzOi/LfwikKY0cXPFt5BaVBgNdhQfy9xKWRDLlue
         Iifw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YjEQm1F5xM6Ei/i3uH49XnaqSU42QquOa8Xq7bTbqW4=;
        b=Vc5BrgtTCUPtlv5RVIwpl3P2gZFFGpERAVUUqdsv95rU1Q5QlF4XOeic9UTFFtWIAC
         3H0VD62G6oHzI/Jdf/pj5o1L4vDRnxQ5E1oLiRxxQuVd81ZaLDz8f0OCpc3uPrXPD4pM
         qdcPac4g1mJoQHekuU0NO1VvTub6W0S0Frvl2F6GtBou/+8WOpsFsNFdv+XddGB+a2Ht
         eZjzLg3M7putRqw5s4UdA3r6tEkkW267FKKnedd3Gx+Iik8ieTjwHucd9vnJS9rM4pTP
         oUGVNAeIgiSfm6IgmabnQO//5tbJO+D3vsBWG9nbcywOTvK9VdV/r5qJDMbdCia38FpL
         H32A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fUHAfn79;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5-20020a05620a0f0500b007419c1d3846si2089285qkl.15.2023.02.21.04.49.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 04:49:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fUHAfn79;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUS4D-0004yk-T7; Tue, 21 Feb 2023 07:48:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4B-0004vY-Ik
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:48:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS49-0007oT-OQ
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:48:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676983696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YjEQm1F5xM6Ei/i3uH49XnaqSU42QquOa8Xq7bTbqW4=;
 b=fUHAfn79kcVV8mpIc4wRPVPBbkdRjdRsK/vFph9++anb85G+uDSLvJM64+LFfaQIhQUYRB
 5TfQe0MGzT0ONLxRVucM1AJEwBI1n2TkGm7fUxEQE5tHP5GX19ulNqNn2wbhSGA2AWoY7z
 FkOjL5ivcu98DkBfvjXM37QnJ9meRqc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-sNMVaeEQPXu184XsydlM0w-1; Tue, 21 Feb 2023 07:48:15 -0500
X-MC-Unique: sNMVaeEQPXu184XsydlM0w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE80F3C025BD;
 Tue, 21 Feb 2023 12:48:14 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 059034014CF3;
 Tue, 21 Feb 2023 12:48:13 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, armbru@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 02/16] tests: use closesocket()
Date: Tue, 21 Feb 2023 16:47:47 +0400
Message-Id: <20230221124802.4103554-3-marcandre.lureau@redhat.com>
In-Reply-To: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5BPl3rvoYLOE

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Because they are actually sockets...

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/unit/socket-helpers.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/unit/socket-helpers.c b/tests/unit/socket-helpers.c
index eecadf3a3c..914b3aa0cf 100644
--- a/tests/unit/socket-helpers.c
+++ b/tests/unit/socket-helpers.c
@@ -117,13 +117,13 @@ static int socket_can_bind_connect(const char *hostname, int family)
 
  cleanup:
     if (afd != -1) {
-        close(afd);
+        closesocket(afd);
     }
     if (cfd != -1) {
-        close(cfd);
+        closesocket(cfd);
     }
     if (lfd != -1) {
-        close(lfd);
+        closesocket(lfd);
     }
     if (res) {
         freeaddrinfo(res);
-- 
2.39.2


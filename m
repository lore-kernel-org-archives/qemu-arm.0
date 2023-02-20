Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2645925ejb;
        Mon, 20 Feb 2023 13:51:04 -0800 (PST)
X-Google-Smtp-Source: AK7set/Ed9o3iFvdUC85iy11/ZYiBLaRYPnCIBnwOuq9pJ2Iga0l4m4u+ydEdZqpMRKoIuW2qA/H
X-Received: by 2002:ac8:5c95:0:b0:3b8:2e8b:d8af with SMTP id r21-20020ac85c95000000b003b82e8bd8afmr19256432qta.55.1676929864033;
        Mon, 20 Feb 2023 13:51:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676929864; cv=none;
        d=google.com; s=arc-20160816;
        b=qS/h6VGcyVLkwcNls2aBbLN4BJjRKJkRo/z9cgCQ2TyeiOSW+BESRL7vJaiP7TmBxG
         9BcFs6wy/MkToJgvdyS8OpgcrZ6gtPx1oba+MQZ0LQZqQPn/xKkZ84xh9kMHqGOuvywH
         9HWnGvmrBR1/FGpYQ9EgVkUXKoD3RUYlRBwm1eQfhUdACA7ABqyfPJpfC/3X/bJpLTBw
         fnK6juV2Z9903tbOfJoKQXNSqiraRZjyXkLr1FBNC+T/b/yPKv0O544lB2ZFYt0Uc7GM
         A6qeq733HgVfwwBpzpVem4+eEvTibQ5Hh7qumV7Xsg+Fnc65CrtgWawnoqJhgKeDiy7I
         IFvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JvEMO5c2JkOF6By7T+YUpSgoqGP8ZOOLt3YLiVCdBC0=;
        b=O3xndo72tA/fLJedU0tRKBpIp/16o1DJVIOVEq/jihbzWBpYteLKhU39q/2y4pkw32
         kzONm41pAAjJm/tCZXNvWn6dWzqRTZIrCfiPrfxhTb649P7Iwy6KFyjyuOrkiy8dW/6g
         c3Rl8+T3EEPdRg1tZPokX48N/sH6doCpr0JSjemSNu6ErZ0mb3T0lGuhvv0k+X1Fufsf
         yyNbRnhJUVbMifF0Y73ecCU6G+TvLYvzG4xFJ3dWvHQBWICsyKEWT+1I4hBTXP4VzBqc
         OGqPj7+jkUQntIltOJognAbDcLiFc+VnTlTVYisDN1La3K97sLsDhs/JOZAnzliMQ2Sv
         aDTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EfX5bbaO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020ac85742000000b003b6a098691csi10861448qtx.147.2023.02.20.13.51.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 13:51:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EfX5bbaO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUE30-0003sc-Gc; Mon, 20 Feb 2023 16:50:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUE2u-0003bZ-3t
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 16:50:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUE2k-000809-VJ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 16:50:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676929787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JvEMO5c2JkOF6By7T+YUpSgoqGP8ZOOLt3YLiVCdBC0=;
 b=EfX5bbaO/tok1YG+6gd07sE5Q0+i39xVkt64G2NsbT8PZ6RbUCS70sFE2QZr1URO5HUPhp
 pq7RrG7TxpD+ISbyTX51JMHBVCQtAJgqMCNHcDvuUcQApUw39rsr5SOgRoVE4VrZ7ABCuA
 BuxDuTFwfVjO8Er3f1mDuf3vDrF7CvM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-Pf7xcpurPHOvAJCBfd8WZQ-1; Mon, 20 Feb 2023 16:49:41 -0500
X-MC-Unique: Pf7xcpurPHOvAJCBfd8WZQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5627C185A794;
 Mon, 20 Feb 2023 21:49:40 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C9F4140EBF6;
 Mon, 20 Feb 2023 21:49:39 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Jason Wang <jasowang@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 09/15] RFC: build-sys: add slirp.wrap
Date: Tue, 21 Feb 2023 01:48:53 +0400
Message-Id: <20230220214859.3792171-10-marcandre.lureau@redhat.com>
In-Reply-To: <20230220214859.3792171-1-marcandre.lureau@redhat.com>
References: <20230220214859.3792171-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: IQcDsdcf2qCx

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This allows to build with --enable-slirp / -D slirp=enabled, even when
libslirp is not installed on the system. Meson will pull it from git in
that case.

RFC because this is very convenient, for a developper targetting
different environments, but might not be considered appropriate, as it
is "a kind of" git submodule (without git submodule integration issues
though, afaik, experience should tell).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 .gitignore             | 2 ++
 subprojects/slirp.wrap | 6 ++++++
 2 files changed, 8 insertions(+)
 create mode 100644 subprojects/slirp.wrap

diff --git a/.gitignore b/.gitignore
index 61fa39967b..1ea59f4819 100644
--- a/.gitignore
+++ b/.gitignore
@@ -20,3 +20,5 @@ GTAGS
 *.swp
 *.patch
 *.gcov
+
+/subprojects/slirp
diff --git a/subprojects/slirp.wrap b/subprojects/slirp.wrap
new file mode 100644
index 0000000000..87cdd8dcd8
--- /dev/null
+++ b/subprojects/slirp.wrap
@@ -0,0 +1,6 @@
+[wrap-git]
+url = https://gitlab.freedesktop.org/slirp/libslirp
+revision = 15c52d69
+
+[provide]
+slirp = libslirp_dep
-- 
2.39.1


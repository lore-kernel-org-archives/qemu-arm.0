Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3000083lft;
        Sun, 3 Jul 2022 23:44:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tyfsPbEZg6g1+axRwuGktGb5JnBC/9S/eH8za0cXZ4cB5wnMOGgSrXJeOrJNU5W4rovqPV
X-Received: by 2002:a25:76ce:0:b0:66e:2a3e:c3b8 with SMTP id r197-20020a2576ce000000b0066e2a3ec3b8mr10216574ybc.222.1656917055595;
        Sun, 03 Jul 2022 23:44:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656917055; cv=none;
        d=google.com; s=arc-20160816;
        b=vowDd3rpg1dPPlTeuW3slC8Do0LV9f9N4rgFFM8dkGzAleZTgh2/Fw9DnHfmGcMDBZ
         287yXIqvFG/quZKfco4fOb4CJi0i+yfPeNo3WclC2aaoU5YQUIfQO9XJqbwUYbxnK2xq
         GCPP9MfIAyBKmDJfoeRz0vLgWxrpFXGwX+nwV2KH7VplymZKlS+4RLSsnl46SKcxeZQ4
         i0r2Tj0rg5Za+SG78tALy2zBgVXKPS2pvlUFYUm0O6Z3DwbUjvhif1L50D41rXvlvq01
         NdwRO3ic92YHQ5Cg2CcSlKU9qxdpNP0xNvR2+0I8PlCBZMlDqSuSVWXe7nShKajXUir6
         Ovxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=+85k7rYZluhbxXR+XXkdfAOni9VQpncMLo0xqt+DtRI=;
        b=zpnXmxE2yFimiJkk0+OpHcTYNnGnuDVgT6jhu314CiIDCB+P5BGvs3MfuVqkxXy4H9
         CdNDVzwhcAAqWa0Z+h5JD9oADp6ocl8tuOZB4MP+GYwW+1eybYd8fzX0l0W1m3IEKUNp
         4XP2EJoXAkmEdE3aGOEfREWL2jX/XMXOIkNL2VKUFImC0X5CMm/xSqPmrQmjEc4norqR
         eFjONeEPB0omWEI/q6tW7y+5Z6iceYEQVtcIs4ARYR29L1hVgpmfE8FNpX+RrX1NfcOa
         vDfVxm50c537lbM5y7UyiBH3ryRnYP3Oqy5pvDCkNCOg/4wR4hM0zeztTjWfWVv9FGKm
         k26g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JTu8RANe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 206-20020a2505d7000000b0066e348e8a21si5737694ybf.555.2022.07.03.23.44.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 23:44:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JTu8RANe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8Fod-0001Ar-0R
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 02:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8FnZ-000111-BT
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 02:43:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8FnX-0005X5-Ra
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 02:43:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656916986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+85k7rYZluhbxXR+XXkdfAOni9VQpncMLo0xqt+DtRI=;
 b=JTu8RANeOS7WyaEs/N+sp7/bajNO9FYyMWcp+AQplShLoECzQc5Mt84Qi5XXkOSnVpa5AT
 x+eOs2zZc+5Jom0REVH37DLGXn5X5IOEQFn8EosNVNNyfm0U+u6i0NGwnTJmvvTT00wbgv
 Gg5ZsGgO6vzxw2jw+PiCnhZFw6dYGso=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-HISVCJjwN8yBFEt6Rg6Xpg-1; Mon, 04 Jul 2022 02:43:00 -0400
X-MC-Unique: HISVCJjwN8yBFEt6Rg6Xpg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04D048001EA;
 Mon,  4 Jul 2022 06:43:00 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41270C15D42;
 Mon,  4 Jul 2022 06:42:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Brad Smith <brad@comstyle.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Ryo ONODERA <ryoon@netbsd.org>
Subject: [PATCH 0/3] scripts/make-release: Decrease the size of the release
 tarballs
Date: Mon,  4 Jul 2022 08:42:51 +0200
Message-Id: <20220704064254.18187-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HauFre+ZpdoX

Our release tarballs are huge - qemu-7.0.0.tar.xz has a size of 119 MiB.
If you look at the contents, more than half of the size is used for the
edk2 sources that we ship along to provide the sources for the firmware
binaries, too. This feels very wrong, why do we urge users to download
such huge tarballs while 99.9% of them never will rebuilt the firmware
sources? We were also struggeling a bit in the past already with server
load and costs, so we should really try to decrease the size of our
release tarballs to a saner level.

Fortunately, edk2 has a permissive BSD license, so we are not forced
to distribute the sources for this. Thus instead of packaging the whole
edk2 source tree in our tarballs, let's just do the bare minimum and
provide the license information and a pointer to where the users can
download the edk2 sources instead. This decreases the size of our tarballs
already to the half of the original size.

Some few additional MiBs can be saved by omitting the sources of the
skiboot firmware, which has a permissive license, too (see second patch).
The final patch is rather cosmetics only - it drops some additional
.yml and .git files from the tarball that are of no use for the normal
user without the corresponding git repository.

Thomas Huth (3):
  scripts/make-release: Do not include the edk2 sources in the tarball
    anymore
  scripts/make-release: Do not include the skiboot sources in the
    tarball anymore
  scripts/make-release: Remove CI yaml and more git files from the
    tarball

 scripts/make-release | 46 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 8 deletions(-)

-- 
2.31.1


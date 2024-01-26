Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp742652ejc;
        Fri, 26 Jan 2024 00:40:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4jMeNFH4Bir1MgU0yflc/QVKiTvfyw0bo1hxdIKwaZ0SgV1UUtO/ieoTEreFNiRdEBVyF
X-Received: by 2002:ac8:4e8c:0:b0:42a:722b:c043 with SMTP id 12-20020ac84e8c000000b0042a722bc043mr1063779qtp.103.1706258448019;
        Fri, 26 Jan 2024 00:40:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706258448; cv=none;
        d=google.com; s=arc-20160816;
        b=zUbfbtNDIVdxxQNZEYppZOkV9gFkpFpoJYA2x24BN5aZHNU4LusqTf4D0jWX2/IiGs
         7rmd4mDgMR38KEQocOYNl771/8bD12zDc4C/fmQo5cj1GXTVO6uJPc8g9XnHYWyzyyE2
         jjJB3Fo5If2p9pY04fmS8T3gY7K5MbmDGOHyBGZRo7WC67PaPQHeUXrxBDXskjDNmfV+
         yWrpgMjl/j1xpyTvExKkrZ/j7x7zM+NwyMmkZSWpaDOXUSRbKh1N41o70N7HqBuFOhgt
         9kmFq+rftaTs01+iYct4FWLwNos1buEJFKNgcbffISrxqTNQkZF02wg8qN1oWKQTUnQi
         aHTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=LgFnQEsxtyzbsFHgckgmEGg9L/IocL3BBH29Awp0ZOI=;
        fh=4MFjWk99T14cOfrd/QAZZe1F8g1v4KV8Ub1F9CwTKmk=;
        b=OjrtN+qTKTggZSv+GuM+DFbMwflxyURziIJfia8+xm3ZuVGOj0lhb+a/dpuK0yt/9/
         4Eipf/x/B0IVG+RmxMXm5njF7t5WOlSnMpdqxdyF7caD5Lkrygsr8gqDToPQw/Hq8y1V
         EGzn+a7QtQLPf48bniqK0EYyttxG13Q/r+AJGrXJL/RJyUELywp5FZLEVQCdJ0YeAieK
         y0+r0n6ZHdamULavM/juxZkVzAvF4W5J67Y4IKnvHvm2ute1kepJdXUh5awGPS4+XDfL
         m3AaCqITuG+ghXtmCKd8FWqcf3TnWjzgn7guPExSKZXR03jno0/nEnPdjW6LvhNKq1a0
         97NA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YalzAi45;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y21-20020a05622a005500b0042a4540636fsi713980qtw.643.2024.01.26.00.40.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 00:40:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YalzAi45;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTHkx-0008Cj-U9; Fri, 26 Jan 2024 03:40:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rTHkw-0008B8-ES
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 03:40:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rTHku-0002Qh-3j
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 03:40:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706258406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LgFnQEsxtyzbsFHgckgmEGg9L/IocL3BBH29Awp0ZOI=;
 b=YalzAi45G8BrIVtQ+XV/pvUzUCWB1/o8zE76MhcujC2dHApIBsOkpL3MNwYNpsmTaqjGWD
 wzcZ71zDJe7QIak/XO3VNZ1d0sqyPc5Vg9nXBfbkaE85373S7n2YPkpHp3+IrAsBz4+Xs1
 pznXtage40lcLFFI4evusD7EJMjgtWo=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-157-oeRLs0giNSq4syuIqZgtsQ-1; Fri,
 26 Jan 2024 03:40:04 -0500
X-MC-Unique: oeRLs0giNSq4syuIqZgtsQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 047073C000AB;
 Fri, 26 Jan 2024 08:40:04 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF78B492BFA;
 Fri, 26 Jan 2024 08:40:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/3] target/arm: Allow compilation without CONFIG_ARM_V7M
Date: Fri, 26 Jan 2024 09:39:58 +0100
Message-ID: <20240126084001.879548-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Z/MGILqjJMgQ

We've got a switch to disable v7m code since a long time - but it
currently cannot be disabled since linking then fails due to missing
functions. But thanks to the clean-ups that have been done during the
past years, it's not that difficult anymore to finally make it possible
to disable CONFIG_ARM_V7M: We just have to move some v7m-related code
out of cpu32.c to a separate file (that we only compile if the switch
CONFIG_ARM_V7M is enabled) and make sure to use the stub functions in
m_helper.c if it is disabled. Then we can finally remove the hard-coded
"select ARM_V7M" from the Kconfig file.

Thomas Huth (3):
  target/arm: Move v7m-related code from cpu32.c into a separate file
  target/arm/tcg/m_helper.c: Include the full helpers only with
    CONFIG_ARM_V7M
  target/arm/Kconfig: Stop requiring CONFIG_ARM_V7M

 target/arm/tcg/cpu-v7m.c   | 292 +++++++++++++++++++++++++++++++++++++
 target/arm/tcg/cpu32.c     | 261 ---------------------------------
 target/arm/tcg/m_helper.c  |   3 +-
 target/arm/Kconfig         |   4 -
 target/arm/tcg/meson.build |   4 +
 5 files changed, 298 insertions(+), 266 deletions(-)
 create mode 100644 target/arm/tcg/cpu-v7m.c

-- 
2.43.0


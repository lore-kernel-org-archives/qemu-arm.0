Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp26492ejk;
        Mon, 29 Jan 2024 00:18:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjJxd07Lvi5vAdvJfSKJXPShKCqsO6gd37xDci4c5BM3CsUK/anjFUeFsymxF6JpW9Q+fP
X-Received: by 2002:ae9:e70d:0:b0:783:a9ba:f1a6 with SMTP id m13-20020ae9e70d000000b00783a9baf1a6mr5166577qka.23.1706516333236;
        Mon, 29 Jan 2024 00:18:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706516333; cv=none;
        d=google.com; s=arc-20160816;
        b=GtKuXmNOgEYYj/KGzTXVRj1QnayKVy243V2MH1Hw9bW1KyQUlqcQhJ8rx5HG3UZy+q
         HtQ1EKvtDFYt2LVGG8Tq/ykxwGMrqRv37aV09mOm9lNGr3Uq2eCL2HUmp+LEmPU6kqvb
         C/D+EOhlTPPoQNnfMBbj4Jxz+FGoIkfFpd5B2Tes7t/ufC+MFzK5OQEIvwdQA5ndAbdW
         fJ1oO182GIwU6etPjkUugZDie3eHd1Is6xGTDoLxaQmL/aL+PvI4g4DBY2c4JSPUvqyB
         Z8MNjfEyVFAAwuY/M8UOdpiaq8vOJDGx1+RH8raBf+X7Vw6I0GwfyEzyxs4FfUx+8tGo
         heYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=8HJQJUo4VSjo2AnXBNFHPWy/5Vmf3u1DtUE2rhAbHEg=;
        fh=4MFjWk99T14cOfrd/QAZZe1F8g1v4KV8Ub1F9CwTKmk=;
        b=QlrCrRR6YuZaL1feO7gh0GjFyoByXwam49vobeGUaooWslUtuHQtHtihurx/ScHRsA
         6uymwABWqHKtLcWu5QqVqdeczqpDz7FEoEyM8I67HlMBtXfWvCIRt55lcR31mqjbLXxk
         gIvgElXPiqn8QZ1rGIGHgUsC8KK/PbiYI4QnY2B18W/edp8GaGl4Eh6eOQEzl+PhqiS+
         zXmooDli51uFZg6c5ueMpqM7jUJGvHUU4ONSlaHTTW19AYj7FIEEP49vPlfh25I0TLZi
         hF+Sa6wGzVAHh9jwN3RuNs7PqtRZX+hADVfc1NvlFl4HmFShChLNXajJskhca3CJVfN2
         mDlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PcDcB5GK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4-20020a37de04000000b00783a99fced4si7009222qkj.162.2024.01.29.00.18.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jan 2024 00:18:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PcDcB5GK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUMqt-0006sA-0L; Mon, 29 Jan 2024 03:18:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rUMqr-0006r6-W1
 for qemu-arm@nongnu.org; Mon, 29 Jan 2024 03:18:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rUMqp-0008Qs-Iz
 for qemu-arm@nongnu.org; Mon, 29 Jan 2024 03:18:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706516323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=8HJQJUo4VSjo2AnXBNFHPWy/5Vmf3u1DtUE2rhAbHEg=;
 b=PcDcB5GKIUnin67cT1nvXM/L8hCiN4dT8dOcums/Wun+n9TSxpUYL7UfJSxLjzj+63FKjI
 9ywyNLFaxejVyBNSW7WXhx78yHSHNk90fCeHTDq6C9UBCJGqDSZxJVXm4xu6ooWfR8mgr0
 cjUbYLXvwD702ACWH5xtQPhy1rONcbM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-438-dgoIQ84ZPSqLgxScVL2uJg-1; Mon,
 29 Jan 2024 03:18:38 -0500
X-MC-Unique: dgoIQ84ZPSqLgxScVL2uJg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6752C1C0CCB1;
 Mon, 29 Jan 2024 08:18:38 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96FFF1121306;
 Mon, 29 Jan 2024 08:18:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/3] target/arm: Allow compilation without CONFIG_ARM_V7M
Date: Mon, 29 Jan 2024 09:18:32 +0100
Message-ID: <20240129081835.137726-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.485,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9TlKhHqagms2

We've got a switch to disable v7m code since a long time - but it
currently cannot be disabled since linking then fails due to missing
functions. But thanks to the clean-ups that have been done during the
past years, it's not that difficult anymore to finally make it possible
to disable CONFIG_ARM_V7M: We just have to move some v7m-related code
out of cpu32.c to a separate file (that we only compile if the switch
CONFIG_ARM_V7M is enabled) and make sure to use the stub functions in
m_helper.c if it is disabled. Then we can finally remove the hard-coded
"select ARM_V7M" from the Kconfig file.

v2:
- Updated a comment
- Avoid #ifdef in cpu-v7m.c, handle it via meson.build instead

Thomas Huth (3):
  target/arm: Move v7m-related code from cpu32.c into a separate file
  target/arm/tcg/m_helper.c: Include the full helpers only with
    CONFIG_ARM_V7M
  target/arm/Kconfig: Stop requiring CONFIG_ARM_V7M

 target/arm/tcg/cpu-v7m.c   | 290 +++++++++++++++++++++++++++++++++++++
 target/arm/tcg/cpu32.c     | 261 ---------------------------------
 target/arm/tcg/m_helper.c  |   3 +-
 target/arm/Kconfig         |   4 -
 target/arm/meson.build     |   3 +
 target/arm/tcg/meson.build |   3 +
 6 files changed, 298 insertions(+), 266 deletions(-)
 create mode 100644 target/arm/tcg/cpu-v7m.c

-- 
2.43.0


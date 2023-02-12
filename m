Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp3883403ejb;
        Sun, 12 Feb 2023 12:50:32 -0800 (PST)
X-Google-Smtp-Source: AK7set8lKPFj9w9LDVduPTJj+WvfN/Zx7t8AiSnopdZ1T8kga0DxbmolrCsr5X55432XLk/7Ga88
X-Received: by 2002:ad4:5dca:0:b0:532:2dd4:fea5 with SMTP id m10-20020ad45dca000000b005322dd4fea5mr34899061qvh.7.1676235032141;
        Sun, 12 Feb 2023 12:50:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676235032; cv=none;
        d=google.com; s=arc-20160816;
        b=XNbtVG/X7aMdbi7votNaMibOz5ah6W6DGgGy+i4SqqNO8OpXCDXJ1JQCWllwlfk5yE
         /l3VnywWXlc2dQ4ta5oA1gN3S3UHFmYZeMkak8cjHkPTX2rE3ENXurm6qIJXM4c4CFnH
         r0gy8V878ULSEomNanxONfiMD1iSkqoR49IBjPiT6le6yxb178GTiSG8N/ZKT+z80FXP
         DACwwccvcAqBPKJMn3C39KL0p6lYFl45CDoHsHtz0G8AetX9a7g39V/fFlsj38TKwIWY
         ZGcMqbXHHa7IYZZr6vjrZRC/3hKaqhzxpxwbsDlLh1L8zjDBDVcjZ51gTCT//11J3Fgh
         kFAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=AWJRN+1k+pBoacGNyyWxXe1tjB/zApUQNYAWv69Id1o=;
        b=Ka1c7TbNwyY/u6Um8ww30c9K4RO+EyEbUEUUXC2siFYPIafaRbkyDku2Sv70nxV6o8
         m1x/ppui74kb5kR1+GWbF6rxCdtyAoZTtUzIgifUddbdtBdH7YpHR/rOB9bmbMd3ZHRd
         UEYS+49r39/r+OwrwZqNfFAOvB4niOtNeQqF1ZNkCUr+niJBZCIB/gZXMUvvbAOxSExq
         QydW8AuhaxJyFMUVDSB03Hw9QMTUAvbCpH8unn6qzZ7Am9mokjECMSt99IBUH9aQ/Zgx
         11g+zr/Aopm/hESMwTYj6ApV7lioUfO+HdNXNjGHoUnSDTeoyh81k+t5zyO1eAM/8lv7
         Rxew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="UenP/8oW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15-20020a0cb20f000000b005351bc2cf4fsi8330568qvd.535.2023.02.12.12.50.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Feb 2023 12:50:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="UenP/8oW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRJIl-0004WV-Lg; Sun, 12 Feb 2023 15:50:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pRJIJ-0004QW-Ik
 for qemu-arm@nongnu.org; Sun, 12 Feb 2023 15:50:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pRJII-0001sT-27
 for qemu-arm@nongnu.org; Sun, 12 Feb 2023 15:49:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676234990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AWJRN+1k+pBoacGNyyWxXe1tjB/zApUQNYAWv69Id1o=;
 b=UenP/8oWS8F9KDrlOIUQ965rtrbdmEJaOpjPQgGxrOabUhVzPIfnvUOq2Ik/AjEae4jTSP
 29GCPdIZk79JubMMDPFbhHfCQlLDOOv6qzeKoZeX2EqMM8b4Vg2CqIDU6SVBk43D0noSRR
 W6/5jkHkbf+dx9PBgYEYN/w+zEPW9CA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-QafuaRsWOBuMzbxyeGAQbw-1; Sun, 12 Feb 2023 15:49:49 -0500
X-MC-Unique: QafuaRsWOBuMzbxyeGAQbw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E1D085A5A3;
 Sun, 12 Feb 2023 20:49:47 +0000 (UTC)
Received: from localhost (unknown [10.39.208.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 483E6140EBF4;
 Sun, 12 Feb 2023 20:49:44 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 0/4] win32: do not mix SOCKET and fd space
Date: Mon, 13 Feb 2023 00:49:38 +0400
Message-Id: <20230212204942.1905959-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
X-TUID: xRyXfStogZtt

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Hi,

A win32 SOCKET handle is often cast to an int file descriptor, as this is what
other OS use for sockets. When necessary, QEMU eventually queries whether it's a
socket with the help of fd_is_socket(). However, there is no guarantee of
conflict between the fd and SOCKET space. Such conflict would have surprising
consequences. We can fix this by using FDs only.

After fixing a few missed closesocket(), this patch series makes the win32
socket API wrappers take FDs. It finally get rid of closesocket() usage by using
a close() wrapper instead. (note that fdopen/fclose would not be enough either
to close the underlying socket appropriately)

Marc-André Lureau (4):
  tests: use closesocket()
  io: use closesocket()
  win32: stop mixing SOCKET and file descriptor space
  win32: replace closesocket() with close() wrapper

 include/sysemu/os-posix.h   |   1 -
 include/sysemu/os-win32.h   |   8 +-
 backends/tpm/tpm_emulator.c |   6 +-
 crypto/afalg.c              |   6 +-
 hw/hyperv/syndbg.c          |   4 +-
 io/channel-socket.c         |  22 +++--
 io/channel-watch.c          |  17 ++--
 net/dgram.c                 |  14 +--
 net/socket.c                |  22 ++---
 tests/qtest/libqtest.c      |   8 +-
 tests/qtest/microbit-test.c |   2 +-
 tests/qtest/netdev-socket.c |  10 +--
 tests/unit/socket-helpers.c |   2 +-
 util/oslib-win32.c          | 169 ++++++++++++++++++++++++++++++------
 util/qemu-sockets.c         |  22 ++---
 15 files changed, 221 insertions(+), 92 deletions(-)

-- 
2.39.1


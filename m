Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp615952lfm;
        Mon, 6 Jul 2020 22:18:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwq+1J5bBm//WuEZ0ZxNYpUaOoqIGG3g8k9x8qoA0x8cPhJ8Pn5sZtLwwXm7wdZj+5PAPfG
X-Received: by 2002:a25:77d8:: with SMTP id s207mr76658643ybc.361.1594099134701;
        Mon, 06 Jul 2020 22:18:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594099134; cv=none;
        d=google.com; s=arc-20160816;
        b=LDbkyNT4HOFoQGA94bFWTQ/DlK8Xo7zmzIugZo2FXF1K3baRgldja9jvwnfdzSZTD/
         R2TgCyWLek7OIR7+ZilHdXGXgfA6IBK/6eWxDC3k+ocUH43MKZYOyc9Y4QLiKSCOGWQE
         mYRoimEUBN4CKwXXr0KstJsj53QPV6em3Ag818qPAL+uQUFWoL6DPZIxFg7LtHu/XbBr
         sQT1y9IJAHSv4pk2xwa6uQMYwfuq7UDZLG9KCu3f+f1FunPn2g+k7Kp4HxZhgfPvD61N
         i9mBC9Iwg4REvKyrDpv/mqmSmjDt+ZPZ9Eh+7x0tJw7Hsm3wwfbMiDJOMtQheFLDTdgk
         dtfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:mime-version:user-agent:date:message-id:openpgp
         :subject:from:to:dkim-signature;
        bh=SRsa8AgaoyTyG51Ddn4+2Fg+W04r3WA7ZEia0YrO/1U=;
        b=FYmh3SZlvJz7v5Id80+5zDkjouW0/pLv/N7lkFWgLq6Yh51TkkUo/suaoPLP2MnmZZ
         FQdvRisbT/HtdYX5C9INjWm78Gd3IOELU7QAIFmcVVKhyxQJ0IlHr3XWsAJ7Ya8vAU/I
         s+bjQppALu4Xa8Yn1SDMOiLNE6/nlXbBnUknamI20ivd3cTLrHVFSj3v+x6bvm0Wa14Z
         xTbpk5aQu8tetAcGVdo7i5n7Yc0ao3rXTNWEOHPSt111R0gq9paNNtBqZRiho1anHTvH
         PTnuekHZdBPLwcn6xrsysqC72X1L2BtoaYePBDdBh7CxeaurhIz2ceosBNysDuoZ4szk
         7wVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BAkjj9+k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5si23624127ybm.416.2020.07.06.22.18.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 22:18:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BAkjj9+k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsg0M-0001TU-3P
	for alex.bennee@linaro.org; Tue, 07 Jul 2020 01:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jsg0E-0001ST-S1
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 01:18:46 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49561
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jsg0B-0004JL-Sp
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 01:18:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594099122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:openpgp:openpgp;
 bh=SRsa8AgaoyTyG51Ddn4+2Fg+W04r3WA7ZEia0YrO/1U=;
 b=BAkjj9+k1KwzXXOIpG4C+rTbydDXbo2OUrVcXCmA9X/gjcXM+Hq7ETBlEq52iK/Vsl4YBg
 MtPzDR8v7FNPz4AzVRX2oJ4VXMfDnN2QJJqW41eO3KaXFYv77shzEgI9/CNewnp8sC+bEo
 40g4PVoVhex0h58ad/8MQdrDea64ysY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-eB5cHzUsN5KGjgYl19kIsQ-1; Tue, 07 Jul 2020 01:18:39 -0400
X-MC-Unique: eB5cHzUsN5KGjgYl19kIsQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 160D4461;
 Tue,  7 Jul 2020 05:18:38 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-77.ams2.redhat.com [10.36.112.77])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA3FB7890F;
 Tue,  7 Jul 2020 05:18:36 +0000 (UTC)
To: QEMU Developers <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Test failure with Smartfusion2 emac block (msf2-emac)
Openpgp: preference=signencrypt
Message-ID: <e010da48-cfbe-9616-d750-a922cb463a94@redhat.com>
Date: Tue, 7 Jul 2020 07:18:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:20:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pkjVL3BN1zvS


 Hi Subbaraya,

today, I noticed that there is a test failure with msf2-emac when
running the device-introspect-test in slow mode. Either run:

 make check-qtest-aarch64 SPEED=slow

or as a shortcut:

 make tests/qtest/device-introspect-test
 QTEST_QEMU_BINARY="aarch64-softmmu/qemu-system-aarch64" \
  ./tests/qtest/device-introspect-test -m slow

Then the test fails with:

Unexpected error in error_set_from_qdev_prop_error() at
hw/core/qdev-properties.c:1251:
Property 'msf2-emac.netdev' can't take value 'hub0port0', it's in use

Could you please have a look?

 Thanks,
  Thomas


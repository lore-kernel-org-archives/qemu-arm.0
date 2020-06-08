Received: by 2002:a0c:fe87:0:0:0:0:0 with SMTP id d7csp2048516qvs;
        Mon, 8 Jun 2020 04:40:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7RX+T5eUGgG2uoxqotx4ZUjiMjgsWpqqbQDsTIODD3bVSo0FEum9aYV1ZvJwkQ6ooKoQm
X-Received: by 2002:a25:4ac9:: with SMTP id x192mr39864512yba.172.1591616454210;
        Mon, 08 Jun 2020 04:40:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591616454; cv=none;
        d=google.com; s=arc-20160816;
        b=KhXQlIxiMJfOn9EdfQEIPOns4sioXtUj0ua5jxjiY3nSXutRZnFAf+RJFzSZ3BvtgM
         sVXWm/r2e/4+S/nYUf+RKzeIcveo3iCGnxHeqd2SR4D5GY7N5cBXkeZ8oUNKyATalF9Z
         sC2AZzJGaSnb/Na5TAhtd7q/hlST1BLbVLSo/esx41acUuzUGisRyvWHbfw4P0ZuTlbL
         lu2QyY4ICL/IX14n7CRlkOOfK8BO0zCao0Kb4v03hRo04mZsKu0LyQWopHXvfNB6t0tc
         Vznz8R57qOGPQ693YK8jWgublpkOMDPO7xWj8bCL48U6k/umNbWk2Y6/VMptsuxv9TBi
         FkMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=j5UtYOhp6/GoKwnx2MtNQCzJMyI+rDSpVdvwADTk754=;
        b=KAXKPlF9n3UZkDzFiPgDfZ4aNEPXzefg2Z6JqpgmETCjw/Wph30p42kUtyBMc0SQm1
         9dHd6oB1XPALTVE5JyfCZtfTew3cYr4YDckhBxXt1eV04237e88OzbP+XnEFts+8n5Si
         Jp/q8b0zRklrHWwDW9k+FEWK6VpmhZJWQ/aeRvyJne9yh/a0HLmTAFvW5sHK4xPiv69p
         dTgxhb743HlycCS0MWzaTF+chMEJBgVneI1j31tT8oQPe4/D7Nhd9xeKVIHnfbqGpkiG
         R5+Jva/7goZDhAqFjnZOUu+VUWYdEy81G8qYiz8AwRtaAav2WwKs2KoAezXPQrBVvdRN
         1dVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=kGYvFTnd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si7944126ybl.92.2020.06.08.04.40.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 04:40:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=kGYvFTnd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiG97-0008Af-Fa
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 07:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1jiG8n-000870-T7
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 07:40:33 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:34101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1jiG8m-0003cT-IH
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 07:40:33 -0400
Received: by mail-wm1-x344.google.com with SMTP id u26so14085997wmn.1
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 04:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j5UtYOhp6/GoKwnx2MtNQCzJMyI+rDSpVdvwADTk754=;
 b=kGYvFTndVUoixHaTQNiGWVM2XXFajezAKBT6qIS5cdyzyvuWXrGfLTaQCjavbfWcSi
 2gc2W7p/4twtfTuHe8v/E1REX3wWbLb1n/y0KnndLvZ/m+JnPk5WYowKvtwZ252FBoT/
 w/O5cqVuI7Pr+JuPkgrUZ7J1STszaPzHS2sxmBkRn/3fW8odmWsaOtDlzChI8fp67s4e
 mW4hy2fccC3idspT71qt3VoW26V2e1avwKtaTbmRD8uzTYgb9bZI2rVvfLyQZLJmXP26
 Hs/z4q7/NqBpM7UybZHUpVt+kA+fHPv7iAu4I1FFjX2yFWpvevVWJSASIUB92W4tf0Qw
 FyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j5UtYOhp6/GoKwnx2MtNQCzJMyI+rDSpVdvwADTk754=;
 b=Ytbt7T23mv43uptp0sEptxvrJZBWLkAFknW1X/WhZjBWTUvHz1jFhNCIqkFOTHavru
 QNExKqh+oSrnyzJXwSPk24MzZkwRxPFpCRtlJQwU5ilcfAhm+r1xqpm2b8NGmZCWImoU
 Qv0TW6vGJvbNKHcSwwpX0yK8p48753GMwnUABBOWcx8gAIA1JhMk1NqSZ5o0MI/IvRlR
 BLSKC9EzNMxBGJ9tVHElcADw0oaN+ntY3IpFlVxd2yGNRMC2z1XW8w8gHCs/+q5W5dNr
 4qxYHwQysk0KgWszNxpnkstgOm1lxzpABu6Z8hs+lQpxzqIGxcLiuUC56IaSUJBC/lwy
 PhFQ==
X-Gm-Message-State: AOAM530rHlrGx23OZueAtodTVYt3vco3v5Ve/9uhI3WEvhaRqX61/V2T
 Cn1Yd0yWkXi5lqtKkpe4MQCCDA==
X-Received: by 2002:a1c:2b01:: with SMTP id r1mr6905735wmr.26.1591616430263;
 Mon, 08 Jun 2020 04:40:30 -0700 (PDT)
Received: from vanye.hemma.eciton.net
 (cpc92302-cmbg19-2-0-cust304.5-4.cable.virginm.net. [82.1.209.49])
 by smtp.gmail.com with ESMTPSA id y5sm24225932wrs.63.2020.06.08.04.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 04:40:29 -0700 (PDT)
From: Leif Lindholm <leif@nuviainc.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [RFC PATCH 0/3] target/arm: move common aarch64 init to helpers and
 make cpu max standalone
Date: Mon,  8 Jun 2020 12:40:25 +0100
Message-Id: <20200608114028.25345-1-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CzsEWf3fjV8q

As a follow-up to the thread that started with
https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg01018.html

Most of the a57/a53/a72 init functions is currently identical lines,
with some individual options set up differently.

Some of that duplication can be considered to be likely to apply to
any (or at least the majoroty of) aarch64 processors to be added in
the future.

And finally, the "max" cpu init function currently calls the a57 one,
with some non-obvious side effects including:
- cpu dtb_compatible string set to "arm,cortex-a57"
- kvm_target set (to A57 value) in tcg mode
- id_mmfr0 containing a value present in real A57 cpus of the revision
  qemu emulates, but banned by the architecture specification
- emulating implementation-defined cortex cp registers

This series:
- Creates a common initialization function for all aarch64 cpus, which
  also sets up the MIDR.
- Creates a common initialization function for the cortex cpus defined
  in cpu64.h.
- Detaches the "max" cpu from the A57 init, making use of both of the
  above helper functions.
- Can definitely be split up into additional patches (especially 3/3).

Leif Lindholm (3):
  target/arm: commonalize aarch64 cpu init
  target/arm: move cpu64 cortex processor common init settings to
    function
  target/arm: use cortex...common_init for cpu64 max

 target/arm/cpu-qom.h |   3 +
 target/arm/cpu64.c   | 155 ++++++++++++++++++-------------------------
 2 files changed, 66 insertions(+), 92 deletions(-)

-- 
2.20.1


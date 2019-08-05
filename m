Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3967964wrv;
        Mon, 5 Aug 2019 06:10:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwfz6bxLiwpvhuPPuiz6kpcjpRMNgkgbLl17XcunyonzyVjlGVPWJ34or5+S28IuK9pH1g0
X-Received: by 2002:a50:ba19:: with SMTP id g25mr133144099edc.123.1565010605831;
        Mon, 05 Aug 2019 06:10:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565010605; cv=none;
        d=google.com; s=arc-20160816;
        b=XCkeiyr022w8sKPYwmmiAJXzCXPDnwekZmrFJsPzKIOEMEPugfICrh792jGTwrj6Yl
         pWh7YPvPL1qQFWn1bhwohUFxGxt1x8vNsVWuxnnRS6VE+2WXjv+CUT9Dj7QIm77KSmn9
         CNj1mBNcSfNQ0x5yXttOCHlwZwVEvCBSETGH+DxkxslfzFWXDj8et1MHitUD0Sgv1sMx
         GDd5njBdjoFWdogqf2LqpMi1KmiO1W7//TStiQBUE+jU/Y8Fq54gQVhvhcUb8W6oMHOx
         9gC6m6QsF/0UAV/B+/0MvZb1nHKcklXBtjkxruejSM/z6IW20VUJjYUZjDncyAZG2iWd
         iwew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=PfycPF5aiJmuNstFajU/Uk41X7HWSjK63QrpgD0M47o=;
        b=Nr8Lr6723qjiPZhwjUR6NxBz/uDIWHBZDZLoabBgiXuno0jUo2zH2xj7On7OEOLII8
         BAQ4nvY0rLnODVYAlTxbvfY8RptVuuwSEKEFB4z6nFps4LWmnJrZY5gTT60uGOvIrJRE
         zYJrn/so2UmX3MuafGGsHPR6STm9K7KG+r4FmuuOvrpdvpOGF/T2oDOGiY0+xSuqPrNK
         neuVvssdBHhuFKEjTZVUJWrI5bBH8pmmjvzPm6E1MHyXEr/sRlchl3pBxF1CqMAN+LXd
         pEEzgQ+8nu7e+whQ9KkYc9M7ANWYsPeAlLepVDlTC95twki52++VexT3UlOVJobGv0mH
         9FnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="TGyUpmg/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f58si28652962edf.135.2019.08.05.06.10.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Aug 2019 06:10:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="TGyUpmg/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1huckW-0000Yx-VT
	for alex.bennee@linaro.org; Mon, 05 Aug 2019 09:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52725)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1huckP-0000Ye-GM
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 09:09:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1huckO-000471-DC
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 09:09:57 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:41139)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1huckO-00046I-6z
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 09:09:56 -0400
Received: by mail-wr1-x444.google.com with SMTP id c2so81136710wrm.8
 for <qemu-arm@nongnu.org>; Mon, 05 Aug 2019 06:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PfycPF5aiJmuNstFajU/Uk41X7HWSjK63QrpgD0M47o=;
 b=TGyUpmg/2kGRs4D2xVOEN1JtsN9P0F2e4WjLrFWEDIm1c5UkX4J+wzIItOSMU46GSP
 v9fHjy7vrIAqtDbbU58pA80IAiTZzLGjQcbOn8xzzLOMseZ6CezxMDFzdxXeC9cmaWQU
 Q/Zs8zTWiH4myFzQ+CZ5nuyBdyR6A5JUOz5QzloIY/kKaqVC0lhwvDZ/DVYXVeLH0ba0
 kwDkOfOwZZg66tolcbzmeIAedFADhYwk0HQJ3rCB6xkChQMAgtTM9l1BHMmxe3dmEYM7
 k1Oq9VKgB5Ocz2s1TOR4+RPpt+CCod4dnA8hQ82vQPXQEpDnU91mxs14E2NIrb/W2jFj
 1ojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PfycPF5aiJmuNstFajU/Uk41X7HWSjK63QrpgD0M47o=;
 b=EI1lrINpEUjc0o0LLhmgbqKeyP62Y6XoBSJrJ1bJZ9PVyC53P3Q0J5qfHJd+b5pF75
 1pRxFoxZx5SEA1c4DWYhUzig/cjYL+wpcYBbOMFyDtSoNnfdNHE6VNMh/1BKFLlNE6Nl
 bW/H1nifQv/kN4rj9rGw2tiV3ZYdM/egg6zTFLENn2W4fC2/TzCW2C4FJgBVuhrF1W6R
 tlc+1TpmUTPDVs9KUfv4npp62c4JHzMTjm5KkRQH7woEeyaqUG3HubjFb6XQR4zd0MUy
 KTGRZrVnJNGnWgxsc3O7nUL3FgOaktrjELcrorRhsO3Mzvx3m/tscfjKrCFGdGC51+H9
 LklA==
X-Gm-Message-State: APjAAAWenzTrgkeauShIqac4UiJ34LwXVW9rVkzkNi+nKNSxr2+k57ce
 r8oxEPzeLjx4aE/zERDRbrzxHiKer8Gtcg==
X-Received: by 2002:a5d:4950:: with SMTP id r16mr59897575wrs.136.1565010594873; 
 Mon, 05 Aug 2019 06:09:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x20sm65233782wmc.1.2019.08.05.06.09.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 06:09:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  5 Aug 2019 14:09:50 +0100
Message-Id: <20190805130952.4415-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH 0/2] target/arm: Fix routing of singlestep
 exceptions
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +ggfcdZofyty

Bug https://bugs.launchpad.net/qemu/+bug/1838913 reports that
when doing architectural singlestepping we send the singlestep
exceptions to EL1, even if the guest has configured the debug
exception level to be EL2 or EL3.

This patchset fixes that, by putting the debug target EL into
the TB flags and sending exceptions there, rather than sending
them to the default exception level.

Patch 1 is a preliminary refactoring out of the "generate the
exception" code into translate.h; we then have a single
place to do the actual fix, which is in patch 2.

(This bug has been present for ages, and it only affects
guests that try to do debug to EL2, which is pretty rare,
so it's not 4.1 material, especially at this point in the
release cycle.)

thanks
-- PMM

Peter Maydell (2):
  target/arm: Factor out 'generate singlestep exception' function
  target/arm: Fix routing of singlestep exceptions

 target/arm/cpu.h           |  5 +++++
 target/arm/translate.h     | 34 ++++++++++++++++++++++++++++++++--
 target/arm/helper.c        |  6 ++++++
 target/arm/translate-a64.c | 21 +++------------------
 target/arm/translate.c     | 24 +++++-------------------
 5 files changed, 51 insertions(+), 39 deletions(-)

-- 
2.20.1


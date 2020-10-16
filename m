Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1881371lfa;
        Fri, 16 Oct 2020 14:08:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQE78qi5o4ArzFfAdxdfNq8ZJEi0NKkZ9chXLwMS9s+VEkejMSINESB0OAXBnS1oLhlUkh
X-Received: by 2002:a25:cbd3:: with SMTP id b202mr7775564ybg.354.1602882492234;
        Fri, 16 Oct 2020 14:08:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602882492; cv=none;
        d=google.com; s=arc-20160816;
        b=tNWV92xPrOFBYDei7fX6hfSJ3A59ke8t93QgZEe9+xwcCuey/7zkdEdgi5RBcW6G4M
         M11hFVUnjxLsX9xoveVZHBv5H/HxWVlTVQq5Bs/vKQ/UIDoLEwY0JfzeYZZm0Sa0ANEY
         GA0kYJLD4VT+X/JXX2CWJ65IC56eElM5zv3VUBToxHL37+j/4LGujlD4tlyGnVGm8/8W
         BivGDy8QrR24RWmg2HVZllTkDnxB+zOjbWmWvoK+EEspVKJC5NSjTfAwicmaUbaOwPxW
         /QNmT0SgOBGUjYJducUfj0FwtREwaBOuVcieYtRo9IxJElD8WYCkyHF7fYWYU7xxaWtM
         aR3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=jQCSNzVeKgIz3DsvHFInGHF1+/bkC3/zlpckGJCVxsE=;
        b=bIiXg5a108MZhDJWPSaPyG4G1r/dcJ4u9q+eCEe18qk0Ltdsybzc9ekHC8zQnrS/Ep
         u2AZcTEnc+GTj3TtL55nE8TK+ojhiAc1FlaJcOYzxWCLY5vSg7PekMeioGOA9BnXmuWJ
         bTpk5zG1PxnNQx/8KAQi6v4VGP+vBnFK4PaM2NjLctbbjFeQ3iw/STB68Rbx3hioT36B
         OzVA1uITytr8jD5Eu3CevUP+S26s/d3z5yvYHKCjuNEUT9iaYe1K+9YLmzWgMZRIIWFY
         sv57wbqeLxfV7CRhn6VtJzqBtWIGak4UTSPbcxP4/ZpCyQJQ6FsZphL/9BzaIr+3WQUd
         9jmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OYgwZhxN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i17si3553299ybm.64.2020.10.16.14.08.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Oct 2020 14:08:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OYgwZhxN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kTWxP-0000bd-Jy
	for alex.bennee@linaro.org; Fri, 16 Oct 2020 17:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kTWxE-0000bC-7H
 for qemu-arm@nongnu.org; Fri, 16 Oct 2020 17:08:00 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:50933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kTWxC-0004my-8L
 for qemu-arm@nongnu.org; Fri, 16 Oct 2020 17:07:59 -0400
Received: by mail-pj1-x102e.google.com with SMTP id p21so2035394pju.0
 for <qemu-arm@nongnu.org>; Fri, 16 Oct 2020 14:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jQCSNzVeKgIz3DsvHFInGHF1+/bkC3/zlpckGJCVxsE=;
 b=OYgwZhxNng5oF5XObhBZpIogT1GpmN2HUH4n9jxalCy6WAhNrZkifG7TAdAaj5gCE/
 xyJ6BqXNgAdGam1lIAsWaNF8HvNymWw7+mrA2oPPgqFkULSsucnP0LhEpsriuhoUc3f5
 X+Q8PhAo6in59qaRzdcvm4URxABoPpztIzcaqICtJgzhvJOAmCRYUy17Ss+uwIAXSd22
 6XkbsudCBLxfH4oQ7UkM8Kh3U6tM1ro3TEqXD+8mQIaDXose3fmox3cm1VTj5GQCAPzD
 AeIDaKskM0FwAzrTi48tG+NZna7Ogc6+3W9R+2lpQtsSE+8jh4mlQuntAtbGu5WM5AaR
 Xqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jQCSNzVeKgIz3DsvHFInGHF1+/bkC3/zlpckGJCVxsE=;
 b=Ec8QhxgLDNp/kbhGtKGH5E5DFA4apU7DWwlpD0XyD7dnw3y4qlU0RmUk0I39BN7bxz
 YjzjNHD/1gJvQHOFyj76k9rrM00KoDYwFxIW9RItpA2xbHvQgmhRqLmWO4F6aW17zHfV
 6LdVAmzkhpJ5hmNxywLKrkQgs7QaBZIu+TpYxs6yWxFsHDCOFDcFHJ7a3rEK7TX5QQtM
 vlAhuyALfxcWpCK2K1HvK7m6f/e6ec6hXJgh2lTsjOri9YfIy+I8CRvWJ+tb8YGQD6t7
 KEC2auBj4kjU8aKybWZXOR9Vt+cHCbGtHw5d/j6lYJ0sdArjWMgpDft/RC/1J0MosWiI
 Irtw==
X-Gm-Message-State: AOAM530Mn0mBHv2wYZusPM7FjJ+WDnm+ESQ0l8VIrOCcQJlapsOo7anP
 U/nWUUCW977xnkXH2FlWC9ZJGQ==
X-Received: by 2002:a17:902:c408:b029:d4:c99a:19e8 with SMTP id
 k8-20020a170902c408b02900d4c99a19e8mr6114985plk.8.1602882476617; 
 Fri, 16 Oct 2020 14:07:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 198sm3682324pfy.41.2020.10.16.14.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 14:07:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] target/arm: Fix tlb flush page vs tbi
Date: Fri, 16 Oct 2020 14:07:52 -0700
Message-Id: <20201016210754.818257-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5iL40D8IJFew

Since the FAR_ELx fix at 38d931687fa1, it is reported that
page granularity flushing is broken.

This makes sense, since TCG will record the entire virtual
address in its TLB, not simply the 56 significant bits.
With no other TCG support, the ARM backend should require
256 different page flushes to clear the virtual address of
any possible tag.

So I added a new tcg interface that allows passing the size
of the virtual address.  I thought a simple bit-count was a 
cleaner interface than passing in a mask, since it means that
we couldn't be passed nonsensical masks like 0xdeadbeef.  It
also makes it easy to re-direct special cases.

Changes for v2:
  * Add encode_pbm_to_runon/+decode_runon_to_pbm helpers (pmm).


r~


Richard Henderson (2):
  accel/tcg: Add tlb_flush_page_bits_by_mmuidx*
  target/arm: Use tlb_flush_page_bits_by_mmuidx*

 include/exec/exec-all.h |  36 ++++++
 accel/tcg/cputlb.c      | 275 ++++++++++++++++++++++++++++++++++++++--
 target/arm/helper.c     |  46 ++++++-
 3 files changed, 341 insertions(+), 16 deletions(-)

-- 
2.25.1


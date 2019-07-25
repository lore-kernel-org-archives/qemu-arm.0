Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10836364wrv;
        Thu, 25 Jul 2019 09:37:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxMVOUfc6WUVmfU3ym7xG08vN/sYVoDm+Of1lHuxBr8eyYOP9OSYh/DwvdsRofuG3FuI88g
X-Received: by 2002:a67:ad06:: with SMTP id t6mr57040016vsl.44.1564072642134;
        Thu, 25 Jul 2019 09:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564072642; cv=none;
        d=google.com; s=arc-20160816;
        b=l+oh4vLDsXxrhB0m1F7droHt24DICxLzXps+qIpyF+NzMAigPkxkPSM2a1u0RGjVvu
         LlIIwUQR/KOJW03oR3+3MxZ+lRnpF+0qRbTribI0TB/e3V37ISYBAWspnpNmKdVqGfp6
         rENYlNrxkTpANHiJK5KW0c3/PhZth/ogD/h56WMRVNkAvugkMkrL5RVnkPW+p+H5OnzS
         qmjs4J86awI0Rz1zjnylY+Ie8oLt2zLVcK0ujYnmENsC0VTrlRM3HIKF5aSSldXrj4xM
         RwUFyXXJAP2H3/VmeoL0RvPFtt4qA8u0N6OlkkXyRKDet4aMw5SBjXCGkOA2uNI/Ueyc
         fAhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=Tk0LtwKy0jceHpEn+y+gUC7C51j/o1ZSEntT/WnGK5s=;
        b=VSuChUrkPCFoHRVM8bjCcLFD5DlzaYMZ9jVGlWJnZVaRSSZh4qWGA24gjHz/o1UdBL
         N6dVfPAGuOMEeVVB1zwehZQJE5O/+nkZGlitLmeNbIO4Zml6Lvkumv2EqsOzhj4RxTJn
         hbKKrBk2CqvYfi7sBaMBX0AzgUycrNunyuQVydsnVktIrw2cXbm35SzKY/6h12EEUprQ
         GJFYwtolN2+/D3t2VZmSme3CLV3CBJB4zruIEc9YHjz7jCeQ6WSNj8RKVYuwx+fF0zR2
         2RDTcHjBaCOU3Br+SRfFG9u0fIbrvjfyGi8GCHVnFfgsR3oJJoyH6OxZOka0prc/JPI7
         2KDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yfHqX8oS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10si10335338vkb.26.2019.07.25.09.37.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 09:37:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yfHqX8oS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqgk4-0004c8-SQ
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 12:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48350)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hqgk0-0004bW-2x
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 12:37:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hqgjy-0007Dt-Tb
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 12:37:15 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46292)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hqgjy-0007BT-MQ
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 12:37:14 -0400
Received: by mail-wr1-x433.google.com with SMTP id z1so51454497wru.13
 for <qemu-arm@nongnu.org>; Thu, 25 Jul 2019 09:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tk0LtwKy0jceHpEn+y+gUC7C51j/o1ZSEntT/WnGK5s=;
 b=yfHqX8oS3fCh0CteZGN3uv0+S8jG2ZyXaM1BRKf4oXT4RzSVrb7pkXogYlnCxIhOou
 QwvUfOSVxPNfLrWNg/thbRJ67xFh1vgGp4mppArPKdXXwLEBIOalqPCOrw2rPPxHcv0+
 1RaC7MPGxs5Yk6UfuD9lcjxpx/uaKGVo3XerqyUBg/n9RbJa777ISON3AHRYia0qh0o+
 oQRqoqVoOWuEnU0enxLg/ECxOGA7ywlnDtZzjNImXYc07C3EAS+zm3xrmdWrGGpq7xJj
 wnHJiNo/8M7uPWlq+u3x9Metet/0itFz8HdbD1PmaGXY0+KRpYVILnrYFhqxNDpQ1tyo
 VcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tk0LtwKy0jceHpEn+y+gUC7C51j/o1ZSEntT/WnGK5s=;
 b=PFAtI0szjH1//OwmvZCF/mZePC/5K0g+6DeqJl8ndGFGdISRXuRcv19EOhC96mvZ+N
 fcmGpI6x59PEx+VxicXgunnVPEqSeVncAKrTUxL9gkxWvoN+nAhWVCZEHimC72sIySoV
 wt5tMAic4cvIyg0mI9xGILbzlBgnAJqqJgDlzia/u7UtcCfJwlwys/t00fFuZZSgp4Eu
 mW84wejBvmCKOks+mNpCbClGlFUWj64gfBa4Q2vkFoSOobe+F0paDaOdLg4YPeQwo9CB
 C8oXahW4NIOlO1RycWl/8J0pl9HGYSbq0jXwQcZo0ubknLWJTE8tcyVt61FpsfAXs7na
 KzEA==
X-Gm-Message-State: APjAAAV3LGO+sJT1eyIgg5SGOoV7JYNAyeUnWoaezdsW919owgPGEeXk
 foxTFpg2usvXlwuw4mJoLNPizM4EoXrJcw==
X-Received: by 2002:adf:d4cc:: with SMTP id w12mr97971745wrk.121.1564072632809; 
 Thu, 25 Jul 2019 09:37:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c7sm44125140wro.70.2019.07.25.09.37.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 09:37:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 25 Jul 2019 17:37:08 +0100
Message-Id: <20190725163710.11703-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::433
Subject: [Qemu-arm] [PATCH for-4.1? 0/2] Typecheck VMSTATE VARRAY macros and
 fix bug found
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rj6y3sVI5AB6

Damien's patch to fix a pl330 vmstate mixup between
VMSTATE_STRUCT_VARRAY_UINT32 and VMSTATE_STRUCT_VARRAY_POINTER_UINT32
led me to think about whether we could catch that particular
mixup. It turns out that we can, by adding a type check that the
field given to the macro is really an array of the correct type.

This only found one other instance of the same bug, in the
stellaris_input device; patch 1 fixes that and then patch 2
is the improved type checking.

We should probably also go through and look at the other
VMSTATE macros that use a raw 'offsetof' rather than one
of the vmstate_offset_foo type-checking macros, and see if
we can add type checks there. (Documentation of the macros
would be nice too...)

I've marked this as for-4.1? because the stellaris bugfix
definitely seems worth including in the release but I'm less
certain about whether to put in the typecheck -- David/Juan can
decide that.

thanks
-- PMM

Based-on: <20190724143553.21557-1-damien.hedde@greensocs.com>
("pl330: fix vmstate description" -- otherwise the new typecheck
will cause a compile failure due to presence of the bug that
patch fixes)

Peter Maydell (2):
  stellaris_input: Fix vmstate description of buttons field
  vmstate.h: Type check VMSTATE_STRUCT_VARRAY macros

 include/migration/vmstate.h | 27 +++++++++++++++++++++------
 hw/input/stellaris_input.c  | 10 ++++++----
 2 files changed, 27 insertions(+), 10 deletions(-)

-- 
2.20.1


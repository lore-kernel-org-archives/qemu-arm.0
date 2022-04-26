Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp341322lfu;
        Tue, 26 Apr 2022 09:09:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNQDIlmdvJtQidoclIGep9VWZ+M1FY+vdEx7Cy9iTIfG5D2ukrOOGtWcmvI01OWYMIB173
X-Received: by 2002:a81:69d6:0:b0:2eb:3509:a781 with SMTP id e205-20020a8169d6000000b002eb3509a781mr23196786ywc.18.1650989387934;
        Tue, 26 Apr 2022 09:09:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650989387; cv=none;
        d=google.com; s=arc-20160816;
        b=kzITjku+UJ0M4mAytwcPL0t5rpUBvU1FpU7aP5jMdQejxJlKlxn+dsrN6P+KQJMLv+
         CE6BACImC+x8BP3xXcui+nighPW7fIry4t7kdu6DCXfEYIcSiNYzgkeXBP0y3cXaKDhH
         D5o4CpGNVKGTRybSTkEbU8MUwP1Ebe3fuBz69ympDxamy9UVtzb/BOHQeX1nt/CkVlvl
         WTPEbGeYnxpW/SzvCPbdjQ2YJhVvMyEO24p5cC4U9FVi6AyyM/e/zDzLELqt/begt+9K
         hb/0sg3ICLlCtnf0tJOJx4I6yeO1ot7lh8YZ39Yn0lyT0QRWuHuARvngxuFJFGjhBQ58
         ZfKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ZLGnZUICUDe3aOvIAsBCwp086YQ3oHyKx0VaPepLph8=;
        b=uTRgzkLBEeBLdeNuPS1DbzS6Y9fnk3W4OM6XIBhybQ2t8ECsZJMlcOTUM5YzbKfkrq
         hTcVkTdxRP0mUrI9TWuSTWpJaSvTU+ZiG/KBg34GS4mQIq0wwp3RfRD5hfZoD/68Lyek
         JyY/zqrZN0YcrqUKPm6AvE+ZITIBewCdDgw/hs5k+Ug/USnnJ8eo/37nGEPXl+tCcM9/
         u05iJ3n3Z3DE3j+w63WjAf/8eY/UYvPBitG/qTO7h+0XnD6luvGBLeXRKE1kxuJh+0LU
         r1WHEWg885PJDOMNWFQtRegQX+aj1E3Cc+AE8a9TiwnRlyeQZe7J9aaD/6gbOyna4qHw
         kULA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nPK2AaVB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g206-20020a2552d7000000b0064840658a96si7206416ybb.95.2022.04.26.09.09.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:09:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nPK2AaVB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njNl5-0006aH-7I
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njNfw-0006QF-O4
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:04:28 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njNfu-0007nh-9Q
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:04:28 -0400
Received: by mail-wr1-x42d.google.com with SMTP id e2so19859503wrh.7
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 09:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZLGnZUICUDe3aOvIAsBCwp086YQ3oHyKx0VaPepLph8=;
 b=nPK2AaVBfRuTK9wg480obQQ4+5MhI/3a49b8+x/HsM9YoYF8DwFSSYoWmZOk1ICnnD
 XTqdSGlWmtZTgzLDwojXp/da0lh7e1dcgaSNZrMGlRp0b4UJ35Y1fN+UxQLJuf8nJGil
 g8CvW4n6QCCX1EzdwFdmsRBv2BNf1A1XTQz7NwCfRn1hG94iN2yv1FOLOQ+zpInHJjFh
 6ukaWRFIAOBDaLbzqgUU6f32jWdQpbpQpupUGvAaR39QY7MIEoLUliM0IgZ7yAYzbKmO
 XH3+ZFzbSqt7XGU3J8HE58z8bU/2ihkadCdT7lfhcVhOA5GZwP21V6jCPuAU2g+HUdan
 Leyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZLGnZUICUDe3aOvIAsBCwp086YQ3oHyKx0VaPepLph8=;
 b=b8Gi3AIjs0wsbOFpI5Q7KOtkpmCv2Ry2iEg0+/q+9V0ScP8N8j2AG3D7MIh7X/mKPx
 qfih6lc5oLy3AgQ8U1j9mm94MNWazkCY7tRExokmA1QS710ZCpNq7jXA7Xys1J+XIKjc
 FxFoOK4s0s3Hgd+l2BOtyQa7yZuW7bstH6VpZRC+23rEBHaaPCMMoSJvLWEVf7vGTEYK
 654ztvHevzZ206e2wgCpP9aNu8nyQ8K0dQmhUUyeJSoiBz75GfhtyZmUwz/MpPy78iV7
 pkdqrgp4VcpEXjwCX37gZdc+BeS1Dg+PDfjLX+XpmbpwV7PfXcnGz6tOm2mMQxNr8r1R
 UB0A==
X-Gm-Message-State: AOAM533QWGzL4De49Bax0w5SDrP5ih+5iDBqk2Cg/ka05lEqEpSodUlE
 9QxzMlDmsyuJ0xMBJ42ha/+lAv4o4kZXdg==
X-Received: by 2002:a05:6000:1e0a:b0:20a:be24:3de7 with SMTP id
 bj10-20020a0560001e0a00b0020abe243de7mr18578334wrb.109.1650989064393; 
 Tue, 26 Apr 2022 09:04:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p26-20020adf959a000000b0020aca418f14sm13584777wrp.54.2022.04.26.09.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:04:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/arm, hw/arm/smmuv3: Advertise TTL and BBM features
Date: Tue, 26 Apr 2022 17:04:19 +0100
Message-Id: <20220426160422.2353158-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s4aiKyrrk2EE

These patches advertise support for the CPU FEAT_TTL and FEAT_BBM,
and for the SMMUv3.2-BBML2 which is the SMMU's equivalent to
FEAT_BBM).  For all of these, our current implementation is
sufficient to allow us to claim support, so these patches just set ID
bits.  The bulk of the patches is in the commit messages which
justify why this is OK...

To start with the simpler one, FEAT_TTL allows the guest to provide
an optional hint in TLB invalidate operations about which translation
table level holds the leaf entry for the address being invalidated. 
Since we don't need that information and we correctly ignore the
field that holds the TTL hint information, we can safely advertise
that we support FEAT_TTL.

FEAT_BBM is the complicated one.  The description in the Arm ARM of
the requirements of FEAT_BBM is admirably clear on the guarantees it
provides software, but slightly more obscure on what that means for
implementations.  The description of the equivalent SMMU feature in
the SMMU specification (IHI0070D.b section 3.21.1) is perhaps a bit
more detailed and includes some example valid implementation choices.

The informal summary of FEAT_BBM is that it is about permitting an OS
to switch a range of memory between "covered by a huge page" and
"covered by a sequence of normal pages" without having to engage in
the 'break-before-make' dance that has traditionally been necessary. 
The 'break-before-make' sequence is:

 * replace the old translation table entry with an invalid entry
 * execute a DSB insn
 * execute a broadcast TLB invalidate insn
 * execute a DSB insn
 * write the new translation table entry
 * execute a DSB insn

The point of this is to ensure that no TLB can simultaneously contain
TLB entries for the old and the new entry, which would traditionally
be UNPREDICTABLE (allowing the CPU to generate a TLB Conflict fault
or to use a random mishmash of values from the old and the new
entry).  FEAT_BBM level 2 says "for the specific case where the only
thing that changed is the size of the block, the TLB is guaranteed
not to do weird things even if there are multiple entries for an
address", which means that software can now do:

 * replace old translation table entry with new entry
 * DSB
 * broadcast TLB invalidate
 * DSB

As the SMMU spec notes, valid ways to do this include:

 * if there are multiple entries in the TLB for an address,
   choose one of them and use it, ignoring the others
 * if there are multiple entries in the TLB for an address,
   throw them all out and do a page table walk to get a new one

QEMU's page table walk implementation for Arm CPUs already meets the
requirements for FEAT_BBM level 2. When we cache an entry in our TCG
TLB, we do so only for the specific (non-huge) page that the address
is in, and there is no way for the TLB data structure to ever have
more than one TLB entry for that page. (We handle huge pages only in
that we track what part of the address space is covered by huge pages
so that a TLB invalidate operation for an address in a huge page
results in an invalidation of the whole TLB.) We ignore the Contiguous
bit in page table entries, so we don't have to do anything for the
parts of FEAT_BBM that deal with changes to the Contiguous bit.

Our SMMUv3 implementation  (unlike our CPU TLB) does allow multiple
TLB entries for an address, because the translation table level is
part of the SMMUIOTLBKey, and so our IOTLB hashtable can include
entries for the same address where the leaf was at different levels
(i.e.  both hugepage and normal page).  So here we rely on "pick one
of the multiple entries and ignore the rest" being a valid
implementation.

FEAT_BBM level 2 also requires that the nT bit in block descriptors
must be ignored. Since commit 39a1fd25287f5dece5 we do this for
the CPU; we always have done for the SMMU.

So for both SMMU and CPU we can advertise "level 2" BBM support.

(Note that we still can't yet advertise our SMMU as an SMMU v3.2,
because v3.2 requires support for the S2FWB feature, which we don't
yet implement. I might look at that when I do the CPU FEAT_S2FWB.)

thanks
-- PMM


Peter Maydell (3):
  target/arm: Advertise support for FEAT_TTL
  target/arm: Advertise support for FEAT_BBM level 2
  hw/arm/smmuv3: Advertise support for SMMUv3.2-BBML2

 docs/system/arm/emulation.rst | 2 ++
 hw/arm/smmuv3-internal.h      | 1 +
 hw/arm/smmuv3.c               | 1 +
 target/arm/cpu64.c            | 2 ++
 4 files changed, 6 insertions(+)

-- 
2.25.1


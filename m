Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1317669lfb;
        Tue, 12 May 2020 09:39:18 -0700 (PDT)
X-Google-Smtp-Source: APiQypI0fwVCVRxEOhOh9j3cXUtIgm1LnVNAFL79H97oGfsF0DRr9UvxjkKrlRPmmXrS+AWkZTw8
X-Received: by 2002:aed:2843:: with SMTP id r61mr15346033qtd.349.1589301558600;
        Tue, 12 May 2020 09:39:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589301558; cv=none;
        d=google.com; s=arc-20160816;
        b=cKNVWqT19Ho1XrUJdV8CNNHyOK43gjfFizFysbW/4nlR4ykUMhEtcj0X0ciW9MPc/t
         Nx79FVQ7kBrmG7DpOJ1sDbpTP4pVC+pDz/HC4dwGzHFC7goP4AW7WC78W7+AVP3zl1Jv
         7pTkiXqJJrT76ZWfbkVZ07/spHFPdPRIans6xm/eEuFZjbcKfoxcpXrWS2OPUM2sSDJB
         XZVV/h6OXA3KFbwiPNIBNy5vzQGTv9nfdWelZhtYREt9a5v0CPtHN1OpHeeHyPIi4RSv
         F4UC14ZOF/70AnEt5LjD00qhCEWsYwyZ3s9dmaGzxZXJGkhBT6Tt1zpBBiMGSZazKkNy
         QUTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=y9FKmH11fW+PJwlUH1phqvbD/5vZmoJNtxztGQmDla8=;
        b=T4yFtRCwKzzKEniGaZ9iIrjyJ33tcU/ARZVYECnv4I+StqYoB+g+OH3QpOhgcE859x
         bzXFuAxw+EGL4th1wVz68TCbM8MVNrzWnbzZkTGcP4D3WIhTNcDFNLzv7WUIdmsaa9xc
         mY5Wf3TYd9vj01/+8Y3nu62vjPismyjywGQbdQtV8JDBc6DCTSLSJ0MOFTe/cJab+zmQ
         UPZZ/j89eBzho+8lfoUHfLnqtqvZjMbhbcaylPDCFduRJeu2YGkVKlaUH/P/YHsGUPG2
         Gx+GFVb211jjzNk850fu6m/THVQgY/zs9+LRJYZei9D/4mkhNnEIhRnBKTN0YwiUBmFI
         iw+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=scwn7P6r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v53si4957596qth.394.2020.05.12.09.39.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 09:39:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=scwn7P6r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYXw5-000696-Sf
	for alex.bennee@linaro.org; Tue, 12 May 2020 12:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYXvx-00068m-SS
 for qemu-arm@nongnu.org; Tue, 12 May 2020 12:39:09 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:42657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYXvw-00060S-TS
 for qemu-arm@nongnu.org; Tue, 12 May 2020 12:39:09 -0400
Received: by mail-wr1-x444.google.com with SMTP id s8so16302931wrt.9
 for <qemu-arm@nongnu.org>; Tue, 12 May 2020 09:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y9FKmH11fW+PJwlUH1phqvbD/5vZmoJNtxztGQmDla8=;
 b=scwn7P6rRRugQ9MXOhXHKmbNKPx8pEm7X6VpdnQdVTC4GSSBtD+iejTXQkFT0VCnsE
 xl61oj39/YQ92/CalhVGOkqZQFvOA/Qc5yt6NU+faIYIqq/faI+edonziiin5dgPiuuZ
 YzfNoo9YUfLWt+XDkqbJB7jFIS9GGLV711xLGA22iCjtzb2DVy4/XMEzXkIa96IB6Lna
 EpnoCkP52XKXlsDJiwuqVNTLbbBbC/U8onw+fUiHzzTCyUSlncC2kSRrOb8/lphEGooU
 BNr32gfyc1XEjM4CSvxjrn8qFXIpGtgQgsqkIJn06/pC2+SiVemsIwyn0o0+2QCOmoSF
 Us+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y9FKmH11fW+PJwlUH1phqvbD/5vZmoJNtxztGQmDla8=;
 b=PDp6metWAOc0157q10KjSEXtdMrwRFoMgDUjBrjyYR9H0rYrh1Id9Dw6Y9lnisTMbt
 hjhzHJEEhzFZqNzGKAZVPSoPpYh7VLL8ZbKwkIOE6uF4kF9KALC0Rs2qhHeq/dcPZO65
 Pm+JMdfzENJ0ftHfvOQs/xd034lOKlkLc45Ky8eTa3kB9DgU7gmrXYAqrUZ3sEkp/PG5
 b8lr6l/P3PkLonCLNPJxUp+yJhKwYgEKg5z8yGSySBSjxnAMiz8uydmB2mXFYWiJvwgj
 b3KrbLVBMiW2Sr1bgxw7Ve+Ay64aGVfMwExbCM4HpO1wQaGJCuSIf3efRaxpGQZGlfgT
 EbBg==
X-Gm-Message-State: AGi0PuZ7lsr2diTIW5vbeC2vc/8E1gQs9hRLKH/McgGHpdZ/f90q265E
 NiLsfC5Ll+eULkzO+kGucUISTLcBumB78A==
X-Received: by 2002:a5d:694d:: with SMTP id r13mr15447112wrw.238.1589301546779; 
 Tue, 12 May 2020 09:39:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o205sm18525981wmo.32.2020.05.12.09.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 09:39:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 00/17] target/arm: Convert rest of Neon 3-reg-same to
 decodetree
Date: Tue, 12 May 2020 17:38:47 +0100
Message-Id: <20200512163904.10918-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QzwXonDmtfuU

This patchset is v2 of the Neon decodetree conversion. The first
half of v1 is in master already, so we're left just with patches
converting the rest of the 3-reg-same Neon dp insn group.

Based-on: <20200508152200.6547-1-richard.henderson@linaro.org>
("[PATCH v3 00/16] target/arm: partial vector cleanup")
Strictly speaking, based on that with a fixup for the VRSRA bug,
but I think patchew should be placated by that based-on tag.

Git tree available at:
 https://git.linaro.org/people/peter.maydell/qemu-arm.git neon-decodetree
with the whole patchstack including RTH's series.

Changes from v1:
 * the first 19 or so patches have been upstreamed
 * patch 1 (VQRDMLAH/VQRDMLSH) uses do_3same() now
 * patch 3 (64-bit elt 3-reg-same): shifts now use a format
   which swaps Vn and Vm in decode, so we don't need to special
   case them in the C code. We also use the gvec interface
   rather than hand-rolling a for-each-pass loop.
 * patch 4: make DO_3SAME_32() handle just one trans fn rather
   than doing both _U and _S in one macro invocation.
   Use gvec rather than hand-rolling the for-each-pass loop.
   patch 5: (vaba/vabd): new, since rth's patchset rewrote how these
   were handled and they can now just be handled via DO_3SAME_NO_SZ_3()
 * patch 7: saturating shift handling rewritten to use the gvec APIs.
 * patch 10 (vqdmulh/vqrdmulh): rewritten to use gvec
 * patch 11 (vadd/vsub): rewritten to use gvec; vabd now in an earlier
   patch with vaba
 * patch 13 (vmul/vmla/vmls): vmul uses gvec; do_3same_fp() and
   DO_3S_FP() now added in this patch as it is the first user
 * new patch 15 making recps_f32 and rsqrts_f32 easier to use with
   common gvec APIs and macros by moving the 'env' argument to the front
 * patch 16: updated VRECPS/VRSQRTS code to use gvec

NB: I have not attempted to merge VQSHL_S and VQSHL_S64 into
one pattern in patch 7 (as suggested in review of v1) -- adding
yet another DO_3SAME_FOO for the case of "64 bit and 32 bit
can be done with same trans/gen fn" didn't seem worthwhile.

thanks
-- PMM

Peter Maydell (17):
  target/arm: Convert Neon 3-reg-same VQRDMLAH/VQRDMLSH to decodetree
  target/arm: Convert Neon 3-reg-same SHA to decodetree
  target/arm: Convert Neon 64-bit element 3-reg-same insns
  target/arm: Convert Neon VHADD 3-reg-same insns
  target/arm: Convert Neon VABA/VABD 3-reg-same to decodetree
  target/arm: Convert Neon VRHADD, VHSUB 3-reg-same insns to decodetree
  target/arm: Convert Neon VQSHL, VRSHL, VQRSHL 3-reg-same insns to
    decodetree
  target/arm: Convert Neon VPMAX/VPMIN 3-reg-same insns to decodetree
  target/arm: Convert Neon VPADD 3-reg-same insns to decodetree
  target/arm: Convert Neon VQDMULH/VQRDMULH 3-reg-same to decodetree
  target/arm: Convert Neon VADD, VSUB, VABD 3-reg-same insns to
    decodetree
  target/arm: Convert Neon VPMIN/VPMAX/VPADD float 3-reg-same insns to
    decodetree
  target/arm: Convert Neon fp VMUL, VMLA, VMLS 3-reg-same insns to
    decodetree
  target/arm: Convert Neon 3-reg-same compare insns to decodetree
  target/arm: Move 'env' argument of recps_f32 and rsqrts_f32 helpers to
    usual place
  target/arm: Convert Neon fp VMAX/VMIN/VMAXNM/VMINNM/VRECPS/VRSQRTS to
    decodetree
  target/arm: Convert NEON VFMA, VFMS 3-reg-same insns to decodetree

 target/arm/helper.h             |   7 +-
 target/arm/neon-dp.decode       | 113 +++++-
 target/arm/neon_helper.c        |   7 -
 target/arm/translate-neon.inc.c | 639 ++++++++++++++++++++++++++++++++
 target/arm/translate.c          | 495 +------------------------
 target/arm/vec_helper.c         |   7 +
 target/arm/vfp_helper.c         |   4 +-
 7 files changed, 767 insertions(+), 505 deletions(-)

-- 
2.20.1


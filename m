Received: by 2002:a19:8c50:0:0:0:0:0 with SMTP id i16csp76687lfj;
        Wed, 15 Dec 2021 10:53:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVBJeazh4IXNYOMhDdLNhqP3RrGtSIOQA0k8ebgMdp+T69nR8++hhUWc5NVqm5eiwwC3EQ
X-Received: by 2002:ad4:596f:: with SMTP id eq15mr12485559qvb.89.1639594425287;
        Wed, 15 Dec 2021 10:53:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639594425; cv=none;
        d=google.com; s=arc-20160816;
        b=EUQjJsFePAJtcn4dYE9/BfmVFvw3rztiGhw2KaphxtdiPB0UESIDf1gLh8pCo6rWtO
         28VtE+1xQHzc813rhLoU11q0xGodtCeOlcz215cyWVq7KNqYB0+x1g8ksFC0FUj4kmsd
         S7Ljlr7r0K2kkDBAQx9HC11l/l7x6Q8iQDbBGG7S+QcsIODUvsLnJWfaKk/dwNItA1KQ
         TL10HzBk6kRvFkxG0o5sWZonmGkg04T25RvlUzvCZG3d3n4kNmoQB+2zfWdEOO4nP0nR
         Jbsvr2Qe6ToWj0yg4uGjhVhAdu0s8JcdrKeA5HOtMjJE2ZniHeK+XoBq8FugI3TEVBnI
         OSFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=BLKSMsPPaS0PgT8CaPVQtmt5Z9qn3oJOI6lqwxdMpts=;
        b=HsoQ+W8/wLb2fM9SVxizPScOnI51HgZ7NRMRQFT9ZBdS820mf6r4e93COO7MVPxLxp
         imiddl+4wTcvfLj7ugZNVKKoQZqFBLYkHiciFMiKVYjLx90xg1OYNrQ7iSy4pB4V5qTn
         o40uubPbS/qMHQ8DrlhTSbNXwlR1+Bm3Mb5jnmr729xshdSjM7r6iObjWsS4D4KpdwYp
         FaVBH9nx/9gO5rY+6vy0hVAQ1ZoPONo69YwQ+hC8SQGL/m9Aw4OBP8H0TT3Yz8qRXDuN
         clbEqFdTzQa5dcfsaH6Mg9GeyQnjGUarQFYmGTaQOKLdOVR4adUQ8PybhuFWK8CxDQe0
         jGMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dJHoo2Xy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10si1682628qkp.2.2021.12.15.10.53.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Dec 2021 10:53:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dJHoo2Xy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mxZPM-0003lh-Kc
	for alex.bennee@linaro.org; Wed, 15 Dec 2021 13:53:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxYxB-0004Ym-KQ
 for qemu-arm@nongnu.org; Wed, 15 Dec 2021 13:24:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxYx8-0007OX-VO
 for qemu-arm@nongnu.org; Wed, 15 Dec 2021 13:24:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639592674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BLKSMsPPaS0PgT8CaPVQtmt5Z9qn3oJOI6lqwxdMpts=;
 b=dJHoo2Xy8X6PgNxWqTyvfTGWcUNI95v+pMfbG7M/K/e1f9HdpWU1cOcPF6mCZHCjpncdG0
 uoTwpz9WwD6xvAVQKPCJvhq6zBJnE73rTKvGc4omJXMrqLz2wT8yI+IWn/P/Ny4B6LcKzr
 y7PoTkrDQdAJtjRwdToUwOdPJcQT8WU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-lu7UgnVuNOKogxsJlS3LEg-1; Wed, 15 Dec 2021 13:24:31 -0500
X-MC-Unique: lu7UgnVuNOKogxsJlS3LEg-1
Received: by mail-wm1-f70.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so12951816wmb.3
 for <qemu-arm@nongnu.org>; Wed, 15 Dec 2021 10:24:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lmdBhwEuEb1iSFZeoR9qOmmlXKX0RLfyyHS8mXXUyfI=;
 b=A0nkk8msMXMh/algiLLr3bpcoPEEncjxsd+NCOsf0kQytlPPO/qzfabNzC2tr7odUk
 Cr+drpR8L+Z16IOU2oJlaKYEqtpKuD4KYHgGfDPoSP2A4RBpcSfrdgB94RFXQ8s/o9AQ
 tYp1v/WeS9/X7ynFWrUbhI++mMQ4F4l//RNUBx7ULkMoMJySO+FcDf7BMORa9P0fna6C
 /rrjlSgct9JqSSIMitM77ZSLzUFmNxkG6ffDQIJX0QqxF7gH2yYhZHJMOR/HD0CQgiHs
 ZSf2oc5x9uo3RgEsOFsBIs+4hi8e84OsBJyPge1zA5o2GAXDpfZtAzIcTPTnfEj6gj4N
 YvJQ==
X-Gm-Message-State: AOAM531RL/a/bnfQ7HfcdxvfxiZtWj8UO1FpWiyG7pouJ1fdJ48aaB3q
 b/+Wys34TJ/glbaGE6XAVJRRTUfB+Vi0l1kJlJFDGUnQUdd/+xuUIccpN+w3bbxG4Hxx6ziQ6RG
 0rkT8q54tzPjY
X-Received: by 2002:a05:6000:1868:: with SMTP id
 d8mr5884834wri.285.1639592670562; 
 Wed, 15 Dec 2021 10:24:30 -0800 (PST)
X-Received: by 2002:a05:6000:1868:: with SMTP id
 d8mr5884787wri.285.1639592670217; 
 Wed, 15 Dec 2021 10:24:30 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id w5sm282615wrr.45.2021.12.15.10.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 10:24:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 0/3] physmem: Have flaview API check bus permission
 from MemTxAttrs argument
Date: Wed, 15 Dec 2021 19:24:18 +0100
Message-Id: <20211215182421.418374-1-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3K/iIY6Tq3ta

This series aim to kill a recent class of bug, the infamous=0D
"DMA reentrancy" issues found by Alexander while fuzzing.=0D
=0D
Introduce the 'memory' field in MemTxAttrs, allowing to restrict=0D
a controller to memories (and not devices).=0D
=0D
If a transaction permission is not allowed (for example access=0D
to device), we return the specific MEMTX_BUS_ERROR.=0D
=0D
Permissions are checked in after the flatview is resolved, and=0D
before the access is done, in a new function: flatview_access_allowed().=0D
=0D
Since v2 [1]:=0D
- Addressed review comments:=0D
  - reword arm_gicv3 description (pm215)=0D
  - merged patches 3/4/5 (peterx & dhildenb)=0D
  - simplify flatview_access_allowed() logic (stefanha)=0D
  - drop MEMTXPERM enum and reword following AMBA terminology (edgar)=0D
=0D
Since v1 ("hw: Forbid DMA write accesses to MMIO regions") [2]:=0D
- rewrite based on Peter / Stefan feedbacks=0D
=0D
Based on "hw: Let the DMA API take a MemTxAttrs argument" [3].=0D
=0D
Based-on: <20210702092439.989969-1-philmd@redhat.com>=0D
=0D
[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg831168.html=0D
[2] https://www.mail-archive.com/qemu-block@nongnu.org/msg72924.html=0D
[3] https://www.mail-archive.com/qemu-devel@nongnu.org/msg820359.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/intc/arm_gicv3: Check for !MEMTX_OK instead of MEMTX_ERROR=0D
  softmmu/physmem: Simplify flatview_write and=0D
    address_space_access_valid=0D
  softmmu/physmem: Introduce MemTxAttrs::memory field and=0D
    MEMTX_BUS_ERROR=0D
=0D
 include/exec/memattrs.h    |  9 +++++++=0D
 hw/intc/arm_gicv3_redist.c |  4 +--=0D
 softmmu/physmem.c          | 54 +++++++++++++++++++++++++++++++-------=0D
 3 files changed, 55 insertions(+), 12 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


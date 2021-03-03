Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5578319lfg;
        Wed, 3 Mar 2021 10:24:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUoNa5BBI059sRTEv0jXD9zOl5j4JEKd5REiKKLpNn41FdvswPNfi6zVZA8PZaDg4EYupK
X-Received: by 2002:a5e:cb4c:: with SMTP id h12mr343161iok.183.1614795847201;
        Wed, 03 Mar 2021 10:24:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614795847; cv=none;
        d=google.com; s=arc-20160816;
        b=nvFQGMDfhlGtkx2nvjGOQ2DS9VgYWLSMJFc/ljqSutfrSblk15Wjz5p6i0ANwS/Qp0
         g083Y1hLwgs8eE0+SotxntVcWI++EV7dYua2rutKTn8X8Yx/aEIBE3dmKYopxcl09meO
         mV6bBSLXQ2slceYe1jy5Nl2Q3DK/TE1pCDthL7znT6ag43t4vIzcIU9af/1sQzlggHxL
         nCe6HO/IisRMXh6gNE6rcIlDLiVvPPrZwUALH38yNo7D4xkdnuMXuAjzbE4Tvivx43E9
         HcowsPFpL0Ia/NvApcnFRdWTjNC9ExEavRO9WrVOrVBg9r775xSaMA/i38eIwo6gRKtm
         v2WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PDMMcK3oLvQF9Y3zPO+zi1w8ujiioTi9C21H6L1uDR8=;
        b=WgzQHhphj2OEyQGkVK7w/QoqQNJ1pwC7k0i4fh8rLmubRUSawY4sYt0loo/skgapmy
         Fd5t0GvAEbPUVa2LUMf6a6DlkjRrjV4eX5EF9Ybttzk9kt8Ep6TK/MPM5XP8dKO6q/2t
         wfIFYjJ1dzjI47V4+SVNFacHoccJxhWIfwXnhxKYg7nXr9qdIYEDQ9dRaN4VSC7mMArf
         6TdDUn4b6/iZ/1z5UYGp9C7zy4ksUw7xzItoYsnyiV1WUNUKWCqbHw5IcOc+ih1dQj0k
         I2tGGWQ7GTZwdOPeQCzbYhbzBc8PKXmpKRdIHx3+ajZD8n/sRMOGDiYXJkiAN4LUgNwz
         w/8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=U75I5r4s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17si25187722ios.104.2021.03.03.10.24.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 10:24:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=U75I5r4s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHWAI-0007Cm-HH
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 13:24:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW8w-0004pE-SC
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 13:22:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW8t-0000Qm-61
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 13:22:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PDMMcK3oLvQF9Y3zPO+zi1w8ujiioTi9C21H6L1uDR8=;
 b=U75I5r4s+WL3Gc1/mCFdub6XnoxeKf8rkt1+AZkA+QkWPfVTQbDKB0TrvNzSMxbWDMeNtT
 njWJ7Is+5vIkFqMfiTNwqwOrTs1Baw+mqvdeXTNXMC7R/pDfIlEnof7Ewfp+EPgRx1Huup
 u+gJf6cON99EBt4aKHanAyMKLPYvTA4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-WFRwiroePWSY-nEnVeag6g-1; Wed, 03 Mar 2021 13:22:36 -0500
X-MC-Unique: WFRwiroePWSY-nEnVeag6g-1
Received: by mail-wr1-f72.google.com with SMTP id n17so993271wrq.5
 for <qemu-arm@nongnu.org>; Wed, 03 Mar 2021 10:22:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PDMMcK3oLvQF9Y3zPO+zi1w8ujiioTi9C21H6L1uDR8=;
 b=IN3bBigETD/4CH8MKdDvnaDEAoukkZPie7oSqiwCV+gs3OddHK363divJqf91nPUOv
 OIYabTWKAQw0Bke70DHGtKHI4yqNEjowlUAxnHmkJiJFzzf8PTWef7vWZy+Icv17k/DD
 4BQOkK/AvC8YNP8SqtL9n5NoxvaPE2oPcLRGytYNZ523Ay5y/1dgCZUP45NNr9iyRnEz
 /yVgyX/gb53x5RpV9LLXygodzgOBxgr7fQzrh7sLkvBOns7EhxIfEUdb7ZyldjkKgHhn
 iTlFpFojIxPKGOBwA1onLHXYfrAMxL7MStgtPo98q+u8agyO8HaN6PtqArR/0dhVDGB7
 pMsQ==
X-Gm-Message-State: AOAM531AFLz6ALN9xHZp+yZUwiUPS33jcon4o10jyRGoTo8TIQyA0mVk
 ttEvGaxe8xLVFnqtkoAhjGKUJ8ZUMEOz8jc9hGx9bfhAOzog+OX9XDF2G0GdRLkoeDgfx+7Pofb
 hu6eSX894FiXF
X-Received: by 2002:a05:6000:1104:: with SMTP id z4mr33837wrw.10.1614795753958; 
 Wed, 03 Mar 2021 10:22:33 -0800 (PST)
X-Received: by 2002:a05:6000:1104:: with SMTP id z4mr33805wrw.10.1614795753484; 
 Wed, 03 Mar 2021 10:22:33 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f22sm6664306wmc.33.2021.03.03.10.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:22:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/19] target/s390x/kvm: Simplify debug code
Date: Wed,  3 Mar 2021 19:22:02 +0100
Message-Id: <20210303182219.1631042-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303182219.1631042-1-philmd@redhat.com>
References: <20210303182219.1631042-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yAkPpVkFkhG6

We already have the 'run' variable holding 'cs->kvm_run' value.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/s390x/kvm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index 7a892d663df..73f816a7222 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -1785,8 +1785,7 @@ static int handle_intercept(S390CPU *cpu)
     int icpt_code = run->s390_sieic.icptcode;
     int r = 0;
 
-    DPRINTF("intercept: 0x%x (at 0x%lx)\n", icpt_code,
-            (long)cs->kvm_run->psw_addr);
+    DPRINTF("intercept: 0x%x (at 0x%lx)\n", icpt_code, (long)run->psw_addr);
     switch (icpt_code) {
         case ICPT_INSTRUCTION:
         case ICPT_PV_INSTR:
-- 
2.26.2


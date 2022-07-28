Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp552809lfg;
        Thu, 28 Jul 2022 15:13:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vyOz4Qsv0CPM+28pMzqE67Tf4++tadPJNN5iqbZodslc6sVptUGlhKlUHo8IX8caMJdvd9
X-Received: by 2002:a05:622a:1986:b0:31e:f6c5:2cc9 with SMTP id u6-20020a05622a198600b0031ef6c52cc9mr1027400qtc.358.1659046392916;
        Thu, 28 Jul 2022 15:13:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659046392; cv=none;
        d=google.com; s=arc-20160816;
        b=F6efm1rIiid8nZepRovXQD4X5on6SBul7CzFlciR1bV+ilaiKoJRaQ33uUDF2ThekR
         vjJ/sqzAm+zpf/4tBGmM6EfTyci71qbQTZm62l5rgS7GCt5O/Quh0rm8IryJRBqedxIE
         vmidvrP/tYzG1ws0iMVSfGsWvTyzs5i249ofGYsO6iho22cH3uwhsDDoxGRM8C4gz6iS
         g7TE0n2HqGRYgs+jr92zSxe6+1sjc/1WbZDe3eW5598EaC6LVaNIXPHVaFVYl8kjZuPK
         u2F52kWVCrtrVAKEpfQXJ8TNh/0LH6z5HFDNIuOkaK+i1jr2UNghuNP1MboEwY+cS2Wf
         uRng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
        b=vMzVU1sKCbDz65VXtc5yTrg143t8eYc3GrfCKwChCaXyFI3c0RWoVUm4clI4ImrPNp
         xRYKidi957gjMcu0JIbkLJ7ETAhMPxoirCDjEnso9DUE76nwr1kvix1fZNcS/Rw9gklE
         KUxktOt0YHEWL7XZYADgf67ZFJbY8QQyEgVZcVLFDU5LeycyZzVVHCbJFEfzWwE2tcZK
         OOBDy73M93rDANksm7GKGJURcUgV6Clqyf31rJYHfW2veoqgc/CfbWh70vMYl8L2ARyx
         T/GccocNQTSozXhe0kdSNcTvS3iJ3tDyuxp1CWebGYPnQ1l7b73rg5AUqt4hNAslG/nG
         qYhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Oh4I8TCj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12-20020a05622a058c00b0031ee662a308si1409292qtb.15.2022.07.28.15.13.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jul 2022 15:13:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Oh4I8TCj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oHBkm-0003BQ-Dq
	for alex.bennee@linaro.org; Thu, 28 Jul 2022 18:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oHBkL-00038a-Vu
 for qemu-arm@nongnu.org; Thu, 28 Jul 2022 18:12:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oHBkJ-00009h-NM
 for qemu-arm@nongnu.org; Thu, 28 Jul 2022 18:12:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659046362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=Oh4I8TCjveh0K+8z8uj2Zsa6E4MTDGLsQ7s2GiWhducfIMxI791PVpgQpEC+/7izxeeoRt
 qSo8svdJHkpOW0LEYvNhhZhGB0/AeANE8sqSqjhHw9F/UpT0bJLMYuuzH4GTnB3enu7K3c
 /UjUPqeAbhCo78Bfb7YEqRxFl6lRGHA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-nWMW1fkuPJKDo-ZE5djEcQ-1; Thu, 28 Jul 2022 18:12:41 -0400
X-MC-Unique: nWMW1fkuPJKDo-ZE5djEcQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 t25-20020a1c7719000000b003a3564fa721so1490640wmi.2
 for <qemu-arm@nongnu.org>; Thu, 28 Jul 2022 15:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=SJ9rVaKdMc/Q4YbCSCObs05mhPEGT6AztgZcIHRU4MYDtIUKQTqQjVKt3bVf4VY+fi
 RiXEckbqMfXyeG3bXX2mNEcUX5ELNJ5J/Z060evd+xcHx+U2YGYsVR9Jbi5hRJ8CvURL
 3pNwEehhY49mG1i+PxW00mauuelwHVddIhSuAcFWz0Xr5hTcQc6aLQ9lEoOW2aqQxr7O
 8vPgT0/HJ53uk6WR5nqVwgdKLj+79jB1sKxnmsuqObNabNblDuy5hVLq0TAWp0Yf0rEK
 iEN9pPTOA2ZaZW+lFPyjWBRKfF7PHBUZ6b8gk/cdj28MdMLk9oHSk3Mu4zs9fbNt6Lo7
 npwA==
X-Gm-Message-State: AJIora9Y4qjdYIYNuFyEJU+IzTY4iYTltnC8EK4weeeUrgbgFLpAOMeP
 8yS1prlqpKuBCAL5C58qlmM6qnok6iFgheQcLlyKksmmcDVYviC8ODXGbwAxtuxA5+5cPsHMqP4
 gsCO/uKRsYYy9
X-Received: by 2002:a05:600c:3ac4:b0:3a3:19c5:7cb2 with SMTP id
 d4-20020a05600c3ac400b003a319c57cb2mr516080wms.63.1659046360362; 
 Thu, 28 Jul 2022 15:12:40 -0700 (PDT)
X-Received: by 2002:a05:600c:3ac4:b0:3a3:19c5:7cb2 with SMTP id
 d4-20020a05600c3ac400b003a319c57cb2mr516066wms.63.1659046359949; 
 Thu, 28 Jul 2022 15:12:39 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c1d8f00b003a0323463absm2641254wms.45.2022.07.28.15.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 15:12:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH for-7.1?] kvm: don't use perror() without useful errno
Date: Fri, 29 Jul 2022 00:12:38 +0200
Message-Id: <20220728221238.305080-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220728142446.438177-1-cohuck@redhat.com>
References: 
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oW182f3LUm0Q

Queued, thanks.

Paolo



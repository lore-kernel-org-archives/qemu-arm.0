Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp835381ejb;
        Thu, 14 Sep 2023 15:42:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCLAZ/oPLNL1ZkntazL/iXTLSOAeMf87hiSZDxJateiM4Lv62oUDK0duyrQoILNnTLTZdk
X-Received: by 2002:a05:6214:c2b:b0:656:e00:626b with SMTP id a11-20020a0562140c2b00b006560e00626bmr3703225qvd.17.1694731347846;
        Thu, 14 Sep 2023 15:42:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694731347; cv=none;
        d=google.com; s=arc-20160816;
        b=zWv50Z9s/gblaOpJhi3Z9yLjaiBzdSvPxZJW2/YnwBgVH04lhsEmfcKNLSgAWtLLtq
         JOGF/p81UFWq4KkNz23rE5QNA8BshX+ZNJwtN62GTEirfbzF/zkIIlDKvMDhvmDKwE8h
         NMEQsmkhpV/9g1Sdj9EmTrXA2vnGNYzk3KCpRR6HBW89CY7wfGFwfKrYJ7+yVY3+a4Tp
         /vDSdGSi72PZjZfVG+dGyd8auX0WkNsEgd2pt960AyH1Np8GQZo9f99bU58+9V6YGmeG
         XGS7u7RVD/eptl/Jl7Bzr8ZoRKsk2JfHXLjhIKoZESuYc/y7LThwDyrLJRFdattRHodE
         AnUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=u6DWZwyrNMCTZjUs5xi9vI8KxT+j7urhO0P6zkh1kzA=;
        fh=B5Lugouudq7zpnpheERcCb2tRWWmYNJugNqQhE9RDLA=;
        b=yuZwFvbI78uyum93dfzh/fWUPLuCoc2jI/pkusCAniaRUeJFCcVk3Yeua0HxNhNm3+
         F50asQvjUY0ZxAV/ySXIflIGjQhMInwlgAK4AO6B0+9yqrn+V6/jf1ySMZOocVu+JaGr
         GI3p928hOiJuHIua9q4gWutXhdFLQ27EtCELxbQKALSFgkwuqo9+IOQDjqgzqT7a072j
         QLQQ6gKCAelNWDccscVELN0A/jXTlkRhVyIyTY+d9uwZJ7hr1A8a69iTW1jCmb08EcQL
         u8ORUej32k9+7h46ov2rI4w+HWIQNWq9TQaYKCNZnLdoyDUe62I3U/A8sRtmgiZHwPNL
         3AKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=jB+ljRY8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3-20020a0cbf03000000b006558ce26d49si1555848qvi.199.2023.09.14.15.42.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Sep 2023 15:42:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=jB+ljRY8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qgv2S-0000bd-5t; Thu, 14 Sep 2023 18:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3RowDZQcKCJsFJHGJ8DBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--komlodi.bounces.google.com>)
 id 1qgv2Q-0000an-14
 for qemu-arm@nongnu.org; Thu, 14 Sep 2023 18:42:18 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3RowDZQcKCJsFJHGJ8DBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--komlodi.bounces.google.com>)
 id 1qgv2O-0006Im-J0
 for qemu-arm@nongnu.org; Thu, 14 Sep 2023 18:42:17 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-d81503de9c9so1799329276.3
 for <qemu-arm@nongnu.org>; Thu, 14 Sep 2023 15:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1694731335; x=1695336135; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=u6DWZwyrNMCTZjUs5xi9vI8KxT+j7urhO0P6zkh1kzA=;
 b=jB+ljRY8XfMiDV9+q1R1Ggq27ndVpDkJEIR+VvsacMyDK6G0li6qbJ7feHlqHCFEta
 FQ20OwmkUhEoRdr03cSar7ZYeXC1Df5KjJUDlcQuiCEOVpOQQfMJfAIl5+4qPCyhx2pU
 5WtDUoDAOYoI8t8RSTkT2wDgIK0qUE0VQohQpjWZUK35YQ6JvSN+aK0x/1lGcdvLHnb+
 h9v5tNfTvi+ikBabsHgBWvaH88D8tV8q0idtZwEjH0htvu+Sw4md9EuTiXO9FKltBOvv
 lNdPsctLoYZNRkHT+irZD1d83PP7fKmIkOkAMMQlxaTWGSfZ7vm+5agG+VUyaR+AStAJ
 7hXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694731335; x=1695336135;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u6DWZwyrNMCTZjUs5xi9vI8KxT+j7urhO0P6zkh1kzA=;
 b=rQybfW7enedITjajeaa4/6xIukvL3MV82yDPNXfnULNOYDrVcVlKAvAzcuLN4ycEsh
 C9vKHjWM4uJK4pMq0KRegHkn/4Ik8HZjIBHf5WWCHqd847cWLdXiWE3jVhP1BKag42eO
 /KyM16IMrjuMs2Gwvvs/QbWmY4fPIW27iRqwNP7UKoeaPmK4QrWWB0/nsITlksPiushJ
 qT3xfEK4zhsArnoqPabM4Dcvo79KeD8/CnwVMLtiVEKWdVcBI1kfO84I5UuGfHF/tCRd
 +gwXqBp+oqqF68zhnaRyKGxzCkKfJLn71U62GdIz7iqADwwCh+zhq+JKd81jvM0NfdCz
 RKjg==
X-Gm-Message-State: AOJu0YzxuxHsE3/ahXvA9Qu0Ygso95ny5o8FC3+sgvyRBHrEhhj82rCG
 wgKZQd5mxrkM2xARmMnyREvR0vk+iZs2
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a5b:92:0:b0:d81:58d3:cc71 with SMTP id
 b18-20020a5b0092000000b00d8158d3cc71mr154170ybp.13.1694731334790; Thu, 14 Sep
 2023 15:42:14 -0700 (PDT)
Date: Thu, 14 Sep 2023 22:42:09 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230914224211.2184828-1-komlodi@google.com>
Subject: [PATCH 0/1] hw/arm/sse-timer: Add CNTFRQ reset property
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: komlodi@google.com, qemu-arm@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3RowDZQcKCJsFJHGJ8DBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--komlodi.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CZTcbzGw+Vuq

Hi all,

This patch just adds an object property to initialize the reset value of
CNTFRQ.
We noticed that Linux would complain that CNTFRQ would have a mismatch
compared to an expected value, and this was because TF-A was assuming
that CNTFRQ was initialized to a different value out of reset.

Since it's valid for CNTFRQ to have a non-zero reset value, we just
added an object property so people can set it.

Thanks!
Joe

Joe Komlodi (1):
  hw/timer/sse-timer: Add CNTFRQ reset property

 hw/timer/sse-timer.c         | 4 +++-
 include/hw/timer/sse-timer.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.42.0.459.ge4e396fd5e-goog


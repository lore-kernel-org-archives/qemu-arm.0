Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1164095lfa;
        Mon, 12 Oct 2020 08:58:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJym7CYsbw6rbDEY/kyHrH1XvEKMx5VhCtueaq+nXESOFGQ3+4+yrB9uLkAMPRwM/ikd37Wo
X-Received: by 2002:a25:5985:: with SMTP id n127mr32415724ybb.53.1602518279817;
        Mon, 12 Oct 2020 08:57:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602518279; cv=none;
        d=google.com; s=arc-20160816;
        b=tgKPusALOcMDQ22UMm4KX/TfNTPsXPZ/GxJ8I6obP9OTBDGW9nh4KDxx5+j1Y6GPBS
         tzgfznRz17S501WUqLE+HGswn193TlwHl2vLYWU3j6WtTKLArAem2kV64kCx0Z8owiRs
         F26Kr9LZkQNn6j8KNtJ1YtznUoycf9ERYgvdh+yD7i0xWiSTb7GE3FhjJvaD37IE5xLq
         lSDmcwohHXThMVEEo0G2MMLuR4aZNMYA5jR7qWlCF6B8BkMTtar6TDLfgo3RZB72Hu5W
         XmcWcL7EE6NWErzWnimh/Qndh31jIiK9Z7MvEsciUW+kzAR1VzIC7VRhwpG/b2r/rSUe
         YQGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TFEeAigEIjpMhWK7DoHcFuCUqfcQKRxgqCRDpAIxz64=;
        b=n4n8H6+S+oXN1dZEQoWzoY32c18oxmuKoOjliYY368xW4up2U7PyD7Pyjz29qIN1uP
         D94dOPNpbCCV9QXK5W+3iq6S9fgezZrlpzXknhgFqkZOgfwq6m8RNB11n2Pz/8xEw7JK
         gm+W1jKqBfn04/axxnhKopHynoXVcjFpGhAsmWPbZ++ozy63MpQkn4orWPUy3GedW+Jv
         RNmZHTsnnsVEHt+RLt8ghFEr6R9s9bwcMKQVFNdUuxgoLHW4RyhXd28aeOPFNVNDpQxK
         0wWc0Sf3yyKr2bs1RPu/ltyIK3qleexnLzN6ObKT7LyRUCJMzxotbs3hh8Ahh7+4Nrc9
         iVfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JvYICIhM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e81si1613564ybf.220.2020.10.12.08.57.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:57:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JvYICIhM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kS0D1-0004W7-7i
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqn-0007HB-JI
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:35:02 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqe-0007MX-DZ
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:59 -0400
Received: by mail-wm1-x341.google.com with SMTP id b127so5139626wmb.3
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 08:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TFEeAigEIjpMhWK7DoHcFuCUqfcQKRxgqCRDpAIxz64=;
 b=JvYICIhMLv4zFkf9pBCtbx9anD+Ds35GexppRV3VwkBSIooNwcjog+od02pop5BRJ3
 POQF0HomuH4ORVut/cS1Jl1pn5vYtGpDVK/bu6ObWxsaNfF1jNMch7dwmv37MUxrEVa9
 /gTRTNsLGZnkvJcmZdv3bJKGVBUSXUoZscUUfrfrmFJtpfr2j2gkMbluIfjNouixAtNu
 O2jZtiDzSZvnJH5qvXbmNuL37qb1ihRjxIBJ7NRvBmftL7WmIGaWgVbHWJkfosKocHcG
 DFARHoU5hryh5Mj3H/mPE0d1WKt+fAb6033PiB0PKDhvkiEsGcaHWH4OlAXJ8sOjNEcI
 bpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TFEeAigEIjpMhWK7DoHcFuCUqfcQKRxgqCRDpAIxz64=;
 b=Q85RFF5aqj1R85KH0miI1oltZ+O9Fg7rO8t9ur8dQbRKpIzyWntoE3hGRe7fmnDm68
 b8rKu7P2SF6/Ok4mZLl8JMeqEHKUaq9iWrOVjdDTZoWmR+vk80VDpH66yuOAQMN6Bj0v
 9x3FzIZAHxDdp+oYh41oyn1XrmEaPdHV/YR+YJ2kpuelS73qPFSbd7QX0q5W1ruPyLW8
 4BdAlOSExGOxWP0nW8iJvJF6XnfkMs5vF7Hj46yL7RmbmLkgiuxgq6v6Nybd5yeW0pgO
 U+nLmb0ysMnTNeXgsAQMrAQL+JbI4pwsKU45OVuSJxZqEbM3oxwmO5RuAw2X8XD40WCg
 1nlg==
X-Gm-Message-State: AOAM5320LuYBGmgQKkEKab9lYONDDbqYYHZSgAgORnzPJbOEwnr55ruh
 L5DGX/kgkqlHZF3M9Kvf/86RIiUZnR1EKFjT
X-Received: by 2002:a1c:1b15:: with SMTP id b21mr11600760wmb.143.1602516880521; 
 Mon, 12 Oct 2020 08:34:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] osdep.h: Add doc comment for qemu_get_thread_id()
Date: Mon, 12 Oct 2020 16:33:49 +0100
Message-Id: <20201012153408.9747-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xdHj1niR1AQU

Add a documentation comment for qemu_get_thread_id(): since this
is rather host-OS-specific it's useful if people writing the
implementation and people thinking of using the function know
what the purpose and limitations are.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Based on conversation with Dan on IRC, and prompted by the recent
patch to add OpenBSD support.

Q: should we document exactly what the thread-id value is for
each host platform in the QMP documentation ? Somebody writing
a management layer app should ideally not have to grovel through
the application to figure out what they should do with the
integer value they get back from query-cpus...

 include/qemu/osdep.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 4841b5c6b5f..8279f72e5ed 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -515,6 +515,20 @@ bool qemu_has_ofd_lock(void);
 
 bool qemu_write_pidfile(const char *pidfile, Error **errp);
 
+/**
+ * qemu_get_thread_id: Return OS-specific ID of current thread
+ *
+ * This function returns an OS-specific identifier of the
+ * current thread. This will be used for the "thread-id" field in
+ * the response to the QMP query-cpus and query-iothreads commands.
+ * The intention is that a VM management layer application can then
+ * use it to tie specific QEMU vCPU and IO threads to specific host
+ * CPUs using whatever the host OS's CPU affinity setting API is.
+ * New implementations of this function for new host OSes should
+ * return the most sensible integer ID that works for that purpose.
+ *
+ * This function should not be used for anything else inside QEMU.
+ */
 int qemu_get_thread_id(void);
 
 #ifndef CONFIG_IOVEC
-- 
2.20.1


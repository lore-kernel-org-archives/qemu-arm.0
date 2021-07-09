Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp328523lfg;
        Thu, 8 Jul 2021 22:46:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyq6XOj/r6zKmJkqg3SSpCNS0p9aLLj0Z9vilYxqUA+w87EqrTAqv6nTVbw0rYArH1WHwhs
X-Received: by 2002:ac8:4506:: with SMTP id q6mr11977381qtn.382.1625809617871;
        Thu, 08 Jul 2021 22:46:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625809617; cv=none;
        d=google.com; s=arc-20160816;
        b=mW4f6mmNHtSwE9V+bBhydwmX7QdRTPw4P8JAFUh0BANrTAMW0vx1HOrJr+EclVBeIy
         MOb4VoqQ28+/+GIrTU+eRNZ8Z3q7R4PbMZgx7ulAe8oCGnDTT+uzbmFIFyZNJ3wKbj4H
         +QlHh6/YmAa0iI7bZrV8LlJXizNAFtmaoVXz0yw6Jm+aU5AXR3lk2M2ftrWW9NnYVAnz
         W6sWTHVVtpLK+w5MYIqV8Xh3vF00Q9PyJaYq6wyaUn7CedL/Sw1Bl9Kf0iD5MmEsGbFf
         +KCOqNevQiVy9dqZUk1qoPmoDlmLDdk32ewJTFJu9h32ISwjlCWPHV5C7prlCDVsNCKV
         9UMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature
         :dkim-signature;
        bh=TXhzzxIW+IcWhVU0QMlhUaNeFs7ytRFgGqBuU9GSSgA=;
        b=ea6dg8kFl5rFhtLsc5drcgyJpNSo0ngQg9m+kvgin4eJ3N6D+DE/oKgzNHoVm1JpaE
         KRc2uJtIpt5eXzKzStHF9C+U8xBSgWfyQiunUlenyXamD1DVRsTEi6JhZ0n1sI73yhKO
         SAG/HdqLOZl31MlSSTvm9snrGuU9D1C2SBvQmKogs45cyyhgxfudxXi5NFd1/QJPeaP/
         p9A4kPD5uVSLqSZzx9hA6Gt8nXdDN37NbM3rtk6MzD5eWFcqmbt9zE58/W2bPRBdCw6K
         mp6XYXUldVow27Gvg3JR/Dyxu6/FBqDbUOjDWhw6Ja2ddep1+uxysKBBBwMUxryq9RRd
         Znuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=pE4c7ptf;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=q9sJQmti;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4si1193278qtk.39.2021.07.08.22.46.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 22:46:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=pE4c7ptf;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=q9sJQmti;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1jLl-0003ls-3a
	for alex.bennee@linaro.org; Fri, 09 Jul 2021 01:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1m1j6j-0004n1-0R; Fri, 09 Jul 2021 01:31:25 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:43619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1m1j6h-0008IU-3b; Fri, 09 Jul 2021 01:31:24 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 6DB4B5C00EB;
 Fri,  9 Jul 2021 01:31:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 09 Jul 2021 01:31:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=TXhzzxIW+IcWhVU0QMlhUaNeFs
 7ytRFgGqBuU9GSSgA=; b=pE4c7ptfpcgzlMesFjGcnMMpxqMLGiVgXUpM4I1pDq
 mn3TMVyjzHGL92F393QlpR3PCUSMlwXBcMNxjqJWChr2vezWLaW+2S23agK5wpFd
 JDLfghNM5qDlK7QtwX8Vb+0tydDLZlSr3oBbbXVlEoS6N0Yrg7KqCZ/Zg4+sORNC
 +3zNeUD8x+/8/wm6HdI974gYHXwu1JbMwUVUobjfS8Ies19UhzmszCV8Fm73h/tb
 bJAfyzWZxteRmP4L/Clw3mKoI3nr4o1AxIxtrZZoo+QDInlH5sFghMdwaCSfdRl2
 kvFe78JcyHDaScPXU8PdSftT2TFHG6/UVX17/4nbeT+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=TXhzzxIW+IcWhVU0Q
 MlhUaNeFs7ytRFgGqBuU9GSSgA=; b=q9sJQmtiNyqHMBcM0u+W4nSDrV5vsjwbw
 8Jt3ok2+ZLD9iyak8pmOaNC/LvhgnSmzzD9EFhq9f4Ovam9Up2po5210zn/b0MCp
 mbxTKFvES4a86VMaPgv2CdGTquo31QJhDcwJmLRYOFhBwMh6rlGNMlKd1i2o5Rkb
 SFRAXm/JdKdZ7eXdLHK2bhZKBgUICDqvaHmJJWZlMegYQt1/AakfySHp7Km0/7j3
 HfGTrv3yjVGKWvNy1Ze4241IQLWDhyxtRbRd8Ycy4kAzMIqqdBrQ7s0bFE1zGVYK
 8lXQd4qfPKg7xRDkhy8dGQdrUtaZp7owSQdfgmGmlAI4+i2UqlXAA==
X-ME-Sender: <xms:J9_nYNI7DLNaTYBR4kWs1byjKKT2So6AtXrcnFJ_OfWhjifXZdPxrA>
 <xme:J9_nYJJAgsPoJNRF6g0ZCV1VRpWTpycHmhjDTIIIvg1dOlExpyCVw5-X1NIAkBVCL
 WrXUq2tn7YoQpamJg>
X-ME-Received: <xmr:J9_nYFsCcV4F1MMKp3zWQ2MvWRt0KuPALg4_jDFbaDmzfX_a_VJ8Og3Hv84L72XORUBmwxj-7G5DTKf9R0PSDWJtijYCyMJQcOb25EcgpYxThFnInveiaLtUpNLVwv_D8PL88g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdehgdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucggtffrrghtthgvrhhnpeekhfeiffejveefveehtdeiiefhfedvjeelvd
 dvtdehffetudejtefhueeuleeftdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:J9_nYOYuAxnXuAiaLGUBABPUiPTg6xqsd7WHnyoEdpZAdqGCdhb89A>
 <xmx:J9_nYEZgyW6xzXwBex_ZP_iC_VOHhS6OFOYbzJHMd0g5Wt8owwO1Pw>
 <xmx:J9_nYCB-qw36KPIVVZkYamGDhX71nFDEE1u1y-akp3jYG3_1mQDYrQ>
 <xmx:KN_nYMGHuUa6FzTl93qlORDsjyJZr_R4k9y5yVSpuL3hWb6eiAxYnw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jul 2021 01:31:17 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] wdt_aspeed: Fix behaviour of control register
Date: Fri,  9 Jul 2021 15:01:05 +0930
Message-Id: <20210709053107.1829304-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=andrew@aj.id.au;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, clg@kaod.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E/fR5ZpK7Npw

Hello,

I discovered a couple of bugs in the watchdog while testing a tool to poke
Aspeed BMCs over their various AHB bridges. The immediate observation was that
the model for the 2500 wasn't signalling use of the fixed 1MHz clock, which is
resolved in the first patch. The other observation was that sequential writes to
control weren't sticking if the enable bit wasn't toggled, which is fixed in the
second patch.

Please review.

Andrew

Andrew Jeffery (2):
  watchdog: aspeed: Sanitize control register values
  watchdog: aspeed: Fix sequential control writes

 hw/watchdog/wdt_aspeed.c         | 26 ++++++++++++++++++++++++--
 include/hw/watchdog/wdt_aspeed.h |  1 +
 2 files changed, 25 insertions(+), 2 deletions(-)

-- 
2.30.2


Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp5283289lfj;
        Wed, 11 May 2022 12:50:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkkinzxZzL1T8YjL8PeRmZExMFc1Lu/9EPLxDYKe2KGLdFtF5tBy50HwazxOmfyznnU3v+
X-Received: by 2002:a05:620a:a51:b0:69f:bbd6:e1f2 with SMTP id j17-20020a05620a0a5100b0069fbbd6e1f2mr20257450qka.126.1652298653946;
        Wed, 11 May 2022 12:50:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652298653; cv=none;
        d=google.com; s=arc-20160816;
        b=vBoQGRWHfRgvO+FKu081m9FL854l6EZmadfkWq1gk+wM8ZmFktXeHp8KwytvaAigN/
         VkUe4GSUCb/ruDOCfbQyAJQ0yjzYZP5frY13o/JTLDPNNzNC3MD+cKsp1z0qZNjYKCqQ
         6pqDDBV2n+jomolUo51nYMdnILHduI7aFvdCRHkpVU83viFjW3bQOekI8WplUf1lb6op
         8lESPidb9KERFJgMqnWDWYr+fYf2UYni40dyxUKiHFGdhN9RJDPxvQC5lxfpgqjem009
         H+QQre2bk5KBCE8+NexmXopEx9A6JvQoUNmZ7p2Fc1oveQevTj+pz61NtoTwJbNJdA1y
         Cf6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Q8PAmGFFVVe8O/gA0s8T27KtnCCeETx3gDLIS+/2Wig=;
        b=SjDPqznJbptUy0f8AQHACK3UtJyYjv5oWt2sG6VJXjDJXxxN/2Yn/2J5/0yfpG4Qsl
         WiEuP1W7Tf6d5AsrkEFA+n+GwYRYH5dujn94K+RMcJL6N8x7YQzz0Ore8vKk4DqgGqNh
         pCFvWFADXvnivOi/hj0+iVkLuebMpKS1w1wOllu7uREyOl7X3CS5V2X+E2UxX0QS3BaS
         0ntVtCvpmRbF/aZf2d9wg9Ez5r4ipU7Ea8U9rjcmv+bme8WPK/7nUV/DF6ebJDwKbzDA
         hDyYveO8YJgWWE7/q0MvwtnHII1miBMeNJSZMBholCfEqTMYU8tiXA00vmQtsJFKjT0p
         50Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15-20020a05621406af00b0045d6b164afesi1631753qvz.549.2022.05.11.12.50.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 May 2022 12:50:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:38464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nosMH-0000fr-FI
	for alex.bennee@linaro.org; Wed, 11 May 2022 15:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <irischenlj@devvm5719.atn0.facebook.com>)
 id 1norLa-0006d0-E0
 for qemu-arm@nongnu.org; Wed, 11 May 2022 14:46:07 -0400
Received: from 66-220-155-178.mail-mxout.facebook.com ([66.220.155.178]:36275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <irischenlj@devvm5719.atn0.facebook.com>)
 id 1norLW-0003qH-OC
 for qemu-arm@nongnu.org; Wed, 11 May 2022 14:46:06 -0400
Received: by devvm5719.atn0.facebook.com (Postfix, from userid 279525)
 id 7B0B113B0B86; Wed, 11 May 2022 11:45:40 -0700 (PDT)
To: 
Cc: irischenlj@fb.com, pdel@fb.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 clg@kaod.org, patrick@stwcx.xyz
Subject: [PATCH 0/1] hw: allow write_enable latch get/set
Date: Wed, 11 May 2022 11:45:38 -0700
Message-Id: <20220511184539.1099161-1-irischenlj@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <irischenlj@fb.com>
References: <irischenlj@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=66.220.155.178;
 envelope-from=irischenlj@devvm5719.atn0.facebook.com;
 helo=66-220-155-178.mail-mxout.facebook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NO_DNS_FOR_FROM=0.001, RDNS_DYNAMIC=0.982,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001, TVD_RCVD_IP=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 11 May 2022 15:50:04 -0400
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
Reply-to:  Iris Chen <irischenlj@fb.com>
From:  Iris Chen via <qemu-arm@nongnu.org>
X-TUID: Qb6iFQTpES1Z

Hey everyone,=20

My patch adds the get/set property for the write_enable latch. Currently,=
 it is not an exposed property but this change adds QOM visibility and ma=
kes this property modifiable.=20

Acceptance tests have also been added to verify the value in the status r=
egister (after the value is set).=20

Thanks,=20
Iris

Iris Chen (1):
  hw: allow write_enable latch get/set

 hw/block/m25p80.c             | 30 ++++++++++++++++++++++++++++++
 tests/qtest/aspeed_smc-test.c | 20 ++++++++++++++++++++
 2 files changed, 50 insertions(+)

--=20
2.30.2


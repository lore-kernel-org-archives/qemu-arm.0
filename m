Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp5583723ejb;
        Wed, 22 Mar 2023 10:57:34 -0700 (PDT)
X-Google-Smtp-Source: AK7set/DxwMpi4/EBMCjLlT5ozR6lROAAjyXm6eabS8Tn6d4oKhQXMii9u7b/sfUoPcMczCHdNm+
X-Received: by 2002:ac8:5d94:0:b0:3b8:3a7c:d208 with SMTP id d20-20020ac85d94000000b003b83a7cd208mr8017734qtx.34.1679507854276;
        Wed, 22 Mar 2023 10:57:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679507854; cv=none;
        d=google.com; s=arc-20160816;
        b=lEmwQ3aAJrJo1+W/LEaEq1ZS5BcwT0kt5Wqm4Y2vEIKh98rOB651CC/0byjPBEY/1e
         1YotbhhNqDaECKw+F8fxm2FsNTmRLIJWkpD7cPRTEPGm9iNs9cS7p33fQyhXAFqcO5p+
         EureHzCkGpqQ+Q6Y1QDyd7v6EbwzxMd7uFpO7k3EwX9qKyIMxqZxrtX+IaNn7e3ukMqS
         prJ5tuLrtww7YWbPrSiP3VPANxNIjcHmkaopPlJbLBNJtm6p27DZdcUPWmYPjLjSmQtC
         u3bg0tuxcFQLb1bnpPb3V/XP2kfuKT0ukRvfkp79wDLe0t65vBiLIqacmFw3cSTBu5N6
         3I2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=bBc8nJSLiVzdxFPEpKJGMX3a4bJpKjM1r87UkXJvpN4=;
        b=vnAP+/D2ympKftOhTIbGZl/cTaJ4KYZeyQaAAY+m7zNu6N97wWgTHag60gKM7gzKmS
         a0nsbdtc1FmxQs6mn1hU32T5cMUekkiPSlEdsBJ9P26fF5YO8QLZo9lwRQ5Lu0IHf50q
         eJn2WJUbhF4+f3gxLq7HWfSfgztKBZ5lrCtykdnY8G2kJnqPvAwNYY/6MYgbADWtEgVZ
         o/sy0bze0KI0fNfWPq2YxVWm9eD0aLH/iIXTnzsbmlo/LkZ7X1AHSi+Qydh7mtoAneHg
         Rq70Os+GnSDjA9d6M+NPM2kSHH0Jg/IgPRjWxswAGcFz02sW99uLxZSQGsvKv5cdZC59
         xIDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=UAoUZFl+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6-20020ac85bc6000000b003dc38b8676csi6601023qtb.119.2023.03.22.10.57.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Mar 2023 10:57:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=UAoUZFl+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pf2hP-00006H-7j; Wed, 22 Mar 2023 13:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3T0EbZAYKCGYXMXYWVKSSKPI.GSQUIQY-EVQRSRKRY.SVK@flex--titusr.bounces.google.com>)
 id 1pf2hO-000065-FU
 for qemu-arm@nongnu.org; Wed, 22 Mar 2023 13:56:34 -0400
Received: from mail-vs1-xe4a.google.com ([2607:f8b0:4864:20::e4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3T0EbZAYKCGYXMXYWVKSSKPI.GSQUIQY-EVQRSRKRY.SVK@flex--titusr.bounces.google.com>)
 id 1pf2hN-0002FM-1T
 for qemu-arm@nongnu.org; Wed, 22 Mar 2023 13:56:34 -0400
Received: by mail-vs1-xe4a.google.com with SMTP id
 e12-20020a67e18c000000b00425e6c65700so4681907vsl.18
 for <qemu-arm@nongnu.org>; Wed, 22 Mar 2023 10:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679507791;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=bBc8nJSLiVzdxFPEpKJGMX3a4bJpKjM1r87UkXJvpN4=;
 b=UAoUZFl+wa+3030Wj02P1ENAAPVjfZhajJAtQSqAqTFFXSw598hFJGoF6a1UdgX1Tg
 9j6jmgBvlZzz00r8PAsezf9sENnwZe2qw8mpQWeonBaCcn5ezMocH7U/bvrqKDy6vsk5
 3WRe3olLdllf+l23Ilb9Pr1NXWBcJJNjVqpUWsmdITpJFUb0mvTRbErP8bEUa+aw/76S
 /RhXgZKfXwhNddlT5KLAMDcHN08nnBNE7xUcpMF/ACWvznfseKX37iB7m3N50eNWrFgH
 NnIiATihI1dV1yru2w5ArhiwwZJVsI3ieEDg1TULimPCe+yqBVjLLb6orthfzYlmVwrB
 mutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679507791;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bBc8nJSLiVzdxFPEpKJGMX3a4bJpKjM1r87UkXJvpN4=;
 b=dzs2ZsuidmDoUSOI0aSfNxsEjt8VP128pE5OWxQ7OJB7v9fTs8Y76z/95m+D6LTT7K
 jCVoDwRi5klVO/hCoy7h/hKDE5LkEr6XUa6QGb/eaDAISjw1EhTpntZWLjawU42+t4lC
 X2hGslIga4a8mtfBEUj/y31WVZkOfGEn4SfkKQpUoTztyhmpxs5Z7aHRno6RCPS5A68u
 fF1QbZaigsA42AXPKQ52dDF+LTEKvoAMoprKUCye6rdViUKPDB89vlLj+IOA+p5PTkp+
 m32u0kctnw3yIAWWDy67cLpTrPWFDC3gbcK6BHDLxf89UYtZSnDa3cyHCQ1oFqhJSQdY
 QzrQ==
X-Gm-Message-State: AAQBX9ddj1NP6NSs2tiIRnLpznU3+rxQYZ1vEpqZHV9LN/ZqlElJFRCf
 hJSaFEeVlKpxUxHF5vINBBvjCUJ6pcw=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a05:6130:290:b0:688:d612:2024 with SMTP id
 q16-20020a056130029000b00688d6122024mr3685662uac.2.1679507791244; Wed, 22 Mar
 2023 10:56:31 -0700 (PDT)
Date: Wed, 22 Mar 2023 17:55:08 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230322175513.1550412-1-titusr@google.com>
Subject: [PATCH 0/5] PMBus fixes and new functions
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e4a;
 envelope-from=3T0EbZAYKCGYXMXYWVKSSKPI.GSQUIQY-EVQRSRKRY.SVK@flex--titusr.bounces.google.com;
 helo=mail-vs1-xe4a.google.com
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
X-TUID: SrvH+/ddXqru

This patch series contains fixes and improvements to PMBus support in QEMU.

The following has been added:
   - Support for block receive
   - Support for devices with fans
   - Support for the VCAP register for devices with onboard energy storage
   - A bitfield struct for the vout mode register, whose bits determine the formatting of several read commands in PMBus
Fixes:
   - String read now handles now logs an error when passed an empty string

This series is in preparation for some additional sensors that exercise
this functionality that will be incoming shortly.

Thanks

Titus Rwantare (5):
  hw/i2c: pmbus add support for block receive
  hw/i2c: pmbus: add vout mode bitfields
  hw/i2c: pmbus: add fan support
  hw/i2c: pmbus: block uninitialised string reads
  hw/i2c: pmbus: add VCAP register

 hw/i2c/pmbus_device.c         | 221 +++++++++++++++++++++++++++++++++-
 include/hw/i2c/pmbus_device.h |  17 +++
 2 files changed, 237 insertions(+), 1 deletion(-)

-- 
2.40.0.rc1.284.g88254d51c5-goog

